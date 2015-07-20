class Cheese < ActiveRecord::Base
  has_many :reviews
  has_many :wheels
  belongs_to :farm
  has_attached_file :image, styles: { large: "600x600>",
                                      medium: "300x300",
                                      thumb: "100x100#"},
                    :url => ":s3_domain_url",
                    :default_url => "../assets/images/cheese-wheel.png",
                    :path => "/:class/:attachment/:id_partition/:style/:filename"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def average_rating
    if reviews.count > 0
      reviews.pluck(:wheel).sum / reviews.count
    else
      0
    end
  end

  def similar_cheese
    Cheese.where()
  end

end
