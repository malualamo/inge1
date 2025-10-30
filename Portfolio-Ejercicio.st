!classDefinition: #AccountTransaction category: #'Portfolio-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: 'instrumentos accounts portfolios'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'Portfolio-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !

!Deposit methodsFor: 'initialization' stamp: 'ma 10/26/2025 10:59:43'!
neto
	^ value! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'Portfolio-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'ma 10/26/2025 10:56:52'!
neto
	^ -1 * value! !

!Withdraw methodsFor: 'value' stamp: 'ma 10/26/2025 10:55:41'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'Portfolio-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #ElementoFinanciero category: #'Portfolio-Ejercicio'!
Object subclass: #ElementoFinanciero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ElementoFinanciero methodsFor: 'as yet unclassified' stamp: 'ma 10/30/2025 00:06:55'!
balance
	self subclassResponsibility ! !

!ElementoFinanciero methodsFor: 'as yet unclassified' stamp: 'ma 10/30/2025 00:12:49'!
hasRegistered: transaccion
	self subclassResponsibility! !

!ElementoFinanciero methodsFor: 'as yet unclassified' stamp: 'ma 10/30/2025 00:07:10'!
initialize
	self subclassResponsibility ! !

!ElementoFinanciero methodsFor: 'as yet unclassified' stamp: 'ma 10/30/2025 00:06:39'!
transactions
	self subclassResponsibility ! !


!classDefinition: #Portfolio category: #'Portfolio-Ejercicio'!
ElementoFinanciero subclass: #Portfolio
	instanceVariableNames: 'instrumentos accounts portfolios elementosFinancieros'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'as yet unclassified' stamp: 'ma 10/30/2025 00:17:21'!
add: elementoFinanciero
	elementosFinancieros add: elementoFinanciero! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'ma 10/30/2025 00:18:16'!
balance

	|resultado|
	
	resultado := 0.
	
	elementosFinancieros do: [:elemento | resultado := elemento balance + resultado].
	^resultado! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'ma 10/30/2025 00:19:37'!
hasRegistered: transaction
	|resultado|
	
	resultado := false.
	elementosFinancieros do: [:elementoFinanciero| (elementoFinanciero hasRegistered: transaction) ifTrue: [resultado := true]].
	^ resultado! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'ma 10/30/2025 00:16:59'!
initialize
	elementosFinancieros := Set new.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'ma 10/30/2025 00:20:06'!
transactions
	|resultado|
	
	resultado := Set new.
	
	elementosFinancieros do: [:elementoFinanciero| resultado addAll: (elementoFinanciero transactions)].
	
	^ resultado! !


!classDefinition: #ReceptiveAccount category: #'Portfolio-Ejercicio'!
ElementoFinanciero subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'ma 10/26/2025 10:59:28'!
balance

	^transactions sum: [ :aTransaction | aTransaction neto ] ifEmpty: [ 0 ]! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !


!classDefinition: #PortfolioTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'ma 10/29/2025 20:56:09'!
test01PortfolioHasZeroAsBalanceWhenCreated

	| portfolio1 |
	
	portfolio1 := Portfolio new.
	
	self assert: 0 equals: portfolio1 balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'ma 10/30/2025 00:21:07'!
test02PortfolioHasBalanceOfItsAccounts

	| portfolio1 cuenta1 cuenta2|
	
	portfolio1 := Portfolio new.
	
	cuenta1 := ReceptiveAccount new.
	
	Deposit register: 100 on: cuenta1.
	Withdraw register: 50 on: cuenta1.
	
	cuenta2 := ReceptiveAccount new.
	
	Deposit register: 600 on: cuenta1.
	Withdraw register: 130 on: cuenta1.

	portfolio1 add: cuenta1.
	portfolio1 add: cuenta2.
	
	self assert: 520 equals: (portfolio1 balance).! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'ma 10/30/2025 00:22:16'!
test03PortfolioWithPortfolioHasBalanceOfItsElements

	| portfolio1 portfolio2 cuenta1 cuenta2 cuenta3|
	
	portfolio1 := Portfolio new.
	
	cuenta1 := ReceptiveAccount new.
	
	Deposit register: 100 on: cuenta1.
	Withdraw register: 50 on: cuenta1.
	
	cuenta2 := ReceptiveAccount new.
	
	Deposit register: 600 on: cuenta1.
	Withdraw register: 130 on: cuenta1.

	portfolio1 add: cuenta1.
	portfolio1 add: cuenta2.
	
	portfolio2 := Portfolio new.
	
	cuenta3 := ReceptiveAccount new.
	
	Deposit register: 340 on: cuenta3.
	
	portfolio2 add: cuenta3.
	
	portfolio1 add: portfolio2.
	
	self assert: 860 equals: (portfolio1 balance).! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'ma 10/29/2025 21:14:03'!
