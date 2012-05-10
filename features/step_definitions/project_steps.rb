Given /^a project exists for that user$/ do
  project = create_model("project")
  project.members.build(:user_id => model("that user")).save!
end

Given /^I created a project$/ do
  project = FactoryGirl.create(:project)
  member = FactoryGirl.create(:member)
  role = FactoryGirl.create(:role)
  member.roles << role
  project.members << member

  member.save!
  project.save!
end
