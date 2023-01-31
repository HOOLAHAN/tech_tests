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
})