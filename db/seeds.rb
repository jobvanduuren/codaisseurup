# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

miriam = User.create!(email: "miriam@codaisseurbnb.com", password: "abcd1234")

event = Event.create!(name: "Pinkpop", description: "Pinkpop is een jaarlijks,
driedaags popfestival in Landgraaf, dat sinds 1970 normaal gesproken in het
weekeinde van Pinksteren plaatsvindt. Tot en met 2015 vond het viermaal in een
ander weekeinde plaats.Ook in 2016 zal het festival bij uitzondering niet
tijdens Pinksteren plaatsvinden.", location: "Landgraaf", price: 20.00,
capacity: 60000, includes_food: false, includes_drinks: false,
starts_at: Time.now, ends_at:Time.now,
active: true, user: miriam)
