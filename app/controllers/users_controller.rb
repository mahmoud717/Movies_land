class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :logged? , only: [:edit, :update, :destroy]
  before_action :user? , only: [:edit, :update, :destroy]


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
    
    if @user.id == session["current_user"]["id"] 
      reset_session
      session.clear
    end
    @user.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
    
  end

  private

    def set_user
      @user = User.find(params[:id])
    end
    def user?
      if @user.id == session["current_user"]["id"] || session["current_user"]["admin"] == true
        true
      else 
        redirect_to root_path, notice: "HaHaHa nice try, Unfortunally you can't edit or destroy another user's account."
      end
    end

    def user_params
      params.require(:user).permit(:name, :email, :profile_image)
    end
end
