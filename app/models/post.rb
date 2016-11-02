class Post < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  # has_attached_file :image, styles: { large: "600x600", medium: "300x300", thumb: "150x150#"}
  # validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates :user_id, presence: true
  # validates :picture, presence: true
  validates :caption, presence: true

end
