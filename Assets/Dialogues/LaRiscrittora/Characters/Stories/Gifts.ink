
/* ---------------------------------

    Gestione inchiostro

 ----------------------------------*/
//Lista dei gifts che si possono trovare in gioco.
LIST gifts = blanket, emptyvase 
VAR findedGifts = ()

//Gestione dell'inchiostro per i vari spettri. Nomi e valori sono temporanei. L'idea per ora è: se sono su Low, posso fare solo una scelta forte. Con Normal, due e via di seguito. Ogni scelta mi scala indietro nella lista di stati.
LIST inkLevel = Empty, Low, Normal, Medium, High
VAR firstCharacterInkLevel = Low
VAR secondCharacterInkLevel = Low
VAR thirdCharacterInkLevel = Low
VAR fourthCharacterInkLevel = Low
VAR fifthCharacterInkLevel = Low
VAR sixthCharacterInkLevel = Low
VAR seventhCharacterInkLevel = Low




//Formula per tradurre la quantità di inchiostro in valori espliciti
=== inkActions
VAR Ink = ()
{
    - firstStory == Active:
        ~ Ink = firstCharacterInkLevel
    - secondStory == Active:
        ~ Ink = secondCharacterInkLevel
    - thirdStory == Active:
        ~ Ink = thirdCharacterInkLevel
    - fourthStory == Active:
        ~ Ink = fourthCharacterInkLevel
    - fifthStory == Active:
        ~ Ink = fifthCharacterInkLevel
    - sixthStory== Active:
        ~ Ink = sixthCharacterInkLevel 
    - seventhStory == Active:
        ~ Ink = seventhCharacterInkLevel     
}

{Ink:
    - Empty:
        <i>Non hai inchiostro per lo spettro, dovrai trovare la tua strada da {pronouns has him: solo|{pronouns has her: sola|solə}}.</i>
    - Low:
        <i>Hai una azione forte a disposizione</i>
    - Normal:
        <i>Hai due azioni forti a disposizione</i>
    - Medium:
        <i>Hai tre azioni forti a disposizione</i>
    - High:
        <i>Hai tre azioni forti a disposizione</i>
    - else:
        <i>Errore: non riesco a capire quante azioni hai a disposizione</i>
}
->->