# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Country.create(name: "Швеция")
Country.create(name: "Венгрия")
Country.create(name: "Эстония")


Author.create(name: "Лена Андерсон", date_of_birth: Date.parse("May 28 1939"), country: Country.find_by_name("Швеция"))
Author.create(name: "Симмс Табак", date_of_birth: Date.parse("13.02.1932"), date_of_death: Date.parse("25.12.2011"), country: Country.find_by_name("США"))
Author.create(name: "Ян Ларри", date_of_birth: Date.parse("15.02.1900"), date_of_death: Date.parse("18.03.1977"), country: Country.find_by_name("СССР"))
Author.create(name: "Пал Бекеш", date_of_birth: Date.parse("27.03.1956"), date_of_death: Date.parse("28.05.2010"), country: Country.find_by_name("Венгрия"))
Author.create(name: "Морис Сендак", date_of_birth: Date.parse("10.06.1928"), date_of_death: Date.parse("8.05.2012"), country: Country.find_by_name("США"))
Author.create(name: "Арнольд Лобел", date_of_birth: Date.parse("22.05.1933"), date_of_death: Date.parse("4.12.1987"), country: Country.find_by_name("США"))
Author.create(name: "Ханс Аугусто Рей", date_of_birth: Date.parse("16.09.1898"), date_of_death: Date.parse("26.08.1978"), country: Country.find_by_name("США"))
Author.create(name: "Элси Хоумланд Минарик", date_of_birth: Date.parse("13.09.1920"), date_of_death: Date.parse("12.07.2012"), country: Country.find_by_name("США"))
Author.create(name: "Эно Рауд", date_of_birth: Date.parse("15.02.1928"), date_of_death: Date.parse("9.07.1996"), country: Country.find_by_name("Эстония"))
Author.create(name: "Маргарет Уайз Браун", date_of_birth: Date.parse("23.05.1910"), date_of_death: Date.parse("13.11.1952"), country: Country.find_by_name("США"))



