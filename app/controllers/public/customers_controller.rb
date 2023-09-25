class Public::CustomersController < ApplicationController
  
  def show
    @customer = current_customer
  end
  
  def edit
    @customer = current_customer
  end
  
  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customers_mypage_path
    else
      render :edit
    end
  end
  
  def destroy
    super
  end
  
  def quit
    @customer = current_customer
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:lastname_kanji, :firstname_kanji, :lastname_kana, :firstname_kana, :email, :password, :password_confirmation, :post_code, :address, :phone_number)
  end
  
end
