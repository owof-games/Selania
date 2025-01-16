//Variabili legate alle personagge
// Lista con i possibili stati delle variabili legate alle contraddizioni
//Con nuova versione: NonIniziata non riguarda più la storia principale, ma l'accesso alla personaggia
LIST statoStorie = NonIniziata, InCorso, Conclusa

VAR storiaDue = NonIniziata
VAR storiaTre = NonIniziata
VAR storiaQuattro = NonIniziata
VAR storiaCinque = NonIniziata
VAR storiaSei = NonIniziata
VAR storiaSette = NonIniziata


VAR donoPersonaggiaDue = false
VAR donoPersonaggiaTre = false
VAR donoPersonaggiaQuattro = false
VAR donoPersonaggiaCinque = false
VAR donoPersonaggiaSei = false
VAR donoPersonaggiaSette = false


VAR counterSpostamenti = 0


//Gestione spettro uno: il Vuoto.
LIST possibiliStatiPersonaggiaUno = SpettroDelVuoto, LArrabbiato, IlGuarente, IlTerrorizzato, LAbbandonato, IlSocievole, IlConsapevole
VAR effettivoStatoPersonaggiaUno = SpettroDelVuoto

VAR storiaUno = NonIniziata
VAR donoPersonaggiaUno = false
VAR eventoSpecialePersonaggiaUno = false

VAR terrore = 0
VAR abbandono = 0
VAR rabbia = 0

VAR ferito = 0
VAR socievole = 0
VAR consapevole = 0


//Gestione spettro due

LIST possibiliStatiPersonaggiaDue = LaVegliante, NuovoStatoUnoDue, NuovoStatoDueDue, NuovoStatoTreDue
VAR effettivoStatoPersonaggiaDue = LaVegliante

LIST possibiliStatiPersonaggiaTre = LIndeciso, NuovoStatoUnoTre, NuovoStatoDueTre, NuovoStatoTreTre
VAR effettivoStatoPersonaggiaTre = LIndeciso

LIST possibiliStatiPersonaggiaQuattro = LaMondatrice, NuovoStatoUnoQuattro, NuovoStatoDueQuattro, NuovoStatoTreQuattro
VAR effettivoStatoPersonaggiaQuattro = LaMondatrice

LIST possibiliStatiPersonaggiaCinque = Oscar, NuovoStatoUnoCinque, NuovoStatoDueCinque, NuovoStatoTreCinque
VAR effettivoStatoPersonaggiaCinque = Oscar

LIST possibiliStatiPersonaggiaSei = LoSpecchio, NuovoStatoUnoSei, NuovoStatoDueSei, NuovoStatoTreSei
VAR effettivoStatoPersonaggiaSei = LoSpecchio

LIST possibiliStatiPersonaggiaSette = LaDisegnatrice, NuovoStatoUnoSette, NuovoStatoDueSette, NuovoStatoTreSette
VAR effettivoStatoPersonaggiaSette= LaDisegnatrice

//Variabili per verificare se c'è o meno l'accesso all'evento speciale di un singolo spettro

VAR eventoSpecialePersonaggiaDue = false
VAR eventoSpecialePersonaggiaTre = false
VAR eventoSpecialePersonaggiaQuattro = false
VAR eventoSpecialePersonaggiaCinque = false
VAR eventoSpecialePersonaggiaSei = false
VAR eventoSpecialePersonaggiaSette = false

=== function traduttoreSpettri(effettivoStatoSpettro)
    {effettivoStatoSpettro:

    //Spettro Uno
        - SpettroDelVuoto:
            ~ return "il Vuoto"
        - IlConsapevole: 
            ~ return "il Consapevole"
        - IlGuarente: 
            ~ return "il guarente"    
        - IlSocievole: 
            ~ return "il Socievole"
        - IlTerrorizzato: 
            ~ return "il Terrorizzato"
        - LAbbandonato: 
            ~ return "l'Abbandonato"    
        - LArrabbiato: 
            ~ return "l'Arrabbiato"
        - LaVegliante:
            ~ return "la Vegliante"
        - LIndeciso:
            ~ return "l'Indeciso"
        - LaMondatrice:
            ~ return "la Mondatrice"
        - Oscar:
            ~ return "Oscar"
        - LoSpecchio:
            ~ return "lo Specchio"
        - LaDisegnatrice:
            ~ return "la Disegnatrice"

    }

