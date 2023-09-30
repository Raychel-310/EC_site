Admin.create!(
  email: "a@gmail.com",
  password: "reirei"
)

Genre.create!(
[
  {
    name: "ケーキ",
  },
  {
    name: "プリン",
  },
  {
    name: "キャンディ",
  },
  {
    name: "焼き菓子",
  },
 ]
)

Item.create!(
 [
  {
    genre_id: 1,
    item_name: "チーズケーキ",
    explanation: "チーズケーキはチーズケーキでも、ニューヨークチーズケーキです。。",
    unit_price_without_tax: 1000,
    sale_status: 0,
    image: open("./app/assets/images/cheesecake.jpg")
  },
  {
    genre_id: 1,
    item_name: "チョコレートケーキ",
    explanation: "ただのチョコレートケーキです。",
    unit_price_without_tax: 800,
    sale_status: 0,
    image: open("./app/assets/images/chocolatecake.jpg")
  },
  {
    genre_id: 2,
    item_name: "クッキー",
    explanation: "クマにもらったクッキーです。",
    unit_price_without_tax: 1000,
    sale_status: 0,
    image: open("./app/assets/images/cookie.jpg")
  }
  ]
  )



# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
