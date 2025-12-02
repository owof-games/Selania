//Possibili nomi
    LIST mentor_possibleStates = Mentore
    VAR mentor_ActualName = Mentore
    
//Per mentore, fifthChar_storyStatus sarà la parte di riscrittura, mentorChar_storyStatus tutta la parte di interazione come Mentore
    VAR mentorChar_storyStatus = story_storyNotStarted
    
//Questa variabile mi serve solo per evitare che Mentore mi dia subito lo storylet questions dopo gifts_and_inks
    VAR mentor_tutorialPauses = false
    
//Variabili per mettere in pausa la conversazione. Plausibilmente per mentore sarà molto alta all'inizio.
    VAR mentor_pauseTalking = 0
    VAR mentor_pauseDuration = 10

//Check per monitorare l'ultima volta che abbiamo parlato con Mentore.
    VAR mentor_lastTimeTalking = 0
    VAR mentor_MAX_lastTimeTalking = 10

//Variabili colore
    VAR mentor_purple = 0.00
    VAR mentor_yellow = 0.00
    VAR mentor_blue = 0.00
    VAR mentor_green = 0.00
    VAR mentor_red = 0.00     


//VARIABILI NARRATIVE
    VAR riccioMentoreViciniColpo = false
    VAR riccioMentoreViciniInnaffiatoio = false
    
   