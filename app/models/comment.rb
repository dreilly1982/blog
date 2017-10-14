class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true

  scope :descending, -> { order(created_at: :desc) }
end
