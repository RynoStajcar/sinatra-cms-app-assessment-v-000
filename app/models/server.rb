class Server < ActiveRecord::Base

  has_many :orders
  has_many :customers, :through => :orders

  has_secure_password

  def slug
    username.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    Server.all.find{|server| server.slug == slug}
  end

end