//Una lista di tutte le parole possibili
    LIST nest_emotionalVariationsList = 
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

//Qui raggruppo le emotional variations per utilizzi:
    //Remind: una sola nota = un solo utilizzo. Due note diverse: due utilizzi. Tre note diverse: tre utilizzi.
    VAR nest_oneUseWords = (Rosso, Giallo, Blu, Verde, Viola)
    
    VAR nest_twoUseWords = (RossoRosso, GialloGiallo, BluBlu, VerdeVerde, ViolaViola, RossoRossoBlu, RossoRossoVerde, RossoRossoViola, RossoRossoGiallo,RossoGiallo, RossoGialloRosso, RossoGialloGiallo,RossoBlu, RossoBluBlu, RossoBluRosso, RossoVerde, RossoVerdeVerde,  RossoVerdeRosso, RossoViola,  RossoViolaViola, RossoViolaRosso, GialloRosso, GialloRossoGiallo, GialloRossoRosso, GialloGialloVerde, GialloGialloViola, GialloGialloBlu, GialloGialloRosso, GialloBlu, GialloBluBlu, GialloBluGiallo, GialloVerde, GialloVerdeVerde, GialloVerdeGiallo, GialloViolaGiallo,GialloViola, GialloViolaViola, BluRosso, BluRossoBlu, BluRossoRosso,BluGiallo, BluGialloBlu, BluGialloGiallo,BluBluVerde, BluBluViola, BluBluGiallo, BluBluRosso,BluVerde, BluVerdeVerde, BluViola, BluViolaViola, BluVerdeBlu, BluViolaBlu, VerdeRosso, VerdeRossoVerde, VerdeRossoRosso,VerdeGiallo, VerdeGialloVerde, VerdeGialloGiallo, VerdeBlu, VerdeBluVerde,  VerdeBluBlu, VerdeVerdeViola, VerdeVerdeBlu, VerdeVerdeGiallo, VerdeVerdeRosso,VerdeViola, VerdeViolaVerde, VerdeViolaViola, ViolaRosso, ViolaRossoViola,  ViolaRossoRosso,ViolaGiallo,  ViolaGialloViola, ViolaGialloGiallo, ViolaBlu,ViolaBluViola, ViolaBluBlu, ViolaVerde, ViolaVerdeVerde, ViolaVerdeViola, ViolaViolaVerde, ViolaViolaBlu, ViolaViolaGiallo, ViolaViolaRosso)
    
    VAR nest_threeUseWords = (RossoRossoRosso, GialloGialloGiallo, BluBluBlu, VerdeVerdeVerde, ViolaViolaViola, RossoGialloBlu, RossoGialloVerde, RossoGialloViola, RossoBluVerde, RossoBluViola, RossoBluGiallo, RossoVerdeViola, RossoVerdeBlu, RossoVerdeGiallo, RossoViolaBlu, RossoViolaVerde, RossoViolaGiallo, GialloRossoVerde, GialloRossoViola, GialloRossoBlu,  GialloBluVerde, GialloBluViola, GialloBluRosso, GialloVerdeViola, GialloVerdeBlu, GialloVerdeRosso,  GialloViolaVerde, GialloViolaBlu, GialloViolaRosso, BluRossoVerde, BluRossoViola, BluRossoGiallo, BluGialloVerde, BluGialloViola, BluGialloRosso, BluVerdeViola, BluVerdeGiallo, BluVerdeRosso, BluViolaVerde,  BluViolaGiallo, BluViolaRosso, VerdeRossoViola, VerdeRossoBlu, VerdeRossoGiallo, VerdeBluGiallo, VerdeBluRosso, VerdeGialloViola, VerdeGialloBlu, VerdeGialloRosso, VerdeBluViola, VerdeViolaBlu, VerdeViolaGiallo, VerdeViolaRosso, ViolaRossoVerde, ViolaRossoBlu, ViolaRossoGiallo, ViolaGialloVerde, ViolaGialloBlu, ViolaGialloRosso, ViolaBluVerde, ViolaBluGiallo, ViolaBluRosso, ViolaVerdeBlu, ViolaVerdeGiallo, ViolaVerdeRosso)




