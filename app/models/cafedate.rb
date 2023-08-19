class Cafedate < ApplicationRecord
  scope :active_datas, -> { where.not(latitude: nil).or(where.not(longitude: nil)) }
  has_one_attached :image
  enum pin_type: { go_schedule_pins: 0, been_pins: 1}
end
