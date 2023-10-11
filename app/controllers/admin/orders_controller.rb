class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @payment_amount = 0
    @order_details.each do |order_detail|
      @payment_amount += @order_details.sum {|order_detail| order_detail.purchase_price * order_detail.quantity }
    end
  end
  
  def update
    # @order = Order.find(params[:id])
    # @order_details = @order.order_details
    # @order.update(order_params)

    # # if @order.status == "confirm_payment"
    # if params[:order][:status] == "1"
    #   @order_details.update_all(production_status: "1")
    # end
    # redirect_to admin_order_path(@order)
    
    @order = Order.find(params[:id])
    if @order.update(order_params)
      if params[:order][:status] == "confirm_payment"
        @order_details = @order.order_details
        @order.order_details.update_all(production_status: 1)
      end
    end
    redirect_to admin_order_path(@order)
  end
  
  private
  def order_params
    params.require(:order).permit(:status)
  end
end
