require 'pry'
class SessionsController < ApplicationController

    def new
        
    end
    
    def create
        
        # if auth_hash = request.env["omniauth.auth"]
            
        #    oauth_email = request.env["omniauth.auth"]["info"]["email"]
           

        # if @user = User.find_by(:email => oauth_email)
            
        #     session[:user_id] = @user.id
        

        # else
        #     @user = User.create(:email => oauth_email)
            
        #     redirect_to root_path
        
         if
            @user = User.find_by(user_name: params[:user_name])
            
            @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            
            redirect_to user_path(@user) 
        else
            
            redirect_to root_path
        
        #     end
        # end 
    end
end
    
    def destroy
        session[:user_id] = nil
        redirect_to root_path
    end

end
