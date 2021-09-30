# frozen_string_literal: true

require_relative 'account'
# statement class
class Statement
  attr_accessor :account

  
  def initialize
    @account = Account.new
    @account_statement = @account.details
  end

  def credit_display(date, credit, balance)
    print "#{date} || #{credit.to_f} || || #{balance.to_f}"
  end

  def debit_display(date, credit, balance)
    print "#{date} || || #{credit.to_f} || #{balance.to_f}"
  end

  def account_print
    i = 0
    current = @account_statement.length - 1
    print 'date || credit || debit || balance' # label  account statement
    while i < @account_statement.length
      puts ''
      if (@account_statement[current][3]) == 'credit' # prints the deposited date, amount and balance
        credit_display(@account_statement[current][0], @account_statement[current][1], @account_statement[current][2])
      else # prints the withdrawn date, amount and balance
        debit_display(@account_statement[current][0], @account_statement[current][1], @account_statement[current][2])
      end
      current -= 1
      i += 1
    end
  end
end
