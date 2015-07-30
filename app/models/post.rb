class Post < ActiveRecord::Base
  belongs_to :user
  has_many :likes
  scope :all_posts, -> {order(created_at: :desc)}

  validates :label, presence: true, length: {minimum: 3, maximum: 50}
  VALID_URL = /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix
  validates :link, presence: true, format: {with: VALID_URL}, uniqueness: true

  has_many :user_likes, class_name: 'Like',
  						foreign_key: 'post_id',
  						dependent: :destroy
	has_many :liked_users, through: :user_likes, source: :user
private
	
end
