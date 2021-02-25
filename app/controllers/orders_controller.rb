class OrdersController < ApplicationController

    def show
        @order = Order.find(params[:id])
    end 

    
    # the page we see
    def new 
        @order = Order.new

        # Set cart contents to order
        @order.add_from_cart(@current_cart)
    end 


    # the action of creating into the database
    def create
        @order = Order.new(form_params)

        # also adds the order's data to the db
        @order.add_from_cart(@current_cart)

        # if the order validates
        if @order.save
            # Resets the cart
            # reset_session 
            
            # flash[:success] = "Order completed"

            # redirect to #show page for this @order
            redirect_to order_path(@order)
        else
            # renders empty form again, showing all the errors
            render "new"
        end 

    end 


    def form_params
        params.require(:order).permit(:first_name, :last_name, :email,
        :country, :address_1, :address_2, :city, :postcode)
    end 

end
