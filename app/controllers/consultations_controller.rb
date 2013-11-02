class ConsultationsController < ApplicationController

  before_filter :signed_in_user
  before_filter :authenticate_admin_user!, only: [:create,:destroy]
  before_filter :load_resource

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

  def index
    @consultations = @current_user.consultations
    render json: @consultations
  end

  def show
    @consultation = @current_user.consultations.find params[:id]
    render json: @consultation
  end

  private

  def load_resource
    @current_user  = current_doctor || current_patient
  end



end
