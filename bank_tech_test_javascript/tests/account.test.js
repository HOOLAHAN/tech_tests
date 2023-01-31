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
    expect(testAccount.account[0]).toEqual(expect.objectContaining({ transaction: 500, date: '31/01/2023' }))
  })
  
  it('addTransaction function adds a balance to the account array', () => {
    testAccount = new Account;
    transactionDouble1 = { transaction: 500, date: '29/01/2023' }
    testAccount.addTransaction(transactionDouble)
    expect(testAccount.account[0]).toEqual({ transaction: 500, date: '31/01/2023', balance: 500 })
  })

  it('multiple transactions can be added to the account array', () => {
    testAccount = new Account;

    transactionDouble1 = { transaction: 500, date: '29/01/2023' }
    transactionDouble2 = { transaction: 600, date: '30/01/2023' }
    transactionDouble3 = { transaction: -700, date: '31/01/2023' }

    testAccount.addTransaction(transactionDouble1)
    testAccount.addTransaction(transactionDouble2)
    testAccount.addTransaction(transactionDouble3)

    expect(testAccount.account[0]).toEqual({ transaction: 500, date: '29/01/2023', balance: 500 })
    expect(testAccount.account[1]).toEqual({ transaction: 600, date: '30/01/2023', balance: 1100 })
    expect(testAccount.account[2]).toEqual({ transaction: -700, date: '31/01/2023', balance: 400 })
  })

  it('throws error if the balance is less than the withdraw amount', () => {
    testAccount = new Account;
    transactionDouble1 = { transaction: -500, date: '29/01/2023' }
    expect(() => {testAccount.addTransaction(transactionDouble1)}).toThrow('Insufficient funds.')
  })

})