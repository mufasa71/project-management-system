class Subject < ActiveRecord::Base
  has_and_belongs_to_many :intakes

  validates_presence_of :title
end
