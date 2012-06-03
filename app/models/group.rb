class Group < ActiveRecord::Base
  belongs_to :project
  has_many :members, :dependent => :delete_all

  validates_presence_of :title

  def to_s
    title
  end
end
# == Schema Information
#
# Table name: groups
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  project_id :integer
#

