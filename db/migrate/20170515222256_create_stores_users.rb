class CreateStoresUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :stores_users do |t|
      t.references :user, foreign_key: true
      t.references :store, foreign_key: true
    end
  end
end
