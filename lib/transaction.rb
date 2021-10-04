require_relative 'account'


class Transaction
  attr_accessor :account
  def initialize(account = Account.new)
    @account = account
  end


  def account_statement
    print 'date || credit || debit || balance' # label  account statement
    reverse
  end

private

  def reverse
    statement = @account.transaction
    statement.reverse_each do |d|
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