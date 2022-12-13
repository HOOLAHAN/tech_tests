# File: lib/account.rb

class Account

  def initialize
    @account = []
  end

  def add_transaction(transaction)
    @account << transaction
  end

  def account
    return @account
  end

  def balance
    account_balance = 0
    @account.each do |item|
      account_balance = account_balance + item[1]
    end
    return account_balance
  end

end