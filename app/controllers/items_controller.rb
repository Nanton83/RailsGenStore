class ItemsController < ApplicationController

    def index
        if params[:store_id]
            @items = Store.find(params[:store_id]).items
        else
            @items = Item.all
            # need to update
        end
    end

    def show
        @store = Store.find_by(id: params[:store_id])
        @item = Item.find_by(id: params[:id])
    end

    def new
        @item = Item.new
    end

    def create
        @item = Item.new(item_params)
        @item.distributor_id = current_user.id

        
        if @item.save
            redirect_to items_path (@item)
        else
            redirect_to new_item_path
        end 
    end

    def edit
        @store = Store.find_by(id: params[:store_id])
        @item = @store.items.find_by(id: params[:id])
    end

    def update
        @item = Item.find_by(id: params[:id])
        @item.update(item_params)
        redirect_to item_path(@item)
    end
    
    private

    def item_params
        params.require(:item).permit(:distributor_id, :name, :brand_name, :sku, :price, :store_id)
    end
end
