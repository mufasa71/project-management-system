class Admin::SubjectsController < Admin::BaseController
  def index
    @subjects = Subject.all
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(params[:subject])

    if @subject.save
      redirect_to admin_subjects_path, :notice => "Subject was successfully created."
    else
      render 'new'
    end
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    @subject = Subject.find(params[:id])

    if @subject.update_attributes(params[:subject])
      redirect_to admin_subjects_path, :notice => "Subject was successfully updated."
    else
      render 'edit'
    end
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.delete

    redirect_to admin_subjects_path, :notice => "Subject was successfully deleted."
  end
end
