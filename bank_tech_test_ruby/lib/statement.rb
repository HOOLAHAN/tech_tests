# File: lib/statement.rb

class Statement

  def initialize(terminal)
    @terminal = terminal
    @statement = []
  end

  def get_header
    @statement << "date || credit || debit || balance"
  end

  def format_account(account)
    account.each do |item|
      if item[1] > 0
        item[1] = item[1].to_s + " ||"
      else
        item[1] = "|| " + item[1].to_s
      end
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

  def print_statement
    @statement.each do |item|
      @terminal.puts item
    end
  end

end