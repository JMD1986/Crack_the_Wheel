module FarmsHelper
  def display_cheese_type_icon
    if @cheese.family = "Blue"
      image_tag("blue.png", size:"75")
    elsif @cheese.family = "Fresh"
      image_tag("fresh.png", size:"75")
    elsif @cheese.family = "Washed Rind"
      image_tag("washed-rind.png", size:"75")
    elsif @cheese.family = "Firm"
      image_tag("firm.png", size:"75")
    elsif @cheese.family = "Semi Soft"
      image_tag("semi-soft.png", size:"75")
    elsif @cheese.family = "Hard"
      image_tag("hard.png", size:"75")
    elsif @cheese.family = "Soft Ripened"
      image_tag("soft-ripend.png", size:"75")
    else
      image_tag("cheese-wheel.png", size:"75")
    end
  end
end
