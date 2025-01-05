class ForumsController < ApplicationController
  def index
    forums = Forum.all
    last_comment = Comment.last
    last_topic = Topic.last

    set_meta_tags(
      title: 'index',
      description: 'check out these sub forums'
    )

    # this will only be nil if it's a fresh wtms instance
    last_post = if last_topic.nil? || last_comment.nil?
                  nil
                else
                  last_comment.created_at > last_topic.created_at ? last_comment : last_topic
                end

    render :index, locals: { forums:, last_post: }
  end
end
