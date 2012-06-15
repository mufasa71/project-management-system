class Subject < ActiveRecord::Base
  has_and_belongs_to_many :intakes
  has_many :users, :through => :intakes

  validates_presence_of :title

  def to_s
    title
  end
end
# == Schema Information
#
# Table name: subjects
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

