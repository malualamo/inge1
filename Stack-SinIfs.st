!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'elementos'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'ma 9/22/2025 22:54:46'!
initialize
	elementos := OOStackVacio new.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'ma 9/22/2025 22:52:45'!
isEmpty
	^ elementos isEmpty! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'ma 9/22/2025 23:10:58'!
pop
	|elementoAEliminar|
	elementoAEliminar := elementos top.
	elementos := elementos pop.
	^ elementoAEliminar! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'ma 9/22/2025 21:25:20'!
push: algo
	^ elementos := (elementos push: algo).! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'ma 9/22/2025 20:44:03'!
top
	^ elementos top! !


!OOStack methodsFor: 'accessing' stamp: 'MA 9/22/2025 00:32:01'!
size
	^ elementos size! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'ma 9/22/2025 21:10:29'!
initialize
	super initialize.
	self inicializar.! !

!OOStack class methodsFor: 'error descriptions' stamp: 'NR 9/14/2023 08:12:21'!
stackEmptyErrorDescription
	
	^ 'stack is empty!!!!!!'! !


!classDefinition: #OOStackNoVacio category: #'Stack-Exercise'!
Object subclass: #OOStackNoVacio
	instanceVariableNames: 'indiceUltimoElemento elementos'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackNoVacio methodsFor: 'as yet unclassified' stamp: 'ma 9/22/2025 21:27:57'!
initialize
	elementos := OrderedCollection new.
	indiceUltimoElemento:= 0! !

!OOStackNoVacio methodsFor: 'as yet unclassified' stamp: 'ma 9/22/2025 22:52:59'!
isEmpty
	^false! !

!OOStackNoVacio methodsFor: 'as yet unclassified' stamp: 'ma 9/22/2025 20:49:03'!
obtenerIndiceUltimoElemento
	^indiceUltimoElemento! !

!OOStackNoVacio methodsFor: 'as yet unclassified' stamp: 'ma 9/22/2025 23:08:01'!
pop
	(indiceUltimoElemento = 1) ifTrue: [^ (OOStackVacio new)].
	indiceUltimoElemento := indiceUltimoElemento - 1.! !

!OOStackNoVacio methodsFor: 'as yet unclassified' stamp: 'ma 9/22/2025 20:55:27'!
push: algo
	indiceUltimoElemento := indiceUltimoElemento + 1.
	elementos add: algo.
	^ self! !

!OOStackNoVacio methodsFor: 'as yet unclassified' stamp: 'ma 9/22/2025 23:12:14'!
size
	^ elementos size.! !

!OOStackNoVacio methodsFor: 'as yet unclassified' stamp: 'ma 9/22/2025 22:58:50'!
top
	^ elementos at: indiceUltimoElemento! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackNoVacio class' category: #'Stack-Exercise'!
OOStackNoVacio class
	instanceVariableNames: ''!

!OOStackNoVacio class methodsFor: 'as yet unclassified' stamp: 'ma 9/22/2025 21:10:11'!
initialize
	self inicializar! !


!classDefinition: #OOStackVacio category: #'Stack-Exercise'!
Object subclass: #OOStackVacio
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackVacio methodsFor: 'as yet unclassified' stamp: 'ma 9/22/2025 22:53:10'!
isEmpty
	^true! !

!OOStackVacio methodsFor: 'as yet unclassified' stamp: 'ma 9/22/2025 20:53:14'!
obtenerIndiceUltimoElemento
	^nil! !

!OOStackVacio methodsFor: 'as yet unclassified' stamp: 'ma 9/22/2025 23:13:39'!
push: algo
	|nuevoConjuntoElementos|
	nuevoConjuntoElementos := OOStackNoVacio new.
	nuevoConjuntoElementos push: algo.
	^ nuevoConjuntoElementos
	! !

!OOStackVacio methodsFor: 'as yet unclassified' stamp: 'ma 9/22/2025 23:12:27'!
size
	^0! !

!OOStackVacio methodsFor: 'as yet unclassified' stamp: 'ma 9/22/2025 20:45:41'!
stackEmptyError
	^self error: OOStack stackEmptyErrorDescription! !

!OOStackVacio methodsFor: 'as yet unclassified' stamp: 'ma 9/22/2025 20:46:01'!
top
	self stackEmptyError! !


!classDefinition: #SentenceFinderByPrefix category: #'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #OOStackTest category: #'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 9/16/2021 17:40:17'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'firstSomething'.
	secondPushedObject := 'secondSomething'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: #'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

OOStack initialize!
OOStackNoVacio initialize!