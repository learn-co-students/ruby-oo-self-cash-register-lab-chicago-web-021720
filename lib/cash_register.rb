
require 'pry'
class CashRegister
    attr_accessor :discount, :total, :quantity
    def initialize(discount=0)
        @total=0
        @discount=discount
        @array=[]
    end

    def add_item(title, price, quantity=1)
        @total+=price*quantity
        quantity.times do 
            @array.push(title)
        end
        @last_price=price*quantity
    end

    def apply_discount
        if @discount==0
            return "There is no discount to apply."
        else
            @total-=(discount*0.01)*total
            @total=@total.to_int
            return "After the discount, the total comes to $#{total}."
        end
    end
    def items
        return @array
    end

    def void_last_transaction
        @array.pop
        @total-=@last_price
        if @array.length==0
            @total=0.0
        end
    end

end
