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
        - nest_redWords ^ nest_discoveredEmotionalWords == ():
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
                - nest_redWords ^ nest_discoveredEmotionalWords has Rosso: <> caratteristiche variante uno.
                - nest_redWords ^ nest_discoveredEmotionalWords hasnt Rosso: <> variante non scoperta.
            }
            {
                - nest_redWords ^ nest_discoveredEmotionalWords has RossoRosso: <> caratteristiche variante due.
                - nest_redWords ^ nest_discoveredEmotionalWords hasnt RossoRosso: <> variante non scoperta.
            }
            {
                - nest_redWords ^ nest_discoveredEmotionalWords has RossoRossoRosso: <> caratteristiche variante tre.
                - nest_redWords ^ nest_discoveredEmotionalWords hasnt RossoRossoRosso: <> variante non scoperta.
            
            }
    
    
    }
    
    {
        - nest_yellowWords ^ nest_discoveredEmotionalWords == ():
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
                - nest_yellowWords ^ nest_discoveredEmotionalWords has Giallo: <> caratteristiche variante uno.
                - nest_yellowWords ^ nest_discoveredEmotionalWords hasnt Giallo: <> variante non scoperta.
            }
            {
                - nest_yellowWords ^ nest_discoveredEmotionalWords has GialloGiallo: <> caratteristiche variante due.
                - nest_yellowWords ^ nest_discoveredEmotionalWords hasnt GialloGiallo: <> variante non scoperta.
            }
            {
                - nest_yellowWords ^ nest_discoveredEmotionalWords has GialloGialloGiallo: <> caratteristiche variante tre.
                - nest_yellowWords ^ nest_discoveredEmotionalWords hasnt GialloGialloGiallo: <> variante non scoperta.
            
            }
    
    
    }
    
    {
        - nest_blueWords ^ nest_discoveredEmotionalWords == ():
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
                - nest_blueWords ^ nest_discoveredEmotionalWords has Blu: <> caratteristiche variante uno.
                - nest_blueWords ^ nest_discoveredEmotionalWords hasnt Blu: <> variante non scoperta.
            }
            {
                - nest_blueWords ^ nest_discoveredEmotionalWords has BluBlu: <> caratteristiche variante due.
                - nest_blueWords ^ nest_discoveredEmotionalWords hasnt BluBlu: <> variante non scoperta.
            }
            {
                - nest_blueWords ^ nest_discoveredEmotionalWords has BluBluBlu: <> caratteristiche variante tre.
                - nest_blueWords ^ nest_discoveredEmotionalWords hasnt BluBluBlu: <> variante non scoperta.
            
            }
    
    
    }
    
    {
        - nest_greenWords ^ nest_discoveredEmotionalWords == ():
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
                - nest_greenWords ^ nest_discoveredEmotionalWords has Verde: <> caratteristiche variante uno.
                - nest_greenWords ^ nest_discoveredEmotionalWords hasnt Verde: <> variante non scoperta.
            }
            {
                - nest_greenWords ^ nest_discoveredEmotionalWords has VerdeVerde: <> caratteristiche variante due.
                - nest_greenWords ^ nest_discoveredEmotionalWords hasnt VerdeVerde: <> variante non scoperta.
            }
            {
                - nest_greenWords ^ nest_discoveredEmotionalWords has VerdeVerdeVerde: <> caratteristiche variante tre.
                - nest_greenWords ^ nest_discoveredEmotionalWords hasnt VerdeVerdeVerde: <> variante non scoperta.
            
            }
    
    
    }

    {
        - nest_purpleWords ^ nest_discoveredEmotionalWords == ():
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
                - nest_purpleWords ^ nest_discoveredEmotionalWords has Viola: <> caratteristiche variante uno.
                - nest_purpleWords ^ nest_discoveredEmotionalWords hasnt Viola: <> variante non scoperta.
            }
            {
                - nest_purpleWords ^ nest_discoveredEmotionalWords has ViolaViola: <> caratteristiche variante due.
                - nest_purpleWords ^ nest_discoveredEmotionalWords hasnt ViolaViola: <> variante non scoperta.
            }
            {
                - nest_purpleWords ^ nest_discoveredEmotionalWords has ViolaViolaViola: <> caratteristiche variante tre.
                - nest_purpleWords ^ nest_discoveredEmotionalWords hasnt ViolaViolaViola: <> variante non scoperta.
            
            }
    
    
    }       



