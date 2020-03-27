# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Seeds used to test elastic search

Product.__elasticsearch__.create_index!(force: true)

user = User.new
user.firstname = "test"
user.lastname = "test"
user.email = 'tt00000@surrey.ac.uk'
user.password = 'password'
user.encrypted_password = '#$taawktljasktlw4aaglj'
user.save!

Product.create!(name: 'Test product', description: 'DESC', price:1)
