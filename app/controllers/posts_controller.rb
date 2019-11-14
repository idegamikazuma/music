class PostsController < ApplicationController

  before_action :set_current_user

  def upload_form
    @post = Post.find_by(id: @current_user.id)
  end

  def upload
    @post = Post.new(content: params[:content])
    if @post.save
      redirect_to("/posts/#{@current_user.id}/show")
    else
      render("posts/#{@current_user.id}/uplode")
    end
  end
  def show
    @user = Post.find_by(id: @current_user.id)
  end
end
