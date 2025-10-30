=== emotional_words_dispatcher
//Qui è dove le scelte vengono combinate
{nestDebug: passo per emotional_words_generator.}
{nestDebug: i valori delle tre note sono {firstKeyColour} {secondKeyColour} {thirdKeyColour}.}
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
            - secondKeyColour == redKey:
                {
                    - thirdKeyColour == redKey:
                        ~ newlyDiscoveredEmotionalWord = RossoRossoRosso
                    - thirdKeyColour == yellowKey:
                        ~ newlyDiscoveredEmotionalWord = RossoRossoGiallo
                    - thirdKeyColour == blueKey:
                        ~ newlyDiscoveredEmotionalWord = RossoRossoBlu
                    - thirdKeyColour == greenKey:
                        ~ newlyDiscoveredEmotionalWord = RossoRossoVerde
                    - thirdKeyColour == purpleKey:
                        ~ newlyDiscoveredEmotionalWord = RossoRossoViola
                    - else:
                       ~ newlyDiscoveredEmotionalWord = RossoRosso
                }
            
            - secondKeyColour == yellowKey:
                {
                    - thirdKeyColour == redKey:
                        ~ newlyDiscoveredEmotionalWord = RossoGialloRosso
                    - thirdKeyColour == yellowKey:
                        ~ newlyDiscoveredEmotionalWord = RossoGialloGiallo
                    - thirdKeyColour == blueKey:
                        ~ newlyDiscoveredEmotionalWord = RossoGialloBlu
                    - thirdKeyColour == greenKey:
                        ~ newlyDiscoveredEmotionalWord = RossoGialloVerde
                    - thirdKeyColour == purpleKey:
                        ~ newlyDiscoveredEmotionalWord = RossoGialloViola
                    - else:
                       ~ newlyDiscoveredEmotionalWord = RossoGiallo
                }
            
            - secondKeyColour == blueKey:
                {
                    - thirdKeyColour == redKey:
                        ~ newlyDiscoveredEmotionalWord = RossoBluRosso
                    - thirdKeyColour == yellowKey:
                        ~ newlyDiscoveredEmotionalWord = RossoBluGiallo
                    - thirdKeyColour == blueKey:
                        ~ newlyDiscoveredEmotionalWord = RossoBluBlu
                    - thirdKeyColour == greenKey:
                        ~ newlyDiscoveredEmotionalWord = RossoBluVerde
                    - thirdKeyColour == purpleKey:
                        ~ newlyDiscoveredEmotionalWord = RossoBluViola
                    - else:
                       ~ newlyDiscoveredEmotionalWord = RossoBlu
                }
            
            - secondKeyColour == greenKey:
                {
                    - thirdKeyColour == redKey:
                        ~ newlyDiscoveredEmotionalWord = RossoVerdeRosso
                    - thirdKeyColour == yellowKey:
                        ~ newlyDiscoveredEmotionalWord = RossoVerdeGiallo
                    - thirdKeyColour == blueKey:
                        ~ newlyDiscoveredEmotionalWord = RossoVerdeBlu
                    - thirdKeyColour == greenKey:
                        ~ newlyDiscoveredEmotionalWord = RossoVerdeVerde
                    - thirdKeyColour == purpleKey:
                        ~ newlyDiscoveredEmotionalWord = RossoVerdeViola
                    - else:
                       ~ newlyDiscoveredEmotionalWord = RossoVerde
                }
            
            - secondKeyColour == purpleKey:
                {
                    - thirdKeyColour == redKey:
                        ~ newlyDiscoveredEmotionalWord = RossoViolaRosso
                    - thirdKeyColour == yellowKey:
                        ~ newlyDiscoveredEmotionalWord = RossoViolaGiallo
                    - thirdKeyColour == blueKey:
                        ~ newlyDiscoveredEmotionalWord = RossoViolaBlu
                    - thirdKeyColour == greenKey:
                        ~ newlyDiscoveredEmotionalWord = RossoViolaVerde
                    - thirdKeyColour == purpleKey:
                        ~ newlyDiscoveredEmotionalWord = RossoViolaViola
                    - else:
                       ~ newlyDiscoveredEmotionalWord = RossoViola
                }
            
            - else:
                ~ newlyDiscoveredEmotionalWord = Rosso
        }
            -> emotional_words_feedback

    = yellowDispatcher
    {nestDebug: il primo colore è {firstKeyColour} passo per emotional_words_generator.yellowDispatcher.}
    
        {
            - secondKeyColour == redKey:
                {
                    - thirdKeyColour == redKey:
                        ~ newlyDiscoveredEmotionalWord = GialloRossoRosso
                    - thirdKeyColour == yellowKey:
                        ~ newlyDiscoveredEmotionalWord = GialloRossoGiallo
                    - thirdKeyColour == blueKey:
                        ~ newlyDiscoveredEmotionalWord = GialloRossoBlu
                    - thirdKeyColour == greenKey:
                        ~ newlyDiscoveredEmotionalWord = GialloRossoVerde
                    - thirdKeyColour == purpleKey:
                        ~ newlyDiscoveredEmotionalWord = GialloRossoViola
                    - else:
                       ~ newlyDiscoveredEmotionalWord = GialloRosso
                }
            
            - secondKeyColour == yellowKey:
                {
                    - thirdKeyColour == redKey:
                        ~ newlyDiscoveredEmotionalWord = GialloGialloRosso
                    - thirdKeyColour == yellowKey:
                        ~ newlyDiscoveredEmotionalWord = GialloGialloGiallo
                    - thirdKeyColour == blueKey:
                        ~ newlyDiscoveredEmotionalWord = GialloGialloBlu
                    - thirdKeyColour == greenKey:
                        ~ newlyDiscoveredEmotionalWord = GialloGialloVerde
                    - thirdKeyColour == purpleKey:
                        ~ newlyDiscoveredEmotionalWord = GialloGialloViola
                    - else:
                       ~ newlyDiscoveredEmotionalWord = GialloGiallo
                }
            
            - secondKeyColour == blueKey:
                {
                    - thirdKeyColour == redKey:
                        ~ newlyDiscoveredEmotionalWord = GialloBluRosso
                    - thirdKeyColour == yellowKey:
                        ~ newlyDiscoveredEmotionalWord = GialloBluGiallo
                    - thirdKeyColour == blueKey:
                        ~ newlyDiscoveredEmotionalWord = GialloBluBlu
                    - thirdKeyColour == greenKey:
                        ~ newlyDiscoveredEmotionalWord = GialloBluVerde
                    - thirdKeyColour == purpleKey:
                        ~ newlyDiscoveredEmotionalWord = GialloBluViola
                    - else:
                       ~ newlyDiscoveredEmotionalWord = GialloBlu
                }
            
            - secondKeyColour == greenKey:
                {
                    - thirdKeyColour == redKey:
                        ~ newlyDiscoveredEmotionalWord = GialloVerdeRosso
                    - thirdKeyColour == yellowKey:
                        ~ newlyDiscoveredEmotionalWord = GialloVerdeGiallo
                    - thirdKeyColour == blueKey:
                        ~ newlyDiscoveredEmotionalWord = GialloVerdeBlu
                    - thirdKeyColour == greenKey:
                        ~ newlyDiscoveredEmotionalWord = GialloVerdeVerde
                    - thirdKeyColour == purpleKey:
                        ~ newlyDiscoveredEmotionalWord = GialloVerdeViola
                    - else:
                       ~ newlyDiscoveredEmotionalWord = GialloVerde
                }
            
            - secondKeyColour == purpleKey:
                {
                    - thirdKeyColour == redKey:
                        ~ newlyDiscoveredEmotionalWord = GialloViolaRosso
                    - thirdKeyColour == yellowKey:
                        ~ newlyDiscoveredEmotionalWord = GialloViolaGiallo
                    - thirdKeyColour == blueKey:
                        ~ newlyDiscoveredEmotionalWord = GialloViolaBlu
                    - thirdKeyColour == greenKey:
                        ~ newlyDiscoveredEmotionalWord = GialloViolaVerde
                    - thirdKeyColour == purpleKey:
                        ~ newlyDiscoveredEmotionalWord = GialloViolaViola
                    - else:
                       ~ newlyDiscoveredEmotionalWord = GialloViola
                }
            
            - else:
                ~ newlyDiscoveredEmotionalWord = Giallo
        }
            -> emotional_words_feedback
    
    = blueDispatcher
    {nestDebug: il primo colore è {firstKeyColour} passo per emotional_words_generator.blueDispatcher.}
    
              {
            - secondKeyColour == redKey:
                {
                    - thirdKeyColour == redKey:
                        ~ newlyDiscoveredEmotionalWord = BluRossoRosso
                    - thirdKeyColour == yellowKey:
                        ~ newlyDiscoveredEmotionalWord = BluRossoGiallo
                    - thirdKeyColour == blueKey:
                        ~ newlyDiscoveredEmotionalWord = BluRossoBlu
                    - thirdKeyColour == greenKey:
                        ~ newlyDiscoveredEmotionalWord = BluRossoVerde
                    - thirdKeyColour == purpleKey:
                        ~ newlyDiscoveredEmotionalWord = BluRossoViola
                    - else:
                       ~ newlyDiscoveredEmotionalWord = BluRosso
                }
            
            - secondKeyColour == yellowKey:
                {
                    - thirdKeyColour == redKey:
                        ~ newlyDiscoveredEmotionalWord = BluGialloRosso
                    - thirdKeyColour == yellowKey:
                        ~ newlyDiscoveredEmotionalWord = BluGialloGiallo
                    - thirdKeyColour == blueKey:
                        ~ newlyDiscoveredEmotionalWord = BluGialloBlu
                    - thirdKeyColour == greenKey:
                        ~ newlyDiscoveredEmotionalWord = BluGialloVerde
                    - thirdKeyColour == purpleKey:
                        ~ newlyDiscoveredEmotionalWord = BluGialloViola
                    - else:
                       ~ newlyDiscoveredEmotionalWord = BluGiallo
                }
            
            - secondKeyColour == blueKey:
                {
                    - thirdKeyColour == redKey:
                        ~ newlyDiscoveredEmotionalWord = BluBluRosso
                    - thirdKeyColour == yellowKey:
                        ~ newlyDiscoveredEmotionalWord = BluBluGiallo
                    - thirdKeyColour == blueKey:
                        ~ newlyDiscoveredEmotionalWord = BluBluBlu
                    - thirdKeyColour == greenKey:
                        ~ newlyDiscoveredEmotionalWord = BluBluVerde
                    - thirdKeyColour == purpleKey:
                        ~ newlyDiscoveredEmotionalWord = BluBluViola
                    - else:
                       ~ newlyDiscoveredEmotionalWord = BluBlu
                }
            
            - secondKeyColour == greenKey:
                {
                    - thirdKeyColour == redKey:
                        ~ newlyDiscoveredEmotionalWord = BluVerdeRosso
                    - thirdKeyColour == yellowKey:
                        ~ newlyDiscoveredEmotionalWord = BluVerdeGiallo
                    - thirdKeyColour == blueKey:
                        ~ newlyDiscoveredEmotionalWord = BluVerdeBlu
                    - thirdKeyColour == greenKey:
                        ~ newlyDiscoveredEmotionalWord = BluVerdeVerde
                    - thirdKeyColour == purpleKey:
                        ~ newlyDiscoveredEmotionalWord = BluVerdeViola
                    - else:
                       ~ newlyDiscoveredEmotionalWord = BluVerde
                }
            
            - secondKeyColour == purpleKey:
                {
                    - thirdKeyColour == redKey:
                        ~ newlyDiscoveredEmotionalWord = BluViolaRosso
                    - thirdKeyColour == yellowKey:
                        ~ newlyDiscoveredEmotionalWord = BluViolaGiallo
                    - thirdKeyColour == blueKey:
                        ~ newlyDiscoveredEmotionalWord = BluViolaBlu
                    - thirdKeyColour == greenKey:
                        ~ newlyDiscoveredEmotionalWord = BluViolaVerde
                    - thirdKeyColour == purpleKey:
                        ~ newlyDiscoveredEmotionalWord = BluViolaViola
                    - else:
                       ~ newlyDiscoveredEmotionalWord = BluViola
                }
            
            - else:
                ~ newlyDiscoveredEmotionalWord = Blu
        }
            -> emotional_words_feedback
    
    = greenDispatcher
    {nestDebug: il primo colore è {firstKeyColour} passo per emotional_words_generator.greenDispatcher.}
    
        {
            - secondKeyColour == redKey:
                {
                    - thirdKeyColour == redKey:
                        ~ newlyDiscoveredEmotionalWord = VerdeRossoRosso
                    - thirdKeyColour == yellowKey:
                        ~ newlyDiscoveredEmotionalWord = VerdeRossoGiallo
                    - thirdKeyColour == blueKey:
                        ~ newlyDiscoveredEmotionalWord = VerdeRossoBlu
                    - thirdKeyColour == greenKey:
                        ~ newlyDiscoveredEmotionalWord = VerdeRossoVerde
                    - thirdKeyColour == purpleKey:
                        ~ newlyDiscoveredEmotionalWord = VerdeRossoViola
                    - else:
                       ~ newlyDiscoveredEmotionalWord = VerdeRosso
                }
            
            - secondKeyColour == yellowKey:
                {
                    - thirdKeyColour == redKey:
                        ~ newlyDiscoveredEmotionalWord = VerdeGialloRosso
                    - thirdKeyColour == yellowKey:
                        ~ newlyDiscoveredEmotionalWord = VerdeGialloGiallo
                    - thirdKeyColour == blueKey:
                        ~ newlyDiscoveredEmotionalWord = VerdeGialloBlu
                    - thirdKeyColour == greenKey:
                        ~ newlyDiscoveredEmotionalWord = VerdeGialloVerde
                    - thirdKeyColour == purpleKey:
                        ~ newlyDiscoveredEmotionalWord = VerdeGialloViola
                    - else:
                       ~ newlyDiscoveredEmotionalWord = VerdeGiallo
                }
            
            - secondKeyColour == blueKey:
                {
                    - thirdKeyColour == redKey:
                        ~ newlyDiscoveredEmotionalWord = VerdeBluRosso
                    - thirdKeyColour == yellowKey:
                        ~ newlyDiscoveredEmotionalWord = VerdeBluGiallo
                    - thirdKeyColour == blueKey:
                        ~ newlyDiscoveredEmotionalWord = VerdeBluBlu
                    - thirdKeyColour == greenKey:
                        ~ newlyDiscoveredEmotionalWord = VerdeBluVerde
                    - thirdKeyColour == purpleKey:
                        ~ newlyDiscoveredEmotionalWord = VerdeBluViola
                    - else:
                       ~ newlyDiscoveredEmotionalWord = VerdeBlu
                }
            
            - secondKeyColour == greenKey:
                {
                    - thirdKeyColour == redKey:
                        ~ newlyDiscoveredEmotionalWord = VerdeVerdeRosso
                    - thirdKeyColour == yellowKey:
                        ~ newlyDiscoveredEmotionalWord = VerdeVerdeGiallo
                    - thirdKeyColour == blueKey:
                        ~ newlyDiscoveredEmotionalWord = VerdeVerdeBlu
                    - thirdKeyColour == greenKey:
                        ~ newlyDiscoveredEmotionalWord = VerdeVerdeVerde
                    - thirdKeyColour == purpleKey:
                        ~ newlyDiscoveredEmotionalWord = VerdeVerdeViola
                    - else:
                       ~ newlyDiscoveredEmotionalWord = VerdeVerde
                }
            
            - secondKeyColour == purpleKey:
                {
                    - thirdKeyColour == redKey:
                        ~ newlyDiscoveredEmotionalWord = VerdeViolaRosso
                    - thirdKeyColour == yellowKey:
                        ~ newlyDiscoveredEmotionalWord = VerdeViolaGiallo
                    - thirdKeyColour == blueKey:
                        ~ newlyDiscoveredEmotionalWord = VerdeViolaBlu
                    - thirdKeyColour == greenKey:
                        ~ newlyDiscoveredEmotionalWord = VerdeViolaVerde
                    - thirdKeyColour == purpleKey:
                        ~ newlyDiscoveredEmotionalWord = VerdeViolaViola
                    - else:
                       ~ newlyDiscoveredEmotionalWord = VerdeViola
                }
            
            - else:
                ~ newlyDiscoveredEmotionalWord = Verde
        }
           -> emotional_words_feedback
    
    = purpleDispatcher
    {nestDebug: il primo colore è {firstKeyColour} passo per emotional_words_generator.purpleDispatcher.}
    
        {
            - secondKeyColour == redKey:
                {
                    - thirdKeyColour == redKey:
                        ~ newlyDiscoveredEmotionalWord = ViolaRossoRosso
                    - thirdKeyColour == yellowKey:
                        ~ newlyDiscoveredEmotionalWord = ViolaRossoGiallo
                    - thirdKeyColour == blueKey:
                        ~ newlyDiscoveredEmotionalWord = ViolaRossoBlu
                    - thirdKeyColour == greenKey:
                        ~ newlyDiscoveredEmotionalWord = ViolaRossoVerde
                    - thirdKeyColour == purpleKey:
                        ~ newlyDiscoveredEmotionalWord = ViolaRossoViola
                    - else:
                       ~ newlyDiscoveredEmotionalWord = ViolaRosso
                }
            
            - secondKeyColour == yellowKey:
                {
                    - thirdKeyColour == redKey:
                        ~ newlyDiscoveredEmotionalWord = ViolaGialloRosso
                    - thirdKeyColour == yellowKey:
                        ~ newlyDiscoveredEmotionalWord = ViolaGialloGiallo
                    - thirdKeyColour == blueKey:
                        ~ newlyDiscoveredEmotionalWord = ViolaGialloBlu
                    - thirdKeyColour == greenKey:
                        ~ newlyDiscoveredEmotionalWord = ViolaGialloVerde
                    - thirdKeyColour == purpleKey:
                        ~ newlyDiscoveredEmotionalWord = ViolaGialloViola
                    - else:
                       ~ newlyDiscoveredEmotionalWord = ViolaGiallo
                }
            
            - secondKeyColour == blueKey:
                {
                    - thirdKeyColour == redKey:
                        ~ newlyDiscoveredEmotionalWord = ViolaBluRosso
                    - thirdKeyColour == yellowKey:
                        ~ newlyDiscoveredEmotionalWord = ViolaBluGiallo
                    - thirdKeyColour == blueKey:
                        ~ newlyDiscoveredEmotionalWord = ViolaBluBlu
                    - thirdKeyColour == greenKey:
                        ~ newlyDiscoveredEmotionalWord = ViolaBluVerde
                    - thirdKeyColour == purpleKey:
                        ~ newlyDiscoveredEmotionalWord = ViolaBluViola
                    - else:
                       ~ newlyDiscoveredEmotionalWord = ViolaBlu
                }
            
            - secondKeyColour == greenKey:
                {
                    - thirdKeyColour == redKey:
                        ~ newlyDiscoveredEmotionalWord = ViolaVerdeRosso
                    - thirdKeyColour == yellowKey:
                        ~ newlyDiscoveredEmotionalWord = ViolaVerdeGiallo
                    - thirdKeyColour == blueKey:
                        ~ newlyDiscoveredEmotionalWord = ViolaVerdeBlu
                    - thirdKeyColour == greenKey:
                        ~ newlyDiscoveredEmotionalWord = ViolaVerdeVerde
                    - thirdKeyColour == purpleKey:
                        ~ newlyDiscoveredEmotionalWord = ViolaVerdeViola
                    - else:
                       ~ newlyDiscoveredEmotionalWord = ViolaVerde
                }
            
            - secondKeyColour == purpleKey:
                {
                    - thirdKeyColour == redKey:
                        ~ newlyDiscoveredEmotionalWord = ViolaViolaRosso
                    - thirdKeyColour == yellowKey:
                        ~ newlyDiscoveredEmotionalWord = ViolaViolaGiallo
                    - thirdKeyColour == blueKey:
                        ~ newlyDiscoveredEmotionalWord = ViolaViolaBlu
                    - thirdKeyColour == greenKey:
                        ~ newlyDiscoveredEmotionalWord = ViolaViolaVerde
                    - thirdKeyColour == purpleKey:
                        ~ newlyDiscoveredEmotionalWord = ViolaViolaViola
                    - else:
                       ~ newlyDiscoveredEmotionalWord = ViolaViola
                }
            
            - else:
                ~ newlyDiscoveredEmotionalWord = Viola
        }  
    
            -> emotional_words_feedback
