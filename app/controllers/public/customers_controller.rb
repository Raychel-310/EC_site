class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
  end
  
  def destroy
    super
  end

end
