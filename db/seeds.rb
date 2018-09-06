# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Ship.create(name: "Nemo")
Ship.create(name: "The Flying Dutchman")
Ship.create(name: "The Black Pearl")

Port.create(name: "Port 1", location: "The Bahamas")
Port.create(name: "Port 2", location: "St. Marteen")
Port.create(name: "Port 3", location: "Labodee")

Excursion.create(title: "Rock Climbing", duration: 1, port_id: 1)
Excursion.create(title: "Water Park", duration: 3, port_id: 2)
Excursion.create(title: "Horse Back Riding", duration: 2.5, port_id: 3)
