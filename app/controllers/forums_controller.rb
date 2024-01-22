class ForumsController < ApplicationController
  def index
    forums = Forum.all

    render :index, locals: { forums: }
  end
end
