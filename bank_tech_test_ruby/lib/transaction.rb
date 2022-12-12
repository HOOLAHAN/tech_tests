# File: lib/transaction.rb

class Transaction

  def initialize(account)
    @account = account
  end

  def get_date
    return Time.now.strftime('%m/%d/%Y')
  end

  def deposit(ammount)
    transaction = []
    transaction << get_date << ammount
    @account << transaction
  end

end