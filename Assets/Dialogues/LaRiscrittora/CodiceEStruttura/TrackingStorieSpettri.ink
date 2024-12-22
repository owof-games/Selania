//Variabili legate agli spettri del mausoleo
// Lista con i possibili stati delle variabili legate alle contraddizioni
LIST statoStorie = NonIniziata, InCorso, Conclusa

VAR storiaUno = NonIniziata
VAR storiaDue = NonIniziata
VAR storiaTre = NonIniziata
VAR storiaQuattro = NonIniziata
VAR storiaCinque = NonIniziata
VAR storiaSei = NonIniziata
VAR storiaSette = NonIniziata

//Lista denominatori dei singoli spettri
//Questi denominatori poi verranno adattati al singolo spettro
//C'è la possibilità che serva una qualche forma di conversione, es: variabile compatta, quindi LaInsicura, e poi formula che stampi La Insicura.
LIST possibiliStatiSpettroUno = StatoDefault, NuovoStatoUno, NuovoStatoDue, NuovoStatoTre
VAR effettivoStatoSpettroUno = StatoDefault

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
VAR eventoSpecialeSpettroUno = false
VAR eventoSpecialeSpettroDue = false
VAR eventoSpecialeSpettroTre = false
VAR eventoSpecialeSpettroQuattro = false
VAR eventoSpecialeSpettroCinque = false
VAR eventoSpecialeSpettroSei = false
VAR eventoSpecialeSpettroSette = false