//Varianti a dominante Rosso
    {
        - nest_redYellowWords ^ nest_discoveredEmotionalWords == ():
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
                - nest_redYellowWords ^ nest_discoveredEmotionalWords has RossoGiallo: <> caratteristiche variante uno.
                - nest_redYellowWords ^ nest_discoveredEmotionalWords hasnt RossoGiallo: <> variante non scoperta.
            }
            {    
                - nest_redYellowWords ^ nest_discoveredEmotionalWords has RossoRossoGiallo:<> caratteristiche variante due.
                - nest_redYellowWords ^ nest_discoveredEmotionalWords hasnt RossoRossoGiallo:<> variante non scoperta.
            }
            {    
                - nest_redYellowWords ^ nest_discoveredEmotionalWords has RossoGialloGiallo:<> caratteristiche variante tre.
                - nest_redYellowWords ^ nest_discoveredEmotionalWords hasnt RossoGialloGiallo:<> variante non scoperta.
            }
            {    
                - nest_redYellowWords ^ nest_discoveredEmotionalWords has RossoGialloBlu: <> caratteristiche variante quattro.
                - nest_redYellowWords ^ nest_discoveredEmotionalWords hasnt RossoGialloBlu: <> variante non scoperta.
            }
            {    
                - nest_redYellowWords ^ nest_discoveredEmotionalWords has RossoGialloVerde:<> caratteristiche variante cinque.
                - nest_redYellowWords ^ nest_discoveredEmotionalWords hasnt RossoGialloVerde:<> variante non scoperta.
            }
            {    
                - nest_redYellowWords ^ nest_discoveredEmotionalWords has RossoGialloViola:<> caratteristiche variante sei.
                - nest_redYellowWords ^ nest_discoveredEmotionalWords hasnt RossoGialloViola:<> variante non scoperta.
            }
            {     
                - nest_redYellowWords ^ nest_discoveredEmotionalWords has RossoGialloRosso:<> caratteristiche variante sette.
                - nest_redYellowWords ^ nest_discoveredEmotionalWords hasnt RossoGialloRosso:<> variante non scoperta.
            
            }
    
    
    } 
    
    {
        - nest_redBlueWords ^ nest_discoveredEmotionalWords == ():
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
                - nest_redBlueWords ^ nest_discoveredEmotionalWords has RossoBlu: <> caratteristiche variante uno.
                - nest_redBlueWords ^ nest_discoveredEmotionalWords hasnt RossoBlu: <> variante non scoperta.
            }
            {    
                - nest_redBlueWords ^ nest_discoveredEmotionalWords has RossoRossoBlu:<> caratteristiche variante due.
                - nest_redBlueWords ^ nest_discoveredEmotionalWords hasnt RossoRossoBlu:<> variante non scoperta.
            }
            {    
                - nest_redBlueWords ^ nest_discoveredEmotionalWords has RossoBluBlu:<> caratteristiche variante tre.
                - nest_redBlueWords ^ nest_discoveredEmotionalWords hasnt RossoBluBlu:<> variante non scoperta.
            }
            {    
                - nest_redBlueWords ^ nest_discoveredEmotionalWords has RossoBluVerde: <> caratteristiche variante quattro.
                - nest_redBlueWords ^ nest_discoveredEmotionalWords hasnt RossoBluVerde: <> variante non scoperta.
            }
            {    
                - nest_redBlueWords ^ nest_discoveredEmotionalWords has RossoBluViola:<> caratteristiche variante cinque.
                - nest_redBlueWords ^ nest_discoveredEmotionalWords hasnt RossoBluViola:<> variante non scoperta.
            }
            {    
                - nest_redBlueWords ^ nest_discoveredEmotionalWords has RossoBluRosso:<> caratteristiche variante sei.
                - nest_redBlueWords ^ nest_discoveredEmotionalWords hasnt RossoBluRosso:<> variante non scoperta.
            }
            {     
                - nest_redBlueWords ^ nest_discoveredEmotionalWords has RossoBluGiallo:<> caratteristiche variante sette.
                - nest_redBlueWords ^ nest_discoveredEmotionalWords hasnt RossoBluGiallo:<> variante non scoperta.
            
            }
    
    
    } 
    {
        - nest_redGreenWords ^ nest_discoveredEmotionalWords == ():
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
                - nest_redGreenWords ^ nest_discoveredEmotionalWords has RossoVerde: <> caratteristiche variante uno.
                - nest_redGreenWords ^ nest_discoveredEmotionalWords hasnt RossoVerde: <> variante non scoperta.
            }
            {    
                - nest_redGreenWords ^ nest_discoveredEmotionalWords has RossoRossoVerde:<> caratteristiche variante due.
                - nest_redGreenWords ^ nest_discoveredEmotionalWords hasnt RossoRossoVerde:<> variante non scoperta.
            }
            {    
                - nest_redGreenWords ^ nest_discoveredEmotionalWords has RossoVerdeBlu:<> caratteristiche variante tre.
                - nest_redGreenWords ^ nest_discoveredEmotionalWords hasnt RossoVerdeBlu:<> variante non scoperta.
            }
            {    
                - nest_redGreenWords ^ nest_discoveredEmotionalWords has RossoVerdeVerde: <> caratteristiche variante quattro.
                - nest_redGreenWords ^ nest_discoveredEmotionalWords hasnt RossoVerdeVerde: <> variante non scoperta.
            }
            {    
                - nest_redGreenWords ^ nest_discoveredEmotionalWords has RossoVerdeViola:<> caratteristiche variante cinque.
                - nest_redGreenWords ^ nest_discoveredEmotionalWords hasnt RossoVerdeViola:<> variante non scoperta.
            }
            {    
                - nest_redGreenWords ^ nest_discoveredEmotionalWords has RossoVerdeRosso:<> caratteristiche variante sei.
                - nest_redGreenWords ^ nest_discoveredEmotionalWords hasnt RossoVerdeRosso:<> variante non scoperta.
            }
            {     
                - nest_redGreenWords ^ nest_discoveredEmotionalWords has RossoVerdeGiallo:<> caratteristiche variante sette.
                - nest_redGreenWords ^ nest_discoveredEmotionalWords hasnt RossoVerdeGiallo:<> variante non scoperta.
            
            }
    
    
    } 
    
    {
        - nest_redPurpleWords ^ nest_discoveredEmotionalWords == ():
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
                - nest_redPurpleWords ^ nest_discoveredEmotionalWords has RossoViola: <> caratteristiche variante uno.
                - nest_redPurpleWords ^ nest_discoveredEmotionalWords hasnt RossoViola: <> variante non scoperta.
            }
            {    
                - nest_redPurpleWords ^ nest_discoveredEmotionalWords has RossoRossoViola:<> caratteristiche variante due.
                - nest_redPurpleWords ^ nest_discoveredEmotionalWords hasnt RossoRossoViola:<> variante non scoperta.
            }
            {    
                - nest_redPurpleWords ^ nest_discoveredEmotionalWords has RossoViolaBlu:<> caratteristiche variante tre.
                - nest_redPurpleWords ^ nest_discoveredEmotionalWords hasnt RossoViolaBlu:<> variante non scoperta.
            }
            {    
                - nest_redPurpleWords ^ nest_discoveredEmotionalWords has RossoViolaVerde: <> caratteristiche variante quattro.
                - nest_redPurpleWords ^ nest_discoveredEmotionalWords hasnt RossoViolaVerde: <> variante non scoperta.
            }
            {    
                - nest_redPurpleWords ^ nest_discoveredEmotionalWords has RossoViolaViola:<> caratteristiche variante cinque.
                - nest_redPurpleWords ^ nest_discoveredEmotionalWords hasnt RossoViolaViola:<> variante non scoperta.
            }
            {    
                - nest_redPurpleWords ^ nest_discoveredEmotionalWords has RossoViolaRosso:<> caratteristiche variante sei.
                - nest_redPurpleWords ^ nest_discoveredEmotionalWords hasnt RossoViolaRosso:<> variante non scoperta.
            }
            {     
                - nest_redPurpleWords ^ nest_discoveredEmotionalWords has RossoViolaGiallo:<> caratteristiche variante sette.
                - nest_redPurpleWords ^ nest_discoveredEmotionalWords hasnt RossoViolaGiallo:<> variante non scoperta.
            
            }
    
    
    } 





