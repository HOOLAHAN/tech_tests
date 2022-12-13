# File: spec/integration_spec.rb

require_relative '../lib/transaction'
require_relative '../lib/account'
require_relative '../lib/statement'


describe 'transaction - account class integration' do
  context 'when the account is initialized and a deposit is made' do
    it 'it updates the account array with the transaction including time and amount' do
      test_account = Account.new

      test_transaction_1 = Transaction.new.deposit(200)
      test_account.add_transaction(test_transaction_1)

      test_transaction_2 = Transaction.new.deposit(300)
      test_account.add_transaction(test_transaction_2)

      date_today = Time.now.strftime('%d/%m/%Y')
      expect(test_account.show_account).to eq [[date_today, 200], [date_today, 300]]
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
      test_account = Account.new

      test_transaction_1 = Transaction.new.deposit(200)
      test_account.add_transaction(test_transaction_1)

      test_transaction_2 = Transaction.new.deposit(300)
      test_account.add_transaction(test_transaction_2)

      test_transaction_3 = Transaction.new.withdraw(100)
      test_account.add_transaction(test_transaction_3)

      prepared_account = test_account.add_balance
      test_statement = Statement.new.create_statement(prepared_account)

      date_today = Time.now.strftime('%d/%m/%Y')
      expect(test_statement).to eq ["date || credit || debit || balance", "#{date_today} || || -100 || 400", "#{date_today} || 300 || || 500", "#{date_today} || 200 || || 200"]
    end
  end

end