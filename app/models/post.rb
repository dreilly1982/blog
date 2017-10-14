class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  belongs_to :category
  has_many :comments, as: :commentable

  def as_json(options={})
    {
      id: self.id,
      slug: self.slug,
      name: self.name,
      content: self.content,
      category_name: self.category.name,
      category_slug: self.category.slug
    }
  end
end
