// Con poche eccezioni, una pagina del grimorio può passare da lucchettata a disponibile per motivazioni diverse.
// Prendiamo Appendici: non so quale delle sei sottosezioni si aprirà prima, e ogni sottosezione può avere più parti di testo collegate a storylets il cui ordine di accesso è imprevedibile.
//Una cosa sicura però è che il secondo e primo livello sono influenzati da cosa c'è o meno nel terzo livello.
// L'idea quindi è di fare una lista VAR che parte vuota, e si riempie man mano che viene raggiunta una condizione.
// Se la lista VAR è vuota, il bottone di primo livello è disattivato.
// Se ha almeno un elemento invece il bottone si attiva.
// I bottoni di secondo livello invece vanno a vedere cosa c'è nella lista, così come i testi del terzo livello.

LIST grimoire_allElements = 
//Appendici
    grimChoicesMentor, grimChoicesWitch, grimGreenhouseMentor, grimKitchenChitarra, grimInkMentor, grimRewritingMentor, grimSigilsBoccale, grimSigilsMentor, grimSigilsWitch,

//Storylets Chitarra
    grimFirstCharOne, grimFirstCharTwo, grimFirstCharThree, grimFirstCharFour, grimFirstCharFive, grimFirstCharSix, grimFirstCharSeven, grimFirstCharEight, grimFirstCharNine, grimFirstCharTen, grimFirstCharEleven, grimFirstCharTwelve, grimFirstOpenKitchen, grimFirstCharNovel, grimFirstCharDog, grimFirstCharKitchenOne, grimFirstCharKitchenTwo, grimFirstCharKitchenThree, grimFirstCharKitchenEnded, grimFirstCharKitchenAlone, grimFirstCharProposal, grimFirstCharNewName, grimFirstCharMentorFeedback, grimFirstCharLetterOne, grimFirstCharLetterTwo, grimFirstCharLetterThree,

//Storylets Riccio
    grimSecondCharOne, grimSecondCharTwo, grimSecondCharThreeHim, grimSecondCharThreeHer, grimSecondCharThreeThey, grimSecondCharFour, grimSecondCharFive, grimSecondCharSix, grimSecondCharSeven, grimSecondCharEight, grimSecondCharNine, grimSecondCharTen, grimSecondCharEleven, grimSecondCharTwelve, grimSecondOpenLibrary, grimSecondCharNovel, grimSecondCharDog, grimSecondCharKitchenOne, grimSecondCharKitchenTwo, grimSecondCharKitchenThree, grimSecondCharKitchenEnded, grimSecondCharKitchenAlone, grimSecondCharProposal, grimSecondCharNewName, grimSecondCharMentorFeedback, grimSecondCharLetterOne, grimSecondCharLetterTwo, grimSecondCharLetterThree,

//Storylets Boccale
    grimThirdCharOne, grimThirdCharTwo, grimThirdCharThree, grimThirdCharFour, grimThirdCharFive, grimThirdCharSix, grimThirdCharSeven, grimThirdCharEight, grimThirdCharNine, grimThirdCharTen, grimThirdCharEleven, grimThirdCharTwelve, grimThirdOpenNest, grimThirdCharNovel, grimThirdCharDog, grimThirdCharKitchenOne, grimThirdCharKitchenTwo, grimThirdCharKitchenThree, grimThirdCharKitchenEnded, grimThirdCharKitchenAlone, grimThirdCharProposal, grimThirdCharNewName, grimThirdCharMentorFeedback, grimThirdCharLetterOne, grimThirdCharLetterTwo, grimThirdCharLetterThree,

//Storylets Nonna Molotov
    grimFourthCharOne, grimFourthCharTwo, grimFourthCharThree, grimFourthCharFour, grimFourthCharFive, grimFourthCharSix, grimFourthCharSeven, grimFourthCharEight, grimFourthCharNine, grimFourthCharTen, grimFourthCharEleven, grimFourthCharTwelve, grimFourthCharNovel, grimFourthCharDog, grimFourthCharKitchenOne, grimFourthCharKitchenTwo, grimFourthCharKitchenThree, grimFourthCharKitchenEnded, grimFourthCharKitchenAlone, grimFourthCharProposal, grimFourthCharNewName, grimFourthCharMentorFeedback, grimFourthCharLetterOne, grimFourthCharLetterTwo, grimFourthCharLetterThree,

//Storylets Mostro
    grimFifthCharOne, grimFifthCharTwo, grimFifthCharThree, grimFifthCharFour, grimFifthCharFive, grimFifthCharSix, grimFifthCharSeven, grimFifthCharEight, grimFifthCharNine, grimFifthCharTen, grimFifthCharEleven, grimFifthCharTwelve, grimFifthCharNovel, grimFifthCharDog, grimFifthCharKitchenOne, grimFifthCharKitchenTwo, grimFifthCharKitchenThree, grimFifthCharKitchenEnded, grimFifthCharKitchenAlone, grimFifthCharProposal, grimFifthCharNewName, grimFifthCharMentorFeedback, grimFifthCharLetterOne, grimFifthCharLetterTwo, grimFifthCharLetterThree,

//Storylets Mentore
    grimMentorOne, grimMentorTwo, grimMentorThree, grimMentorFour, grimMentorFive, grimMentorSix, grimMentorSeven, grimMentorEight, grimMentorNine, grimMentorTen, grimMentorEleven, grimMentorTwelve, grimMentorNovel, grimMentorDog, grimMentorWitchTwo, grimMentorLiar, grimMentorViolence, grimMentorOlobinoUno, grimMentorOlobinoDue,

//Storylets strega
    grimWitchFirstCharFeedback, grimWitchSecondCharFeedback, grimWitchThirdCharFeedback, grimWitchFourthCharFeedback, grimWitchFifthCharFeedback, grimWitchIntro, grimWitchFrog, grimWitchMainOne, grimWitchMainTwo, grimWitchMainThree, grimWitchMainFour, grimWitchMainFive, grimWitchBook, grimWitchOpenDump,

//Storylets Franco
    grimFrancoFirst,    

//Common Storylets
    grimFirstSecondChar, grimFirstThirdChar, grimFirstCharMentor, grimFirstCharFranco, grimSecondCharMentorOne, grimSecondCharMentorPeace, grimSecondThirdChar, grimSecondCharFranco, grimThirdCharFranco, grimThirdCharMentor, grimMentorFranco, grimMentorWitchOne

VAR grimoire_firstChar = ()
VAR grimoire_secondChar = ()
VAR grimoire_thirdChar = ()
VAR grimoire_fourthChar = ()
VAR grimoire_fifthChar = ()
VAR grimoire_witch = ()
VAR grimoire_franco = ()
VAR grimoire_appendices = ()


//Liste per gestire i tag
LIST grimoire_possibilePlantsStatus = missing, owned
LIST grimoire_possibileSigilsStatus = selected, consumed, unclickable, default