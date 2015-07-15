class Cheese < ActiveRecord::Base
  has_many :reviews
  has_many :wheels
  belongs_to :farm
  has_attached_file :image, styles: { large: "600x600>", medium: "300x300", thumb: "100x100#"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def average_rating
    reviews.pluck(:wheel).sum / reviews.count
  end

  def farm_list
  farm_options = Farm.all
    @farm_names = []
    farm_options.each do |farm|
      @farm_names.push(farm.name, farm.id)
    end
  end

end
