class PostsController < ApplicationController
  def new
    @post = @blog.new_entry
  end
  
  def create
    @post = @blog.new_entry(params[:post])
    @post.publish
    redirect_to root_path, :notice => "Post added!"
  end
end
