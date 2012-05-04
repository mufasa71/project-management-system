Given /^a project exists for that user$/ do
  project = FactoryGirl.create(:project)
  member = project.members.build(:user_id => model("that user")).save!
end
