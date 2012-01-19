class Product < ActiveRecord::Base
  belongs_to :admin
  has_many :reviews
  has_many :cart_items
  has_many :images
  has_many :order_items
  has_many :purchases
  has_many :wishlists
  has_and_belongs_to_many :coupon_codes
  has_and_belongs_to_many :tags
end
