class SubForumsController < ApplicationController
  def show
    topics = Topic.where(sub_forum_id: params[:id])
    sub_forum = SubForum.find(params[:id])

    render :index, locals: { topics:, sub_forum: }
  end
end
