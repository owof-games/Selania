=== nest_recap
TODO: A traduttore settato, invece della parola scritta a mano (es: Parola Gialla) chiamerò direttamente il traduttore (emotional_words_translator(Gialla)).

+ (check){are_two_entities_together(NestRecap, PG)} [NestRecap]
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ enableBigDialogue()

//Varianti monocolore
    {
        - nest_redWords ^ discoveredEmotionalWords == ():
            <i>La prima parola non è stata ancora scoperta.
            
        - else:
            <b>Parola Rossa.</b>
            <> Caratteristiche generali.
            {
                - LIST_COUNT(nest_redWords ^ usedEmotionaWords) > 0: <> prima info.
            }
            {
                - LIST_COUNT(nest_redWords ^ usedEmotionaWords) > 1: <> seconda info.
            }
            {
                - LIST_COUNT(nest_redWords ^ usedEmotionaWords) > 2: <> terza info.
            }
            
            {
                - nest_redWords ^ discoveredEmotionalWords has Rosso: <> caratteristiche variante uno.
                - nest_redWords ^ discoveredEmotionalWords hasnt Rosso: <> variante non scoperta.
            }
            {
                - nest_redWords ^ discoveredEmotionalWords has RossoRosso: <> caratteristiche variante due.
                - nest_redWords ^ discoveredEmotionalWords hasnt RossoRosso: <> variante non scoperta.
            }
            {
                - nest_redWords ^ discoveredEmotionalWords has RossoRossoRosso: <> caratteristiche variante tre.
                - nest_redWords ^ discoveredEmotionalWords hasnt RossoRossoRosso: <> variante non scoperta.
            
            }
    
    
    }
    
    {
        - nest_yellowWords ^ discoveredEmotionalWords == ():
            <i>La seconda parola non è stata ancora scoperta.
            
        - else:
            <b>Parola Gialla.</b>
            <> Caratteristiche generali.
            {
                - LIST_COUNT(nest_yellowWords ^ usedEmotionaWords) > 0: <> prima info.
            }
            {
                - LIST_COUNT(nest_yellowWords ^ usedEmotionaWords) > 1: <> seconda info.
            }
            {
                - LIST_COUNT(nest_yellowWords ^ usedEmotionaWords) > 2: <> terza info.
            }
            
            {
                - nest_yellowWords ^ discoveredEmotionalWords has Giallo: <> caratteristiche variante uno.
                - nest_yellowWords ^ discoveredEmotionalWords hasnt Giallo: <> variante non scoperta.
            }
            {
                - nest_yellowWords ^ discoveredEmotionalWords has GialloGiallo: <> caratteristiche variante due.
                - nest_yellowWords ^ discoveredEmotionalWords hasnt GialloGiallo: <> variante non scoperta.
            }
            {
                - nest_yellowWords ^ discoveredEmotionalWords has GialloGialloGiallo: <> caratteristiche variante tre.
                - nest_yellowWords ^ discoveredEmotionalWords hasnt GialloGialloGiallo: <> variante non scoperta.
            
            }
    
    
    }
    
    {
        - nest_blueWords ^ discoveredEmotionalWords == ():
            <i>La terza parola non è stata ancora scoperta.
            
        - else:
            <b>Parola Blu.</b>
            <> Caratteristiche generali.
            {
                - LIST_COUNT(nest_blueWords ^ usedEmotionaWords) > 0: <> prima info.
            }
            {
                - LIST_COUNT(nest_blueWords ^ usedEmotionaWords) > 1: <> seconda info.
            }
            {
                - LIST_COUNT(nest_blueWords ^ usedEmotionaWords) > 2: <> terza info.
            }
            
            {
                - nest_blueWords ^ discoveredEmotionalWords has Blu: <> caratteristiche variante uno.
                - nest_blueWords ^ discoveredEmotionalWords hasnt Blu: <> variante non scoperta.
            }
            {
                - nest_blueWords ^ discoveredEmotionalWords has BluBlu: <> caratteristiche variante due.
                - nest_blueWords ^ discoveredEmotionalWords hasnt BluBlu: <> variante non scoperta.
            }
            {
                - nest_blueWords ^ discoveredEmotionalWords has BluBluBlu: <> caratteristiche variante tre.
                - nest_blueWords ^ discoveredEmotionalWords hasnt BluBluBlu: <> variante non scoperta.
            
            }
    
    
    }
    
    {
        - nest_greenWords ^ discoveredEmotionalWords == ():
            <i>La quarta parola non è stata ancora scoperta.
            
        - else:
            <b>Parola Verde.</b>
            <> Caratteristiche generali.
            {
                - LIST_COUNT(nest_greenWords ^ usedEmotionaWords) > 0: <> prima info.
            }
            {
                - LIST_COUNT(nest_greenWords ^ usedEmotionaWords) > 1: <> seconda info.
            }
            {
                - LIST_COUNT(nest_greenWords ^ usedEmotionaWords) > 2: <> terza info.
            }
            
            {
                - nest_greenWords ^ discoveredEmotionalWords has Verde: <> caratteristiche variante uno.
                - nest_greenWords ^ discoveredEmotionalWords hasnt Verde: <> variante non scoperta.
            }
            {
                - nest_greenWords ^ discoveredEmotionalWords has VerdeVerde: <> caratteristiche variante due.
                - nest_greenWords ^ discoveredEmotionalWords hasnt VerdeVerde: <> variante non scoperta.
            }
            {
                - nest_greenWords ^ discoveredEmotionalWords has VerdeVerdeVerde: <> caratteristiche variante tre.
                - nest_greenWords ^ discoveredEmotionalWords hasnt VerdeVerdeVerde: <> variante non scoperta.
            
            }
    
    
    }

    {
        - nest_purpleWords ^ discoveredEmotionalWords == ():
            <i>La quinta parola non è stata ancora scoperta.
            
        - else:
            <b>Parola Viola.</b>
            <> Caratteristiche generali.
            {
                - LIST_COUNT(nest_purpleWords ^ usedEmotionaWords) > 0: <> prima info.
            }
            {
                - LIST_COUNT(nest_purpleWords ^ usedEmotionaWords) > 1: <> seconda info.
            }
            {
                - LIST_COUNT(nest_purpleWords ^ usedEmotionaWords) > 2: <> terza info.
            }
            
            {
                - nest_purpleWords ^ discoveredEmotionalWords has Viola: <> caratteristiche variante uno.
                - nest_purpleWords ^ discoveredEmotionalWords hasnt Viola: <> variante non scoperta.
            }
            {
                - nest_purpleWords ^ discoveredEmotionalWords has ViolaViola: <> caratteristiche variante due.
                - nest_purpleWords ^ discoveredEmotionalWords hasnt ViolaViola: <> variante non scoperta.
            }
            {
                - nest_purpleWords ^ discoveredEmotionalWords has ViolaViolaViola: <> caratteristiche variante tre.
                - nest_purpleWords ^ discoveredEmotionalWords hasnt ViolaViolaViola: <> variante non scoperta.
            
            }
    
    
    }       



