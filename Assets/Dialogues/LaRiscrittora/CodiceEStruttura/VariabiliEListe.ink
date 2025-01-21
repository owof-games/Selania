~ SEED_RANDOM(235)

//Per abilitare o meno i debug
VAR debug = false
VAR debugColtivabili = false

//Nome giocatrice e pronomi
VAR nome = "Senza Nome"
LIST pronomi = maschili, femminili, neutri
//Traccio gli spostamenti della personaggia per gestire la comparsa delle personagge
VAR counterSpostamenti = 0

//Lista di tutti i luoghi del gioco
LIST luoghi = Forest, BusStop, Greenhouse, Biblioteca, Falene, Labirinto, Tisane, CasettaAnime, GreenhouseMiddlePath

//Settaggio luoghi attivi a seconda del tier
VAR firstTierPlaces =(Forest, BusStop, GreenhouseMiddlePath)
VAR secondTierPlaces =(Forest, BusStop, Biblioteca, GreenhouseMiddlePath)
VAR thirdTierPlaces = (Forest, BusStop, Biblioteca, Falene, GreenhouseMiddlePath)
VAR fourthTierPlaces = (Forest, BusStop, Biblioteca, Falene, Tisane, GreenhouseMiddlePath)

//Lista delle personagge del gioco (quelle che hanno elementi di variabilità
LIST characters = Mentore, PG, PersonaggiaUno, PersonaggiaDue, PersonaggiaTre, PersonaggiaQuattro, PersonaggiaCinque, PersonaggiaSei, PersonaggiaSette

LIST transitions = FromBusStopToForest, FromForestToBusStop, FromForestToGreenhouseMiddlePath, FromForestToLibrary,  FromGreenhouseMiddlePathToGarden, FromGreenhouseMiddlePathToGreenhouse, FromGreenhouseMiddlePathToNothing, FromGreenhouseToGreenhouseMiddlePath

LIST sceneObjects = Bench, WateringCan , TheFungus, FirstPersonNotes, SecondPersonNotes, NotePersonaggiaTre, NotePersonaggiaQuattro, NotePersonaggiaCinque, NotePersonaggiaSei, NotePersonaggiaSette, StartingNote

//Nomenclatura: Nome intero == step definitivo, NomeSZ: stepZero, NomeSU: stepUno, NomeSD: stepDue
LIST mushrooms = LicheneDegliAbissi, NonTiScordarDiTe, MuschioDelleAmanti, CantoDelleCompagne, LaSpazzata, BaccaDellaAddolorata, BrinaDellImpossibile



//Lista dei contenuti di un determinato luogo, in modo da tracciare chi è dove
VAR forestContents = (Mentore, Bench, TheFungus, FromForestToBusStop, FromForestToGreenhouseMiddlePath, FromForestToLibrary)
VAR busStopContents = (FromBusStopToForest, PG, StartingNote)
VAR greenhouseContents = (FromGreenhouseToGreenhouseMiddlePath, WateringCan, LicheneDegliAbissi, NonTiScordarDiTe, MuschioDelleAmanti, CantoDelleCompagne, LaSpazzata, BaccaDellaAddolorata, BrinaDellImpossibile)
VAR contenutoGreenhouseMiddlePath = (FromGreenhouseMiddlePathToGarden, FromGreenhouseMiddlePathToGreenhouse, FromGreenhouseMiddlePathToNothing)
VAR contenutoLabirinto = ()
VAR contenutoFalene = ()
VAR contenutoBiblioteca = ()
VAR contenutoTisane = ()
VAR contenutoCasettaAnime = (PersonaggiaUno, PersonaggiaDue, PersonaggiaTre, PersonaggiaQuattro, PersonaggiaCinque, PersonaggiaSei, PersonaggiaSette,  FirstPersonNotes, SecondPersonNotes, NotePersonaggiaTre, NotePersonaggiaQuattro, NotePersonaggiaCinque, NotePersonaggiaSei, NotePersonaggiaSette)

    
//Variabili per tracciare i trigger warning. True = non è TW, posso mostrare quelle storie
VAR alcolismo = true
VAR abusi = true
VAR lutto = true
VAR solitudine = true