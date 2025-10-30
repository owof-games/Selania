//Una lista di tutte le parole possibili
    LIST emotionalVariationsList = 
        Rossa,
        RossoRossa, RossoRossoBlu, RossoRossoVerde, RossoRossoViola, RossoRossoRossa, RossoRossoGialla,
        RossoGialla, RossoGiallaBlu, RossoGiallaVerde, RossoGiallaViola, RossoGiallaRossa, RossoGiallaGialla,
        RossoBlu, RossoBluBlu, RossoBluVerde, RossoBluViola, RossoBluRossa, RossoBluGialla,
        RossoVerde, RossoVerdeBlu, RossoVerdeVerde, RossoVerdeViola, RossoVerdeRossa, RossoVerdeGialla,
        RossoViola, RossoViolaBlu, RossoViolaVerde, RossoViolaViola, RossoViolaRossa, RossoViolaGialla,
        
        Gialla,
        GialloRossa, GialloRossaVerde, GialloRossaViola, GialloRossaBlu, GialloRossaGialla, GialloRossaRossa,
        GialloGialla, GialloGiallaVerde, GialloGiallaViola, GialloGiallaBlu, GialloGiallaGialla, GialloGiallaRossa,
        GialloBlu, GialloBluVerde, GialloBluViola, GialloBluBlu, GialloBluGialla, GialloBluRossa,
        GialloVerde, GialloVerdeVerde, GialloVerdeViola, GialloVerdeBlu, GialloVerdeGialla, GialloVerdeRossa,
        GialloViola, GialloViolaVerde, GialloViolaViola, GialloViolaBlu, GialloViolaGialla, GialloViolaRossa,
        
        Blu,
        BluRossa, BluRossaVerde, BluRossaViola, BluRossaBlu, BluRossaGialla, BluRossaRossa,
        BluGialla, BluGialloVerde, BluGialloViola, BluGialloBlu, BluGialloGialla, BluGialloRossa,
        BluBlu, BluBluVerde, BluBluViola, BluBluBlu, BluBluGialla, BluBluRossa,
        BluVerde, BluVerdeVerde, BluVerdeViola, BluVerdeBlu, BluVerdeGialla, BluVerdeRossa,
        BluViola, BluViolaVerde, BluViolaViola, BluViolaBlu, BluViolaGialla, BluViolaRossa,
        
        Verde,
        VerdeRossa, VerdeRossaVerde, VerdeRossaViola, VerdeRossaBlu, VerdeRossaGialla, VerdeRossaRossa,
        VerdeGialla, VerdeGiallaVerde, VerdeGiallaViola, VerdeGiallaBlu, VerdeGiallaGialla, VerdeGiallaRossa,
        VerdeBlu, VerdeBluVerde, VerdeBluViola, VerdeBluBlu, VerdeBluGialla, VerdeBluRossa,
        VerdeVerde, VerdeVerdeVerde, VerdeVerdeViola, VerdeVerdeBlu, VerdeVerdeGialla, VerdeVerdeRossa,
        VerdeViola, VerdeViolaVerde, VerdeViolaViola, VerdeViolaBlu, VerdeViolaGialla, VerdeViolaRossa,
        
        Viola,
        ViolaRossa, ViolaRossaVerde, ViolaRossaViola, ViolaRossaBlu, ViolaRossaGialla, ViolaRossaRossa,
        ViolaGialla, ViolaGiallaVerde, ViolaGiallaViola, ViolaGiallaBlu, ViolaGiallaGialla, ViolaGiallaRossa,
        ViolaBlu, ViolaBluVerde, ViolaBluViola, ViolaBluBlu, ViolaBluGialla, ViolaBluRossa,
        ViolaVerde, ViolaVerdeVerde, ViolaVerdeViola, ViolaVerdeBlu, ViolaVerdeGialla, ViolaVerdeRossa,
        ViolaViola, ViolaViolaVerde, ViolaViolaViola, ViolaViolaBlu, ViolaViolaGialla, ViolaViolaRossa

