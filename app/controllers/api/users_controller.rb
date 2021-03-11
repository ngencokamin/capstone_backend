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
      render json: { errors: @user.errors.full_messages }, status: :bad_request
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    render "show.json.jb"
  end 

  def update
    response = Cloudinary::Uploader.upload(params[:profile_picture], resource_type: :auto)
    cloudinary_url = response["secure_url"]
    @user = current_user
    @user.email = params[:email] || @user.email
    @user.profile_picture = cloudinary_url || @user.profile_picture
    @user.username = params[:username] || @user.username
    @user.bio = params[:bio] || @user.bio
    if params[:password]
      @user.password = params[:password]
      @user.password_confirmation = params[:password_confirmation]
    end
    if @user.save
      render "show.json.jb"
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    user = current_user
    if user.destroy
      render json: { message: "User has been obliterated." }
    else
      render json: {}, status: :unauthorized
    end
  end

end
