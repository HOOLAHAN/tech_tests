# File: lib/transaction.rb

class Transaction

  def initialize(account)
    @account = account
  end

  def get_date
    return Time.now.strftime('%m/%d/%Y')
  end

  def check_amount_valid(amount)
    fail "amount must be a positive integer" unless amount > 0 && amount.to_f % 2 == 0
  end

  def deposit(amount)
    check_amount_valid(amount)
    transaction = []
    transaction << get_date << amount
    @account << transaction
  end

  def withdraw(amount)
    check_amount_valid(amount)
    transaction = []
    transaction << get_date << - amount
    @account << transaction
  end

end