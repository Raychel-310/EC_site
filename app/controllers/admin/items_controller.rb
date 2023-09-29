class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
    @item = Item.new
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params) #データを新規登録するためのインスタンス生成
      if @item.save
      redirect_to admin_item_path(@item)
      else
      render "show"
      end
  end

  def show
    @item = Item.find(params[:id])
    @items = Item.all
  end

  def edit
  end

  def update
  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :explanation, :tax_excluded_price, :is_sale, :image)
  end
end
