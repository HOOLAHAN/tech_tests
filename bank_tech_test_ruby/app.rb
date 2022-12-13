# File: app.rb

require_relative './lib/transaction'
require_relative './lib/account'
require_relative './lib/statement'

account = Account.new

transaction = Transaction.new
transaction_1 = transaction.deposit(200)
account.add_transaction(transaction_1)

transaction = Transaction.new
transaction_2 = transaction.deposit(400)
account.add_transaction(transaction_2)

transaction = Transaction.new
transaction_3 = transaction.withdraw(100)
account.add_transaction(transaction_3)

transaction = Transaction.new
transaction_4 = transaction.deposit(1000)
account.add_transaction(transaction_4)

transaction = Transaction.new
transaction_5 = transaction.deposit(200)
account.add_transaction(transaction_5)

transaction = Transaction.new
transaction_6 = transaction.withdraw(200)
account.add_transaction(transaction_6)

update_account = account.add_balance

statement = Statement.new(Kernel)
statement.create_statement(update_account)

statement.print_statement
