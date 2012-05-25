class Attachment < ActiveRecord::Base
  belongs_to :attachable, :polymorphic => true

  mount_uploader :file, FileUploader

end
# == Schema Information
#
# Table name: attachments
#
#  id                  :integer         not null, primary key
#  description         :string(255)
#  attachable_id       :integer
#  created_at          :datetime        not null
#  updated_at          :datetime        not null
#  attachable_type     :string(255)
#  number_of_downloads :integer
#  file                :string(255)
#

