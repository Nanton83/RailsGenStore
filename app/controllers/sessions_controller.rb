require 'pry'
class SessionsController < ApplicationController

    def sign_in
        @user = User.new
        @users = User.all
    end
    
    def create
    #     if auth_hash = request.env["omniauth.auth"]
    #         binding.pry
    #        oauth_email = request.env["omniauth.auth"]["info"]["email"]
           

    #     if @user = User.find_by(:email => oauth_email)
    #         binding.pry
    #         session[:user_id] = @user.id
        

    #     else
    #         @user = User.create(:email => oauth_email)
    #         binding.pry
    #         redirect_to root_path
        
    #     if
    #         @user = User.find_by(user_name: params[:user][:user_name])
    #         binding.pry
    #         @user && @user.authenticate(params[:user][:password])
    #         session[:user_id] = @user.id
    #         binding.pry
    #         redirect_to user_path(@user) 
    #     else
    #         binding.pry
    #         redirect_to root_path
        
    #         end
    #     end 
    # end
end
    
    def destroy
        session[:user_id] = nil
        redirect_to root_path
    end

end
