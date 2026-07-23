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
    VAR debug_stochastic = false


{debug_seedRandom:
    ~ SEED_RANDOM(246)
}


=== function debug_Franco()
    ~ debug_testFrog = true
    ~ move_entity(Franco, Pond)


=== function debugRewriting()
    //Caricamento grimorio
    ~ grimoire_isEnabled = true

    //Settaggio dati PNG
    ~ player_name = get_random_name()
    ~ kitchen_PGRecipeNoun = "Pane"
    ~ kitchen_PGRecipeAdjective = "disperazione"
    ~ kitchen_PGRecipeComplement = "codice caotico"
    ~ kitchen_PGRecipe = "Pane della disperazione con codice caotico"
    ~ frog_currentMission = LIST_RANDOM(frog_availableCommonMissions)
    ~ grimoire_franco += grimFrancoFirst

    ~ grimoire_firstChar += (grimFirstCharNine, grimFirstCharPresentation)
    ~ grimoire_secondChar += (grimSecondCharNine, grimSecondCharPresentation)
    ~ grimoire_thirdChar += (grimThirdCharSix, grimThirdCharPresentation)
    ~ grimoire_fifthChar += grimMentorPresentation

    ~ thirdChar_storyStatus = story_storyStarted
    ~ secondChar_storyStatus = story_storyStarted
    ~ firstChar_storyStatus = story_storyStarted

    ~ firstChar_InkLevel = LIST_RANDOM(ink_possibileLevels)
    ~ secondChar_InkLevel = LIST_RANDOM(ink_possibileLevels)
    ~ thirdChar_InkLevel = LIST_RANDOM(ink_possibileLevels)

    ~ grimoire_appendices += (grimChoicesMentor, grimChoicesWitch, grimGreenhouseMentor, grimFirstOpenKitchen, grimInkMentor, grimRewritingMentor, grimThirdOpenNest, grimSigilsMentor, grimSigilsWitch, tutorialChoicesRelationship, tutorialRereading, tutorialGrimoire, tutorialGreenhouse, tutorialKitchen, tutorialNest, tutorialSigils)

    ~ player_pronoun = LIST_RANDOM(possibile_player_pronouns)
    ~ player_name = get_random_name()
    
    //E assegniamo anche il nome della strega
    ~ witch_actualName = LIST_RANDOM(witch_possibleNames)

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

        ~  player_aether_first_char = firstChar_aether
        ~  player_earth_first_char = firstChar_earth
        ~  player_air_first_char = firstChar_air
        ~  player_water_first_char = firstChar_water
        ~  player_fire_first_char = firstChar_fire
        ~ updateFirstCharacterRelation()


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

        ~  player_aether_second_char = secondChar_aether
        ~  player_earth_second_char = secondChar_earth
        ~  player_air_second_char = secondChar_air
        ~  player_water_second_char = secondChar_water
        ~  player_fire_second_char = secondChar_fire
        ~ updateSecondCharacterRelation()


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

        ~  player_aether_third_char = thirdChar_aether
        ~  player_earth_third_char = thirdChar_earth
        ~  player_air_third_char = thirdChar_air
        ~  player_water_third_char = thirdChar_water
        ~  player_fire_third_char = thirdChar_fire
        ~ updateThirdCharacterRelation()

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

    //Caricamento grimorio
    ~ grimoire_isEnabled = true

    //Settaggio dati PNG
    ~ player_name = get_random_name()
    ~ kitchen_PGRecipeNoun = "Pane"
    ~ kitchen_PGRecipeAdjective = "disperazione"
    ~ kitchen_PGRecipeComplement = "codice caotico"
    ~ kitchen_PGRecipe = "Pane della disperazione con codice caotico"
    ~ frog_currentMission = LIST_RANDOM(frog_availableCommonMissions)
    ~ grimoire_franco += grimFrancoFirst

~ grimoire_firstChar += (grimFirstCharOne, grimFirstCharTwo, grimFirstCharThree, grimFirstCharFour, grimFirstCharFive, grimFirstCharSix, grimFirstCharSeven, grimFirstCharEight, grimFirstCharNine, grimFirstCharTen, grimFirstCharEleven, grimFirstCharTwelve, grimFirstOpenKitchen, grimFirstCharNovel, grimFirstCharDog, grimFirstCharKitchenOne, grimFirstCharKitchenTwo, grimFirstCharKitchenThree, grimFirstCharKitchenEnded, grimFirstCharKitchenPositiveReaction, grimFirstCharKitchenNegativeReaction, grimFirstCharKitchenNeutralReaction, grimFirstCharKitchenAlone, grimFirstCharProposal, grimFirstCharNewName, grimFirstCharMentorFeedback, grimFirstCharLetterOne, grimFirstCharLetterTwo, grimFirstCharLetterThree, grimFirstCharLetterFour, grimFirstSecondChar, grimFirstThirdChar, grimFirstCharMentor, grimFirstCharFranco, grimFirstCharPresentation)

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


