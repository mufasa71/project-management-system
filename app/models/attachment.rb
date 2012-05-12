class Attachment < ActiveRecord::Base
  belongs_to :attachable, :polymorphic => true
  belongs_to :author, :class_name => "User", :foreign_key => "author_id"

  mount_uploader :file, FileUploader
end
# == Schema Information
#
# Table name: attachments
#
#  id              :integer         not null, primary key
#  description     :string(255)
#  file            :string(255)
#  attachable_id   :integer
#  author_id       :integer
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  attachable_type :string(255)
#

