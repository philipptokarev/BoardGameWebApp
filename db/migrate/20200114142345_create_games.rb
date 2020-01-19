class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :name
      t.text :description
      t.float :rating
      t.string :video
      t.string :reference
      t.string :image

      t.timestamps
    end
  end
end
