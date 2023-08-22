class Customer < ApplicationRecord
  has_many :blogs, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :cafedates, dependent: :destroy
  has_many :blog_comments
  
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |customer|
      customer.last_name = 'guest'
      customer.first_name = 'guest'
      customer.phone_number = '0000000000'
      customer.password = '1234567'
    end
  end
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
end
