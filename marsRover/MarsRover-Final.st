!classDefinition: #MarsRover category: #MarsRover!
Object subclass: #MarsRover
	instanceVariableNames: 'posicion puntoCardinal'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'as yet unclassified' stamp: 'ma 10/20/2025 20:32:22'!
apuntaAlEste
	^ puntoCardinal esEste! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'ma 10/20/2025 20:44:33'!
apuntaAlNorte
	^ puntoCardinal esNorte! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'ma 10/20/2025 20:42:44'!
apuntaAlOeste
	^ puntoCardinal esOeste! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'ma 10/20/2025 20:38:56'!
apuntaAlSur
	^ puntoCardinal esSur! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'MA 10/20/2025 21:20:59'!
avanzaEnHorizontal
	^ posicion := (posicion x +1) @ posicion y! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'MA 10/20/2025 21:20:22'!
avanzaEnVertical
	^ posicion := posicion x @ (posicion y+1)! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'mati 10/17/2025 21:49:24'!
avanzar
	posicion:=posicion x @ (1+posicion y)! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'ma 10/20/2025 21:05:41'!
comandoErroneo: letra
	^ (letra !!= $f) and: (letra !!= $b) and: (letra !!= $l) and: (letra !!= $r) 
	! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'MA 10/20/2025 21:20:51'!
disminuyeEnHorizontal
	^ posicion := (posicion x -1) @ posicion y! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'MA 10/20/2025 21:20:34'!
disminuyeEnVertical
	^ posicion := posicion x @ (posicion y-1)! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'ma 10/20/2025 20:09:56'!
inicializarEnPosicion: unaPosicion apuntandoA: unPuntoCardinal
	posicion := unaPosicion.
	puntoCardinal := unPuntoCardinal.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'mati 10/17/2025 21:17:03'!
initialize
	posicion := 0@0! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'MA 10/20/2025 21:23:37'!
moverSegunLetra: letra
	(letra = $f ) ifTrue: [puntoCardinal avanzarPosicion: self].
	(letra = $b ) ifTrue: [puntoCardinal retrocederPosicion: self].! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'mati 10/17/2025 21:17:19'!
obtenerPosicion
	^ posicion! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'ma 10/20/2025 20:16:10'!
obtenerPuntoCardinal
	^ puntoCardinal! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'MA 10/20/2025 21:11:48'!
procesar: comando
	1 to: comando size do: [:indice | (self comandoErroneo: (comando at: indice)) ifTrue: [^self procesar: (comando copyFrom: 1 to: indice-1)]].
	comando do: [:letra | self moverSegunLetra: letra. self rotarSegunLetra: letra].
	! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'mati 10/17/2025 21:35:32'!
retroceder
	posicion:=posicion x @ (posicion y-1)! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'ma 10/20/2025 20:59:33'!
rotarSegunLetra: letra
	(letra = $r ) ifTrue: [^puntoCardinal := puntoCardinal rotarALaDerecha].
	(letra = $l ) ifTrue: [^puntoCardinal := puntoCardinal rotarALaIzquierda].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: #MarsRover!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'nil' stamp: 'ma 10/20/2025 20:09:08'!
inicializarEnPosicion: unaPosicion apuntandoA: unPuntoCardinal
	^ MarsRover new inicializarEnPosicion: unaPosicion apuntandoA: unPuntoCardinal.! !


!classDefinition: #PuntoCardinal category: #MarsRover!
Object subclass: #PuntoCardinal
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!PuntoCardinal methodsFor: 'nil' stamp: 'ma 10/20/2025 20:19:34'!
rotarALaDerecha
	self subclassResponsibility ! !


!PuntoCardinal methodsFor: 'as yet unclassified' stamp: 'MA 10/20/2025 21:21:26'!
avanzarPosicion: MarsRover
	self subclassResponsibility ! !

!PuntoCardinal methodsFor: 'as yet unclassified' stamp: 'ma 10/20/2025 20:32:29'!
esEste
	self subclassResponsibility ! !

!PuntoCardinal methodsFor: 'as yet unclassified' stamp: 'ma 10/20/2025 20:42:59'!
esNorte
	self subclassResponsibility ! !

!PuntoCardinal methodsFor: 'as yet unclassified' stamp: 'ma 10/20/2025 20:42:56'!
esOeste
	self subclassResponsibility ! !

