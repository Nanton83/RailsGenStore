class ItemsController < ApplicationController

    def index
        if logged_in?
            if params[:store_id]
                @items = Store.find(params[:store_id]).items
            else
                @items = Item.all
            end
        else
            redirect_to root_path
        end
    end

    def show
        if logged_in?
            @store = Store.find_by(id: params[:store_id])
            @item = Item.find_by(id: params[:id])
        else
            redirect_to root_path
        end
    end

    def new
        if logged_in?
            @item = Item.new
        else
            redirect_to root_path
        end
    end

    def create
        if logged_in?
            @item = Item.new(item_params)
            @item.distributor_id = current_user.id
            if @item.save
                flash[:notice] = "Successfully Created An Item"
                redirect_to item_path(@item)
            else
                redirect_to new_item_path
            end 
        else
            redirect_to root_path
        end
    end

    def edit
        if logged_in?
            @store = Store.find_by(id: params[:store_id])
            @item = @store.items.find_by(id: params[:id])
            else
            flash[:notice] = "You Don't Seem To Be Logged in"
            redirect_to root_path
        end
    end

    def update
        if logged_in?
            @item = Item.find_by(id: params[:id])
            @item.update(item_params)
            redirect_to item_path(@item)
        else
            redirect_to root_path
        end
    end

    def ordered
        @ordered_items = Item.order(:price)
    end
    
    private

    def item_params
        params.require(:item).permit(:distributor_id, :name, :brand_name, :sku, :price, :store_id)
    end
end
