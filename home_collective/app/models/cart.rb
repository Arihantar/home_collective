class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :cart_items
  has_and_belongs_to_many :coupon_codes
end
