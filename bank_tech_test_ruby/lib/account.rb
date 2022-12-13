# File: lib/account.rb

class Account

  def initialize
    @account = []
    @account_balance = 0
  end

  def add_transaction(transaction)
    @account << transaction
  end

  def show_account
    return @account
  end

  def add_balance
    @account.each do |item|
      @account_balance = @account_balance + item[1]
      item << @account_balance
    end
  end

end