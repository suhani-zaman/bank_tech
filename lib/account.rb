# frozen_string_literal: true

# class Account of customer which does three actions:deposit,withdraw and display.
class Account
  attr_accessor :balance, :date, :amount, :transaction

  def initialize
    @balance = 0.00 # float value
    @amount = 0.00
    @transaction = []
  end

  def deposit(amount, date)
    @amount = amount
    @balance += @amount
    @card_action = 'credit'
    @account = [date, @amount, @balance, @card_action]
    @transaction.push(@account)
  end

  def withdraw(amount, date)
    @amount = amount
    @balance -= @amount
    @card_action = 'debit'
    @account = [date, @amount, @balance, @card_action]
    @transaction.push(@account)
  end

  def account_statement
    print 'date || credit || debit || balance' # label  account statement
    reverse
  end

  private

  def reverse
    @transaction.reverse_each do |d|
      puts ''
      case d[3]
      when 'credit'
        print "#{d[0]} || #{d[1].to_f} || || #{d[2].to_f}"
      when 'debit'
        print "#{d[0]} || || #{(d[1]).to_f} || #{(d[2]).to_f}"
      else
        print 'No account history to show'
      end
    end
  end
end