//Varianti a dominante Rosso
    {
        - nest_redYellowWords ^ discoveredEmotionalWords == ():
            <i>La sesta parola non è stata ancora scoperta.
            
        - else:
            <b>Parola RossoGialla.</b>
            <> Caratteristiche generali.
            {
                - LIST_COUNT(nest_redYellowWords ^ usedEmotionaWords) > 0: <> prima info.
            }
            {    
                - LIST_COUNT(nest_redYellowWords ^ usedEmotionaWords) > 1: <> seconda info.
            }
            {    
                - LIST_COUNT(nest_redYellowWords ^ usedEmotionaWords) > 2: <> terza info.
            }
            
            {
                - nest_redYellowWords ^ discoveredEmotionalWords has RossoGiallo: <> caratteristiche variante uno.
                - nest_redYellowWords ^ discoveredEmotionalWords hasnt RossoGiallo: <> variante non scoperta.
            }
            {    
                - nest_redYellowWords ^ discoveredEmotionalWords has RossoRossoGiallo:<> caratteristiche variante due.
                - nest_redYellowWords ^ discoveredEmotionalWords hasnt RossoRossoGiallo:<> variante non scoperta.
            }
            {    
                - nest_redYellowWords ^ discoveredEmotionalWords has RossoGialloGiallo:<> caratteristiche variante tre.
                - nest_redYellowWords ^ discoveredEmotionalWords hasnt RossoGialloGiallo:<> variante non scoperta.
            }
            {    
                - nest_redYellowWords ^ discoveredEmotionalWords has RossoGialloBlu: <> caratteristiche variante quattro.
                - nest_redYellowWords ^ discoveredEmotionalWords hasnt RossoGialloBlu: <> variante non scoperta.
            }
            {    
                - nest_redYellowWords ^ discoveredEmotionalWords has RossoGialloVerde:<> caratteristiche variante cinque.
                - nest_redYellowWords ^ discoveredEmotionalWords hasnt RossoGialloVerde:<> variante non scoperta.
            }
            {    
                - nest_redYellowWords ^ discoveredEmotionalWords has RossoGialloViola:<> caratteristiche variante sei.
                - nest_redYellowWords ^ discoveredEmotionalWords hasnt RossoGialloViola:<> variante non scoperta.
            }
            {     
                - nest_redYellowWords ^ discoveredEmotionalWords has RossoGialloRosso:<> caratteristiche variante sette.
                - nest_redYellowWords ^ discoveredEmotionalWords hasnt RossoGialloRosso:<> variante non scoperta.
            
            }
    
    
    } 
    
    {
        - nest_redBlueWords ^ discoveredEmotionalWords == ():
            <i>La settima parola non è stata ancora scoperta.
            
        - else:
            <b>Parola RossoBlu.</b>
            <> Caratteristiche generali.
            {
                - LIST_COUNT(nest_redBlueWords ^ usedEmotionaWords) > 0: <> prima info.
            }
            {    
                - LIST_COUNT(nest_redBlueWords ^ usedEmotionaWords) > 1: <> seconda info.
            }
            {    
                - LIST_COUNT(nest_redBlueWords ^ usedEmotionaWords) > 2: <> terza info.
            }
            
            {
                - nest_redBlueWords ^ discoveredEmotionalWords has RossoBlu: <> caratteristiche variante uno.
                - nest_redBlueWords ^ discoveredEmotionalWords hasnt RossoBlu: <> variante non scoperta.
            }
            {    
                - nest_redBlueWords ^ discoveredEmotionalWords has RossoRossoBlu:<> caratteristiche variante due.
                - nest_redBlueWords ^ discoveredEmotionalWords hasnt RossoRossoBlu:<> variante non scoperta.
            }
            {    
                - nest_redBlueWords ^ discoveredEmotionalWords has RossoBluBlu:<> caratteristiche variante tre.
                - nest_redBlueWords ^ discoveredEmotionalWords hasnt RossoBluBlu:<> variante non scoperta.
            }
            {    
                - nest_redBlueWords ^ discoveredEmotionalWords has RossoBluVerde: <> caratteristiche variante quattro.
                - nest_redBlueWords ^ discoveredEmotionalWords hasnt RossoBluVerde: <> variante non scoperta.
            }
            {    
                - nest_redBlueWords ^ discoveredEmotionalWords has RossoBluViola:<> caratteristiche variante cinque.
                - nest_redBlueWords ^ discoveredEmotionalWords hasnt RossoBluViola:<> variante non scoperta.
            }
            {    
                - nest_redBlueWords ^ discoveredEmotionalWords has RossoBluRosso:<> caratteristiche variante sei.
                - nest_redBlueWords ^ discoveredEmotionalWords hasnt RossoBluRosso:<> variante non scoperta.
            }
            {     
                - nest_redBlueWords ^ discoveredEmotionalWords has RossoBluGiallo:<> caratteristiche variante sette.
                - nest_redBlueWords ^ discoveredEmotionalWords hasnt RossoBluGiallo:<> variante non scoperta.
            
            }
    
    
    } 
    {
        - nest_redGreenWords ^ discoveredEmotionalWords == ():
            <i>L'ottava parola non è stata ancora scoperta.
            
        - else:
            <b>Parola RossoVerde.</b>
            <> Caratteristiche generali.
            {
                - LIST_COUNT(nest_redGreenWords ^ usedEmotionaWords) > 0: <> prima info.
            }
            {    
                - LIST_COUNT(nest_redGreenWords ^ usedEmotionaWords) > 1: <> seconda info.
            }
            {    
                - LIST_COUNT(nest_redGreenWords ^ usedEmotionaWords) > 2: <> terza info.
            }
            
            {
                - nest_redGreenWords ^ discoveredEmotionalWords has RossoVerde: <> caratteristiche variante uno.
                - nest_redGreenWords ^ discoveredEmotionalWords hasnt RossoVerde: <> variante non scoperta.
            }
            {    
                - nest_redGreenWords ^ discoveredEmotionalWords has RossoRossoVerde:<> caratteristiche variante due.
                - nest_redGreenWords ^ discoveredEmotionalWords hasnt RossoRossoVerde:<> variante non scoperta.
            }
            {    
                - nest_redGreenWords ^ discoveredEmotionalWords has RossoVerdeBlu:<> caratteristiche variante tre.
                - nest_redGreenWords ^ discoveredEmotionalWords hasnt RossoVerdeBlu:<> variante non scoperta.
            }
            {    
                - nest_redGreenWords ^ discoveredEmotionalWords has RossoVerdeVerde: <> caratteristiche variante quattro.
                - nest_redGreenWords ^ discoveredEmotionalWords hasnt RossoVerdeVerde: <> variante non scoperta.
            }
            {    
                - nest_redGreenWords ^ discoveredEmotionalWords has RossoVerdeViola:<> caratteristiche variante cinque.
                - nest_redGreenWords ^ discoveredEmotionalWords hasnt RossoVerdeViola:<> variante non scoperta.
            }
            {    
                - nest_redGreenWords ^ discoveredEmotionalWords has RossoVerdeRosso:<> caratteristiche variante sei.
                - nest_redGreenWords ^ discoveredEmotionalWords hasnt RossoVerdeRosso:<> variante non scoperta.
            }
            {     
                - nest_redGreenWords ^ discoveredEmotionalWords has RossoVerdeGiallo:<> caratteristiche variante sette.
                - nest_redGreenWords ^ discoveredEmotionalWords hasnt RossoVerdeGiallo:<> variante non scoperta.
            
            }
    
    
    } 
    
    {
        - nest_redPurpleWords ^ discoveredEmotionalWords == ():
            <i>La nona parola non è stata ancora scoperta.
            
        - else:
            <b>Parola RossoViola.</b>
            <> Caratteristiche generali.
            {
                - LIST_COUNT(nest_redPurpleWords ^ usedEmotionaWords) > 0: <> prima info.
            }
            {    
                - LIST_COUNT(nest_redPurpleWords ^ usedEmotionaWords) > 1: <> seconda info.
            }
            {    
                - LIST_COUNT(nest_redPurpleWords ^ usedEmotionaWords) > 2: <> terza info.
            }
            
            {
                - nest_redPurpleWords ^ discoveredEmotionalWords has RossoViola: <> caratteristiche variante uno.
                - nest_redPurpleWords ^ discoveredEmotionalWords hasnt RossoViola: <> variante non scoperta.
            }
            {    
                - nest_redPurpleWords ^ discoveredEmotionalWords has RossoRossoViola:<> caratteristiche variante due.
                - nest_redPurpleWords ^ discoveredEmotionalWords hasnt RossoRossoViola:<> variante non scoperta.
            }
            {    
                - nest_redPurpleWords ^ discoveredEmotionalWords has RossoViolaBlu:<> caratteristiche variante tre.
                - nest_redPurpleWords ^ discoveredEmotionalWords hasnt RossoViolaBlu:<> variante non scoperta.
            }
            {    
                - nest_redPurpleWords ^ discoveredEmotionalWords has RossoViolaVerde: <> caratteristiche variante quattro.
                - nest_redPurpleWords ^ discoveredEmotionalWords hasnt RossoViolaVerde: <> variante non scoperta.
            }
            {    
                - nest_redPurpleWords ^ discoveredEmotionalWords has RossoViolaViola:<> caratteristiche variante cinque.
                - nest_redPurpleWords ^ discoveredEmotionalWords hasnt RossoViolaViola:<> variante non scoperta.
            }
            {    
                - nest_redPurpleWords ^ discoveredEmotionalWords has RossoViolaRosso:<> caratteristiche variante sei.
                - nest_redPurpleWords ^ discoveredEmotionalWords hasnt RossoViolaRosso:<> variante non scoperta.
            }
            {     
                - nest_redPurpleWords ^ discoveredEmotionalWords has RossoViolaGiallo:<> caratteristiche variante sette.
                - nest_redPurpleWords ^ discoveredEmotionalWords hasnt RossoViolaGiallo:<> variante non scoperta.
            
            }
    
    
    } 





