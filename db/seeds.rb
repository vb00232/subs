# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Seeds to add default categories
categories = ["Art", "Books", "Clothes", "Electronics", "Event Tickets",
  "Furniture", "Health and Beauty", "Jewelry", "Video Games and Consoles"]
for c in categories do
  cat = Category.where(name: c).first
  cat.delete if cat
  cat = Category.create([name: c])
end

# University of Surrey location
Place.create!([
{ "name": "University of Surrey", "latitude": "51.2423","longitude": "0.5905"},
])

# Seeds used to test elastic search
#Product.__elasticsearch__.create_index!(force: true)

# Test users
user1 = User.where(email: 'tw00001@surrey.ac.uk').first
user1.delete if user1
user1 = User.create([firstname: 'Tom',
  lastname: 'Wilson',
  email: 'tw00001@surrey.ac.uk',
  admin: true,
  password: 'password'])

user2 = User.where(email: 'ab12345@surrey.ac.uk').first
user2.delete if user2
user2 = User.create([firstname: 'Alex',
    lastname: 'Baker',
    email: 'ab12345@surrey.ac.uk',
    password: 'password'])

user3 = User.where(email: 'rk00001@surrey.ac.uk').first
user3.delete if user3
user3 = User.create([firstname: 'Rahmi',
        lastname: 'Khan',
        email: 'rk00001@surrey.ac.uk',
        password: 'password'])

# Test products
product1 = Product.where(name: 'Gaming chair').first
product1.delete if product1
product1 = Product.new
product1.name = "Gaming chair"
product1.price = 80
product1.description = "A product for testing SUBS"
product1.user = user1.first
product1.save
product1.image.attach(io: File.open('test/fixtures/files/TestImage.png'), filename: 'file.png')
