~ SEED_RANDOM(235)

//Per abilitare o meno i debug
VAR debug = false
VAR debugCultivable = false

//Nome giocatrice e pronomi
VAR name = "Senza name"
LIST pronomi = maschili, femminili, neutri
//Traccio gli spostamenti della personaggia per gestire la comparsa delle personagge
VAR counterSpostamenti = 0

//Lista di tutti i luoghi del gioco
LIST luoghi = Forest, BusStop, Greenhouse, Libary, Nest, Labirinto, Tisane, CasettaAnime, GreenhouseMiddlePath

//Settaggio luoghi attivi a seconda del tier
VAR firstTierPlaces =(Forest, BusStop, GreenhouseMiddlePath)
VAR secondTierPlaces =(Forest, BusStop, Libary, GreenhouseMiddlePath)
VAR thirdTierPlaces = (Forest, BusStop, Libary, Nest, GreenhouseMiddlePath)
VAR fourthTierPlaces = (Forest, BusStop, Libary, Nest, Tisane, GreenhouseMiddlePath)

//Lista delle personagge del gioco (quelle che hanno elementi di variabilità
LIST characters = Mentore, PG, PersonaggiaUno, PersonaggiaDue, PersonaggiaTre, PersonaggiaQuattro, PersonaggiaCinque, PersonaggiaSei, PersonaggiaSette

LIST transitions = FromBusStopToForest, FromForestToBusStop, FromForestToGreenhouseMiddlePath, FromForestToLibrary,  FromGreenhouseMiddlePathToForest, FromGreenhouseMiddlePathToGreenhouse, FromGreenhouseMiddlePathToNest, FromGreenhouseToGreenhouseMiddlePath

LIST sceneObjects = Bench, WateringCan , TheFungus, FirstPersonNotes, SecondPersonNotes, NotePersonaggiaTre, NotePersonaggiaQuattro, NotePersonaggiaCinque, NotePersonaggiaSei, NotePersonaggiaSette, StartingNote

//Nomenclatura: Nome intero == step definitivo, NomeSZ: stepZero, NomeSU: stepUno, NomeSD: stepDue
LIST mushrooms = LicheneDegliAbissi, NonTiScordarDiTe, MuschioDelleAmanti, CantoDelleCompagne, LaSpazzata, BaccaDellaAddolorata, BrinaDellImpossibile



//Lista dei contenuti di un determinato luogo, in modo da tracciare chi è dove
VAR forestContents = (Mentore, Bench, TheFungus, FromForestToBusStop, FromForestToGreenhouseMiddlePath, FromForestToLibrary)
VAR busStopContents = (FromBusStopToForest, PG, StartingNote)
VAR greenhouseContents = (FromGreenhouseToGreenhouseMiddlePath, WateringCan, LicheneDegliAbissi, NonTiScordarDiTe, MuschioDelleAmanti, CantoDelleCompagne, LaSpazzata, BaccaDellaAddolorata, BrinaDellImpossibile)
VAR contenutoGreenhouseMiddlePath = (FromGreenhouseMiddlePathToForest, FromGreenhouseMiddlePathToGreenhouse, FromGreenhouseMiddlePathToNest)
VAR contenutoLabirinto = ()
VAR nestContents = ()
VAR libaryContents = ()
VAR contenutoTisane = ()
VAR contenutoCasettaAnime = (PersonaggiaUno, PersonaggiaDue, PersonaggiaTre, PersonaggiaQuattro, PersonaggiaCinque, PersonaggiaSei, PersonaggiaSette,  FirstPersonNotes, SecondPersonNotes, NotePersonaggiaTre, NotePersonaggiaQuattro, NotePersonaggiaCinque, NotePersonaggiaSei, NotePersonaggiaSette)

    
//Variabili per tracciare i trigger warning. True = non è TW, posso mostrare quelle storie
VAR alcolismo = true
VAR abusi = true
VAR lutto = true
VAR solitudine = true