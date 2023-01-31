class Statement {

  constructor() {
    this.statement = []
  }

  getHeader() {
    return "date || credit || debit || balance\n"
  }

  orderTransactions(account) {
    return account.account.reverse()
  }

  prepareStatement(accountObject) {
    let orderedTransactions = this.orderTransactions(accountObject)
    let printArray = []

    orderedTransactions.forEach(x => { 
      if (x.transaction > 0) { 
        printArray.push(`${x.date} || ${x.transaction}.00 || || ${x.balance}.00\n`)
      } else {
        printArray.push(`${x.date} || || ${x.transaction}.00 || ${x.balance}.00\n`)
      }
    })
    return printArray;    
  }
  
  printStatement(accountObject) {
    let printArray = this.prepareStatement(accountObject)
    printArray.unshift(this.getHeader())
    let printReady = printArray.join("")
    console.log(printReady)
    return printReady
  }

}

module.exports = Statement; 