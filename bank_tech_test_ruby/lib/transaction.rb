# File: lib/transaction.rb

class Transaction

  def initialize(account)
    @account = account
  end

  def get_date
    return Time.now.strftime('%m/%d/%Y')
  end

  def deposit(amount)
    transaction = []
    transaction << get_date << amount
    @account << transaction
  end

  def withdraw(amount)
    transaction = []
    transaction << get_date << - amount
    @account << transaction
  end

end