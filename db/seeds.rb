# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Country.create(name: "Швеция")


Author.create(name: "Лена Андерсон", date_of_birth: Date.parse("May 28 1939"), country: Country.find_by_name("Швеция"))
Author.create(name: "Роберт Макклоски", date_of_birth: Date.parse("Sep 15 1914"), date_of_death: Date.parse("Jun 30 2003"), country: Country.find_by_name("США"))