//Varianti a dominante Giallo
    {
        - nest_yellowRedWords ^ discoveredEmotionalWords == ():
            <i>La decima parola non è stata ancora scoperta.
            
        - else:
            <b>Parola GialloRossa.</b>
            <> Caratteristiche generali.
            {
                - LIST_COUNT(nest_yellowRedWords ^ usedEmotionaWords) > 0: <> prima info.
            }
            {    
                - LIST_COUNT(nest_yellowRedWords ^ usedEmotionaWords) > 1: <> seconda info.
            }
            {    
                - LIST_COUNT(nest_yellowRedWords ^ usedEmotionaWords) > 2: <> terza info.
            }
            
            {
                - nest_yellowRedWords ^ discoveredEmotionalWords has GialloRosso: <> caratteristiche variante uno.
                - nest_yellowRedWords ^ discoveredEmotionalWords hasnt GialloRosso: <> variante non scoperta.
            }
            {    
                - nest_yellowRedWords ^ discoveredEmotionalWords has GialloGialloRosso:<> caratteristiche variante due.
                - nest_yellowRedWords ^ discoveredEmotionalWords hasnt GialloGialloRosso:<> variante non scoperta.
            }
            {    
                - nest_yellowRedWords ^ discoveredEmotionalWords has GialloRossoRosso:<> caratteristiche variante tre.
                - nest_yellowRedWords ^ discoveredEmotionalWords hasnt GialloRossoRosso:<> variante non scoperta.
            }
            {    
                - nest_yellowRedWords ^ discoveredEmotionalWords has GialloRossoVerde: <> caratteristiche variante quattro.
                - nest_yellowRedWords ^ discoveredEmotionalWords hasnt GialloRossoVerde: <> variante non scoperta.
            }
            {    
                - nest_yellowRedWords ^ discoveredEmotionalWords has GialloRossoViola:<> caratteristiche variante cinque.
                - nest_yellowRedWords ^ discoveredEmotionalWords hasnt GialloRossoViola:<> variante non scoperta.
            }
            {    
                - nest_yellowRedWords ^ discoveredEmotionalWords has GialloRossoBlu:<> caratteristiche variante sei.
                - nest_yellowRedWords ^ discoveredEmotionalWords hasnt GialloRossoBlu:<> variante non scoperta.
            }
            {     
                - nest_yellowRedWords ^ discoveredEmotionalWords has GialloRossoGiallo:<> caratteristiche variante sette.
                - nest_yellowRedWords ^ discoveredEmotionalWords hasnt GialloRossoGiallo:<> variante non scoperta.
            
            }
    
    
    } 
    
    {
        - nest_yellowBlueWords ^ discoveredEmotionalWords == ():
            <i>L'undicesima parola non è stata ancora scoperta.
            
        - else:
            <b>Parola GialloBlu.</b>
            <> Caratteristiche generali.
            {
                - LIST_COUNT(nest_yellowBlueWords ^ usedEmotionaWords) > 0: <> prima info.
            }
            {    
                - LIST_COUNT(nest_yellowBlueWords ^ usedEmotionaWords) > 1: <> seconda info.
            }
            {    
                - LIST_COUNT(nest_yellowBlueWords ^ usedEmotionaWords) > 2: <> terza info.
            }
            
            {
                - nest_yellowBlueWords ^ discoveredEmotionalWords has GialloBlu: <> caratteristiche variante uno.
                - nest_yellowBlueWords ^ discoveredEmotionalWords hasnt GialloBlu: <> variante non scoperta.
            }
            {    
                - nest_yellowBlueWords ^ discoveredEmotionalWords has GialloGialloBlu:<> caratteristiche variante due.
                - nest_yellowBlueWords ^ discoveredEmotionalWords hasnt GialloGialloBlu:<> variante non scoperta.
            }
            {    
                - nest_yellowBlueWords ^ discoveredEmotionalWords has GialloBluVerde:<> caratteristiche variante tre.
                - nest_yellowBlueWords ^ discoveredEmotionalWords hasnt GialloBluVerde:<> variante non scoperta.
            }
            {    
                - nest_yellowBlueWords ^ discoveredEmotionalWords has GialloBluViola: <> caratteristiche variante quattro.
                - nest_yellowBlueWords ^ discoveredEmotionalWords hasnt GialloBluViola: <> variante non scoperta.
            }
            {    
                - nest_yellowBlueWords ^ discoveredEmotionalWords has GialloBluBlu:<> caratteristiche variante cinque.
                - nest_yellowBlueWords ^ discoveredEmotionalWords hasnt GialloBluBlu:<> variante non scoperta.
            }
            {    
                - nest_yellowBlueWords ^ discoveredEmotionalWords has GialloBluGiallo:<> caratteristiche variante sei.
                - nest_yellowBlueWords ^ discoveredEmotionalWords hasnt GialloBluGiallo:<> variante non scoperta.
            }
            {     
                - nest_yellowBlueWords ^ discoveredEmotionalWords has GialloBluRosso:<> caratteristiche variante sette.
                - nest_yellowBlueWords ^ discoveredEmotionalWords hasnt GialloBluRosso:<> variante non scoperta.
            
            }
    
    
    } 
    {
        - nest_yellowGreenWords ^ discoveredEmotionalWords == ():
            <i>La dodicesima parola non è stata ancora scoperta.
            
        - else:
            <b>Parola GialloVerde.</b>
            <> Caratteristiche generali.
            {
                - LIST_COUNT(nest_yellowGreenWords ^ usedEmotionaWords) > 0: <> prima info.
            }
            {    
                - LIST_COUNT(nest_yellowGreenWords ^ usedEmotionaWords) > 1: <> seconda info.
            }
            {    
                - LIST_COUNT(nest_yellowGreenWords ^ usedEmotionaWords) > 2: <> terza info.
            }
            
            {
                - nest_yellowGreenWords ^ discoveredEmotionalWords has GialloVerde: <> caratteristiche variante uno.
                - nest_yellowGreenWords ^ discoveredEmotionalWords hasnt GialloVerde: <> variante non scoperta.
            }
            {    
                - nest_yellowGreenWords ^ discoveredEmotionalWords has GialloGialloVerde:<> caratteristiche variante due.
                - nest_yellowGreenWords ^ discoveredEmotionalWords hasnt GialloGialloVerde:<> variante non scoperta.
            }
            {    
                - nest_yellowGreenWords ^ discoveredEmotionalWords has GialloVerdeVerde:<> caratteristiche variante tre.
                - nest_yellowGreenWords ^ discoveredEmotionalWords hasnt GialloVerdeVerde:<> variante non scoperta.
            }
            {    
                - nest_yellowGreenWords ^ discoveredEmotionalWords has GialloVerdeViola: <> caratteristiche variante quattro.
                - nest_yellowGreenWords ^ discoveredEmotionalWords hasnt GialloVerdeViola: <> variante non scoperta.
            }
            {    
                - nest_yellowGreenWords ^ discoveredEmotionalWords has GialloVerdeBlu:<> caratteristiche variante cinque.
                - nest_yellowGreenWords ^ discoveredEmotionalWords hasnt GialloVerdeBlu:<> variante non scoperta.
            }
            {    
                - nest_yellowGreenWords ^ discoveredEmotionalWords has GialloVerdeGiallo:<> caratteristiche variante sei.
                - nest_yellowGreenWords ^ discoveredEmotionalWords hasnt GialloVerdeGiallo:<> variante non scoperta.
            }
            {     
                - nest_yellowGreenWords ^ discoveredEmotionalWords has GialloVerdeRosso:<> caratteristiche variante sette.
                - nest_yellowGreenWords ^ discoveredEmotionalWords hasnt GialloVerdeRosso:<> variante non scoperta.
            
            }
    
    
    } 
    
    {
        - nest_yellowPurpleWords ^ discoveredEmotionalWords == ():
            <i>La tredicesima parola non è stata ancora scoperta.
            
        - else:
            <b>Parola GialloViola.</b>
            <> Caratteristiche generali.
            {
                - LIST_COUNT(nest_yellowPurpleWords ^ usedEmotionaWords) > 0: <> prima info.
            }
            {    
                - LIST_COUNT(nest_yellowPurpleWords ^ usedEmotionaWords) > 1: <> seconda info.
            }
            {    
                - LIST_COUNT(nest_yellowPurpleWords ^ usedEmotionaWords) > 2: <> terza info.
            }
            
            {
                - nest_yellowPurpleWords ^ discoveredEmotionalWords has GialloViola: <> caratteristiche variante uno.
                - nest_yellowPurpleWords ^ discoveredEmotionalWords hasnt GialloViola: <> variante non scoperta.
            }
            {    
                - nest_yellowPurpleWords ^ discoveredEmotionalWords has GialloGialloViola:<> caratteristiche variante due.
                - nest_yellowPurpleWords ^ discoveredEmotionalWords hasnt GialloGialloViola:<> variante non scoperta.
            }
            {    
                - nest_yellowPurpleWords ^ discoveredEmotionalWords has GialloViolaVerde:<> caratteristiche variante tre.
                - nest_yellowPurpleWords ^ discoveredEmotionalWords hasnt GialloViolaVerde:<> variante non scoperta.
            }
            {    
                - nest_yellowPurpleWords ^ discoveredEmotionalWords has GialloViolaViola: <> caratteristiche variante quattro.
                - nest_yellowPurpleWords ^ discoveredEmotionalWords hasnt GialloViolaViola: <> variante non scoperta.
            }
            {    
                - nest_yellowPurpleWords ^ discoveredEmotionalWords has GialloViolaBlu:<> caratteristiche variante cinque.
                - nest_yellowPurpleWords ^ discoveredEmotionalWords hasnt GialloViolaBlu:<> variante non scoperta.
            }
            {    
                - nest_yellowPurpleWords ^ discoveredEmotionalWords has GialloViolaGiallo:<> caratteristiche variante sei.
                - nest_yellowPurpleWords ^ discoveredEmotionalWords hasnt GialloViolaGiallo:<> variante non scoperta.
            }
            {     
                - nest_yellowPurpleWords ^ discoveredEmotionalWords has GialloViolaRosso:<> caratteristiche variante sette.
                - nest_yellowPurpleWords ^ discoveredEmotionalWords hasnt GialloViolaRosso:<> variante non scoperta.
            
            }
    
    
    } 


