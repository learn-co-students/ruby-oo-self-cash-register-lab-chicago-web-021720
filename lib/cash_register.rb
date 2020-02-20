class CashRegister
  attr_accessor :total, :discount
  def initialize(discount = 0.0)
    @total = 0.0
    @discount = discount
    @items = []
  end
  def add_item(title, price,quantity=1)
    @total += price*quantity
    quantity.times do
      @items << {:title => title, :price => price, :quantity => quantity}
    end
  end
  def apply_discount
    @total = @total*(1-discount*0.01)
    discount == 0 ? "There is no discount to apply." :
    "After the discount, the total comes to $800."
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
