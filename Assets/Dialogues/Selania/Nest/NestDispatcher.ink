=== emotional_words_dispatcher
//Qui è dove le scelte vengono combinate
{nestDebug: passo per emotional_words_generator.}
//Qui abbiamo il primo dispatcher, che ci manda a dei sottonodi di assegnazione, così da non avere dei blocconi giganteschi di roba
{
    - firstKeyColour == redKey:
        -> redDispatcher
        
    - firstKeyColour == yellowKey:
        -> yellowDispatcher
        
    - firstKeyColour == blueKey:
        -> blueDispatcher
        
    - firstKeyColour == greenKey:
        -> greenDispatcher
        
    - firstKeyColour == purpleKey:
        -> purpleDispatcher
}


    = redDispatcher
    {nestDebug: il primo colore è {firstKeyColour} passo per emotional_words_generator.redDispatcher.}
    
        {
            - secondKeyColour == red:
                {
                    - thirdKeyColour == red:
                        ~ newlyDiscoveredEmotionalWord = RossoRossoRosso
                    - thirdKeyColour == yellow:
                        ~ newlyDiscoveredEmotionalWord = RossoRossoGiallo
                    - thirdKeyColour == blue:
                        ~ newlyDiscoveredEmotionalWord = RossoRossoBlu
                    - thirdKeyColour == green:
                        ~ newlyDiscoveredEmotionalWord = RossoRossoVerde
                    - thirdKeyColour == purple:
                        ~ newlyDiscoveredEmotionalWord = RossoRossoViola
                    - else:
                       ~ newlyDiscoveredEmotionalWord = RossoRosso
                }
            
            - secondKeyColour == yellow:
                {
                    - thirdKeyColour == red:
                        ~ newlyDiscoveredEmotionalWord = RossoGialloRosso
                    - thirdKeyColour == yellow:
                        ~ newlyDiscoveredEmotionalWord = RossoGialloGiallo
                    - thirdKeyColour == blue:
                        ~ newlyDiscoveredEmotionalWord = RossoGialloBlu
                    - thirdKeyColour == green:
                        ~ newlyDiscoveredEmotionalWord = RossoGialloVerde
                    - thirdKeyColour == purple:
                        ~ newlyDiscoveredEmotionalWord = RossoGialloViola
                    - else:
                       ~ newlyDiscoveredEmotionalWord = RossoGiallo
                }
            
            - secondKeyColour == blue:
                {
                    - thirdKeyColour == red:
                        ~ newlyDiscoveredEmotionalWord = RossoBluRosso
                    - thirdKeyColour == yellow:
                        ~ newlyDiscoveredEmotionalWord = RossoBluGiallo
                    - thirdKeyColour == blue:
                        ~ newlyDiscoveredEmotionalWord = RossoBluBlu
                    - thirdKeyColour == green:
                        ~ newlyDiscoveredEmotionalWord = RossoBluVerde
                    - thirdKeyColour == purple:
                        ~ newlyDiscoveredEmotionalWord = RossoBluViola
                    - else:
                       ~ newlyDiscoveredEmotionalWord = RossoBlu
                }
            
            - secondKeyColour == green:
                {
                    - thirdKeyColour == red:
                        ~ newlyDiscoveredEmotionalWord = RossoVerdeRosso
                    - thirdKeyColour == yellow:
                        ~ newlyDiscoveredEmotionalWord = RossoVerdeGiallo
                    - thirdKeyColour == blue:
                        ~ newlyDiscoveredEmotionalWord = RossoVerdeBlu
                    - thirdKeyColour == green:
                        ~ newlyDiscoveredEmotionalWord = RossoVerdeVerde
                    - thirdKeyColour == purple:
                        ~ newlyDiscoveredEmotionalWord = RossoVerdeViola
                    - else:
                       ~ newlyDiscoveredEmotionalWord = RossoVerde
                }
            
            - secondKeyColour == purple:
                {
                    - thirdKeyColour == red:
                        ~ newlyDiscoveredEmotionalWord = RossoViolaRosso
                    - thirdKeyColour == yellow:
                        ~ newlyDiscoveredEmotionalWord = RossoViolaGiallo
                    - thirdKeyColour == blue:
                        ~ newlyDiscoveredEmotionalWord = RossoViolaBlu
                    - thirdKeyColour == green:
                        ~ newlyDiscoveredEmotionalWord = RossoViolaVerde
                    - thirdKeyColour == purple:
                        ~ newlyDiscoveredEmotionalWord = RossoViolaViola
                    - else:
                       ~ newlyDiscoveredEmotionalWord = RossoViola
                }
            
            - else:
                ~ newlyDiscoveredEmotionalWord = Rosso
        }
        ->->

    = yellowDispatcher
    {nestDebug: il primo colore è {firstKeyColour} passo per emotional_words_generator.yellowDispatcher.}
    
        {
            - secondKeyColour == red:
                {
                    - thirdKeyColour == red:
                        ~ newlyDiscoveredEmotionalWord = GialloRossoRosso
                    - thirdKeyColour == yellow:
                        ~ newlyDiscoveredEmotionalWord = GialloRossoGiallo
                    - thirdKeyColour == blue:
                        ~ newlyDiscoveredEmotionalWord = GialloRossoBlu
                    - thirdKeyColour == green:
                        ~ newlyDiscoveredEmotionalWord = GialloRossoVerde
                    - thirdKeyColour == purple:
                        ~ newlyDiscoveredEmotionalWord = GialloRossoViola
                    - else:
                       ~ newlyDiscoveredEmotionalWord = GialloRosso
                }
            
            - secondKeyColour == yellow:
                {
                    - thirdKeyColour == red:
                        ~ newlyDiscoveredEmotionalWord = GialloGialloRosso
                    - thirdKeyColour == yellow:
                        ~ newlyDiscoveredEmotionalWord = GialloGialloGiallo
                    - thirdKeyColour == blue:
                        ~ newlyDiscoveredEmotionalWord = GialloGialloBlu
                    - thirdKeyColour == green:
                        ~ newlyDiscoveredEmotionalWord = GialloGialloVerde
                    - thirdKeyColour == purple:
                        ~ newlyDiscoveredEmotionalWord = GialloGialloViola
                    - else:
                       ~ newlyDiscoveredEmotionalWord = GialloGiallo
                }
            
            - secondKeyColour == blue:
                {
                    - thirdKeyColour == red:
                        ~ newlyDiscoveredEmotionalWord = GialloBluRosso
                    - thirdKeyColour == yellow:
                        ~ newlyDiscoveredEmotionalWord = GialloBluGiallo
                    - thirdKeyColour == blue:
                        ~ newlyDiscoveredEmotionalWord = GialloBluBlu
                    - thirdKeyColour == green:
                        ~ newlyDiscoveredEmotionalWord = GialloBluVerde
                    - thirdKeyColour == purple:
                        ~ newlyDiscoveredEmotionalWord = GialloBluViola
                    - else:
                       ~ newlyDiscoveredEmotionalWord = GialloBlu
                }
            
            - secondKeyColour == green:
                {
                    - thirdKeyColour == red:
                        ~ newlyDiscoveredEmotionalWord = GialloVerdeRosso
                    - thirdKeyColour == yellow:
                        ~ newlyDiscoveredEmotionalWord = GialloVerdeGiallo
                    - thirdKeyColour == blue:
                        ~ newlyDiscoveredEmotionalWord = GialloVerdeBlu
                    - thirdKeyColour == green:
                        ~ newlyDiscoveredEmotionalWord = GialloVerdeVerde
                    - thirdKeyColour == purple:
                        ~ newlyDiscoveredEmotionalWord = GialloVerdeViola
                    - else:
                       ~ newlyDiscoveredEmotionalWord = GialloVerde
                }
            
            - secondKeyColour == purple:
                {
                    - thirdKeyColour == red:
                        ~ newlyDiscoveredEmotionalWord = GialloViolaRosso
                    - thirdKeyColour == yellow:
                        ~ newlyDiscoveredEmotionalWord = GialloViolaGiallo
                    - thirdKeyColour == blue:
                        ~ newlyDiscoveredEmotionalWord = GialloViolaBlu
                    - thirdKeyColour == green:
                        ~ newlyDiscoveredEmotionalWord = GialloViolaVerde
                    - thirdKeyColour == purple:
                        ~ newlyDiscoveredEmotionalWord = GialloViolaViola
                    - else:
                       ~ newlyDiscoveredEmotionalWord = GialloViola
                }
            
            - else:
                ~ newlyDiscoveredEmotionalWord = Giallo
        }
        ->->
    
    = blueDispatcher
    {nestDebug: il primo colore è {firstKeyColour} passo per emotional_words_generator.blueDispatcher.}
    
              {
            - secondKeyColour == red:
                {
                    - thirdKeyColour == red:
                        ~ newlyDiscoveredEmotionalWord = BluRossoRosso
                    - thirdKeyColour == yellow:
                        ~ newlyDiscoveredEmotionalWord = BluRossoGiallo
                    - thirdKeyColour == blue:
                        ~ newlyDiscoveredEmotionalWord = BluRossoBlu
                    - thirdKeyColour == green:
                        ~ newlyDiscoveredEmotionalWord = BluRossoVerde
                    - thirdKeyColour == purple:
                        ~ newlyDiscoveredEmotionalWord = BluRossoViola
                    - else:
                       ~ newlyDiscoveredEmotionalWord = BluRosso
                }
            
            - secondKeyColour == yellow:
                {
                    - thirdKeyColour == red:
                        ~ newlyDiscoveredEmotionalWord = BluGialloRosso
                    - thirdKeyColour == yellow:
                        ~ newlyDiscoveredEmotionalWord = BluGialloGiallo
                    - thirdKeyColour == blue:
                        ~ newlyDiscoveredEmotionalWord = BluGialloBlu
                    - thirdKeyColour == green:
                        ~ newlyDiscoveredEmotionalWord = BluGialloVerde
                    - thirdKeyColour == purple:
                        ~ newlyDiscoveredEmotionalWord = BluGialloViola
                    - else:
                       ~ newlyDiscoveredEmotionalWord = BluGiallo
                }
            
            - secondKeyColour == blue:
                {
                    - thirdKeyColour == red:
                        ~ newlyDiscoveredEmotionalWord = BluBluRosso
                    - thirdKeyColour == yellow:
                        ~ newlyDiscoveredEmotionalWord = BluBluGiallo
                    - thirdKeyColour == blue:
                        ~ newlyDiscoveredEmotionalWord = BluBluBlu
                    - thirdKeyColour == green:
                        ~ newlyDiscoveredEmotionalWord = BluBluVerde
                    - thirdKeyColour == purple:
                        ~ newlyDiscoveredEmotionalWord = BluBluViola
                    - else:
                       ~ newlyDiscoveredEmotionalWord = BluBlu
                }
            
            - secondKeyColour == green:
                {
                    - thirdKeyColour == red:
                        ~ newlyDiscoveredEmotionalWord = BluVerdeRosso
                    - thirdKeyColour == yellow:
                        ~ newlyDiscoveredEmotionalWord = BluVerdeGiallo
                    - thirdKeyColour == blue:
                        ~ newlyDiscoveredEmotionalWord = BluVerdeBlu
                    - thirdKeyColour == green:
                        ~ newlyDiscoveredEmotionalWord = BluVerdeVerde
                    - thirdKeyColour == purple:
                        ~ newlyDiscoveredEmotionalWord = BluVerdeViola
                    - else:
                       ~ newlyDiscoveredEmotionalWord = BluVerde
                }
            
            - secondKeyColour == purple:
                {
                    - thirdKeyColour == red:
                        ~ newlyDiscoveredEmotionalWord = BluViolaRosso
                    - thirdKeyColour == yellow:
                        ~ newlyDiscoveredEmotionalWord = BluViolaGiallo
                    - thirdKeyColour == blue:
                        ~ newlyDiscoveredEmotionalWord = BluViolaBlu
                    - thirdKeyColour == green:
                        ~ newlyDiscoveredEmotionalWord = BluViolaVerde
                    - thirdKeyColour == purple:
                        ~ newlyDiscoveredEmotionalWord = BluViolaViola
                    - else:
                       ~ newlyDiscoveredEmotionalWord = BluViola
                }
            
            - else:
                ~ newlyDiscoveredEmotionalWord = Blu
        }
        ->->
    
    = greenDispatcher
    {nestDebug: il primo colore è {firstKeyColour} passo per emotional_words_generator.greenDispatcher.}
    
        {
            - secondKeyColour == red:
                {
                    - thirdKeyColour == red:
                        ~ newlyDiscoveredEmotionalWord = VerdeRossoRosso
                    - thirdKeyColour == yellow:
                        ~ newlyDiscoveredEmotionalWord = VerdeRossoGiallo
                    - thirdKeyColour == blue:
                        ~ newlyDiscoveredEmotionalWord = VerdeRossoBlu
                    - thirdKeyColour == green:
                        ~ newlyDiscoveredEmotionalWord = VerdeRossoVerde
                    - thirdKeyColour == purple:
                        ~ newlyDiscoveredEmotionalWord = VerdeRossoViola
                    - else:
                       ~ newlyDiscoveredEmotionalWord = VerdeRosso
                }
            
            - secondKeyColour == yellow:
                {
                    - thirdKeyColour == red:
                        ~ newlyDiscoveredEmotionalWord = VerdeGialloRosso
                    - thirdKeyColour == yellow:
                        ~ newlyDiscoveredEmotionalWord = VerdeGialloGiallo
                    - thirdKeyColour == blue:
                        ~ newlyDiscoveredEmotionalWord = VerdeGialloBlu
                    - thirdKeyColour == green:
                        ~ newlyDiscoveredEmotionalWord = VerdeGialloVerde
                    - thirdKeyColour == purple:
                        ~ newlyDiscoveredEmotionalWord = VerdeGialloViola
                    - else:
                       ~ newlyDiscoveredEmotionalWord = VerdeGiallo
                }
            
            - secondKeyColour == blue:
                {
                    - thirdKeyColour == red:
                        ~ newlyDiscoveredEmotionalWord = VerdeBluRosso
                    - thirdKeyColour == yellow:
                        ~ newlyDiscoveredEmotionalWord = VerdeBluGiallo
                    - thirdKeyColour == blue:
                        ~ newlyDiscoveredEmotionalWord = VerdeBluBlu
                    - thirdKeyColour == green:
                        ~ newlyDiscoveredEmotionalWord = VerdeBluVerde
                    - thirdKeyColour == purple:
                        ~ newlyDiscoveredEmotionalWord = VerdeBluViola
                    - else:
                       ~ newlyDiscoveredEmotionalWord = VerdeBlu
                }
            
            - secondKeyColour == green:
                {
                    - thirdKeyColour == red:
                        ~ newlyDiscoveredEmotionalWord = VerdeVerdeRosso
                    - thirdKeyColour == yellow:
                        ~ newlyDiscoveredEmotionalWord = VerdeVerdeGiallo
                    - thirdKeyColour == blue:
                        ~ newlyDiscoveredEmotionalWord = VerdeVerdeBlu
                    - thirdKeyColour == green:
                        ~ newlyDiscoveredEmotionalWord = VerdeVerdeVerde
                    - thirdKeyColour == purple:
                        ~ newlyDiscoveredEmotionalWord = VerdeVerdeViola
                    - else:
                       ~ newlyDiscoveredEmotionalWord = VerdeVerde
                }
            
            - secondKeyColour == purple:
                {
                    - thirdKeyColour == red:
                        ~ newlyDiscoveredEmotionalWord = VerdeViolaRosso
                    - thirdKeyColour == yellow:
                        ~ newlyDiscoveredEmotionalWord = VerdeViolaGiallo
                    - thirdKeyColour == blue:
                        ~ newlyDiscoveredEmotionalWord = VerdeViolaBlu
                    - thirdKeyColour == green:
                        ~ newlyDiscoveredEmotionalWord = VerdeViolaVerde
                    - thirdKeyColour == purple:
                        ~ newlyDiscoveredEmotionalWord = VerdeViolaViola
                    - else:
                       ~ newlyDiscoveredEmotionalWord = VerdeViola
                }
            
            - else:
                ~ newlyDiscoveredEmotionalWord = Verde
        }
        ->->
    
    = purpleDispatcher
    {nestDebug: il primo colore è {firstKeyColour} passo per emotional_words_generator.purpleDispatcher.}
    
        {
            - secondKeyColour == red:
                {
                    - thirdKeyColour == red:
                        ~ newlyDiscoveredEmotionalWord = ViolaRossoRosso
                    - thirdKeyColour == yellow:
                        ~ newlyDiscoveredEmotionalWord = ViolaRossoGiallo
                    - thirdKeyColour == blue:
                        ~ newlyDiscoveredEmotionalWord = ViolaRossoBlu
                    - thirdKeyColour == green:
                        ~ newlyDiscoveredEmotionalWord = ViolaRossoVerde
                    - thirdKeyColour == purple:
                        ~ newlyDiscoveredEmotionalWord = ViolaRossoViola
                    - else:
                       ~ newlyDiscoveredEmotionalWord = ViolaRosso
                }
            
            - secondKeyColour == yellow:
                {
                    - thirdKeyColour == red:
                        ~ newlyDiscoveredEmotionalWord = ViolaGialloRosso
                    - thirdKeyColour == yellow:
                        ~ newlyDiscoveredEmotionalWord = ViolaGialloGiallo
                    - thirdKeyColour == blue:
                        ~ newlyDiscoveredEmotionalWord = ViolaGialloBlu
                    - thirdKeyColour == green:
                        ~ newlyDiscoveredEmotionalWord = ViolaGialloVerde
                    - thirdKeyColour == purple:
                        ~ newlyDiscoveredEmotionalWord = ViolaGialloViola
                    - else:
                       ~ newlyDiscoveredEmotionalWord = ViolaGiallo
                }
            
            - secondKeyColour == blue:
                {
                    - thirdKeyColour == red:
                        ~ newlyDiscoveredEmotionalWord = ViolaBluRosso
                    - thirdKeyColour == yellow:
                        ~ newlyDiscoveredEmotionalWord = ViolaBluGiallo
                    - thirdKeyColour == blue:
                        ~ newlyDiscoveredEmotionalWord = ViolaBluBlu
                    - thirdKeyColour == green:
                        ~ newlyDiscoveredEmotionalWord = ViolaBluVerde
                    - thirdKeyColour == purple:
                        ~ newlyDiscoveredEmotionalWord = ViolaBluViola
                    - else:
                       ~ newlyDiscoveredEmotionalWord = ViolaBlu
                }
            
            - secondKeyColour == green:
                {
                    - thirdKeyColour == red:
                        ~ newlyDiscoveredEmotionalWord = ViolaVerdeRosso
                    - thirdKeyColour == yellow:
                        ~ newlyDiscoveredEmotionalWord = ViolaVerdeGiallo
                    - thirdKeyColour == blue:
                        ~ newlyDiscoveredEmotionalWord = ViolaVerdeBlu
                    - thirdKeyColour == green:
                        ~ newlyDiscoveredEmotionalWord = ViolaVerdeVerde
                    - thirdKeyColour == purple:
                        ~ newlyDiscoveredEmotionalWord = ViolaVerdeViola
                    - else:
                       ~ newlyDiscoveredEmotionalWord = ViolaVerde
                }
            
            - secondKeyColour == purple:
                {
                    - thirdKeyColour == red:
                        ~ newlyDiscoveredEmotionalWord = ViolaViolaRosso
                    - thirdKeyColour == yellow:
                        ~ newlyDiscoveredEmotionalWord = ViolaViolaGiallo
                    - thirdKeyColour == blue:
                        ~ newlyDiscoveredEmotionalWord = ViolaViolaBlu
                    - thirdKeyColour == green:
                        ~ newlyDiscoveredEmotionalWord = ViolaViolaVerde
                    - thirdKeyColour == purple:
                        ~ newlyDiscoveredEmotionalWord = ViolaViolaViola
                    - else:
                       ~ newlyDiscoveredEmotionalWord = ViolaViola
                }
            
            - else:
                ~ newlyDiscoveredEmotionalWord = Viola
        }  
    
        ->->
