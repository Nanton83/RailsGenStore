require 'pry'
class SessionsController < ApplicationController

    def new
        
    end
    
    def create
        
        if auth_hash = request.env["omniauth.auth"]
            user = User.find_or_create_by_omniauth(auth_hash)
            session[:user_id] = user.id
            binding.pry

            redirect_to root_path
        
        elsif
            
            user = User.find_by(user_name: params[:user_name])
            user && user.authenticate(params[:password])
            session[:user_id] = user.id
            
            redirect_to user_path(user)
        else
            
            render 'sessions/new'
        
        
    end
end
    
    def destroy
        session[:user_id] = nil
        redirect_to root_path
    end

end