~ grimoire_secondChar += (grimSecondCharOne, grimSecondCharTwo, grimSecondCharThreeHim, grimSecondCharThreeHer, grimSecondCharThreeThey, grimSecondCharFour, grimSecondCharFive, grimSecondCharSix, grimSecondCharSeven, grimSecondCharEight, grimSecondCharNine, grimSecondCharTen, grimSecondCharEleven, grimSecondCharTwelve, grimSecondCharCarla, grimSecondOpenLibrary, grimSecondCharNovel, grimSecondCharDog, grimSecondCharKitchenOne, grimSecondCharKitchenTwo, grimSecondCharKitchenThree, grimSecondCharKitchenEnded, grimSecondCharKitchenPositiveReaction, grimSecondCharKitchenNegativeReaction, grimSecondCharKitchenNeutralReaction,grimSecondCharKitchenAlone, grimSecondCharProposal, grimSecondCharNewName, grimSecondCharMentorFeedback, grimSecondCharLetterOne, grimSecondCharLetterTwo, grimSecondCharLetterThree, grimSecondCharLetterFour, grimFirstSecondChar, grimSecondCharMentorOne, grimSecondCharMentorPeace, grimSecondThirdChar, grimSecondCharFranco, grimSecondCharPresentation)

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

~ grimoire_thirdChar += (grimThirdCharOne, grimThirdCharTwo, grimThirdCharThree, grimThirdCharFour, grimThirdCharFive, grimThirdCharSix,  grimThirdOpenNest, grimThirdCharNovel, grimThirdCharDog, grimThirdCharKitchenOne, grimThirdCharKitchenTwo, grimThirdCharKitchenThree, grimThirdCharKitchenEnded, grimThirdCharKitchenPositiveReaction, grimThirdCharKitchenNegativeReaction, grimThirdCharKitchenNeutralReaction,grimThirdCharKitchenAlone, grimThirdCharFirstProposal, grimThirdCharNewName, grimThirdCharMentorFeedback, grimThirdCharLetterOne, grimThirdCharLetterTwo, grimThirdCharLetterThree, grimThirdCharLetterFour, grimSecondThirdChar, grimFirstThirdChar, grimThirdCharFranco, grimThirdCharMentor, grimThirdCharPresentation)

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

~ grimoire_fifthChar += (grimMentorOne, grimMentorTwo, grimMentorThree, grimMentorFour, grimMentorFive, grimMentorSix, grimMentorSeven, grimMentorEight, grimMentorNine, grimMentorTen, grimMentorEleven, grimMentorTwelve, grimMentorNovel, grimMentorDog, grimMentorLiar, grimMentorViolence, grimMentorOlobinoUno, grimMentorOlobinoDue, grimKitchenMentor, grimMentorMeltdown, grimMentorNotMandatory, grimMentorNewMail, grimMentorFirstSecretEnding, grimMentorSecondSecretEnding, grimMentorThirdSecretEnding, grimMentorFourthSecretEnding, grimMentorFifthSecretEnding, grimMentorPresentation)


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
        ~ gamerMode_activation ()

    //Aggiungiamo con chi abbiamo cucinato
        ~  kitchen_allChefs += (FirstCharacter, SecondCharacter, ThirdCharacter)

    //E poi i documenti
        ~  horizontalS_discoveredDocs += horizontalS_allDocs


->->



=== function debug_allGraphicsElementsEndingMode()
//Step uno, cose della serra
~ move_entity(Snail, Greenhouse)
~ move_entity(BastonSound, Greenhouse)
~ move_entity(RedBee, Greenhouse)
~ move_entity(PurpleBee, Greenhouse)
~ move_entity(PinkBee, Greenhouse)

~ growthBaccaDellaAddolorata = stepFour
~ growthBarbaDellInciampo = stepFour
~ growthBastoneDellOzioso = stepFour
~ growthBrinaDellImpossibile = stepFour
~ growthCantoDelleCompagne = stepFour
~ growthCardoAspinato = stepFour
~ growthEderaDelleAmanti = stepFour
~ growthErbaLiccia = stepFour
~ growthFalsaPalude = stepFour
~ growthLanaNotturna = stepFour
~ growthLicheneDegliAbissi = stepFour
~ growthNonTiScordarDiTe = stepFour
~ growthOlobino = stepFour
~ growthSpazzata = stepFour

