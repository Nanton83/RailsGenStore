class StoresController < ApplicationController
    
    def index
        if logged_in?
            @stores = Store.all
        else
            redirect_to root_path
        end
    end

    def new
        if logged_in?
            @store = Store.new
        else
            redirect_to root_path
        end
    end

    def show
        if logged_in?
            @store = Store.find_by(id: params[:id])
        else
            redirect_to root_path
        end
    end

    def create
        if logged_in?
            @store = Store.new(store_params)
            if @store.save
                flash[:notice] = "Successfully Created A Store!"
                redirect_to stores_path(@store)
            else
                flash[:notice] = "Please Complete Form"
                redirect_to new_store_path
            end
        else
            redirect_to root_path
        end 
    end
    
    private

    def store_params
        params.require(:store).permit(:name, :location)
    end
end
