class ProfileController < ApplicationController
  before_action :authenticate_user!
  def show
    @profile = User.where('id = ?',params[:format])
    @projects = Project.all
  end
end
