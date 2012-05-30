class IssuePresenter < BasePresenter
  presents :issue
  delegate :subject, to: :issue

  def status
    case issue.status.to_s
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
      content_tag(:span, issue.status.to_s, :class => "label")
    end
  end

  def priority
    case issue.priority.to_s
    when /^Low|Normal$/
      content_tag(:span, issue.priority.to_s, :class => "label label-success")
    when /^High$/
      content_tag(:span, "High", :class => "label label-warning")
    when /^Urgent|Immediate$/
      content_tag(:span, issue.priority.to_s, :class => "label label-important")
    else
      content_tag(:span, issue.priority.to_s, :class => "label")
    end
  end

  def assignee
    handle_none issue.assigned_to do
      link_to(issue.assigned_to, user_path(issue.assigned_to))
    end
  end

  def category
    handle_none issue.category do
      issue.category
    end
  end

  def start_at
    issue.event.start_at.strftime("%Y-%m-%d")
  end

  def end_at
    issue.event.end_at.strftime("%Y-%m-%d")
  end

  def done
    handle_none issue.done do
      content_tag :div, content_tag(:div, "#{issue.done.to_s << '%'}",:class => "bar", :style => "width: #{issue.done.to_s << '%'}"), :class => "progress"
    end
  end

  def updated
    issue.updated_at.strftime("%m/%d/%Y")
  end

  def id
    link_to(issue.id, project_issue_path(:project_id => issue.project, :id => issue))
  end

  def subject
    link_to(issue.subject, project_issue_path(:project_id => issue.project, :id => issue))
  end

  def estimated_time
    handle_none issue.estimated_time do
      issue.estimated_time
    end
  end

  def description
    handle_none issue.description do
      raw issue.description
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

  def site_link(content)
    #link_to_if(user.url.present?, content, user.url
  end
end
