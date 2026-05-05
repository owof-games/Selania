    VAR debug_seedRandom = false
    
//Per abilitare o meno i debug
    VAR debug = false
    VAR debug_cultivable = false
    VAR debug_changeName = false
    VAR debug_kitchen = false
    VAR debug_nest = false
    VAR debug_frog = false
    VAR debug_horizontalS = false
    VAR debug_achievements = false
    VAR debug_PNGLocation = false


    //per testare i luoghi non subito aperti con calma
    VAR debug_testLibrary = false
    VAR debug_testKitchen = false
    VAR debug_testNest = false
    VAR debug_testFrog = false
    VAR debug_testDump = false
    VAR debug_testGreenhouse = false
    VAR debug_dialogues = false
    
//Per disabilitare uscite e cose varie in caso di testing con il sistema stocastico    
    VAR debug_stochastic = true


{debug_seedRandom:
    ~ SEED_RANDOM(246)
}


=== function debugRewriting()

    ~ grimoire_firstChar += grimFirstCharNine
    ~ grimoire_secondChar += grimSecondCharNine
    ~ grimoire_thirdChar += grimThirdCharNine

    ~ thirdChar_storyStatus = story_storyStarted
    ~ secondChar_storyStatus = story_storyStarted
    ~ firstChar_storyStatus = story_storyStarted

    ~ firstChar_InkLevel = LIST_RANDOM(ink_possibileLevels)
    ~ secondChar_InkLevel = LIST_RANDOM(ink_possibileLevels)
    ~ thirdChar_InkLevel = LIST_RANDOM(ink_possibileLevels)

    ~ grimoire_appendices += (grimChoicesMentor, grimChoicesWitch, grimGreenhouseMentor, grimFirstOpenKitchen, grimInkMentor, grimRewritingMentor, grimThirdOpenNest, grimSigilsMentor, grimSigilsWitch)

    ~ player_pronouns = LIST_RANDOM(player_pronouns)
    ~ player_name = get_random_name()



=== function debug_places_open()

    ~ debug_testLibrary = true
    ~ debug_testKitchen = true
    ~ debug_testNest = true
    ~ debug_testDump = true
    ~ debug_testGreenhouse = true
    ~ debug_testFrog = true
        

{
    - debug_testDump == true && (entity_location(FromForestToDump) == Safekeeping):
        ~ move_entity(FromForestToDumpBlocked, Safekeeping)
        ~ move_entity(FromForestToDump, Forest)
        ~ move_entity(mapDump, TrainStop)
        ~ player_accessiblePlaces += Dump
} 
{
    - debug_testKitchen == true && (entity_location(FromPondToKitchen) == Safekeeping):
        ~ move_entity(FromPondToKitchenBlocked, Safekeeping)
        ~ move_entity(FromPondToKitchen, Pond)
        ~ move_entity(kitchenOpened, Bedroom)
        ~ move_entity(mapKitchen, TrainStop)
        ~ player_accessiblePlaces += Kitchen
}
{
    - debug_testLibrary == true && (entity_location(FromForestToLibrary) == Safekeeping):
        ~ move_entity(FromForestToLibraryBlocked, Safekeeping)
        ~ move_entity(FromForestToLibrary, Forest)
        ~ move_entity(libraryOpened, Bedroom)
        ~ move_entity(mapLibrary, TrainStop)
        ~ player_accessiblePlaces += Library
} 
{
    - debug_testNest == true && (entity_location(FromLibraryToNest) == Safekeeping):
        ~ move_entity(FromLibraryToNestBlocked, Safekeeping)
        ~ move_entity(FromLibraryToNest, Library)
        ~ move_entity(mapNest, TrainStop)
        ~ player_accessiblePlaces += Nest
}
{
    - debug_testGreenhouse == true && (entity_location(FromPondToGreenhouse) == Safekeeping):
        ~ move_entity(FromPondToGreenhouseBlocked, Safekeeping)
        ~ move_entity(FromPondToGreenhouse, Pond)
        ~ move_entity(greenhouseOpened, Bedroom)
        ~ move_entity(mapGreenhouse, TrainStop)
        ~ player_accessiblePlaces += Greenhouse
}
{
    - debug_testFrog == true && (entity_location(Franco) == Safekeeping) && grimoire_franco == ():
        ~ move_entity(Franco, Pond)
}      

//Spostiamo anche il letto in camera, se non siamo in debug stocastico
{
    - debug_stochastic == false:
        ~ move_entity(BedClosingGame, Bedroom)
}




=== debug_richGrimoire
//Serve per simulare uno stato in cui ho concluso le prime due png e Mentore non ha sbroccato

    ~ player_name = get_random_name()
    ~ kitchen_PGRecipeNoun = "Pane"
    ~ kitchen_PGRecipeAdjective = "disperazione"
    ~ kitchen_PGRecipeComplement = "codice caotico"
    ~ kitchen_PGRecipe = "Pane della disperazione con codice caotico"
    ~ frog_currentMission = LIST_RANDOM(frog_availableCommonMissions)
    ~ grimoire_franco += grimFrancoFirst

