# File: app.rb

require_relative './lib/transaction'
require_relative './lib/account'
require_relative './lib/statement'

account = Account.new
transaction = Transaction.new
statement = Statement.new(Kernel)

account.add_transaction(transaction.deposit(200))
account.add_transaction(transaction.deposit(400))
account.add_transaction(transaction.withdraw(100))
account.add_transaction(transaction.deposit(1000))
account.add_transaction(transaction.deposit(200))
account.add_transaction(transaction.withdraw(200))

statement.print_statement(account.show_account)
