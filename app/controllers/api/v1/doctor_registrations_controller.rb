class Api::V1::DoctorRegistrationsController < Devise::RegistrationsController
  respond_to :json
end
