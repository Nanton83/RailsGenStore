# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Distributor.destroy_all
Item.destroy_all
Store.destroy_all

Distributor.create!(user_name: "Nick", email: "Nick@email.com", password: "password")
Store.create!(name: "Nicks", location: "Wake Forest, NC")


10.times do 
    Item.create!(
        distributor_id: 1,
        store_id: 1,
        name: Faker::Appliance.equipment,
        brand_name: Faker::Appliance.brand,
        sku: Faker::Number.number(digits: 10),
        price: Faker::Number.decimal(l_digits: 2)
    )
end



