//~ SEED_RANDOM(235)

//Per abilitare o meno il debug
VAR debug = false

//Nome giocatrice e pronomi
VAR nome = ""
LIST pronomi = maschili, femminili, neutri

//Lista di tutti i luoghi del gioco
LIST luoghi = Giardino, Mausoleo, Funghi, Biblioteca, Falene, Labirinto, Tisane, Sirene, CasettaAnime

//Lista delle personagge del gioco (quelle che hanno elementi di variabilità
LIST characters = Mentore, PG

LIST transitions = FromMausoleumToGarden, FromGardenToMausoleum, FromGreenhouseToGarden, FromGardenToGreenhouse

LIST sceneObjects = Bench, Wheelbarrow, LapideUno, LapideDue, LapideTre, LapideQuattro, LapideCinque, LapideSei, LapideSette

LIST souls = SpettroUno, SpettroDue, SpettroTre, SpettroQuattro, SpettroCinque, SpettroSei, SpettroSette, AnimaUno, AnimaDue, AnimaTre, AnimellaUno, AnimellaDue, AnimellaTre


//Lista dei contenuti di un determinato luogo, in modo da tracciare chi è dove
VAR contenutoGiardino = (PG, Mentore, Bench, FromGardenToMausoleum, FromGardenToGreenhouse)
VAR contenutoMausoleo = (FromMausoleumToGarden, LapideUno, LapideDue, LapideTre, LapideQuattro, LapideCinque, LapideSei, LapideSette)
VAR contenutoFunghi = (FromGreenhouseToGarden, Wheelbarrow)
VAR contenutoLabirinto = ()
VAR contenutoFalene = ()
VAR contenutoBiblioteca = ()
VAR contenutoTisane = ()
VAR contenutoSirene = ()
VAR contenutoCasettaAnime = (SpettroUno, SpettroDue, SpettroTre, SpettroQuattro, SpettroCinque, SpettroSei, SpettroSette, AnimaUno, AnimaDue, AnimaTre, AnimellaUno, AnimellaDue, AnimellaTre)

    
//Variabili per tracciare i trigger warning. True = non è TW, posso mostrare quelle storie
VAR alcolismo = true
VAR abusi = true
VAR lutto = true
VAR solitudine = true