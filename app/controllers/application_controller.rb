class ApplicationController < ActionController::Base

    # set the cart up on any page of the site
    before_action :current_cart

    # access to views
    helper_method :current_cart

    def current_cart    
        # if customer is on the site, give them a cart
        # if they have one, keep it

        if session[:cart_id].present?
            @current_cart = Cart.find(session[:cart_id])

        else
            # they dont have a cart

            # Cart.create is Cart.new + Cart.save
            @current_cart = Cart.create
            # assign the customer a cart
            session[:cart_id] = @current_cart.id
        end 
    end 

end
