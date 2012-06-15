class TaskPresenter < BasePresenter
  presents :task
  delegate :subject, to: :task

  def status
    case task.status.to_s
    when /^New$/
      content_tag(:span, "New", :class => "label")
    when /^In progress$/
      content_tag(:span, "In progress", :class => "label label-info")
    when /^Resolved$/
      content_tag(:span, "Resolved", :class => "label label-success")
    when /^Feedback$/
      content_tag(:span, "Feedback", :class => "label label-warning")
    when /^Closed$/
      content_tag(:span, "Closed", :class => "label label-important")
    when /^Rejected$/
      content_tag(:span, "Rejected", :class => "label label-inverse")
    else
      content_tag(:span, task.status.to_s, :class => "label")
    end
  end

  def priority
    case task.priority.to_s
    when /^Low|Normal$/
      content_tag(:span, task.priority.to_s, :class => "label label-success")
    when /^High$/
      content_tag(:span, "High", :class => "label label-warning")
    when /^Urgent|Immediate$/
      content_tag(:span, task.priority.to_s, :class => "label label-important")
    else
      content_tag(:span, task.priority.to_s, :class => "label")
    end
  end

  def start_at
    task.event.start_at.strftime("%Y-%m-%d")
  end

  def end_at
    task.event.end_at.strftime("%Y-%m-%d")
  end

  def done
    handle_none task.done do
      content_tag :div, content_tag(:div, "#{task.done.to_s << '%'}",:class => "bar", :style => "width: #{task.done.to_s << '%'}"), :class => "progress"
    end
  end

  def updated
    task.updated_at.strftime("%m/%d/%Y")
  end

  def id
    link_to(task.id, project_task_path(:project_id => @project, :id => task))
  end

  def subject
    link_to(task.subject, project_task_path(:project_id => @project, :id => task))
  end

  def description
    handle_none task.description do
      raw task.description
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
