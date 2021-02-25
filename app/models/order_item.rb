class OrderItem < ApplicationRecord
  # Product always needs to be there.
  # order and cart are optional.
  # A product doesnt have to be in an order or cart, but it always needs to be a product.
  belongs_to :order, optional: true
  belongs_to :cart, optional: true
  
  belongs_to :product
end
