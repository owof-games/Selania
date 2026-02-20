//Una lista di tutte le parole possibili
    LIST nest_emotionalVariationsList = 
       
        RossoGialloBlu, RossoGialloVerde, RossoGialloViola,
        RossoBluVerde, RossoBluViola, RossoBluGiallo,
        RossoVerdeBlu, RossoVerdeViola, RossoVerdeGiallo,
        RossoViolaBlu, RossoViolaVerde, RossoViolaGiallo,
        
        GialloRossoVerde, GialloRossoViola, GialloRossoBlu,
        GialloBluVerde, GialloBluViola, GialloBluRosso,
        GialloVerdeViola, GialloVerdeBlu, GialloVerdeRosso,
        GialloViolaVerde, GialloViolaBlu, GialloViolaRosso,
        
        BluRossoVerde, BluRossoViola, BluRossoGiallo, 
        BluGialloVerde, BluGialloViola, BluGialloRosso,
        BluVerdeViola, BluVerdeGiallo, BluVerdeRosso,
        BluViolaVerde, BluViolaGiallo, BluViolaRosso,
        
        VerdeRossoViola, VerdeRossoBlu, VerdeRossoGiallo, 
        VerdeGialloViola, VerdeGialloBlu, VerdeGialloRosso,
        VerdeBluViola, VerdeBluGiallo, VerdeBluRosso,
        VerdeViolaBlu, VerdeViolaGiallo, VerdeViolaRosso,
        
        ViolaRossoVerde, ViolaRossoBlu, ViolaRossoGiallo,
        ViolaGialloVerde, ViolaGialloBlu, ViolaGialloRosso,
        ViolaBluVerde, ViolaBluGiallo, ViolaBluRosso,
        ViolaVerdeBlu, ViolaVerdeGiallo, ViolaVerdeRosso
        
//Qui raggruppo le emotional variations per utilizzi:
    //Remind: una sola nota = un solo utilizzo. Due note diverse: due utilizzi. Tre note diverse: tre utilizzi.
    
    
    VAR nest_threeUseWords = (RossoGialloBlu, RossoGialloVerde, RossoGialloViola, RossoBluVerde, RossoBluViola, RossoBluGiallo, RossoVerdeViola, RossoVerdeBlu, RossoVerdeGiallo, RossoViolaBlu, RossoViolaVerde, RossoViolaGiallo, GialloRossoVerde, GialloRossoViola, GialloRossoBlu,  GialloBluVerde, GialloBluViola, GialloBluRosso, GialloVerdeViola, GialloVerdeBlu, GialloVerdeRosso,  GialloViolaVerde, GialloViolaBlu, GialloViolaRosso, BluRossoVerde, BluRossoViola, BluRossoGiallo, BluGialloVerde, BluGialloViola, BluGialloRosso, BluVerdeViola, BluVerdeGiallo, BluVerdeRosso, BluViolaVerde,  BluViolaGiallo, BluViolaRosso, VerdeRossoViola, VerdeRossoBlu, VerdeRossoGiallo, VerdeBluGiallo, VerdeBluRosso, VerdeGialloViola, VerdeGialloBlu, VerdeGialloRosso, VerdeBluViola, VerdeViolaBlu, VerdeViolaGiallo, VerdeViolaRosso, ViolaRossoVerde, ViolaRossoBlu, ViolaRossoGiallo, ViolaGialloVerde, ViolaGialloBlu, ViolaGialloRosso, ViolaBluVerde, ViolaBluGiallo, ViolaBluRosso, ViolaVerdeBlu, ViolaVerdeGiallo, ViolaVerdeRosso)




//Qui invece raggruppo le emotional variations in emotional words:

    //Varianti a dominante Rosso
    VAR nest_redYellowWords = (RossoGialloBlu, RossoGialloVerde, RossoGialloViola)
    VAR nest_redBlueWords = (RossoBluVerde, RossoBluViola, RossoBluGiallo)
    VAR nest_redGreenWords = (RossoVerdeBlu, RossoVerdeViola, RossoVerdeGiallo)
    VAR nest_redPurpleWords = (RossoViolaBlu, RossoViolaVerde, RossoViolaGiallo)
    
    //Varianti a dominante Giallo
    VAR nest_yellowRedWords = (GialloRossoVerde, GialloRossoViola, GialloRossoBlu)
    VAR nest_yellowBlueWords = (GialloBluVerde, GialloBluViola, GialloBluRosso)
    VAR nest_yellowGreenWords = (GialloVerdeViola, GialloVerdeBlu, GialloVerdeRosso)
    VAR nest_yellowPurpleWords = (GialloViolaVerde, GialloViolaBlu, GialloViolaRosso)
    
    //Varianti a dominate blu
    VAR nest_blueRedWords = (BluRossoVerde, BluRossoViola, BluRossoGiallo)
    VAR nest_blueYellowWords = (BluGialloVerde, BluGialloViola, BluGialloRosso)
    VAR nest_blueGreenWords = (BluVerdeViola, BluVerdeGiallo, BluVerdeRosso)
    VAR nest_bluePurpleWords = (BluViolaVerde, BluViolaGiallo, BluViolaRosso)
    
    //Varianti a dominante verde
    VAR nest_greenRedWords = (VerdeRossoViola, VerdeRossoBlu, VerdeRossoGiallo)
    VAR nest_greenYellowWords =  (VerdeGialloViola, VerdeGialloBlu, VerdeGialloRosso)
    VAR nest_greenBlueWords = (VerdeBluViola, VerdeBluGiallo, VerdeBluRosso)
    VAR nest_greenPurpleWords = (VerdeViolaBlu, VerdeViolaGiallo, VerdeViolaRosso)
    
    //Varianti a dominante viola
    VAR nest_purpleRedWords = (ViolaRossoVerde, ViolaRossoBlu, ViolaRossoGiallo)
    VAR nest_purpleYellowWords = (ViolaGialloVerde, ViolaGialloBlu, ViolaGialloRosso)
    VAR nest_purpleBlueWords = (ViolaBluVerde, ViolaBluGiallo, ViolaBluRosso)
    VAR nest_purpleGreenWords = (ViolaVerdeBlu, ViolaVerdeGiallo, ViolaVerdeRosso)
    
//Una lista degli usi possibili di emotional_words_management
    LIST nest_emotionalWordsManagementPossibleStatus = Activate, Delete

//Una lista delle parole trovate. Se una parola è qui dentro, una volta "suonata" non passerò da emotional_backpack_management
    VAR nest_discoveredEmotionalWords = ()

//Il tracciamento della parola appena scoperta
    VAR nest_newlyDiscoveredEmotionalWord = ()

//Tracciamento delle scelte fatte durante la composizione
    LIST nest_keysColour = redKey, yellowKey, blueKey, greenKey, purpleKey
    VAR nest_firstKeyColour = ()
    VAR nest_secondKeyColour = ()
    VAR nest_thirdKeyColour = ()


//L'inventario effettivo
    VAR nest_ownedEmotionalWords = ()
    
//Una variabile che tiene conto di quale sia la parola attiva ora
    VAR nest_activeEmotionalWord = ()

//Una lista delle parole effettivamente utilizzate
    VAR nest_usedEmotionaWords = ()
    
//Qualcosa che limiti il numero di parole aggiungibili.
//Remind: ogni volta che aggiungo una parola, il limite si aggiorna.
    //Un contatore che aumenta ogni volta che viene aggiunta una parola all'inventario effettivo
    VAR nest_takenEmotionalWords = 0
    
    //Un parametro che indichi il massimo delle parole previste
    VAR nest_maximumEmotionalWordsForRun = 25


