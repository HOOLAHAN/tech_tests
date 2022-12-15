# File: lib/statement.rb

class Statement

  def initialize(terminal)
    @terminal = terminal
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
    @statement = []
    format_account(account)
    get_header
    account.reverse!
    account.each do |item|
      add_separators = item.join(" || ")
      @statement << add_separators
    end
    return @statement
  end

  def print_statement(account) # calls the above methods and prints the account statement
    temp_account = account
    create_statement(temp_account)
    @statement.each do |item|
      @terminal.puts item
    end
    clean_up_account(account)
  end

  def clean_up_account(account) # re-format account array to be able to take further transactions
    account.each do |item|
      item.map! { |element| element.gsub('||', '')}
      item.map! { |element| element.gsub(' ', '')}
    end
    account.reverse!
    account.each { |item|
      item[1] = item[1].to_i
      item[2] = item[2].to_i 
    }
  end

end