//Varianti a dominante Giallo
    {
        - nest_yellowRedWords ^ nest_discoveredEmotionalWords == ():
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
                - nest_yellowRedWords ^ nest_discoveredEmotionalWords has GialloRosso: <> caratteristiche variante uno.
                - nest_yellowRedWords ^ nest_discoveredEmotionalWords hasnt GialloRosso: <> variante non scoperta.
            }
            {    
                - nest_yellowRedWords ^ nest_discoveredEmotionalWords has GialloGialloRosso:<> caratteristiche variante due.
                - nest_yellowRedWords ^ nest_discoveredEmotionalWords hasnt GialloGialloRosso:<> variante non scoperta.
            }
            {    
                - nest_yellowRedWords ^ nest_discoveredEmotionalWords has GialloRossoRosso:<> caratteristiche variante tre.
                - nest_yellowRedWords ^ nest_discoveredEmotionalWords hasnt GialloRossoRosso:<> variante non scoperta.
            }
            {    
                - nest_yellowRedWords ^ nest_discoveredEmotionalWords has GialloRossoVerde: <> caratteristiche variante quattro.
                - nest_yellowRedWords ^ nest_discoveredEmotionalWords hasnt GialloRossoVerde: <> variante non scoperta.
            }
            {    
                - nest_yellowRedWords ^ nest_discoveredEmotionalWords has GialloRossoViola:<> caratteristiche variante cinque.
                - nest_yellowRedWords ^ nest_discoveredEmotionalWords hasnt GialloRossoViola:<> variante non scoperta.
            }
            {    
                - nest_yellowRedWords ^ nest_discoveredEmotionalWords has GialloRossoBlu:<> caratteristiche variante sei.
                - nest_yellowRedWords ^ nest_discoveredEmotionalWords hasnt GialloRossoBlu:<> variante non scoperta.
            }
            {     
                - nest_yellowRedWords ^ nest_discoveredEmotionalWords has GialloRossoGiallo:<> caratteristiche variante sette.
                - nest_yellowRedWords ^ nest_discoveredEmotionalWords hasnt GialloRossoGiallo:<> variante non scoperta.
            
            }
    
    
    } 
    
    {
        - nest_yellowBlueWords ^ nest_discoveredEmotionalWords == ():
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
                - nest_yellowBlueWords ^ nest_discoveredEmotionalWords has GialloBlu: <> caratteristiche variante uno.
                - nest_yellowBlueWords ^ nest_discoveredEmotionalWords hasnt GialloBlu: <> variante non scoperta.
            }
            {    
                - nest_yellowBlueWords ^ nest_discoveredEmotionalWords has GialloGialloBlu:<> caratteristiche variante due.
                - nest_yellowBlueWords ^ nest_discoveredEmotionalWords hasnt GialloGialloBlu:<> variante non scoperta.
            }
            {    
                - nest_yellowBlueWords ^ nest_discoveredEmotionalWords has GialloBluVerde:<> caratteristiche variante tre.
                - nest_yellowBlueWords ^ nest_discoveredEmotionalWords hasnt GialloBluVerde:<> variante non scoperta.
            }
            {    
                - nest_yellowBlueWords ^ nest_discoveredEmotionalWords has GialloBluViola: <> caratteristiche variante quattro.
                - nest_yellowBlueWords ^ nest_discoveredEmotionalWords hasnt GialloBluViola: <> variante non scoperta.
            }
            {    
                - nest_yellowBlueWords ^ nest_discoveredEmotionalWords has GialloBluBlu:<> caratteristiche variante cinque.
                - nest_yellowBlueWords ^ nest_discoveredEmotionalWords hasnt GialloBluBlu:<> variante non scoperta.
            }
            {    
                - nest_yellowBlueWords ^ nest_discoveredEmotionalWords has GialloBluGiallo:<> caratteristiche variante sei.
                - nest_yellowBlueWords ^ nest_discoveredEmotionalWords hasnt GialloBluGiallo:<> variante non scoperta.
            }
            {     
                - nest_yellowBlueWords ^ nest_discoveredEmotionalWords has GialloBluRosso:<> caratteristiche variante sette.
                - nest_yellowBlueWords ^ nest_discoveredEmotionalWords hasnt GialloBluRosso:<> variante non scoperta.
            
            }
    
    
    } 
    {
        - nest_yellowGreenWords ^ nest_discoveredEmotionalWords == ():
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
                - nest_yellowGreenWords ^ nest_discoveredEmotionalWords has GialloVerde: <> caratteristiche variante uno.
                - nest_yellowGreenWords ^ nest_discoveredEmotionalWords hasnt GialloVerde: <> variante non scoperta.
            }
            {    
                - nest_yellowGreenWords ^ nest_discoveredEmotionalWords has GialloGialloVerde:<> caratteristiche variante due.
                - nest_yellowGreenWords ^ nest_discoveredEmotionalWords hasnt GialloGialloVerde:<> variante non scoperta.
            }
            {    
                - nest_yellowGreenWords ^ nest_discoveredEmotionalWords has GialloVerdeVerde:<> caratteristiche variante tre.
                - nest_yellowGreenWords ^ nest_discoveredEmotionalWords hasnt GialloVerdeVerde:<> variante non scoperta.
            }
            {    
                - nest_yellowGreenWords ^ nest_discoveredEmotionalWords has GialloVerdeViola: <> caratteristiche variante quattro.
                - nest_yellowGreenWords ^ nest_discoveredEmotionalWords hasnt GialloVerdeViola: <> variante non scoperta.
            }
            {    
                - nest_yellowGreenWords ^ nest_discoveredEmotionalWords has GialloVerdeBlu:<> caratteristiche variante cinque.
                - nest_yellowGreenWords ^ nest_discoveredEmotionalWords hasnt GialloVerdeBlu:<> variante non scoperta.
            }
            {    
                - nest_yellowGreenWords ^ nest_discoveredEmotionalWords has GialloVerdeGiallo:<> caratteristiche variante sei.
                - nest_yellowGreenWords ^ nest_discoveredEmotionalWords hasnt GialloVerdeGiallo:<> variante non scoperta.
            }
            {     
                - nest_yellowGreenWords ^ nest_discoveredEmotionalWords has GialloVerdeRosso:<> caratteristiche variante sette.
                - nest_yellowGreenWords ^ nest_discoveredEmotionalWords hasnt GialloVerdeRosso:<> variante non scoperta.
            
            }
    
    
    } 
    
    {
        - nest_yellowPurpleWords ^ nest_discoveredEmotionalWords == ():
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
                - nest_yellowPurpleWords ^ nest_discoveredEmotionalWords has GialloViola: <> caratteristiche variante uno.
                - nest_yellowPurpleWords ^ nest_discoveredEmotionalWords hasnt GialloViola: <> variante non scoperta.
            }
            {    
                - nest_yellowPurpleWords ^ nest_discoveredEmotionalWords has GialloGialloViola:<> caratteristiche variante due.
                - nest_yellowPurpleWords ^ nest_discoveredEmotionalWords hasnt GialloGialloViola:<> variante non scoperta.
            }
            {    
                - nest_yellowPurpleWords ^ nest_discoveredEmotionalWords has GialloViolaVerde:<> caratteristiche variante tre.
                - nest_yellowPurpleWords ^ nest_discoveredEmotionalWords hasnt GialloViolaVerde:<> variante non scoperta.
            }
            {    
                - nest_yellowPurpleWords ^ nest_discoveredEmotionalWords has GialloViolaViola: <> caratteristiche variante quattro.
                - nest_yellowPurpleWords ^ nest_discoveredEmotionalWords hasnt GialloViolaViola: <> variante non scoperta.
            }
            {    
                - nest_yellowPurpleWords ^ nest_discoveredEmotionalWords has GialloViolaBlu:<> caratteristiche variante cinque.
                - nest_yellowPurpleWords ^ nest_discoveredEmotionalWords hasnt GialloViolaBlu:<> variante non scoperta.
            }
            {    
                - nest_yellowPurpleWords ^ nest_discoveredEmotionalWords has GialloViolaGiallo:<> caratteristiche variante sei.
                - nest_yellowPurpleWords ^ nest_discoveredEmotionalWords hasnt GialloViolaGiallo:<> variante non scoperta.
            }
            {     
                - nest_yellowPurpleWords ^ nest_discoveredEmotionalWords has GialloViolaRosso:<> caratteristiche variante sette.
                - nest_yellowPurpleWords ^ nest_discoveredEmotionalWords hasnt GialloViolaRosso:<> variante non scoperta.
            
            }
    
    
    } 


