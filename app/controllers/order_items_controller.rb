class OrderItemsController < ApplicationController

    def create
        # find the product
        @product = Product.find(params[:product_id])

        # quantity - comes from form params 
        @quantity = form_params[:quantity]

        # add the order_item to the cart
        @current_cart.order_items.create(product: @product, quantity: @quantity)

        flash[:success] = "You've added to your cart."

        redirect_to product_path(@product)
    end 


    # Update cart while you're in your cart
    def update
        # Find the product using :product_id param
        @product = Product.find(params[:product_id])

        # Find the order-item using a diff parameter of :id
        @order_item = OrderItem.find(params[:id])

        # Update the quantity
        @order_item.update(form_params)

        flash[:success] = "Thanks for updating your cart."

        redirect_to cart_path
    end 


    # this refs method: delete in carts/show.html.erb
    def destroy
        @product = Product.find(params[:product_id])
        @order_item = OrderItem.find(params[:id])

        @order_item.delete

        flash[:success] = "Item removed from cart."

        redirect_to cart_path
    end 


    def form_params
        params.require(:order_item).permit(:quantity)
    end 


end
