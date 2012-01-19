class City < ActiveRecord::Base
  belongs_to :state
  has_many :orders
  has_many :user_details
end
