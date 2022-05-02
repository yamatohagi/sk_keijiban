# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
50.times do |n|
  name = Faker::Name.name
  skype_id = Faker::Internet.email
  text = "Hogehoge"
  header = Faker::Internet.name

  Post.create(
    name: name,
    service_id: skype_id,
    text: text,
    title: header,
    password: 1111,
    display_color: ["pink",'green','blue'].sample,
    service_type: ["skype",'line'].sample
  )
end