require 'pry'
class CashRegister
    attr_accessor :total, :discount, :title, :price, :quantity, :items, :last_transaction
    #item_info = []

    def initialize(discount=0)
        #initializes the total and discount 
        #everytime a new entry comes in, 
        #it returns with a total(0) and discount (20)
        @total = 0 
        @discount = discount
        @items = []

    end 

    def add_item(title, price, quantity=1)
        # Respect the initialize condition (instance variable=@) in 
        # order to get the total itself 
        # self - represents the context where you are at 
        # self is either an instance or class depending on how we are using it 
        

      self.total = self.total + (price * quantity)
      quantity.times do
      items << title 
      end
        self.last_transaction = price * quantity
    end
        
      #Order of operation , x = y + (z * a) 
      #Afterwards, the math will update the total
        
    def apply_discount 
        if discount != 0 
            float_discount = discount.to_f / 100
            
            #binding.pry
            discounted_amount = self.total * float_discount
            self.total = self.total - discounted_amount

             "After the discount, the total comes to $#{self.total.to_i}."

        else 
             "There is no discount to apply."
            
        end
        
    end

    def void_last_transaction
        self.total = self.total - self.last_transaction

    end 

      
      
    
       
    
        




end    