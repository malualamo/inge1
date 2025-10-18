!classDefinition: #TestMarsRover category: #MarsRover!
TestCase subclass: #TestMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'mati 10/17/2025 21:13:43'!
test01MarsRoverConComandoVacioNoHaceNada
	|marsRover|
	
	marsRover := MarsRover new.
	
	marsRover procesar: ''.
	
	self assert: (marsRover obtenerPosicion isEqualTo: 0@0).! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'mati 10/17/2025 21:15:22'!
test02MarsRoverAvanzaUnaVezHaciaAdelante
	|marsRover|
	
	marsRover := MarsRover new.
	
	marsRover procesar: 'f'.
	
	self assert: (marsRover obtenerPosicion isEqualTo: 0@1).! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'mati 10/17/2025 21:23:24'!
test03MarsRoverAvanzaMasDeUnaVezHaciaAdelante
	|marsRover1 marsRover2|
	
	marsRover1 := MarsRover new.
	
	marsRover1 procesar: 'ff'.
	
	self assert: (marsRover1 obtenerPosicion isEqualTo: 0@2).
	
	marsRover2 := MarsRover new.
	
	marsRover2 procesar: 'fffff'.
	
	self assert: (marsRover2 obtenerPosicion isEqualTo: 0@5).! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'mati 10/17/2025 21:32:19'!
test04MarsRoverSeMueveUnaVezHaciaAtras
	|marsRover1 |
	
	marsRover1 := MarsRover new.
	
	marsRover1 procesar: 'b'.
	
	self assert: (marsRover1 obtenerPosicion isEqualTo: 0@-1).! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'mati 10/17/2025 21:42:27'!
test05MarsRoverSeMueveMasDeUnaVezHaciaAtras
	|marsRover1 |
	
	marsRover1 := MarsRover new.
	
	marsRover1 procesar: 'bbbbbb'.
	
	self assert: (marsRover1 obtenerPosicion isEqualTo: 0@-6).! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'mati 10/17/2025 21:42:36'!
test06MarsRoverSeMueveHaciaAdelanteYHaciaAtras
	|marsRover1 |
	
	marsRover1 := MarsRover new.
	
	marsRover1 procesar: 'ffbffbfb'.
	
	self assert: (marsRover1 obtenerPosicion isEqualTo: 0@2).! !


!classDefinition: #MarsRover category: #MarsRover!
Object subclass: #MarsRover
	instanceVariableNames: 'posicion'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'as yet unclassified' stamp: 'mati 10/17/2025 21:49:24'!
avanzar
	posicion:=posicion x @ (1+posicion y)! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'mati 10/17/2025 21:17:03'!
initialize
	posicion := 0@0! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'mati 10/17/2025 21:40:26'!
moverSegunLetra: letra
	! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'mati 10/17/2025 21:17:19'!
obtenerPosicion
	^ posicion! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'mati 10/17/2025 21:41:05'!
procesar: comando
	"comando do: [:letra | self moverSegunLetra: letra]."
	comando do: [:letra | (letra = $f ) ifTrue: [self avanzar]].
	comando do: [:letra | (letra = $b) ifTrue: [self retroceder]].
	! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'mati 10/17/2025 21:35:32'!
retroceder
	posicion:=posicion x @ (posicion y-1)! !
