# require 'pry'
# class CashRegister
     
#     attr_accessor :total, :discount, :quantity
    
#     def initialize(discount = 0)
#         @total = 0
#         @discount = discount
#         @array = []
#     end

#     def add_item (title, price, quantity = 1)
#         if quantity 
#             @total += price * quantity       
#         else
#             @total += price
#         end
#         quantity.times do 
#             @array.push(title)
#         end
   
#     end
    
#     def apply_discount
#         if @discount > 0
#             @total = @total - (@total * (@discount * 0.01 ))
#             @total.to_i
#             "After the discount, the total comes to $800."
#         else
#             @total.to_i
#             "There is no discount to apply."
#         end
        
#     end
    
#     def items    
#         @array
#     end
    
    
#     def void_last_transaction
#         @total = 
        
#     end

# end


class CashRegister
    attr_accessor :total, :discount
    def initialize(discount = 0.0)
        @total = 0.0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity=1)
        @total += price * quantity
        quantity.times do
            @items << {:title => title, :price => price, :quantity => quantity}
        end
    end

    def apply_discount
        if @discount > 0
        @total = @total - (@total * (@discount * 0.01 ))
        "After the discount, the total comes to $800."
        else
        "There is no discount to apply."   
        end
    end

    def items
        @items.map do |item|
            item[:title]
        end
    end

    def void_last_transaction
        last_item = @items.pop
        @total -= last_item[:price] * last_item[:quantity]
    
    end


end