~ grimoire_firstChar += (grimFirstCharOne, grimFirstCharTwo, grimFirstCharThree, grimFirstCharFour, grimFirstCharFive, grimFirstCharSix, grimFirstCharSeven, grimFirstCharEight, grimFirstCharNine, grimFirstCharTen, grimFirstCharEleven, grimFirstCharTwelve, grimFirstOpenKitchen, grimFirstCharNovel, grimFirstCharDog, grimFirstCharKitchenOne, grimFirstCharKitchenTwo, grimFirstCharKitchenThree, grimFirstCharKitchenEnded, grimFirstCharKitchenPositiveReaction, grimFirstCharKitchenNegativeReaction, grimFirstCharKitchenNeutralReaction, grimFirstCharKitchenAlone, grimFirstCharProposal, grimFirstCharNewName, grimFirstCharMentorFeedback, grimFirstCharLetterOne, grimFirstCharLetterTwo, grimFirstCharLetterThree, grimFirstCharLetterFour, grimFirstSecondChar, grimFirstThirdChar, grimFirstCharMentor, grimFirstCharFranco)

    ~ firstChar_ActualName = LIST_RANDOM(firstChar_possibleStates)
    ~ kitchen_firstCharExtraIngredient = LIST_RANDOM(greenhouse_backupCultivable)
    ~ firstChar_giftedObject = LIST_RANDOM(greenhouse_backupCultivable)
    ~ firstChar_relationshipIndicator = RANDOM(-9,9)
    ~ firstChar_aether = RANDOM(-9,9)
    ~ firstChar_earth = RANDOM(-9,9)
    ~ firstChar_air = RANDOM(-9,9)
    ~ firstChar_water = RANDOM(-9,9)
    ~ firstChar_fire= RANDOM(-9,9)
    ~ firstChar_last_aether = RANDOM(-9,9)
    ~ firstChar_last_earth = RANDOM(-9,9)
    ~ firstChar_last_air = RANDOM(-9,9)
    ~ firstChar_last_water = RANDOM(-9,9)
    ~ firstChar_last_fire= RANDOM(-9,9)
    ~ kitchen_firstCharRecipeNoun = "Pizzette"
    ~ kitchen_firstCharRecipeAdjective = "incoerenza"
    ~ kitchen_firstCharRecipeComplement = "ruggine biondina"
    ~ kitchen_firstCharRecipe = "Pizzette della incoerenza con ruggine biondina"


~ grimoire_secondChar += (grimSecondCharOne, grimSecondCharTwo, grimSecondCharThreeHim, grimSecondCharThreeHer, grimSecondCharThreeThey, grimSecondCharFour, grimSecondCharFive, grimSecondCharSix, grimSecondCharSeven, grimSecondCharEight, grimSecondCharNine, grimSecondCharTen, grimSecondCharEleven, grimSecondCharTwelve, grimSecondCharCarla, grimSecondOpenLibrary, grimSecondCharNovel, grimSecondCharDog, grimSecondCharKitchenOne, grimSecondCharKitchenTwo, grimSecondCharKitchenThree, grimSecondCharKitchenEnded, grimSecondCharKitchenPositiveReaction, grimSecondCharKitchenNegativeReaction, grimSecondCharKitchenNeutralReaction,grimSecondCharKitchenAlone, grimSecondCharProposal, grimSecondCharNewName, grimSecondCharMentorFeedback, grimSecondCharLetterOne, grimSecondCharLetterTwo, grimSecondCharLetterThree, grimSecondCharLetterFour, grimFirstSecondChar, grimSecondCharMentorOne, grimSecondCharMentorPeace, grimSecondThirdChar, grimSecondCharFranco)

    ~ secondChar_ActualName = LIST_RANDOM(secondChar_possibleStates)
    ~ kitchen_secondCharExtraIngredient = LIST_RANDOM(greenhouse_backupCultivable)
    ~ secondChar_giftedObject = LIST_RANDOM(greenhouse_backupCultivable)
    ~ secondChar_relationshipIndicator = RANDOM(-9,9)
    ~ secondChar_aether = RANDOM(-9,9)
    ~ secondChar_earth = RANDOM(-9,9)
    ~ secondChar_air = RANDOM(-9,9)
    ~ secondChar_water = RANDOM(-9,9)
    ~ secondChar_fire= RANDOM(-9,9)
    ~ secondChar_last_aether = RANDOM(-9,9)
    ~ secondChar_last_earth = RANDOM(-9,9)
    ~ secondChar_last_air = RANDOM(-9,9)
    ~ secondChar_last_water = RANDOM(-9,9)
    ~ secondChar_last_fire= RANDOM(-9,9)
    ~ kitchen_secondCharRecipeNoun = "Pesche"
    ~ kitchen_secondCharRecipeAdjective = "discordia"
    ~ kitchen_secondCharRecipeComplement = "cioccolato al latte"
    ~ kitchen_secondCharRecipe = "Pesche della discordia con cioccolato al latte"

