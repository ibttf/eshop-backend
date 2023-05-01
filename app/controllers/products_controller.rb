class ProductsController < ApplicationController
    def index
        products = Product.all
        render json: {
            products: products
        }
    end

    def show
        product = Product.find(params[:id])
            render json: product
    end

    def add_to_cart
        cartItems=Cart.where(["user_id = ? and product_id = ?", current_user.id, params[:id]])
        if logged_in? && current_user
            #if the product already exists in your cart, then you just add 1 to it.
            # if the product doesn't exist, then you create it.
            if cartItems.length>0
                #if the product already exists in the current user's cart, then just add 1 to current quantity
                cartItems.each {|cartItem| cartItem.update(quantity: cartItem.quantity + 1)}


            else
                #if the customer doesn't have a copy of the product, then create a Cart object with quantity 1
                current_user.products << Product.find(params[:id])

            end
            render json: current_user, status: :ok
        else
            render json: {error: "Must be logged in to add to cart"}, status: 401
        end
    end

end

