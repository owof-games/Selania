=== nest_recap
TODO: A traduttore settato, invece della parola scritta a mano (es: Parola Gialla) chiamerò direttamente il traduttore (emotional_words_translator(Gialla)).

+ {are_two_entities_together(NestRecap, PG)} [NestRecap]
    ~ enableBigDialogue()

//Varianti monocolore
    {
        - redWords ^ discoveredEmotionalWords == ():
            <i>Questa parola non è stata ancora scoperta</>
            
        - else:
            <b>Parola Rossa.</b>
            <> Caratteristiche generali.
            {
                - LIST_COUNT(redWords ^ usedEmotionaWords) > 0: <> prima info.
            }
            {
                - LIST_COUNT(redWords ^ usedEmotionaWords) > 1: <> seconda info.
            }
            {
                - LIST_COUNT(redWords ^ usedEmotionaWords) > 2: <> terza info.
            }
            
            {
                - redWords ^ discoveredEmotionalWords has Rosso: <> caratteristiche variante uno.
                - redWords ^ discoveredEmotionalWords hasnt Rosso: <> variante non scoperta.
            }
            {
                - redWords ^ discoveredEmotionalWords has RossoRosso: <> caratteristiche variante due.
                - redWords ^ discoveredEmotionalWords hasnt RossoRosso: <> variante non scoperta.
            }
            {
                - redWords ^ discoveredEmotionalWords has RossoRossoRosso: <> caratteristiche variante tre.
                - redWords ^ discoveredEmotionalWords hasnt RossoRossoRosso: <> variante non scoperta.
            
            }
    
    
    }
    
    {
        - yellowWords ^ discoveredEmotionalWords == ():
            <i>Questa parola non è stata ancora scoperta</>
            
        - else:
            <b>Parola Gialla.</b>
            <> Caratteristiche generali.
            {
                - LIST_COUNT(yellowWords ^ usedEmotionaWords) > 0: <> prima info.
            }
            {
                - LIST_COUNT(yellowWords ^ usedEmotionaWords) > 1: <> seconda info.
            }
            {
                - LIST_COUNT(yellowWords ^ usedEmotionaWords) > 2: <> terza info.
            }
            
            {
                - yellowWords ^ discoveredEmotionalWords has Giallo: <> caratteristiche variante uno.
                - yellowWords ^ discoveredEmotionalWords hasnt Giallo: <> variante non scoperta.
            }
            {
                - yellowWords ^ discoveredEmotionalWords has GialloGiallo: <> caratteristiche variante due.
                - yellowWords ^ discoveredEmotionalWords hasnt GialloGiallo: <> variante non scoperta.
            }
            {
                - yellowWords ^ discoveredEmotionalWords has GialloGialloGiallo: <> caratteristiche variante tre.
                - yellowWords ^ discoveredEmotionalWords hasnt GialloGialloGiallo: <> variante non scoperta.
            
            }
    
    
    }
    
    {
        - bluWords ^ discoveredEmotionalWords == ():
            <i>Questa parola non è stata ancora scoperta</>
            
        - else:
            <b>Parola Blu.</b>
            <> Caratteristiche generali.
            {
                - LIST_COUNT(bluWords ^ usedEmotionaWords) > 0: <> prima info.
            }
            {
                - LIST_COUNT(bluWords ^ usedEmotionaWords) > 1: <> seconda info.
            }
            {
                - LIST_COUNT(bluWords ^ usedEmotionaWords) > 2: <> terza info.
            }
            
            {
                - bluWords ^ discoveredEmotionalWords has Blu: <> caratteristiche variante uno.
                - bluWords ^ discoveredEmotionalWords hasnt Blu: <> variante non scoperta.
            }
            {
                - bluWords ^ discoveredEmotionalWords has BluBlu: <> caratteristiche variante due.
                - bluWords ^ discoveredEmotionalWords hasnt BluBlu: <> variante non scoperta.
            }
            {
                - bluWords ^ discoveredEmotionalWords has BluBluBlu: <> caratteristiche variante tre.
                - bluWords ^ discoveredEmotionalWords hasnt BluBluBlu: <> variante non scoperta.
            
            }
    
    
    }
    
    {
        - greenWords ^ discoveredEmotionalWords == ():
            <i>Questa parola non è stata ancora scoperta</>
            
        - else:
            <b>Parola Verde.</b>
            <> Caratteristiche generali.
            {
                - LIST_COUNT(greenWords ^ usedEmotionaWords) > 0: <> prima info.
            }
            {
                - LIST_COUNT(greenWords ^ usedEmotionaWords) > 1: <> seconda info.
            }
            {
                - LIST_COUNT(greenWords ^ usedEmotionaWords) > 2: <> terza info.
            }
            
            {
                - greenWords ^ discoveredEmotionalWords has Verde: <> caratteristiche variante uno.
                - greenWords ^ discoveredEmotionalWords hasnt Verde: <> variante non scoperta.
            }
            {
                - greenWords ^ discoveredEmotionalWords has VerdeVerde: <> caratteristiche variante due.
                - greenWords ^ discoveredEmotionalWords hasnt VerdeVerde: <> variante non scoperta.
            }
            {
                - greenWords ^ discoveredEmotionalWords has VerdeVerdeVerde: <> caratteristiche variante tre.
                - greenWords ^ discoveredEmotionalWords hasnt VerdeVerdeVerde: <> variante non scoperta.
            
            }
    
    
    }

    {
        - purpleWords ^ discoveredEmotionalWords == ():
            <i>Questa parola non è stata ancora scoperta</>
            
        - else:
            <b>Parola Viola.</b>
            <> Caratteristiche generali.
            {
                - LIST_COUNT(purpleWords ^ usedEmotionaWords) > 0: <> prima info.
            }
            {
                - LIST_COUNT(purpleWords ^ usedEmotionaWords) > 1: <> seconda info.
            }
            {
                - LIST_COUNT(purpleWords ^ usedEmotionaWords) > 2: <> terza info.
            }
            
            {
                - purpleWords ^ discoveredEmotionalWords has Viola: <> caratteristiche variante uno.
                - purpleWords ^ discoveredEmotionalWords hasnt Viola: <> variante non scoperta.
            }
            {
                - purpleWords ^ discoveredEmotionalWords has ViolaViola: <> caratteristiche variante due.
                - purpleWords ^ discoveredEmotionalWords hasnt ViolaViola: <> variante non scoperta.
            }
            {
                - purpleWords ^ discoveredEmotionalWords has ViolaViolaViola: <> caratteristiche variante tre.
                - purpleWords ^ discoveredEmotionalWords hasnt ViolaViolaViola: <> variante non scoperta.
            
            }
    
    
    }       

