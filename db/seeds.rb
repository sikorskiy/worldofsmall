# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Country.create(name: "США")
Country.create(name: "СССР")
Country.create(name: "Германия")
Country.create(name: "Англия")
Country.create(name: "Франция")


Author.create(name: "Эрик Карл", date_of_birth: Date.parse("Jun 25 1929"), country: Country.find_by_name("США"))
Author.create(name: "Ротраут Сюзанне Бернер", date_of_birth: Date.parse("Jun 26 1948"), country: Country.find_by_name("Германия"))
Author.create(name: "Джулия Дональдсон", date_of_birth: Date.parse("Sep 16 1948"), country: Country.find_by_name("Англия"))
Author.create(name: "Эрве Тюлле", date_of_birth: Date.parse("Jun 28 1958"), country: Country.find_by_name("Франция"))
Author.create(name: "Ричард Скарри", date_of_birth: Date.parse("Jun 5 1919"), country: Country.find_by_name("США"), date_of_death: Date.parse("Apr 30 1994"))