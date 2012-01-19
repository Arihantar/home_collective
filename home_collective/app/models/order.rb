class Order < ActiveRecord::Base
  belongs_to :city
  belongs_to :state
  belongs_to :user
  has_and_belongs_to_many :coupon_code
  has_many :complaints
  has_many :deliveries
  has_many :order_items
end
