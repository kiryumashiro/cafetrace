# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# ゲスト会員ユーザーを作成
# Customer.create!(
#   email: 'guest_member@example.com',
#   encrypted_password: 'password'
# )

# 管理者のログイン情報
 Admin.create!(
     email: 'admin@example.com',
     password: 'aaasss'
     )