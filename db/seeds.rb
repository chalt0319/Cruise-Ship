# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Passenger.destroy_all
Port.destroy_all
Ship.destroy_all
Excursion.destroy_all

p = Port.create(name: "Port 1", location: "The Bahamas")
st = Port.create(name: "Port 2", location: "St. Marteen")
l = Port.create(name: "Port 3", location: "Labodee")

Ship.create(name: "Nemo", capacity: 300, number_of_swimming_pools: 2, kid_friendly: true, casino: false, zip_line: true)
Ship.create(name: "The Flying Dutchman", capacity: 500, number_of_swimming_pools: 3, kid_friendly: true, casino: false, zip_line: false)
Ship.create(name: "The Black Pearl", capacity: 600, number_of_swimming_pools: 4, kid_friendly: false, casino: true, zip_line: true)

Excursion.create(title: "Waterfall Hike", duration: 4, port_id: p.id)
Excursion.create(title: "Rock Climbing", duration: 1, port_id: p.id)
Excursion.create(title: "Jungle Tour", duration: 3, port_id: st.id)
Excursion.create(title: "Water Park", duration: 2, port_id: st.id)
Excursion.create(title: "Horse Back Riding", duration: 3, port_id: l.id)
Excursion.create(title: "Snorkling", duration: 2.5, port_id: l.id)
Excursion.create(title: "Wine Tasting", duration: 3, port_id: l.id)
