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

  # def sort_cheese
  #   @cheese.reviews.count <
  # end


end
