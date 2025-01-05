class TopicsController < ApplicationController
  include Pagy::Backend

  # rubocop:disable Metrics/AbcSize
  def create
    topic = Topic.new(topic_params)

    if topic.save
      post_count = topic.user.post_count + 1
      topic.user.update(post_count:)
      topic.update(recent_activity: Time.current)

      redirect_to forum_sub_forum_topic_path(
        forum_slug: topic.sub_forum.forum.slug, sub_forum_slug: topic.sub_forum.slug, topic_slug: topic.slug
      )
    else
      respond_to do |format|
        format.html { render :new }
        format.turbo_stream
      end
    end
  end
  # rubocop:enable Metrics/AbcSize

  def index; end

  def show
    topic = Topic.find_by(slug: params[:topic_slug])
    @pagy, comments = pagy(Comment.where(topic:))

    set_meta_tags(
      title: topic.title,
      description: topic.body,
      # keywords: @article.tag_list,
    )

    read_receipt(topic) if current_user

    render :show, locals: { topic:, comments: }
  end

  private

  def read_receipt(topic)
    receipt = UserTopicReceipt.find_by(topic:, user: current_user)

    if receipt
      receipt.update_last_read
    else
      UserTopicReceipt.create(topic:, user: current_user, last_read: Time.current)
    end
  end

  def topic_params
    params.require(:topic).permit(:title, :body, :forum_id, :user_id, :sub_forum_id)
  end
end
