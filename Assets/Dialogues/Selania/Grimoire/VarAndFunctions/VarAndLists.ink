// Con poche eccezioni, una pagina del grimorio può passare da lucchettata a disponibile per motivazioni diverse.
// Prendiamo Appendici: non so quale delle sei sottosezioni si aprirà prima, e ogni sottosezione può avere più parti di testo collegate a storylets il cui ordine di accesso è imprevedibile.
//Una cosa sicura però è che il secondo e primo livello sono influenzati da cosa c'è o meno nel terzo livello.
// L'idea quindi è di fare una lista VAR che parte vuota, e si riempie man mano che viene raggiunta una condizione.
// Se la lista VAR è vuota, il bottone di primo livello è disattivato.
// Se ha almeno un elemento invece il bottone si attiva.
// I bottoni di secondo livello invece vanno a vedere cosa c'è nella lista, così come i testi del terzo livello.

// in
VAR grimoire_isEnabled = false

LIST grimoire_allElements = 
//Appendici
    grimChoicesMentor, grimChoicesWitch, grimGreenhouseMentor, grimInkMentor, grimRewritingMentor, grimSigilsMentor, grimSigilsWitch,

//Storylets Chitarra
    grimFirstCharOne, grimFirstCharPresentation, grimFirstCharTwo, grimFirstCharThree, grimFirstCharFour, grimFirstCharFive, grimFirstCharSix, grimFirstCharSeven, grimFirstCharEight, grimFirstCharNine, grimFirstCharTen, grimFirstCharEleven, grimFirstCharTwelve, grimFirstOpenKitchen, grimFirstCharNovel, grimFirstCharDog, grimFirstCharKitchenOne, grimFirstCharKitchenTwo, grimFirstCharKitchenThree, grimFirstCharKitchenEnded, grimFirstCharKitchenPositiveReaction, grimFirstCharKitchenNegativeReaction, grimFirstCharKitchenNeutralReaction, grimFirstCharKitchenAlone, grimFirstCharProposal, grimFirstCharNewName, grimFirstCharMentorFeedback, grimFirstCharLetterOne, grimFirstCharLetterTwo, grimFirstCharLetterThree, grimFirstCharLetterFour,

//Storylets Riccio
    grimSecondCharOne, grimSecondCharPresentation, grimSecondCharTwo, grimSecondCharThreeHim, grimSecondCharThreeHer, grimSecondCharThreeThey, grimSecondCharFour, grimSecondCharFive, grimSecondCharSix, grimSecondCharSeven, grimSecondCharEight, grimSecondCharNine, grimSecondCharTen, grimSecondCharEleven, grimSecondCharTwelve, grimSecondCharCarla, grimSecondOpenLibrary, grimSecondCharNovel, grimSecondCharDog, grimSecondCharKitchenOne, grimSecondCharKitchenTwo, grimSecondCharKitchenThree, grimSecondCharKitchenEnded, grimSecondCharKitchenPositiveReaction, grimSecondCharKitchenNegativeReaction, grimSecondCharKitchenNeutralReaction,grimSecondCharKitchenAlone, grimSecondCharProposal, grimSecondCharNewName, grimSecondCharMentorFeedback, grimSecondCharLetterOne, grimSecondCharLetterTwo, grimSecondCharLetterThree, grimSecondCharLetterFour,

//Storylets Boccale
    grimThirdCharOne, grimThirdCharPresentation, grimThirdCharTwo, grimThirdCharThree, grimThirdCharFour, grimThirdCharFive, grimThirdCharSix, grimThirdPreOpenNest, grimThirdOpenNest, grimThirdCharNovel, grimThirdCharDog, grimThirdCharKitchenOne, grimThirdCharKitchenTwo, grimThirdCharKitchenThree, grimThirdCharKitchenEnded, grimThirdCharKitchenPositiveReaction, grimThirdCharKitchenNegativeReaction, grimThirdCharKitchenNeutralReaction, grimThirdCharKitchenAlone, grimThirdCharFirstProposal, grimThirdCharFirstRewriting, grimThirdCharSecondProposal, grimThirdCharNewName, grimThirdCharMentorFeedback, grimThirdCharLetterOne, grimThirdCharLetterTwo, grimThirdCharLetterThree, grimThirdCharLetterFour, grimThirdCharLetterFive, grimThirdCharLetterSix, grimThirdCharLetterSeven, grimThirdCharLetterEight,

