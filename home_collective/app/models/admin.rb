class Admin < ActiveRecord::Base
  has_many :coupon_codes
  has_many :deliveries
  has_many :images
  has_many :products
  has_many :static_pages
end
