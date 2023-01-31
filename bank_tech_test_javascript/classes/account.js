class Account {

  constructor() {
    this.account = [];
    this.balance = 0;
  }

  getAccount() {
    return this.account
  }

  validateTransaction(transactionObject) {
    let currentBalance = this.account.map(x => x.transaction).reduce((a, b) => a + b, 0)
    if (currentBalance + transactionObject.transaction < 0) {
      throw 'Insufficient funds.'
    }
  }

  addTransaction(transactionObject) {
    this.validateTransaction(transactionObject)
    transactionObject.balance = this.getUpdatedBalance(transactionObject)
    this.account.push(transactionObject)
  }
  
  getUpdatedBalance(transactionObject) {
    this.balance = this.account.map(x => x.transaction).reduce((a, b) => a + b, 0) + transactionObject.transaction
    return this.balance
  }

}

module.exports = Account;