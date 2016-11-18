# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.delete_all
#deletes all products for testing
Product.create(title: 'cellphone',
  description:
    %{<p>
      <em> Dit is een smartpone</em>
      met deze smartpone kan je bellen
      </p>},
    image_url: 'smartphones0.jpg',
    price: 3.50)

Product.create(title: '3 smartphones',
  description: 'these are multiple smartphones',
  image_url: 'smartphones1.jpg',
  price: 10.50)

Product.create(title: 'all the smartphones',
  description: %{<p> These are alot <b />
    of smartphones<p>},
  image_url: 'smartphones2.jpg',
  price: 9000.0)
#create smartphone mockdata
