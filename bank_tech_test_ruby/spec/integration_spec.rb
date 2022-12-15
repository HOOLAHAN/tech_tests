# File: spec/integration_spec.rb

require_relative '../lib/transaction'
require_relative '../lib/account'
require_relative '../lib/statement'


describe 'transaction - account class integration' do
  context 'when the account is initialized and a deposit is made' do
    it 'it updates the account array with the transaction including time and amount and balance' do
      test_account = Account.new

      test_transaction_1 = Transaction.new.deposit(200)
      test_account.add_transaction(test_transaction_1)

      test_transaction_2 = Transaction.new.deposit(300)
      test_account.add_transaction(test_transaction_2)

      date_today = Time.now.strftime('%d/%m/%Y')
      expect(test_account.show_account).to eq [[date_today, 200, 200], [date_today, 300, 500]]
    end
  end

  context 'when transactions have been made' do
    it 'it updates the account array with the running balance' do
      test_account = Account.new

      test_transaction_1 = Transaction.new.deposit(200)
      test_account.add_transaction(test_transaction_1)

      test_transaction_2 = Transaction.new.deposit(300)
      test_account.add_transaction(test_transaction_2)

      test_transaction_3 = Transaction.new.withdraw(100)
      test_account.add_transaction(test_transaction_3)

      test_account.add_balance
      result = test_account.show_account

      date_today = Time.now.strftime('%d/%m/%Y')
      expect(result).to eq [[date_today, 200, 200], [date_today, 300, 500], [date_today, -100, 400]]
    end
  end

  context 'when transactions have been made on the account and the create_statement method is called' do
    it 'it preapres a statement array showing the transactions and account balance formatted as required' do
      terminal = double :terminal
      test_account = Account.new

      test_transaction_1 = Transaction.new.deposit(200)
      test_account.add_transaction(test_transaction_1)

      test_transaction_2 = Transaction.new.deposit(300)
      test_account.add_transaction(test_transaction_2)

      test_transaction_3 = Transaction.new.withdraw(100)
      test_account.add_transaction(test_transaction_3)

      prepared_account = test_account.add_balance
      test_statement = Statement.new(terminal).create_statement(prepared_account)

      date_today = Time.now.strftime('%d/%m/%Y')
      expect(test_statement).to eq ["date || credit || debit || balance", "#{date_today} || || -100.00 || 400.00", "#{date_today} || 300.00 || || 500.00", "#{date_today} || 200.00 || || 200.00"]
    end
  end

  context 'when transactions have been made and the statement has been generated' do
    it 'allows further transactions to be made' do
      terminal = double :terminal
      test_account = Account.new
      test_transaction = Transaction.new
      test_statement = Statement.new(terminal)
      date_today = Time.now.strftime('%d/%m/%Y')

      # initial transactions
      test_account.add_transaction(test_transaction.deposit(200))
      test_account.add_transaction(test_transaction.deposit(400))

      # first statement
      expect(terminal).to receive(:puts).with("date || credit || debit || balance").ordered
      expect(terminal).to receive(:puts).with("#{date_today} || 400.00 || || 600.00").ordered
      expect(terminal).to receive(:puts).with("#{date_today} || 200.00 || || 200.00").ordered
      
      prepared_account = test_account.add_balance
      test_statement.print_statement(prepared_account)

      # further transactions
      test_account.add_transaction(test_transaction.withdraw(100))
      test_account.add_transaction(test_transaction.deposit(800))
      
      # updated statement
      expect(terminal).to receive(:puts).with("date || credit || debit || balance").ordered
      expect(terminal).to receive(:puts).with("#{date_today} || 800.00 || || 1300.00").ordered
      expect(terminal).to receive(:puts).with("#{date_today} || || -100.00 || 500.00").ordered
      expect(terminal).to receive(:puts).with("#{date_today} || 400.00 || || 600.00").ordered
      expect(terminal).to receive(:puts).with("#{date_today} || 200.00 || || 200.00").ordered

      prepared_account_2 = test_account.add_balance
      result_2 = test_statement.print_statement(prepared_account_2)
    end
  end

end