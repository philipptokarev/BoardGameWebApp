class AddIndexToRatingAndReview < ActiveRecord::Migration[6.0]
  def change
    add_index :ratings, :user_id
    add_index :reviews, :user_id
  end
end
