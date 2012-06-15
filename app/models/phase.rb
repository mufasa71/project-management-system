class Phase < ActiveRecord::Base
  belongs_to :project
  has_many :activities
  has_and_belongs_to_many :members
  has_one :event, :as => :eventable, :dependent => :destroy
  accepts_nested_attributes_for :event
  validates_presence_of :title, :project
end
