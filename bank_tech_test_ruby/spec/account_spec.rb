# File: spec/account_spec.rb

require_relative '../lib/account'

describe 'Account class' do

  it 'intializes an empty account array and a balance of 0' do
    result = Account.new
    expect(result.account).to eq []
    expect(result.balance).to eq 0
  end

  it 'adds transactions to the account' do
    result = Account.new
    transaction_double_1 = ["09/12/2022", 200]
    transaction_double_2 = ["10/12/2022", 400]
    result.add_transaction(transaction_double_1)
    result.add_transaction(transaction_double_2)
    expect(result.account).to eq [["09/12/2022", 200], ["10/12/2022", 400]]
  end

  it 'calculates the balance of the transactions in account' do
    test_account = Account.new
    transaction_double_1 = ["09/12/2022", 200]
    transaction_double_2 = ["10/12/2022", 400]
    test_account.add_transaction(transaction_double_1)
    test_account.add_transaction(transaction_double_2)
    result = test_account.balance
    expect(result).to eq 600
  end

end