//Varianti a dominante Blu
    {
        - nest_blueRedWords ^ nest_discoveredEmotionalWords == ():
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
                - nest_blueRedWords ^ nest_discoveredEmotionalWords has BluRosso: <> caratteristiche variante uno.
                - nest_blueRedWords ^ nest_discoveredEmotionalWords hasnt BluRosso: <> variante non scoperta.
            }
            {    
                - nest_blueRedWords ^ nest_discoveredEmotionalWords has BluBluRosso:<> caratteristiche variante due.
                - nest_blueRedWords ^ nest_discoveredEmotionalWords hasnt BluBluRosso:<> variante non scoperta.
            }
            {    
                - nest_blueRedWords ^ nest_discoveredEmotionalWords has BluRossoVerde:<> caratteristiche variante tre.
                - nest_blueRedWords ^ nest_discoveredEmotionalWords hasnt BluRossoVerde:<> variante non scoperta.
            }
            {    
                - nest_blueRedWords ^ nest_discoveredEmotionalWords has BluRossoViola: <> caratteristiche variante quattro.
                - nest_blueRedWords ^ nest_discoveredEmotionalWords hasnt BluRossoViola: <> variante non scoperta.
            }
            {    
                - nest_blueRedWords ^ nest_discoveredEmotionalWords has BluRossoBlu:<> caratteristiche variante cinque.
                - nest_blueRedWords ^ nest_discoveredEmotionalWords hasnt BluRossoBlu:<> variante non scoperta.
            }
            {    
                - nest_blueRedWords ^ nest_discoveredEmotionalWords has BluRossoGiallo:<> caratteristiche variante sei.
                - nest_blueRedWords ^ nest_discoveredEmotionalWords hasnt BluRossoGiallo:<> variante non scoperta.
            }
            {     
                - nest_blueRedWords ^ nest_discoveredEmotionalWords has BluRossoRosso:<> caratteristiche variante sette.
                - nest_blueRedWords ^ nest_discoveredEmotionalWords hasnt BluRossoRosso:<> variante non scoperta.
            
            }
    
    
    } 
    
    {
        - nest_blueYellowWords ^ nest_discoveredEmotionalWords == ():
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
                - nest_blueYellowWords ^ nest_discoveredEmotionalWords has BluGiallo: <> caratteristiche variante uno.
                - nest_blueYellowWords ^ nest_discoveredEmotionalWords hasnt BluGiallo: <> variante non scoperta.
            }
            {    
                - nest_blueYellowWords ^ nest_discoveredEmotionalWords has BluBluGiallo:<> caratteristiche variante due.
                - nest_blueYellowWords ^ nest_discoveredEmotionalWords hasnt BluBluGiallo:<> variante non scoperta.
            }
            {    
                - nest_blueYellowWords ^ nest_discoveredEmotionalWords has BluGialloVerde:<> caratteristiche variante tre.
                - nest_blueYellowWords ^ nest_discoveredEmotionalWords hasnt BluGialloVerde:<> variante non scoperta.
            }
            {    
                - nest_blueYellowWords ^ nest_discoveredEmotionalWords has BluGialloViola: <> caratteristiche variante quattro.
                - nest_blueYellowWords ^ nest_discoveredEmotionalWords hasnt BluGialloViola: <> variante non scoperta.
            }
            {    
                - nest_blueYellowWords ^ nest_discoveredEmotionalWords has BluGialloBlu:<> caratteristiche variante cinque.
                - nest_blueYellowWords ^ nest_discoveredEmotionalWords hasnt BluGialloBlu:<> variante non scoperta.
            }
            {    
                - nest_blueYellowWords ^ nest_discoveredEmotionalWords has BluGialloGiallo:<> caratteristiche variante sei.
                - nest_blueYellowWords ^ nest_discoveredEmotionalWords hasnt BluGialloGiallo:<> variante non scoperta.
            }
            {     
                - nest_blueYellowWords ^ nest_discoveredEmotionalWords has BluGialloRosso:<> caratteristiche variante sette.
                - nest_blueYellowWords ^ nest_discoveredEmotionalWords hasnt BluGialloRosso:<> variante non scoperta.
            
            }
    
    
    } 
    {
        - nest_blueGreenWords ^ nest_discoveredEmotionalWords == ():
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
                - nest_blueGreenWords ^ nest_discoveredEmotionalWords has BluVerde: <> caratteristiche variante uno.
                - nest_blueGreenWords ^ nest_discoveredEmotionalWords hasnt BluVerde: <> variante non scoperta.
            }
            {    
                - nest_blueGreenWords ^ nest_discoveredEmotionalWords has BluBluVerde:<> caratteristiche variante due.
                - nest_blueGreenWords ^ nest_discoveredEmotionalWords hasnt BluBluVerde:<> variante non scoperta.
            }
            {    
                - nest_blueGreenWords ^ nest_discoveredEmotionalWords has BluVerdeVerde:<> caratteristiche variante tre.
                - nest_blueGreenWords ^ nest_discoveredEmotionalWords hasnt BluVerdeVerde:<> variante non scoperta.
            }
            {    
                - nest_blueGreenWords ^ nest_discoveredEmotionalWords has BluVerdeViola: <> caratteristiche variante quattro.
                - nest_blueGreenWords ^ nest_discoveredEmotionalWords hasnt BluVerdeViola: <> variante non scoperta.
            }
            {    
                - nest_blueGreenWords ^ nest_discoveredEmotionalWords has BluVerdeBlu:<> caratteristiche variante cinque.
                - nest_blueGreenWords ^ nest_discoveredEmotionalWords hasnt BluVerdeBlu:<> variante non scoperta.
            }
            {    
                - nest_blueGreenWords ^ nest_discoveredEmotionalWords has BluVerdeGiallo:<> caratteristiche variante sei.
                - nest_blueGreenWords ^ nest_discoveredEmotionalWords hasnt BluVerdeGiallo:<> variante non scoperta.
            }
            {     
                - nest_blueGreenWords ^ nest_discoveredEmotionalWords has BluVerdeRosso:<> caratteristiche variante sette.
                - nest_blueGreenWords ^ nest_discoveredEmotionalWords hasnt BluVerdeRosso:<> variante non scoperta.
            
            }
    
    
    } 
    
    {
        - nest_bluePurpleWords ^ nest_discoveredEmotionalWords == ():
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
                - nest_bluePurpleWords ^ nest_discoveredEmotionalWords has BluViola: <> caratteristiche variante uno.
                - nest_bluePurpleWords ^ nest_discoveredEmotionalWords hasnt BluViola: <> variante non scoperta.
            }
            {    
                - nest_bluePurpleWords ^ nest_discoveredEmotionalWords has BluBluViola:<> caratteristiche variante due.
                - nest_bluePurpleWords ^ nest_discoveredEmotionalWords hasnt BluBluViola:<> variante non scoperta.
            }
            {    
                - nest_bluePurpleWords ^ nest_discoveredEmotionalWords has BluViolaVerde:<> caratteristiche variante tre.
                - nest_bluePurpleWords ^ nest_discoveredEmotionalWords hasnt BluViolaVerde:<> variante non scoperta.
            }
            {    
                - nest_bluePurpleWords ^ nest_discoveredEmotionalWords has BluViolaViola: <> caratteristiche variante quattro.
                - nest_bluePurpleWords ^ nest_discoveredEmotionalWords hasnt BluViolaViola: <> variante non scoperta.
            }
            {    
                - nest_bluePurpleWords ^ nest_discoveredEmotionalWords has BluViolaBlu:<> caratteristiche variante cinque.
                - nest_bluePurpleWords ^ nest_discoveredEmotionalWords hasnt BluViolaBlu:<> variante non scoperta.
            }
            {    
                - nest_bluePurpleWords ^ nest_discoveredEmotionalWords has BluViolaGiallo:<> caratteristiche variante sei.
                - nest_bluePurpleWords ^ nest_discoveredEmotionalWords hasnt BluViolaGiallo:<> variante non scoperta.
            }
            {     
                - nest_bluePurpleWords ^ nest_discoveredEmotionalWords has BluViolaRosso:<> caratteristiche variante sette.
                - nest_bluePurpleWords ^ nest_discoveredEmotionalWords hasnt BluViolaRosso:<> variante non scoperta.
            
            }
    
    
    } 




