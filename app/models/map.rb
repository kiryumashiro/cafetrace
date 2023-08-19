class Map < ApplicationRecord
  has_many :cafedates
  belongs_to :customer
end
