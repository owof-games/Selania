
/* ---------------------------------

    Gestione inchiostro

 ----------------------------------*/
//Lista dei doni che si possono trovare in gioco.
LIST doni = coperta, vasovuoto 
VAR doniTrovati = ()

//Gestione dell'inchiostro per i vari spettri. Nomi e valori sono temporanei. L'idea per ora è: se sono su Scarso, posso fare solo una scelta forte. Con Normale, due e via di seguito. Ogni scelta mi scala indietro nella lista di stati.
LIST statoInchiostro = Vuoto, Scarso, Normale, Medio, Altissimo
VAR statoInchiostroPersonaggiaUno = Scarso
VAR statoInchiostroPersonaggiaDue = Scarso
VAR statoInchiostroPersonaggiaTre = Scarso
VAR statoInchiostroPersonaggiaQuattro = Scarso
VAR statoInchiostroPersonaggiaCinque = Scarso
VAR statoInchiostroPersonaggiaSei = Scarso
VAR statoInchiostroPersonaggiaSette = Scarso




//Formula per tradurre la quantità di inchiostro in valori espliciti
=== azioniInchiostro
VAR Inchiostro = ()
{
    - storiaUno == InCorso:
        ~ Inchiostro = statoInchiostroPersonaggiaUno
    - storiaDue == InCorso:
        ~ Inchiostro = statoInchiostroPersonaggiaDue
    - storiaTre == InCorso:
        ~ Inchiostro = statoInchiostroPersonaggiaTre
    - storiaQuattro == InCorso:
        ~ Inchiostro = statoInchiostroPersonaggiaQuattro
    - storiaCinque == InCorso:
        ~ Inchiostro = statoInchiostroPersonaggiaCinque
    - storiaSei== InCorso:
        ~ Inchiostro = statoInchiostroPersonaggiaSei 
    - storiaSette == InCorso:
        ~ Inchiostro = statoInchiostroPersonaggiaSette     
}

{Inchiostro:
    - Vuoto:
        <i>Non hai inchiostro per lo spettro, dovrai trovare la tua strada da {pronouns has maschili: solo|{pronouns has femminili: sola|solə}}.</i>
    - Scarso:
        <i>Hai una azione forte a disposizione</i>
    - Normale:
        <i>Hai due azioni forti a disposizione</i>
    - Medio:
        <i>Hai tre azioni forti a disposizione</i>
    - Altissimo:
        <i>Hai tre azioni forti a disposizione</i>
    - else:
        <i>Errore: non riesco a capire quante azioni hai a disposizione</i>
}
->->