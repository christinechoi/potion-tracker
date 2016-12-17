
class Collection < ActiveRecord::Base
  belongs_to :user
  has_many :products, through: :user
end