~ SEED_RANDOM(235)

//Per abilitare o meno il debug
VAR debug = false

//Nome giocatrice e pronomi
VAR nome = "Senza Nome"
LIST pronomi = maschili, femminili, neutri
//Traccio gli spostamenti della personaggia per gestire la comparsa delle personagge
VAR counterSpostamenti = 0

//Lista di tutti i luoghi del gioco
LIST luoghi = Giardino, BusStop, Funghi, Biblioteca, Falene, Labirinto, Tisane, CasettaAnime, GreenhouseMiddlePath

//Settaggio luoghi attivi a seconda del tier
VAR firstTierPlaces =(Giardino, BusStop, GreenhouseMiddlePath)
VAR secondTierPlaces =(Giardino, BusStop, Biblioteca, GreenhouseMiddlePath)
VAR thirdTierPlaces = (Giardino, BusStop, Biblioteca, Falene, GreenhouseMiddlePath)
VAR fourthTierPlaces = (Giardino, BusStop, Biblioteca, Falene, Tisane, GreenhouseMiddlePath)

//Lista delle personagge del gioco (quelle che hanno elementi di variabilità
LIST characters = Mentore, PG, PersonaggiaUno, PersonaggiaDue, PersonaggiaTre, PersonaggiaQuattro, PersonaggiaCinque, PersonaggiaSei, PersonaggiaSette

LIST transitions = FromBusStopToGarden, FromGardenToBusStop, FromGardenToGreenhouseMiddlePath, FromGardenToNothing,  FromGreenhouseMiddlePathToGarden, FromGreenhouseMiddlePathToGreenhouse, FromGreenhouseMiddlePathToNothing, FromGreenhouseToGreenhouseMiddlePath

LIST sceneObjects = Bench, WateringCan , Tree, FirstPersonNotes, SecondPersonNotes, NotePersonaggiaTre, NotePersonaggiaQuattro, NotePersonaggiaCinque, NotePersonaggiaSei, NotePersonaggiaSette, StartingNote

LIST mushrooms = LicheneDegliAbissi, NonTiScordarDiTe, MuschioDelleAmanti, CantoDelleCompagne, LaSpazzata, BaccaDellaAddolorata, BrinaDellImpossibile


//Lista dei contenuti di un determinato luogo, in modo da tracciare chi è dove
VAR contenutoGiardino = (Mentore, Bench, Tree, FromGardenToBusStop, FromGardenToGreenhouseMiddlePath, FromGardenToNothing)
VAR contenutoBusStop = (FromBusStopToGarden, PG, StartingNote)
VAR contenutoFunghi = (FromGreenhouseToGreenhouseMiddlePath, WateringCan)
VAR contenutoGreenhouseMiddlePath = (FromGreenhouseMiddlePathToGarden, FromGreenhouseMiddlePathToGreenhouse, FromGreenhouseMiddlePathToNothing)
VAR contenutoLabirinto = ()
VAR contenutoFalene = ()
VAR contenutoBiblioteca = ()
VAR contenutoTisane = ()
VAR contenutoCasettaAnime = (PersonaggiaUno, PersonaggiaDue, PersonaggiaTre, PersonaggiaQuattro, PersonaggiaCinque, PersonaggiaSei, PersonaggiaSette, LicheneDegliAbissi, NonTiScordarDiTe, MuschioDelleAmanti, CantoDelleCompagne, LaSpazzata, BaccaDellaAddolorata, BrinaDellImpossibile, FirstPersonNotes, SecondPersonNotes, NotePersonaggiaTre, NotePersonaggiaQuattro, NotePersonaggiaCinque, NotePersonaggiaSei, NotePersonaggiaSette)

    
//Variabili per tracciare i trigger warning. True = non è TW, posso mostrare quelle storie
VAR alcolismo = true
VAR abusi = true
VAR lutto = true
VAR solitudine = true