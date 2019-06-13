# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all if Rails.env.development?
AdminUser.destroy_all
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
AdminUser.create!(email: 'admin@rails.com', password: '6Lgtt4Pvh9yYuss', password_confirmation: '6Lgtt4Pvh9yYuss') if Rails.env.production?
admin = User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password', username: 'admin', role: :admin) if Rails.env.development?
User.create!(email: 'usuario@example.com', password: '123456', password_confirmation: '123456', username: 'usuario')
Map.create!(center: '(-34.1752828573063, -69.7947257582627)', glaciar_rock: true, user: admin)
Map.create!(center: '(-33.58385020722072, -70.14348598109588)', glaciar_rock: false, user: admin)
