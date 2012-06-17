class Phase < ActiveRecord::Base
  belongs_to :project
  has_many :activities
  has_many :milestones, :dependent => :destroy
  has_one :event, :as => :eventable, :dependent => :destroy
  accepts_nested_attributes_for :event
  validates_presence_of :title, :project

  def activities_done
    activities.where(:done => true)
  end

  def complete
    if activities_done.size > 0 && activities.size > 0
      ((activities_done.size.to_f / activities.size.to_f) * 100).to_i
    else
      0
    end
  end
end
# == Schema Information
#
# Table name: phases
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  project_id :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  complete   :boolean         default(FALSE)
#

