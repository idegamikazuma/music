class UserController < ApplicationController

  before_action :set_current_user

  def login_form
  end

  def login
    @user = User.find_by(email: params[:email],password: params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to("/user/#{@user.id}")
    else
      render("user/login_form")
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def singup
    @user = User.new
  end

  def create
    @user = User.new(name: params[:name], email: params[:email], password: params[:password])
    if @user.save
      flash[:notice]="ユーザー登録が完了しました"
      redirect_to("/user/#{@user.id}")
    else
      render("user/singup")
    end
  end

  def edit_form
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
    if params[:image_name]
      @user.image_name = "#{@user.id}.jpg"
      image = params[:image_name]
      File.binwrite("public/user_images/#{@user.image_name}",image.read)
    end
    @user.update_attributes(name: params[:name])
    @user.save
    redirect_to("/user/#{@user.id}")
  end

  def logout
    session[:user_id] = nil
    redirect_to("/")
  end
end
