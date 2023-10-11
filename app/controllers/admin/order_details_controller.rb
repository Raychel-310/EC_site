class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id]) #特定する
    #@order = @order_detail.order #注文商品から注文テーブルを呼び出す
    @order = Order.find(@order_detail.order_id)
    if @order_detail.update(order_detail_params) #製作ステータスupdate
      #if @order_detail.production_status == "2" #製作中なら
      if params[:order_detail][:production_status] == "manufacturing"
        @order.update(status: 2) #注文ステータスをupdate
      #else商品の個数の特定,製作完了を数える
      #注文数と等しければすべて完了
      elsif @order.order_details.count ==  @order.order_details.where(production_status: "finish").count
        @order_detail.order.update(status: 3) #注文ステータスupdate
      end
    end
    redirect_to admin_order_path(@order)
  end

  private
  
  def order_detail_params
    params.require(:order_detail).permit(:production_status)
  end
end
