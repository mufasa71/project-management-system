module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /the home\s?page/
      '/'

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    # Devise paths mappings here.

    when /path "(.+)"/
      $1
    when /^the ([\w ]+) page$/
      page = $1.slice(0..$1.index(" ")-1) 
      if page.eql?("show")
        eval("#{$1.slice(($1.index(" ")+1)..-1)}_path(#{@me.id})")
      else
        send("#{$1.gsub(/\W+/, '_')}_path")
      end
    when /^my account page$/
      email = @me.nil? ? @admin.email : @me.email
      edit_user_registration_path(User.find_by_email(email))
    when /^my edit profile page$/
      edit_profile_path(@me.profile)
    when /^admin (\w+) (\w+) page$/
      if $1.eql?("show")
        eval("admin_#{$2}_path(#{@me.id})")
      else
        eval("#{$1}_admin_#{$2}_path(#{@me.id})")
      end
    when /^other (\w+) (\w+) page$/
      @other = FactoryGirl.create(:unique_user)
      eval("#{$1}_#{$2}_path(#{@other.id})")
    else
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
