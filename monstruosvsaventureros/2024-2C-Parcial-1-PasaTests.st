!classDefinition: #Combatiente category: #'2024-2C-Parcial-1'!
Object subclass: #Combatiente
	instanceVariableNames: 'puntosDeVida'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Combatiente methodsFor: 'as yet unclassified' stamp: 'ma 9/29/2025 22:34:32'!
duplicarPuntos
	puntosDeVida := puntosDeVida * 2! !

!Combatiente methodsFor: 'as yet unclassified' stamp: 'ma 9/29/2025 21:42:44'!
itemNoDisponibleMensajeDeError
	^'El item no se encuentra disponible'! !

!Combatiente methodsFor: 'as yet unclassified' stamp: 'ma 9/29/2025 21:47:10'!
recibirAtaqueDe: monstruo
	self subclassResponsibility.! !

!Combatiente methodsFor: 'as yet unclassified' stamp: 'ma 9/29/2025 21:40:01'!
tienePuntosDeVida: puntosDeVidaCheck
	^ puntosDeVidaCheck = puntosDeVida! !


!classDefinition: #Aventurero category: #'2024-2C-Parcial-1'!
Combatiente subclass: #Aventurero
	instanceVariableNames: 'fuerza puntosDeVidaDefensa inventario'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Aventurero methodsFor: 'as yet unclassified' stamp: 'ma 9/29/2025 22:36:16'!
atacarA: monstruo con: itemAtaque! !

!Aventurero methodsFor: 'as yet unclassified' stamp: 'ma 9/29/2025 21:44:50'!
equiparItemDeAtaque: item
	inventario add: item! !

!Aventurero methodsFor: 'as yet unclassified' stamp: 'ma 9/29/2025 21:06:09'!
equiparItemDeDefensa: itemDefensa
	puntosDeVidaDefensa := itemDefensa puntosDeVidaDefensa + puntosDeVidaDefensa ! !

!Aventurero methodsFor: 'as yet unclassified' stamp: 'ma 9/29/2025 21:31:30'!
inicializar
	fuerza := 4.
	puntosDeVida := 10 * pv.
	puntosDeVidaDefensa := 0 * pv.
	inventario := Bag new.! !

!Aventurero methodsFor: 'as yet unclassified' stamp: 'ma 9/29/2025 22:00:03'!
obtenerFuerza
	^ fuerza! !

!Aventurero methodsFor: 'as yet unclassified' stamp: 'ma 9/29/2025 21:03:41'!
recibirAtaqueDe: monstruo
	puntosDeVida := puntosDeVida - (0 max: (monstruo obtenerPuntosDeVida - puntosDeVidaDefensa))! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Aventurero class' category: #'2024-2C-Parcial-1'!
Aventurero class
	instanceVariableNames: ''!

!Aventurero class methodsFor: 'as yet unclassified' stamp: 'ma 9/29/2025 20:22:48'!
crearGuerrero
	^ Guerrero new inicializar. ! !

!Aventurero class methodsFor: 'as yet unclassified' stamp: 'ma 9/29/2025 22:08:46'!
crearMago
	^ Mago new inicializar. ! !


!classDefinition: #Guerrero category: #'2024-2C-Parcial-1'!
Aventurero subclass: #Guerrero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Guerrero methodsFor: 'as yet unclassified' stamp: 'ma 9/29/2025 22:50:13'!
atacarA: monstruo con: itemAtaque
	(inventario includes: itemAtaque) ifFalse: [^ self error: self itemNoDisponibleMensajeDeError ].
	
	monstruo esGoblin ifTrue: [^monstruo duplicarPuntos].
	
	monstruo recibirAtaqueDeGuerrero: self conItem: itemAtaque.! !

!Guerrero methodsFor: 'as yet unclassified' stamp: 'ma 9/29/2025 22:30:29'!
inicializar
	fuerza := 4.
	puntosDeVida := 10 * pv.
	puntosDeVidaDefensa := 0 * pv.
	inventario := Bag new.! !


!classDefinition: #Mago category: #'2024-2C-Parcial-1'!
Aventurero subclass: #Mago
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Mago methodsFor: 'as yet unclassified' stamp: 'ma 9/29/2025 22:44:06'!
atacarA: monstruo con: itemAtaque
	(inventario includes: itemAtaque) ifFalse: [^ self error: self itemNoDisponibleMensajeDeError ].
	
	(itemAtaque esEspada) ifTrue: [^puntosDeVida := 0].
	
	monstruo recibirAtaqueDeMago: self conItem: itemAtaque.! !

