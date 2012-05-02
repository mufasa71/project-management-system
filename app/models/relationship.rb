class Relationship < ActiveRecord::Base
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  attr_accessible :followed_id
  validates_presence_of :follower_id, :followed_id
end
