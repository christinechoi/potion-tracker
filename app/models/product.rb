class Product < ActiveRecord::Base
  #has_many :users, through: :collections
  has_many :collections, through: :collection_products
  has_many :collection_products

  validates :name, presence: true
  validates :brand, uniqueness: true
  validates :description, presence: true

end