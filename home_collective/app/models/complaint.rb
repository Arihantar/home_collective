class Complaint < ActiveRecord::Base
  belongs_to :order
end
