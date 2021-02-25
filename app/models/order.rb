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

end
