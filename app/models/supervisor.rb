class Supervisor < ActiveRecord::Base
  belongs_to :user
  has_one :project
  
  def to_s
    user.name
  end

  after_save :toggle_admin
  before_destroy :toggle_admin

  def toggle_admin 
    self.user.toggle :admin
    self.user.save
  end

  before_destroy :check_project

  def check_project
    errors.add :base, "Supervisor can not be deleted until he/she involved in project, modify project first" if self.project.present? 
    errors.empty?
  end
end
