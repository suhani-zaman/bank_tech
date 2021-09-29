require './lib/bank.rb'
require 'spec_helper'

describe Bank do
    subject(:bank) {Bank.new}
    it "customer bank balance, checks if there's an account created" do
        expect(subject.balance).to eq 0
    end

    it "customer deposits money to the account on the specified date" do
        bank.deposit(1000,"10/01/2023")
        expect(bank.balance).to eq 1000
    end
    it "Display the current bank statement after crediting money " do
        bank.deposit(1000,"10/01/2023")
        expect{bank.display}.to output('date || credit || debit || balance
10/01/2023 || 1000.0 || || 1000.0').to_stdout
    end
    it "customer credits money to the existing account on specified date " do
        bank.balance = 1000
        bank.deposit(2000,"13/01/2023")
        expect(bank.balance).to eq 3000
    end
    it "Display the current bank statement after money credited to account with balance amount of 1000 " do
        bank.balance = 1000
        bank.deposit(2000,"13/01/2023")
        expect{bank.display}.to output('date || credit || debit || balance
13/01/2023 || 2000.0 || || 3000.0').to_stdout
    end
    it "customer withraws money from the bank on the specified date" do
        bank.balance = 3000
        bank.withdraw(500, "14/01/2023")
        expect(bank.balance).to eq 2500
    end
    it "Display the current bank statement after money withdrawn" do
        bank.balance = 3000
        bank.withdraw(500, "14/01/2023")
        expect{bank.display}.to output('date || credit || debit || balance
14/01/2023 || || 500.0 || 2500.0').to_stdout
    end
    it "Displays the full bank trasaction made by the customer" do
        bank.deposit(1000,"10/01/2023")
        bank.deposit(2000,"13/01/2023")
        bank.withdraw(500, "14/01/2023")
        expect{bank.display}.to output('date || credit || debit || balance
14/01/2023 || || 500.0 || 2500.0
13/01/2023 || 2000.0 || || 3000.0
10/01/2023 || 1000.0 || || 1000.0').to_stdout
    end
end