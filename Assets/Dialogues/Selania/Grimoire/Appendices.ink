/*************************

La logica di comparsa delle appendici è:
    * grimoire_choicesAndRelationships: sbloccata quando ce ne parlano o Mentore o Luna.
    * grimoire_greenhouseAndGifts: sbloccata dopo la prima pianta raccolta (backpack_findedGifts != ()) o dopo il commento di Mentore.
    * grimoire_kitchenAndRelationships: dopo l'apertura della cucina da parte di Chitarra.
    * grimoire_inkAndRewriting: dopo il commento di Mentore o di Luna sulla riscrittura.
    * grimoire_Sigils: dopo che ce ne parlano Mentore o Luna (l'idea è comunque di non condividerlo subito).

Lato informazioni, da capire con Mattia come strutturiamo le pagine, perché potrebbe aver senso vedere i libri prima dei commenti, più per impaginazione che altro.

**************************/

=== grimoire_choicesAndRelationships
~ temp charNameOne = translator(firstChar_ActualName)
~ temp charNameTwo = translator(secondChar_ActualName)
~ temp charNameThree = translator(thirdChar_ActualName)
~ temp charNameFour = translator(fourthChar_ActualName)
~ temp mentorName = translator(mentor_ActualName)

/*************************

Commento Mentore se sbloccato

**************************/

/*************************

Commento Luna se sbloccato

**************************/

/*************************

Testo scritto da G.M.

**************************/



->->




=== grimoire_greenhouseAndGifts
~ temp charNameOne = translator(firstChar_ActualName)
~ temp charNameTwo = translator(secondChar_ActualName)
~ temp charNameThree = translator(thirdChar_ActualName)
~ temp charNameFour = translator(fourthChar_ActualName)
~ temp mentorName = translator(mentor_ActualName)

/*************************

Commento Mentore se sbloccato

**************************/
/*************************

Testo scritto da K.

**************************/





->->


=== grimoire_kitchenAndRelationships
~ temp charNameOne = translator(firstChar_ActualName)
~ temp charNameTwo = translator(secondChar_ActualName)
~ temp charNameThree = translator(thirdChar_ActualName)
~ temp charNameFour = translator(fourthChar_ActualName)
~ temp mentorName = translator(mentor_ActualName)

/*************************

    Commento Chitarra

**************************/

/*************************

Testo scritto da O.U.J.

**************************/



->->


=== grimoire_inkAndRewriting
~ temp charNameOne = translator(firstChar_ActualName)
~ temp charNameTwo = translator(secondChar_ActualName)
~ temp charNameThree = translator(thirdChar_ActualName)
~ temp charNameFour = translator(fourthChar_ActualName)
~ temp mentorName = translator(mentor_ActualName)

/*************************

Commento Mentore se sbloccato

**************************/

/*************************

Commento Luna se sbloccato

**************************/

/*************************

Testo scritto da Y.

**************************/


->->




=== grimoire_Sigils
~ temp charNameOne = translator(firstChar_ActualName)
~ temp charNameTwo = translator(secondChar_ActualName)
~ temp charNameThree = translator(thirdChar_ActualName)
~ temp charNameFour = translator(fourthChar_ActualName)
~ temp mentorName = translator(mentor_ActualName)

/*************************

Commento Boccale

**************************/


/*************************

Commento Mentore se sbloccato

**************************/

/*************************

Commento Luna se sbloccato

**************************/
/*************************

Testo scritto da S.C.

**************************/



->->