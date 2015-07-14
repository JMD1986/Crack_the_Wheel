class Review < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image, styles: { large: "600x600>", medium: "300x300", thumb: "100x100#"}
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
