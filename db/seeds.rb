# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

RatingType.create(rating_type: "Иллюстрации", description: "Качество, релевантность, оригинальность иллюстраций в книге")
RatingType.create(rating_type: "Содержание", description: "Качество, релевантность, оригинальность, полезность текста в книге")
RatingType.create(rating_type: "Общее впечатление", description: "Общее впечатление от книги, на основании реакции ребенка и собственных суждений")
