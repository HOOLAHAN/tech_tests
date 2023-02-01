const Transaction = require('../src/transaction')

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

  it('deposit function creates a positive amount transaction', () => {
    let testTransaction = new Transaction;
    testTransaction.deposit(500)
    expect(testTransaction).toEqual(
      expect.objectContaining({ transaction: 500 })
    )
  })

  it('throws error if the transaction is not an integer', () => {
    let testTransaction = new Transaction;
    expect(() => { testTransaction.deposit("One Hundred") }).toThrow('Invalid input. Transaction amount must be an integer.')
    expect(() => { testTransaction.deposit(500.50) }).toThrow('Invalid input. Transaction amount must be an integer.')
  })

})