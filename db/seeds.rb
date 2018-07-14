# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Country.create(name: "США")
Country.create(name: "Нидерланды")

Author.create(name: "Дэвид Макки", date_of_birth: Date.parse("Jan 02 1935"), country: Country.find_by_name("Англия"))
Author.create(name: "Роберт Макклоски", date_of_birth: Date.parse("Sep 15 1914"), date_of_death: Date.parse("Jun 30 2003"), country: Country.find_by_name("США"))
Author.create(name: "Макс Велтхейс", date_of_birth: Date.parse("May 22 1923"), date_of_death: Date.parse("Jan 25 2005"), country: Country.find_by_name("Нидерланды"))
Author.create(name: "Майкл Розен", date_of_birth: Date.parse("May 07 1946"), country: Country.find_by_name("Англия"))
Author.create(name: "Шел Силверстайн", date_of_birth: Date.parse("Sep 25 1930"), date_of_death: Date.parse("May 10 1999"), country: Country.find_by_name("США"))
Author.create(name: "Арнольд Лобел", date_of_birth: Date.parse("May 22 1933"), date_of_death: Date.parse("Dec 4 1987"), country: Country.find_by_name("США"))
Author.create(name: "Маргарет Уайз Браун", date_of_birth: Date.parse("May 23 1910"), date_of_death: Date.parse("Nov 13 1952"), country: Country.find_by_name("США"))