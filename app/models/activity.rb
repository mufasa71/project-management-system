class Activity < ActiveRecord::Base
  belongs_to :phase

  validates_presence_of :title, :phase
  has_one :event, :as => :eventable, :dependent => :destroy
  accepts_nested_attributes_for :event
  has_many :tasks, :dependent => :destroy
end
# == Schema Information
#
# Table name: activities
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  phase_id    :integer
#  description :text
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

