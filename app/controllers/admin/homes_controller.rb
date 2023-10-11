class Admin::HomesController < ApplicationController
  def top
    @order = Order.all
    @order = Order.includes(:order_details).all
  end
end
