class Game < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :image, presence: true

  def average_rating
    return nil if reviews.count.zero?
    reviews.average(:rating).round(2)
  end
end
