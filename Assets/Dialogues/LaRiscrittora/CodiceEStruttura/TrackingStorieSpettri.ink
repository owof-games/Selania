//Variabili legate agli spettri del mausoleo
// Lista con i possibili stati delle variabili legate alle contraddizioni
LIST statoStorie = NonIniziata, InCorso, Conclusa

VAR storiaDue = NonIniziata
VAR storiaTre = NonIniziata
VAR storiaQuattro = NonIniziata
VAR storiaCinque = NonIniziata
VAR storiaSei = NonIniziata
VAR storiaSette = NonIniziata


VAR donoSpettroDue = false
VAR donoSpettroTre = false
VAR donoSpettroQuattro = false
VAR donoSpettroCinque = false
VAR donoSpettroSei = false
VAR donoSpettroSette = false


//Gestione spettro uno: il Vuoto.
LIST possibiliStatiSpettroUno = SpettroDelVuoto, LArrabbiato, IlGuarente, IlTerrorizzato, LAbbandonato, IlSocievole, IlConsapevole
VAR effettivoStatoSpettroUno = SpettroDelVuoto

VAR storiaUno = NonIniziata
VAR donoSpettroUno = false
VAR eventoSpecialeSpettroUno = false

VAR terrore = 0
VAR abbandono = 0
VAR rabbia = 0

VAR ferito = 0
VAR socievole = 0
VAR consapevole = 0


//Gestione spettro due

LIST possibiliStatiSpettroDue = LaVegliante, NuovoStatoUnoDue, NuovoStatoDueDue, NuovoStatoTreDue
VAR effettivoStatoSpettroDue = LaVegliante

LIST possibiliStatiSpettroTre = LIndeciso, NuovoStatoUnoTre, NuovoStatoDueTre, NuovoStatoTreTre
VAR effettivoStatoSpettroTre = LIndeciso

LIST possibiliStatiSpettroQuattro = LaMondatrice, NuovoStatoUnoQuattro, NuovoStatoDueQuattro, NuovoStatoTreQuattro
VAR effettivoStatoSpettroQuattro = LaMondatrice

LIST possibiliStatiSpettroCinque = Oscar, NuovoStatoUnoCinque, NuovoStatoDueCinque, NuovoStatoTreCinque
VAR effettivoStatoSpettroCinque = Oscar

LIST possibiliStatiSpettroSei = LoSpecchio, NuovoStatoUnoSei, NuovoStatoDueSei, NuovoStatoTreSei
VAR effettivoStatoSpettroSei = LoSpecchio

LIST possibiliStatiSpettroSette = LaDisegnatrice, NuovoStatoUnoSette, NuovoStatoDueSette, NuovoStatoTreSette
VAR effettivoStatoSpettroSette= LaDisegnatrice

//Variabili per verificare se c'è o meno l'accesso all'evento speciale di un singolo spettro

VAR eventoSpecialeSpettroDue = false
VAR eventoSpecialeSpettroTre = false
VAR eventoSpecialeSpettroQuattro = false
VAR eventoSpecialeSpettroCinque = false
VAR eventoSpecialeSpettroSei = false
VAR eventoSpecialeSpettroSette = false

=== function traduttoreSpettri(effettivoStatoSpettro)
    {effettivoStatoSpettro:

    //Spettro Uno
        - SpettroDelVuoto:
            ~ return "lo spettro del Vuoto"
        - IlConsapevole: 
            ~ return "il Consapevole"
        - IlGuarente: 
            ~ return "il Ferito"    
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


=== function check_statusVsInchiostro(status, list)
{
    - status == 1 && list hasnt Vuoto or list hasnt Scarso or list hasnt Normale:
	    ~ return true
    - status == 2 && list hasnt (Vuoto, Scarso):
	    ~ return true
    - status == 3 && list hasnt Vuoto:
	    ~ return true
    - else:
        ~ return false
}
