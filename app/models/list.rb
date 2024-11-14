class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks # This sets up a many-to-many relationship between List and Movie through Bookmark.

  validates :name, presence: true, uniqueness: true
end
