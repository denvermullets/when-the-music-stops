class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)

    if comment.save
      post_count = comment.user.post_count + 1
      comment.user.update(post_count:)

      redirect_to forum_sub_forum_topic_path(slug: comment.topic.slug)
    else
      topic = Topic.find_by(slug: params[:topic_slug])
      comments = Comment.where(topic:)
      respond_to do |format|
        format.html { render 'topics/show', locals: { topic:, comments: } }
        format.turbo_stream
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :topic_id, :user_id)
  end
end
