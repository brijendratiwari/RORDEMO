class Settingsmtp < ActiveRecord::Base


  validates :hostaddress, :post, :user_name, :password, :enable_ssl, :protocol,presence: true


end
