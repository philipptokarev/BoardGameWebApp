class Review < ApplicationRecord
  belongs_to :users, optional: true
  belongs_to :games, optional: true
end
