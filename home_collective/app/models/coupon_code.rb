class CouponCode < ActiveRecord::Base
  belongs_to :admin
  has_and_belongs_to_many :cart
  has_and_belongs_to_many :product
  has_and_belongs_to_many :order
end
