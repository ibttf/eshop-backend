# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
products=RestClient.get("https://fakestoreapi.com/products")
products_array=JSON.parse(products)

products_array.each do |p|
    Product.create(title: p["title"], description: p["description"], price: p["price"], image: p["image"], category: p["category"])
end