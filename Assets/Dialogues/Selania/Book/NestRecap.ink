=== nest_recap
+ {are_two_entities_together(NestRecap, PG)} [NestRecap]
~ enableBigDialogue()

//Varianti monocolore
    {
        - redWords ^ discoveredEmotionalWords == ():
            <i>Questa parola non è stata ancora scoperta</>
            
        - else:
            <b>Parola Rossa</b><>
            Caratteristiche generali<>
            {
                - LIST_COUNT(redWords) ^ LIST_COUNT(discoveredEmotionalWords) > 0: prima info.<>
                - LIST_COUNT(redWords) ^ LIST_COUNT(discoveredEmotionalWords) > 1: seconda info.<>
                - LIST_COUNT(redWords) ^ LIST_COUNT(discoveredEmotionalWords) > 2: terza info.<>
            }
            
            {
                - redWords ^ discoveredEmotionalWords has Rosso: caratteristiche variante uno.<>
                - redWords ^ discoveredEmotionalWords has RossoRosso:caratteristiche variante due.<>
                - redWords ^ discoveredEmotionalWords has RossoRossoRosso:caratteristiche variante tre.
            
            }
    
    
    }
    
    {
        - yellowWords ^ discoveredEmotionalWords == ():
            <i>Questa parola non è stata ancora scoperta</>
            
        - else:
            <b>Parola Gialla</b><>
            Caratteristiche generali<>
            {
                - LIST_COUNT(yellowWords) ^ LIST_COUNT(discoveredEmotionalWords) > 0: prima info.<>
                - LIST_COUNT(yellowWords) ^ LIST_COUNT(discoveredEmotionalWords) > 1: seconda info.<>
                - LIST_COUNT(yellowWords) ^ LIST_COUNT(discoveredEmotionalWords) > 2: terza info.<>
            }
            
            {
                - yellowWords ^ discoveredEmotionalWords has Giallo: caratteristiche variante uno.<>
                - yellowWords ^ discoveredEmotionalWords has GialloGiallo:caratteristiche variante due.<>
                - yellowWords ^ discoveredEmotionalWords has GialloGialloGiallo:caratteristiche variante tre.
            
            }
    
    
    }
    
    {
        - bluWords ^ discoveredEmotionalWords == ():
            <i>Questa parola non è stata ancora scoperta</>
            
        - else:
            <b>Parola Blu</b><>
            Caratteristiche generali<>
            {
                - LIST_COUNT(bluWords) ^ LIST_COUNT(discoveredEmotionalWords) > 0: prima info.<>
                - LIST_COUNT(bluWords) ^ LIST_COUNT(discoveredEmotionalWords) > 1: seconda info.<>
                - LIST_COUNT(bluWords) ^ LIST_COUNT(discoveredEmotionalWords) > 2: terza info.<>
            }
            
            {
                - bluWords ^ discoveredEmotionalWords has Blu: caratteristiche variante uno.<>
                - bluWords ^ discoveredEmotionalWords has BluBlu:caratteristiche variante due.<>
                - bluWords ^ discoveredEmotionalWords has BluBluBlu:caratteristiche variante tre.
            
            }
    
    
    }
    
    {
        - greenWords ^ discoveredEmotionalWords == ():
            <i>Questa parola non è stata ancora scoperta</>
            
        - else:
            <b>Parola Verde</b><>
            Caratteristiche generali<>
            {
                - LIST_COUNT(greenWords) ^ LIST_COUNT(discoveredEmotionalWords) > 0: prima info.<>
                - LIST_COUNT(greenWords) ^ LIST_COUNT(discoveredEmotionalWords) > 1: seconda info.<>
                - LIST_COUNT(greenWords) ^ LIST_COUNT(discoveredEmotionalWords) > 2: terza info.<>
            }
            
            {
                - greenWords ^ discoveredEmotionalWords has Verde: caratteristiche variante uno.<>
                - greenWords ^ discoveredEmotionalWords has VerdeVerde:caratteristiche variante due.<>
                - greenWords ^ discoveredEmotionalWords has VerdeVerdeVerde:caratteristiche variante tre.
            
            }
    
    
    }

    {
        - purpleWords ^ discoveredEmotionalWords == ():
            <i>Questa parola non è stata ancora scoperta</>
            
        - else:
            <b>Parola Viola</b><>
            Caratteristiche generali<>
            {
                - LIST_COUNT(purpleWords) ^ LIST_COUNT(discoveredEmotionalWords) > 0: prima info.<>
                - LIST_COUNT(purpleWords) ^ LIST_COUNT(discoveredEmotionalWords) > 1: seconda info.<>
                - LIST_COUNT(purpleWords) ^ LIST_COUNT(discoveredEmotionalWords) > 2: terza info.<>
            }
            
            {
                - purpleWords ^ discoveredEmotionalWords has Viola: caratteristiche variante uno.<>
                - purpleWords ^ discoveredEmotionalWords has ViolaViola:caratteristiche variante due.<>
                - purpleWords ^ discoveredEmotionalWords has ViolaViolaViola:caratteristiche variante tre.
            
            }
    
    
    }       

//Varianti a dominante Rosso
    {
        - redYellowWords ^ discoveredEmotionalWords == ():
            <i>Questa parola non è stata ancora scoperta</>
            
        - else:
            <b>Parola RossoGialla</b><>
            Caratteristiche generali<>
            {
                - LIST_COUNT(redYellowWords) ^ LIST_COUNT(discoveredEmotionalWords) > 0: prima info.<>
                - LIST_COUNT(redYellowWords) ^ LIST_COUNT(discoveredEmotionalWords) > 3: seconda info.<>
                - LIST_COUNT(redYellowWords) ^ LIST_COUNT(discoveredEmotionalWords) > 6: terza info.<>
            }
            
            {
                - redYellowWords ^ discoveredEmotionalWords has Viola: caratteristiche variante uno.<>
                - redYellowWords ^ discoveredEmotionalWords has ViolaViola:caratteristiche variante due.<>
                - redYellowWords ^ discoveredEmotionalWords has ViolaViolaViola:caratteristiche variante tre.<>
                - redYellowWords ^ discoveredEmotionalWords has Viola: caratteristiche variante quattro.<>
                - redYellowWords ^ discoveredEmotionalWords has ViolaViola:caratteristiche variante cinque.<>
                - redYellowWords ^ discoveredEmotionalWords has ViolaViolaViola:caratteristiche variante sei.<>
                - redYellowWords ^ discoveredEmotionalWords has ViolaViolaViola:caratteristiche variante sette.
            
            }
    
    
    } 
    







-> rewriter_book_with_flow
