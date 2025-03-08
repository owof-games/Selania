~ SEED_RANDOM(266)

//Per abilitare o meno i debug
VAR debug = false
VAR debugCultivable = false
VAR debugChangeName = false


//Lista di tutti i luoghi del gioco
LIST places = Forest, BusStop, Greenhouse, Library, Nest, Laboratory, Safekeeping, GreenhouseMiddlePath, Bedroom

//Gestione background
LIST bedroomBGStates = (bedroomBGZero), bedroomBGOne, bedroomBGTwo, bedroomBGThree

//Lista delle personagge del gioco (quelle che hanno elementi di variabilità
LIST characters = Mentor, PG, FirstCharacter, SecondCharacter, ThirdCharacter, FourthCharacter, SixthCharacter, SeventhCharacter, TheFrog

LIST transitions = FromBusStopToForest, FromForestToBusStop, FromForestToGreenhouseMiddlePath, FromForestToLibraryDesat, FromForestToLibrary, FromGreenhouseMiddlePathToForest, FromGreenhouseMiddlePathToGreenhouse, FromGreenhouseMiddlePathToNest, FromGreenhouseToGreenhouseMiddlePath, FromLibraryToForest, FromLibraryToLaboratory

LIST sceneObjects = Bench, WateringCan , TheFungus, ReadingPlace, FirstCharacterNotes, SecondCharacterNotes, ThirdCharacterNotes, FourthCharacterNotes, FifthCharacterNotes, SixthCharacterNotes, SeventhCharacterNotes, StartingNote

LIST cultivable = LicheneDegliAbissi, NonTiScordarDiTe, MuschioDelleAmanti, CantoDelleCompagne, LaSpazzata, BaccaDellaAddolorata, BrinaDellImpossibile

//Quit esce e salva, exit esce e basta (è l'uscita quando siamo in camera da letto. Menu Load non è nei piani perché sennò mi devo ricordare dove cavolo sono.
LIST buttons = MenuSave, MenuQuit, RoomExit, RoomLoad, Inventory, FromBusStopToBedroom


//Lista dei contenuti di un determinato luogo, in modo da tracciare chi è dove
VAR bedroomContents = (RoomExit, RoomLoad, PG)

VAR busStopContents = (FromBusStopToForest, StartingNote, FromBusStopToBedroom, Inventory)

VAR forestContents = (Mentor, Bench, TheFungus, FromForestToBusStop, FromForestToGreenhouseMiddlePath, FromForestToLibraryDesat, Inventory)

VAR greenhouseMiddlePathContents = (FromGreenhouseMiddlePathToForest, FromGreenhouseMiddlePathToGreenhouse, FromGreenhouseMiddlePathToNest, Inventory)

VAR greenhouseContents = (FromGreenhouseToGreenhouseMiddlePath,  LicheneDegliAbissi, NonTiScordarDiTe, MuschioDelleAmanti, CantoDelleCompagne, LaSpazzata, BaccaDellaAddolorata, BrinaDellImpossibile, Inventory, WateringCan)

VAR libraryContents = (Inventory, FromLibraryToForest, FromLibraryToLaboratory, ReadingPlace)


VAR nestContents = (Inventory)

VAR laboratoryContents = (Inventory)

VAR safekeepingContents = (FirstCharacter, SecondCharacter, ThirdCharacter, FourthCharacter, FirstCharacterNotes, SecondCharacterNotes, ThirdCharacterNotes, FourthCharacterNotes, FifthCharacterNotes, MenuSave, MenuQuit, TheFrog, FromForestToLibrary)

