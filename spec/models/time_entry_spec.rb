require 'spec_helper'

describe TimeEntry do
  pending "add some examples to (or delete) #{__FILE__}"
end
# == Schema Information
#
# Table name: time_entries
#
#  id          :integer         not null, primary key
#  user_id     :integer
#  activity_id :integer
#  project_id  :integer
#  hours       :integer
#  spent_on    :integer
#  comments    :string(255)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  issue_id    :integer
#

