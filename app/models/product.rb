
class Product < ActiveRecord::Base
  #has_many :users, through: :collections
  belongs_to :collection
end