!PuntoCardinal methodsFor: 'as yet unclassified' stamp: 'ma 10/20/2025 20:42:54'!
esSur
	self subclassResponsibility ! !

!PuntoCardinal methodsFor: 'as yet unclassified' stamp: 'MA 10/20/2025 21:23:48'!
retrocederPosicion: MarsRover
	self subclassResponsibility ! !

!PuntoCardinal methodsFor: 'as yet unclassified' stamp: 'ma 10/20/2025 20:46:58'!
rotarALaIzquierda
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PuntoCardinal class' category: #MarsRover!
PuntoCardinal class
	instanceVariableNames: ''!

!PuntoCardinal class methodsFor: 'nil' stamp: 'ma 10/20/2025 20:20:39'!
inicializarNorte
	^ Norte new.! !


!PuntoCardinal class methodsFor: 'as yet unclassified' stamp: 'ma 10/20/2025 20:21:05'!
inicializarEste
	^ Este new.! !

!PuntoCardinal class methodsFor: 'as yet unclassified' stamp: 'ma 10/20/2025 20:21:11'!
inicializarOeste
	^ Oeste new.! !

!PuntoCardinal class methodsFor: 'as yet unclassified' stamp: 'ma 10/20/2025 20:20:52'!
inicializarSur
	^ Sur new.! !


!classDefinition: #Este category: #MarsRover!
PuntoCardinal subclass: #Este
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Este methodsFor: 'nil' stamp: 'ma 10/20/2025 20:25:26'!
rotarALaDerecha
	^ self class inicializarSur! !


!Este methodsFor: 'as yet unclassified' stamp: 'MA 10/20/2025 21:21:52'!
avanzarPosicion: MarsRover
	MarsRover avanzaEnHorizontal.! !

!Este methodsFor: 'as yet unclassified' stamp: 'ma 10/20/2025 20:32:39'!
esEste
	^ true! !

!Este methodsFor: 'as yet unclassified' stamp: 'ma 10/20/2025 20:44:44'!
esNorte
	^ false! !

!Este methodsFor: 'as yet unclassified' stamp: 'ma 10/20/2025 20:43:22'!
esOeste
	^false! !

!Este methodsFor: 'as yet unclassified' stamp: 'ma 10/20/2025 20:39:08'!
esSur
	^ false! !

!Este methodsFor: 'as yet unclassified' stamp: 'MA 10/20/2025 21:24:12'!
retrocederPosicion: MarsRover
	MarsRover disminuyeEnHorizontal .! !

!Este methodsFor: 'as yet unclassified' stamp: 'ma 10/20/2025 20:50:08'!
rotarALaIzquierda
	^ self class inicializarNorte! !


!classDefinition: #Norte category: #MarsRover!
PuntoCardinal subclass: #Norte
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Norte methodsFor: 'nil' stamp: 'ma 10/20/2025 20:44:49'!
esNorte
	^ true! !

!Norte methodsFor: 'nil' stamp: 'ma 10/20/2025 20:25:16'!
rotarALaDerecha
	^ self class inicializarEste ! !


!Norte methodsFor: 'as yet unclassified' stamp: 'MA 10/20/2025 21:22:09'!
avanzarPosicion: MarsRover
	MarsRover avanzaEnVertical.! !

!Norte methodsFor: 'as yet unclassified' stamp: 'ma 10/20/2025 20:32:48'!
esEste
	^ false! !

!Norte methodsFor: 'as yet unclassified' stamp: 'ma 10/20/2025 20:43:29'!
esOeste
	^false! !

!Norte methodsFor: 'as yet unclassified' stamp: 'ma 10/20/2025 20:39:15'!
esSur
	^ false! !

!Norte methodsFor: 'as yet unclassified' stamp: 'MA 10/20/2025 21:24:27'!
retrocederPosicion: MarsRover
	MarsRover disminuyeEnVertical.! !

!Norte methodsFor: 'as yet unclassified' stamp: 'ma 10/20/2025 20:47:10'!
rotarALaIzquierda
	^ self class inicializarOeste! !


!classDefinition: #Oeste category: #MarsRover!
PuntoCardinal subclass: #Oeste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Oeste methodsFor: 'nil' stamp: 'ma 10/20/2025 20:44:53'!
esNorte
	^ false! !

!Oeste methodsFor: 'nil' stamp: 'ma 10/20/2025 20:25:43'!
rotarALaDerecha
	^ self class inicializarNorte! !


