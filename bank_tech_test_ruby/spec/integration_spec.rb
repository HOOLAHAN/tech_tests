# File: spec/integration_spec.rb

require_relative '../lib/transaction'
require_relative '../lib/account'

describe 'transaction - account class integration' do
  context 'when the account is initialized and a deposit is made' do
    it 'it updates the account array with the transaction including time and amount' do
      test_account = Account.new

      test_transaction_1 = Transaction.new.deposit(200)
      test_account.add_transaction(test_transaction_1)

      test_transaction_2 = Transaction.new.deposit(300)
      test_account.add_transaction(test_transaction_2)

      date_today = Time.now.strftime('%d/%m/%Y')
      expect(test_account.account).to eq [[date_today, 200], [date_today, 300]]
    end
  end
end