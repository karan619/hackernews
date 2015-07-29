class User < ActiveRecord::Base
	validates :name, presence: true, length: {minimum: 3, maximum: 30}
  VALID_EMAIL_REGEX = /\A[\w+\-.?]+@+[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 256}, format: { with: VALID_EMAIL_REGEX },
                                                            uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: 6}

  before_save :downcase_email
  has_many :posts, dependent: :destroy
  has_many :post_likes, class_name: 'Like',
                          foreign_key: 'user_id',
                          dependent: :destroy
  has_many :liked_posts, through: :post_likes, source: :post

  has_secure_password
private
  def downcase_email
    email.downcase!
  end
end
