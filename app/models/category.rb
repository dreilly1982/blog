class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  has_many :posts, dependent: :destroy
  has_many :comments, as: :commentable
end
