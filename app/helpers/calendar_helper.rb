module CalendarHelper
  def month_link(month_date)
    link_to(I18n.localize(month_date, :format => "%B"), {:month => month_date.month, :year => month_date.year})
  end
  
  # custom options for this calendar
  def event_calendar_opts
    { 
      :year => @year,
      :month => @month,
      :event_strips => @event_strips,
      :month_name_text => I18n.localize(@shown_month, :format => "%B %Y"),
      :previous_month_text => "<< " + month_link(@shown_month.prev_month),
      :next_month_text => month_link(@shown_month.next_month) + " >>",
      :use_all_day => true
    }
  end

  def event_calendar
    # args is an argument hash containing :event, :day, and :options
    calendar event_calendar_opts do |args|
      event, day = args[:event], args[:day]
      path = ""
      event.start_at = DateTime.parse(event.start_at.to_s)
      event.end_at = DateTime.parse(event.end_at.to_s)
      case event.eventable_type
      when /Milestone/
        path = project_milestone_path(@project, :id => event.eventable_id)
      when /Phase/
        path = project_phase_path(@project, :id => event.eventable_id)
      else
        path = ""
      end
      html = %(<a href="#{path}" title="#{h(event.name)}">)
      html << display_event_time(event, day)
      html << %(#{h(event.eventable_type.slice(0,3))}:#{h(event.name)}</a>)
      html
    end
  end
end
