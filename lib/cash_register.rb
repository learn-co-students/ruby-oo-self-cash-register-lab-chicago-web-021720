class CashRegister
    attr_accessor :discount, :total, :items

    def initialize(discount=0)
        self.total = 0.0
        self.discount = discount
        self.items = []
        @cart = []
    end

    def add_item(item, price, quantity=1)
        self.total += (price * quantity)
        @cart << {item => (price * quantity)}
        
        quantity.times do 
            self.items << item
        end 
    end

    def apply_discount 
        if self.discount != 0
            self.total = self.total * ((100 - self.discount)/100.0)
            "After the discount, the total comes to $#{self.total.to_i}."
        else 
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total -= @cart[-1].values[0]
    end
end
