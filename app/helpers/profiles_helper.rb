module ProfilesHelper
  def edit_profile_link
    if current_user.profile.nil?
      content_tag :div, :class => ('alert alert-info') do
        content_tag(:p, "Your account has not been initialized yet.") << content_tag(:a, "Do it now!",  :href => new_user_profile_path(current_user))
      end
    else
      render :partial => 'profiles/profile', :object => current_user.profile
    end
  end
end
