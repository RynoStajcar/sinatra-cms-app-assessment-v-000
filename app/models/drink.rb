class Drink < ActiveRecord::Base

  has_many :orders
  has_many :customers, through: :orders

  def slug
    name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    Drink.all.find{|drink| drink.slug == slug}
  end

end 