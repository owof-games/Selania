//Una lista di tutte le parole possibili
    LIST emotionalVariationsList = 
        Rosso,
        RossoRosso, RossoRossoBlu, RossoRossoVerde, RossoRossoViola, RossoRossoRosso, RossoRossoGiallo,
        RossoGiallo, RossoGialloBlu, RossoGialloVerde, RossoGialloViola, RossoGialloRosso, RossoGialloGiallo,
        RossoBlu, RossoBluBlu, RossoBluVerde, RossoBluViola, RossoBluRosso, RossoBluGiallo,
        RossoVerde, RossoVerdeBlu, RossoVerdeVerde, RossoVerdeViola, RossoVerdeRosso, RossoVerdeGiallo,
        RossoViola, RossoViolaBlu, RossoViolaVerde, RossoViolaViola, RossoViolaRosso, RossoViolaGiallo,
        
        Giallo,
        GialloRosso, GialloRossoVerde, GialloRossoViola, GialloRossoBlu, GialloRossoGiallo, GialloRossoRosso,
        GialloGiallo, GialloGialloVerde, GialloGialloViola, GialloGialloBlu, GialloGialloGiallo, GialloGialloRosso,
        GialloBlu, GialloBluVerde, GialloBluViola, GialloBluBlu, GialloBluGiallo, GialloBluRosso,
        GialloVerde, GialloVerdeVerde, GialloVerdeViola, GialloVerdeBlu, GialloVerdeGiallo, GialloVerdeRosso,
        GialloViola, GialloViolaVerde, GialloViolaViola, GialloViolaBlu, GialloViolaGiallo, GialloViolaRosso,
        
        Blu,
        BluRosso, BluRossoVerde, BluRossoViola, BluRossoBlu, BluRossoGiallo, BluRossoRosso,
        BluGiallo, BluGialloVerde, BluGialloViola, BluGialloBlu, BluGialloGiallo, BluGialloRosso,
        BluBlu, BluBluVerde, BluBluViola, BluBluBlu, BluBluGiallo, BluBluRosso,
        BluVerde, BluVerdeVerde, BluVerdeViola, BluVerdeBlu, BluVerdeGiallo, BluVerdeRosso,
        BluViola, BluViolaVerde, BluViolaViola, BluViolaBlu, BluViolaGiallo, BluViolaRosso,
        
        Verde,
        VerdeRosso, VerdeRossoVerde, VerdeRossoViola, VerdeRossoBlu, VerdeRossoGiallo, VerdeRossoRosso,
        VerdeGiallo, VerdeGialloVerde, VerdeGialloViola, VerdeGialloBlu, VerdeGialloGiallo, VerdeGialloRosso,
        VerdeBlu, VerdeBluVerde, VerdeBluViola, VerdeBluBlu, VerdeBluGiallo, VerdeBluRosso,
        VerdeVerde, VerdeVerdeVerde, VerdeVerdeViola, VerdeVerdeBlu, VerdeVerdeGiallo, VerdeVerdeRosso,
        VerdeViola, VerdeViolaVerde, VerdeViolaViola, VerdeViolaBlu, VerdeViolaGiallo, VerdeViolaRosso,
        
        Viola,
        ViolaRosso, ViolaRossoVerde, ViolaRossoViola, ViolaRossoBlu, ViolaRossoGiallo, ViolaRossoRosso,
        ViolaGiallo, ViolaGialloVerde, ViolaGialloViola, ViolaGialloBlu, ViolaGialloGiallo, ViolaGialloRosso,
        ViolaBlu, ViolaBluVerde, ViolaBluViola, ViolaBluBlu, ViolaBluGiallo, ViolaBluRosso,
        ViolaVerde, ViolaVerdeVerde, ViolaVerdeViola, ViolaVerdeBlu, ViolaVerdeGiallo, ViolaVerdeRosso,
        ViolaViola, ViolaViolaVerde, ViolaViolaViola, ViolaViolaBlu, ViolaViolaGiallo, ViolaViolaRosso

