const Transaction = require('../classes/transaction')

describe('Transaction', () => {
  
  it('constructs transaction object', () => {
    let testTransaction = new Transaction;
    expect(testTransaction).toEqual({})
  })

  it('withdraw function creates a negative amount transaction', () => {
    let testTransaction = new Transaction;
    testTransaction.withdraw(500)
    expect(testTransaction).toEqual(
      expect.objectContaining({ transaction: -500 })
    )
  })

})