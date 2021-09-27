require './lib/bank.rb'
require 'spec_helper'

describe Bank do
    it " default  balance of the customer" do
        expect(subject.balance).to eq 0
    end
    it "on deposting balance is increased" do
        bank = Bank.new 
        balance = bank.deposit(1000,"10/01/2023")
        expect(bank.balance).to eq 1000
    end
    it "Display the current bank statement after deposting" do
        bank = Bank.new 
        balance = bank.deposit(1000,"10/01/2023")
        expect(bank.display).to eq "Deposited: 1000 on 10/01/2023"
    end
    it "depositing balance is increased" do
        bank = Bank.new
        bank.balance = 1000
        balance = bank.deposit(2000,"13/01/2023")
        expect(bank.balance).to eq 3000
    end
    it "Display the current bank statement after deposting" do
        bank = Bank.new
        bank.balance = 1000
        balance = bank.deposit(2000,"13/01/2023")
        expect(bank.display).to eq "Deposited: #{bank.amount} on #{bank.date}"
    end
    it "on withdrawing balance is decreased" do
        bank = Bank.new 
        bank.balance = 3000
        balance = bank.withdraw(500, "14/01/2023")
        expect(bank.balance).to eq 2500
    end
    it "Display the current bank statement after withdrawing" do
        bank = Bank.new
        bank.balance = 3000
        balance = bank.withdraw(500, "14/01/2023")
        expect(bank.display).to eq "Withdraw: #{bank.amount} on #{bank.date}"
    end
end