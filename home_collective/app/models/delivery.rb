class Delivery < ActiveRecord::Base
  belongs_to :order
  belongs_to :admin
  has_and_belongs_to_many :order_item
  has_one :feedback
end
