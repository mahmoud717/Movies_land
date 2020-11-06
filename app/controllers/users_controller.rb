class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]


  def index
    @users = User.all
  end


  def show
  end

  def new
    @user = User.new
  end


  def edit
  end

 
  def create
    @user = User.new(user_params)
      if @user.save
        session[:current_user] = @user
        flash[:notice] = 'You have successfully logged in.'
        redirect_to root_path
      else
        flash.now[:notice] = @user.errors.full_messages
        render :new 
      end
  end

 
  def update
      if @user.update(user_params)
        redirect_to @user, notice: 'User was successfully updated.'
      else
        render :edit 
      end
  end


  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end


    def user_params
      params.require(:user).permit(:name, :email)
    end
end
