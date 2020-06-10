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

user4 = User.where(email: 'et00001@surrey.ac.uk').first
user4.delete if user4
user4 = User.create([firstname: 'Emma',
                lastname: 'Taylor',
                email: 'et00001@surrey.ac.uk',
                password: 'password'])

# Test products
product1 = Product.where(name: 'Gaming chair').first
product1.delete if product1
product1 = Product.new(name: 'Gaming chair', price: 80,
  description: 'Only a year old. Collection from Stag Hill campus.',
  user: user2.first)
product1.image.attach(io: File.open('test/fixtures/files/GamingChair.jpg'), filename: 'file.jpg')
product1.save
productCategory1 = ProductCategory.new(product: product1, category: Category.find_by_name('Furniture').first)
productCategory1.save

product2 = Product.where(name: 'Dining chair').first
product2.delete if product2
product2 = Product.new(name: 'Dining chair', price: 15,
  description: 'Two chairs, well looked after. Not sure what type of wood so don\'t ask.',
  user: user3.first)
product2.image.attach(io: File.open('test/fixtures/files/WoodenChair.jpg'), filename: 'file.jpg')
product2.save
productCategory2 = ProductCategory.new(product: product2, category: Category.find_by_name('Furniture').first)
productCategory2.save

product3 = Product.where(name: 'Rose Gold Headphones').first
product3.delete if product3
product3 = Product.new(name: 'Rose Gold Headphones', price: 50,
  description: 'NEW, UNWANTED GIFT.',
  user: user3.first)
product3.image.attach(io: File.open('test/fixtures/files/PinkHeadphones.jpg'), filename: 'file.jpg')
product3.save
productCategory3 = ProductCategory.new(product: product3, category: Category.find_by_name('Electronics').first)
productCategory3.save

product4 = Product.where(name: 'Bluetooth headphones / headset').first
product4.delete if product4
product4 = Product.new(name: 'Bluetooth headphones / headset', price: 30,
  description: 'For gaming, listening to music etc.',
  user: user2.first)
product4.image.attach(io: File.open('test/fixtures/files/Headset.jpg'), filename: 'file.jpg')
product4.save
productCategory4 = ProductCategory.new(product: product4, category: Category.find_by_name('Electronics').first)
productCategory4.save

product5 = Product.where(name: 'Citrus RUBIX Ticket').first
product5.delete if product5
product5 = Product.new(name: 'Citrus RUBIX Ticket', price: 2,
  description: 'I can\'t go anymore. Get yourself a bargin!',
  user: user1.first)
product5.image.attach(io: File.open('test/fixtures/files/Citrus.jpg'), filename: 'file.jpg')
product5.save
productCategory5 = ProductCategory.new(product: product5, category: Category.find_by_name('Event Tickets').first)
productCategory5.save

product6 = Product.where(name: 'BaByliss Hair Dryer').first
product6.delete if product6
product6 = Product.new(name: 'BaByliss Hair Dryer', price: 8,
  description: 'I found this in my stuff. Never used by me. Just want cash.',
  user: user2.first)
product6.image.attach(io: File.open('test/fixtures/files/Hairdryer.jpg'), filename: 'file.jpg')
product6.save
productCategory6 = ProductCategory.new(product: product6, category: Category.find_by_name('Health and Beauty').first)
productCategory6.save

product7 = Product.where(name: 'Paints').first
product7.delete if product7
product7 = Product.new(name: 'Paints', price: 7,
  description: 'Selection of paints in different colours',
  user: user1.first)
product7.image.attach(io: File.open('test/fixtures/files/Paints.jpg'), filename: 'file.jpg')
product7.save
productCategory7 = ProductCategory.new(product: product7, category: Category.find_by_name('Art').first)
productCategory7.save

product8 = Product.where(name: 'Gold Bangle').first
product8.delete if product8
product8 = Product.new(name: 'Gold Bangle', price: 60,
  description: 'REAL GOLD... I think',
  user: user3.first)
product8.image.attach(io: File.open('test/fixtures/files/Bangle.jpg'), filename: 'file.jpg')
product8.save
productCategory8 = ProductCategory.new(product: product8, category: Category.find_by_name('Jewelry').first)
productCategory8.save

product9 = Product.where(name: 'Nitendo Switch').first
product9.delete if product9
product9 = Product.new(name: 'Nitendo Switch', price: 100,
  description: 'Comes with 50 games!',
  user: user4.first)
product9.image.attach(io: File.open('test/fixtures/files/Switch.jpg'), filename: 'file.jpg')
product9.save
productCategory9 = ProductCategory.new(product: product9, category: Category.find_by_name('Video Games and Consoles').first)
productCategory9.save

product10 = Product.where(name: 'Hobbit').first
product10.delete if product10
product10 = Product.new(name: 'Hobbit', price: 4,
  description: 'Old book, probably rare',
  user: user3.first)
product10.image.attach(io: File.open('test/fixtures/files/HobbitBook.jpg'), filename: 'file.jpg')
product10.save
productCategory10 = ProductCategory.new(product: product10, category: Category.find_by_name('Books').first)
productCategory10.save

product11 = Product.where(name: 'Computer Science Book').first
product11.delete if product11
product11 = Product.new(name: 'Computer Science Book', price: 14.5,
  description: 'Never even opened.',
  user: user1.first)
product11.image.attach(io: File.open('test/fixtures/files/ComputerScienceBook.jpg'), filename: 'file.jpg')
product11.save
productCategory11 = ProductCategory.new(product: product11, category: Category.find_by_name('Books').first)
productCategory11.save

product12 = Product.where(name: 'Pens').first
product12.delete if product12
product12 = Product.new(name: 'Pens', price: 14.5,
  description: '12 coloured pens',
  user: user4.first)
product12.image.attach(io: File.open('test/fixtures/files/Sharpies.jpg'), filename: 'file.jpg')
product12.save
productCategory12 = ProductCategory.new(product: product12, category: Category.find_by_name('Art').first)
productCategory12.save

product13 = Product.where(name: 'Paint brushes').first
product13.delete if product13
product13 = Product.new(name: 'Paint brushes', price: 2,
  description: 'Campus collection only.',
  user: user1.first)
product13.image.attach(io: File.open('test/fixtures/files/Paintbrushes.jpg'), filename: 'file.jpg')
product13.save
productCategory13 = ProductCategory.new(product: product13, category: Category.find_by_name('Art').first)
productCategory13.save
