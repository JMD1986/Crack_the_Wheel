class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :cheese
  has_attached_file :image, styles: { huge: "1200x1200",
                                      large: "600x600>",
                                      medium: "300x300",
                                      thumb: "100x100#"},
                    :url => ":s3_domain_url",
                    :default_url => "../assets/images/cheese-wheel.png",
                    :path => "/:class/:attachment/:id_partition/:style/:filename"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  # def get_average_wheels
  #   @reviews.each do |review|
  #     score = []
  #     score.push(review.wheel)
  #     review.wheel.count = total_wheels
  #     @average_score = score.sum % total_wheels
  #   end
  #   @average_score
  # end

end
