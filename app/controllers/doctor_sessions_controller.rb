class DoctorSessionsController < Devise::SessionsController
  before_filter :authenticate_doctor!, :except => [:create, :destroy]
  respond_to :json

  def create
    self.resource = warden.authenticate!(auth_options)
    sign_in(resource_name, resource)
    unless self.resource
      invalid_login_attempt
    else
      respond_to do |format|
        format.json  {render json: {:success=>true, :authentication_token=>resource.authentication_token, :email=>resource.email}}
        format.html  {redirect_to root_path}
      end
    end
  end

=begin
  def destroy
    resource = Doctor.find_for_database_authentication(:email => params[:email])
    resource.authentication_token = nil
    resource.save
    render :json=> {:success=>true}
  end
=end

  protected

  def invalid_login_attempt
    render :json=> {:success=>false, :message=>"Error with your login or password"}, :status=>401
  end
end
