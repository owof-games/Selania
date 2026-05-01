//Lista di tutti i luoghi del gioco
    LIST listPlaces = Forest, TrainStop, Greenhouse, Library, Nest, Kitchen, Safekeeping, Pond, Bedroom, BookPlace, Dump

//Lista delle personagge del gioco (quelle che hanno elementi di variabilità
    LIST listCharacters = Mentor, PG, FirstCharacter, SecondCharacter, ThirdCharacter, FourthCharacter, Franco, FifthCharacter, Carla, Documents, Doggo

    LIST listTransitions = 
    FromTrainStopToForest, 
    FromForestToTrainStop, FromForestToPond, FromForestToLibraryBlocked, FromForestToLibrary, FromForestToDumpBlocked, FromForestToDump,
    FromPondToForest, FromPondToGreenhouse, FromPondToGreenhouseBlooming, FromPondToNest, FromPondToKitchen, FromPondToKitchenBlocked, FromPondToGreenhouseBlocked,
    FromGreenhouseToPond, 
    FromLibraryToForest, FromLibraryToNest, FromLibraryToNestBlocked,
    FromNestToLibrary, 
    FromKitchenToPond,
    FromDumpToForest
    
    LIST listStaticObjects = TheWitch, ReadingPlace, StartingNote, Arbustini, NightMode,  DoggoNoLetters
    
    LIST listConditionalObjects =  
    DoggoFirstLetters, DoggoSecondLetters, DoggoThirdLetters, DoggoFourthLetters, DoggoFifthLetters,
    CookingWithFirstCharOBJ, CookingWithSecondCharOBJ, FirstCharCookingAloneOBJ, BatHouseFront, BatHouseRetro, EatingWithSecondCharOBJ, EatingWithFirstCharOBJ, CookingWithThirdCharOBJ, EatingWithThirdCharOBJ, ThirdCharCookingAloneOBJ,
    firstDumpOBJ, secondDumpOBJ, thirdDumpOBJ, fourthDumpOBJ, fifthDumpOBJ,
    temporaryGrimoire, 
    mapDump, mapKitchen, mapGreenhouse, mapLibrary, mapNest, 
    docDump, docKitchen, docGreenhouse, docNest, docLibrary, Clothespin,
    Owl
    
    LIST listAnimations = 
    Birds,
    LeafOneSin, LeafTwoSin, LeafThreeSin, LeafFourSin, LeafFiveSin, LeafOneDx, LeafTwoDx, LeafThreeDx, 
    CloudOne, CloudTwo, CloudThree, 
    RedBee, GoldenBee, BrownBee, Snail,
    NewMoonAnim, FirstQuarterAnim, FullMoonAnim, ThirdQuarterAnim, RedMoonAnim, 
    FirstRipple, SecondRipple, ThirdRipple, KitchenFire, Bat,
    lighthouseAnimation

    LIST listButtons = MenuSave, MenuQuit, FromTrainStopToBedroom
    
    LIST listBookElements = Grimoire, BookExit, FirstRecap, SecondRecap, ThirdRecap, FourthRecap, FifthRecap, FrogRecap, DogRecap, WitchRecap, GreenhouseRecap, KitchenRecap, NestRecap, RulesRecap, SettingsBookVersion
    
    LIST listRoomElements = BedClosingGame, FromBedroomToTrainStop, greenhouseOpened,  kitchenOpened, libraryOpened, nestOpened, francoOpened, dumpOpened, Settings, firstCharPaint, secondCharPaint, thirdCharPaint, fourthCharPaint, fifthCharPaint
    
    LIST listSounds = TrainNoiseComing, TrainNoiseGoingAway, BastonSound
    
    LIST listColoredGlyphs  = fireGlyph, earthGlyph, airGlyph, waterGlyph, aetherGlyph, aetherGlyph_off, airGlyph_off, fireGlyph_off, earthGlyph_off, waterGlyph_off