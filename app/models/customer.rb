class Customer < ActiveRecord::Base

  belongs_to :server
  has_many :orders
  has_many :drinks, :through => :orders

  has_secure_password

  def slug
    username.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    Customer.all.find{|customer| customer.slug == slug}
  end

end