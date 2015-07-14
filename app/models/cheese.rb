class Cheese < ActiveRecord::Base
  has_many :reviews
  has_many :wheels
  belongs_to :farm
  has_attached_file :image, styles: { large: "600x600>", medium: "300x300", thumb: "150x150#"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def average_rating
    reviews = Review.where(cheese_id :params[:id])
    wheels_array = []
    wheels_array.count = number_of_ratings
    review.each do |review|
      wheels_array.push(review.wheel)
    end
    @average_rating = wheels_array.inject(:+) / number_of_ratings
  end

  def farm_list
  farm_options = Farm.all
    @farm_names = []
    farm_options.each do |farm|
      @farm_names.push(farm.name, farm.id)
    end
  end

end
