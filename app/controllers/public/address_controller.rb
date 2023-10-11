class Public::AddressController < ApplicationController
  def index
    @addresses = Address.all
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to address_index_path
    else

    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to address_index_path
    else

    end
  end

  def destroy
    @address = Address.find(params[:id])  # データ（レコード）を1件取得
    @address.destroy  # データ（レコード）を削除
    redirect_to address_index_path
  end

  private

  def address_params
    params.require(:address).permit(:name, :post_code, :address)
  end
end
