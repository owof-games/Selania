//Lista dei contenuti di un determinato luogo, in modo da tracciare chi è dove
    VAR bedroomContents = (RoomLoad, PG, settings)

    VAR trainStopContents = (FromTrainStopToForest, FromTrainStopToBedroom, Birds)

    VAR forestContents = (Bench, TheWitch, LeafOneSin, LeafTwoSin, LeafThreeSin, LeafFourSin, LeafFiveSin, LeafOneDx, LeafTwoDx, LeafThreeDx, FromForestToTrainStop, FromForestToPond, FromForestToLibraryBlocked, Arbustini)

    VAR pondContents = (FromPondToForest, FromPondToGreenhouseBlocked, FromPondToNest, FromPondToKitchenBlocked, CloudOne, CloudTwo, CloudThree)

    VAR greenhouseContents = (FromGreenhouseToPond,  BaccaDellaAddolorata, BarbaDellInciampo, BastoneDellOzioso, BrinaDellImpossibile, CantoDelleCompagne, CardoAspinato, EderaDelleAmanti, ErbaLiccia, FalsaPalude, LanaNotturna, LicheneDegliAbissi, NonTiScordarDiTe, Olobino, LaSpazzata)

    VAR libraryContents = (FromLibraryToForest, FromLibraryToNestBlocked, ReadingPlace)

    VAR nestContents = (FromNestToLibrary, ELManagement, redShell, yellowShell, blueShell)

    VAR kitchenContents = (FromKitchenToPond, FirstRipple, SecondRipple, ThirdRipple)

    VAR safekeepingContents = (RoomExit, FirstCharacter, SecondCharacter, ThirdCharacter, FourthCharacter, FifthCharacter, FirstCharacterNotes, SecondCharacterNotes, ThirdCharacterNotes, FourthCharacterNotes, TheFrog, FifthCharacterNotes, MenuSave, MenuQuit,  RewriterBook, FirstRecap, SecondRecap, ThirdRecap, FourthRecap, FrogRecap, DogRecap, WitchRecap, GreenhouseRecap, KitchenRecap, NestRecap, FifthRecap, RulesRecap, Backpack, cultivationKit, firstCharPaint, teaKit, littleLibrary, bowl, secondCharPaint, vase, miniBook, FromLibraryToNestNight, FromLibraryToNest, FromForestToLibrary, RedBee, GoldenBee, BrownBee, MoonTrees, Snail, FromPondToGreenhouseBlooming, WateringCan, TrainNoiseComing, BastonSound, NewMoonAnim, FirstQuarterAnim, FullMoonAnim, ThirdQuarterAnim, RedMoonAnim, nightTable, waterLily, Mentor, FromPondToKitchen, FromPondToGreenhouse, greenShell, purpleShell, KitchenFire, KitchenSmokeOne, KitchenSmokeTwo, KitchenSmokeThree, CookingWithFirstCharOBJ, CookingWithSecondCharOBJ, FirstCharCookingAloneOBJ,  EatingWithSecondCharOBJ, EatingWithFirstCharOBJ, Bat, BatHouseFront, BatHouseRetro, FromLibraryToNestBlockedNight, TrainNoiseGoingAway, StartingNote, DoggoNoNotes, TheKitchenFrog)
    
    VAR bookContents = (BookExit, SettingsBookVersion)
   

//Funzione per tracciare se una data entità si trova o meno in un determinato luogo
=== function entity_location(entity)
    {
        - forestContents has entity:
            ~ return Forest
        
        - trainStopContents has entity:
            ~ return TrainStop
        
        - libraryContents has entity:
            ~ return Library
        
        - nestContents has entity:
            ~ return Nest
        
        - greenhouseContents has entity:
            ~ return Greenhouse
        
        - kitchenContents has entity:
            ~ return Kitchen
        
        - pondContents has entity:
            ~ return Pond         
        
        - safekeepingContents has entity:
            ~ return Safekeeping
        
        - bedroomContents has entity:
            ~ return Bedroom
        
        - bookContents has entity:
            ~ return BookPlace    
        
        - else:
            DEBUG: error, cannot find {entity} anywhere!
            {safekeepingContents}
            ~ return Forest
    }


//Funzione per spostare un'entità da un luogo a un altro
=== function move_entity(entity, destination)
    ~ temp CurrentLocation = entity_location(entity)
{debug: moving {entity} to {destination}.}

    {CurrentLocation:
        - Forest:
            ~ forestContents -= entity
        
        - TrainStop:
            ~ trainStopContents -= entity
        
        - Library:
            ~ libraryContents -= entity
        
        - Nest:
            ~ nestContents-= entity
        
        - Greenhouse:
            ~ greenhouseContents -= entity
        
        - Kitchen:
            ~ kitchenContents -= entity
        
        - Pond:
            ~ pondContents -= entity
            
        - Safekeeping:
            ~ safekeepingContents -= entity
        
        - Bedroom:
            ~ bedroomContents -= entity
            
        - BookPlace:
            ~ bookContents -= entity
            
        - else:
            DEBUG: error, cannot understand location {CurrentLocation} while trying to move {entity} out.
    }

    {destination:
        - Forest:
            ~ forestContents += entity
        
        - TrainStop:
            ~ trainStopContents += entity
        
        - Library:
            ~ libraryContents += entity
        
        - Nest:
            ~ nestContents += entity
        
        - Greenhouse:
            ~ greenhouseContents += entity
        
        - Kitchen:
            ~ kitchenContents += entity
        
        - Pond:
            ~ pondContents += entity
            
        - Safekeeping:
            ~ safekeepingContents += entity
        
        - Bedroom:
            ~ bedroomContents += entity
            
         - BookPlace:
            ~ bookContents += entity 
            
        - else:
            DEBUG: error, cannot understand location {destination} while trying to move {entity} in.
    }

    // se la PG si sposta da una stanza all'altra, rimuoviamo subito il TrainNoise.
    // questo fa sì che se mi sposto sul libro della riscrittora (che è un "luogo"),
    // al ritorno nella scena originale non parte il suono del treno, perché è stato
    // messo via
    { entity == PG:
        ~ move_entity(TrainNoiseComing, Safekeeping)
        ~ move_entity(TrainNoiseGoingAway, Safekeeping)
    }


//Funzioni per capire se due entità sono nello stesso luogo
=== function are_two_entities_together(entity1, entity2)
    ~ return entity_location(entity1) == entity_location(entity2)


== function are_entities_together_in(entity1, entity2, location)
    ~ return entity_location(entity1) == entity_location(entity2) and entity_location(entity1) == location


//Funzione per avvicinare una PNG alla personaggia protagonista
 === function move_first_entity_to_second_entity_location(entity1,entity2)
    ~ temp entity2_location = entity_location(entity2)
    ~ move_entity(entity1, entity2_location)
    
=== function change_entity_place(entity)
    {
        - are_two_entities_together(entity, PG):
            {
                - entity_location(PG) == TrainStop:
                    ~ move_entity(entity, Forest)
                - else:
                    ~ move_entity(entity, TrainStop)
            }
    }      