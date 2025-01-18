/* ---------------------------------

    Gestione dei doni
    
 ----------------------------------*/


//Liste per la gestione dei doni agli spettri
//DONI: lista di tutti i possibili doni.
//DONINONTROVATI: sono i doni che verranno dati da eventi, anime etc.
//DONINONTROVATILUOGO: sono quelli assegnati invece in modo randomico da un luogo.
//DONITROVATI: i doni che abbiamo nell'inventario.
//DONIDONATI: i doni che abbiamo già consegnato.
//LUOGHIDONO: ci serve per far sì che a turno ogni luogo conceda un dono.
//dato che alcuni doni possono venire da altre liste (es: serra) e avere quindi già in uso lo stesso nome, la nomenclatura qui sarà tutta in minuscolo


LIST doni = coperta, vasovuoto

VAR doniColtivabili = (MuschioDelleAmanti, BaccaDellaAddolorata, LaSpazzata)

VAR doniNonTrovati = (MuschioDelleAmanti, BaccaDellaAddolorata, LaSpazzata)
VAR doniNonTrovatiLuogo = (coperta, vasovuoto)

VAR doniTrovati = ()
VAR doniDonati = ()
VAR luoghiDono = ()


//Funzione di randomizzazione dono nei luoghi
=== randomizzazione_dono_luoghi
~ temp luogoDono = entity_location(PG)
~ temp dono = LIST_RANDOM(doniNonTrovatiLuogo)
~ temp dice_roll = RANDOM(1, 6)

{debug: Doni non trovati: {doniNonTrovatiLuogo}}
{debug: Doni trovati: {doniTrovati}}
{debug: Doni donati: {doniDonati}}
{debug: Luoghi da cui hai già ricevuto un dono: {luoghiDono}}
{debug: Valore dado: {dice_roll}}



{
    - dice_roll > 3: ->->
    - else:
        {
        - doniNonTrovatiLuogo == (): ->->
        - luoghiDono has luogoDono: ->->
        - luoghiDono hasnt luogoDono:
            <i>Hai trovato {list_with_commas(dono)}.</i>
            ~ doniNonTrovatiLuogo -= dono
            ~ doniTrovati += dono
            ~ luoghiDono += luogoDono
        - else:
            Errore: non riesco a rintracciare il luogo
        }
    
}



{debug: Doni non trovati: {doniNonTrovatiLuogo}}
{debug: Doni trovati: {doniTrovati}}
{debug: Doni donati: {doniDonati}}
{debug: Luoghi da cui hai già ricevuto un dono: {luoghiDono}}
    

->->

/* ---------------------------------

    Gestione inchiostro

 ----------------------------------*/

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
        <i>Non hai inchiostro per lo spettro, dovrai trovare la tua strada da {pronomi has maschili: solo|{pronomi has femminili: sola|solə}}.</i>
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