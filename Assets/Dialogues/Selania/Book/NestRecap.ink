=== nest_recap
TODO: A traduttore settato, invece della parola scritta a mano (es: Parola Gialla) chiamerò direttamente il traduttore (emotional_words_translator(Gialla)).

+ (check){are_two_entities_together(NestRecap, PG)} [NestRecap]
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameThree = translator(thirdCharacterState)
    ~ temp charNameFour= translator(fourthCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    ~ enableBigDialogue()

//Varianti monocolore
    {
        - redWords ^ discoveredEmotionalWords == ():
            <i>La prima parola non è stata ancora scoperta.
            
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
            <i>La seconda parola non è stata ancora scoperta.
            
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
            <i>La terza parola non è stata ancora scoperta.
            
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
            <i>La quarta parola non è stata ancora scoperta.
            
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
            <i>La quinta parola non è stata ancora scoperta.
            
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
            <i>La sesta parola non è stata ancora scoperta.
            
        - else:
            <b>Parola RossoGialla.</b>
            <> Caratteristiche generali.
            {
                - LIST_COUNT(redYellowWords ^ usedEmotionaWords) > 0: <> prima info.
            }
            {    
                - LIST_COUNT(redYellowWords ^ usedEmotionaWords) > 1: <> seconda info.
            }
            {    
                - LIST_COUNT(redYellowWords ^ usedEmotionaWords) > 2: <> terza info.
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
    
    {
        - redBlueWords ^ discoveredEmotionalWords == ():
            <i>La settima parola non è stata ancora scoperta.
            
        - else:
            <b>Parola RossoBlu.</b>
            <> Caratteristiche generali.
            {
                - LIST_COUNT(redBlueWords ^ usedEmotionaWords) > 0: <> prima info.
            }
            {    
                - LIST_COUNT(redBlueWords ^ usedEmotionaWords) > 1: <> seconda info.
            }
            {    
                - LIST_COUNT(redBlueWords ^ usedEmotionaWords) > 2: <> terza info.
            }
            
            {
                - redBlueWords ^ discoveredEmotionalWords has RossoBlu: <> caratteristiche variante uno.
                - redBlueWords ^ discoveredEmotionalWords hasnt RossoBlu: <> variante non scoperta.
            }
            {    
                - redBlueWords ^ discoveredEmotionalWords has RossoRossoBlu:<> caratteristiche variante due.
                - redBlueWords ^ discoveredEmotionalWords hasnt RossoRossoBlu:<> variante non scoperta.
            }
            {    
                - redBlueWords ^ discoveredEmotionalWords has RossoBluBlu:<> caratteristiche variante tre.
                - redBlueWords ^ discoveredEmotionalWords hasnt RossoBluBlu:<> variante non scoperta.
            }
            {    
                - redBlueWords ^ discoveredEmotionalWords has RossoBluVerde: <> caratteristiche variante quattro.
                - redBlueWords ^ discoveredEmotionalWords hasnt RossoBluVerde: <> variante non scoperta.
            }
            {    
                - redBlueWords ^ discoveredEmotionalWords has RossoBluViola:<> caratteristiche variante cinque.
                - redBlueWords ^ discoveredEmotionalWords hasnt RossoBluViola:<> variante non scoperta.
            }
            {    
                - redBlueWords ^ discoveredEmotionalWords has RossoBluRosso:<> caratteristiche variante sei.
                - redBlueWords ^ discoveredEmotionalWords hasnt RossoBluRosso:<> variante non scoperta.
            }
            {     
                - redBlueWords ^ discoveredEmotionalWords has RossoBluGiallo:<> caratteristiche variante sette.
                - redBlueWords ^ discoveredEmotionalWords hasnt RossoBluGiallo:<> variante non scoperta.
            
            }
    
    
    } 
    {
        - redGreenWords ^ discoveredEmotionalWords == ():
            <i>L'ottava parola non è stata ancora scoperta.
            
        - else:
            <b>Parola RossoVerde.</b>
            <> Caratteristiche generali.
            {
                - LIST_COUNT(redGreenWords ^ usedEmotionaWords) > 0: <> prima info.
            }
            {    
                - LIST_COUNT(redGreenWords ^ usedEmotionaWords) > 1: <> seconda info.
            }
            {    
                - LIST_COUNT(redGreenWords ^ usedEmotionaWords) > 2: <> terza info.
            }
            
            {
                - redGreenWords ^ discoveredEmotionalWords has RossoVerde: <> caratteristiche variante uno.
                - redGreenWords ^ discoveredEmotionalWords hasnt RossoVerde: <> variante non scoperta.
            }
            {    
                - redGreenWords ^ discoveredEmotionalWords has RossoRossoVerde:<> caratteristiche variante due.
                - redGreenWords ^ discoveredEmotionalWords hasnt RossoRossoVerde:<> variante non scoperta.
            }
            {    
                - redGreenWords ^ discoveredEmotionalWords has RossoVerdeBlu:<> caratteristiche variante tre.
                - redGreenWords ^ discoveredEmotionalWords hasnt RossoVerdeBlu:<> variante non scoperta.
            }
            {    
                - redGreenWords ^ discoveredEmotionalWords has RossoVerdeVerde: <> caratteristiche variante quattro.
                - redGreenWords ^ discoveredEmotionalWords hasnt RossoVerdeVerde: <> variante non scoperta.
            }
            {    
                - redGreenWords ^ discoveredEmotionalWords has RossoVerdeViola:<> caratteristiche variante cinque.
                - redGreenWords ^ discoveredEmotionalWords hasnt RossoVerdeViola:<> variante non scoperta.
            }
            {    
                - redGreenWords ^ discoveredEmotionalWords has RossoVerdeRosso:<> caratteristiche variante sei.
                - redGreenWords ^ discoveredEmotionalWords hasnt RossoVerdeRosso:<> variante non scoperta.
            }
            {     
                - redGreenWords ^ discoveredEmotionalWords has RossoVerdeGiallo:<> caratteristiche variante sette.
                - redGreenWords ^ discoveredEmotionalWords hasnt RossoVerdeGiallo:<> variante non scoperta.
            
            }
    
    
    } 
    
    {
        - redPurpleWords ^ discoveredEmotionalWords == ():
            <i>La nona parola non è stata ancora scoperta.
            
        - else:
            <b>Parola RossoViola.</b>
            <> Caratteristiche generali.
            {
                - LIST_COUNT(redPurpleWords ^ usedEmotionaWords) > 0: <> prima info.
            }
            {    
                - LIST_COUNT(redPurpleWords ^ usedEmotionaWords) > 1: <> seconda info.
            }
            {    
                - LIST_COUNT(redPurpleWords ^ usedEmotionaWords) > 2: <> terza info.
            }
            
            {
                - redPurpleWords ^ discoveredEmotionalWords has RossoViola: <> caratteristiche variante uno.
                - redPurpleWords ^ discoveredEmotionalWords hasnt RossoViola: <> variante non scoperta.
            }
            {    
                - redPurpleWords ^ discoveredEmotionalWords has RossoRossoViola:<> caratteristiche variante due.
                - redPurpleWords ^ discoveredEmotionalWords hasnt RossoRossoViola:<> variante non scoperta.
            }
            {    
                - redPurpleWords ^ discoveredEmotionalWords has RossoViolaBlu:<> caratteristiche variante tre.
                - redPurpleWords ^ discoveredEmotionalWords hasnt RossoViolaBlu:<> variante non scoperta.
            }
            {    
                - redPurpleWords ^ discoveredEmotionalWords has RossoViolaVerde: <> caratteristiche variante quattro.
                - redPurpleWords ^ discoveredEmotionalWords hasnt RossoViolaVerde: <> variante non scoperta.
            }
            {    
                - redPurpleWords ^ discoveredEmotionalWords has RossoViolaViola:<> caratteristiche variante cinque.
                - redPurpleWords ^ discoveredEmotionalWords hasnt RossoViolaViola:<> variante non scoperta.
            }
            {    
                - redPurpleWords ^ discoveredEmotionalWords has RossoViolaRosso:<> caratteristiche variante sei.
                - redPurpleWords ^ discoveredEmotionalWords hasnt RossoViolaRosso:<> variante non scoperta.
            }
            {     
                - redPurpleWords ^ discoveredEmotionalWords has RossoViolaGiallo:<> caratteristiche variante sette.
                - redPurpleWords ^ discoveredEmotionalWords hasnt RossoViolaGiallo:<> variante non scoperta.
            
            }
    
    
    } 





//Varianti a dominante Giallo
    {
        - yellowRedWords ^ discoveredEmotionalWords == ():
            <i>La decima parola non è stata ancora scoperta.
            
        - else:
            <b>Parola GialloRossa.</b>
            <> Caratteristiche generali.
            {
                - LIST_COUNT(yellowRedWords ^ usedEmotionaWords) > 0: <> prima info.
            }
            {    
                - LIST_COUNT(yellowRedWords ^ usedEmotionaWords) > 1: <> seconda info.
            }
            {    
                - LIST_COUNT(yellowRedWords ^ usedEmotionaWords) > 2: <> terza info.
            }
            
            {
                - yellowRedWords ^ discoveredEmotionalWords has GialloRosso: <> caratteristiche variante uno.
                - yellowRedWords ^ discoveredEmotionalWords hasnt GialloRosso: <> variante non scoperta.
            }
            {    
                - yellowRedWords ^ discoveredEmotionalWords has GialloGialloRosso:<> caratteristiche variante due.
                - yellowRedWords ^ discoveredEmotionalWords hasnt GialloGialloRosso:<> variante non scoperta.
            }
            {    
                - yellowRedWords ^ discoveredEmotionalWords has GialloRossoRosso:<> caratteristiche variante tre.
                - yellowRedWords ^ discoveredEmotionalWords hasnt GialloRossoRosso:<> variante non scoperta.
            }
            {    
                - yellowRedWords ^ discoveredEmotionalWords has GialloRossoVerde: <> caratteristiche variante quattro.
                - yellowRedWords ^ discoveredEmotionalWords hasnt GialloRossoVerde: <> variante non scoperta.
            }
            {    
                - yellowRedWords ^ discoveredEmotionalWords has GialloRossoViola:<> caratteristiche variante cinque.
                - yellowRedWords ^ discoveredEmotionalWords hasnt GialloRossoViola:<> variante non scoperta.
            }
            {    
                - yellowRedWords ^ discoveredEmotionalWords has GialloRossoBlu:<> caratteristiche variante sei.
                - yellowRedWords ^ discoveredEmotionalWords hasnt GialloRossoBlu:<> variante non scoperta.
            }
            {     
                - yellowRedWords ^ discoveredEmotionalWords has GialloRossoGiallo:<> caratteristiche variante sette.
                - yellowRedWords ^ discoveredEmotionalWords hasnt GialloRossoGiallo:<> variante non scoperta.
            
            }
    
    
    } 
    
    {
        - yellowBlueWords ^ discoveredEmotionalWords == ():
            <i>L'undicesima parola non è stata ancora scoperta.
            
        - else:
            <b>Parola GialloBlu.</b>
            <> Caratteristiche generali.
            {
                - LIST_COUNT(yellowBlueWords ^ usedEmotionaWords) > 0: <> prima info.
            }
            {    
                - LIST_COUNT(yellowBlueWords ^ usedEmotionaWords) > 1: <> seconda info.
            }
            {    
                - LIST_COUNT(yellowBlueWords ^ usedEmotionaWords) > 2: <> terza info.
            }
            
            {
                - yellowBlueWords ^ discoveredEmotionalWords has GialloBlu: <> caratteristiche variante uno.
                - yellowBlueWords ^ discoveredEmotionalWords hasnt GialloBlu: <> variante non scoperta.
            }
            {    
                - yellowBlueWords ^ discoveredEmotionalWords has GialloGialloBlu:<> caratteristiche variante due.
                - yellowBlueWords ^ discoveredEmotionalWords hasnt GialloGialloBlu:<> variante non scoperta.
            }
            {    
                - yellowBlueWords ^ discoveredEmotionalWords has GialloBluVerde:<> caratteristiche variante tre.
                - yellowBlueWords ^ discoveredEmotionalWords hasnt GialloBluVerde:<> variante non scoperta.
            }
            {    
                - yellowBlueWords ^ discoveredEmotionalWords has GialloBluViola: <> caratteristiche variante quattro.
                - yellowBlueWords ^ discoveredEmotionalWords hasnt GialloBluViola: <> variante non scoperta.
            }
            {    
                - yellowBlueWords ^ discoveredEmotionalWords has GialloBluBlu:<> caratteristiche variante cinque.
                - yellowBlueWords ^ discoveredEmotionalWords hasnt GialloBluBlu:<> variante non scoperta.
            }
            {    
                - yellowBlueWords ^ discoveredEmotionalWords has GialloBluGiallo:<> caratteristiche variante sei.
                - yellowBlueWords ^ discoveredEmotionalWords hasnt GialloBluGiallo:<> variante non scoperta.
            }
            {     
                - yellowBlueWords ^ discoveredEmotionalWords has GialloBluRosso:<> caratteristiche variante sette.
                - yellowBlueWords ^ discoveredEmotionalWords hasnt GialloBluRosso:<> variante non scoperta.
            
            }
    
    
    } 
    {
        - yellowGreenWords ^ discoveredEmotionalWords == ():
            <i>La dodicesima parola non è stata ancora scoperta.
            
        - else:
            <b>Parola GialloVerde.</b>
            <> Caratteristiche generali.
            {
                - LIST_COUNT(yellowGreenWords ^ usedEmotionaWords) > 0: <> prima info.
            }
            {    
                - LIST_COUNT(yellowGreenWords ^ usedEmotionaWords) > 1: <> seconda info.
            }
            {    
                - LIST_COUNT(yellowGreenWords ^ usedEmotionaWords) > 2: <> terza info.
            }
            
            {
                - yellowGreenWords ^ discoveredEmotionalWords has GialloVerde: <> caratteristiche variante uno.
                - yellowGreenWords ^ discoveredEmotionalWords hasnt GialloVerde: <> variante non scoperta.
            }
            {    
                - yellowGreenWords ^ discoveredEmotionalWords has GialloGialloVerde:<> caratteristiche variante due.
                - yellowGreenWords ^ discoveredEmotionalWords hasnt GialloGialloVerde:<> variante non scoperta.
            }
            {    
                - yellowGreenWords ^ discoveredEmotionalWords has GialloVerdeVerde:<> caratteristiche variante tre.
                - yellowGreenWords ^ discoveredEmotionalWords hasnt GialloVerdeVerde:<> variante non scoperta.
            }
            {    
                - yellowGreenWords ^ discoveredEmotionalWords has GialloVerdeViola: <> caratteristiche variante quattro.
                - yellowGreenWords ^ discoveredEmotionalWords hasnt GialloVerdeViola: <> variante non scoperta.
            }
            {    
                - yellowGreenWords ^ discoveredEmotionalWords has GialloVerdeBlu:<> caratteristiche variante cinque.
                - yellowGreenWords ^ discoveredEmotionalWords hasnt GialloVerdeBlu:<> variante non scoperta.
            }
            {    
                - yellowGreenWords ^ discoveredEmotionalWords has GialloVerdeGiallo:<> caratteristiche variante sei.
                - yellowGreenWords ^ discoveredEmotionalWords hasnt GialloVerdeGiallo:<> variante non scoperta.
            }
            {     
                - yellowGreenWords ^ discoveredEmotionalWords has GialloVerdeRosso:<> caratteristiche variante sette.
                - yellowGreenWords ^ discoveredEmotionalWords hasnt GialloVerdeRosso:<> variante non scoperta.
            
            }
    
    
    } 
    
    {
        - yellowPurpleWords ^ discoveredEmotionalWords == ():
            <i>La tredicesima parola non è stata ancora scoperta.
            
        - else:
            <b>Parola GialloViola.</b>
            <> Caratteristiche generali.
            {
                - LIST_COUNT(yellowPurpleWords ^ usedEmotionaWords) > 0: <> prima info.
            }
            {    
                - LIST_COUNT(yellowPurpleWords ^ usedEmotionaWords) > 1: <> seconda info.
            }
            {    
                - LIST_COUNT(yellowPurpleWords ^ usedEmotionaWords) > 2: <> terza info.
            }
            
            {
                - yellowPurpleWords ^ discoveredEmotionalWords has GialloViola: <> caratteristiche variante uno.
                - yellowPurpleWords ^ discoveredEmotionalWords hasnt GialloViola: <> variante non scoperta.
            }
            {    
                - yellowPurpleWords ^ discoveredEmotionalWords has GialloGialloViola:<> caratteristiche variante due.
                - yellowPurpleWords ^ discoveredEmotionalWords hasnt GialloGialloViola:<> variante non scoperta.
            }
            {    
                - yellowPurpleWords ^ discoveredEmotionalWords has GialloViolaVerde:<> caratteristiche variante tre.
                - yellowPurpleWords ^ discoveredEmotionalWords hasnt GialloViolaVerde:<> variante non scoperta.
            }
            {    
                - yellowPurpleWords ^ discoveredEmotionalWords has GialloViolaViola: <> caratteristiche variante quattro.
                - yellowPurpleWords ^ discoveredEmotionalWords hasnt GialloViolaViola: <> variante non scoperta.
            }
            {    
                - yellowPurpleWords ^ discoveredEmotionalWords has GialloViolaBlu:<> caratteristiche variante cinque.
                - yellowPurpleWords ^ discoveredEmotionalWords hasnt GialloViolaBlu:<> variante non scoperta.
            }
            {    
                - yellowPurpleWords ^ discoveredEmotionalWords has GialloViolaGiallo:<> caratteristiche variante sei.
                - yellowPurpleWords ^ discoveredEmotionalWords hasnt GialloViolaGiallo:<> variante non scoperta.
            }
            {     
                - yellowPurpleWords ^ discoveredEmotionalWords has GialloViolaRosso:<> caratteristiche variante sette.
                - yellowPurpleWords ^ discoveredEmotionalWords hasnt GialloViolaRosso:<> variante non scoperta.
            
            }
    
    
    } 


//Varianti a dominante Blu
    {
        - blueRedWords ^ discoveredEmotionalWords == ():
            <i>La quattordicesima parola non è stata ancora scoperta.
            
        - else:
            <b>Parola BluRossa.</b>
            <> Caratteristiche generali.
            {
                - LIST_COUNT(blueRedWords ^ usedEmotionaWords) > 0: <> prima info.
            }
            {    
                - LIST_COUNT(blueRedWords ^ usedEmotionaWords) > 1: <> seconda info.
            }
            {    
                - LIST_COUNT(blueRedWords ^ usedEmotionaWords) > 2: <> terza info.
            }
            
            {
                - blueRedWords ^ discoveredEmotionalWords has BluRosso: <> caratteristiche variante uno.
                - blueRedWords ^ discoveredEmotionalWords hasnt BluRosso: <> variante non scoperta.
            }
            {    
                - blueRedWords ^ discoveredEmotionalWords has BluBluRosso:<> caratteristiche variante due.
                - blueRedWords ^ discoveredEmotionalWords hasnt BluBluRosso:<> variante non scoperta.
            }
            {    
                - blueRedWords ^ discoveredEmotionalWords has BluRossoVerde:<> caratteristiche variante tre.
                - blueRedWords ^ discoveredEmotionalWords hasnt BluRossoVerde:<> variante non scoperta.
            }
            {    
                - blueRedWords ^ discoveredEmotionalWords has BluRossoViola: <> caratteristiche variante quattro.
                - blueRedWords ^ discoveredEmotionalWords hasnt BluRossoViola: <> variante non scoperta.
            }
            {    
                - blueRedWords ^ discoveredEmotionalWords has BluRossoBlu:<> caratteristiche variante cinque.
                - blueRedWords ^ discoveredEmotionalWords hasnt BluRossoBlu:<> variante non scoperta.
            }
            {    
                - blueRedWords ^ discoveredEmotionalWords has BluRossoGiallo:<> caratteristiche variante sei.
                - blueRedWords ^ discoveredEmotionalWords hasnt BluRossoGiallo:<> variante non scoperta.
            }
            {     
                - blueRedWords ^ discoveredEmotionalWords has BluRossoRosso:<> caratteristiche variante sette.
                - blueRedWords ^ discoveredEmotionalWords hasnt BluRossoRosso:<> variante non scoperta.
            
            }
    
    
    } 
    
    {
        - blueYellowWords ^ discoveredEmotionalWords == ():
            <i>La quindicesima parola non è stata ancora scoperta.
            
        - else:
            <b>Parola BluGialla.</b>
            <> Caratteristiche generali.
            {
                - LIST_COUNT(blueYellowWords ^ usedEmotionaWords) > 0: <> prima info.
            }
            {    
                - LIST_COUNT(blueYellowWords ^ usedEmotionaWords) > 1: <> seconda info.
            }
            {    
                - LIST_COUNT(blueYellowWords ^ usedEmotionaWords) > 2: <> terza info.
            }
            
            {
                - blueYellowWords ^ discoveredEmotionalWords has BluGiallo: <> caratteristiche variante uno.
                - blueYellowWords ^ discoveredEmotionalWords hasnt BluGiallo: <> variante non scoperta.
            }
            {    
                - blueYellowWords ^ discoveredEmotionalWords has BluBluGiallo:<> caratteristiche variante due.
                - blueYellowWords ^ discoveredEmotionalWords hasnt BluBluGiallo:<> variante non scoperta.
            }
            {    
                - blueYellowWords ^ discoveredEmotionalWords has BluGialloVerde:<> caratteristiche variante tre.
                - blueYellowWords ^ discoveredEmotionalWords hasnt BluGialloVerde:<> variante non scoperta.
            }
            {    
                - blueYellowWords ^ discoveredEmotionalWords has BluGialloViola: <> caratteristiche variante quattro.
                - blueYellowWords ^ discoveredEmotionalWords hasnt BluGialloViola: <> variante non scoperta.
            }
            {    
                - blueYellowWords ^ discoveredEmotionalWords has BluGialloBlu:<> caratteristiche variante cinque.
                - blueYellowWords ^ discoveredEmotionalWords hasnt BluGialloBlu:<> variante non scoperta.
            }
            {    
                - blueYellowWords ^ discoveredEmotionalWords has BluGialloGiallo:<> caratteristiche variante sei.
                - blueYellowWords ^ discoveredEmotionalWords hasnt BluGialloGiallo:<> variante non scoperta.
            }
            {     
                - blueYellowWords ^ discoveredEmotionalWords has BluGialloRosso:<> caratteristiche variante sette.
                - blueYellowWords ^ discoveredEmotionalWords hasnt BluGialloRosso:<> variante non scoperta.
            
            }
    
    
    } 
    {
        - blueGreenWords ^ discoveredEmotionalWords == ():
            <i>La sedicesima parola non è stata ancora scoperta.
            
        - else:
            <b>Parola BluVerde.</b>
            <> Caratteristiche generali.
            {
                - LIST_COUNT(blueGreenWords ^ usedEmotionaWords) > 0: <> prima info.
            }
            {    
                - LIST_COUNT(blueGreenWords ^ usedEmotionaWords) > 1: <> seconda info.
            }
            {    
                - LIST_COUNT(blueGreenWords ^ usedEmotionaWords) > 2: <> terza info.
            }
            
            {
                - blueGreenWords ^ discoveredEmotionalWords has BluVerde: <> caratteristiche variante uno.
                - blueGreenWords ^ discoveredEmotionalWords hasnt BluVerde: <> variante non scoperta.
            }
            {    
                - blueGreenWords ^ discoveredEmotionalWords has BluBluVerde:<> caratteristiche variante due.
                - blueGreenWords ^ discoveredEmotionalWords hasnt BluBluVerde:<> variante non scoperta.
            }
            {    
                - blueGreenWords ^ discoveredEmotionalWords has BluVerdeVerde:<> caratteristiche variante tre.
                - blueGreenWords ^ discoveredEmotionalWords hasnt BluVerdeVerde:<> variante non scoperta.
            }
            {    
                - blueGreenWords ^ discoveredEmotionalWords has BluVerdeViola: <> caratteristiche variante quattro.
                - blueGreenWords ^ discoveredEmotionalWords hasnt BluVerdeViola: <> variante non scoperta.
            }
            {    
                - blueGreenWords ^ discoveredEmotionalWords has BluVerdeBlu:<> caratteristiche variante cinque.
                - blueGreenWords ^ discoveredEmotionalWords hasnt BluVerdeBlu:<> variante non scoperta.
            }
            {    
                - blueGreenWords ^ discoveredEmotionalWords has BluVerdeGiallo:<> caratteristiche variante sei.
                - blueGreenWords ^ discoveredEmotionalWords hasnt BluVerdeGiallo:<> variante non scoperta.
            }
            {     
                - blueGreenWords ^ discoveredEmotionalWords has BluVerdeRosso:<> caratteristiche variante sette.
                - blueGreenWords ^ discoveredEmotionalWords hasnt BluVerdeRosso:<> variante non scoperta.
            
            }
    
    
    } 
    
    {
        - bluePurpleWords ^ discoveredEmotionalWords == ():
            <i>La diciassettesima parola non è stata ancora scoperta.
            
        - else:
            <b>Parola BluViola.</b>
            <> Caratteristiche generali.
            {
                - LIST_COUNT(bluePurpleWords ^ usedEmotionaWords) > 0: <> prima info.
            }
            {    
                - LIST_COUNT(bluePurpleWords ^ usedEmotionaWords) > 1: <> seconda info.
            }
            {    
                - LIST_COUNT(bluePurpleWords ^ usedEmotionaWords) > 2: <> terza info.
            }
            
            {
                - bluePurpleWords ^ discoveredEmotionalWords has BluViola: <> caratteristiche variante uno.
                - bluePurpleWords ^ discoveredEmotionalWords hasnt BluViola: <> variante non scoperta.
            }
            {    
                - bluePurpleWords ^ discoveredEmotionalWords has BluBluViola:<> caratteristiche variante due.
                - bluePurpleWords ^ discoveredEmotionalWords hasnt BluBluViola:<> variante non scoperta.
            }
            {    
                - bluePurpleWords ^ discoveredEmotionalWords has BluViolaVerde:<> caratteristiche variante tre.
                - bluePurpleWords ^ discoveredEmotionalWords hasnt BluViolaVerde:<> variante non scoperta.
            }
            {    
                - bluePurpleWords ^ discoveredEmotionalWords has BluViolaViola: <> caratteristiche variante quattro.
                - bluePurpleWords ^ discoveredEmotionalWords hasnt BluViolaViola: <> variante non scoperta.
            }
            {    
                - bluePurpleWords ^ discoveredEmotionalWords has BluViolaBlu:<> caratteristiche variante cinque.
                - bluePurpleWords ^ discoveredEmotionalWords hasnt BluViolaBlu:<> variante non scoperta.
            }
            {    
                - bluePurpleWords ^ discoveredEmotionalWords has BluViolaGiallo:<> caratteristiche variante sei.
                - bluePurpleWords ^ discoveredEmotionalWords hasnt BluViolaGiallo:<> variante non scoperta.
            }
            {     
                - bluePurpleWords ^ discoveredEmotionalWords has BluViolaRosso:<> caratteristiche variante sette.
                - bluePurpleWords ^ discoveredEmotionalWords hasnt BluViolaRosso:<> variante non scoperta.
            
            }
    
    
    } 




//Varianti a dominante Verde
    {
        - greenRedWords ^ discoveredEmotionalWords == ():
            <i>La diciottesima parola non è stata ancora scoperta.
            
        - else:
            <b>Parola VerdeRossa.</b>
            <> Caratteristiche generali.
            {
                - LIST_COUNT(greenRedWords ^ usedEmotionaWords) > 0: <> prima info.
            }
            {    
                - LIST_COUNT(greenRedWords ^ usedEmotionaWords) > 1: <> seconda info.
            }
            {    
                - LIST_COUNT(greenRedWords ^ usedEmotionaWords) > 2: <> terza info.
            }
            
            {
                - greenRedWords ^ discoveredEmotionalWords has VerdeRosso: <> caratteristiche variante uno.
                - greenRedWords ^ discoveredEmotionalWords hasnt VerdeRosso: <> variante non scoperta.
            }
            {    
                - greenRedWords ^ discoveredEmotionalWords has VerdeVerdeRosso:<> caratteristiche variante due.
                - greenRedWords ^ discoveredEmotionalWords hasnt VerdeVerdeRosso:<> variante non scoperta.
            }
            {    
                - greenRedWords ^ discoveredEmotionalWords has VerdeRossoVerde:<> caratteristiche variante tre.
                - greenRedWords ^ discoveredEmotionalWords hasnt VerdeRossoVerde:<> variante non scoperta.
            }
            {    
                - greenRedWords ^ discoveredEmotionalWords has VerdeRossoViola: <> caratteristiche variante quattro.
                - greenRedWords ^ discoveredEmotionalWords hasnt VerdeRossoViola: <> variante non scoperta.
            }
            {    
                - greenRedWords ^ discoveredEmotionalWords has VerdeRossoBlu:<> caratteristiche variante cinque.
                - greenRedWords ^ discoveredEmotionalWords hasnt VerdeRossoBlu:<> variante non scoperta.
            }
            {    
                - greenRedWords ^ discoveredEmotionalWords has VerdeRossoGiallo:<> caratteristiche variante sei.
                - greenRedWords ^ discoveredEmotionalWords hasnt VerdeRossoGiallo:<> variante non scoperta.
            }
            {     
                - greenRedWords ^ discoveredEmotionalWords has VerdeRossoRosso:<> caratteristiche variante sette.
                - greenRedWords ^ discoveredEmotionalWords hasnt VerdeRossoRosso:<> variante non scoperta.
            
            }
    
    
    } 
    
    {
        - greenYellowWords ^ discoveredEmotionalWords == ():
            <i>La diciannovesima parola non è stata ancora scoperta.
            
        - else:
            <b>Parola VerdeGialla.</b>
            <> Caratteristiche generali.
            {
                - LIST_COUNT(greenYellowWords ^ usedEmotionaWords) > 0: <> prima info.
            }
            {    
                - LIST_COUNT(greenYellowWords ^ usedEmotionaWords) > 1: <> seconda info.
            }
            {    
                - LIST_COUNT(greenYellowWords ^ usedEmotionaWords) > 2: <> terza info.
            }
            
            {
                - greenYellowWords ^ discoveredEmotionalWords has VerdeGiallo: <> caratteristiche variante uno.
                - greenYellowWords ^ discoveredEmotionalWords hasnt VerdeGiallo: <> variante non scoperta.
            }
            {    
                - greenYellowWords ^ discoveredEmotionalWords has VerdeVerdeGiallo:<> caratteristiche variante due.
                - greenYellowWords ^ discoveredEmotionalWords hasnt VerdeVerdeGiallo:<> variante non scoperta.
            }
            {    
                - greenYellowWords ^ discoveredEmotionalWords has VerdeGialloVerde:<> caratteristiche variante tre.
                - greenYellowWords ^ discoveredEmotionalWords hasnt VerdeGialloVerde:<> variante non scoperta.
            }
            {    
                - greenYellowWords ^ discoveredEmotionalWords has VerdeGialloViola: <> caratteristiche variante quattro.
                - greenYellowWords ^ discoveredEmotionalWords hasnt VerdeGialloViola: <> variante non scoperta.
            }
            {    
                - greenYellowWords ^ discoveredEmotionalWords has VerdeGialloBlu:<> caratteristiche variante cinque.
                - greenYellowWords ^ discoveredEmotionalWords hasnt VerdeGialloBlu:<> variante non scoperta.
            }
            {    
                - greenYellowWords ^ discoveredEmotionalWords has VerdeGialloGiallo:<> caratteristiche variante sei.
                - greenYellowWords ^ discoveredEmotionalWords hasnt VerdeGialloGiallo:<> variante non scoperta.
            }
            {     
                - greenYellowWords ^ discoveredEmotionalWords has VerdeGialloRosso:<> caratteristiche variante sette.
                - greenYellowWords ^ discoveredEmotionalWords hasnt VerdeGialloRosso:<> variante non scoperta.
            
            }
    
    
    } 
    {
        - greenBlueWords ^ discoveredEmotionalWords == ():
            <i>La ventesima parola non è stata ancora scoperta.
            
        - else:
            <b>Parola VerdeBlu.</b>
            <> Caratteristiche generali.
            {
                - LIST_COUNT(greenBlueWords ^ usedEmotionaWords) > 0: <> prima info.
            }
            {    
                - LIST_COUNT(greenBlueWords ^ usedEmotionaWords) > 1: <> seconda info.
            }
            {    
                - LIST_COUNT(greenBlueWords ^ usedEmotionaWords) > 2: <> terza info.
            }
            
            {
                - greenBlueWords ^ discoveredEmotionalWords has VerdeBlu: <> caratteristiche variante uno.
                - greenBlueWords ^ discoveredEmotionalWords hasnt VerdeBlu: <> variante non scoperta.
            }
            {    
                - greenBlueWords ^ discoveredEmotionalWords has VerdeVerdeBlu:<> caratteristiche variante due.
                - greenBlueWords ^ discoveredEmotionalWords hasnt VerdeVerdeBlu:<> variante non scoperta.
            }
            {    
                - greenBlueWords ^ discoveredEmotionalWords has VerdeBluVerde:<> caratteristiche variante tre.
                - greenBlueWords ^ discoveredEmotionalWords hasnt VerdeBluVerde:<> variante non scoperta.
            }
            {    
                - greenBlueWords ^ discoveredEmotionalWords has VerdeBluViola: <> caratteristiche variante quattro.
                - greenBlueWords ^ discoveredEmotionalWords hasnt VerdeBluViola: <> variante non scoperta.
            }
            {    
                - greenBlueWords ^ discoveredEmotionalWords has VerdeBluBlu:<> caratteristiche variante cinque.
                - greenBlueWords ^ discoveredEmotionalWords hasnt VerdeBluBlu:<> variante non scoperta.
            }
            {    
                - greenBlueWords ^ discoveredEmotionalWords has VerdeBluGiallo:<> caratteristiche variante sei.
                - greenBlueWords ^ discoveredEmotionalWords hasnt VerdeBluGiallo:<> variante non scoperta.
            }
            {     
                - greenBlueWords ^ discoveredEmotionalWords has VerdeBluRosso:<> caratteristiche variante sette.
                - greenBlueWords ^ discoveredEmotionalWords hasnt VerdeBluRosso:<> variante non scoperta.
            
            }
    
    
    } 
    
    {
        - greenPurpleWords ^ discoveredEmotionalWords == ():
            <i>La ventunesima parola non è stata ancora scoperta.
            
        - else:
            <b>Parola VerdeViola.</b>
            <> Caratteristiche generali.
            {
                - LIST_COUNT(greenPurpleWords ^ usedEmotionaWords) > 0: <> prima info.
            }
            {    
                - LIST_COUNT(greenPurpleWords ^ usedEmotionaWords) > 1: <> seconda info.
            }
            {    
                - LIST_COUNT(greenPurpleWords ^ usedEmotionaWords) > 2: <> terza info.
            }
            
            {
                - greenPurpleWords ^ discoveredEmotionalWords has VerdeViola: <> caratteristiche variante uno.
                - greenPurpleWords ^ discoveredEmotionalWords hasnt VerdeViola: <> variante non scoperta.
            }
            {    
                - greenPurpleWords ^ discoveredEmotionalWords has VerdeVerdeViola:<> caratteristiche variante due.
                - greenPurpleWords ^ discoveredEmotionalWords hasnt VerdeVerdeViola:<> variante non scoperta.
            }
            {    
                - greenPurpleWords ^ discoveredEmotionalWords has VerdeViolaVerde:<> caratteristiche variante tre.
                - greenPurpleWords ^ discoveredEmotionalWords hasnt VerdeViolaVerde:<> variante non scoperta.
            }
            {    
                - greenPurpleWords ^ discoveredEmotionalWords has VerdeViolaViola: <> caratteristiche variante quattro.
                - greenPurpleWords ^ discoveredEmotionalWords hasnt VerdeViolaViola: <> variante non scoperta.
            }
            {    
                - greenPurpleWords ^ discoveredEmotionalWords has VerdeViolaBlu:<> caratteristiche variante cinque.
                - greenPurpleWords ^ discoveredEmotionalWords hasnt VerdeViolaBlu:<> variante non scoperta.
            }
            {    
                - greenPurpleWords ^ discoveredEmotionalWords has VerdeViolaGiallo:<> caratteristiche variante sei.
                - greenPurpleWords ^ discoveredEmotionalWords hasnt VerdeViolaGiallo:<> variante non scoperta.
            }
            {     
                - greenPurpleWords ^ discoveredEmotionalWords has VerdeViolaRosso:<> caratteristiche variante sette.
                - greenPurpleWords ^ discoveredEmotionalWords hasnt VerdeViolaRosso:<> variante non scoperta.
            
            }
    
    
    } 



//Varianti a dominante Viola
    {
        - purpleRedWords ^ discoveredEmotionalWords == ():
            <i>La ventiduesima parola non è stata ancora scoperta.
            
        - else:
            <b>Parola ViolaRossa.</b>
            <> Caratteristiche generali.
            {
                - LIST_COUNT(purpleRedWords ^ usedEmotionaWords) > 0: <> prima info.
            }
            {    
                - LIST_COUNT(purpleRedWords ^ usedEmotionaWords) > 1: <> seconda info.
            }
            {    
                - LIST_COUNT(purpleRedWords ^ usedEmotionaWords) > 2: <> terza info.
            }
            
            {
                - purpleRedWords ^ discoveredEmotionalWords has ViolaRosso: <> caratteristiche variante uno.
                - purpleRedWords ^ discoveredEmotionalWords hasnt ViolaRosso: <> variante non scoperta.
            }
            {    
                - purpleRedWords ^ discoveredEmotionalWords has ViolaViolaRosso:<> caratteristiche variante due.
                - purpleRedWords ^ discoveredEmotionalWords hasnt ViolaViolaRosso:<> variante non scoperta.
            }
            {    
                - purpleRedWords ^ discoveredEmotionalWords has ViolaRossoVerde:<> caratteristiche variante tre.
                - purpleRedWords ^ discoveredEmotionalWords hasnt ViolaRossoVerde:<> variante non scoperta.
            }
            {    
                - purpleRedWords ^ discoveredEmotionalWords has ViolaRossoViola: <> caratteristiche variante quattro.
                - purpleRedWords ^ discoveredEmotionalWords hasnt ViolaRossoViola: <> variante non scoperta.
            }
            {    
                - purpleRedWords ^ discoveredEmotionalWords has ViolaRossoBlu:<> caratteristiche variante cinque.
                - purpleRedWords ^ discoveredEmotionalWords hasnt ViolaRossoBlu:<> variante non scoperta.
            }
            {    
                - purpleRedWords ^ discoveredEmotionalWords has ViolaRossoGiallo:<> caratteristiche variante sei.
                - purpleRedWords ^ discoveredEmotionalWords hasnt ViolaRossoGiallo:<> variante non scoperta.
            }
            {     
                - purpleRedWords ^ discoveredEmotionalWords has ViolaRossoRosso:<> caratteristiche variante sette.
                - purpleRedWords ^ discoveredEmotionalWords hasnt ViolaRossoRosso:<> variante non scoperta.
            
            }
    
    
    } 
    
    {
        - purpleYellowWords ^ discoveredEmotionalWords == ():
            <i>La ventitreesima parola non è stata ancora scoperta.
            
        - else:
            <b>Parola ViolaGiallo.</b>
            <> Caratteristiche generali.
            {
                - LIST_COUNT(purpleYellowWords ^ usedEmotionaWords) > 0: <> prima info.
            }
            {    
                - LIST_COUNT(purpleYellowWords ^ usedEmotionaWords) > 1: <> seconda info.
            }
            {    
                - LIST_COUNT(purpleYellowWords ^ usedEmotionaWords) > 2: <> terza info.
            }
            
            {
                - purpleYellowWords ^ discoveredEmotionalWords has ViolaGiallo: <> caratteristiche variante uno.
                - purpleYellowWords ^ discoveredEmotionalWords hasnt ViolaGiallo: <> variante non scoperta.
            }
            {    
                - purpleYellowWords ^ discoveredEmotionalWords has ViolaViolaGiallo:<> caratteristiche variante due.
                - purpleYellowWords ^ discoveredEmotionalWords hasnt ViolaViolaGiallo:<> variante non scoperta.
            }
            {    
                - purpleYellowWords ^ discoveredEmotionalWords has ViolaGialloVerde:<> caratteristiche variante tre.
                - purpleYellowWords ^ discoveredEmotionalWords hasnt ViolaGialloVerde:<> variante non scoperta.
            }
            {    
                - purpleYellowWords ^ discoveredEmotionalWords has ViolaGialloViola: <> caratteristiche variante quattro.
                - purpleYellowWords ^ discoveredEmotionalWords hasnt ViolaGialloViola: <> variante non scoperta.
            }
            {    
                - purpleYellowWords ^ discoveredEmotionalWords has ViolaGialloBlu:<> caratteristiche variante cinque.
                - purpleYellowWords ^ discoveredEmotionalWords hasnt ViolaGialloBlu:<> variante non scoperta.
            }
            {    
                - purpleYellowWords ^ discoveredEmotionalWords has ViolaGialloGiallo:<> caratteristiche variante sei.
                - purpleYellowWords ^ discoveredEmotionalWords hasnt ViolaGialloGiallo:<> variante non scoperta.
            }
            {     
                - purpleYellowWords ^ discoveredEmotionalWords has ViolaGialloRosso:<> caratteristiche variante sette.
                - purpleYellowWords ^ discoveredEmotionalWords hasnt ViolaGialloRosso:<> variante non scoperta.
            
            }
    
    
    } 
    {
        - purpleBlueWords ^ discoveredEmotionalWords == ():
            <i>La ventiquattresima parola non è stata ancora scoperta.
            
        - else:
            <b>Parola ViolaBlu.</b>
            <> Caratteristiche generali.
            {
                - LIST_COUNT(purpleBlueWords ^ usedEmotionaWords) > 0: <> prima info.
            }
            {    
                - LIST_COUNT(purpleBlueWords ^ usedEmotionaWords) > 1: <> seconda info.
            }
            {    
                - LIST_COUNT(purpleBlueWords ^ usedEmotionaWords) > 2: <> terza info.
            }
            
            {
                - purpleBlueWords ^ discoveredEmotionalWords has ViolaBlu: <> caratteristiche variante uno.
                - purpleBlueWords ^ discoveredEmotionalWords hasnt ViolaBlu: <> variante non scoperta.
            }
            {    
                - purpleBlueWords ^ discoveredEmotionalWords has ViolaViolaBlu:<> caratteristiche variante due.
                - purpleBlueWords ^ discoveredEmotionalWords hasnt ViolaViolaBlu:<> variante non scoperta.
            }
            {    
                - purpleBlueWords ^ discoveredEmotionalWords has ViolaBluVerde:<> caratteristiche variante tre.
                - purpleBlueWords ^ discoveredEmotionalWords hasnt ViolaBluVerde:<> variante non scoperta.
            }
            {    
                - purpleBlueWords ^ discoveredEmotionalWords has ViolaBluViola: <> caratteristiche variante quattro.
                - purpleBlueWords ^ discoveredEmotionalWords hasnt ViolaBluViola: <> variante non scoperta.
            }
            {    
                - purpleBlueWords ^ discoveredEmotionalWords has ViolaBluBlu:<> caratteristiche variante cinque.
                - purpleBlueWords ^ discoveredEmotionalWords hasnt ViolaBluBlu:<> variante non scoperta.
            }
            {    
                - purpleBlueWords ^ discoveredEmotionalWords has ViolaBluGiallo:<> caratteristiche variante sei.
                - purpleBlueWords ^ discoveredEmotionalWords hasnt ViolaBluGiallo:<> variante non scoperta.
            }
            {     
                - purpleBlueWords ^ discoveredEmotionalWords has ViolaBluRosso:<> caratteristiche variante sette.
                - purpleBlueWords ^ discoveredEmotionalWords hasnt ViolaBluRosso:<> variante non scoperta.
            
            }
    
    
    } 
    
    {
        - purpleGreenWords ^ discoveredEmotionalWords == ():
            <i>La venticinquesima parola non è stata ancora scoperta.
            
        - else:
            <b>Parola ViolaVerde.</b>
            <> Caratteristiche generali.
            {
                - LIST_COUNT(purpleGreenWords ^ usedEmotionaWords) > 0: <> prima info.
            }
            {    
                - LIST_COUNT(purpleGreenWords ^ usedEmotionaWords) > 1: <> seconda info.
            }
            {    
                - LIST_COUNT(purpleGreenWords ^ usedEmotionaWords) > 2: <> terza info.
            }
            
            {
                - purpleGreenWords ^ discoveredEmotionalWords has ViolaVerde: <> caratteristiche variante uno.
                - purpleGreenWords ^ discoveredEmotionalWords hasnt ViolaVerde: <> variante non scoperta.
            }
            {    
                - purpleGreenWords ^ discoveredEmotionalWords has ViolaViolaVerde:<> caratteristiche variante due.
                - purpleGreenWords ^ discoveredEmotionalWords hasnt ViolaViolaVerde:<> variante non scoperta.
            }
            {    
                - purpleGreenWords ^ discoveredEmotionalWords has ViolaVerdeVerde:<> caratteristiche variante tre.
                - purpleGreenWords ^ discoveredEmotionalWords hasnt ViolaVerdeVerde:<> variante non scoperta.
            }
            {    
                - purpleGreenWords ^ discoveredEmotionalWords has ViolaVerdeViola: <> caratteristiche variante quattro.
                - purpleGreenWords ^ discoveredEmotionalWords hasnt ViolaVerdeViola: <> variante non scoperta.
            }
            {    
                - purpleGreenWords ^ discoveredEmotionalWords has ViolaVerdeBlu:<> caratteristiche variante cinque.
                - purpleGreenWords ^ discoveredEmotionalWords hasnt ViolaVerdeBlu:<> variante non scoperta.
            }
            {    
                - purpleGreenWords ^ discoveredEmotionalWords has ViolaVerdeGiallo:<> caratteristiche variante sei.
                - purpleGreenWords ^ discoveredEmotionalWords hasnt ViolaVerdeGiallo:<> variante non scoperta.
            }
            {     
                - purpleGreenWords ^ discoveredEmotionalWords has ViolaVerdeRosso:<> caratteristiche variante sette.
                - purpleGreenWords ^ discoveredEmotionalWords hasnt ViolaVerdeRosso:<> variante non scoperta.
            
            }
    
    
    } 
-> rewriter_book_with_flow
