~ SEED_RANDOM(266)

//Per abilitare o meno i debug
VAR debug = true
VAR debugCultivable = false
VAR debugChangeName = false

//Nome giocatrice e pronouns
VAR name = "Senza nome"
LIST pronouns = him, her, they
//Traccio gli spostamenti della personaggia per gestire la comparsa delle personagge
VAR movementsCounter = 0

//Lista di tutti i luoghi del gioco
LIST places = Forest, BusStop, Greenhouse, Libary, Nest, Labyrinth, Laboratory, Safekeeping, GreenhouseMiddlePath, Bedroom

//Settaggio luoghi attivi a seconda del tier
VAR firstTierPlaces =(Forest, BusStop, GreenhouseMiddlePath)
VAR secondTierPlaces =(Forest, BusStop, Libary, GreenhouseMiddlePath)
VAR thirdTierPlaces = (Forest, BusStop, Libary, Nest, GreenhouseMiddlePath)
VAR fourthTierPlaces = (Forest, BusStop, Libary, Nest, Laboratory, GreenhouseMiddlePath)

//Lista delle personagge del gioco (quelle che hanno elementi di variabilità
LIST characters = Mentor, PG, FirstCharacter, SecondCharacter, ThirdCharacter, FourthCharacter, FifthCharacter, SixthCharacter, SeventhCharacter

LIST transitions = FromBusStopToForest, FromForestToBusStop, FromForestToGreenhouseMiddlePath, FromForestToLibrary,  FromGreenhouseMiddlePathToForest, FromGreenhouseMiddlePathToGreenhouse, FromGreenhouseMiddlePathToNest, FromGreenhouseToGreenhouseMiddlePath

LIST sceneObjects = Bench, WateringCan , TheFungus, FirstCharacterNotes, SecondCharacterNotes, ThirdCharacterNotes, FourthCharacterNotes, FifthCharacterNotes, SixthCharacterNotes, SeventhCharacterNotes, StartingNote

LIST cultivable = LicheneDegliAbissi, NonTiScordarDiTe, MuschioDelleAmanti, CantoDelleCompagne, LaSpazzata, BaccaDellaAddolorata, BrinaDellImpossibile

//Quit esce e salva, exit esce e basta (è l'uscita quando siamo in camera da letto. Menu Load non è nei piani perché sennò mi devo ricordare dove cavolo sono.
LIST buttons = MenuSave, MenuQuit, RoomExit, RoomLoad, Inventory, FromBusStopToBedroom


//Lista dei contenuti di un determinato luogo, in modo da tracciare chi è dove
VAR bedroomContents = (RoomExit, RoomLoad, PG)

VAR busStopContents = (FromBusStopToForest, StartingNote, FromBusStopToBedroom, Inventory)

VAR forestContents = (Mentor, Bench, TheFungus, FromForestToBusStop, FromForestToGreenhouseMiddlePath, FromForestToLibrary, Inventory)

VAR greenhouseMiddlePathContents = (FromGreenhouseMiddlePathToForest, FromGreenhouseMiddlePathToGreenhouse, FromGreenhouseMiddlePathToNest, Inventory)

VAR greenhouseContents = (FromGreenhouseToGreenhouseMiddlePath, WateringCan, LicheneDegliAbissi, NonTiScordarDiTe, MuschioDelleAmanti, CantoDelleCompagne, LaSpazzata, BaccaDellaAddolorata, BrinaDellImpossibile, Inventory)

VAR labirinthContents = (Inventory)
VAR nestContents = (Inventory)
VAR libaryContents = (Inventory)
VAR laboratoryContents = (Inventory)

VAR safekeepingContents = (FirstCharacter, SecondCharacter, ThirdCharacter, FourthCharacter, FifthCharacter, SixthCharacter, SeventhCharacter,  FirstCharacterNotes, SecondCharacterNotes, ThirdCharacterNotes, FourthCharacterNotes, FifthCharacterNotes, SixthCharacterNotes, SeventhCharacterNotes, MenuSave, MenuQuit)

    
//Variabili per tracciare i trigger warning. True = non è TW, posso mostrare quelle storie
VAR alcoholism = true
VAR abuses = true
VAR mourning = true
VAR loneliness = true