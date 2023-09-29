class Public::ItemsController < ApplicationController
  def index
    @item = Item.new
    @items = Item.all
  end

  def show
  end
end
