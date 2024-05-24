class Movie < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movie_tags, dependent: :destroy
  has_many :tags, through: :movie_tags
  has_many :comments, dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true
end
