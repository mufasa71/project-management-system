class Admin::SupervisorsController < Admin::BaseController
  def index
    @supervisors = Supervisor.all
  end

  def new
    @supervisor = Supervisor.new
  end

  def create
    @supervisor = Supervisor.new(params[:supervisor])
    if @supervisor.save
      redirect_to admin_supervisors_path, :notice => "Supervisor was successfully created."
    else
      render 'new'
    end
  end

  def destroy
    @supervisor = Supervisor.find(params[:id])
    if @supervisor.destroy
      flash[:notice] = "Supervisor was successfully deleted."
    else
      flash[:alert] = @supervisor.errors[:base][0].to_s
    end
    redirect_to admin_supervisors_path, :notice => "Supervisor was successfully deleted."
  end
end
