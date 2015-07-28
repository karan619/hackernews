class Post < ActiveRecord::Base
  belongs_to :user

  validates :label, presence: true, length: {minimum: 3, maximum: 30}
  VALID_URL = /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix
  validates :link, presence: true, format: {with: VALID_URL}
private
	
end
