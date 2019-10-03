class ItemsController < ApplicationController
before_action :authenticate_user

    def index
        if params[:store_id]
            @items = Store.find(params[:store_id]).items
        else
            @items = Item.all
        end
    end

    def show
        @store = Store.find_by(id: params[:store_id])
        @item = Item.find_by(id: params[:id])
    end

    def new
        if params[:store_id]
            @store = Store.find_by(id: params[:store_id])
            if @store
                @item = Item.new(store_id: params[:store_id])
            else
            redirect_to stores_path
            end
        elsif
            @item = Item.new
        end
    end

    def create
        @item = Item.new(item_params)
        @item.distributor_id = current_user.id
        if @item.save
            flash[:notice] = "Successfully Created An Item"
            redirect_to item_path(@item)
        else
            render :new
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

    def ordered
        @ordered_items = Item.order(:price)
    end
    
    private

    def item_params
        params.require(:item).permit(:distributor_id, :name, :brand_name, :sku, :price, :store_id)
    end
end
