=== nest_recap
+ {are_two_entities_together(NestRecap, PG)} [NestRecap]
    ~ enableBigDialogue()

//Varianti monocolore
    {
        - redWords ^ usedEmotionaWords == ():
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
                - redWords ^ usedEmotionaWords has Rosso: <> caratteristiche variante uno.
                - redWords ^ usedEmotionaWords hasnt Rosso: <> variante non scoperta.
            }
            {
                - redWords ^ usedEmotionaWords has RossoRosso: <> caratteristiche variante due.
                - redWords ^ usedEmotionaWords hasnt RossoRosso: <> variante non scoperta.
            }
            {
                - redWords ^ usedEmotionaWords has RossoRossoRosso: <> caratteristiche variante tre.
                - redWords ^ usedEmotionaWords hasnt RossoRossoRosso: <> variante non scoperta..
            
            }
    
    
    }
    
    {
        - yellowWords ^ usedEmotionaWords == ():
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
                - yellowWords ^ usedEmotionaWords has Giallo: <> caratteristiche variante uno.
                - yellowWords ^ usedEmotionaWords hasnt Giallo: <> variante non scoperta.
            }
            {
                - yellowWords ^ usedEmotionaWords has GialloGiallo: <> caratteristiche variante due.
                - yellowWords ^ usedEmotionaWords hasnt GialloGiallo: <> variante non scoperta.
            }
            {
                - yellowWords ^ usedEmotionaWords has GialloGialloGiallo: <> caratteristiche variante tre.
                - yellowWords ^ usedEmotionaWords hasnt GialloGialloGiallo: <> variante non scoperta..
            
            }
    
    
    }
    
    {
        - bluWords ^ usedEmotionaWords == ():
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
                - bluWords ^ usedEmotionaWords has Blu: <> caratteristiche variante uno.
                - bluWords ^ usedEmotionaWords hasnt Blu: <> variante non scoperta.
            }
            {
                - bluWords ^ usedEmotionaWords has BluBlu: <> caratteristiche variante due.
                - bluWords ^ usedEmotionaWords hasnt BluBlu: <> variante non scoperta.
            }
            {
                - bluWords ^ usedEmotionaWords has BluBluBlu: <> caratteristiche variante tre.
                - bluWords ^ usedEmotionaWords hasnt BluBluBlu: <> variante non scoperta..
            
            }
    
    
    }
    
    {
        - greenWords ^ usedEmotionaWords == ():
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
                - greenWords ^ usedEmotionaWords has Verde: <> caratteristiche variante uno.
                - greenWords ^ usedEmotionaWords hasnt Verde: <> variante non scoperta.
            }
            {
                - greenWords ^ usedEmotionaWords has VerdeVerde: <> caratteristiche variante due.
                - greenWords ^ usedEmotionaWords hasnt VerdeVerde: <> variante non scoperta.
            }
            {
                - greenWords ^ usedEmotionaWords has VerdeVerdeVerde: <> caratteristiche variante tre.
                - greenWords ^ usedEmotionaWords hasnt VerdeVerdeVerde: <> variante non scoperta..
            
            }
    
    
    }

    {
        - purpleWords ^ usedEmotionaWords == ():
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
                - purpleWords ^ usedEmotionaWords has Viola: <> caratteristiche variante uno.
                - purpleWords ^ usedEmotionaWords hasnt Viola: <> variante non scoperta.
            }
            {
                - purpleWords ^ usedEmotionaWords has ViolaViola: <> caratteristiche variante due.
                - purpleWords ^ usedEmotionaWords hasnt ViolaViola: <> variante non scoperta.
            }
            {
                - purpleWords ^ usedEmotionaWords has ViolaViolaViola: <> caratteristiche variante tre.
                - purpleWords ^ usedEmotionaWords hasnt ViolaViolaViola: <> variante non scoperta..
            
            }
    
    
    }       

//Varianti a dominante Rosso
    {
        - redYellowWords ^ usedEmotionaWords == ():
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
                - redYellowWords ^ usedEmotionaWords has RossoGiallo: <> caratteristiche variante uno.
                - redYellowWords ^ usedEmotionaWords hasnt RossoGiallo: <> variante non scoperta.
            }
            {    
                - redYellowWords ^ usedEmotionaWords has RossoRossoGiallo:<> caratteristiche variante due.
                - redYellowWords ^ usedEmotionaWords hasnt RossoRossoGiallo:<> variante non scoperta.
            }
            {    
                - redYellowWords ^ usedEmotionaWords has RossoGialloGiallo:<> caratteristiche variante tre.
                - redYellowWords ^ usedEmotionaWords hasnt RossoGialloGiallo:<> variante non scoperta.
            }
            {    
                - redYellowWords ^ usedEmotionaWords has RossoGialloBlu: <> caratteristiche variante quattro.
                - redYellowWords ^ usedEmotionaWords hasnt RossoGialloBlu: <> variante non scoperta.
            }
            {    
                - redYellowWords ^ usedEmotionaWords has RossoGialloVerde:<> caratteristiche variante cinque.
                - redYellowWords ^ usedEmotionaWords hasnt RossoGialloVerde:<> variante non scoperta.
            }
            {    
                - redYellowWords ^ usedEmotionaWords has RossoGialloViola:<> caratteristiche variante sei.
                - redYellowWords ^ usedEmotionaWords hasnt RossoGialloViola:<> variante non scoperta.
            }
            {     
                - redYellowWords ^ usedEmotionaWords has RossoGialloRosso:<> caratteristiche variante sette.
                - redYellowWords ^ usedEmotionaWords hasnt RossoGialloRosso:<> variante non scoperta.
            
            }
    
    
    } 
    







-> rewriter_book_with_flow
