module ApplicationHelper
  def is_active?(page_name)
    "active" if params[:action] == page_name
  end

  def is_active_controller?(controller_name)
    params[:controller] == controller_name ? "active" : ""
  end

  def present(object, klass = nil)
    klass ||= "#{object.class}Presenter".constantize
    presenter = klass.new(object, self)
    yield presenter if block_given?
    presenter
  end

  def icon_to(text, icon, destination)
    link_to(text, destination, class: "#{icon}-icon", title: text)
  end
end
