
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
TODO: questa formula è da trasformare come quella qui sotto
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
        <i>Non hai inchiostro a disposizione.</i>
    - Low:
        <i>Hai una goccia di inchiostro a disposizione.</i>
    - Normal:
        <i>Hai due goccie di inchiostro a disposizione.</i>
    - Medium:
        <i>Hai tre goccie di inchiostro a disposizione.</i>        
    - High:
        <i>Hai tre goccie di inchiostro a disposizione, e la personaggia ti darà una informazione importante.</i>
    - else:
        <i>Errore: non riesco a capire quante azioni hai a disposizione.</i>
}
->->

=== function inkTranslator(InkLevel)
{
    - InkLevel == firstCharacterInkLevel:
        ~ Ink = firstCharacterInkLevel
    - InkLevel == secondCharacterInkLevel:
        ~ Ink = secondCharacterInkLevel
}
{Ink:
    - Empty:
        vuoto
    - Low:
        hai una goccia di inchiostro
    - Normal:
        hai due goccie di inchiostro
    - Medium:
        hai tre goccie di inchiostro a disposizione     
    - High:
        hai tre goccie di inchiostro a disposizione, e la personaggia ti darà una informazione importante
    - else:
        <i>Errore: non riesco a capire quante azioni hai a disposizione.</i>
}
