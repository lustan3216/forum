class UserProfilesController < ApplicationController

  before_action :find_user, :only => [:index, :show]
  before_action :set_my_user, :only => [:edit, :update, :destroy]
  before_action :authenticate_user! ,:only => [:create ,:new]

  def index
  end

  def show
    @posts = @user.posts.all
    @comments = @user.comments.all
    @profile = @user.get_profile
  end

  def edit
    @profile = @user.get_profile
  end

  def update
    @profile = @user.get_profile
    if @profile.update(profile_params)
      redirect_to user_profile_path(@user)
    else
      render :new
    end
  end

  def destroy
  end


  def find_user
    @user = User.find(params[:user_id])
  end

  def set_my_user
    @user = current_user
  end

  def profile_params
    params.require(:profile).permit(:description,:name,:email,:gender,:birthday)
  end

end
