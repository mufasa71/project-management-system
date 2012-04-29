module UsersHelper
  def friendship_button(user)
    if user_signed_in?
      unless user == current_user || in_progress_or_friend?(user)
        simple_form_for(:friendship, :url => user_friends_path(:user_id => current_user, :friend_id => user), :html => { :class => 'from-horizontal' }) do |f|
          f.button :submit, :value => "Add to friends" ,:class => 'btn-primary'
        end
      else
        current_user.friends.include?(user) ? "Friend" : "Friendship status in progress"
      end
    end
  end

  def in_progress_or_friend?(user)
    current_user.friends.include?(user) || current_user.requested_friends.include?(user) || current_user.pending_friends.include?(user)
  end
end