//Step due, l'albero
~ player_firstStepStatus = RANDOM(1,5)
~ player_secondStepStatus = RANDOM(1,5)
~ player_thirdStepStatus = RANDOM(1,5)

//Cucina
~ move_entity(CookingWithFirstCharOBJ, Kitchen)
~ move_entity(CookingWithSecondCharOBJ, Kitchen)
~ move_entity(EatingWithFirstCharOBJ, Kitchen)
~ move_entity(EatingWithSecondCharOBJ, Kitchen)
~ move_entity(CookingWithFranco, Kitchen)
~ move_entity(FirstCharCookingAloneOBJ, Kitchen)
~ move_entity(EatingWithFirstCharOBJ, Kitchen)
~ move_entity(EatingWithSecondCharOBJ, Kitchen)
~ move_entity(EatingWithThirdCharOBJ, Kitchen)
~ move_entity(ThirdCharCookingAloneOBJ, Kitchen)
~ move_entity(SecondCharCookingAloneOBJ, Kitchen)
~ move_entity(EatingWithThirdCharOBJ, Kitchen)
~ move_entity(CookingWithThirdCharOBJ, Kitchen)
~ move_entity(ThirdCharCookingAloneOBJ, Kitchen)




=== debug_dialogue_text
// Tutto questo primo blocco me lo tengo se serve testare di nuovo il nuovo sistema di scelte
- (top)
~ move_entity(FirstCharacter, Bedroom)
Chitarra ci dice qualcosa.

    + Risposta fuoco.
    -> glyph_choice_manager(false, fireC) ->

    + Risposta aria.
    -> glyph_choice_manager(false, airC) ->

    + Risposta terra.
    -> glyph_choice_manager(false, earthC) ->

    + Risposta acqua.
    -> glyph_choice_manager(false, waterC) ->

    + Risposta spirito.
    -> glyph_choice_manager(false, aetherC) ->

    + Voglio andare avanti
    -> gm_rm_activation.settings_and_choices

- (top2)
METTO IN EVIDENZA
Dopo la scelta:
        firstChar_last_aether è {firstChar_last_aether}
        firstChar_last_earth è {firstChar_last_earth}
        firstChar_last_air è {firstChar_last_air}
        firstChar_last_water è {firstChar_last_water}
        firstChar_last_fire è {firstChar_last_fire}

        firstChar_aether è {firstChar_aether}
        firstChar_earth è {firstChar_earth}
        firstChar_air è {firstChar_air}
        firstChar_water è {firstChar_water}
        firstChar_fire è {firstChar_fire}

        player_fire_first_char è {player_fire_first_char}
        player_earth_first_char è {player_earth_first_char}
        player_air_first_char è {player_air_first_char}
        player_water_first_char è {player_water_first_char}
        player_aether_first_char è {player_aether_first_char}

        firstChar_usedSigil è {firstChar_usedSigil}
        firstChar_totalChoices è {firstChar_totalChoices}

        firstChar_lastRelationshipIndicator è {firstChar_lastRelationshipIndicator}
        firstChar_relationshipIndicator è {firstChar_relationshipIndicator}

        player_fire è {player_fire}
        player_earth è {player_earth}
        player_air è {player_air}
        player_water è {player_water}
        player_aether è {player_aether}
IL SIGILLO ATTUALE è {glyph_actualActiveSigil}
UTILIZZI RIMASTI = {glyph_actualSigilUses}

+ Rifaccio una domanda a Chitarra.
+ Attivo un sigillo di prova
    ~ glyph_actualActiveSigil = AirFireWater
    ~ glyph_actualSigilUses = glyph_maxSigilUses

+ Scelte PG testing
    + + Scelta PG fire
        -> glyph_choice_manager(true, fireC) -> top2
    + + Scelta PG air
        -> glyph_choice_manager(true, airC) ->  top2
    + + Scelta PG water
        -> glyph_choice_manager(true, waterC) -> top2
    + + Scelta PG earth
        -> glyph_choice_manager(true, earthC) ->  top2
    + + Scelta PG aether
        -> glyph_choice_manager(true, aetherC) ->  top2

+ Voglio andare avanti
    -> gm_rm_activation.settings_and_choices
-
-> top
