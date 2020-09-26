class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  # user.liked_posts で user が「いいね!」しているメッセージの一覧を取得できるようになる
  has_many :liked_users, through: :likes,source: :user
  validates :content, presence: true
  
  def liked_by(user)
    likes.find_by(user_id: user.id).present?
  end  
end
