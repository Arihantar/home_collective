class User < ActiveRecord::Base
  has_many :orders
  has_many :reviews
  has_many :services
  has_many :user_details
  has_many :wishlists
end
