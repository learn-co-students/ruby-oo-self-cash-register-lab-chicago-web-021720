class CashRegister

    attr_accessor :total, :discount, :items, :last_transaction

    def initialize(discount=nil)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(item, price, quantity=1)
        @total += price * quantity
        @items += Array.new(quantity, item)
        @last_transaction = {item: item, price: price, quantity: quantity}
    end

    def apply_discount
        if @discount
            @total -= (total * discount.to_f/100).to_i
            "After the discount, the total comes to $#{@total}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        # Remove the items from the items list
        items.pop(last_transaction[:quantity])

        # Update the total
        @total -= last_transaction[:quantity] * last_transaction[:price]
        if total < 0
            total = 0.0
        end
    end

end

