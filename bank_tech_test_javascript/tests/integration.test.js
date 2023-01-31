const Transaction = require('../classes/transaction')
const Account = require('../classes/account')

describe('Integration', () => {
  it('adds transactions to the account', () => {
    let testAccount = new Account;
    let testTransaction = new Transaction;

    testTransaction.withdraw(500)
    testAccount.addTransaction(testTransaction);

    expect(testAccount.account[0]).toEqual(
      expect.objectContaining({ transaction: -500 })
    )
  })

  it('adds multiple transactions to the account with balance', () => {
    let testAccount = new Account;
    let testTransaction1 = new Transaction;
    let testTransaction2 = new Transaction;

    testTransaction1.deposit(600)
    testTransaction2.withdraw(500)

    testAccount.addTransaction(testTransaction1);
    testAccount.addTransaction(testTransaction2);

    expect(testAccount.account[0]).toEqual(
      expect.objectContaining( { transaction: 600, balance: 600 } )
    )
    expect(testAccount.account[1]).toEqual(
      expect.objectContaining( { transaction: -500, balance: 100 } )
    )
  })
})