~ grimoire_thirdChar += (grimThirdCharOne, grimThirdCharTwo, grimThirdCharThree, grimThirdCharFour, grimThirdCharFive, grimThirdCharSix, grimThirdCharSeven, grimThirdCharEight, grimThirdCharNine, grimThirdCharTen, grimThirdCharEleven, grimThirdCharTwelve, grimThirdOpenNest, grimThirdCharNovel, grimThirdCharDog, grimThirdCharKitchenOne, grimThirdCharKitchenTwo, grimThirdCharKitchenThree, grimThirdCharKitchenEnded, grimThirdCharKitchenPositiveReaction, grimThirdCharKitchenNegativeReaction, grimThirdCharKitchenNeutralReaction,grimThirdCharKitchenAlone, grimThirdCharProposal, grimThirdCharNewName, grimThirdCharMentorFeedback, grimThirdCharLetterOne, grimThirdCharLetterTwo, grimThirdCharLetterThree, grimThirdCharLetterFour, grimSecondThirdChar, grimFirstThirdChar, grimThirdCharFranco, grimThirdCharMentor)

    ~ thirdChar_ActualName = Boccale
    ~ kitchen_thirdCharExtraIngredient = LIST_RANDOM(greenhouse_backupCultivable)
    ~ thirdChar_giftedObject = LIST_RANDOM(greenhouse_backupCultivable)
    ~ thirdChar_relationshipIndicator = RANDOM(-9,9)
    ~ thirdChar_aether = RANDOM(-9,9)
    ~ thirdChar_earth = RANDOM(-9,9)
    ~ thirdChar_air = RANDOM(-9,9)
    ~ thirdChar_water = RANDOM(-9,9)
    ~ thirdChar_fire= RANDOM(-9,9)
    ~ thirdChar_last_aether = RANDOM(-9,9)
    ~ thirdChar_last_earth = RANDOM(-9,9)
    ~ thirdChar_last_air = RANDOM(-9,9)
    ~ thirdChar_last_water = RANDOM(-9,9)
    ~ thirdChar_last_fire= RANDOM(-9,9)
    ~ kitchen_thirdCharRecipeNoun = "Crostata"
    ~ kitchen_thirdCharRecipeAdjective = "machistitudine"
    ~ kitchen_thirdCharRecipeComplement = "acqua di rose"
    ~ kitchen_thirdCharRecipe = "Crostata della machistitudine con acqua di rose"

~ grimoire_fifthChar += (grimMentorOne, grimMentorTwo, grimMentorThree, grimMentorFour, grimMentorFive, grimMentorSix, grimMentorSeven, grimMentorEight, grimMentorNine, grimMentorTen, grimMentorEleven, grimMentorTwelve, grimMentorNovel, grimMentorDog, grimMentorLiar, grimMentorViolence, grimMentorOlobinoUno, grimMentorOlobinoDue, grimKitchenMentor, grimMentorRage, grimMentorNotMandatory, grimMentorNewMail, grimMentorFirstSecretEnding, grimMentorSecondSecretEnding, grimMentorThirdSecretEnding, grimMentorFourthSecretEnding, grimMentorFifthSecretEnding)


~ grimoire_witch += (grimWitchFirstDebrief, grimWitchSecondDebrief, grimWitchThirdDebrief, grimWitchFourthDebrief, grimWitchFifthDebrief, grimWitchIntro, grimWitchFrog, grimWitchMainOne, grimWitchMainTwo, grimWitchMainThree, grimWitchMainFour, grimWitchMainFive, grimWitchBook, grimWitchOpenDump, grimWitchAllSigilsOpened)

     ~ witch_actualName = LIST_RANDOM(witch_possibleNames)

~ grimoire_appendices += (grimChoicesMentor, grimChoicesWitch, grimGreenhouseMentor, grimFirstOpenKitchen, grimInkMentor, grimRewritingMentor, grimThirdOpenNest, grimSigilsMentor, grimSigilsWitch)


    //Sblocco di tutti i coltivabili
        ~ greenhouse_findedCultivables += greenhouse_backupCultivable
        ~ greenhouse_findedCultivables += universalIngredient
        ~ backpack_findedGifts += greenhouse_backupCultivable
        ~ backpack_findedGifts += universalIngredient
        ~ greenhouse_backupCultivable = ()

    //Apertura di tutti i sigilli
    -> glyph_open_all_sigils ->

    //Attivo la gamer mode, o da ink non posso testare nulla
    -> gamerMode_activation ->   

    //Aggiungiamo con chi abbiamo cucinato
    ~  kitchen_allChefs += (FirstCharacter, SecondCharacter, ThirdCharacter)
                
->->