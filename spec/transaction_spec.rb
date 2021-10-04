# frozen_string_literal: true

require './lib/transaction'
require 'spec_helper'

describe Transaction do
    
    it 'Display the current bank statement after money credited to account with balance amount of 1000' do
        account = double("account")
        allow(account).to receive(:transaction).and_return('13/01/2021', 1000.0, 1000.0, 'credit')
        transaction = Transaction.new(account)
        expect { transaction.account_statement }.to output('date || credit || debit || balance
  13/01/2023 || 1000.0 || || 1000.0').to_stdout
      end
      it 'Display the current bank statement after money withdrawn' do
        account.balance = 3000
        account.withdraw(500, '14/01/2023')
        expect { account.account_statement }.to output('date || credit || debit || balance
  14/01/2023 || || 500.0 || 2500.0').to_stdout
      end
      it 'Displays the full bank trasaction made by the customer' do
        account.deposit(1000, '10/01/2023')
        account.deposit(2000, '13/01/2023')
        account.withdraw(500, '14/01/2023')
        expect { account.account_statement }.to output('date || credit || debit || balance
  14/01/2023 || || 500.0 || 2500.0
  13/01/2023 || 2000.0 || || 3000.0
  10/01/2023 || 1000.0 || || 1000.0').to_stdout
      end


end