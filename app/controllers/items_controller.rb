class ItemsController < ApplicationController

    def index
        @items = Item.all
    end

    def new
        @item = Item.new
    end

    def create
        @item = Item.new(item_params)
        # binding.pry
        # if @item.save
            redirect_to items_path(@item)
        # else
        #     redirect_to new_item_path
        # end 
    end
    
    private

    def item_params
        params.require(:item).permit(:name, :brand_name, :sku, :price)
    end
end
