class Order < ApplicationRecord
    has_many :order_items

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true
    validates :address_1, presence: true
    validates :city, presence: true
    validates :country, presence: true

    # Allow extra attributes
    accepts_nested_attributes_for :order_items

    def add_from_cart(cart)
        cart.order_items.all.each do |i|
            self.order_items.new(product: i.product, quantity: i.quantity)
        end 
    end 


    def save_and_charge
        # Check form is valid
        if self.valid?

            # Create an instance of your API key (must be done in Rails 5.2+)
            Stripe.api_key = Rails.application.credentials.stripe[Rails.env.to_sym][:stripe_secret_key]

            # Make a charge
            # :: is a namespace, refers to Stripe's own 'Charge'
            Stripe::Charge.create(
                amount: self.total_price, 
                currency: "usd",
                source: self.stripe_token,
                description: "Order from" + self.email,
                statement_descriptor: "Another Pin Co" 
            ) 

            self.save
            
        else 
            false
        end


    rescue Stripe::CardError => e
        # Return error messages from Stripe in JSON
        @message = e.json_body[:error][:message]

        # self refers to this model, errors is built into Rails
        self.errors.add(:stripe_token, @message)

        # Return false to our controller
        false
    end



    # get total price as var, for use on this controller
    def total_price
        @total = 0

        order_items.each do |i|
            @total = @total + i.product.price * i.quantity
        end 

        @total
    end

    # Adds this function from cart.rb to order.rb model, so you can use it in your receipt
    def total_price_in_dollars
        @total = 0 

        order_items.all.each do |i|
            @total = @total + i.product.price_in_dollars * i.quantity
        end 

        return @total
    end 

end