//Varianti a dominante Verde
    {
        - nest_greenRedWords ^ nest_discoveredEmotionalWords == ():
            <i>La diciottesima parola non è stata ancora scoperta.
            
        - else:
            <b>Parola VerdeRossa.</b>
            <> Caratteristiche generali.
            {
                - LIST_COUNT(nest_greenRedWords ^ usedEmotionaWords) > 0: <> prima info.
            }
            {    
                - LIST_COUNT(nest_greenRedWords ^ usedEmotionaWords) > 1: <> seconda info.
            }
            {    
                - LIST_COUNT(nest_greenRedWords ^ usedEmotionaWords) > 2: <> terza info.
            }
            
            {
                - nest_greenRedWords ^ nest_discoveredEmotionalWords has VerdeRosso: <> caratteristiche variante uno.
                - nest_greenRedWords ^ nest_discoveredEmotionalWords hasnt VerdeRosso: <> variante non scoperta.
            }
            {    
                - nest_greenRedWords ^ nest_discoveredEmotionalWords has VerdeVerdeRosso:<> caratteristiche variante due.
                - nest_greenRedWords ^ nest_discoveredEmotionalWords hasnt VerdeVerdeRosso:<> variante non scoperta.
            }
            {    
                - nest_greenRedWords ^ nest_discoveredEmotionalWords has VerdeRossoVerde:<> caratteristiche variante tre.
                - nest_greenRedWords ^ nest_discoveredEmotionalWords hasnt VerdeRossoVerde:<> variante non scoperta.
            }
            {    
                - nest_greenRedWords ^ nest_discoveredEmotionalWords has VerdeRossoViola: <> caratteristiche variante quattro.
                - nest_greenRedWords ^ nest_discoveredEmotionalWords hasnt VerdeRossoViola: <> variante non scoperta.
            }
            {    
                - nest_greenRedWords ^ nest_discoveredEmotionalWords has VerdeRossoBlu:<> caratteristiche variante cinque.
                - nest_greenRedWords ^ nest_discoveredEmotionalWords hasnt VerdeRossoBlu:<> variante non scoperta.
            }
            {    
                - nest_greenRedWords ^ nest_discoveredEmotionalWords has VerdeRossoGiallo:<> caratteristiche variante sei.
                - nest_greenRedWords ^ nest_discoveredEmotionalWords hasnt VerdeRossoGiallo:<> variante non scoperta.
            }
            {     
                - nest_greenRedWords ^ nest_discoveredEmotionalWords has VerdeRossoRosso:<> caratteristiche variante sette.
                - nest_greenRedWords ^ nest_discoveredEmotionalWords hasnt VerdeRossoRosso:<> variante non scoperta.
            
            }
    
    
    } 
    
    {
        - nest_greenYellowWords ^ nest_discoveredEmotionalWords == ():
            <i>La diciannovesima parola non è stata ancora scoperta.
            
        - else:
            <b>Parola VerdeGialla.</b>
            <> Caratteristiche generali.
            {
                - LIST_COUNT(nest_greenYellowWords ^ usedEmotionaWords) > 0: <> prima info.
            }
            {    
                - LIST_COUNT(nest_greenYellowWords ^ usedEmotionaWords) > 1: <> seconda info.
            }
            {    
                - LIST_COUNT(nest_greenYellowWords ^ usedEmotionaWords) > 2: <> terza info.
            }
            
            {
                - nest_greenYellowWords ^ nest_discoveredEmotionalWords has VerdeGiallo: <> caratteristiche variante uno.
                - nest_greenYellowWords ^ nest_discoveredEmotionalWords hasnt VerdeGiallo: <> variante non scoperta.
            }
            {    
                - nest_greenYellowWords ^ nest_discoveredEmotionalWords has VerdeVerdeGiallo:<> caratteristiche variante due.
                - nest_greenYellowWords ^ nest_discoveredEmotionalWords hasnt VerdeVerdeGiallo:<> variante non scoperta.
            }
            {    
                - nest_greenYellowWords ^ nest_discoveredEmotionalWords has VerdeGialloVerde:<> caratteristiche variante tre.
                - nest_greenYellowWords ^ nest_discoveredEmotionalWords hasnt VerdeGialloVerde:<> variante non scoperta.
            }
            {    
                - nest_greenYellowWords ^ nest_discoveredEmotionalWords has VerdeGialloViola: <> caratteristiche variante quattro.
                - nest_greenYellowWords ^ nest_discoveredEmotionalWords hasnt VerdeGialloViola: <> variante non scoperta.
            }
            {    
                - nest_greenYellowWords ^ nest_discoveredEmotionalWords has VerdeGialloBlu:<> caratteristiche variante cinque.
                - nest_greenYellowWords ^ nest_discoveredEmotionalWords hasnt VerdeGialloBlu:<> variante non scoperta.
            }
            {    
                - nest_greenYellowWords ^ nest_discoveredEmotionalWords has VerdeGialloGiallo:<> caratteristiche variante sei.
                - nest_greenYellowWords ^ nest_discoveredEmotionalWords hasnt VerdeGialloGiallo:<> variante non scoperta.
            }
            {     
                - nest_greenYellowWords ^ nest_discoveredEmotionalWords has VerdeGialloRosso:<> caratteristiche variante sette.
                - nest_greenYellowWords ^ nest_discoveredEmotionalWords hasnt VerdeGialloRosso:<> variante non scoperta.
            
            }
    
    
    } 
    {
        - nest_greenBlueWords ^ nest_discoveredEmotionalWords == ():
            <i>La ventesima parola non è stata ancora scoperta.
            
        - else:
            <b>Parola VerdeBlu.</b>
            <> Caratteristiche generali.
            {
                - LIST_COUNT(nest_greenBlueWords ^ usedEmotionaWords) > 0: <> prima info.
            }
            {    
                - LIST_COUNT(nest_greenBlueWords ^ usedEmotionaWords) > 1: <> seconda info.
            }
            {    
                - LIST_COUNT(nest_greenBlueWords ^ usedEmotionaWords) > 2: <> terza info.
            }
            
            {
                - nest_greenBlueWords ^ nest_discoveredEmotionalWords has VerdeBlu: <> caratteristiche variante uno.
                - nest_greenBlueWords ^ nest_discoveredEmotionalWords hasnt VerdeBlu: <> variante non scoperta.
            }
            {    
                - nest_greenBlueWords ^ nest_discoveredEmotionalWords has VerdeVerdeBlu:<> caratteristiche variante due.
                - nest_greenBlueWords ^ nest_discoveredEmotionalWords hasnt VerdeVerdeBlu:<> variante non scoperta.
            }
            {    
                - nest_greenBlueWords ^ nest_discoveredEmotionalWords has VerdeBluVerde:<> caratteristiche variante tre.
                - nest_greenBlueWords ^ nest_discoveredEmotionalWords hasnt VerdeBluVerde:<> variante non scoperta.
            }
            {    
                - nest_greenBlueWords ^ nest_discoveredEmotionalWords has VerdeBluViola: <> caratteristiche variante quattro.
                - nest_greenBlueWords ^ nest_discoveredEmotionalWords hasnt VerdeBluViola: <> variante non scoperta.
            }
            {    
                - nest_greenBlueWords ^ nest_discoveredEmotionalWords has VerdeBluBlu:<> caratteristiche variante cinque.
                - nest_greenBlueWords ^ nest_discoveredEmotionalWords hasnt VerdeBluBlu:<> variante non scoperta.
            }
            {    
                - nest_greenBlueWords ^ nest_discoveredEmotionalWords has VerdeBluGiallo:<> caratteristiche variante sei.
                - nest_greenBlueWords ^ nest_discoveredEmotionalWords hasnt VerdeBluGiallo:<> variante non scoperta.
            }
            {     
                - nest_greenBlueWords ^ nest_discoveredEmotionalWords has VerdeBluRosso:<> caratteristiche variante sette.
                - nest_greenBlueWords ^ nest_discoveredEmotionalWords hasnt VerdeBluRosso:<> variante non scoperta.
            
            }
    
    
    } 
    
    {
        - nest_greenPurpleWords ^ nest_discoveredEmotionalWords == ():
            <i>La ventunesima parola non è stata ancora scoperta.
            
        - else:
            <b>Parola VerdeViola.</b>
            <> Caratteristiche generali.
            {
                - LIST_COUNT(nest_greenPurpleWords ^ usedEmotionaWords) > 0: <> prima info.
            }
            {    
                - LIST_COUNT(nest_greenPurpleWords ^ usedEmotionaWords) > 1: <> seconda info.
            }
            {    
                - LIST_COUNT(nest_greenPurpleWords ^ usedEmotionaWords) > 2: <> terza info.
            }
            
            {
                - nest_greenPurpleWords ^ nest_discoveredEmotionalWords has VerdeViola: <> caratteristiche variante uno.
                - nest_greenPurpleWords ^ nest_discoveredEmotionalWords hasnt VerdeViola: <> variante non scoperta.
            }
            {    
                - nest_greenPurpleWords ^ nest_discoveredEmotionalWords has VerdeVerdeViola:<> caratteristiche variante due.
                - nest_greenPurpleWords ^ nest_discoveredEmotionalWords hasnt VerdeVerdeViola:<> variante non scoperta.
            }
            {    
                - nest_greenPurpleWords ^ nest_discoveredEmotionalWords has VerdeViolaVerde:<> caratteristiche variante tre.
                - nest_greenPurpleWords ^ nest_discoveredEmotionalWords hasnt VerdeViolaVerde:<> variante non scoperta.
            }
            {    
                - nest_greenPurpleWords ^ nest_discoveredEmotionalWords has VerdeViolaViola: <> caratteristiche variante quattro.
                - nest_greenPurpleWords ^ nest_discoveredEmotionalWords hasnt VerdeViolaViola: <> variante non scoperta.
            }
            {    
                - nest_greenPurpleWords ^ nest_discoveredEmotionalWords has VerdeViolaBlu:<> caratteristiche variante cinque.
                - nest_greenPurpleWords ^ nest_discoveredEmotionalWords hasnt VerdeViolaBlu:<> variante non scoperta.
            }
            {    
                - nest_greenPurpleWords ^ nest_discoveredEmotionalWords has VerdeViolaGiallo:<> caratteristiche variante sei.
                - nest_greenPurpleWords ^ nest_discoveredEmotionalWords hasnt VerdeViolaGiallo:<> variante non scoperta.
            }
            {     
                - nest_greenPurpleWords ^ nest_discoveredEmotionalWords has VerdeViolaRosso:<> caratteristiche variante sette.
                - nest_greenPurpleWords ^ nest_discoveredEmotionalWords hasnt VerdeViolaRosso:<> variante non scoperta.
            
            }
    
    
    } 



