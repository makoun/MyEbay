class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :destroy, :update]
  before_action :authenticate_user!, except: [:index, :show, :update]
  # def new
  # end

  # def create
  # end

  def update
    # @user = User.find_by_id(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    # @user = User.find_by_id(params[:id])
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html {redirect_to users_url}
      flash[:alert] = "User deleted"
      format.json { head :no_content }
    end
  end

  def index
    @users = User.paginate(page: params[:page])
    #@users = User.all
  end

  def show
  end
  
  private
  
    def set_user
      @user = User.find(params[:id])
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :postal_adress, :admin)
    end
end