!Mago methodsFor: 'as yet unclassified' stamp: 'ma 9/29/2025 22:30:46'!
inicializar
	fuerza := 2.
	puntosDeVida := 15 * pv.
	puntosDeVidaDefensa := 0 * pv.
	inventario := Bag new.! !


!classDefinition: #Monstruo category: #'2024-2C-Parcial-1'!
Combatiente subclass: #Monstruo
	instanceVariableNames: 'altura'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Monstruo methodsFor: 'as yet unclassified' stamp: 'ma 9/29/2025 20:44:50'!
atacarA: guerrero
	guerrero recibirAtaqueDe: self.! !

!Monstruo methodsFor: 'as yet unclassified' stamp: 'ma 9/29/2025 22:58:17'!
esMenorAUnMetro
	^ altura < (1* meter)! !

!Monstruo methodsFor: 'as yet unclassified' stamp: 'ma 9/29/2025 20:28:37'!
inicializar
	self subclassResponsibility ! !

!Monstruo methodsFor: 'as yet unclassified' stamp: 'ma 9/29/2025 20:38:43'!
obtenerPuntosDeVida
	^ puntosDeVida! !

!Monstruo methodsFor: 'as yet unclassified' stamp: 'ma 9/29/2025 22:42:25'!
recibirAtaqueDe: aventurero conItem: item
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Monstruo class' category: #'2024-2C-Parcial-1'!
Monstruo class
	instanceVariableNames: ''!

!Monstruo class methodsFor: 'as yet unclassified' stamp: 'ma 9/29/2025 20:27:44'!
crearGoblin
	^ Goblin new inicializar.! !

!Monstruo class methodsFor: 'as yet unclassified' stamp: 'ma 9/29/2025 21:09:53'!
crearOgro
	^ Ogro new inicializar.! !


!classDefinition: #Goblin category: #'2024-2C-Parcial-1'!
Monstruo subclass: #Goblin
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Goblin methodsFor: 'as yet unclassified' stamp: 'ma 9/29/2025 22:33:03'!
esGoblin
	^ true! !

!Goblin methodsFor: 'as yet unclassified' stamp: 'ma 9/29/2025 20:55:35'!
inicializar
	altura := 90 * centimeter.
	puntosDeVida := 5 * pv! !

!Goblin methodsFor: 'as yet unclassified' stamp: 'ma 9/29/2025 22:56:26'!
recibirAtaqueDeGuerrero: guerrero conItem: item
	puntosDeVida := puntosDeVida - (guerrero obtenerFuerza * pv).! !

!Goblin methodsFor: 'as yet unclassified' stamp: 'ma 9/29/2025 22:56:34'!
recibirAtaqueDeMago: guerrero conItem: item
	(item esEspada) ifFalse: [^puntosDeVida := 0].! !


!classDefinition: #Ogro category: #'2024-2C-Parcial-1'!
Monstruo subclass: #Ogro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Ogro methodsFor: 'as yet unclassified' stamp: 'ma 9/29/2025 22:33:10'!
esGoblin
	^ false! !

!Ogro methodsFor: 'as yet unclassified' stamp: 'ma 9/29/2025 20:55:46'!
inicializar
	altura := 220 * centimeter.
	puntosDeVida := 15 * pv! !

!Ogro methodsFor: 'as yet unclassified' stamp: 'ma 9/29/2025 22:51:50'!
recibirAtaqueDeGuerrero: guerrero conItem: item
	(item monstruoObjetivoEs: self) ifTrue: [^puntosDeVida := puntosDeVida - (guerrero obtenerFuerza * pv)].! !

!Ogro methodsFor: 'as yet unclassified' stamp: 'ma 9/29/2025 22:46:15'!
recibirAtaqueDeMago: mago conItem: item
	puntosDeVida := puntosDeVida - (mago obtenerFuerza * pv)! !


!classDefinition: #Items category: #'2024-2C-Parcial-1'!
Object subclass: #Items
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Items class' category: #'2024-2C-Parcial-1'!
Items class
	instanceVariableNames: ''!

!Items class methodsFor: 'as yet unclassified' stamp: 'ma 9/29/2025 21:08:01'!
crearArmadura
	^ Defensa crearArmadura! !

!Items class methodsFor: 'as yet unclassified' stamp: 'ma 9/29/2025 22:18:08'!
crearBaculo
	^ Ataque crearBaculo! !

