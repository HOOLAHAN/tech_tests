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

puts "First Statement:"
statement.print_statement(account.show_account)

account.add_transaction(transaction.withdraw(200))
account.add_transaction(transaction.deposit(600))
account.add_transaction(transaction.withdraw(250))

puts "Updated Statement:"
statement.print_statement(account.show_account)