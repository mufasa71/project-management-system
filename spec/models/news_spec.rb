require 'spec_helper'

describe News do
  pending "add some examples to (or delete) #{__FILE__}"
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

