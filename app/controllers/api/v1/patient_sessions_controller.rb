class Api::V1::PatientSessionsController < ApplicationController
  before_filter :authenticate_patient!, :except => [:create, :destroy]
  respond_to :json

  def create
    self.resource = warden.authenticate!(auth_options)
    sign_in(resource_name, resource)
    unless self.resource
      invalid_login_attempt
    else
      render :json=> {:success=>true, :auth_token=>resource.authentication_token, :email=>resource.email}
    end
  end

  def destroy
    resource = Patient.find_for_database_authentication(:email => params[:email])
    resource.authentication_token = nil
    resource.save
    render :json=> {:success=>true}
  end

  protected

  def invalid_login_attempt
    render :json=> {:success=>false, :message=>"Error with your login or password"}, :status=>401
  end
end