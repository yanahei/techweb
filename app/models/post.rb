class Post < ApplicationRecord
  def self.search(search)
    if search
      Post.where(['title LIKE ?', "%#{search}%"])
    else
      Post.all
    end
  end
  has_many :favorites, foreign_key: 'post_id', dependent: :destroy
  has_many :users, through: :favorites
  has_many_attached :pdfs
end