!Oeste methodsFor: 'as yet unclassified' stamp: 'MA 10/20/2025 21:22:27'!
avanzarPosicion: MarsRover
	MarsRover disminuyeEnHorizontal ! !

!Oeste methodsFor: 'as yet unclassified' stamp: 'ma 10/20/2025 20:32:55'!
esEste
	^ false! !

!Oeste methodsFor: 'as yet unclassified' stamp: 'ma 10/20/2025 20:43:36'!
esOeste
	^true! !

!Oeste methodsFor: 'as yet unclassified' stamp: 'ma 10/20/2025 20:39:20'!
esSur
	^ false! !

!Oeste methodsFor: 'as yet unclassified' stamp: 'MA 10/20/2025 21:24:41'!
retrocederPosicion: MarsRover
	MarsRover avanzaEnHorizontal .! !

!Oeste methodsFor: 'as yet unclassified' stamp: 'ma 10/20/2025 20:48:11'!
rotarALaIzquierda
	^ self class inicializarSur! !


!classDefinition: #Sur category: #MarsRover!
PuntoCardinal subclass: #Sur
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Sur methodsFor: 'nil' stamp: 'ma 10/20/2025 20:44:56'!
esNorte
	^ false! !

!Sur methodsFor: 'nil' stamp: 'ma 10/20/2025 20:26:01'!
rotarALaDerecha
	^ self class inicializarOeste! !


!Sur methodsFor: 'as yet unclassified' stamp: 'MA 10/20/2025 21:22:48'!
avanzarPosicion: MarsRover
	MarsRover disminuyeEnVertical.! !

!Sur methodsFor: 'as yet unclassified' stamp: 'ma 10/20/2025 20:33:01'!
esEste
	^ false! !

!Sur methodsFor: 'as yet unclassified' stamp: 'ma 10/20/2025 20:43:40'!
esOeste
	^false! !

!Sur methodsFor: 'as yet unclassified' stamp: 'ma 10/20/2025 20:39:27'!
esSur
	^ true! !

!Sur methodsFor: 'as yet unclassified' stamp: 'MA 10/20/2025 21:24:55'!
retrocederPosicion: MarsRover
	MarsRover avanzaEnVertical.! !

!Sur methodsFor: 'as yet unclassified' stamp: 'ma 10/20/2025 20:49:05'!
rotarALaIzquierda
	^ self class inicializarEste! !


!classDefinition: #TestMarsRover category: #MarsRover!
TestCase subclass: #TestMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'MA 10/20/2025 21:27:53'!
test01MarsRoverConComandoVacioNoHaceNada
	|marsRover|
	
	marsRover := MarsRover inicializarEnPosicion: 0@0 apuntandoA: PuntoCardinal inicializarNorte.
	
	marsRover procesar: ''.
	
	self assert: (marsRover obtenerPosicion isEqualTo: 0@0).! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'MA 10/20/2025 21:28:31'!
test02MarsRoverAvanzaUnaVezHaciaAdelante
	|marsRover|
	
	marsRover := MarsRover inicializarEnPosicion: 0@0 apuntandoA: PuntoCardinal inicializarNorte.
	
	marsRover procesar: 'f'.
	
	self assert: (marsRover obtenerPosicion isEqualTo: 0@1).! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'MA 10/20/2025 21:28:11'!
test03MarsRoverSeMueveUnaVezHaciaAtras
	|marsRover1 |
	
	marsRover1 := MarsRover inicializarEnPosicion: 0@0 apuntandoA: PuntoCardinal inicializarNorte.
	
	marsRover1 procesar: 'b'.
	
	self assert: (marsRover1 obtenerPosicion isEqualTo: 0@-1).! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'MA 10/20/2025 21:28:15'!
test04MarsRoverSeMueveHaciaAdelanteYHaciaAtras
	|marsRover1 |
	
	marsRover1 := MarsRover inicializarEnPosicion: 0@0 apuntandoA:  PuntoCardinal inicializarNorte.
	
	marsRover1 procesar: 'ffbffbfb'.
	
	self assert: (marsRover1 obtenerPosicion isEqualTo: 0@2).! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'ma 10/20/2025 20:40:00'!
