class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :posts
  has_many :favorites
  has_many :favposts, through: :favorites, source: :post
  
  def like(post)
    favorites.find_or_create_by(post_id: post.id)
  end
  
  def unlike(post)
    favorite = favorites.find_by(post_id: post.id)
    favorite.destroy if favorite
  end
  
  def favpost?(post)
    self.favposts.include?(post)
  end
  
  def active_for_authentication?
    super && is_enabled?
  end
  
  def inactive_message
    is_enabled? ? super : :status_disabled
  end
  
  def is_enabled?
    self.status == 'enabled'
  end
end
