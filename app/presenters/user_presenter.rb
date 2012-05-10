class UserPresenter < BasePresenter
  presents :user
  delegate :name, to: :user

  def profile_picture
    image_tag(profile_picture_file)
  end

  def name
    user.name
  end

  def email
    link_to(user.email, "mailto:#{user.email}")
  end

  def homepage
    link_to(user_url(user), user_url(user))
  end

  def number
    user.number
  end

  def member_since
    user.created_at.strftime("%B %e, %Y")
  end

  def intake
    user.intake
  end

  def twitter
    handle_none user.twitter do
      link_to user.twitter, "http://twitter.com/#{user.twitter}"
    end
  end

  def facebook
    handle_none user.facebook do
      link_to user.facebook, "http://facebook.com/#{user.facebook}"
    end
  end

  def msn
    handle_none user.msn do
      link_to user.msn, "http://msn.com/#{user.msn}"
    end
  end

  def skype
    handle_none user.skype do
      link_to user.skype, "callto://#{user.skype}"
    end
  end


  private

  def handle_none(value)
    if value.present?
      yield
    else
      content_tag(:span, "None given", :class => "none")
    end
  end

  def site_link(content)
    #link_to_if(user.url.present?, content, user.url
  end

  def profile_picture_file
    if user.profile_picture.present?
      user.profile_picture
    else
      "default.png"
    end
  end
end
