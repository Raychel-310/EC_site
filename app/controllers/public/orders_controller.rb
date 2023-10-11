class Public::OrdersController < ApplicationController
  def new
    if current_customer.cart_items.empty?
      redirect_to cart_items_path
    end
  end

  def show
    #if @cart_items.present?
    #   redirect_to cart_items_path
    # else
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    @sum = 0
    # @order.payment_method = 0
      if params[:order][:address_option] == "0"
        @order.shipping_postal_code = current_customer.post_code
        @order.shipping_address = current_customer.address
        @order.shipping_name = current_customer.lastname_kanji + current_customer.firstname_kanji

      elsif params[:order][:address_option] == "1"
      #@orderは最初に定義済
      #セレクトボックスのid情報をもとにaddress情報を探す
        @address = Address.find(params[:order][:address])
      #探したaddressの代入
        @order.shipping_postal_code = @address.post_code
        @order.shipping_address = @address.address
        @order.shipping_name = @address.name
      end
    # end
  end

  def create
    # @order = Order.new(order_params)
    # @order.customer_id = @customer.id
    # @customer = current_customer
    # @order.payment_amount = params[:order][:payment_amount]
    # @cart_items = current_customer.cart_items
    
    # @customer = current_customer # @customer を current_customer メソッドから取得
    # @order = Order.new(order_params)
    # @order.customer_id = @customer.id
    # @order.payment_amount = params[:order][:payment_amount]
    # @cart_items = @customer.cart_items # @customer を使ってカートアイテムを取得
    # if @cart_items.present?
    #   @order.save
    # else
    # redirect_to cart_item_path
    
    @customer = current_customer
    @cart_items = @customer.cart_items

      @order = Order.new(order_params)
      @order.customer_id = @customer.id
      @order.payment_amount = params[:order][:payment_amount]
      @order.save

    # 以下のコードでカートの中身を注文詳細にコピーするなどの処理を追加できます
    

    #@order.payment_amount = @sum + @postage

      @customer.cart_items.each do |cart_item|
        @order.order_details.create(
          order_id: @order.id,
          item_id: cart_item.item.id,
          purchase_price: cart_item.item.tax_included_price,
          quantity: cart_item.amount
        )
      end

    @cart_items.destroy_all #カートの中身を削除
    redirect_to orders_done_path
    
  end

  def done
  end

  def order_params
    params.require(:order).permit(:payment_method, :shipping_address, :shipping_postal_code, :shipping_name)
  end

  # def address_params
  #   params.require(:order).permit(:shipping_postal_code, :shipping_address, :shipping_name)
  # end
end