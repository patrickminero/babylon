# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p 'Destroying everything!'
Message.destroy_all
p 'Messages gone'
Chatroom.destroy_all
p 'Chats gone'
Review.destroy_all
p 'Reviews gone'
Booking.destroy_all
p 'Bookings gone'
Provider.destroy_all
p 'Providers gone'
User.destroy_all
p 'Users gone'


marta = User.create(username: 'Marta', email: 'marta@email.com', password: 'asdasd', password_confirmation: 'asdasd')
manuel = User.create(username: 'Manuel', email: 'manuel@email.com', password: 'asdasd', password_confirmation: 'asdasd')
delmy = User.create(username: 'Delmy', email: 'delmy@email.com', password: 'asdasd', password_confirmation: 'asdasd')
francisco = User.create(username: 'Francisco', email: 'francisco@email.com', password: 'asdasd', password_confirmation: 'asdasd')

p "#{User.count} created"