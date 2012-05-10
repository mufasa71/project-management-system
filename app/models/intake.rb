class Intake < ActiveRecord::Base
  has_many :users

  def to_s
    number
  end
end
# == Schema Information
#
# Table name: intakes
#
#  id         :integer         not null, primary key
#  number     :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