=== function traduttoreSpettriArticoloMaiuscolo(effettivoStatoSpettro)
    {effettivoStatoSpettro:

    //Spettro Uno
        - SpettroDelVuoto:
            ~ return "Il Vuoto"
        - IlConsapevole: 
            ~ return "Il Consapevole"
        - IlGuarente: 
            ~ return "Il Guarente"    
        - IlSocievole: 
            ~ return "Il Socievole"
        - IlTerrorizzato: 
            ~ return "Il Terrorizzato"
        - LAbbandonato: 
            ~ return "L'Abbandonato"    
        - LArrabbiato: 
            ~ return "L'Arrabbiato"
        - LaVegliante:
            ~ return "La Vegliante"
        - LIndeciso:
            ~ return "L'Indeciso"
        - LaMondatrice:
            ~ return "La Mondatrice"
        - Oscar:
            ~ return "Oscar"
        - LoSpecchio:
            ~ return "Lo Specchio"
        - LaDisegnatrice:
            ~ return "La Disegnatrice"

    }

=== function check_statusVsInchiostro(status, list)
//  A seconda del valore di un certo status di una entità (es: rabbia, terrore etc), dobbiamo verificare se l'inchiostro è sufficiente per intervenire o meno su quello status, e di conseguenza permettere o meno di condizionare lo spettro.
// PIù è ALTO IL VALORE DI UNO STATUS, MENO INCHIOSTRO MI SERVE (perché significa che ci ho lavorato durante la conversazione)

{
    - status == 1:
        {
        - list has Medio:
            ~ return true
        - list has Altissimo:
            ~ return true
        - else:
            ~ return false            
        }
    - status == 2:
        {
        - list has Normale:
            ~ return true
        - list has Medio:
            ~ return true
        - list has Altissimo:
            ~ return true
        - else:
            ~ return false            
        }
    - status == 3:
        {
        - list hasnt Vuoto:
            ~ return true
        - else:
            ~ return false
        }

    - else:
        ~ return false
}


//Non è una funzione, ma un check per vedere se attivare o meno le storie delle personagge
=== story_start

{
//Dopo dieci spostamenti, compare il personaggio uno
    - counterSpostamenti == 5 && storiaUno == NonIniziata:
            ~ move_entity(PersonaggiaUno, BusStop)
            ~ storiaUno = InCorso
            
//Finita la storia col personaggio uno ho resettato il counter, e dopo dieci spostamenti compaiono il personaggio due e tre.        
    - counterSpostamenti == 5 && storiaUno == Conclusa && storiaDue == NonIniziata:
            ~ move_entity(PersonaggiaDue, BusStop)    
            ~ storiaDue = InCorso
            
    - counterSpostamenti == 5 && storiaUno == Conclusa && storiaTre == NonIniziata:
            ~ move_entity(PersonaggiaTre, BusStop)    
            ~ storiaTre = InCorso
            
//I reset ci sono solo a fine di una storia. Per cui per creare un po' di delay con la comparsa del quarto personaggio, aumento solo il valoure del counterSpostamenti
    - counterSpostamenti == 20 && storiaUno == Conclusa && storiaQuattro == NonIniziata:
        //Ma magari questo spettro vuole comparire altrove
            ~ move_entity(PersonaggiaQuattro, BusStop)
            ~ storiaQuattro = InCorso
            
//Ora l'idea è che le altre storie si aprano sempre con un certo delay, ma non posso sapere quale delle tre precedenti verrà affrontata prima o dopo dalla giocatrice.
//Una idea può essere: fare in modo che 5 compaia quando una delle tre storie intermedie sia conclusa, 6 quando due son concluse, 7 quando tutte son state concluse.
//Quindi il counter non serve più a nulla.
    - storiaCinque == NonIniziata && storiaDue == Conclusa or storiaTre == Conclusa or storiaQuattro == Conclusa:
                ~ move_entity(PersonaggiaCinque, BusStop)
                ~ storiaCinque = InCorso
                
    - storiaSei == NonIniziata && (storiaDue == Conclusa && storiaTre == Conclusa) or (storiaDue == Conclusa && storiaQuattro == Conclusa) or (storiaTre == Conclusa && storiaQuattro == Conclusa):
                ~ move_entity(PersonaggiaSei, BusStop)    
                ~ storiaSei = InCorso
                
    - storiaSette == NonIniziata && storiaDue == Conclusa && storiaTre == Conclusa && storiaQuattro == Conclusa:
                ~ move_entity(PersonaggiaSette, BusStop)    
                ~ storiaSette = InCorso
                                
}

->->
