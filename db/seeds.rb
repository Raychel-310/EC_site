Admin.create!(
  email: "i@gmail.com",
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

cheesecake_blob = ActiveStorage::Blob.create_after_upload!(
  io: File.open(Rails.root.join('db', 'images', 'cheesecake.jpg'), 'rb'),
  filename: 'cheesecake.jpg',
  content_type: 'image/jpeg' 
)

chocolatecake_blob = ActiveStorage::Blob.create_after_upload!(
  io: File.open(Rails.root.join('db', 'images', 'chocolatecake.jpg'), 'rb'),
  filename: 'chocolatecake.jpg',
  content_type: 'image/jpeg' 
)

madeleine_blob = ActiveStorage::Blob.create_after_upload!(
  io: File.open(Rails.root.join('db', 'images', 'madeleine.jpg'), 'rb'),
  filename: 'madeleine.jpg',
  content_type: 'image/jpeg' 
)

lollipop_blob = ActiveStorage::Blob.create_after_upload!(
  io: File.open(Rails.root.join('db', 'images', 'lollipop.jpg'), 'rb'),
  filename: 'lollipop.jpg',
  content_type: 'image/jpeg' 
)

Item.create!(
  [
    {
      genre_id: 1,
      name: "チーズケーキ",
      explanation: "チーズケーキはチーズケーキでも、ニューヨークチーズケーキです。",
      tax_excluded_price: 1000,
      is_sale: true, # 販売中の場合
      image: cheesecake_blob
    },
    {
      genre_id: 1,
      name: "チョコレートケーキ",
      explanation: "ただのチョコレートケーキです。",
      tax_excluded_price: 800,
      is_sale: true, # 販売中の場合
      image: chocolatecake_blob
    },
    {
      genre_id: 4,
      name: "マドレーヌ",
      explanation: "ただのマドレーヌです。",
      tax_excluded_price: 800,
      is_sale: true, # 販売中の場合
      image: madeleine_blob
    },
    {
      genre_id: 3,
      name: "ペロペロキャンディ",
      explanation: "LOLLIPOP!",
      tax_excluded_price: 800,
      is_sale: true, # 販売中の場合
      image: lollipop_blob
    }
    # 他の商品のデータも同様に追加できます。
  ]
)

# Item.create!(
# [
#   {
#     genre_id: 1,
#     name: "チーズケーキ",
#     explanation: "チーズケーキはチーズケーキでも、ニューヨークチーズケーキです。",
#     tax_excluded_price: 1000,
#     is_sale: true,
#     activestage: open("./db/images/cheesecake.jpg")
#   },
#   {
#     genre_id: 1,
#     name: "チョコレートケーキ",
#     explanation: "ただのチョコレートケーキです。",
#     tax_excluded_price: 800,
#     is_sale: true,
#     activestorage: open("./db/images/chocolatecake.jpg")
    
#   }
# #   # {
# #   #   genre_id: 2,
# #   #   name: "クッキー",
# #   #   explanation: "クマにもらったクッキーです。",
# #   # 　tax_excluded_price: 1000,
# #   #   is_sale: true,
# #   #   image: open("./app/assets/images/cookie.png")
# #   # }
#   ]
#   )



# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
