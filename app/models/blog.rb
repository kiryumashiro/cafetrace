class Blog < ApplicationRecord
  has_one_attached :image
  belongs_to :customer
  has_many :favorites, dependent: :destroy
  has_many :blog_comments, dependent: :destroy  
  def favorited_by?(customer)
     favorites.where(customer_id: customer.id).exists?
  end
  
  def like_count
    favorites.count
  end
  
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image (2).jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
end
