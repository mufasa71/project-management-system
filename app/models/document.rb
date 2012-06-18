class Document < ActiveRecord::Base
  belongs_to :group
  belongs_to :project
  belongs_to :documentable, :polymorphic => true
  before_save :create_pad

  validates_presence_of :project
  def create_pad
    self.pad_id = SecureRandom.hex(2)
  end
end
# == Schema Information
#
# Table name: documents
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  pad_id     :integer
#  project_id :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  group_id   :integer
#