//Qui invece raggruppo le emotional variations in emotional words:
    //Varianti monocolore
    VAR redWords = (Rosso, RossoRosso, RossoRossoRosso)
    VAR yellowWords = (Giallo, GialloGiallo, GialloGialloGiallo)
    VAR bluWords = (Blu, BluBlu, BluBluBlu)    
    VAR greenWords = (Verde, VerdeVerde, VerdeVerdeVerde)
    VAR purpleWords = (Viola, ViolaViola, ViolaViolaViola)
    
    //Varianti a dominante Rosso
    VAR redYellowWords = (RossoGiallo, RossoRossoGiallo, RossoGialloGiallo, RossoGialloBlu, RossoGialloVerde, RossoGialloViola, RossoGialloRosso)
    VAR redBlueWords = (RossoBlu, RossoRossoBlu, RossoBluBlu, RossoBluVerde, RossoBluViola, RossoBluRosso, RossoBluGiallo)
    VAR redGreenWords = (RossoVerde, RossoRossoVerde, RossoVerdeBlu, RossoVerdeVerde, RossoVerdeViola, RossoVerdeRosso, RossoVerdeGiallo)
    VAR redPurpleWords = (RossoViola, RossoRossoViola, RossoViolaBlu, RossoViolaVerde, RossoViolaViola, RossoViolaRosso, RossoViolaGiallo)
    
    //Varianti a dominante Giallo
    VAR yellowRedWords = (GialloRosso, GialloGialloRosso, GialloRossoRosso, GialloRossoVerde, GialloRossoViola, GialloRossoBlu, GialloRossoGiallo)
    VAR yellowBlueWords = (GialloBlu, GialloGialloBlu, GialloBluVerde, GialloBluViola, GialloBluBlu, GialloBluGiallo, GialloBluRosso)
    VAR yellowGreenWords = (GialloVerde, GialloGialloVerde, GialloVerdeVerde, GialloVerdeViola, GialloVerdeBlu, GialloVerdeGiallo, GialloVerdeRosso)
    VAR yellowPurpleWords = (GialloViola, GialloGialloViola, GialloViolaVerde, GialloViolaViola, GialloViolaBlu, GialloViolaGiallo, GialloViolaRosso)
    
    //Varianti a dominate blu
    VAR blueRedWords = (BluRosso, BluBluRosso, BluRossoVerde, BluRossoViola, BluRossoBlu, BluRossoGiallo, BluRossoRosso)
    VAR blueYellowWords = (BluGiallo, BluBluGiallo, BluGialloVerde, BluGialloViola, BluGialloBlu, BluGialloGiallo, BluGialloRosso)
    VAR blueGreenWords = (BluVerde, BluBluVerde, BluVerdeVerde, BluVerdeViola, BluVerdeBlu, BluVerdeGiallo, BluVerdeRosso)
    VAR bluePurpleWords = (BluViola, BluBluViola, BluViolaVerde, BluViolaViola, BluViolaBlu, BluViolaGiallo, BluViolaRosso)
    
    //Varianti a dominante verde
    VAR greenRedWords = (VerdeRosso, VerdeVerdeRosso, VerdeRossoVerde, VerdeRossoViola, VerdeRossoBlu, VerdeRossoGiallo, VerdeRossoRosso)
    VAR greenYellowWords = (VerdeGiallo, VerdeVerdeGiallo, VerdeGialloVerde, VerdeGialloViola, VerdeGialloBlu, VerdeGialloGiallo, VerdeGialloRosso)
    VAR greenBlueWords = (VerdeBlu, VerdeVerdeBlu, VerdeBluVerde, VerdeBluViola, VerdeBluBlu, VerdeBluGiallo, VerdeBluRosso)
    VAR greenPurpleWords = (VerdeViola, VerdeVerdeViola, VerdeViolaVerde, VerdeViolaViola, VerdeViolaBlu, VerdeViolaGiallo, VerdeViolaRosso)
    
    //Varianti a dominante viola
    VAR purpleRedWords = (ViolaRosso, ViolaViolaRosso, ViolaRossoVerde, ViolaRossoViola, ViolaRossoBlu, ViolaRossoGiallo, ViolaRossoRosso)
    VAR purpleYellowWords = (ViolaGiallo, ViolaViolaGiallo, ViolaGialloVerde, ViolaGialloViola, ViolaGialloBlu, ViolaGialloGiallo, ViolaGialloRosso)
    VAR purpleBlueWords = (ViolaBlu, ViolaViolaBlu, ViolaBluVerde, ViolaBluViola, ViolaBluBlu, ViolaBluGiallo, ViolaBluRosso)
    VAR purpleGreenWords = (ViolaVerde, ViolaViolaVerde, ViolaVerdeVerde, ViolaVerdeViola, ViolaVerdeBlu, ViolaVerdeGiallo, ViolaVerdeRosso)
    
//Una lista degli usi possibili di emotional_words_management
    LIST emotionalWordsManagementStatus = Activate, Delete

//Una lista delle parole trovate. Se una parola è qui dentro, una volta "suonata" non passerò da emotional_inventory_management
    VAR discoveredEmotionalWords = ()

//L'inventario effettivo
    VAR ownedEmotionalWords = ()

//Tracciamento delle scelte fatte durante la composizione
    LIST keysColour = redKey, yellowKey, blueKey, greenKey, purpleKey
    VAR firstKeyColour = ()
    VAR secondKeyColour = ()
    VAR thirdKeyColour = ()

//Il tracciamento della parola appena scoperta
    VAR newlyDiscoveredEmotionalWord = ()

//Una variabile che tiene conto di quale sia la parola attiva ora
    VAR activeEmotionalWord = ()
    
//Qualcosa che limiti il numero di parole aggiungibili.
//Remind: ogni volta che aggiungo una parola, il limite si aggiorna.
    //Un contatore che aumenta ogni volta che viene aggiunta una parola all'inventario effettivo
    VAR takenEmotionalWords = 0
    
    //Un parametro che indichi il massimo delle parole previste
    VAR maximumEmotionalWordsForRun = 25

    