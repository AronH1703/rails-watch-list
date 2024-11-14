class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :comment, presence: true, length: { minimum: 5 }
  validates :movie_id, uniqueness: { scope: :list_id, message: "is already in this list" }
end
