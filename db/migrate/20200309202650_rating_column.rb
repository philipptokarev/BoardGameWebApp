class RatingColumn < ActiveRecord::Migration[6.0]
  def change
    enable_extension 'citext'
    change_column :users, :login, :citext
    change_column :reviews, :rating, :integer, default: 0
  end
end
