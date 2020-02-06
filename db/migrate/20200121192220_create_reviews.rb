class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :game_id, null: false
      t.integer :user_id, null: false
      t.text :review, null: false

      t.timestamps
    end
  end
end
