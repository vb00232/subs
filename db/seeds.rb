# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Seeds used to test elastic search

Product.__elasticsearch__.create_index!(force: true)

# Test user
user1 = User.where(email: 'aa00000@surrey.ac.uk').first
user1.delete if user1
user1 = User.create([firstname: 'test',
  lastname: 'test',
  email: 'aa00000@surrey.ac.uk',
  password: 'password',
  encrypted_password: '#$taawktljasktlw4aaglj'])

# Test product
product1 = Product.where(name: 'Test products').first
product1.delete if product1
product1 = Product.create([name: 'Name',
  description: 'Description',
  price: 1,
  user_id: user1.first.id])
