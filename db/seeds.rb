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

#seed rating of each product
#create 3 random users
User.create(username: "John Smith", password: "newpass", password_confirmation: "newpass")
User.create(username: "Alex Jones", password: "newpass", password_confirmation: "newpass")
User.create(username: "Becky Savannah", password: "newpass", password_confirmation: "newpass")
#have 3 random users start putting in random ratings to each product

10.times do
    puts ("adding random review")
    User.all.first.add_random_review
end
10.times do
    puts ("adding random review")
    User.all.second.add_random_review
end
10.times do
    puts ("adding random review")
    User.all.third.add_random_review
end

#take average and update ratings
Product.all.each do |p|
    totalRatings=0
    totalRatingCount=0
    p.reviews.each do |r|
        totalRatings+=r.rating
        totalRatingCount+=1
    end
    if totalRatingCount > 0
        p.update(rating: (totalRatings/totalRatingCount).to_i)
    end
end
