class AdminController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = User.where('id != ?',current_user.id)
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end


  def destroy
    User.find(params[:format]).destroy
    flash[:success] = "User deleted"
    redirect_to admin_index_path
  end
end
