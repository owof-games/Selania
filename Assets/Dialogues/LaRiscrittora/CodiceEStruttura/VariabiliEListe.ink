~ SEED_RANDOM(235)

//Per abilitare o meno il debug
VAR debug = false

//Nome giocatrice e pronomi
VAR nome = "Senza Nome"
LIST pronomi = maschili, femminili, neutri
//Traccio gli spostamenti della personaggia per gestire la comparsa delle personagge
VAR counterSpostamenti = 0

//Lista di tutti i luoghi del gioco
LIST luoghi = Giardino, BusStop, Funghi, Biblioteca, Falene, Labirinto, Tisane, CasettaAnime

//Settaggio luoghi attivi a seconda del tier
VAR firstTierPlaces =(Giardino, BusStop, Funghi)
VAR secondTierPlaces =(Giardino, BusStop, Funghi, Biblioteca)
VAR thirdTierPlaces = (Giardino, BusStop, Biblioteca, Falene, Funghi)
VAR fourthTierPlaces = (Giardino, BusStop, Biblioteca, Falene, Funghi, Tisane)

//Lista delle personagge del gioco (quelle che hanno elementi di variabilità
LIST characters = Mentore, PG, PersonaggiaUno, PersonaggiaDue, PersonaggiaTre, PersonaggiaQuattro, PersonaggiaCinque, PersonaggiaSei, PersonaggiaSette

LIST transitions = FromBusStopToGarden, FromGardenToBusStop, FromGreenhouseToGarden, FromGardenToGreenhouse, FromGardenToNothing, FromBusStopToExitGame

LIST sceneObjects = Bench, Wheelbarrow, Tree, NotePersonaggiaUno, NotePersonaggiaDue, NotePersonaggiaTre, NotePersonaggiaQuattro, NotePersonaggiaCinque, NotePersonaggiaSei, NotePersonaggiaSette

LIST mushrooms = LicheneDegliAbissi, NonTiScordarDiTe, MuschioDelleAmanti, CantoDelleCompagne, LaSpazzata, BaccaDellaAddolorata, BrinaDellImpossibile


//Lista dei contenuti di un determinato luogo, in modo da tracciare chi è dove
VAR contenutoGiardino = (Mentore, Bench, Tree, PG, FromGardenToBusStop, FromGardenToGreenhouse, FromGardenToNothing)
VAR contenutoBusStop = (FromBusStopToGarden, FromBusStopToExitGame)
VAR contenutoFunghi = (FromGreenhouseToGarden, Wheelbarrow)
VAR contenutoLabirinto = ()
VAR contenutoFalene = ()
VAR contenutoBiblioteca = ()
VAR contenutoTisane = ()
VAR contenutoCasettaAnime = (PersonaggiaUno, PersonaggiaDue, PersonaggiaTre, PersonaggiaQuattro, PersonaggiaCinque, PersonaggiaSei, PersonaggiaSette, LicheneDegliAbissi, NonTiScordarDiTe, MuschioDelleAmanti, CantoDelleCompagne, LaSpazzata, BaccaDellaAddolorata, BrinaDellImpossibile, NotePersonaggiaUno, NotePersonaggiaDue, NotePersonaggiaTre, NotePersonaggiaQuattro, NotePersonaggiaCinque, NotePersonaggiaSei, NotePersonaggiaSette)

    
//Variabili per tracciare i trigger warning. True = non è TW, posso mostrare quelle storie
VAR alcolismo = true
VAR abusi = true
VAR lutto = true
VAR solitudine = true