class TopicsController < ApplicationController
  include Pagy::Backend

  def create
    topic = Topic.new(topic_params)

    if topic.save
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

  def index
  end

  def show
    topic = Topic.find_by(slug: params[:topic_slug])
    @pagy, comments = pagy(Comment.where(topic:))

    render :show, locals: { topic:, comments: }
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :body, :forum_id, :user_id, :sub_forum_id)
  end
end
