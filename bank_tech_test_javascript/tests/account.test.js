const Account = require('../classes/account')

describe('Account', () => {

  it('Constructs an Array', () => {
    testAccount = new Account;
    expect(testAccount.account).toEqual([])
  })

  it('getAccount function returns the account array', () => {
    testAccount = new Account;
    expect(testAccount.getAccount()).toEqual([])
  })

})