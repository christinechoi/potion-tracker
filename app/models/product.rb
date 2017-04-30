
class Product < ActiveRecord::Base
  #has_many :users, through: :collections
  has_many :collections, through: :collection_products
end