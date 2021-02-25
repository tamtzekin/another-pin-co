class Cart < ApplicationRecord
    has_many :order_items

    def total_quantity
        @item_count = 0 

        order_items.all.each do |i| 
            @item_count = @item_count + i.quantity
        end 

        # or you can just @item_count and it will return
        return @item_count
    end


    def total_price
        @total = 0
        
        order_items.all.each do |i|
            @total = @total + i.product.price * i.quantity
        end 

        return @total
    end 


    def total_price_in_dollars
        @total = 0 

        order_items.all.each do |i|
            @total = @total + i.product.price_in_dollars * i.quantity
        end 

        return @total
    end 

end 