//Varianti a dominante Blu
    {
        - nest_blueRedWords ^ discoveredEmotionalWords == ():
            <i>La quattordicesima parola non è stata ancora scoperta.
            
        - else:
            <b>Parola BluRossa.</b>
            <> Caratteristiche generali.
            {
                - LIST_COUNT(nest_blueRedWords ^ usedEmotionaWords) > 0: <> prima info.
            }
            {    
                - LIST_COUNT(nest_blueRedWords ^ usedEmotionaWords) > 1: <> seconda info.
            }
            {    
                - LIST_COUNT(nest_blueRedWords ^ usedEmotionaWords) > 2: <> terza info.
            }
            
            {
                - nest_blueRedWords ^ discoveredEmotionalWords has BluRosso: <> caratteristiche variante uno.
                - nest_blueRedWords ^ discoveredEmotionalWords hasnt BluRosso: <> variante non scoperta.
            }
            {    
                - nest_blueRedWords ^ discoveredEmotionalWords has BluBluRosso:<> caratteristiche variante due.
                - nest_blueRedWords ^ discoveredEmotionalWords hasnt BluBluRosso:<> variante non scoperta.
            }
            {    
                - nest_blueRedWords ^ discoveredEmotionalWords has BluRossoVerde:<> caratteristiche variante tre.
                - nest_blueRedWords ^ discoveredEmotionalWords hasnt BluRossoVerde:<> variante non scoperta.
            }
            {    
                - nest_blueRedWords ^ discoveredEmotionalWords has BluRossoViola: <> caratteristiche variante quattro.
                - nest_blueRedWords ^ discoveredEmotionalWords hasnt BluRossoViola: <> variante non scoperta.
            }
            {    
                - nest_blueRedWords ^ discoveredEmotionalWords has BluRossoBlu:<> caratteristiche variante cinque.
                - nest_blueRedWords ^ discoveredEmotionalWords hasnt BluRossoBlu:<> variante non scoperta.
            }
            {    
                - nest_blueRedWords ^ discoveredEmotionalWords has BluRossoGiallo:<> caratteristiche variante sei.
                - nest_blueRedWords ^ discoveredEmotionalWords hasnt BluRossoGiallo:<> variante non scoperta.
            }
            {     
                - nest_blueRedWords ^ discoveredEmotionalWords has BluRossoRosso:<> caratteristiche variante sette.
                - nest_blueRedWords ^ discoveredEmotionalWords hasnt BluRossoRosso:<> variante non scoperta.
            
            }
    
    
    } 
    
    {
        - nest_blueYellowWords ^ discoveredEmotionalWords == ():
            <i>La quindicesima parola non è stata ancora scoperta.
            
        - else:
            <b>Parola BluGialla.</b>
            <> Caratteristiche generali.
            {
                - LIST_COUNT(nest_blueYellowWords ^ usedEmotionaWords) > 0: <> prima info.
            }
            {    
                - LIST_COUNT(nest_blueYellowWords ^ usedEmotionaWords) > 1: <> seconda info.
            }
            {    
                - LIST_COUNT(nest_blueYellowWords ^ usedEmotionaWords) > 2: <> terza info.
            }
            
            {
                - nest_blueYellowWords ^ discoveredEmotionalWords has BluGiallo: <> caratteristiche variante uno.
                - nest_blueYellowWords ^ discoveredEmotionalWords hasnt BluGiallo: <> variante non scoperta.
            }
            {    
                - nest_blueYellowWords ^ discoveredEmotionalWords has BluBluGiallo:<> caratteristiche variante due.
                - nest_blueYellowWords ^ discoveredEmotionalWords hasnt BluBluGiallo:<> variante non scoperta.
            }
            {    
                - nest_blueYellowWords ^ discoveredEmotionalWords has BluGialloVerde:<> caratteristiche variante tre.
                - nest_blueYellowWords ^ discoveredEmotionalWords hasnt BluGialloVerde:<> variante non scoperta.
            }
            {    
                - nest_blueYellowWords ^ discoveredEmotionalWords has BluGialloViola: <> caratteristiche variante quattro.
                - nest_blueYellowWords ^ discoveredEmotionalWords hasnt BluGialloViola: <> variante non scoperta.
            }
            {    
                - nest_blueYellowWords ^ discoveredEmotionalWords has BluGialloBlu:<> caratteristiche variante cinque.
                - nest_blueYellowWords ^ discoveredEmotionalWords hasnt BluGialloBlu:<> variante non scoperta.
            }
            {    
                - nest_blueYellowWords ^ discoveredEmotionalWords has BluGialloGiallo:<> caratteristiche variante sei.
                - nest_blueYellowWords ^ discoveredEmotionalWords hasnt BluGialloGiallo:<> variante non scoperta.
            }
            {     
                - nest_blueYellowWords ^ discoveredEmotionalWords has BluGialloRosso:<> caratteristiche variante sette.
                - nest_blueYellowWords ^ discoveredEmotionalWords hasnt BluGialloRosso:<> variante non scoperta.
            
            }
    
    
    } 
    {
        - nest_blueGreenWords ^ discoveredEmotionalWords == ():
            <i>La sedicesima parola non è stata ancora scoperta.
            
        - else:
            <b>Parola BluVerde.</b>
            <> Caratteristiche generali.
            {
                - LIST_COUNT(nest_blueGreenWords ^ usedEmotionaWords) > 0: <> prima info.
            }
            {    
                - LIST_COUNT(nest_blueGreenWords ^ usedEmotionaWords) > 1: <> seconda info.
            }
            {    
                - LIST_COUNT(nest_blueGreenWords ^ usedEmotionaWords) > 2: <> terza info.
            }
            
            {
                - nest_blueGreenWords ^ discoveredEmotionalWords has BluVerde: <> caratteristiche variante uno.
                - nest_blueGreenWords ^ discoveredEmotionalWords hasnt BluVerde: <> variante non scoperta.
            }
            {    
                - nest_blueGreenWords ^ discoveredEmotionalWords has BluBluVerde:<> caratteristiche variante due.
                - nest_blueGreenWords ^ discoveredEmotionalWords hasnt BluBluVerde:<> variante non scoperta.
            }
            {    
                - nest_blueGreenWords ^ discoveredEmotionalWords has BluVerdeVerde:<> caratteristiche variante tre.
                - nest_blueGreenWords ^ discoveredEmotionalWords hasnt BluVerdeVerde:<> variante non scoperta.
            }
            {    
                - nest_blueGreenWords ^ discoveredEmotionalWords has BluVerdeViola: <> caratteristiche variante quattro.
                - nest_blueGreenWords ^ discoveredEmotionalWords hasnt BluVerdeViola: <> variante non scoperta.
            }
            {    
                - nest_blueGreenWords ^ discoveredEmotionalWords has BluVerdeBlu:<> caratteristiche variante cinque.
                - nest_blueGreenWords ^ discoveredEmotionalWords hasnt BluVerdeBlu:<> variante non scoperta.
            }
            {    
                - nest_blueGreenWords ^ discoveredEmotionalWords has BluVerdeGiallo:<> caratteristiche variante sei.
                - nest_blueGreenWords ^ discoveredEmotionalWords hasnt BluVerdeGiallo:<> variante non scoperta.
            }
            {     
                - nest_blueGreenWords ^ discoveredEmotionalWords has BluVerdeRosso:<> caratteristiche variante sette.
                - nest_blueGreenWords ^ discoveredEmotionalWords hasnt BluVerdeRosso:<> variante non scoperta.
            
            }
    
    
    } 
    
    {
        - nest_bluePurpleWords ^ discoveredEmotionalWords == ():
            <i>La diciassettesima parola non è stata ancora scoperta.
            
        - else:
            <b>Parola BluViola.</b>
            <> Caratteristiche generali.
            {
                - LIST_COUNT(nest_bluePurpleWords ^ usedEmotionaWords) > 0: <> prima info.
            }
            {    
                - LIST_COUNT(nest_bluePurpleWords ^ usedEmotionaWords) > 1: <> seconda info.
            }
            {    
                - LIST_COUNT(nest_bluePurpleWords ^ usedEmotionaWords) > 2: <> terza info.
            }
            
            {
                - nest_bluePurpleWords ^ discoveredEmotionalWords has BluViola: <> caratteristiche variante uno.
                - nest_bluePurpleWords ^ discoveredEmotionalWords hasnt BluViola: <> variante non scoperta.
            }
            {    
                - nest_bluePurpleWords ^ discoveredEmotionalWords has BluBluViola:<> caratteristiche variante due.
                - nest_bluePurpleWords ^ discoveredEmotionalWords hasnt BluBluViola:<> variante non scoperta.
            }
            {    
                - nest_bluePurpleWords ^ discoveredEmotionalWords has BluViolaVerde:<> caratteristiche variante tre.
                - nest_bluePurpleWords ^ discoveredEmotionalWords hasnt BluViolaVerde:<> variante non scoperta.
            }
            {    
                - nest_bluePurpleWords ^ discoveredEmotionalWords has BluViolaViola: <> caratteristiche variante quattro.
                - nest_bluePurpleWords ^ discoveredEmotionalWords hasnt BluViolaViola: <> variante non scoperta.
            }
            {    
                - nest_bluePurpleWords ^ discoveredEmotionalWords has BluViolaBlu:<> caratteristiche variante cinque.
                - nest_bluePurpleWords ^ discoveredEmotionalWords hasnt BluViolaBlu:<> variante non scoperta.
            }
            {    
                - nest_bluePurpleWords ^ discoveredEmotionalWords has BluViolaGiallo:<> caratteristiche variante sei.
                - nest_bluePurpleWords ^ discoveredEmotionalWords hasnt BluViolaGiallo:<> variante non scoperta.
            }
            {     
                - nest_bluePurpleWords ^ discoveredEmotionalWords has BluViolaRosso:<> caratteristiche variante sette.
                - nest_bluePurpleWords ^ discoveredEmotionalWords hasnt BluViolaRosso:<> variante non scoperta.
            
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
