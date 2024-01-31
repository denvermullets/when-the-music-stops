module ApplicationHelper
  include Pagy::Frontend

  def format_created_date(obj)
    if obj.created_at > 24.hours.ago
      "#{time_ago_in_words(obj.created_at)} ago"
    else
      "on #{obj.created_at.strftime('%b %d, %Y')}"
    end
  end

  def line_break(text)
    html_escape(text).gsub(/\n/, '<br>').html_safe
  end
end
