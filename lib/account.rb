# frozen_string_literal: true

# class Account of customer which does three actions:deposit,withdraw and display.
require 'date'
class Account
  attr_accessor :balance, :date, :amount, :transaction

  def initialize
    @balance = 0.00 # float value
    @amount = 0.00
    @transaction = Hash.new {|h,k| h[k]=[]}
  end

  def deposit(amount)
    @amount = amount
    @balance += @amount
    @account = [Date.today.strftime("%d/%m/%Y"), @amount, @balance]
    @transaction["credit"] << @account

  end

  def withdraw(amount)
    @amount = amount
    @balance -= @amount
    @account = [Date.today.strftime("%d/%m/%Y"), @amount, @balance, @card_action]
    @transaction["debit"] << @account
  end

  def account_statement
    puts 'date || credit || debit || balance' # label  account statement
    reverse
  end

  private

  def reverse
    @transaction.reverse_each do | key, value |
      if key == "credit"
        length = value.length
        i = (length -1)
        while i >= 0 
          puts "#{value[i][0]} || #{(value[i][1]).to_f} || || #{(value[i][2]).to_f}"
          i -= 1
        end
      elsif key == "debit"
        length = value.length
        i = (length -1)
        while i >= 0 
          puts "#{value[i][0]} || || #{(value[i][1]).to_f} || #{(value[i][2]).to_f}"
          i -= 1
        end
      else
        print 'No account history to show'
      end
    end
  end
end
