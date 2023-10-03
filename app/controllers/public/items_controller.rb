class Public::ItemsController < ApplicationController
  def index
    @item = Item.new
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
  
  def create
        @cart_item = CartItem.new(cart_item_params)
    #     @cart_item.customer_id = current_customer.id
    #     @cart_item.item_id = params[:item_id]
    #     # byebug

    if @cart_item.save
    　redirect_to cart_items_path, notice: "アイテムがカートに追加されました。"
    else
      # notice: "追加されていません"
    #         #render :show
    end
  end
end
