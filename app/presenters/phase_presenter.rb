class PhasePresenter < BasePresenter
  presents :phase
  delegate :subject, to: :phase

  def title
    phase.title
  end

  def days_left
    days = (phase.event.end_at - Date.today).to_i
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
    phase.event.start_at
  end

  def end_at
    phase.event.end_at
  end

  def done
    handle_none phase.done do
      content_tag :div, content_tag(:div, "#{phase.done.to_s << '%'}",:class => "bar", :style => "width: #{phase.done.to_s << '%'}"), :class => "progress"
    end
  end

  def description
    handle_none phase.description do
      raw phase.description
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
