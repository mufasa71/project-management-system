module ProfilesHelper
  def edit_profile_link(user)
    if user.getting_started
      content_tag :div, :class => ('alert alert-info') do
        content_tag(:p, "Your account has not been initialized yet.") << content_tag(:a, "Do it now!",  :href => edit_profile_path(user.profile)) 
      end
    else
      render :partial => 'profiles/profile', :object => user.profile
    end
  end
end
