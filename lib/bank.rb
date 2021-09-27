class Bank
    attr_accessor :balance, :date, :amount
    def initialize
      @balance = 0
      @date = ""
      @amount = 0

    end

    def deposit(amount, date)
        @amount = amount
        @balance += @amount
        @date = date
        @state = true
    end

    def withdraw(amount, date)
      @amount = amount
      @balance -= @amount
      @date = date
      withdraw = true
    end

    def display
      if @state == true
        return "Deposited: #{@amount} on #{@date}"
      else
        return "Withdraw: #{@amount} on #{@date}"
      end
    end

end