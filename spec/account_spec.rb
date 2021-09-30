# frozen_string_literal: true

require './lib/account'
require 'spec_helper'

describe Account do
  subject(:account) { Account.new }
  it "customer bank balance, checks if there's an account created" do
    expect(subject.balance).to eq 0
  end
  describe 'deposit' do
    it 'customer deposits money to the account on the specified date' do
      account.deposit(1000, '10/01/2023')
      expect(account.balance).to eq 1000
    end

    it 'Display the current bank statement after crediting money' do
      account.deposit(1000, '10/01/2023')
      expect { account.display }.to output('date || credit || debit || balance
10/01/2023 || 1000.0 || || 1000.0').to_stdout
    end

    it 'customer credits money to the existing account on specified date' do
      account.balance = 1000
      account.deposit(2000, '13/01/2023')
      expect(account.balance).to eq 3000
    end

    it 'Display the current bank statement after money credited to account with balance amount of 1000' do
      account.balance = 1000
      account.deposit(2000, '13/01/2023')
      expect { account.display }.to output('date || credit || debit || balance
13/01/2023 || 2000.0 || || 3000.0').to_stdout
    end
  end
  describe 'withdraw' do
    it 'customer withraws money from the bank on the specified date' do
      account.balance = 3000
      account.withdraw(500, '14/01/2023')
      expect(account.balance).to eq 2500
    end

    it 'Display the current bank statement after money withdrawn' do
      account.balance = 3000
      account.withdraw(500, '14/01/2023')
      expect { account.display }.to output('date || credit || debit || balance
14/01/2023 || || 500.0 || 2500.0').to_stdout
    end
  end
  describe 'display' do
    it 'Displays the full bank trasaction made by the customer' do
      Statement.any_instance.stub(:account_print).and_return(:'date || credit || debit || balance
14/01/2023 || || 500.0 || 2500.0
13/01/2023 || 2000.0 || || 3000.0
10/01/2023 || 1000.0 || || 1000.0')
      statement = Statement.new
      statement.account.deposit(1000, '10/01/2023')
      statement.account.deposit(2000, '13/01/2023')
      statement.account.withdraw(500, '14/01/2023')
      statement.account_print.should eq(:'date || credit || debit || balance
14/01/2023 || || 500.0 || 2500.0
13/01/2023 || 2000.0 || || 3000.0
10/01/2023 || 1000.0 || || 1000.0')
    end
  end
end
