class Statement {

  constructor() {
    this.statement = []
  }

  getHeader() {
    return "date || credit || debit || balance"
  }

  orderTransactions(account) {
    return account.account.reverse()
  }

}

module.exports = Statement; 