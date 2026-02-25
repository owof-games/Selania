//Lista di tutti i luoghi del gioco
    LIST listPlaces = Forest, TrainStop, Greenhouse, Library, Nest, Kitchen, Safekeeping, Pond, Bedroom, BookPlace, Dump

//Lista delle personagge del gioco (quelle che hanno elementi di variabilità
    LIST listCharacters = Mentor, PG, FirstCharacter, SecondCharacter, ThirdCharacter, FourthCharacter, TheFrog, FifthCharacter, TheKitchenFrog

    LIST listTransitions = 
    FromTrainStopToForest, 
    FromForestToTrainStop, FromForestToPond, FromForestToLibraryBlocked, FromForestToLibrary, FromForestToDumpBlocked, FromForestToDump,
    FromPondToForest, FromPondToGreenhouse, FromPondToGreenhouseBlooming, FromPondToNest, FromPondToKitchen, FromPondToKitchenBlocked, FromPondToGreenhouseBlocked,
    FromGreenhouseToPond, 
    FromLibraryToForest, FromLibraryToNest, FromLibraryToNestBlocked, FromLibraryToNestNight, FromLibraryToNestBlockedNight,
    FromNestToLibrary, 
    FromKitchenToPond,
    FromDumpToForest
    
    LIST listStaticObjects = TheWitch, ReadingPlace, StartingNote, Arbustini, MoonTrees,  DoggoNoNotes
    
    LIST listConditionalObjects =  
    FirstCharacterNotes, SecondCharacterNotes, ThirdCharacterNotes, FourthCharacterNotes, FifthCharacterNotes,
    CookingWithFirstCharOBJ, CookingWithSecondCharOBJ, FirstCharCookingAloneOBJ, BatHouseFront, BatHouseRetro, EatingWithSecondCharOBJ, EatingWithFirstCharOBJ,
    firstDumpOBJ, secondDumpOBJ, thirdDumpOBJ, fourthDumpOBJ, fifthDumpOBJ, temporaryGrimoire
    
    LIST listAnimations = 
    Birds,
    LeafOneSin, LeafTwoSin, LeafThreeSin, LeafFourSin, LeafFiveSin, LeafOneDx, LeafTwoDx, LeafThreeDx, 
    CloudOne, CloudTwo, CloudThree, 
    RedBee, GoldenBee, BrownBee, Snail,
    NewMoonAnim, FirstQuarterAnim, FullMoonAnim, ThirdQuarterAnim, RedMoonAnim, 
    FirstRipple, SecondRipple, ThirdRipple, KitchenFire, KitchenSmokeOne, KitchenSmokeTwo, KitchenSmokeThree, Bat,
    lighthouseAnimation

    LIST listButtons = MenuSave, MenuQuit, FromTrainStopToBedroom
    
    LIST listBookElements = RewriterBook, BookExit, FirstRecap, SecondRecap, ThirdRecap, FourthRecap, FifthRecap, FrogRecap, DogRecap, WitchRecap, GreenhouseRecap, KitchenRecap, NestRecap, RulesRecap, SettingsBookVersion
    
    LIST listRoomElements = BedClosingGame, FromBedroomToTrainStop, greenhouseOpened,  kitchenOpened, libraryOpened, MiniGrimoire, nightTable, Settings, firstCharPaint, secondCharPaint, thirdCharPaint, fourthCharPaint, fifthCharPaint
    
    LIST listSounds = TrainNoiseComing, TrainNoiseGoingAway, BastonSound
    
    LIST listColoredGlyphs  = fireGlyph, earthGlyph, airGlyph, waterGlyph, aetherGlyph