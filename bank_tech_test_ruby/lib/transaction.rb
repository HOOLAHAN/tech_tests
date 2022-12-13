# File: lib/transaction.rb

class Transaction

  def initialize
    @transaction = []
  end

  def get_date
    return Time.now.strftime('%d/%m/%Y')
  end

  def check_amount_valid(amount)
    fail "amount must be a positive integer" unless (amount === amount.to_i) && amount > 0 && amount.to_f % 2 == 0
  end

  def deposit(amount)
    check_amount_valid(amount)
    @transaction << get_date << amount
  end

  def withdraw(amount)
    check_amount_valid(amount)
    @transaction << get_date << - amount
  end

end