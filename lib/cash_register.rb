require 'pry'
class CashRegister
    attr_accessor :total, :discount, :price, :title, :bag, :transactions, :last_transaction
    attr_reader
    
    def initialize(discount = 0) #Q1 Any number works. But " " doesn't. Why?
      @total = 0.to_f
      @discount = discount.to_f
      @title = title
      @price = price
      @bag = []
      @transactions = []
      @last_transaction = 0.0
    end
        
    def add_item(title, price, count = 1)
         count.times {@bag << title} # string of items
        count.times {@transactions << price} # i want a total
        @last_transaction = (price * count)
        ##iterate into a hash { :title => "price, "count"}
        self.total += price * count
        ##^^ we need to keep track of -last- item
        
    end

    def apply_discount
        
        if @discount == 0
            return "There is no discount to apply."
        else    
            # discount_percentage = @discount/100.0
            # @total = @total - (@total * discount_percentage)
            @total *= ((100.0-@discount)/100.0) 
#binding.pry
            return "After the discount, the total comes to $#{self.total.to_i}."
        end
    end

    def items
        #in @bag, t listed c times in an array
        @bag
        # .flatten 
    end

    def void_last_transaction
       
        self.total = @transactions.sum - @last_transaction #array of all transactions
        
        # @transactions
        #binding.pry# remove [-1]
        #display total sans last item+price
        #self.total
        #return new total
    end
end


