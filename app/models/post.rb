# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
class Post < ApplicationRecord
  has_many_attached :images
  belongs_to :user

  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :content, presence: true
end
