class Account {

  constructor() {
    this.account = [];
  }

  getAccount() {
    return this.account
  }

  addTransaction(transaction) {
    this.account.push(transaction)
  }

}

module.exports = Account;