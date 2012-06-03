class Document < ActiveRecord::Base
  belongs_to :project
  belongs_to :group

  validates_presence_of :title, :project

  before_save :create_pad

  def create_pad
    self.pad_id = SecureRandom.hex(2)
  end
end
