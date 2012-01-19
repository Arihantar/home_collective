class Image < ActiveRecord::Base
  belongs_to :product
  belongs_to :admin
end
