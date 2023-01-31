class Transaction {

  constructor(transaction, date) {
    this.transaction = transaction;
    this.date = date;
  }

  getDate() {
    return new Date().toLocaleDateString()
  }

  withdraw(amount) {
    this.date = this.getDate()
    this.transaction = -amount;
  }

  deposit(amount) {
    this.date = this.getDate()
    this.transaction = amount;
  }
  
}

module.exports = Transaction;