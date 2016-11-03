class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

  default_scope -> { order(created_at: :desc) }

  has_attached_file :picture, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#"}
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  validates :user_id, presence: true

  # validates :picture, presence: true

  validates :caption, presence: true

end
