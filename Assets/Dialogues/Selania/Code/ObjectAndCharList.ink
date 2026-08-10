//Lista di tutti i luoghi del gioco
    LIST listPlaces = Forest, TrainStop, Greenhouse, Library, Nest, Kitchen, Safekeeping, Pond, Bedroom, BookPlace, Dump
 
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
    CookingWithFirstCharOBJ, CookingWithSecondCharOBJ, FirstCharCookingAloneOBJ, SecondCharCookingAloneOBJ, EatingWithSecondCharOBJ, EatingWithFirstCharOBJ, CookingWithThirdCharOBJ, EatingWithThirdCharOBJ, ThirdCharCookingAloneOBJ,
    firstDumpOBJ, secondDumpOBJ, thirdDumpOBJ, fourthDumpOBJ, fifthDumpOBJ, CookingWithFourthCharOBJ, EatingWithFourthCharOBJ, CookingWithFifthCharOBJ, EatingWithFifthCharOBJ, FourthCharCookingAloneOBJ, FifthCharCookingAloneOBJ, CookingWithFranco,
    mapDump, mapKitchen, mapGreenhouse, mapLibrary, mapNest, 
    docDump, docKitchen, docGreenhouse, docNest, docLibrary, Clothespin,
    Owl
    
    LIST listAnimations = 
    Birds,
    LeafOneSin, LeafTwoSin, LeafThreeSin, LeafFourSin, LeafFiveSin, LeafOneDx, LeafTwoDx, LeafThreeDx, 
    CloudOne, CloudTwo, CloudThree, 
    RedBee, PinkBee, PurpleBee, Snail,
    NewMoonAnim, FirstQuarterAnim, FullMoonAnim, ThirdQuarterAnim, RedMoonAnim, 
    FirstRipple, SecondRipple, ThirdRipple, KitchenFire,
    lighthouseAnimation

    LIST listButtons = MenuSave, MenuQuit, FromTrainStopToBedroom
    
    LIST listBookElements = Grimoire, BookExit, FirstRecap, SecondRecap, ThirdRecap, FourthRecap, FifthRecap, FrogRecap, DogRecap, WitchRecap, GreenhouseRecap, KitchenRecap, NestRecap, RulesRecap, SettingsBookVersion
    
    LIST listRoomElements = BedClosingGame, FromBedroomToTrainStop, greenhouseOpened,  kitchenOpened, libraryOpened, nestOpened, francoOpened, dumpOpened, Settings
    
    LIST listSounds = TrainNoiseComing, TrainNoiseGoingAway, BastonSound
    
    LIST listColoredGlyphs  = fireGlyph, earthGlyph, airGlyph, waterGlyph, aetherGlyph, aetherGlyph_off, airGlyph_off, fireGlyph_off, earthGlyph_off, waterGlyph_off

    LIST listCharactersAndVariations = 
    FirstCharacter, FirstCharacterTriangolo, FirstCharacterOrchestra, FirstCharacterFlautoDolce, FirstCharacterOcarina, FirstCharacterViolino, FirstCharacterCucina,
    PaintTriangolo, PaintOrchestra, PaintFlautoDolce, PaintOcarina, PaintViolino, SecondCharacterCucina,
    SecondCharacter, SecondCharacterOrso, SecondCharacterLupo, SecondCharacterDelfino, SecondCharacterCapibara, SecondCharacterCorvo, 
    PaintOrso, PaintLupo, PaintDelfino, PaintCapibara, PaintCorvo,
    ThirdCharacter, ThirdCharacterCucina, ThirdCharacterForum, ThirdCharacterCanovaccio, ThirdCharacterSigaro, ThirdCharacterGuantone, ThirdCharacterCerchio,
    PaintForum, PaintCanovaccio, PaintSigaro, PaintGuantone, PaintCerchio,
    FourthCharacter, FourthCharacterCucina, 
    FifthCharacter, Mentor, FifthCharacterCucina, FifthCharacterEggZero, FifthCharacterEggOne, FifthCharacterEggTwo, FifthCharacterEggThree,
    Franco, FrancoCucina,
    Carla,
    Doggo, DoggoFirstLetters, DoggoSecondLetters, DoggoThirdLetters, DoggoFourthLetters, DoggoFifthLetters,
    PG,
    Documents

    //Tutte le cose legate all'albero principale
    LIST listTreeParts = treeTrunk, treeBranches, treeLeaves