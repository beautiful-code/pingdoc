class ApplicationController < ActionController::Base
  protect_from_forgery
  include AdminHelper


  skip_before_filter :verify_authenticity_token

  def after_sign_in_path_for(resource) 
    debugger
    nil if false
    # merchant_businesses_path(merchant)
  end

end
