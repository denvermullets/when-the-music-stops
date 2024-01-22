class SubForumsController < ApplicationController
  def show
    sub_forum = SubForum.find_by(slug: params[:slug])
    topics = Topic.where(sub_forum_id: sub_forum.id)

    render :index, locals: { topics:, sub_forum: }
  end
end
