=== emotional_words_management(action)
TODO: Completare
//Questa è la funzione che usiamo sia per rimuovere che per attivare una parola posseduta.
{nestDebug: emotional_words_management(action). Il valore di action è {action}.}

    {
        - action == Activate: Quale parola vuoi attivare?
        - action == Delete: Quale parola vuoi cancellare?
    
    } 


//Varianti monocolore
    + {ownedEmotionalWords has Rossa}[Rossa]
        {
            - action == Activate: Rossa è stata attivata.
                ~ activeEmotionalWord = Rossa
                ~ ownedEmotionalWords -= Rossa
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: Rossa è stata cancellata.
                ~ ownedEmotionalWords -= Rossa
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso Rossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }

    
    + {ownedEmotionalWords has Gialla}[Gialla]
        {
            - action == Activate: Gialla è stata attivata.
                ~ activeEmotionalWord = Gialla
                ~ ownedEmotionalWords -= Gialla
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: Gialla è stata cancellata.
                ~ ownedEmotionalWords -= Gialla
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso Gialla dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    
    + {ownedEmotionalWords has Verde}[Verde]
        {
            - action == Activate: Verde è stata attivata.
                ~ activeEmotionalWord = Verde
                ~ ownedEmotionalWords -= Verde
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: Verde è stata cancellata.
                ~ ownedEmotionalWords -= Verde
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso Verde dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    
    + {ownedEmotionalWords has Viola}[Viola]
        {
            - action == Activate: Viola è stata attivata.
                ~ activeEmotionalWord = Viola
                ~ ownedEmotionalWords -= Viola
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: Viola è stata cancellata.
                ~ ownedEmotionalWords -= Viola
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso Viola dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}  
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }
    
    
    + {ownedEmotionalWords has Blu}[Blu]
        {
            - action == Activate: Blu è stata attivata.
                ~ activeEmotionalWord = Blu
                ~ ownedEmotionalWords -= Blu
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: Blu è stata cancellata.
                ~ ownedEmotionalWords -= Blu
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso Blu dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.} 
        }    
    
 //Varianti a dominante rossa
 
 
 //Varianti a dominante gialla
 
 
 //Varianti a dominante blu
 
 
 //Varianti a dominante verde
 
 
 //Varianti a dominante viola
    
    + [Ho cambiato idea]
    -

//Vediamo se ha senso far sempre tornare indietro, o se ha senso mandare a main e bona
->->