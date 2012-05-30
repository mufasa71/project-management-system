class Appointment < ActiveRecord::Base
  belongs_to :project
  has_many :appointmenizations
  has_many :members, :through => :appointmenizations, :dependent => :destroy
  has_one :event, :as => :eventable, :dependent => :destroy
  before_update :add_end_at
  before_save :add_end_at

  validates_presence_of :location, :project
  accepts_nested_attributes_for :event

  def members_names
    members.join(", ")
  end
  private
  def add_end_at
    unless event.end_at
      event.end_at = event.start_at
    end
  end
end
# == Schema Information
#
# Table name: appointments
#
#  id         :integer         not null, primary key
#  location   :string(255)
#  project_id :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

