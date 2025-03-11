/* ---------------------------------

    Gestione inchiostro

 ----------------------------------*/
//Lista dei gifts che si possono trovare in gioco.
LIST gifts = blanket, emptyvase 
VAR findedGifts = ()

//Spazio dove caricare temporaneamente quale livello di inchiostro stiamo controllando
VAR Ink = ()

//Gestione dell'inchiostro per i vari spettri. Nomi e valori sono temporanei. L'idea per ora è: se sono su Low, posso fare solo una scelta forte. Con Normal, due e via di seguito. Ogni scelta mi scala indietro nella lista di stati.
LIST ink = Empty, Low, Normal, Medium, High
VAR firstCharacterInkLevel = Empty
VAR secondCharacterInkLevel = Empty
VAR thirdCharacterInkLevel = Empty
VAR fourthCharacterInkLevel = Empty
VAR fifthCharacterInkLevel = Empty




//Formula chiamata prima dello statement, per tenere conto del rapporto effettivo.
=== function inkLevel(InkLevel)
{
    - InkLevel == firstCharacterInkLevel:
        ~ Ink = firstCharacterInkLevel
    
    - InkLevel == secondCharacterInkLevel:
        ~ Ink = secondCharacterInkLevel
    
    - InkLevel == thirdCharacterInkLevel:
        ~ Ink = thirdCharacterInkLevel        
}

{Ink:
    - Empty:
        <i>Dopo il dono consegnato e il rapporto creato, {name} si ritrova senza inchiostro. Potrà fare solo l'intervento garantito.</i>
    - Low:
        <i>Dopo il dono consegnato e il rapporto creato, {name} ha una goccia di inchiostro a disposizione. Potrà fare l'intervento garantito e un intervento extra.</i>
    - Normal:
        <i>Dopo il dono consegnato e il rapporto creato, {name} ha due goccie di inchiostro a disposizione. Potrà fare l'intervento garantito e altri due interventi extra.</i>
    - Medium:
        <i>Dopo il dono consegnato e il rapporto creato, {name} ha tre goccie di inchiostro a disposizione. Potrà fare l'intervento garantito e altri tre interventi extra.</i>        
    - High:
        <i>Dopo il dono consegnato e il rapporto creato, {name} ha tre goccie di inchiostro a disposizione. Potrà fare l'intervento garantito e altri tre interventi extra. E riceverà un'informazione importante.</i>
        {
            - InkLevel == firstCharacterInkLevel:
                ~ firstCharacterSpecialEvent = true
            - InkLevel == secondCharacterInkLevel:
                ~ secondCharacterSpecialEvent = true
            - InkLevel == thirdCharacterInkLevel:
                ~ thirdCharacterSpecialEvent = true    
        }
        
    - else:
        <i>Errore: non riesco a capire quante azioni hai a disposizione.</i>
}


//Funzione che chiamo dopo il dono, per dire quanto inchiostro ho guadagnato.
=== function inkTranslator(InkLevel)
{
    - InkLevel == firstCharacterInkLevel:
        ~ Ink = firstCharacterInkLevel
    
    - InkLevel == secondCharacterInkLevel:
        ~ Ink = secondCharacterInkLevel

    - InkLevel == thirdCharacterInkLevel:
        ~ Ink = thirdCharacterInkLevel

}

{Ink:
    - Empty:
        non hai guadagnato alcuna goccia di inchiostro.
    - Low:
        hai guadagnato una goccia di inchiostro
    - Normal:
        hai guadagnato due goccie di inchiostro
    - Medium:
        hai guadagnato tre goccie di inchiostro a disposizione     
    - High:
        hai guadagnato tre goccie di inchiostro a disposizione, e la personaggia ti darà una informazione importante
    - else:
        <i>Errore: non riesco a capire quante azioni hai a disposizione.</i>
        {debug: <i>Il livello di inchiostro per la prima personaggia è {firstCharacterInkLevel}}

}