!Items class methodsFor: 'as yet unclassified' stamp: 'ma 9/29/2025 21:07:15'!
crearEscudoMagico
	^ Defensa crearEscudoMagico! !

!Items class methodsFor: 'as yet unclassified' stamp: 'ma 9/29/2025 21:26:54'!
crearEspadaPara: monstruo
	^ Ataque crearEspadaPara: monstruo! !


!classDefinition: #Ataque category: #'2024-2C-Parcial-1'!
Items subclass: #Ataque
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Ataque methodsFor: 'as yet unclassified' stamp: 'ma 9/29/2025 21:51:04'!
ataqueA: monstruo conFuerza: fuerza
	self subclassResponsibility ! !

!Ataque methodsFor: 'as yet unclassified' stamp: 'ma 9/29/2025 21:28:17'!
inicializar
	self subclassResponsibility ! !

!Ataque methodsFor: 'as yet unclassified' stamp: 'ma 9/29/2025 22:52:07'!
monstruoObjetivoEs: monstruo
	^ true! !

!Ataque methodsFor: 'as yet unclassified' stamp: 'ma 9/29/2025 22:10:56'!
obtenerAventureroValido
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Ataque class' category: #'2024-2C-Parcial-1'!
Ataque class
	instanceVariableNames: ''!

!Ataque class methodsFor: 'as yet unclassified' stamp: 'ma 9/29/2025 22:18:18'!
crearBaculo
	^ Baculo new.! !

!Ataque class methodsFor: 'as yet unclassified' stamp: 'ma 9/29/2025 23:00:31'!
crearEspadaPara: monstruo.
	monstruo esMenorAUnMetro ifTrue: [^self error: Espada noSePuedeAtacarAMonstruoMenorAUnMetroDeAlturaMensajeDeError ].
	^ Espada new inicializarConMonstruoObjetivo: monstruo.! !


!classDefinition: #Baculo category: #'2024-2C-Parcial-1'!
Ataque subclass: #Baculo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Baculo methodsFor: 'as yet unclassified' stamp: 'ma 9/29/2025 22:16:16'!
esEspada
	^false! !


!classDefinition: #Espada category: #'2024-2C-Parcial-1'!
Ataque subclass: #Espada
	instanceVariableNames: 'monstruoObjetivo'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Espada methodsFor: 'as yet unclassified' stamp: 'ma 9/29/2025 22:16:05'!
esEspada
	^ true! !

!Espada methodsFor: 'as yet unclassified' stamp: 'ma 9/29/2025 22:59:35'!
inicializarConMonstruoObjetivo: monstruo
	monstruoObjetivo := monstruo! !

!Espada methodsFor: 'as yet unclassified' stamp: 'ma 9/29/2025 22:28:44'!
monstruoObjetivoEs: monstruo
	^ monstruoObjetivo = monstruo! !

!Espada methodsFor: 'as yet unclassified' stamp: 'ma 9/29/2025 22:11:11'!
obtenerAventureroValido
	^ Guerrero! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Espada class' category: #'2024-2C-Parcial-1'!
Espada class
	instanceVariableNames: ''!

!Espada class methodsFor: 'as yet unclassified' stamp: 'ma 9/29/2025 22:53:26'!
noSePuedeAtacarAMonstruoMenorAUnMetroDeAlturaMensajeDeError
	^ 'No se puede atacar a monstruo menor a un metro de altura'! !


!classDefinition: #Defensa category: #'2024-2C-Parcial-1'!
Items subclass: #Defensa
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Defensa methodsFor: 'as yet unclassified' stamp: 'ma 9/29/2025 21:05:16'!
puntosDeVidaDefensa
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Defensa class' category: #'2024-2C-Parcial-1'!
Defensa class
	instanceVariableNames: ''!

!Defensa class methodsFor: 'as yet unclassified' stamp: 'ma 9/29/2025 21:08:10'!
crearArmadura
	^ Armadura new.! !

!Defensa class methodsFor: 'as yet unclassified' stamp: 'ma 9/29/2025 21:07:36'!
crearEscudoMagico
	^ EscudoMagico new.! !


!classDefinition: #Armadura category: #'2024-2C-Parcial-1'!
Defensa subclass: #Armadura
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Armadura methodsFor: 'as yet unclassified' stamp: 'ma 9/29/2025 21:05:04'!
puntosDeVidaDefensa
	^5 * pv! !


