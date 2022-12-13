# File: spec/statement_spec.rb

describe 'Statement class' do
  it 'builds a statement using the create_statement method' do
    statement_test = Statement.new
    account_double = [["09/12/2022", 200, 200], ["10/12/2022", 300, 500], ["11/12/2022", -100, 400]]
    result = statement_test.create_statement(account_double)
    expect(result).to eq ["date || credit || debit || balance", "11/12/2022 || || -100 || 400", "10/12/2022 || 300 || || 500", "09/12/2022 || 200 || || 200"]
  end
end