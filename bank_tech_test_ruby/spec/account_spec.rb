# File: spec/account_spec.rb

require_relative '../lib/account'

describe 'Account class' do

  it 'intializes an empty account array' do
    result = Account.new
    expect(result.show_account).to eq []
  end

  it 'adds transactions to the account and calls balance add_balance method to append the balance' do
    result = Account.new
    transaction_double_1 = ["09/12/2022", 200]
    transaction_double_2 = ["10/12/2022", 400]
    result.add_transaction(transaction_double_1)
    result.add_transaction(transaction_double_2)
    expect(result.show_account).to eq [["09/12/2022", 200, 200], ["10/12/2022", 400, 600]]
  end

end