!classDefinition: #EscudoMagico category: #'2024-2C-Parcial-1'!
Defensa subclass: #EscudoMagico
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!EscudoMagico methodsFor: 'as yet unclassified' stamp: 'ma 9/29/2025 21:13:29'!
puntosDeVidaDefensa
	^ 3 * pv! !


!classDefinition: #TestMyA category: #'2024-2C-Parcial-1'!
TestCase subclass: #TestMyA
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 03:49:05'!
test01UnMonstruoAtacaAUnAventureroUsandoSusPVs

	| guerrero |
	
	guerrero := self crearGuerrero.
	
	self crearGoblin atacarA: guerrero.
	
	self assert: (guerrero tienePuntosDeVida: 10 * pv - (5 * pv))! !

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 04:09:06'!
test02UnAventureroPuedeUsarItemsDeDefensaParaProtegerse

	| guerrero |
	
	guerrero := self crearGuerrero.
	guerrero equiparItemDeDefensa: self crearEscudoMagico.
	guerrero equiparItemDeDefensa: self crearArmadura.
	
	self crearOgro atacarA: guerrero.
	
	self assert: (guerrero tienePuntosDeVida: 10 * pv - (15 * pv - (5 * pv) - (3 * pv)))! !

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 04:08:35'!
test03LosItemsDeDefensaNoPuedenAumentarLosPuntosDeVidaDelAventurero

	| guerrero |
	
	guerrero := self crearGuerrero.
	guerrero equiparItemDeDefensa: self crearArmadura.
	guerrero equiparItemDeDefensa: self crearArmadura.
	
	self crearGoblin atacarA: guerrero.
	
	self assert: (guerrero tienePuntosDeVida: 10 * pv)! !

!TestMyA methodsFor: 'tests' stamp: 'HAW 9/27/2024 09:04:39'!
test04UnAventureroNoPuedeAtacarSinItemsEquipados

	| guerrero ogro espada |
	
	guerrero := self crearGuerrero.
	ogro := self crearOgro.
	espada := self crearEspadaPara: ogro.
	
	self should: [ guerrero atacarA: ogro con: (espada) ] 
		raise: Error-MessageNotUnderstood 
		withExceptionDo: [ :anException |
			self assert: anException messageText equals: guerrero itemNoDisponibleMensajeDeError.
			self assert: (ogro tienePuntosDeVida: 15 * pv)
	]
	! !

!TestMyA methodsFor: 'tests' stamp: 'LL 9/27/2024 10:48:15'!
test05UnGuerreroConEspadaProvocaDañoSegunSuFuerza

	| guerrero ogro itemDeAtaque otroItemDeAtaque otroOgro |
	
	guerrero := self crearGuerrero.
	ogro := self crearOgro.
	itemDeAtaque := self crearEspadaPara: ogro.
	guerrero equiparItemDeAtaque: itemDeAtaque.
	otroOgro := self crearOgro.
	otroItemDeAtaque := self crearEspadaPara: otroOgro.
	guerrero equiparItemDeAtaque: otroItemDeAtaque.
	
	guerrero atacarA: ogro con: itemDeAtaque.
	guerrero atacarA: otroOgro con: otroItemDeAtaque.
	
	self assert: (ogro tienePuntosDeVida: 15 * pv - (4 * pv)).
	self assert: (otroOgro tienePuntosDeVida: 15 * pv - (4 * pv)).
	self assert: (guerrero tienePuntosDeVida: 10 * pv)! !

