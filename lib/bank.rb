class Bank
    attr_accessor :balance, :date, :amount
    def initialize
      @balance = 0.00
      @date = ""
      @amount = 0.00
      @display = []
      @statement = []
      @state = ""
    end

    def deposit(amount, date)
        @amount = amount
        @balance += @amount
        @date = date
        @state = "credit"
        @statement = [@date, @amount, @balance, @state]
        @display.push(@statement)
        
    end

    def withdraw(amount, date)
      @amount = amount
      @balance -= @amount
      @date = date 
      @state = "debit"
      @statement = [@date, @amount, @balance, @state]
      @display.push(@statement)
      
    end

    def display
      l = @display.length
      i = 0
      n = l
      print 'date || credit || debit || balance'
      while i < l do
        puts ""
        if (@display[n-1][3]) == "credit"
          print ("#{@display[n-1][0]} || #{(@display[n-1][1]).to_f} || || #{(@display[n-1][2]).to_f}")
        end  
        if (@display[n-1][3])  == "debit"
          print ("#{@display[n-1][0]} || || #{(@display[n-1][1]).to_f} || #{(@display[n-1][2]).to_f}")
        end
        n -= 1
        i += 1
      end
    end
end