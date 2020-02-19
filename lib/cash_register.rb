class CashRegister
    attr_accessor :total, :discount, :items, :add_item, :apply_discount, :void_last_transaction

    def initialize(discount = nil)
        @total = 0
        @discount = discount
        @items = []
        @last_price = 0
        @last_quant = 0
    end

    def add_item(item, price, quantity = 1)
        quantity.times {
            @items << item
            @total += price
            @last_price = price
        }
        @last_quant = quantity
    end

    def apply_discount
        if discount
            @total *= 1.0 - @discount / 100.0
            "After the discount, the total comes to $#{@total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        @last_quant.times {
            @items.pop
            @total -= @last_price
        }
    end

end