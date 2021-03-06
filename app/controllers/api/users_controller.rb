class Api::UsersController < ApplicationController
  before_action :authenticate_user, except: [:create, :show]

  def create
    @user = User.new(
      username: params[:username],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      profanity_filter: params[:profanity_filter],
      trello_list_id: params[:trello_list_id] 
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
    unless params[:profile_picture].nil?
      response = Cloudinary::Uploader.upload(params[:profile_picture], resource_type: :auto)
      cloudinary_url = response["secure_url"]
    end
    @user = current_user
    @user.email = params[:email] || @user.email
    @user.profile_picture = cloudinary_url || @user.profile_picture
    @user.username = params[:username] || @user.username
    @user.bio = params[:bio] || @user.bio
    @user.profanity_filter = params[:profanity_filter] || @user.profanity_filter
    @user.favorite_media_id = params[:favorite_media_id] || @user.favorite_media_id
    @user.trello_list_id = params[:trello_list_id] || @user.trello_list_id
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

  def trello_destroy
    @user = current_user
    @user.trello_list_id = nil
    saved_shows = SavedShow.where(user_id: @user.id)
    saved_shows.map do |saved_show|
      saved_show.trello_id = nil
      saved_show.save
    end
    if @user.save
      render "show.json.jb"
    else
      render json: { errors: @user.errors.full_messages }, status: :unauthorized
    end
  end

  def destroy
    user = current_user
    user_comments = user.comments
    if user.destroy
      user_comments.destroy_all
      render json: { message: "User has been obliterated." }
    else
      render json: {}, status: :unauthorized
    end
  end

end
