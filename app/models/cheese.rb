class Cheese < ActiveRecord::Base
  has_many :reviews
  has_many :wheels
  belongs_to :farm
  has_attached_file :image, styles: { huge: "1200x1200",
                                      large: "600x600>",
                                      medium: "300x300",
                                      thumb: "100x100#"},
                    :url => ":s3_domain_url",
                    :default_url => "images/cheese-wheel.png",
                    :path => "/:class/:attachment/:id_partition/:style/:filename"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates_presence_of :name

  #this needs to be reworked so that the user needs to know it needs a review
  def average_rating
    if reviews.count > 0
      reviews.pluck(:wheel).sum / reviews.count
    else
      0
    end
  end

  #this is a helper mether right now but I would like to make it a virtual column as well
  def icon
    if @cheese.family = "Blue"
      image_tag("blue.png", size:"15")
    elsif @cheese.family = "Fresh"
      image_tag("fresh.png", size:"15")
    elsif @cheese.family = "Washed Rind"
      image_tag("washed-rind.png", size:"15")
    elsif @cheese.family = "Firm"
      image_tag("firm.png", size:"15")
    elsif @cheese.family = "Semi Soft"
      image_tag("semi-soft.png", size:"15")
    elsif @cheese.family = "Hard"
      image_tag("hard.png", size:"15")
    elsif @cheese.family = "Soft Ripened"
      image_tag("soft-ripend.png", size:"15")
    else
      image_tag("cheese-wheel.png", size:"15")
    end
  end


end
