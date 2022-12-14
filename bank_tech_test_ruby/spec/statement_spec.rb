# File: spec/statement_spec.rb

describe 'Statement class' do
  it 'builds a statement using the create_statement method' do
    terminal = double :terminal
    statement_test = Statement.new(terminal)
    account_double = [["09/12/2022", 200, 200], ["10/12/2022", 300, 500], ["11/12/2022", -100, 400]]
    result = statement_test.create_statement(account_double)
    expect(result).to eq ["date || credit || debit || balance", "11/12/2022 || || -100.00 || 400.00", "10/12/2022 || 300.00 || || 500.00", "09/12/2022 || 200.00 || || 200.00"]
  end

  it 'builds a statement and prints the statement line by line' do
    terminal = double :terminal
    expect(terminal).to receive(:puts).with("date || credit || debit || balance").ordered
    expect(terminal).to receive(:puts).with("11/12/2022 || || -100.00 || 400.00").ordered
    expect(terminal).to receive(:puts).with("10/12/2022 || 300.00 || || 500.00").ordered
    expect(terminal).to receive(:puts).with("09/12/2022 || 200.00 || || 200.00").ordered
    
    account_double = [["09/12/2022", 200, 200], ["10/12/2022", 300, 500], ["11/12/2022", -100, 400]]
    statement_test = Statement.new(terminal)
    statement_test.print_statement(account_double)
  end

  it 'resets the account array after printing the statement so that further transactions can be added' do
    terminal = double :terminal
    formatted_account_double = [["11/12/2022", "200.00", "200.00"], ["10/12/2022", "300.00", "500.00"], ["09/12/2022", "-100.00", "400.00"]]
    result = Statement.new(terminal).clean_up_account(formatted_account_double)
    expect(result).to eq [["09/12/2022", -100, 400], ["10/12/2022", 300, 500], ["11/12/2022", 200, 200]]
  end

end