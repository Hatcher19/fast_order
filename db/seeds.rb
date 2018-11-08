# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create( email: 'daniel@piratebayprinting.com', password: 'password', role: 'admin' )
User.create( email: 'joey@piratebayprinting.com', password: 'password', role: 'admin' )
User.create( email: 'pat@piratebayprinting.com', password: 'password', role: 'admin' )
# Product.create( product_category: 'hard goods', name: 'ua football' )
# Product.create( product_category: 'hard goods', name: 'field striper' )
# Product.create( product_category: 'hard goods', name: 'pylons(4)' )
# Product.create( product_category: 'hard goods', name: 'disc cones' )
# Product.create( product_category: 'hard goods', name: 'flag belts' )