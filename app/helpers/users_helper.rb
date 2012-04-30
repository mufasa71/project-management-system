module UsersHelper
  def follow_button_for(user)
    unless current_user == user
      if current_user.following?(user)
        render 'unfollow'
      else
        render 'follow'
      end
    end
  end
end
