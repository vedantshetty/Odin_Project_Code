class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(whitlisted_user_params)
    puts @user
    if @user.save
      redirect_to new_user_path
    else
      puts @user.errors.messages
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(whitlisted_user_params)
      redirect_to new_user_path
    else
      puts @user.errors.messages
      render :new
    end
  end


  private 

  def whitlisted_user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
