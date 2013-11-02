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



end
