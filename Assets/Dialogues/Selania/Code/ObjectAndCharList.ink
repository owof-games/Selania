//Lista di tutti i luoghi del gioco
    LIST places = Forest, TrainStop, Greenhouse, Library, Nest, Laboratory, Safekeeping, GreenhouseMiddlePath, Bedroom

//Lista delle personagge del gioco (quelle che hanno elementi di variabilità
    LIST characters = Mentor, PG, FirstCharacter, SecondCharacter, ThirdCharacter, FourthCharacter, TheFrog

    LIST transitions = FromTrainStopToForest, FromForestToTrainStop, FromForestToGreenhouseMiddlePath, FromForestToLibraryDesat, FromForestToLibrary, FromGreenhouseMiddlePathToForest, FromGreenhouseMiddlePathToGreenhouse, FromGreenhouseMiddlePathToNest, FromGreenhouseToGreenhouseMiddlePath, FromLibraryToForest, FromLibraryToLaboratory

    LIST sceneObjects = Bench, WateringCan, TheFungus, ReadingPlace, FirstCharacterNotes, SecondCharacterNotes, ThirdCharacterNotes, FourthCharacterNotes, FifthCharacterNotes, StartingNote

    LIST animations = FirstBee, Birds, CloudOne

//Quit esce e salva, exit esce e basta (è l'uscita quando siamo in camera da letto. Menu Load non è nei piani perché sennò mi devo ricordare dove cavolo sono.
    LIST buttons = MenuSave, MenuQuit, RoomExit, RoomLoad, Inventory, FromTrainStopToBedroom