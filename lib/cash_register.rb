require 'pry'
class CashRegister
    attr_accessor :total, :discount, :items, :last_item


    def initialize(discount=0)
        @total = 0
        @discount = discount.to_f
        @items = []
        @last_item = 0.00
    end 

    def total
        @total
    end 

    def add_item(title, price, quantity=1)
        @total += (price * quantity)
        quantity.times { self.items << title }
        self.last_item = price * quantity
    end 

    def apply_discount
        if @discount == 0
            "There is no discount to apply."
        else 
        @total -= @total * (@discount / 100)
        "After the discount, the total comes to $#{@total.to_i}."
        end 
    end 

    def items
        @items
    end 

    def void_last_transaction
        @total -= @last_item

    end 


end 
