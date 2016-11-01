class Post < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :picture, presence: true
end
