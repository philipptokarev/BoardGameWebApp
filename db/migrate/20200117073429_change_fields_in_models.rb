class ChangeFieldsInModels < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :role, :string, default: 'user'
    change_column :users, :login, :string, null: false
    change_column :users, :password_digest, :string, null: false
    change_column :games, :name, :string, null: false
    change_column :games, :image, :string, null: false
    change_column :games, :description, :text, null: false
  end
end
