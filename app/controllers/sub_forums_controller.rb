class SubForumsController < ApplicationController
  include Pagy::Backend

  def show
    sub_forum = SubForum.find_by(slug: params[:sub_forum_slug])
    topics = Topic.where(sub_forum_id: sub_forum.id).order(recent_activity: :desc)
    @pagy, topics = pagy(topics)

    render :show, locals: { topics:, sub_forum: }
  end
end
