class CreateStores < ActiveRecord::Migration[5.0]
  def change
    create_table :stores do |t|
      t.string :store_name
      t.string :store_description
      t.text :store_bio
      t.text :main_image
      t.text :thumb_image
      t.string :street_address
      t.string :zip
      t.string :city
      

      t.timestamps
    end
  end
end
