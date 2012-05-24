class Group < ActiveRecord::Base
  belongs_to :project
  has_many :members, :dependent => :delete_all

  validates_presence_of :title
end