//Varianti a dominante Rosso
    {
        - redYellowWords ^ discoveredEmotionalWords == ():
            <i>Questa parola non è stata ancora scoperta</>
            
        - else:
            <b>Parola RossoGialla.</b>
            <> Caratteristiche generali.
            {
                - LIST_COUNT(redYellowWords ^ usedEmotionaWords) > 0: <> prima info.
            }
            {    
                - LIST_COUNT(redYellowWords ^ usedEmotionaWords) > 3: <> seconda info.
            }
            {    
                - LIST_COUNT(redYellowWords ^ usedEmotionaWords) > 6: <> terza info.
            }
            
            {
                - redYellowWords ^ discoveredEmotionalWords has RossoGiallo: <> caratteristiche variante uno.
                - redYellowWords ^ discoveredEmotionalWords hasnt RossoGiallo: <> variante non scoperta.
            }
            {    
                - redYellowWords ^ discoveredEmotionalWords has RossoRossoGiallo:<> caratteristiche variante due.
                - redYellowWords ^ discoveredEmotionalWords hasnt RossoRossoGiallo:<> variante non scoperta.
            }
            {    
                - redYellowWords ^ discoveredEmotionalWords has RossoGialloGiallo:<> caratteristiche variante tre.
                - redYellowWords ^ discoveredEmotionalWords hasnt RossoGialloGiallo:<> variante non scoperta.
            }
            {    
                - redYellowWords ^ discoveredEmotionalWords has RossoGialloBlu: <> caratteristiche variante quattro.
                - redYellowWords ^ discoveredEmotionalWords hasnt RossoGialloBlu: <> variante non scoperta.
            }
            {    
                - redYellowWords ^ discoveredEmotionalWords has RossoGialloVerde:<> caratteristiche variante cinque.
                - redYellowWords ^ discoveredEmotionalWords hasnt RossoGialloVerde:<> variante non scoperta.
            }
            {    
                - redYellowWords ^ discoveredEmotionalWords has RossoGialloViola:<> caratteristiche variante sei.
                - redYellowWords ^ discoveredEmotionalWords hasnt RossoGialloViola:<> variante non scoperta.
            }
            {     
                - redYellowWords ^ discoveredEmotionalWords has RossoGialloRosso:<> caratteristiche variante sette.
                - redYellowWords ^ discoveredEmotionalWords hasnt RossoGialloRosso:<> variante non scoperta.
            
            }
    
    
    } 
    







-> rewriter_book_with_flow
