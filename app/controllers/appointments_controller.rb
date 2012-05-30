class AppointmentsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource :project
  load_and_authorize_resource :appointment, :through => :project
  respond_to :html, :js

  def index
    respond_with @appointments
  end

  def show
    respond_with @appointment
  end

  def new
    respond_with @appointment
  end

  def edit
    respond_with @appointment
  end

  def create
    respond_to do |format|
      if @appointment.save
        format.html { redirect_to project_appointments_path(@project), notice: 'Appointment was successfully created.' }
        format.js
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    respond_to do |format|
      if @appointment.update_attributes(params[:appointment])
        format.html { redirect_to project_appointments_path(@project), notice: 'Appointment was successfully updated.' }
        format.js
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @appointment_id = @appointment.id
    @appointment.destroy

    respond_to do |format|
      format.html { redirect_to project_appointments_path(@project) }
      format.js
    end
  end
end