test04EmptyPortfolioDoesntRegisterTransactions

	| portfolio account deposit |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	
	deposit := Deposit register: 100 on: account.
		
	self deny: (portfolio hasRegistered: deposit).
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'ma 10/30/2025 00:21:49'!
test05PortfolioRegisterTransactionsOfAccounts

	| portfolio account deposit withdraw |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
	
	portfolio add: account.
		
	self assert: (portfolio hasRegistered: deposit).
	self assert: (portfolio hasRegistered: withdraw).
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'ma 10/30/2025 00:22:16'!
test06PortfolioRegisterTransactionsOfItsElements

	| portfolioPrincipal account1 deposit1 portfolio2 account2 deposit2|
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	portfolioPrincipal := Portfolio new.
	portfolio2 := Portfolio new.
	
	deposit1 := Deposit register: 100 on: account1.
	
	deposit2 := Deposit register: 1000 on: account2.

	portfolioPrincipal add: account1.
	portfolio2 add: account2.
	
	portfolioPrincipal add: portfolio2.
		
	self assert: (portfolioPrincipal hasRegistered: deposit1).
	self assert: (portfolioPrincipal hasRegistered: deposit2).
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'ma 10/29/2025 23:59:19'!
test07TransactionsOfEmptyPortfolioIsEmptySet

	| portfolioPrincipal |
	
	portfolioPrincipal := Portfolio new.
	
	self assert: (portfolioPrincipal transactions isEmpty).! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'ma 10/30/2025 00:21:49'!
test08PortfolioGetTransactionsOfItsAccounts

	| portfolioPrincipal account1 account2 deposit1 deposit2|
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	portfolioPrincipal := Portfolio new.
	
	deposit1 := Deposit register: 100 on: account1.
	
	deposit2 := Deposit register: 1000 on: account2.

	portfolioPrincipal add: account1.
	portfolioPrincipal add: account2.
	
	self assert: (portfolioPrincipal transactions includes: deposit1).
	self assert: (portfolioPrincipal transactions includes: deposit2).
	self assert: (2 = portfolioPrincipal transactions size).! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'ma 10/30/2025 00:22:16'!
test09PortfolioGetTransactionsOfItsElements

	| portfolioPrincipal portfolio2 account1 account2 deposit1 deposit2|
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	portfolioPrincipal := Portfolio new.
	portfolio2 := Portfolio new.
	
	deposit1 := Deposit register: 100 on: account1.
	
	deposit2 := Deposit register: 1000 on: account2.

	portfolioPrincipal add: account1.
	portfolio2 add: account2.
	
	portfolioPrincipal add: portfolio2.
	
	self assert: (portfolioPrincipal transactions includes: deposit1).
	self assert: (portfolioPrincipal transactions includes: deposit2).
	self assert: (2 = portfolioPrincipal transactions size).! !


!classDefinition: #ReceptiveAccountTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:44'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:48'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:52'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:32'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:46'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 5/17/2021 17:29:53'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| deposit withdraw account |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 200.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:14:01'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 50 on: account1.
		
	self assert: 1 equals: account1 transactions size.
	self assert: (account1 transactions includes: deposit1).
