class Drink < ActiveRecord::Base

  belongs_to :orders

  def slug
    name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    Drink.all.find{|drink| drink.slug == slug}
  end

end