class SettingController < ApplicationController
  def mailDetails
    @setting = Setting.new
  end

   def create
     @setting = Setting.new(setting_params)
     if @setting.save
       redirect_to home_index_path
     else
       render 'mailDetails'
     end
   end

  def edit
    @setting = Setting.find(params[:format])
    end

  def update
    @setting = Setting.find_by(params[:format])
    if @setting.update_attributes
      redirec_to home_index_path
    else
      render 'edit'
    end

  end

  protected

  def setting_params
    params.require(:setting).permit(:hostaddress,:port,:user_name,:password,:enable_ssl,:protocol)
  end

end
