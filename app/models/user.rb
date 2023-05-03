class User < ApplicationRecord
    has_many :carts
    has_many :products, through: :carts


    has_secure_password

    validates :username, presence: true
    validates :username, uniqueness: true
    validates :username, length: { minimum: 4 }

    def add_random_review
        product_id=rand(1..20)
        username=self.username
        product=Product.find(product_id)
        review=Review.create(rev: ["Great product!", "Very satisfied with this product.", "A few issues, but pretty good!"].sample, rating: rand(1..5), username: username, product_id: product_id)
        review.save
    end
end
