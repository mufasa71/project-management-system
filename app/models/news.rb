class News < ActiveRecord::Base
  tracked
  acts_as_commentable

  belongs_to :project

  belongs_to :author, :class_name => "User", :foreign_key => "author_id"

  validates_presence_of :title, :description, :author

  mount_uploader :attachment, FileUploader
end
# == Schema Information
#
# Table name: news
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  summary     :text
#  description :text
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  project_id  :integer
#  author_id   :integer
#  attachment  :string(255)
#

