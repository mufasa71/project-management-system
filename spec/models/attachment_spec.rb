require 'spec_helper'

describe Attachment do
  pending "add some examples to (or delete) #{__FILE__}"
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

