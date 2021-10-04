# frozen_string_literal: true

# class Account of customer which does three actions:deposit,withdraw and display.
require 'date'
class Account
  attr_accessor :balance, :date, :amount, :transaction

  def initialize
    @balance = 0.00 # float value
    @amount = 0.00
    @transaction = {}
  end

  def deposit(amount)
    @amount = amount
    @balance += @amount
    @account = [Date.today.strftime("%d/%m/%Y"), @amount, @balance]
    @transaction[:credit] = @account
  end

  def withdraw(amount)
    @amount = amount
    @balance -= @amount
    @account = [Date.today.strftime("%d/%m/%Y"), @amount, @balance, @card_action]
    @transaction[:debit] = @account
  end

  def account_statement
    print 'date || credit || debit || balance' # label  account statement
    reverse
  end

  private

  def reverse
    @transaction.reverse_each do | key, value |
      puts ''
      if key == :credit
        print "#{value[0]} || #{(value[1]).to_f} || || #{(value[2]).to_f}"
      elsif key == :debit
        print "#{value[0]} || || #{(value[1]).to_f} || #{(value[2]).to_f}"
      else
        print 'No account history to show'
      end
    end
  end
end
