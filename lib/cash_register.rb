class CashRegister
    attr_accessor :total, :last_transaction
    attr_reader :discount, :items

    def initialize(discount=nil)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity=1)
        self.total += price * quantity
        self.last_transaction = price * quantity
        quantity.times {@items << title}
    end

    def apply_discount
        if @discount
            self.total -= @total * (@discount / 100.0)
            return "After the discount, the total comes to $#{@total.to_i}."
        else
            return "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total -= @last_transaction
    end
end