//Qui invece raggruppo le emotional variations in emotional words:
    //Varianti monocolore
    VAR redWords = (Rossa, RossoRossa, RossoRossoRossa)
    VAR yellowWords = (Gialla, GialloGialla, GialloGiallaGialla)
    VAR bluWords = (Blu, BluBlu, BluBluBlu)    
    VAR greenWords = (Verde, VerdeVerde, VerdeVerdeVerde)
    VAR purpleWords = (Viola, ViolaViola, ViolaViolaViola)
    
    //Varianti a dominante rossa
    VAR redYellowWords = (RossoGialla, RossoRossoGialla, RossoGiallaGialla, RossoGiallaBlu, RossoGiallaVerde, RossoGiallaViola, RossoGiallaRossa)
    VAR redBlueWords = (RossoBlu, RossoRossoBlu, RossoBluBlu, RossoBluVerde, RossoBluViola, RossoBluRossa, RossoBluGialla)
    VAR redGreenWords = (RossoVerde, RossoRossoVerde, RossoVerdeBlu, RossoVerdeVerde, RossoVerdeViola, RossoVerdeRossa, RossoVerdeGialla)
    VAR redPurpleWords = (RossoViola, RossoRossoViola, RossoViolaBlu, RossoViolaVerde, RossoViolaViola, RossoViolaRossa, RossoViolaGialla)
    
    //Varianti a dominante gialla
    VAR yellowRedWords = (GialloRossa, GialloGiallaRossa, GialloRossaRossa, GialloRossaVerde, GialloRossaViola, GialloRossaBlu, GialloRossaGialla)
    VAR yellowBlueWords = (GialloBlu, GialloGiallaBlu, GialloBluVerde, GialloBluViola, GialloBluBlu, GialloBluGialla, GialloBluRossa)
    VAR yellowGreenWords = (GialloVerde, GialloGiallaVerde, GialloVerdeVerde, GialloVerdeViola, GialloVerdeBlu, GialloVerdeGialla, GialloVerdeRossa)
    VAR yellowPurpleWords = (GialloViola, GialloGiallaViola, GialloViolaVerde, GialloViolaViola, GialloViolaBlu, GialloViolaGialla, GialloViolaRossa)
    
    //Varianti a dominate blu
    VAR blueRedWords = (BluRossa, BluBluRossa, BluRossaVerde, BluRossaViola, BluRossaBlu, BluRossaGialla, BluRossaRossa)
    VAR blueYellowWords = (BluGialla, BluBluGialla, BluGialloVerde, BluGialloViola, BluGialloBlu, BluGialloGialla, BluGialloRossa)
    VAR blueGreenWords = (BluVerde, BluBluVerde, BluVerdeVerde, BluVerdeViola, BluVerdeBlu, BluVerdeGialla, BluVerdeRossa)
    VAR bluePurpleWords = (BluViola, BluBluViola, BluViolaVerde, BluViolaViola, BluViolaBlu, BluViolaGialla, BluViolaRossa)
    
    //Varianti a dominante verde
    VAR greenRedWords = (VerdeRossa, VerdeVerdeRossa, VerdeRossaVerde, VerdeRossaViola, VerdeRossaBlu, VerdeRossaGialla, VerdeRossaRossa)
    VAR greenYellowWords = (VerdeGialla, VerdeVerdeGialla, VerdeGiallaVerde, VerdeGiallaViola, VerdeGiallaBlu, VerdeGiallaGialla, VerdeGiallaRossa)
    VAR greenBlueWords = (VerdeBlu, VerdeVerdeBlu, VerdeBluVerde, VerdeBluViola, VerdeBluBlu, VerdeBluGialla, VerdeBluRossa)
    VAR greenPurpleWords = (VerdeViola, VerdeVerdeViola, VerdeViolaVerde, VerdeViolaViola, VerdeViolaBlu, VerdeViolaGialla, VerdeViolaRossa)
    
    //Varianti a dominante viola
    VAR purpleRedWords = (ViolaRossa, ViolaViolaRossa, ViolaRossaVerde, ViolaRossaViola, ViolaRossaBlu, ViolaRossaGialla, ViolaRossaRossa)
    VAR purpleYellowWords = (ViolaGialla, ViolaViolaGialla, ViolaGiallaVerde, ViolaGiallaViola, ViolaGiallaBlu, ViolaGiallaGialla, ViolaGiallaRossa)
    VAR purpleBlueWords = (ViolaBlu, ViolaViolaBlu, ViolaBluVerde, ViolaBluViola, ViolaBluBlu, ViolaBluGialla, ViolaBluRossa)
    VAR purpleGreenWords = (ViolaVerde, ViolaViolaVerde, ViolaVerdeVerde, ViolaVerdeViola, ViolaVerdeBlu, ViolaVerdeGialla, ViolaVerdeRossa)
    
//Una lista degli usi possibili di emotional_words_management
    LIST emotionalWordsManagementStatus = Activate, Delete

//Una lista delle parole trovate. Se una parola è qui dentro, una volta "suonata" non passerò da emotional_inventory_management
    VAR discoveredEmotionalWords = ()

//L'inventario effettivo
    VAR ownedEmotionalWords = ()

//Il tracciamento della parola appena scoperta
    VAR newlyDiscoveredEmotionalWord = ()

//Una variabile che tiene conto di quale sia la parola attiva ora
    VAR activeEmotionalWord = ()
    
