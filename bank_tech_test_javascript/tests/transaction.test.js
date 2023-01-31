const Transaction = require('../classes/transaction')

describe('Transaction', () => {
  
  it('constructs', () => {
    let testTransaction = new Transaction;
    expect(testTransaction).toEqual({})
  })

})