# File: lib/account.rb

class Account

  def initialize
    @balance = 0
    @account = []
  end

  def add_transaction(transaction)
    @account << transaction
  end

  def account
    return @account
  end

  def balance
    return @balance
  end

end