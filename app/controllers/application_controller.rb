class ApplicationController < ActionController::Base
  protect_from_forgery
  include AdminHelper


  skip_before_filter :verify_authenticity_token

end
