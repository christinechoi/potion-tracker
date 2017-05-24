
class User < ActiveRecord::Base
  has_secure_password
  has_many :collections
  has_many :products

  validates :username, uniqueness: true


  def slug
    username.downcase.gsub(/ /, '-')
  end


  def self.find_by_slug(slug)
    User.all.find {|user| user.slug == slug}
  end

  def all_products
    products = []
    # binding.pry

    self.collections.each do |collection|
      collection.products.each do |product|
        products << product
      end
    end      
    products 
  end

  
end