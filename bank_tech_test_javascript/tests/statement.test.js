const Statement = require('../src/statement')

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

    let testStatement = new Statement;

    expect(testStatement.orderTransactions(accountDouble)).toEqual([
      { transaction: -700, date: '31/01/2023', balance: 400 },
      { transaction: 600, date: '30/01/2023', balance: 1100 },
      { transaction: 500, date: '29/01/2023', balance: 500 }
    ])
  })

  it('prints the statement', () => {
    accountDouble = {
      account: [
        { transaction: 500, date: '29/01/2023', balance: 500 },
        { transaction: 600, date: '30/01/2023', balance: 1100 },
        { transaction: -700, date: '31/01/2023', balance: 400 }
      ],
      balance: 400
    }

    let testStatement = new Statement;

    expect(testStatement.printStatement(accountDouble)).toEqual(
      "date || credit || debit || balance\n31/01/2023 || || -700.00 || 400.00\n30/01/2023 || 600.00 || || 1100.00\n29/01/2023 || 500.00 || || 500.00\n"
    )
  
  })

})
