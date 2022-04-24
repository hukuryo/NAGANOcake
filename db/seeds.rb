# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# OrderDetail.create!(
#   item_id: 1,
#   order_id: 2,
#   price: 3,
#   quantity: 4,
#   production_status: 5
# )

# OrderDetail.create!(
#   item_id: 1,
#   order_id: 2,
#   price: 1,
#   quantity: 2,
#   production_status: 4
# )

Genre.create!(
  name:"ケーキ"
).items.create!(
  name: "ショートケーキ",
  introduction: "おいしいよ",
  price: 1000,
  is_acactive: true,
)