
class Collection < ActiveRecord::Base
  belongs_to :user
  has_many :collection_products
  has_many :products, through: :collection_products
end