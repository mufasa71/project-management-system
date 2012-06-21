class Member < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  belongs_to :group
  has_many :activities
  validates_presence_of :project, :user
  validates_uniqueness_of :user_id, :scope => :project_id

  def to_s
    user.name
  end

  def workload_for(phase)
    n = 0
    if activities.size > 0
      activities.each do |activity|
        if activity.phase.eql?(phase)
          n += 1
        end
      end
    end
    unless n == 0 && phase.activities.empty?
      ((n.to_f / phase.activities.size.to_f) * 100).to_i.to_s << " %"
    else
      "0 %"
       
    end
  end

  before_destroy :check_activities
  
  def check_activities
    errors.add :base, "Member with activities can not be deleted, first modify activities" if self.activities.any?
    errors.empty?
  end
end
# == Schema Information
#
# Table name: members
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  project_id :integer
#

