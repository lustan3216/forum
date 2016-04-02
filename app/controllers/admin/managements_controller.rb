class Admin::ManagementsController < ApplicationController

  before_action :authenticate_user!, :admin

  def index
    @categories = Category.all
    @category = Category.new
    @users = User.all
  end

  def create
    @category = Category.create(set_params)
    redirect_to admin_managements_path
  end

  def destroy
    @category = Category.find(params[:id])
    if (@category.posts.count.nil?)
      @category.destroy
    end
    redirect_to admin_managements_path
  end

  def update
    @user = User.find(params[:id])
    if !(@user.admin)
      @user.admin = true
    else
      @user.admin = false
    end
    redirect_to admin_managements_path
    #要怎麼用user_params存進去
  end

  private

  def set_params
    params.require(:category).permit(:name)
  end

  def user_params
    params.require(:user).premit(:admin)
  end

  def admin
    if !current_user.admin
      redirect_to root_path
    end
  end
  # 這樣寫好嗎
end
