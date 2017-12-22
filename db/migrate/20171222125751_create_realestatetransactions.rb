class CreateRealestatetransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :realestatetransactions do |t|
      t.string :street
      t.string :city
      t.string :zip
      t.string :state
      t.number :beds
      t.number :baths
      t.number :sq_ft
      t.string :type
      t.date :sale_date
      t.number :price
      t.number :latitude
      t.number :longtude

      t.timestamps
    end
  end
end
