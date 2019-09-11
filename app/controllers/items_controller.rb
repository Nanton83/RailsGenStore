class ItemsController < ApplicationController

    def index
        @items = Item.all
    end

    def new
        @item = Item.new
    end

    def create
        @item = Item.new(item_params)
        @item.user_id = current_user.id
        # binding.pry
        if @item.save
            redirect_to items_path(@item)
        # else
        #     redirect_to new_item_path
        end 
    end
    
    private

    def item_params
        params.require(:item).permit(:user_id, :name, :brand_name, :sku, :price)
    end
end