//Varianti a dominante Viola
    {
        - nest_purpleRedWords ^ nest_discoveredEmotionalWords == ():
            <i>La ventiduesima parola non è stata ancora scoperta.
            
        - else:
            <b>Parola ViolaRossa.</b>
            <> Caratteristiche generali.
            {
                - LIST_COUNT(nest_purpleRedWords ^ usedEmotionaWords) > 0: <> prima info.
            }
            {    
                - LIST_COUNT(nest_purpleRedWords ^ usedEmotionaWords) > 1: <> seconda info.
            }
            {    
                - LIST_COUNT(nest_purpleRedWords ^ usedEmotionaWords) > 2: <> terza info.
            }
            
            {
                - nest_purpleRedWords ^ nest_discoveredEmotionalWords has ViolaRosso: <> caratteristiche variante uno.
                - nest_purpleRedWords ^ nest_discoveredEmotionalWords hasnt ViolaRosso: <> variante non scoperta.
            }
            {    
                - nest_purpleRedWords ^ nest_discoveredEmotionalWords has ViolaViolaRosso:<> caratteristiche variante due.
                - nest_purpleRedWords ^ nest_discoveredEmotionalWords hasnt ViolaViolaRosso:<> variante non scoperta.
            }
            {    
                - nest_purpleRedWords ^ nest_discoveredEmotionalWords has ViolaRossoVerde:<> caratteristiche variante tre.
                - nest_purpleRedWords ^ nest_discoveredEmotionalWords hasnt ViolaRossoVerde:<> variante non scoperta.
            }
            {    
                - nest_purpleRedWords ^ nest_discoveredEmotionalWords has ViolaRossoViola: <> caratteristiche variante quattro.
                - nest_purpleRedWords ^ nest_discoveredEmotionalWords hasnt ViolaRossoViola: <> variante non scoperta.
            }
            {    
                - nest_purpleRedWords ^ nest_discoveredEmotionalWords has ViolaRossoBlu:<> caratteristiche variante cinque.
                - nest_purpleRedWords ^ nest_discoveredEmotionalWords hasnt ViolaRossoBlu:<> variante non scoperta.
            }
            {    
                - nest_purpleRedWords ^ nest_discoveredEmotionalWords has ViolaRossoGiallo:<> caratteristiche variante sei.
                - nest_purpleRedWords ^ nest_discoveredEmotionalWords hasnt ViolaRossoGiallo:<> variante non scoperta.
            }
            {     
                - nest_purpleRedWords ^ nest_discoveredEmotionalWords has ViolaRossoRosso:<> caratteristiche variante sette.
                - nest_purpleRedWords ^ nest_discoveredEmotionalWords hasnt ViolaRossoRosso:<> variante non scoperta.
            
            }
    
    
    } 
    
    {
        - nest_purpleYellowWords ^ nest_discoveredEmotionalWords == ():
            <i>La ventitreesima parola non è stata ancora scoperta.
            
        - else:
            <b>Parola ViolaGiallo.</b>
            <> Caratteristiche generali.
            {
                - LIST_COUNT(nest_purpleYellowWords ^ usedEmotionaWords) > 0: <> prima info.
            }
            {    
                - LIST_COUNT(nest_purpleYellowWords ^ usedEmotionaWords) > 1: <> seconda info.
            }
            {    
                - LIST_COUNT(nest_purpleYellowWords ^ usedEmotionaWords) > 2: <> terza info.
            }
            
            {
                - nest_purpleYellowWords ^ nest_discoveredEmotionalWords has ViolaGiallo: <> caratteristiche variante uno.
                - nest_purpleYellowWords ^ nest_discoveredEmotionalWords hasnt ViolaGiallo: <> variante non scoperta.
            }
            {    
                - nest_purpleYellowWords ^ nest_discoveredEmotionalWords has ViolaViolaGiallo:<> caratteristiche variante due.
                - nest_purpleYellowWords ^ nest_discoveredEmotionalWords hasnt ViolaViolaGiallo:<> variante non scoperta.
            }
            {    
                - nest_purpleYellowWords ^ nest_discoveredEmotionalWords has ViolaGialloVerde:<> caratteristiche variante tre.
                - nest_purpleYellowWords ^ nest_discoveredEmotionalWords hasnt ViolaGialloVerde:<> variante non scoperta.
            }
            {    
                - nest_purpleYellowWords ^ nest_discoveredEmotionalWords has ViolaGialloViola: <> caratteristiche variante quattro.
                - nest_purpleYellowWords ^ nest_discoveredEmotionalWords hasnt ViolaGialloViola: <> variante non scoperta.
            }
            {    
                - nest_purpleYellowWords ^ nest_discoveredEmotionalWords has ViolaGialloBlu:<> caratteristiche variante cinque.
                - nest_purpleYellowWords ^ nest_discoveredEmotionalWords hasnt ViolaGialloBlu:<> variante non scoperta.
            }
            {    
                - nest_purpleYellowWords ^ nest_discoveredEmotionalWords has ViolaGialloGiallo:<> caratteristiche variante sei.
                - nest_purpleYellowWords ^ nest_discoveredEmotionalWords hasnt ViolaGialloGiallo:<> variante non scoperta.
            }
            {     
                - nest_purpleYellowWords ^ nest_discoveredEmotionalWords has ViolaGialloRosso:<> caratteristiche variante sette.
                - nest_purpleYellowWords ^ nest_discoveredEmotionalWords hasnt ViolaGialloRosso:<> variante non scoperta.
            
            }
    
    
    } 
    {
        - nest_purpleBlueWords ^ nest_discoveredEmotionalWords == ():
            <i>La ventiquattresima parola non è stata ancora scoperta.
            
        - else:
            <b>Parola ViolaBlu.</b>
            <> Caratteristiche generali.
            {
                - LIST_COUNT(nest_purpleBlueWords ^ usedEmotionaWords) > 0: <> prima info.
            }
            {    
                - LIST_COUNT(nest_purpleBlueWords ^ usedEmotionaWords) > 1: <> seconda info.
            }
            {    
                - LIST_COUNT(nest_purpleBlueWords ^ usedEmotionaWords) > 2: <> terza info.
            }
            
            {
                - nest_purpleBlueWords ^ nest_discoveredEmotionalWords has ViolaBlu: <> caratteristiche variante uno.
                - nest_purpleBlueWords ^ nest_discoveredEmotionalWords hasnt ViolaBlu: <> variante non scoperta.
            }
            {    
                - nest_purpleBlueWords ^ nest_discoveredEmotionalWords has ViolaViolaBlu:<> caratteristiche variante due.
                - nest_purpleBlueWords ^ nest_discoveredEmotionalWords hasnt ViolaViolaBlu:<> variante non scoperta.
            }
            {    
                - nest_purpleBlueWords ^ nest_discoveredEmotionalWords has ViolaBluVerde:<> caratteristiche variante tre.
                - nest_purpleBlueWords ^ nest_discoveredEmotionalWords hasnt ViolaBluVerde:<> variante non scoperta.
            }
            {    
                - nest_purpleBlueWords ^ nest_discoveredEmotionalWords has ViolaBluViola: <> caratteristiche variante quattro.
                - nest_purpleBlueWords ^ nest_discoveredEmotionalWords hasnt ViolaBluViola: <> variante non scoperta.
            }
            {    
                - nest_purpleBlueWords ^ nest_discoveredEmotionalWords has ViolaBluBlu:<> caratteristiche variante cinque.
                - nest_purpleBlueWords ^ nest_discoveredEmotionalWords hasnt ViolaBluBlu:<> variante non scoperta.
            }
            {    
                - nest_purpleBlueWords ^ nest_discoveredEmotionalWords has ViolaBluGiallo:<> caratteristiche variante sei.
                - nest_purpleBlueWords ^ nest_discoveredEmotionalWords hasnt ViolaBluGiallo:<> variante non scoperta.
            }
            {     
                - nest_purpleBlueWords ^ nest_discoveredEmotionalWords has ViolaBluRosso:<> caratteristiche variante sette.
                - nest_purpleBlueWords ^ nest_discoveredEmotionalWords hasnt ViolaBluRosso:<> variante non scoperta.
            
            }
    
    
    } 
    
    {
        - nest_purpleGreenWords ^ nest_discoveredEmotionalWords == ():
            <i>La venticinquesima parola non è stata ancora scoperta.
            
        - else:
            <b>Parola ViolaVerde.</b>
            <> Caratteristiche generali.
            {
                - LIST_COUNT(nest_purpleGreenWords ^ usedEmotionaWords) > 0: <> prima info.
            }
            {    
                - LIST_COUNT(nest_purpleGreenWords ^ usedEmotionaWords) > 1: <> seconda info.
            }
            {    
                - LIST_COUNT(nest_purpleGreenWords ^ usedEmotionaWords) > 2: <> terza info.
            }
            
            {
                - nest_purpleGreenWords ^ nest_discoveredEmotionalWords has ViolaVerde: <> caratteristiche variante uno.
                - nest_purpleGreenWords ^ nest_discoveredEmotionalWords hasnt ViolaVerde: <> variante non scoperta.
            }
            {    
                - nest_purpleGreenWords ^ nest_discoveredEmotionalWords has ViolaViolaVerde:<> caratteristiche variante due.
                - nest_purpleGreenWords ^ nest_discoveredEmotionalWords hasnt ViolaViolaVerde:<> variante non scoperta.
            }
            {    
                - nest_purpleGreenWords ^ nest_discoveredEmotionalWords has ViolaVerdeVerde:<> caratteristiche variante tre.
                - nest_purpleGreenWords ^ nest_discoveredEmotionalWords hasnt ViolaVerdeVerde:<> variante non scoperta.
            }
            {    
                - nest_purpleGreenWords ^ nest_discoveredEmotionalWords has ViolaVerdeViola: <> caratteristiche variante quattro.
                - nest_purpleGreenWords ^ nest_discoveredEmotionalWords hasnt ViolaVerdeViola: <> variante non scoperta.
            }
            {    
                - nest_purpleGreenWords ^ nest_discoveredEmotionalWords has ViolaVerdeBlu:<> caratteristiche variante cinque.
                - nest_purpleGreenWords ^ nest_discoveredEmotionalWords hasnt ViolaVerdeBlu:<> variante non scoperta.
            }
            {    
                - nest_purpleGreenWords ^ nest_discoveredEmotionalWords has ViolaVerdeGiallo:<> caratteristiche variante sei.
                - nest_purpleGreenWords ^ nest_discoveredEmotionalWords hasnt ViolaVerdeGiallo:<> variante non scoperta.
            }
            {     
                - nest_purpleGreenWords ^ nest_discoveredEmotionalWords has ViolaVerdeRosso:<> caratteristiche variante sette.
                - nest_purpleGreenWords ^ nest_discoveredEmotionalWords hasnt ViolaVerdeRosso:<> variante non scoperta.
            
            }
    
    
    } 
-> rewriter_book_with_flow
