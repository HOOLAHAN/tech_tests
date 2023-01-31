class Transaction {

  constructor(transaction, date) {
    this.transaction = transaction;
    this.date = date;
  }

  getDate() {
    return new Date().toLocaleDateString()
  }

  withdraw(amount) {
    this.validateArgument(amount)
    this.date = this.getDate()
    this.transaction = -amount;
  }

  deposit(amount) {
    this.validateArgument(amount)
    this.date = this.getDate()
    this.transaction = amount;
  }

  validateArgument(amount) {
    if (isNaN(amount) === true || amount % 1 !== 0 ) {
      console.log("Invalid input. Transaction amount must be an integer.")
      throw 'Invalid input. Transaction amount must be an integer.'
    }
  }
  
}

module.exports = Transaction;