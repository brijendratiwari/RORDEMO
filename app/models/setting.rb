class Setting < ActiveRecord::Base
  validates :hostaddress,:port,:user_name,:password,:enable_ssl,:protocol, presence: true
end
