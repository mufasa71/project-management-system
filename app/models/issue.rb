class Issue < ActiveRecord::Base
end
# == Schema Information
#
# Table name: issues
#
#  id               :integer         not null, primary key
#  project_id       :integer
#  tracker_id       :integer
#  status_id        :integer
#  author_id        :integer
#  assigned_to_id   :integer
#  fixed_version_id :integer
#  priority_id      :integer
#  category_id      :integer
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#

