class ContactController < ApplicationController
  def index

    @user = User.where('id != ?',current_user.id).paginate(:page => params[:page], :per_page => 9)

  end
end
