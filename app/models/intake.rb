class Intake < ActiveRecord::Base
  has_many :users
  has_and_belongs_to_many :subjects

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

