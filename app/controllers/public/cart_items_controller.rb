class Public::CartItemsController < ApplicationController
  def index
    @cart_item = CartItem.new
    @cart_items = current_customer.cart_items.all
    #@cart_items = current_customer.cart_items.group(:item_id).sum(:amount)
    @sum = 0
    #@item = Item.find(params[:id])
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update!(cart_item_params)
      redirect_to cart_items_path
    else
      flash[:alert] = "カートアイテムの保存に失敗しました。"
    end
  end

  def create
    #@customer = current_customer
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.item_id = params[:item_id]
    # #byebug
    # if @cart_item.save
    # redirect_to cart_items_path, notice: "アイテムがカートに追加されました。"
    # else
    # flash[:alert] = "カートアイテムの保存に失敗しました。"
    # puts @cart_item.errors.full_messages
    #         #render :show
    @cart_item = current_customer.cart_items.find_by(item_id: cart_item_params[:item_id])

    if @cart_item
      new_amount = @cart_item.amount + cart_item_params[:amount].to_i
      @cart_item.update(amount: new_amount)
    else
      @cart_item = current_customer.cart_items.build(cart_item_params)
    end

    if @cart_item.save
      redirect_to cart_items_path
    end
  end
  
  def increase
    @cart_item.increment!(:amount, 1)
  end
  
  def decrease
    decrease_or_destroy(@cart_item)
  end
  
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end
  
  def destroy_all
    @cart_item = current_customer.cart_items
    @cart_item.destroy_all
    redirect_to cart_items_path
  end
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount, :customer_id)
  end
  
  def increase_or_create(item_id)
    cart_item = current_customer.cart_items.find_by(item_id: item_id)
    if cart_item
      cart_item.increment!(:amount, 1)
    else
      current_customer.cart_items.build(item_id: item_id).save
    end
  end

  def decrease_or_destroy(cart_item)
    if cart_itamount> 1
      cart_item.decrement!(:amount, 1)
    else
      cart_item.destroy
    end
  end
end
