class CashRegister
attr_accessor :discount, :total, :items, :last_item

    def initialize(discount=nil)
        @total = 0
        @discount = discount
        @items = []
    end
    
    def add_item(title, price, quantity = 1)
        quantity.times { self.items << title }
        self.last_item = price * quantity
        self.total += (price * quantity)
    end
    
    def apply_discount
        if self.discount
            self.total -= self.total * self.discount / 100
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        puts self.items.length
        if self.items.length == 0
            puts "my size is 0"
            self.total = 0.0
        else
            self.total -= self.last_item
        end
    end
    
end