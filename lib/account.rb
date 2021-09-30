# frozen_string_literal: true
require_relative 'statement'
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

  # def display
  #   statement = Statement.new
  #   statement.account_print
  #   # length = @details.length
  #   # i = 0 # iterating times
  #   # index = (length - 1)
  #   # print 'date || credit || debit || balance' # label for account statement
  #   # while i < length
  #   #   puts ''
  #   #   if (@details[index][3]) == 'credit'      # prints the deposited date, amount and balance
  #   #     print "#{@details[index][0]} || #{@details[index][1].to_f} || || #{@details[index][2].to_f}"
  #   #   elsif (@details[index][3]) == 'debit'       # prints the withdrawn date, amount and balance
  #   #     print "#{@details[index][0]} || || #{(@details[index][1]).to_f} || #{(@details[index][2]).to_f}"
  #   #   end
  #   #   index -= 1
  #   #   i += 1
  #   # end
  # end
end
