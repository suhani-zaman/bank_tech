# frozen_string_literal: true

# class Account of customer which does three actions:deposit,withdraw and display.
class Account
  attr_accessor :balance, :date, :amount, :details

  def initialize
    @balance = 0.00 # float value
    @amount = 0.00
    @details = []
  end

  def deposit(amount, date)
    @amount = amount
    @balance += @amount
    @card_action = 'credit'
    @account = [date, @amount, @balance, @card_action]
    @details.push(@account)
  end

  def withdraw(amount, date)
    @amount = amount
    @balance -= @amount
    @card_action = 'debit'
    @account = [date, @amount, @balance, @card_action]
    @details.push(@account)
  end

  def display
    print 'date || credit || debit || balance' # label  account statement
    reverse
  end

  private

  def reverse
    @details.reverse_each do |d|
      puts ''
      case d[3]
      when 'credit' # prints the deposited date, amount and balance
        print "#{d[0]} || #{d[1].to_f} || || #{d[2].to_f}"
      when 'debit'  # prints the withdrawn date, amount and balance
        print "#{d[0]} || || #{(d[1]).to_f} || #{(d[2]).to_f}"
      else
        print 'No account history to show'
      end
    end
  end
end
