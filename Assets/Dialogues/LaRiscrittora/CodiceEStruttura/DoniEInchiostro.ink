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


LIST doni = muschiodelleamanti, baccadellaaddolorata, mela, pera, fungo, banana, ocelot

VAR doniNonTrovati = (ocelot, muschiodelleamanti, baccadellaaddolorata)
VAR doniNonTrovatiLuogo = (fungo, banana, mela, pera)

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
        - luoghiDono has luogoDono: ->->
        - luoghiDono hasnt luogoDono:
            Hai trovato {dono}
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
VAR statoInchiostroSpettroUno = Scarso
VAR statoInchiostroSpettroDue = Scarso
VAR statoInchiostroSpettroTre = Scarso
VAR statoInchiostroSpettroQuattro = Scarso
VAR statoInchiostroSpettroCinque = Scarso
VAR statoInchiostroSpettroSei = Scarso
VAR statoInchiostroSpettroSette = Scarso




//Formula per tradurre la quantità di inchiostro in valori espliciti
=== azioniInchiostro
VAR Inchiostro = ()
{
    - storiaUno == InCorso:
        ~ Inchiostro = statoInchiostroSpettroUno
    - storiaDue == InCorso:
        ~ Inchiostro = statoInchiostroSpettroDue
    - storiaTre == InCorso:
        ~ Inchiostro = statoInchiostroSpettroTre
    - storiaQuattro == InCorso:
        ~ Inchiostro = statoInchiostroSpettroQuattro
    - storiaCinque == InCorso:
        ~ Inchiostro = statoInchiostroSpettroCinque
    - storiaSei== InCorso:
        ~ Inchiostro = statoInchiostroSpettroSei 
    - storiaSette == InCorso:
        ~ Inchiostro = statoInchiostroSpettroSette     
}

{Inchiostro:
    - Vuoto:
        Non hai inchiostro per lo spettro, dovrai trovare la tua strada da solo.
    - Scarso:
        Hai una azione forte a disposizione.
    - Normale:
        Hai due azioni forti a disposizione.
    - Medio:
        Hai tre azioni forti a disposizione.
    - Altissimo:
        Hai tre azioni forti a disposizione.
    - else:
        Errore
}
->->