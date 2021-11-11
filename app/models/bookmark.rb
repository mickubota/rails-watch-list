class Bookmark < ApplicationRecord
  belongs_to :list
  belongs_to :movie
  validates :comment, length: { minimum: 6 }
  validates :movie, presence: true, uniqueness: { scope: :list }
end