!TestMyA methodsFor: 'tests' stamp: 'HAW 9/27/2024 09:46:06'!
test06UnGuerreroConEspadaNoProvocaDañoAOtroMonstruoQueNoSeaElDeLaEspada

	| guerrero ogroNoObjetivoDeAtaque itemDeAtaque ogroObjetivoDeAtaque |
	
	guerrero := self crearGuerrero.
	ogroObjetivoDeAtaque := self crearOgro.
	itemDeAtaque := self crearEspadaPara: ogroObjetivoDeAtaque.
	guerrero equiparItemDeAtaque: itemDeAtaque.
	ogroNoObjetivoDeAtaque := self crearOgro.
	
	guerrero atacarA: ogroNoObjetivoDeAtaque con: itemDeAtaque.
	
	self assert: (ogroNoObjetivoDeAtaque tienePuntosDeVida: 15 * pv)! !

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 04:08:52'!
test07UnAventureroNoGuerreroPierdeTodosSusPuntosDeVidaSiUsaLaEspada

	| ogro mago itemDeAtaque |
	
	mago := self crearMago.
	ogro := self crearOgro.
	itemDeAtaque := self crearEspadaPara: ogro.
	mago equiparItemDeAtaque: itemDeAtaque.
	
	mago atacarA: ogro con: itemDeAtaque.
	
	self assert: (ogro tienePuntosDeVida: 15 * pv).
	self assert: (mago tienePuntosDeVida: 0)! !

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 04:08:49'!
test08ElMagoUsandoElBaculoMataAlGoblin

	| mago goblin itemDeAtaque |
	
	mago := self crearMago.
	itemDeAtaque := self crearBaculo.
	mago equiparItemDeAtaque: itemDeAtaque.
	goblin :=  self crearGoblin.
	
	mago atacarA: goblin con: itemDeAtaque.
	
	self assert: (goblin tienePuntosDeVida: 0)! !

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 04:42:13'!
test09ElMagoUsandoElBaculoDañaAOtrosMonstruosSegunSuFuerza

	| mago ogro itemDeAtaque |
	
	mago := self crearMago.
	itemDeAtaque := self crearBaculo.
	mago equiparItemDeAtaque: itemDeAtaque.
	ogro := self crearOgro.
	
	mago atacarA: ogro con: itemDeAtaque.
	
	self assert: (ogro tienePuntosDeVida: 15 * pv - (2 * pv))! !

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 04:08:45'!
test10UnAventureroNoMagoEsPenalizadoAlUsarElBaculoDuplicandoPVDeGoblins

	| guerrero goblin itemDeAtaque |
	
	guerrero := self crearGuerrero.
	itemDeAtaque := self crearBaculo.
	guerrero equiparItemDeAtaque: itemDeAtaque.
	goblin := self crearGoblin.
	
	guerrero atacarA: goblin con: itemDeAtaque.
	
	self assert: (goblin tienePuntosDeVida: 5 * pv * 2)! !

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 04:08:38'!
test11UnAventureroNoMagoUsandoElBaculoDañaSegunSuFuerzaAOtrosMonstruos

	| guerrero ogro itemDeAtaque |
	
	guerrero := self crearGuerrero.
	itemDeAtaque := self crearBaculo.
	guerrero equiparItemDeAtaque: itemDeAtaque.
	ogro := self crearOgro.
	
	guerrero atacarA: ogro con: itemDeAtaque.
	
	self assert: (ogro tienePuntosDeVida: 15 * pv - (4 * pv))! !

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 04:29:01'!
test12UnaEspadaNuncaPuedeSerUsadaEnMonstruosDeMenosDeUnMetro

	| goblin |
	
	goblin := self crearGoblin.
	
	self should: [ self crearEspadaPara: goblin ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anException |
		self assert: anException messageText equals: Espada noSePuedeAtacarAMonstruoMenorAUnMetroDeAlturaMensajeDeError
	]
	! !


!TestMyA methodsFor: 'crear items' stamp: 'ma 9/29/2025 21:08:47'!
crearArmadura

	^ Items crearArmadura! !

!TestMyA methodsFor: 'crear items' stamp: 'ma 9/29/2025 22:19:20'!
crearBaculo
	^ Items crearBaculo.! !

!TestMyA methodsFor: 'crear items' stamp: 'ma 9/29/2025 21:06:49'!
crearEscudoMagico
	^ Items crearEscudoMagico
! !

!TestMyA methodsFor: 'crear items' stamp: 'ma 9/29/2025 21:34:08'!
crearEspadaPara: monstruo
	^ Items crearEspadaPara: monstruo.! !


!TestMyA methodsFor: 'crear combatientes' stamp: 'ma 9/29/2025 20:47:41'!
crearGoblin
	^ Monstruo crearGoblin! !

!TestMyA methodsFor: 'crear combatientes' stamp: 'ma 9/29/2025 20:20:08'!
crearGuerrero
	^ Aventurero crearGuerrero! !

!TestMyA methodsFor: 'crear combatientes' stamp: 'ma 9/29/2025 22:12:29'!
crearMago
	^ Aventurero crearMago.! !

!TestMyA methodsFor: 'crear combatientes' stamp: 'ma 9/29/2025 21:09:41'!
crearOgro
	^ Monstruo crearOgro! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TestMyA class' category: #'2024-2C-Parcial-1'!
TestMyA class
	instanceVariableNames: ''!

!TestMyA class methodsFor: 'initialization' stamp: 'LL 9/26/2024 20:21:50'!
initialize

	Smalltalk at: #pv put: (BaseUnit named: 'pv' sign: 'pv')! !

TestMyA initialize!
