class Bank
    attr_accessor :balance, :date, :amount
    def initialize
      @balance = 0.00
      @date = ""
      @amount = 0.00
      @display = []
      @statement = []
    end

    def deposit(amount, date)
        @amount = amount
        @balance += @amount
        @date = date
        @statement = [@date, @amount, @balance]
        @display.push(@statement)
    end

    def withdraw(amount, date)
      @amount = amount
      @balance -= @amount
      @date = date 
      @statement = [@date, @amount, @balance]
      @display.push(@statement)
    end

    def display
      l = @display.length
      i = 0
      print 'date || credit || debit || balance'
      while i < l do
        puts ""
        print ("#{@display[i][0]} || #{(@display[i][1]).to_f} || #{(@display[i][2]).to_f}")
        i += 1
      end
    end
end