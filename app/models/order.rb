class Order < ActiveRecord::Base

  belongs_to :customer
  belongs_to :server
  has_many :drinks

end
