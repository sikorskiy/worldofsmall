# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Author.find_or_create_by(name: 'Владимир Сутеев') do |author|
  author.date_of_birth = '5.07.1903'
  author.date_of_death = '8.03.1993'
  author.country = Country.find_by_name('СССР')
end

Book.find_or_create_by(name: 'Сказки и картинки') do |book|
  book.authors = Author.where(name: 'Владимир Сутеев')
  book.illustrator = 'Владимир Сутеев'
  book.creation_year = 1963
  book.info = 'Эта книга живет на свете уже много-много лет. И если ты
    возьмешь ее в руки и покажешь своей бабушке, она воскликнет: "Ой! Ну надо же!
    Я тоже читала ее в детстве!" Эту книгу придумал, написал и нарисова Владимир
    Григорьевич Сутеев, известный художник-мультипликатор, и назвал "Сказки и
    картинки". Сказки в ней получились с такими радостными и яркими картинками,
    что сразу полюбились всем. Полюби их и ты, ведь они добрые и веселые. Потом
    (когда вырастешь) расскажешь их своим детям и внукам.'
  book.publishing_house = 'Малыш'
  book.start_age = 2
  book.finish_age = 8
  book.user = User.where(name: 'Василий', lastname: 'Сикорский').first
end

Book.find_or_create_by(name: 'Город добрых дел') do |book|
  book.authors = Author.where(name: 'Ричард Скарри')
  book.illustrator = 'Ричард Скарри'
  book.translator = 'Татьяна Носова'
  book.creation_year = 1968
  book.info = 'Эта книга показывает и рассказывает о том, что занятые люди делают целый день
    для того, чтобы строились дома, плавали корабли, летали самолеты, росла еда и дома
    поддерживались в порядке. На английском языке книга буквально называется "Что люди
    делают целый день?" А автор за свою жизнь написал более 300 книг, которые издались
    суммарным тиражом более 100 (!!!) миллионов экземпляров.'
  book.publishing_house = 'Карьера Пресс'
  book.start_age = 3
  book.finish_age = 8
  book.user = User.where(name: 'Василий', lastname: 'Сикорский').first
end