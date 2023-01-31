class Account {

  constructor() {
    this.account = [];
    this.balance = 0;
  }

  getAccount() {
    return this.account
  }

  addTransaction(transactionObject) {
    transactionObject.balance = this.getBalance(transactionObject)
    this.account.push(transactionObject)
  }
  
  getBalance(transactionObject) {
    this.balance = this.account.map(x => x.transaction).reduce((a, b) => a + b, 0) + transactionObject.transaction
    return this.balance
  }
  
}

module.exports = Account;