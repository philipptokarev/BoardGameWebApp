class Game < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :image, presence: true

  def average_rating
    if reviews.blank?
      0
    else
      reviews.average(:rating).round(2) unless reviews.average(:rating).nil?
    end
  end
end
