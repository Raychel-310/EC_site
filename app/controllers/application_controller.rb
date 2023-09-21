class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    customers_path
  end

  def after_sign_out_path_for(customer)
    root_path
  end

end
