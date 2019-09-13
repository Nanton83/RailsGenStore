class StoresController < ApplicationController
    
    def index
        @stores = Store.all
    end

    def new
        @store = Store.new
    end

    def create
        @store = Store.new(store_params)
        # @store.user_id = current_user.id
        # binding.pry
        if @store.save
            redirect_to stores_path(@store)
        else
            redirect_to new_store_path
        end 
    end
    
    private

    def store_params
        params.require(:store).permit(:name, :location)
    end
end