//Storylets Nonna Molotov
    grimFourthCharOne, grimFourthCharPresentation, grimFourthCharTwo, grimFourthCharThree, grimFourthCharFour, grimFourthCharFive, grimFourthCharSix, grimFourthCharSeven, grimFourthCharEight, grimFourthCharNine, grimFourthCharTen, grimFourthCharEleven, grimFourthCharTwelve, grimFourthCharNovel, grimFourthCharDog, grimFourthCharKitchenOne, grimFourthCharKitchenTwo, grimFourthCharKitchenThree, grimFourthCharKitchenEnded, grimFourthCharKitchenPositiveReaction, grimFourthCharKitchenNegativeReaction, grimFourthCharKitchenNeutralReaction,grimFourthCharKitchenAlone, grimFourthCharProposal, grimFourthCharNewName, grimFourthCharMentorFeedback, grimFourthCharLetterOne, grimFourthCharLetterTwo, grimFourthCharLetterThree, grimFourthCharLetterFour,

//Storylets Mostro
    grimFifthCharOne, grimFifthCharPresentation, grimFifthCharTwo, grimFifthCharThree, grimFifthCharFour, grimFifthCharFive, grimFifthCharSix, grimFifthCharSeven, grimFifthCharEight, grimFifthCharNine, grimFifthCharTen, grimFifthCharEleven, grimFifthCharTwelve, grimFifthCharNovel, grimFifthCharDog, grimFifthCharKitchenOne, grimFifthCharKitchenTwo, grimFifthCharKitchenThree, grimFifthCharKitchenEnded, grimFifthCharKitchenPositiveReaction, grimFifthCharKitchenNegativeReaction, grimFifthCharKitchenNeutralReaction,grimFifthCharKitchenAlone, grimFifthCharProposal, grimFifthCharNewName, grimFifthCharMentorFeedback, grimFifthCharLetterOne, grimFifthCharLetterTwo, grimFifthCharLetterThree, grimFifthCharLetterFour,

//Storylets Mentore
    grimMentorOne, grimMentorPresentation, grimMentorTwo, grimMentorThree, grimMentorFour, grimMentorFive, grimMentorSix, grimMentorSeven, grimMentorEight, grimMentorNine, grimMentorTen, grimMentorEleven, grimMentorTwelve, grimMentorNovel, grimMentorDog, grimMentorLiar, grimMentorViolence, grimMentorOlobinoUno, grimMentorOlobinoDue, grimKitchenMentor, grimMentorRage, grimMentorNotMandatory, grimMentorNewMail, grimMentorFirstSecretEnding, grimMentorSecondSecretEnding, grimMentorThirdSecretEnding, grimMentorFourthSecretEnding, grimMentorFifthSecretEnding,

//Storylets strega
    grimWitchFirstDebrief, grimWitchSecondDebrief, grimWitchThirdDebrief, grimWitchFourthDebrief, grimWitchFifthDebrief, grimWitchIntro, grimWitchFrog, grimWitchMainOne, grimWitchMainTwo, grimWitchMainThree, grimWitchMainFour, grimWitchMainFive, grimWitchBook, grimWitchOpenDump, grimWitchAllSigilsOpened,

//Storylets Franco
    grimFrancoFirst, grimFrancoAllDocuments, grimFrancoSpecialMissionOneFeedback, grimFrancoThirdIngredientFailure,

//Common Storylets
    grimFirstSecondChar, grimFirstThirdChar, grimFirstCharMentor, grimFirstCharMentorAboutThirdChar, grimFirstCharFranco, grimSecondCharMentorOne, grimSecondCharMentorPeace, grimSecondThirdChar, grimSecondCharFranco, grimThirdCharFranco, grimThirdCharMentor, grimWitchThirdChar, grimMentorFranco, grimMentorWitchOne, grimFourthFifthChar, grimFourthCharFranco, grimFifthCharFranco

VAR grimoire_firstChar = ()
VAR grimoire_secondChar = ()
VAR grimoire_thirdChar = ()
VAR grimoire_fourthChar = ()
VAR grimoire_fifthChar = ()
VAR grimoire_witch = ()
VAR grimoire_franco = ()
VAR grimoire_appendices = ()


//Liste per gestire i tag
LIST grimoire_possibilePortraitsStatus = missing, owned, locked, hidden, selected, consumed, unclickable, default, left, right

//Lista di oggetti creati ad hoc per gestire situazioni particolari (es: ultima pagina del terzo livello delle piante)
LIST grimoire_specialElements = Hidden, Backpack

//Variabili per i doni e gli ingredienti
VAR grimoire_chosenPlant = ()

//Lista dei doni che si possono trovare in gioco.
VAR backpack_findedGifts = ()


//Liste delle appendici per chiamare icone e descrizioni
LIST grimoire_allAppendixes = AppendiceA, AppendiceB, AppendiceC, AppendiceD, AppendiceE, LettersAndDocuments