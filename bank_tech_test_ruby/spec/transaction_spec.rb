# File: spec/transaction_spec

require_relative '../lib/transaction'

describe 'Transaction class' do

  context 'get_time method' do
    it 'returns the current time formatted to dd/mm/yyyy' do
      date = Transaction.new([]).get_date
      expect(date.length).to eq 10
      expect(date).to eq Time.now.strftime('%m/%d/%Y') # today's date
    end
  end

  context 'deposit method' do
    it 'handles a deposit to the account' do
      account = Transaction.new([])
      result = account.deposit(200)
      expect(result[0][1]).to eq 200
    end
  end

end