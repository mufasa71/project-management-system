class Supervisor < ActiveRecord::Base
  belongs_to :user
  
  def to_s
    user.name
  end
end
