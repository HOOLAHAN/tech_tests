const Account = require('../classes/account')

describe('Account', () => {

  it('Constructs an account array', () => {
    testAccount = new Account;
    expect(testAccount.account).toEqual([])
  })

  it('getAccount function returns the account array', () => {
    testAccount = new Account;
    expect(testAccount.getAccount()).toEqual([])
  })

  it('addTransaction function adds a transaction to the account array', () => {
    testAccount = new Account;
    transactionDouble = { transaction: 500, date: '31/01/2023' }
    testAccount.addTransaction(transactionDouble)
    expect(testAccount.account[0]).toEqual({ transaction: 500, date: '31/01/2023' })
  })

})