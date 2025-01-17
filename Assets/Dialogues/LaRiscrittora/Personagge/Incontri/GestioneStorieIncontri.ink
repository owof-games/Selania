//Variabili legate alle personagge
//Con nuova versione: NonIniziata non riguarda più la storia principale, ma l'accesso alla personaggia
    LIST statoStorie = NonIniziata, InCorso, Conclusa


//Gestione prima personaggia.
    LIST possibiliStatiPersonaggiaUno = IlGiocoso, LIndeciso
    VAR effettivoStatoPersonaggiaUno = LIndeciso
    
    VAR storiaUno = NonIniziata
    //VAR donoPersonaggiaUno = false
    VAR eventoSpecialePersonaggiaUno = false


//Gestione seconda personaggia.
    LIST possibiliStatiPersonaggiaDue = LaVegliante, NuovoStatoUnoDue, NuovoStatoDueDue, NuovoStatoTreDue
    VAR effettivoStatoPersonaggiaDue = LaVegliante
    
    VAR storiaDue = NonIniziata
    VAR eventoSpecialePersonaggiaDue = false


//Gestione terza personaggia
    LIST possibiliStatiPersonaggiaTre = SpettroDelVuoto, LArrabbiato, IlGuarente, IlTerrorizzato, LAbbandonato, IlSocievole, IlConsapevole
    VAR effettivoStatoPersonaggiaTre = SpettroDelVuoto
    
    VAR storiaTre = NonIniziata
    VAR eventoSpecialePersonaggiaTre = false
    
        
    VAR terrore = 0
    VAR abbandono = 0
    VAR rabbia = 0
    
    VAR ferito = 0
    VAR socievole = 0   
    VAR consapevole = 0


//Gestione quarta personaggia
    LIST possibiliStatiPersonaggiaQuattro = LaMondatrice, NuovoStatoUnoQuattro, NuovoStatoDueQuattro, NuovoStatoTreQuattro
    VAR effettivoStatoPersonaggiaQuattro = LaMondatrice
    
    VAR storiaQuattro = NonIniziata
    VAR eventoSpecialePersonaggiaQuattro = false

//Gestione quinta personaggia
    LIST possibiliStatiPersonaggiaCinque = Oscar, NuovoStatoUnoCinque, NuovoStatoDueCinque, NuovoStatoTreCinque
    VAR effettivoStatoPersonaggiaCinque = Oscar
    
    VAR storiaCinque = NonIniziata
    VAR eventoSpecialePersonaggiaCinque = false

//Gestione sesta personaggia
    LIST possibiliStatiPersonaggiaSei = LoSpecchio, NuovoStatoUnoSei, NuovoStatoDueSei, NuovoStatoTreSei
    VAR effettivoStatoPersonaggiaSei = LoSpecchio
    
    VAR storiaSei = NonIniziata
    VAR eventoSpecialePersonaggiaSei = false


//Gestione settima personaggia
    LIST possibiliStatiPersonaggiaSette = LaDisegnatrice, NuovoStatoUnoSette, NuovoStatoDueSette, NuovoStatoTreSette
    VAR effettivoStatoPersonaggiaSette= LaDisegnatrice
    
    VAR storiaSette = NonIniziata
    VAR eventoSpecialePersonaggiaSette = false

//Funzione di traduzione da variabile a stringa con articolo minuscolo
=== function traduttorePersonaggeMinuscolo(effettivoStatoPersonaggia)
    {effettivoStatoPersonaggia:

    //Personaggia Uno
        - SpettroDelVuoto:
            ~ return "il Vuoto"
        - IlConsapevole: 
            ~ return "il Consapevole"
        - IlGuarente: 
            ~ return "il Guarente"    
        - IlSocievole: 
            ~ return "il Socievole"
        - IlTerrorizzato: 
            ~ return "il Terrorizzato"
        - LAbbandonato: 
            ~ return "l'Abbandonato"    
        - LArrabbiato: 
            ~ return "l'Arrabbiato"
    //Personaggia Due       
        - LaVegliante:
            ~ return "la Vegliante"
    //Personaggia Tre      
        - LIndeciso:
            ~ return "l'Indeciso"
    //Personaggia Quattro             
        - LaMondatrice:
            ~ return "la Mondatrice"
    //Personaggia Cinque         
        - Oscar:
            ~ return "Oscar"
    //Personaggia Sei        
        - LoSpecchio:
            ~ return "lo Specchio"
    //Personaggia Sette        
        - LaDisegnatrice:
            ~ return "la Disegnatrice"

    }

//Funzione di traduzione da variabile a stringa con articolo maiuscolo
=== function traduttorePersonaggeMaiuscolo(effettivoStatoPersonaggia)
    {effettivoStatoPersonaggia:

    //Personaggia Uno
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
    //Personaggia Due        
        - LaVegliante:
            ~ return "La Vegliante"
    //Personaggia Tre        
        - LIndeciso:
            ~ return "L'Indeciso"
    //Personaggia Quattro        
        - LaMondatrice:
            ~ return "La Mondatrice"
    //Personaggia Cinque        
        - Oscar:
            ~ return "Oscar"
    //Personaggia Sei        
        - LoSpecchio:
            ~ return "Lo Specchio"
    //Personaggia Sette        
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


//Check per avvio e chiusura storia personagge
=== story_time_management_for_PNG
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

//Check per l'allontanamento delle personagge
    - storiaUno == Conclusa && counterSpostamenti > 10:
        ~ move_entity(PersonaggiaUno, contenutoCasettaAnime)
        ~ move_entity(FirstPersonNotes, BusStop)
        
    - storiaDue == Conclusa && counterSpostamenti > 10:
        ~ move_entity(PersonaggiaDue, contenutoCasettaAnime)
        ~ move_entity(SecondPersonNotes, BusStop)
        
    - storiaTre == Conclusa && counterSpostamenti > 10:
        ~ move_entity(PersonaggiaTre, contenutoCasettaAnime)
        ~ move_entity(NotePersonaggiaTre, BusStop)
        
    - storiaQuattro == Conclusa && counterSpostamenti > 10:
        ~ move_entity(PersonaggiaQuattro, contenutoCasettaAnime)
        ~ move_entity(NotePersonaggiaQuattro, BusStop)
        
    - storiaCinque == Conclusa && counterSpostamenti > 10:
        ~ move_entity(PersonaggiaCinque, contenutoCasettaAnime)
        ~ move_entity(NotePersonaggiaCinque, BusStop)
        
    - storiaSei == Conclusa && counterSpostamenti > 10:
        ~ move_entity(PersonaggiaSei, contenutoCasettaAnime)
        ~ move_entity(NotePersonaggiaSei, BusStop)
        
    - storiaSette == Conclusa && counterSpostamenti > 10:
        ~ move_entity(PersonaggiaSette, contenutoCasettaAnime)
        ~ move_entity(NotePersonaggiaSette, BusStop)        
                                
}

->->