//Qualcosa che limiti il numero di parole aggiungibili, diviso tra:
    //Un contatore che aumenta ogni volta che viene aggiunta una parola all'inventario effettivo
    VAR takenEmotionalWords = 0
    
    //Un parametro che indichi il massimo delle parole previste
    VAR maximumEmotionalWordsForRun = 25

    


=== emotional_inventory_management
{nestDebug: passo per emotional_inventory.}
//Ogni volta che scopriamo una nuova parola, possiamo ignorarla, aggiungerla all'inventario, sostituire una parola dell'inventario con questa
//Qui è dove aggiungiamo, togliamo, limitiamo l'uso delle parole emozionali. Avremo:

    //La prima cosa che faccio è aggiungere la parola appena scoperta alla lista delle parole scoperte
    ~  discoveredEmotionalWords += newlyDiscoveredEmotionalWord
        {nestDebug: aggiungo {newlyDiscoveredEmotionalWord} alla lista discoveredEmotionalWords che ora contiene {discoveredEmotionalWords}.}


- (top)

    + {ownedEmotionalWords > 0} [Rimuovo una parola dall'inventario.]
    
            -> emotional_words_management(Delete) ->
        
    + [Aggiungo la parola all'inventario.]
        
        {
            - takenEmotionalWords < maximumEmotionalWordsForRun: 
                Aggiungo direttamente la parola.
                    ~  ownedEmotionalWords += newlyDiscoveredEmotionalWord
                {nestDebug: aggiungo {newlyDiscoveredEmotionalWord} alla lista ownedEmotionalWords che ora contiene {ownedEmotionalWords}.}
                
                    ~ discoveredEmotionalWords = ()
                {nestDebug: svuoto il valore di discoveredEmotionalWords che ora è {discoveredEmotionalWords}.}  
                    ~ takenEmotionalWords ++
                {nestDebug: aumento il valore di takenEmotionalWords che ora è {takenEmotionalWords}.}
                
                ->->
            
            - else:
                L'inventario è pieno, devi prima rimuovere un'altra parola.
                -> top
        }
        
    + [Non aggiungo questa parola all'inventario]
        Sicura? Non potrai più aggiungerla!
        
        + + [Sì, ignoriamola.]
                ~ discoveredEmotionalWords = ()
            {nestDebug: svuoto il valore di discoveredEmotionalWords che ora è {discoveredEmotionalWords}.} 
                ->->
            
        + + [Ci ho ripensato.]
            -> top
   
    -

->->


=== emotional_words_management(action)
//Questa è la funzione che usiamo sia per rimuovere che per attivare una parola posseduta.
{nestDebug: emotional_words_management(action). Il valore di action è {action}.}

    {
        - action == Activate: Quale parola vuoi attivare?
        - action == Delete: Quale parola vuoi cancellare?
    
    } 



    + {ownedEmotionalWords has Rossa}[Rossa]
        {
            - action == Activate: Rossa è stata attivata.
                ~ activeEmotionalWord = Rossa
                ~ ownedEmotionalWords -= Rossa
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: Rossa è stata cancellata.
                ~ ownedEmotionalWords -= Rossa
            {nestDebug: ho rimosso Rossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
        }

    
    + {ownedEmotionalWords has Gialla}[Gialla]
        {
            - action == Activate: Gialla è stata attivata.
                ~ activeEmotionalWord = Gialla
                ~ ownedEmotionalWords -= Gialla
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: Gialla è stata cancellata.
                ~ ownedEmotionalWords -= Gialla
            {nestDebug: ho rimosso Gialla dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
        }
    
    
    + {ownedEmotionalWords has Verde}[Verde]
        {
            - action == Activate: Verde è stata attivata.
                ~ activeEmotionalWord = Verde
                ~ ownedEmotionalWords -= Verde
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: Verde è stata cancellata.
                ~ ownedEmotionalWords -= Verde
            {nestDebug: ho rimosso Verde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
        }
    
    
    + {ownedEmotionalWords has Viola}[Viola]
        {
            - action == Activate: Viola è stata attivata.
                ~ activeEmotionalWord = Viola
                ~ ownedEmotionalWords -= Viola
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: Viola è stata cancellata.
                ~ ownedEmotionalWords -= Viola
            {nestDebug: ho rimosso Viola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
        }
    
    
    + {ownedEmotionalWords has Rossa}[Blu]
        {
            - action == Activate: Blu è stata attivata.
                ~ activeEmotionalWord = Blu
                ~ ownedEmotionalWords -= Blu
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: Blu è stata cancellata.
                ~ ownedEmotionalWords -= Blu
            {nestDebug: ho rimosso Blu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
        }    
    
    
    
    + [Ho cambiato idea]
    -

//Vediamo se ha senso far sempre tornare indietro, o se ha senso mandare a main e bona
->->
