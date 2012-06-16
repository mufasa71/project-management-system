class Phase < ActiveRecord::Base
  belongs_to :project
  has_many :activities
  has_one :event, :as => :eventable, :dependent => :destroy
  accepts_nested_attributes_for :event
  validates_presence_of :title, :project
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
#

