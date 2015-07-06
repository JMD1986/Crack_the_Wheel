class Cheese < ActiveRecord::Base
  has_many :reviews
  has_many :wheels
end
