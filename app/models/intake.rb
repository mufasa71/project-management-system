class Intake < ActiveRecord::Base
  has_many :users

  def to_s
    number
  end
end
