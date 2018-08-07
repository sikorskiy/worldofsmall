# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

['Лауреат медали Кальдекота', "Лауреат премии Андерсена", "Лауреат премии Астрид Линдгрен",
"Лауреат медали Ньюбери"].each { |c| Category.find_or_create_by(name: c) }

%w[Дания Швеция СССР США Франция].each { |c| Country.find_or_create_by(name: c) }

Author.find_or_create_by(name: 'Филип Стед') do |author|
  #author.date_of_birth = '25.09.1964' didn't find his date of birth
  author.country = Country.find_by_name('США')
  #author.description = ''
end

Author.find_or_create_by(name: 'Геннадий Спирин') do |author|
  author.date_of_birth = '25.12.1948'
  author.country = Country.find_by_name('СССР')
  author.description = 'Эмигрировал в США в 1992 году, один из наиболее известных русских иллюстраторов за границей'
end

Author.find_or_create_by(name: 'Свен Нурдквист') do |author|
  author.date_of_birth = '30.04.1946'
  author.country = Country.find_by_name('Швеция')
  author.description = 'Лауреат премии Астрид Линдгрен'
end

Author.find_or_create_by(name: 'Ларс Клинтинг') do |author|
  author.date_of_birth = '25.04.1948'
  author.date_of_death = '9.10.2006'
  author.country = Country.find_by_name('Швеция')
  #author.description = 'Гений детской литературы в СССР'
end

Author.find_or_create_by(name: 'Николай Носов') do |author|
  author.date_of_birth = '23.11.1908'
  author.date_of_death = '26.07.1976'
  author.country = Country.find_by_name('СССР')
  author.description = 'Гений детской литературы в СССР'
end


Author.find_or_create_by(name: 'Виктор Драгунский') do |author|
  author.date_of_birth = '1.12.1913'
  author.date_of_death = '6.05.1972'
  author.country = Country.find_by_name('СССР')
  #author.description = 'Гений детской литературы в СССР'
end

Author.find_or_create_by(name: 'Юрий Дружков') do |author|
  author.date_of_birth = '18.04.1927'
  author.date_of_death = '30.12.1983'
  author.country = Country.find_by_name('СССР')
  author.description = 'Настоящая фамилия - Постников'
end

Author.find_or_create_by(name: 'Ида Йессен') do |author|
  author.date_of_birth = '25.09.1964'
  author.country = Country.find_by_name('Дания')
  #author.description = ''
end


Author.find_or_create_by(name: 'Женевьева Юрье') do |author|
  author.date_of_birth = '24.08.1927'
  author.country = Country.find_by_name('Франция')
  #author.description = ''
end


Author.find_or_create_by(name: 'Борис Заходер') do |author|
  author.date_of_birth = '09.09.1918'
  author.date_of_death = '7.11.2000'
  author.country = Country.find_by_name('СССР')
  #author.description = ''
end

Author.find_or_create_by(name: 'Али Митгуш') do |author|
  author.date_of_birth = '21.08.1935'
  author.country = Country.find_by_name('Германия')
  author.description = 'Считается автором виммельбухов. Лауреат премии Андерсона 1978 года.'
end

Author.find_or_create_by(name: 'Владимир Сутеев') do |author|
  author.date_of_birth = '5.07.1903'
  author.date_of_death = '8.03.1993'
  author.country = Country.find_by_name('СССР')
end

Book.find_or_create_by(name: 'Пиратская книга') do |book|
  book.authors = Author.where(name: 'Али Митгуш')
  book.illustrator = 'Али Митгуш'
  #book.creation_year = 1963
  book.info = 'Пиратская книга - это книжка, которую можно "читать" очень много раз.
 В ней в мельчайших деталях рассказывается про то, как пираты грабят корабль, куда
девают награбленное, как устроен их быт. В конце книги добро побеждает зло и военный
корабль приходит на пиратский остров и восстанавливает справедливость. Как и в большинстве
виммельбухов очень много детальных картинок. Где-то смешных, где-то спорных, но они про
про наш мир, с которым так или иначе сталкивается ребенок.'
  book.publishing_house = 'Мелик-Пашаев'
  book.start_age = 2
  book.finish_age = 8
  book.user = User.where(name: 'Василий', lastname: 'Сикорский').first
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