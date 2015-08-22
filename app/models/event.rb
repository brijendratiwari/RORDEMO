class Event < ActiveRecord::Base
  validates :title, :description, :start, :end ,presence: true
end
