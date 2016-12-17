
class Product < ActiveRecord::Base
  has_many :users, through: :collections

end