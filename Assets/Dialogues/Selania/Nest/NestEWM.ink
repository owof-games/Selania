=== emotional_words_management(action)
TODO: Completare
//Questa è la funzione che usiamo sia per rimuovere che per attivare una parola posseduta.
{nestDebug: emotional_words_management(action). Il valore di action è {action}.}

    {
        - action == Activate: Quale parola vuoi attivare?
        - action == Delete: Quale parola vuoi cancellare?
    
    } 


//Varianti monocolore
    + {ownedEmotionalWords has Rosso}[Rosso]
        {
            - action == Activate: Rosso è stata attivata.
                ~ activeEmotionalWord = Rosso
                ~ ownedEmotionalWords -= Rosso
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: Rosso è stata cancellata.
                ~ ownedEmotionalWords -= Rosso
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso Rosso dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}
            {nestDebug: ho ridotto il numero di parole prese. takenEmotionalWords ora ha il valore di {takenEmotionalWords}.}  
        }

    
    + {ownedEmotionalWords has Giallo}[Giallo]
        {
            - action == Activate: Giallo è stata attivata.
                ~ activeEmotionalWord = Giallo
                ~ ownedEmotionalWords -= Giallo
            {nestDebug: ho attivato una parola, che è {activeEmotionalWord}, e l'ho rimossa dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.}    
            
            - action == Delete: Giallo è stata cancellata.
                ~ ownedEmotionalWords -= Giallo
                ~ takenEmotionalWords --
            {nestDebug: ho rimosso Giallo dalle parole possedute. La lista delle parole possedute ora contiene {ownedEmotionalWords}.} 
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
    
 //Varianti a dominante Rosso
 
 
 //Varianti a dominante Giallo
 
 
 //Varianti a dominante blu
 
 
 //Varianti a dominante verde
 
 
 //Varianti a dominante viola
    
    + [Ho cambiato idea]
    -
    {
        - activeEmotionalWord != ():
            -> word_usage_counter ->
    }
->->

//Utilizzato per capire quante volte posso usare una parola
=== word_usage_counter
{nestDebug: passo per word_usage_counter.}
{nestDebug: prima dell'aggiornamento il valore di temporaryWordUsageCounter è {temporaryWordUsageCounter}.}
    
    {
        - oneUsageWords has activeEmotionalWord:
            ~ temporaryWordUsageCounter = 1
        
        - twoUsageWords has activeEmotionalWord:
            ~ temporaryWordUsageCounter = 2
        
        - threeUsageWords has activeEmotionalWord:
            ~ temporaryWordUsageCounter = 3
        
        - else: ERROR, non riesco a trovare {activeEmotionalWord} in nessuna delle tre liste, per cui non riesco ad assegnare un valore a temporaryWordUsageCounter, che ora è a {temporaryWordUsageCounter}.
    }
    
{nestDebug: dopo l'aggiornamento il valore di temporaryWordUsageCounter è {temporaryWordUsageCounter}.}  
        
        ->->
