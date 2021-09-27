The Specification is shown below the header "Bank Tech Test".

## Table of contents
* [Technologies and Design Principles](technologies-and-design-principles)
* [Installation](#installation)
* [Testing](#testing)
* [Usage](#usage)
* [Bank Tech Test](#bank-tech-test)

## Technologies and Design Principles:
it has been built on ruby and using TDD throughout. Testing teachnology used was Rspec.

SOLID principles were kept in mind and strove for 
- DRY
- SRP
- readable
- tested and simple code.

## Installation
```bash
gem install rspec
rspec --init
```
## Testing:
To run the tests:
```
rspec
```
## Usage
```ruby console
irb
```

# Bank Tech test

## Task

To display the bank statement of customer

## Requirements

- You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
- Deposits, withdrawal.
- Account statement (date, amount, balance) printing.
- Data can be kept in memory (it doesn't need to be stored to a database or anything).

## Acceptance criteria
- Given a client makes a deposit of 1000 on 10-01-2023
-And a deposit of 2000 on 13-01-2023
-And a withdrawal of 500 on 14-01-2023
When she prints her bank statement
Then she would see

```
date || credit || debit || balance
14/01/2023 || || 500.00 || 2500.00
13/01/2023 || 2000.00 || || 3000.00
10/01/2023 || 1000.00 || || 1000.00
``` 

### Planning
I/P                       O/P
 credit | debit        Balance Amount 
 1000                      1000
 2000                      3000
           500             2500
-specified with date     -display full statement

class Bank

balance :integer
date :string

methods
- withdraw()
- deposit()
- display()