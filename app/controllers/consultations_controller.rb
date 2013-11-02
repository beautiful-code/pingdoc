class ConsultationsController < ApplicationController

  before_filter :signed_in_user
  before_filter :authenticate_admin_user!

  def create
    #raise params.inspect
    @patient = Patient.find(params[:consultation][:patient_id])
    @consultation = @patient.consultations.build(params[:consultation])
    if @consultation.save
       redirect_to consultation_path(@consultation), notice: 'Consultation has been created'
    else
      render text: 'Error creating mapping'
    end
  end

  def new

  end



  def show
    @consultation = Consultation.find params[:id]
  end

  protected

  def authenticate_admin_user!
    redirect_to root_path, notice: 'Please log in as an admin' unless is_admin?
  end

  def signed_in_user
    redirect_to root_path,notice: 'You have to be signed in to continue' unless current_doctor
  end

  def is_admin?
    current_doctor.email=='lnr@gmail.com'
  end




end
