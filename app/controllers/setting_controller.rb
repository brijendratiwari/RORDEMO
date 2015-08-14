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


  protected

  def setting_params
    params.require(:setting).permit(:hostaddress,:port,:user_name,:password,:enable_ssl,:protocol)
  end

end