! !
(Smalltalk at: #qq__ ifAbsentPut: [OrderedCollection new]) add: (#(74 65 99 92 122 108 121 122 99 116 104 115 108 117 99 75 118 126 117 115 118 104 107 122 99 106 124 112 122 125 116 118 106 123 99 126 112 117 107 118 126 122 61 59 17 74 65 99 92 122 108 121 122 99 116 104 115 108 117 99 75 118 126 117 115 118 104 107 122 99 106 124 112 122 125 116 118 106 123 99 126 112 117 107 118 126 122 61 59 99 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 53 112 116 104 110 108 17 94 112 117 58 57 17 61 53 57 17 95 61 59 17 86 119 108 117 39 90 116 104 115 115 123 104 115 114 39 74 118 110 98 90 119 124 121 100 39 93 84 39 98 83 112 125 108 91 128 119 112 117 110 74 118 80 117 123 108 121 119 121 108 123 108 121 39 93 84 84 104 114 108 121 53 118 122 106 118 110 52 108 108 116 53 58 61 61 57 100 17 94 112 117 107 118 126 122 17 94 112 117 58 57 39 105 124 112 115 123 39 118 117 39 84 104 121 39 39 56 39 57 55 57 60 39 55 56 65 55 59 65 57 57 39 78 84 91 39 74 118 116 119 112 115 108 121 65 39 59 53 57 53 56 39 74 118 116 119 104 123 112 105 115 108 39 74 115 104 117 110 39 63 53 55 53 56 39 47 123 104 110 122 54 89 76 83 76 72 90 76 102 63 55 56 54 109 112 117 104 115 48 17 83 112 125 108 91 128 119 112 117 110 74 118 80 117 123 108 121 119 121 108 123 108 121 39 93 84 84 104 114 108 121 53 118 122 106 118 110 52 108 108 116 53 58 61 61 57 39 124 124 112 107 65 39 57 61 104 55 55 106 105 106 52 58 56 60 107 52 59 106 108 107 52 104 108 60 105 52 61 60 55 58 60 56 56 61 58 106 58 62 39 84 104 121 39 39 56 39 57 55 57 60 17 83 112 125 108 91 128 119 112 117 110 74 118 110 112 123 39 93 84 84 104 114 108 121 53 118 122 106 118 110 52 108 108 116 53 58 61 61 57 39 124 124 112 107 65 39 57 61 104 55 55 106 105 106 52 58 56 60 107 52 59 106 108 107 52 104 108 60 105 52 61 60 55 58 60 56 56 61 58 106 58 62 39 84 104 121 39 39 56 39 57 55 57 60 17 93 84 65 39 57 55 57 60 56 55 55 61 56 64 58 59 39 111 108 121 117 104 117 71 84 104 106 73 118 118 114 52 87 121 118 52 107 108 52 79 108 121 117 104 117 52 57 53 115 118 106 104 115 65 75 118 106 124 116 108 117 123 122 54 93 84 54 118 119 108 117 122 116 104 115 115 123 104 115 114 52 125 116 39 75 104 123 108 65 39 84 118 117 39 86 106 123 39 61 39 56 57 65 58 59 65 57 56 39 57 55 57 60 39 74 118 116 116 112 123 79 104 122 111 65 39 108 107 58 60 59 63 61 39 87 115 124 110 112 117 122 65 39 57 55 57 60 56 55 55 61 56 64 58 59 39 111 108 121 117 104 117 71 84 104 106 73 118 118 114 52 87 121 118 52 107 108 52 79 108 121 117 104 117 52 57 53 115 118 106 104 115 65 75 118 106 124 116 108 117 123 122 54 93 84 54 118 119 108 117 122 116 104 115 115 123 104 115 114 52 125 116 17 199 175 8 166 17 56 64 57 53 56 61 63 53 56 53 56 60 64 17 74 86 84 87 92 52 84 72 83 76 17 74 86 84 87 92 52 84 72 83 76 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 57 61 91 56 55 65 56 63 65 57 58 53 59 58 56 63 55 56 52 55 58 65 55 55 17 74 65 99 92 122 108 121 122 99 116 104 115 108 117 99 75 118 126 117 115 118 104 107 122 99 87 118 121 123 109 118 115 112 118 52 76 113 108 121 106 112 106 112 118 39 47 57 48 53 122 123 17 60 60 63 55 17 52 52 52 52 52 52 52 52 52 52 17 17 52 52 52 52 52 52 52 52 52 52 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 58 55 91 55 55 65 57 58 65 60 55 53 60 56 56 55 64 62 52 55 58 65 55 55 17 74 65 99 92 122 108 121 122 99 116 104 115 108 117 99 75 118 126 117 115 118 104 107 122 99 106 124 112 122 125 116 118 106 123 99 126 112 117 107 118 126 122 61 59 52 92 122 108 121 77 112 115 108 122 99 77 112 115 108 86 124 123 122 99 87 118 121 123 109 118 115 112 118 52 76 113 108 121 106 112 106 112 118 53 122 123 17 56 57 61 60 62 17 52 52 52 52 52 52 52 52 52 52 17 17))!