//Qui invece raggruppo le emotional variations in emotional words:
    //Varianti monocolore
    VAR nest_redWords = (Rosso, RossoRosso, RossoRossoRosso)
    VAR nest_yellowWords = (Giallo, GialloGiallo, GialloGialloGiallo)
    VAR nest_blueWords = (Blu, BluBlu, BluBluBlu)    
    VAR nest_greenWords = (Verde, VerdeVerde, VerdeVerdeVerde)
    VAR nest_purpleWords = (Viola, ViolaViola, ViolaViolaViola)
    
    //Varianti a dominante Rosso
    VAR nest_redYellowWords = (RossoGiallo, RossoRossoGiallo, RossoGialloGiallo, RossoGialloBlu, RossoGialloVerde, RossoGialloViola, RossoGialloRosso)
    VAR nest_redBlueWords = (RossoBlu, RossoRossoBlu, RossoBluBlu, RossoBluVerde, RossoBluViola, RossoBluRosso, RossoBluGiallo)
    VAR nest_redGreenWords = (RossoVerde, RossoRossoVerde, RossoVerdeBlu, RossoVerdeVerde, RossoVerdeViola, RossoVerdeRosso, RossoVerdeGiallo)
    VAR nest_redPurpleWords = (RossoViola, RossoRossoViola, RossoViolaBlu, RossoViolaVerde, RossoViolaViola, RossoViolaRosso, RossoViolaGiallo)
    
    //Varianti a dominante Giallo
    VAR nest_yellowRedWords = (GialloRosso, GialloGialloRosso, GialloRossoRosso, GialloRossoVerde, GialloRossoViola, GialloRossoBlu, GialloRossoGiallo)
    VAR nest_yellowBlueWords = (GialloBlu, GialloGialloBlu, GialloBluVerde, GialloBluViola, GialloBluBlu, GialloBluGiallo, GialloBluRosso)
    VAR nest_yellowGreenWords = (GialloVerde, GialloGialloVerde, GialloVerdeVerde, GialloVerdeViola, GialloVerdeBlu, GialloVerdeGiallo, GialloVerdeRosso)
    VAR nest_yellowPurpleWords = (GialloViola, GialloGialloViola, GialloViolaVerde, GialloViolaViola, GialloViolaBlu, GialloViolaGiallo, GialloViolaRosso)
    
    //Varianti a dominate blu
    VAR nest_blueRedWords = (BluRosso, BluBluRosso, BluRossoVerde, BluRossoViola, BluRossoBlu, BluRossoGiallo, BluRossoRosso)
    VAR nest_blueYellowWords = (BluGiallo, BluBluGiallo, BluGialloVerde, BluGialloViola, BluGialloBlu, BluGialloGiallo, BluGialloRosso)
    VAR nest_blueGreenWords = (BluVerde, BluBluVerde, BluVerdeVerde, BluVerdeViola, BluVerdeBlu, BluVerdeGiallo, BluVerdeRosso)
    VAR nest_bluePurpleWords = (BluViola, BluBluViola, BluViolaVerde, BluViolaViola, BluViolaBlu, BluViolaGiallo, BluViolaRosso)
    
    //Varianti a dominante verde
    VAR nest_greenRedWords = (VerdeRosso, VerdeVerdeRosso, VerdeRossoVerde, VerdeRossoViola, VerdeRossoBlu, VerdeRossoGiallo, VerdeRossoRosso)
    VAR nest_greenYellowWords = (VerdeGiallo, VerdeVerdeGiallo, VerdeGialloVerde, VerdeGialloViola, VerdeGialloBlu, VerdeGialloGiallo, VerdeGialloRosso)
    VAR nest_greenBlueWords = (VerdeBlu, VerdeVerdeBlu, VerdeBluVerde, VerdeBluViola, VerdeBluBlu, VerdeBluGiallo, VerdeBluRosso)
    VAR nest_greenPurpleWords = (VerdeViola, VerdeVerdeViola, VerdeViolaVerde, VerdeViolaViola, VerdeViolaBlu, VerdeViolaGiallo, VerdeViolaRosso)
    
    //Varianti a dominante viola
    VAR nest_purpleRedWords = (ViolaRosso, ViolaViolaRosso, ViolaRossoVerde, ViolaRossoViola, ViolaRossoBlu, ViolaRossoGiallo, ViolaRossoRosso)
    VAR nest_purpleYellowWords = (ViolaGiallo, ViolaViolaGiallo, ViolaGialloVerde, ViolaGialloViola, ViolaGialloBlu, ViolaGialloGiallo, ViolaGialloRosso)
    VAR nest_purpleBlueWords = (ViolaBlu, ViolaViolaBlu, ViolaBluVerde, ViolaBluViola, ViolaBluBlu, ViolaBluGiallo, ViolaBluRosso)
    VAR nest_purpleGreenWords = (ViolaVerde, ViolaViolaVerde, ViolaVerdeVerde, ViolaVerdeViola, ViolaVerdeBlu, ViolaVerdeGiallo, ViolaVerdeRosso)
    
//Una lista degli usi possibili di emotional_words_management
    LIST emotionalWordsManagementStatus = Activate, Delete

//Una lista delle parole trovate. Se una parola è qui dentro, una volta "suonata" non passerò da emotional_inventory_management
    VAR discoveredEmotionalWords = ()

//Il tracciamento della parola appena scoperta
    VAR newlyDiscoveredEmotionalWord = ()

//Tracciamento delle scelte fatte durante la composizione
    LIST keysColour = redKey, yellowKey, blueKey, greenKey, purpleKey
    VAR firstKeyColour = ()
    VAR secondKeyColour = ()
    VAR thirdKeyColour = ()


//L'inventario effettivo
    VAR ownedEmotionalWords = ()
    
//Una variabile che tiene conto di quale sia la parola attiva ora
    VAR activeEmotionalWord = ()

//Una lista delle parole effettivamente utilizzate
    VAR usedEmotionaWords = ()
    
//Qualcosa che limiti il numero di parole aggiungibili.
//Remind: ogni volta che aggiungo una parola, il limite si aggiorna.
    //Un contatore che aumenta ogni volta che viene aggiunta una parola all'inventario effettivo
    VAR takenEmotionalWords = 0
    
    //Un parametro che indichi il massimo delle parole previste
    VAR maximumEmotionalWordsForRun = 25


