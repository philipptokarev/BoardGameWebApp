class Game < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :ratings, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :image, presence: true
end
