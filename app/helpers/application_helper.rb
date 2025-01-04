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
    # url embeds last to avoid breaking other embeds
    text = embed_spotify(text)
    text = embed_youtube(text)
    text = embed_bandcamp(text)
    text = embed_ballot_box(text)

    embed_url_image(text)
  end

  # rubocop:disable Layout/LineLength
  def embed_spotify(text)
    spotify_url_regex = %r{https://open.spotify.com/(album|track|playlist)/([a-zA-Z0-9]+)(\?.*)?}

    text.gsub(spotify_url_regex) do |match|
      # scan returns array of arrays and split the 2 matched patterns
      type, id = match.scan(spotify_url_regex).flatten
      "<iframe src=\"https://open.spotify.com/embed/#{type}/#{id}\" width=\"450\" height=\"380\" frameborder=\"0\" allowtransparency=\"true\" allow=\"encrypted-media\"></iframe>"
    end
  end

  def embed_youtube(text)
    youtube_regex = %r{(https?://(?:www\.)?youtube\.com/watch\?v=([a-zA-Z0-9_-]+)|https?://youtu\.be/([a-zA-Z0-9_-]+))}

    text.gsub(youtube_regex) do |match|
      video_id = match.scan(youtube_regex).flatten.compact.last
      "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/#{video_id}\" frameborder=\"0\" allowfullscreen></iframe>"
    end
  end

  def embed_bandcamp(text)
    bandcamp_regex = /\[bandcamp=(\d+)\]/

    text.gsub(bandcamp_regex) do |match|
      album_id = match.scan(bandcamp_regex).flatten.first
      "<iframe style=\"border: 0; width: 100%; height: 472px;\" src=\"https://bandcamp.com/EmbeddedPlayer/album=#{album_id}/size=large/bgcol=333333/linkcol=4ec5ec/artwork=small/transparent=true/\" seamless></iframe>"
    end
  end

  def embed_url_image(text)
    url_regex = %r{(?<!src=")(https?://[^\s<]+)}
    image_regex = /\.(png|jpg|jpeg|gif)$/

    text.gsub(url_regex) do |match|
      if match =~ image_regex
        "<img src=\"#{match}\" style=\"max-width: 500px; max-height: 500px;\" />"
      else
        "<a href=\"#{match}\" class='text-sky-500' target='_blank' rel='noopener noreferrer'>#{match}</a>"
      end
    end
  end

  def embed_ballot_box(text)
    ballot_box_regex = /\[ballotBox=(\d+)\]/

    text.gsub(ballot_box_regex) do |match|
      ballot_id = match.scan(ballot_box_regex).flatten.first
      <<-HTML
        <div id="ballot-box-wrapper-#{ballot_id}" class="ballot-box-wrapper">
          <div id="ballot-box-root-#{ballot_id}" data-ballot-id="#{ballot_id}" class="text-gray-500"></div>
        </div>
      HTML
    end
  end
  # rubocop:enable Layout/LineLength
end
