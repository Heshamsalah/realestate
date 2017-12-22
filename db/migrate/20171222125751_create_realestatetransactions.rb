class CreateRealestatetransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :realestatetransactions do |t|
      t.string :street
      t.string :city
      t.string :zip
      t.string :state
      t.integer :beds
      t.integer :baths
      t.integer :sq_ft
      t.string :category
      t.date :sale_date
      t.float :price
      t.float :latitude
      t.float :longtude

      t.timestamps
    end
  end
end
