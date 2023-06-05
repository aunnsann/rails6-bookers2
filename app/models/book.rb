class Book < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :favorites, dependent: :destroy
  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}


  def get_image
   if image.attached?
     image
   else
     'airport.jpg'
   end
  end
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
