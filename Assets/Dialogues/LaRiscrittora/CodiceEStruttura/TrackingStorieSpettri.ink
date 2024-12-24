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
LIST possibiliStatiSpettroUno = SpettroDelVuoto, IlRiccio, IlGuardiano, LAccentratore
VAR effettivoStatoSpettroUno = SpettroDelVuoto

VAR storiaUno = NonIniziata
VAR donoSpettroUno = false
VAR eventoSpecialeSpettroUno = false

VAR riccio = 0
VAR guardiano = 0
VAR accentratore = 0


//Gestione spettro due

LIST possibiliStatiSpettroDue = StatoDefaultDue, NuovoStatoUnoDue, NuovoStatoDueDue, NuovoStatoTreDue
VAR effettivoStatoSpettroDue = StatoDefaultDue

LIST possibiliStatiSpettroTre = StatoDefaultTre, NuovoStatoUnoTre, NuovoStatoDueTre, NuovoStatoTreTre
VAR effettivoStatoSpettroTre = StatoDefaultTre

LIST possibiliStatiSpettroQuattro = StatoDefaultQuattro, NuovoStatoUnoQuattro, NuovoStatoDueQuattro, NuovoStatoTreQuattro
VAR effettivoStatoSpettroQuattro = StatoDefaultQuattro

LIST possibiliStatiSpettroCinque = StatoDefaultCinque, NuovoStatoUnoCinque, NuovoStatoDueCinque, NuovoStatoTreCinque
VAR effettivoStatoSpettroCinque = StatoDefaultCinque

LIST possibiliStatiSpettroSei = StatoDefaultSei, NuovoStatoUnoSei, NuovoStatoDueSei, NuovoStatoTreSei
VAR effettivoStatoSpettroSei = StatoDefaultSei

LIST possibiliStatiSpettroSette = StatoDefaultSette, NuovoStatoUnoSette, NuovoStatoDueSette, NuovoStatoTreSette
VAR effettivoStatoSpettroSette= StatoDefaultSette

//Variabili per verificare se c'è o meno l'accesso all'evento speciale di un singolo spettro

VAR eventoSpecialeSpettroDue = false
VAR eventoSpecialeSpettroTre = false
VAR eventoSpecialeSpettroQuattro = false
VAR eventoSpecialeSpettroCinque = false
VAR eventoSpecialeSpettroSei = false
VAR eventoSpecialeSpettroSette = false

