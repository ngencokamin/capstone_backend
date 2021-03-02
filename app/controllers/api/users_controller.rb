class Api::UsersController < ApplicationController
  before_action :authenticate_user, except: [:create, :show]

  def create
    @user = User.new(
      username: params[:username],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if @user.save
      render "show.json.jb"
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    render "show.json.jb"
  end 

  def update
    @user = current_user
    @user.email = params[:email] || @user.email
    @user.profile_picture = params[:profile_picture] || @user.profile_picture
    @user.username = params[:username] || @user.username
    @user.bio = params[:bio] || @user.bio
    @user.password = params[:password] || @user.password
    @user.password_confirmation = params[:password_confirmation] || @user.password_confirmation
    if @user.save
      render "show.json.jb"
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    user = current_user
    user.destroy
    render json: { message: "User has been obliterated." }
  end

end
