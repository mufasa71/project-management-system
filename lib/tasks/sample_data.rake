namespace :db do
  desc "Fill database with sample data" do
    task populate: :environment do
      make_users
      make_relationships
    end
  end

  def make_users
    FactoryGirl.create(:admin, email: "example@pms.org", password: "foobar")
    FactoryGirl.create_list(:unique_user, 99)
  end

  def make_relationships
    users = User.all
    user = users.first
    followed_users = users[2..50]
    followers = users[3..40]
    followed_users.each { |followed| user.follow!(followed) }
    followers.each { |follower| follower.follow!(user) }
  end
end
