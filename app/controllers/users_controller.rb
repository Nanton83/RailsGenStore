class UsersController < ApplicationController

    def new
        @user = User.new
    end 

    def create
        @user = User.new(user_params)
        
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render 'new'
        end
    end

    def show
        @distributer = Distributor.find_by(id: params[:id])
    
            if current_user != @distributor
                redirect_to root_path
            end
        
    end
  
    private
    
    def user_params
        params.require(:user).permit(:email, :user_name, :password, :cubits, :distributer)
    end

end