test05MarsRoverApuntaAlNorteRotaUnaVezALaDerechaYQuedaApuntandoAlEste
	|marsRover1 |
	
	marsRover1 := MarsRover inicializarEnPosicion: 0@0 apuntandoA: PuntoCardinal inicializarNorte.
	
	marsRover1 procesar: 'r'.
	
	self assert: (marsRover1 apuntaAlEste).! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'ma 10/20/2025 20:39:51'!
test06MarsRoverApuntaAlEsteRotaUnaVezALaDerechaYQuedaApuntandoAlSur
	|marsRover1 |
	
	marsRover1 := MarsRover inicializarEnPosicion: 0@0 apuntandoA: PuntoCardinal inicializarEste.
	
	marsRover1 procesar: 'r'.
	
	self assert: (marsRover1 apuntaAlSur).! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'ma 10/20/2025 20:42:29'!
test07MarsRoverApuntaAlSurRotaUnaVezALaDerechaYQuedaApuntandoAlOeste
	|marsRover1 |
	
	marsRover1 := MarsRover inicializarEnPosicion: 0@0 apuntandoA: PuntoCardinal inicializarSur.
	
	marsRover1 procesar: 'r'.
	
	self assert: (marsRover1 apuntaAlOeste).! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'ma 10/20/2025 20:44:20'!
test08MarsRoverApuntaAlOesteRotaUnaVezALaDerechaYQuedaApuntandoAlNorte
	|marsRover1 |
	
	marsRover1 := MarsRover inicializarEnPosicion: 0@0 apuntandoA: PuntoCardinal inicializarOeste.
	
	marsRover1 procesar: 'r'.
	
	self assert: (marsRover1 apuntaAlNorte).! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'ma 10/20/2025 20:46:10'!
test09MarsRoverApuntaAlNorteRotaUnaVezALaIzquierdaYQuedaApuntandoAlOeste
	|marsRover1 |
	
	marsRover1 := MarsRover inicializarEnPosicion: 0@0 apuntandoA: PuntoCardinal inicializarNorte.
	
	marsRover1 procesar: 'l'.
	
	self assert: (marsRover1 apuntaAlOeste).! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'ma 10/20/2025 20:47:49'!
test10MarsRoverApuntaAlOesteRotaUnaVezALaIzquierdaYQuedaApuntandoAlSur
	|marsRover1 |
	
	marsRover1 := MarsRover inicializarEnPosicion: 0@0 apuntandoA: PuntoCardinal inicializarOeste.
	
	marsRover1 procesar: 'l'.
	
	self assert: (marsRover1 apuntaAlSur).! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'ma 10/20/2025 20:49:20'!
test11MarsRoverApuntaAlSurRotaUnaVezALaIzquierdaYQuedaApuntandoAlEste
	|marsRover1 |
	
	marsRover1 := MarsRover inicializarEnPosicion: 0@0 apuntandoA: PuntoCardinal inicializarSur.
	
	marsRover1 procesar: 'l'.
	
	self assert: (marsRover1 apuntaAlEste).! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'ma 10/20/2025 20:49:52'!
test12MarsRoverApuntaAlEsteRotaUnaVezALaIzquierdaYQuedaApuntandoAlNorte
	|marsRover1 |
	
	marsRover1 := MarsRover inicializarEnPosicion: 0@0 apuntandoA: PuntoCardinal inicializarEste.
	
	marsRover1 procesar: 'l'.
	
	self assert: (marsRover1 apuntaAlNorte).! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'MA 10/20/2025 21:26:50'!
test13MarsRoverSeMueveYRotaVariasVeces
	|marsRover1 |
	
	marsRover1 := MarsRover inicializarEnPosicion: 2@3 apuntandoA: PuntoCardinal inicializarEste.
	
	marsRover1 procesar: 'fbfrrbl'.
	
	self assert: (marsRover1 apuntaAlSur).
	self assert: (marsRover1 obtenerPosicion isEqualTo: 4@3).! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'MA 10/20/2025 21:29:38'!
test14MarsRoverSeMueveYRotaVariasVecesConComandosErroneos
	|marsRover1 |
	
	marsRover1 := MarsRover inicializarEnPosicion: -1@2 apuntandoA: PuntoCardinal inicializarEste.
	
	marsRover1 procesar: 'fbfrxrbl'.
	
	self assert: (marsRover1 apuntaAlSur).
	self assert: (marsRover1 obtenerPosicion isEqualTo: 0@2).! !
