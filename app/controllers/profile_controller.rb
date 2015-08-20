class ProfileController < ApplicationController
  def show
    @profile = User.where('id = ?',params[:format])
  end
end
