class DoctorsController < ApplicationController
  def index
    @doctors = Doctor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @doctors }
    end
  end

  def show
    @doctor = Doctor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @doctor }
    end
  end


  def destroy
    @doctor = Doctor.find(params[:id])
    @doctor.destroy

    respond_to do |format|
      format.html { redirect_to doctors_url }
      format.json { head :no_content }
    end
  end
end
