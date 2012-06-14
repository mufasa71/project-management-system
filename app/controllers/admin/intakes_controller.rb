class Admin::IntakesController < Admin::BaseController
  respond_to :js, :html, :json
  def index
    @intakes = Intake.all
    respond_with @intakes
  end

  def new
    @intake = Intake.new
  end

  def create
    @intake = Intake.new(params[:intake])

    if @intake.save
      flash[:notice] = "Intake was successfully created."
      respond_with @intake, :location => admin_intakes_path
    else
      render 'new'
    end
  end

  def edit
    @intake = Intake.find(params[:id])
    respond_with @intake
  end

  def update
    @intake = Intake.find(params[:id])
    if @intake.update_attributes(params[:intake])
      flash[:notice] = "Intake was successfully updated."
      respond_with @intake, :location => admin_intakes_path
    else
      render 'edit'
    end
  end

  def destroy
    @intake = Intake.find(params[:id])
    @intake.delete
    redirect_to admin_intakes_path, :notice => "Intake was successfully deleted."
  end

  def show
    @intake = Intake.find(params[:id])
    respond_with @intake
  end
end
