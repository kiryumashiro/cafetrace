class Cafedate < ApplicationRecord
  scope :active_datas, -> { where.not(latitude: nil).or(where.not(longitude: nil)) }
  has_one_attached :image
  enum pin_type: { go_schedule_pins: 0, been_pins: 1}
  
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image (2).jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
end
