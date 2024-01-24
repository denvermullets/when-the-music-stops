class CommentsController < ApplicationController
  def create
    # don't forget to handle error for validation of uniqueness
  end

  def index
  end

  def show
    topic = Topic.find_by(slug: params[:topic_slug])
    comments = Comment.where(topic:)

    render :show, locals: { topic:, comments: }
  end
end
