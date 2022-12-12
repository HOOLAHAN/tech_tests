# File: spec/account_spec.rb

require_relative '../lib/account'

describe 'Account class' do

  it 'intializes an empty account array and a balance of 0' do
    result = Account.new
    expect(result.account).to eq []
    expect(result.balance).to eq 0
  end

end