class ActivityPresenter < BasePresenter
  presents :activity
  delegate :subject, to: :activity

  def title
    content_tag(:span, "", :class => "icon-ok-sign") << " " << activity.title
  end

  def days_left
    days = (activity.event.end_at - Date.today).to_i
    pluralized = pluralize(days, "day")
    if days >= 3 && days <= 10
      content_tag(:span, pluralized, :class => "label label-warning")
    elsif days < 3
      content_tag(:span, pluralized, :class => "label label-important")
    else
      content_tag(:span, pluralized, :class => "label label-success")
    end
  end
  
  def start_at
    activity.event.start_at
  end

  def end_at
    activity.event.end_at
  end

  def description
    handle_none task.description do
      raw task.description
    end
  end
  
  def status
    case activity.status.to_s
    when /^New$/
      content_tag(:span, "New", :class => "label")
    when /^In progress$/
      content_tag(:span, "In progress", :class => "label label-info")
    when /^Closed$/
      content_tag(:span, "Closed", :class => "label label-important")
    else
      content_tag(:span, activity.status.to_s, :class => "label")
    end
  end

  private

  def handle_none(value)
    if value.present?
      yield
    else
      content_tag(:span, "-", :class => "none")
    end
  end
end
