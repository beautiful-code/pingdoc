class AdminController < ApplicationController

  before_filter :signed_in_user
  before_filter :authenticate_admin_user!
  def index

  end




end
