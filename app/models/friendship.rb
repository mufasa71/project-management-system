class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => "User"

  validates_presence_of :user_id, :friend_id, :status

  ACCEPTED = 1
  REQUESTED = 2
  PENDING = 3
end
