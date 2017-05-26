# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Profile.delete_all
Booking.delete_all
Theme.delete_all
Event.delete_all
User.delete_all

boeren_rock = Theme.create(name: "Boerenrock")
art_en_theatre = Theme.create(name: "Art and theatre")
popmusic = Theme.create(name: "Popmusic")
hardrock = Theme.create(name: "hardrock")
metal = Theme.create(name: "Metal")
arthouse_movies = Theme.create(name: "Arthouse movies")
hiphop_en_randb = Theme.create(name: "Hiphop and R&B")
alternative_rock = Theme.create(name: "Alternative rock")

miriam = User.create(email: "miriam@codaisseurbnb.com", password: "abcd1234")
wouter = User.create(email: "wouter@codaisseurbnb.com", password: "abcd1234")
matt = User.create(email: "matt@codaisseurbnb.com", password: "abcd1234")



event1 = Event.create(name: "Pinkpop", description: "Pinkpop is een jaarlijks,
driedaags popfestival in Landgraaf, dat sinds 1970 normaal gesproken in het
weekeinde van Pinksteren plaatsvindt. Tot en met 2015 vond het viermaal in een
ander weekeinde plaats.Ook in 2016 zal het festival bij uitzondering niet
tijdens Pinksteren plaatsvinden.", location: "Landgraaf", price: 20.00,
capacity: 60000, includes_food: false, includes_drinks: false,
starts_at: Time.now, ends_at:Time.now,
active: true, user: miriam, themes: [popmusic, alternative_rock])

event2 = Event.create(name: "Zwarte Cross", description: "The Zwarte Cross Festival
is the biggest paid festival in the Netherlands, and the biggest motor event in
the world. The 19th edition in 2015 had 197.450 visitors and the 20th edition in 2016
counted in at 220.000 visitors", location: "Landgraaf", price: 20.00,
capacity: 70000, includes_food: false, includes_drinks: true,
starts_at: Time.now, ends_at:Time.now,
active: true, user: wouter, themes: [boeren_rock, art_en_theatre])

event3 = Event.create(name: "Rock am Ring", description: "The Rock am Ring (German: Rock at the Ring)
and Rock im Park (German: Rock in the Park) festivals are two simultaneous rock
music festivals held annually.", location: "Landau", price: 40.00,
capacity: 50000, includes_food: true, includes_drinks: false,
starts_at: Time.now, ends_at:Time.now,
active: true, user: matt, themes: [hardrock, metal])

Booking.create(event: event1, user: wouter, price: 50, total: 100, starts_at: 10.days.from_now, ends_at: 12.days.from_now)
Booking.create(event: event1, user: matt, price: 50, total: 200, starts_at: 20.days.from_now, ends_at: 24.days.from_now)
