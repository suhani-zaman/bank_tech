class Bank
    attr_accessor :balance, :date, :amount
    def initialize
      @balance = 0.00              #float value
      @amount = 0.00
      @display = []
    end

    def deposit(amount, date)
        @amount = amount
        @balance += @amount
        @card_action = "credit"
        @account = [date, @amount, @balance, @card_action]
        @display.push(@account)
        
    end

    def withdraw(amount, date)
      @amount = amount
      @balance -= @amount
      @card_action = "debit"
      @account = [date, @amount, @balance, @card_action]
      @display.push(@account)
      
    end

    def display
      length = @display.length
      i = 0                                    #iterating times
      index = (length-1)
      print 'date || credit || debit || balance'   #label for account statement
      while i < length do
        puts ""
        if(@display[index][3]) == "credit"           #prints the deposited date, amount and balance
          print ("#{@display[index][0]} || #{@display[index][1].to_f} || || #{@display[index][2].to_f}")
        elsif(@display[index][3])  == "debit"       #prints the withdrawn date, amount and balance
          print ("#{@display[index][0]} || || #{(@display[index][1]).to_f} || #{(@display[index][2]).to_f}")
        end
        index -= 1
        i += 1
      end
    end
end