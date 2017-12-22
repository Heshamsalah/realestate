# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'Sacramentorealestatetransactions.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

csv.each do |row|
    t = Realestatetransaction.new
    t.street    = row['street']
    t.city      = row['city']
    t.zip       = row['zip']
    t.state     = row['state']
    t.beds      = row['beds']
    t.baths     = row['baths']
    t.sq_ft     = row['sq_ft']
    t.category  = row['type']
    t.sale_date = row['sale_date']
    t.price     = row['price']
    t.latitude  = row['latitude']
    t.longtude  = row['longtude']
    t.save!
    puts "#{t.street}, #{t.city} saved"
  end
  
  puts "There are now #{Realestatetransaction.count} rows in the transactions table"