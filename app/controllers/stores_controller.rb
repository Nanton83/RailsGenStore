class StoresController < ApplicationController
    before_action :authenticate_user

    def index
        @stores = Store.all
    end

    def new
        @store = Store.new
    end

    def show
        @store = Store.find_by(id: params[:id])
    end

    def create
        @store = Store.new(store_params)
        if @store.save
            flash[:notice] = "Successfully Created A Store!"
            redirect_to stores_path(@store)
        else
            flash[:notice] = "Please Complete Form"
            redirect_to new_store_path
        end
    end
    
    private

    def store_params
        params.require(:store).permit(:name, :location)
    end
end
