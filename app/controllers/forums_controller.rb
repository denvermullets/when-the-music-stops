class ForumsController < ApplicationController
  def index
    forums = Forum.all
    last_comment = Comment.last
    last_topic = Topic.last

    # this will only be nil if it's a fresh wtms instance
    last_post = if last_topic.nil?
                  nil
                else
                  last_comment.created_at > last_topic.created_at ? last_comment : last_topic
                end

    render :index, locals: { forums:, last_post: }
  end
end
