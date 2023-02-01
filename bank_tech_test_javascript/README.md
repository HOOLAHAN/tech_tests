# Bank tech test

This repository contains a program I have written to practise writing quality code and following the TDD process when approaching a tech test. The requirements of the problem are outlined below with some added information on how to download and run the program.

## Specification

### Requirements

* You should be able to interact with your code via a REPL like IRB or Node.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2023  
**And** a deposit of 2000 on 13-01-2023  
**And** a withdrawal of 500 on 14-01-2023  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2023 || || 500.00 || 2500.00
13/01/2023 || 2000.00 || || 3000.00
10/01/2023 || 1000.00 || || 1000.00
```
## My Solution

### How to install

*Begin by creating a local copy of all files in the repository then open up a terminal and navigate to the correct repository*

````cd bank_tech_test_javascript````

*Then in the terminal install the dependencies:*

````npm install````

*To run the tests:*

````jest````

*To interact with the program:*

````node````

*Then load the files into the REPL*

````
const Account = require('./src/account')
const Transaction = require('./src/transaction') 
const Statement = require('./src/statement')
````

*Instantiate the classes*

````
let account = new Account
let statement = new Statement
`````

*Make transactions*
````
let transaction1 = new Transaction
transaction1.deposit(500)
account.addTransaction(transaction1)
````
````
let transaction2 = new Transaction
transaction2.deposit(400)
account.addTransaction(transaction2)
````
````
let transaction3 = new Transaction
transaction3.withdraw(200)
account.addTransaction(transaction3)
````
````
let transaction4 = new Transaction
transaction4.deposit(300)
account.addTransaction(transaction4)
````

*Print the statement*

````
statement.printStatement(account)
````
This screenshot shows an example of running the program a REPL:

![alt text](https://github.com/HOOLAHAN/tech_tests/blob/main/bank_tech_test_javascript/REPL_runthrough.png)

## My approach

My approach to this problem was first to consider the class structure and produce a diagram which would encapsulate the overall behaviour. See below sketch made using Drawio:

![alt text](https://github.com/HOOLAHAN/tech_tests/blob/main/bank_tech_test_javascript/diagram.png)

As displayed above, the program has three classes - Transaction, Account, Statement which deal with three key core behaviours, i.e. recording a transaction, adding to the account, preparing/printing a statement. 

While preparing the solution I followed the TDD process as closely as possible. Preparing tests for the simplest cases before writing the code to make them go from red to green, then commiting before writing the next test and repeating. 
