class News < ActiveRecord::Base
  belongs_to :project

  belongs_to :author, :class_name => "User", :foreign_key => "author_id"

  validates_presence_of :title, :description, :author

  mount_uploader :attachment, FileUploader
end
