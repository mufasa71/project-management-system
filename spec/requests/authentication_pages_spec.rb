require 'spec_helper'

describe "Authentication" do

  describe "authorization" do
    describe "for non-signed-in users" do
      let(:user) { FactoryGirl.create(:unique_user) }

      describe "in the Users controller" do
        describe "visiting the following page" do
          before { get following_user_path(user) }
          it { response.status.should be(302) }
        end

        describe "visiting the followers page" do
          before { get followers_user_path(user) }
          it { response.status.should be(302)  }
        end
      end
    end
  end
end
