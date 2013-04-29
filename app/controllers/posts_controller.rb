class PostsController < ApplicationController
  include AngularController

  def index
    @posts = Post.all
    respond_with @posts
  end

  def create
    logger.debug "Creating"
    logger.debug params.inspect
    respond_with Post.create!(params.permit(:title, :body))
  end

  def destroy
    post.destroy!
    head :ok
  end

  private
  def post
    @post ||= Post.find params[:id]
  end
end
