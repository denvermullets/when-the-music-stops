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
    html_escape(text).gsub("\n", '<br>').html_safe
  end

  def embed_links(text)
    youtube_regex = %r{(https?://(?:www\.)?youtube\.com/watch\?v=([a-zA-Z0-9_-]+)|https?://youtu\.be/([a-zA-Z0-9_-]+))}
    spotify_url_regex = %r{https://open.spotify.com/(album|track|playlist)/([a-zA-Z0-9]+)(\?.*)?}
    bandcamp_regex = /\[bandcamp=(\d+)\]/
    image_regex = %r{(https?://.*?\.(?:png|jpg|jpeg))}
    url_regex = %r{(?<!src=")(https?://[^\s<]+)}

    text = text.gsub(spotify_url_regex) do |match|
      # scan returns array of arrays and split the 2 matched patterns
      type, id = match.scan(spotify_url_regex).flatten
      "<iframe src=\"https://open.spotify.com/embed/#{type}/#{id}\" width=\"450\" height=\"380\" frameborder=\"0\" allowtransparency=\"true\" allow=\"encrypted-media\"></iframe>"
    end

    text = text.gsub(youtube_regex) do |match|
      video_id = match.scan(youtube_regex).flatten.compact.last
      "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/#{video_id}\" frameborder=\"0\" allowfullscreen></iframe>"
    end

    text = text.gsub(bandcamp_regex) do |match|
      album_id = match.scan(bandcamp_regex).flatten.first
      "<iframe style=\"border: 0; width: 100%; height: 472px;\" src=\"https://bandcamp.com/EmbeddedPlayer/album=#{album_id}/size=large/bgcol=333333/linkcol=4ec5ec/artwork=small/transparent=true/\" seamless></iframe>"
    end

    text = text.gsub(image_regex) do |match|
      "<img src=\"#{match}\" style=\"max-width: 500px; max-height: 500px;\" />"
    end

    text.gsub(url_regex) do |match|
      "<a href=\"#{match}\" class='text-sky-500' target='_blank' rel='noopener noreferrer'>#{match}</a>"
    end
  end
end
