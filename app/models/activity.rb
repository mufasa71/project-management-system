class Activity < ActiveRecord::Base
  belongs_to :phase

  validates_presence_of :title, :phase
  has_one :event, :as => :eventable, :dependent => :destroy
  accepts_nested_attributes_for :event
  has_many :issues, :dependent => :destroy
  has_many :issue_categories, :dependent => :destroy, :order => "#{IssueCategory.table_name}.name"
end
