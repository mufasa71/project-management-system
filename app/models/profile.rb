class Profile < ActiveRecord::Base
  belongs_to :user
  attr_protected :user_id
end
