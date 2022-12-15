# File: lib/statement.rb

class Statement

  def initialize(terminal)
    @terminal = terminal
    @statement = []
  end

  def get_header
    @statement << "date || credit || debit || balance"
  end

  def format_account(account) # adds two decimal places to the transactions columns and a separator depending on withdraw or despoit
    format_balance(account)
    account.each do |item|
      if item[1] > 0 
        item[1] = "%.2f" % item[1].to_s + " ||" # withdraw column
      else 
        item[1] = "|| " + "%.2f" % item[1].to_s # deposit column
      end
    end
  end

  def format_balance(account) # adds two decimal places to values in the balance column
    account.each do |item|
      item[2] = "%.2f" % item[2].to_s
    end
  end

  def create_statement(account)
    format_account(account)
    get_header
    account.reverse!
    account.each do |item|
      add_separators = item.join(" || ")
      @statement << add_separators
    end
    return @statement
  end

  def print_statement(account)
    create_statement(account)
    @statement.each do |item|
      @terminal.puts item
    end
  end

end