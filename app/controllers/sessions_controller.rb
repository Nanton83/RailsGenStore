require 'pry'
class SessionsController < ApplicationController

    def new
    end
    
    def create
        
        if auth_hash = request.env["omniauth.auth"]
            distributor = Distributor.find_or_create_by_omniauth(auth_hash)
            session[:distributor_id] = distributor.id
            redirect_to distributor_path(distributor)
        
        elsif
            
            distributor = Distributor.find_by(user_name: params[:user_name])
            if distributor && distributor.authenticate(params[:password])
            session[:distributor_id] = distributor.id
            redirect_to distributor_path(distributor)
            end
        else   
        flash[:notice] = "Please Complete Form"   
        redirect_to login_path
    end
end
    
    def destroy
        session[:distributor_id] = nil
        redirect_to root_path
    end
end
