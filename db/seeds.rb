# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
BulkDiscount.destroy_all

BulkDiscount.create!(percentage_discount: 20, quantity_threshold: 10, merchant_id: 1)
BulkDiscount.create!(percentage_discount: 30, quantity_threshold: 15, merchant_id: 1)
BulkDiscount.create!(percentage_discount: 15, quantity_threshold: 15, merchant_id: 1)
BulkDiscount.create!(percentage_discount: 40, quantity_threshold: 100, merchant_id: 1)
BulkDiscount.create!(percentage_discount: 35, quantity_threshold: 50, merchant_id: 2)
BulkDiscount.create!(percentage_discount: 15, quantity_threshold: 5, merchant_id: 2)
BulkDiscount.create!(percentage_discount: 20, quantity_threshold: 10, merchant_id: 3)
