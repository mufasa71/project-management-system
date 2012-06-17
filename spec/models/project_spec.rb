require 'spec_helper'

describe Project do
  let(:project) { FactoryGirl.create(:project) }
  
  subject { project }

  describe "project create" do
    it "should not save invalid project" do
      project = Project.new
      assert project.new_record?.should be_true
    end
    
  end
end
# == Schema Information
#
# Table name: projects
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  identifier  :string(255)
#  homepage    :string(255)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  description :text
#  is_public   :boolean         default(TRUE)
#

