class Public::CustomersController < ApplicationController
protect_from_forgery

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
  
  def check
    @customer = current_customer
  end
  
  def leave
    # @customer = Customer.find(params[:id])
    @customer = current_customer
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:lastname_kanji, :firstname_kanji, :lastname_kana, :firstname_kana, :email, :password, :password_confirmation, :post_code, :address, :phone_number)
  end
  
end
