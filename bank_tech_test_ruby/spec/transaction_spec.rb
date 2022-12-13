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
    it 'handles a deposit transaction' do
      account = Transaction.new([])
      result = account.deposit(200)
      expect(result[0][1]).to eq 200
    end

    it 'fails a non positive argument for amount' do
      account = Transaction.new([])
      expect { account.deposit(-200) }.to raise_error "amount must be a positive integer"
    end

    it 'fails a non integer argument for amount' do
      account = Transaction.new([])
      expect { account.deposit(3.5) }.to raise_error "amount must be a positive integer"
    end

  end

  context 'withdraw method' do
    it 'handles a withdraw transaction' do
      account = Transaction.new([])
      result = account.withdraw(200)
      expect(result[0][1]).to eq -200
    end

    it 'fails a non positive argument for amount' do
      account = Transaction.new([])
      expect { account.withdraw(-200) }.to raise_error "amount must be a positive integer"
    end

    it 'fails a non integer argument for amount' do
      account = Transaction.new([])
      expect { account.withdraw(3.5) }.to raise_error "amount must be a positive integer"
    end

  end

end