~ SEED_RANDOM(235)

//Per abilitare o meno il debug
VAR debug = false

//Nome giocatrice e pronomi
VAR nome = ""
LIST pronomi = maschili, femminili, neutri

//Lista di tutti i luoghi del gioco
LIST luoghi = Giardino, Mausoleo, Biblioteca, Falene, Funghi, Labirinto, Tisane, Sirene, CasettaAnime

//Lista delle personagge del gioco (quelle che hanno elementi di variabilità
LIST personagge = Mentore, PG, AnimaUno, AnimaDue, AnimaTre, AnimellaUno, AnimellaDue, AnimellaTre

//Lista dei contenuti di un determinato luogo, in modo da tracciare chi è dove
VAR contenutoGiardino = (PG, Mentore)
VAR contenutoMausoleo = ()
VAR contenutoBiblioteca = ()
VAR contenutoFalene = ()
VAR contenutoFunghi = ()
VAR contenutoLabirinto = ()
VAR contenutoTisane = ()
VAR contenutoSirene = ()
VAR contenutoCasettaAnime = (AnimaUno, AnimaDue, AnimaTre, AnimellaUno, AnimellaDue, AnimellaTre)

    
//Variabili per tracciare i trigger warning. True = non è TW, posso mostrare quelle storie
VAR alcolismo = true
VAR abusi = true
VAR lutto = true