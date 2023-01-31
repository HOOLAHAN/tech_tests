const Statement = require('../classes/statement')

describe('Statement', () => {

  it('Constructs a statement array', () => {
    let testStatement = new Statement;
    expect(testStatement.statement).toEqual([])
  })

  it('sorts the transactions in order of most recent', () => {
    accountDouble = {
      account: [
        { transaction: 500, date: '29/01/2023', balance: 500 },
        { transaction: 600, date: '30/01/2023', balance: 1100 },
        { transaction: -700, date: '31/01/2023', balance: 400 }
      ],
      balance: 400
    }

    let orderedAccount = new Statement;
    test = orderedAccount.orderTransactions(accountDouble)

    expect(test).toEqual([
      { transaction: -700, date: '31/01/2023', balance: 400 },
      { transaction: 600, date: '30/01/2023', balance: 1100 },
      { transaction: 500, date: '29/01/2023', balance: 500 }
    ])
  })

})
