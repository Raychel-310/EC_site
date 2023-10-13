class ApplicationController < ActionController::Base

  before_action :search

  def search
    @q = Item.ransack(params[:q])
    if params[:q].present?
      @results = @q.result
    else
      @results = []
    end
  end
  
  def after_sign_in_path_for(resource)
    customers_mypage_path
  end
  
  def after_sign_out_path_for(resource)
      root_path
  end
  
end
