class DistributorsController < ApplicationController

    def new
        @distributor = Distributor.new
    end

    def create
        @distributor = Distributor.new(distributor_params)
        if @distributor.save
            session[:distributor_id] = @distributor.id
            redirect_to distributor_path(@distributor)
        else
            render 'new'
        end
    end

    def show

        @distributor = Distributor.find_by(id: params[:id])
        
        if current_user != @distributor
            redirect_to root_path
        end
        
    end
  
    private
    
    def distributor_params
        params.require(:distributor).permit(:user_name, :email, :password)
    end
end
