=== emotional_words_dispatcher
//Qui è dove le scelte vengono combinate
{debug_nest: passo per emotional_words_generator.}
{debug_nest: i valori delle tre note sono {firstKeyColour} {secondKeyColour} {thirdKeyColour}.}
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
    {debug_nest: il primo colore è {firstKeyColour} passo per emotional_words_generator.redDispatcher.}
    
        {
            - secondKeyColour == redKey:
                {
                    - thirdKeyColour == redKey:
                        ~ nest_newlyDiscoveredEmotionalWord = RossoRossoRosso
                    - thirdKeyColour == yellowKey:
                        ~ nest_newlyDiscoveredEmotionalWord = RossoRossoGiallo
                    - thirdKeyColour == blueKey:
                        ~ nest_newlyDiscoveredEmotionalWord = RossoRossoBlu
                    - thirdKeyColour == greenKey:
                        ~ nest_newlyDiscoveredEmotionalWord = RossoRossoVerde
                    - thirdKeyColour == purpleKey:
                        ~ nest_newlyDiscoveredEmotionalWord = RossoRossoViola
                    - else:
                       ~ nest_newlyDiscoveredEmotionalWord = RossoRosso
                }
            
            - secondKeyColour == yellowKey:
                {
                    - thirdKeyColour == redKey:
                        ~ nest_newlyDiscoveredEmotionalWord = RossoGialloRosso
                    - thirdKeyColour == yellowKey:
                        ~ nest_newlyDiscoveredEmotionalWord = RossoGialloGiallo
                    - thirdKeyColour == blueKey:
                        ~ nest_newlyDiscoveredEmotionalWord = RossoGialloBlu
                    - thirdKeyColour == greenKey:
                        ~ nest_newlyDiscoveredEmotionalWord = RossoGialloVerde
                    - thirdKeyColour == purpleKey:
                        ~ nest_newlyDiscoveredEmotionalWord = RossoGialloViola
                    - else:
                       ~ nest_newlyDiscoveredEmotionalWord = RossoGiallo
                }
            
            - secondKeyColour == blueKey:
                {
                    - thirdKeyColour == redKey:
                        ~ nest_newlyDiscoveredEmotionalWord = RossoBluRosso
                    - thirdKeyColour == yellowKey:
                        ~ nest_newlyDiscoveredEmotionalWord = RossoBluGiallo
                    - thirdKeyColour == blueKey:
                        ~ nest_newlyDiscoveredEmotionalWord = RossoBluBlu
                    - thirdKeyColour == greenKey:
                        ~ nest_newlyDiscoveredEmotionalWord = RossoBluVerde
                    - thirdKeyColour == purpleKey:
                        ~ nest_newlyDiscoveredEmotionalWord = RossoBluViola
                    - else:
                       ~ nest_newlyDiscoveredEmotionalWord = RossoBlu
                }
            
            - secondKeyColour == greenKey:
                {
                    - thirdKeyColour == redKey:
                        ~ nest_newlyDiscoveredEmotionalWord = RossoVerdeRosso
                    - thirdKeyColour == yellowKey:
                        ~ nest_newlyDiscoveredEmotionalWord = RossoVerdeGiallo
                    - thirdKeyColour == blueKey:
                        ~ nest_newlyDiscoveredEmotionalWord = RossoVerdeBlu
                    - thirdKeyColour == greenKey:
                        ~ nest_newlyDiscoveredEmotionalWord = RossoVerdeVerde
                    - thirdKeyColour == purpleKey:
                        ~ nest_newlyDiscoveredEmotionalWord = RossoVerdeViola
                    - else:
                       ~ nest_newlyDiscoveredEmotionalWord = RossoVerde
                }
            
            - secondKeyColour == purpleKey:
                {
                    - thirdKeyColour == redKey:
                        ~ nest_newlyDiscoveredEmotionalWord = RossoViolaRosso
                    - thirdKeyColour == yellowKey:
                        ~ nest_newlyDiscoveredEmotionalWord = RossoViolaGiallo
                    - thirdKeyColour == blueKey:
                        ~ nest_newlyDiscoveredEmotionalWord = RossoViolaBlu
                    - thirdKeyColour == greenKey:
                        ~ nest_newlyDiscoveredEmotionalWord = RossoViolaVerde
                    - thirdKeyColour == purpleKey:
                        ~ nest_newlyDiscoveredEmotionalWord = RossoViolaViola
                    - else:
                       ~ nest_newlyDiscoveredEmotionalWord = RossoViola
                }
            
            - else:
                ~ nest_newlyDiscoveredEmotionalWord = Rosso
        }
            -> emotional_words_feedback

    = yellowDispatcher
    {debug_nest: il primo colore è {firstKeyColour} passo per emotional_words_generator.yellowDispatcher.}
    
        {
            - secondKeyColour == redKey:
                {
                    - thirdKeyColour == redKey:
                        ~ nest_newlyDiscoveredEmotionalWord = GialloRossoRosso
                    - thirdKeyColour == yellowKey:
                        ~ nest_newlyDiscoveredEmotionalWord = GialloRossoGiallo
                    - thirdKeyColour == blueKey:
                        ~ nest_newlyDiscoveredEmotionalWord = GialloRossoBlu
                    - thirdKeyColour == greenKey:
                        ~ nest_newlyDiscoveredEmotionalWord = GialloRossoVerde
                    - thirdKeyColour == purpleKey:
                        ~ nest_newlyDiscoveredEmotionalWord = GialloRossoViola
                    - else:
                       ~ nest_newlyDiscoveredEmotionalWord = GialloRosso
                }
            
            - secondKeyColour == yellowKey:
                {
                    - thirdKeyColour == redKey:
                        ~ nest_newlyDiscoveredEmotionalWord = GialloGialloRosso
                    - thirdKeyColour == yellowKey:
                        ~ nest_newlyDiscoveredEmotionalWord = GialloGialloGiallo
                    - thirdKeyColour == blueKey:
                        ~ nest_newlyDiscoveredEmotionalWord = GialloGialloBlu
                    - thirdKeyColour == greenKey:
                        ~ nest_newlyDiscoveredEmotionalWord = GialloGialloVerde
                    - thirdKeyColour == purpleKey:
                        ~ nest_newlyDiscoveredEmotionalWord = GialloGialloViola
                    - else:
                       ~ nest_newlyDiscoveredEmotionalWord = GialloGiallo
                }
            
            - secondKeyColour == blueKey:
                {
                    - thirdKeyColour == redKey:
                        ~ nest_newlyDiscoveredEmotionalWord = GialloBluRosso
                    - thirdKeyColour == yellowKey:
                        ~ nest_newlyDiscoveredEmotionalWord = GialloBluGiallo
                    - thirdKeyColour == blueKey:
                        ~ nest_newlyDiscoveredEmotionalWord = GialloBluBlu
                    - thirdKeyColour == greenKey:
                        ~ nest_newlyDiscoveredEmotionalWord = GialloBluVerde
                    - thirdKeyColour == purpleKey:
                        ~ nest_newlyDiscoveredEmotionalWord = GialloBluViola
                    - else:
                       ~ nest_newlyDiscoveredEmotionalWord = GialloBlu
                }
            
            - secondKeyColour == greenKey:
                {
                    - thirdKeyColour == redKey:
                        ~ nest_newlyDiscoveredEmotionalWord = GialloVerdeRosso
                    - thirdKeyColour == yellowKey:
                        ~ nest_newlyDiscoveredEmotionalWord = GialloVerdeGiallo
                    - thirdKeyColour == blueKey:
                        ~ nest_newlyDiscoveredEmotionalWord = GialloVerdeBlu
                    - thirdKeyColour == greenKey:
                        ~ nest_newlyDiscoveredEmotionalWord = GialloVerdeVerde
                    - thirdKeyColour == purpleKey:
                        ~ nest_newlyDiscoveredEmotionalWord = GialloVerdeViola
                    - else:
                       ~ nest_newlyDiscoveredEmotionalWord = GialloVerde
                }
            
            - secondKeyColour == purpleKey:
                {
                    - thirdKeyColour == redKey:
                        ~ nest_newlyDiscoveredEmotionalWord = GialloViolaRosso
                    - thirdKeyColour == yellowKey:
                        ~ nest_newlyDiscoveredEmotionalWord = GialloViolaGiallo
                    - thirdKeyColour == blueKey:
                        ~ nest_newlyDiscoveredEmotionalWord = GialloViolaBlu
                    - thirdKeyColour == greenKey:
                        ~ nest_newlyDiscoveredEmotionalWord = GialloViolaVerde
                    - thirdKeyColour == purpleKey:
                        ~ nest_newlyDiscoveredEmotionalWord = GialloViolaViola
                    - else:
                       ~ nest_newlyDiscoveredEmotionalWord = GialloViola
                }
            
            - else:
                ~ nest_newlyDiscoveredEmotionalWord = Giallo
        }
            -> emotional_words_feedback
    
    = blueDispatcher
    {debug_nest: il primo colore è {firstKeyColour} passo per emotional_words_generator.blueDispatcher.}
    
              {
            - secondKeyColour == redKey:
                {
                    - thirdKeyColour == redKey:
                        ~ nest_newlyDiscoveredEmotionalWord = BluRossoRosso
                    - thirdKeyColour == yellowKey:
                        ~ nest_newlyDiscoveredEmotionalWord = BluRossoGiallo
                    - thirdKeyColour == blueKey:
                        ~ nest_newlyDiscoveredEmotionalWord = BluRossoBlu
                    - thirdKeyColour == greenKey:
                        ~ nest_newlyDiscoveredEmotionalWord = BluRossoVerde
                    - thirdKeyColour == purpleKey:
                        ~ nest_newlyDiscoveredEmotionalWord = BluRossoViola
                    - else:
                       ~ nest_newlyDiscoveredEmotionalWord = BluRosso
                }
            
            - secondKeyColour == yellowKey:
                {
                    - thirdKeyColour == redKey:
                        ~ nest_newlyDiscoveredEmotionalWord = BluGialloRosso
                    - thirdKeyColour == yellowKey:
                        ~ nest_newlyDiscoveredEmotionalWord = BluGialloGiallo
                    - thirdKeyColour == blueKey:
                        ~ nest_newlyDiscoveredEmotionalWord = BluGialloBlu
                    - thirdKeyColour == greenKey:
                        ~ nest_newlyDiscoveredEmotionalWord = BluGialloVerde
                    - thirdKeyColour == purpleKey:
                        ~ nest_newlyDiscoveredEmotionalWord = BluGialloViola
                    - else:
                       ~ nest_newlyDiscoveredEmotionalWord = BluGiallo
                }
            
            - secondKeyColour == blueKey:
                {
                    - thirdKeyColour == redKey:
                        ~ nest_newlyDiscoveredEmotionalWord = BluBluRosso
                    - thirdKeyColour == yellowKey:
                        ~ nest_newlyDiscoveredEmotionalWord = BluBluGiallo
                    - thirdKeyColour == blueKey:
                        ~ nest_newlyDiscoveredEmotionalWord = BluBluBlu
                    - thirdKeyColour == greenKey:
                        ~ nest_newlyDiscoveredEmotionalWord = BluBluVerde
                    - thirdKeyColour == purpleKey:
                        ~ nest_newlyDiscoveredEmotionalWord = BluBluViola
                    - else:
                       ~ nest_newlyDiscoveredEmotionalWord = BluBlu
                }
            
            - secondKeyColour == greenKey:
                {
                    - thirdKeyColour == redKey:
                        ~ nest_newlyDiscoveredEmotionalWord = BluVerdeRosso
                    - thirdKeyColour == yellowKey:
                        ~ nest_newlyDiscoveredEmotionalWord = BluVerdeGiallo
                    - thirdKeyColour == blueKey:
                        ~ nest_newlyDiscoveredEmotionalWord = BluVerdeBlu
                    - thirdKeyColour == greenKey:
                        ~ nest_newlyDiscoveredEmotionalWord = BluVerdeVerde
                    - thirdKeyColour == purpleKey:
                        ~ nest_newlyDiscoveredEmotionalWord = BluVerdeViola
                    - else:
                       ~ nest_newlyDiscoveredEmotionalWord = BluVerde
                }
            
            - secondKeyColour == purpleKey:
                {
                    - thirdKeyColour == redKey:
                        ~ nest_newlyDiscoveredEmotionalWord = BluViolaRosso
                    - thirdKeyColour == yellowKey:
                        ~ nest_newlyDiscoveredEmotionalWord = BluViolaGiallo
                    - thirdKeyColour == blueKey:
                        ~ nest_newlyDiscoveredEmotionalWord = BluViolaBlu
                    - thirdKeyColour == greenKey:
                        ~ nest_newlyDiscoveredEmotionalWord = BluViolaVerde
                    - thirdKeyColour == purpleKey:
                        ~ nest_newlyDiscoveredEmotionalWord = BluViolaViola
                    - else:
                       ~ nest_newlyDiscoveredEmotionalWord = BluViola
                }
            
            - else:
                ~ nest_newlyDiscoveredEmotionalWord = Blu
        }
            -> emotional_words_feedback
    
    = greenDispatcher
    {debug_nest: il primo colore è {firstKeyColour} passo per emotional_words_generator.greenDispatcher.}
    
        {
            - secondKeyColour == redKey:
                {
                    - thirdKeyColour == redKey:
                        ~ nest_newlyDiscoveredEmotionalWord = VerdeRossoRosso
                    - thirdKeyColour == yellowKey:
                        ~ nest_newlyDiscoveredEmotionalWord = VerdeRossoGiallo
                    - thirdKeyColour == blueKey:
                        ~ nest_newlyDiscoveredEmotionalWord = VerdeRossoBlu
                    - thirdKeyColour == greenKey:
                        ~ nest_newlyDiscoveredEmotionalWord = VerdeRossoVerde
                    - thirdKeyColour == purpleKey:
                        ~ nest_newlyDiscoveredEmotionalWord = VerdeRossoViola
                    - else:
                       ~ nest_newlyDiscoveredEmotionalWord = VerdeRosso
                }
            
            - secondKeyColour == yellowKey:
                {
                    - thirdKeyColour == redKey:
                        ~ nest_newlyDiscoveredEmotionalWord = VerdeGialloRosso
                    - thirdKeyColour == yellowKey:
                        ~ nest_newlyDiscoveredEmotionalWord = VerdeGialloGiallo
                    - thirdKeyColour == blueKey:
                        ~ nest_newlyDiscoveredEmotionalWord = VerdeGialloBlu
                    - thirdKeyColour == greenKey:
                        ~ nest_newlyDiscoveredEmotionalWord = VerdeGialloVerde
                    - thirdKeyColour == purpleKey:
                        ~ nest_newlyDiscoveredEmotionalWord = VerdeGialloViola
                    - else:
                       ~ nest_newlyDiscoveredEmotionalWord = VerdeGiallo
                }
            
            - secondKeyColour == blueKey:
                {
                    - thirdKeyColour == redKey:
                        ~ nest_newlyDiscoveredEmotionalWord = VerdeBluRosso
                    - thirdKeyColour == yellowKey:
                        ~ nest_newlyDiscoveredEmotionalWord = VerdeBluGiallo
                    - thirdKeyColour == blueKey:
                        ~ nest_newlyDiscoveredEmotionalWord = VerdeBluBlu
                    - thirdKeyColour == greenKey:
                        ~ nest_newlyDiscoveredEmotionalWord = VerdeBluVerde
                    - thirdKeyColour == purpleKey:
                        ~ nest_newlyDiscoveredEmotionalWord = VerdeBluViola
                    - else:
                       ~ nest_newlyDiscoveredEmotionalWord = VerdeBlu
                }
            
            - secondKeyColour == greenKey:
                {
                    - thirdKeyColour == redKey:
                        ~ nest_newlyDiscoveredEmotionalWord = VerdeVerdeRosso
                    - thirdKeyColour == yellowKey:
                        ~ nest_newlyDiscoveredEmotionalWord = VerdeVerdeGiallo
                    - thirdKeyColour == blueKey:
                        ~ nest_newlyDiscoveredEmotionalWord = VerdeVerdeBlu
                    - thirdKeyColour == greenKey:
                        ~ nest_newlyDiscoveredEmotionalWord = VerdeVerdeVerde
                    - thirdKeyColour == purpleKey:
                        ~ nest_newlyDiscoveredEmotionalWord = VerdeVerdeViola
                    - else:
                       ~ nest_newlyDiscoveredEmotionalWord = VerdeVerde
                }
            
            - secondKeyColour == purpleKey:
                {
                    - thirdKeyColour == redKey:
                        ~ nest_newlyDiscoveredEmotionalWord = VerdeViolaRosso
                    - thirdKeyColour == yellowKey:
                        ~ nest_newlyDiscoveredEmotionalWord = VerdeViolaGiallo
                    - thirdKeyColour == blueKey:
                        ~ nest_newlyDiscoveredEmotionalWord = VerdeViolaBlu
                    - thirdKeyColour == greenKey:
                        ~ nest_newlyDiscoveredEmotionalWord = VerdeViolaVerde
                    - thirdKeyColour == purpleKey:
                        ~ nest_newlyDiscoveredEmotionalWord = VerdeViolaViola
                    - else:
                       ~ nest_newlyDiscoveredEmotionalWord = VerdeViola
                }
            
            - else:
                ~ nest_newlyDiscoveredEmotionalWord = Verde
        }
           -> emotional_words_feedback
    
    = purpleDispatcher
    {debug_nest: il primo colore è {firstKeyColour} passo per emotional_words_generator.purpleDispatcher.}
    
        {
            - secondKeyColour == redKey:
                {
                    - thirdKeyColour == redKey:
                        ~ nest_newlyDiscoveredEmotionalWord = ViolaRossoRosso
                    - thirdKeyColour == yellowKey:
                        ~ nest_newlyDiscoveredEmotionalWord = ViolaRossoGiallo
                    - thirdKeyColour == blueKey:
                        ~ nest_newlyDiscoveredEmotionalWord = ViolaRossoBlu
                    - thirdKeyColour == greenKey:
                        ~ nest_newlyDiscoveredEmotionalWord = ViolaRossoVerde
                    - thirdKeyColour == purpleKey:
                        ~ nest_newlyDiscoveredEmotionalWord = ViolaRossoViola
                    - else:
                       ~ nest_newlyDiscoveredEmotionalWord = ViolaRosso
                }
            
            - secondKeyColour == yellowKey:
                {
                    - thirdKeyColour == redKey:
                        ~ nest_newlyDiscoveredEmotionalWord = ViolaGialloRosso
                    - thirdKeyColour == yellowKey:
                        ~ nest_newlyDiscoveredEmotionalWord = ViolaGialloGiallo
                    - thirdKeyColour == blueKey:
                        ~ nest_newlyDiscoveredEmotionalWord = ViolaGialloBlu
                    - thirdKeyColour == greenKey:
                        ~ nest_newlyDiscoveredEmotionalWord = ViolaGialloVerde
                    - thirdKeyColour == purpleKey:
                        ~ nest_newlyDiscoveredEmotionalWord = ViolaGialloViola
                    - else:
                       ~ nest_newlyDiscoveredEmotionalWord = ViolaGiallo
                }
            
            - secondKeyColour == blueKey:
                {
                    - thirdKeyColour == redKey:
                        ~ nest_newlyDiscoveredEmotionalWord = ViolaBluRosso
                    - thirdKeyColour == yellowKey:
                        ~ nest_newlyDiscoveredEmotionalWord = ViolaBluGiallo
                    - thirdKeyColour == blueKey:
                        ~ nest_newlyDiscoveredEmotionalWord = ViolaBluBlu
                    - thirdKeyColour == greenKey:
                        ~ nest_newlyDiscoveredEmotionalWord = ViolaBluVerde
                    - thirdKeyColour == purpleKey:
                        ~ nest_newlyDiscoveredEmotionalWord = ViolaBluViola
                    - else:
                       ~ nest_newlyDiscoveredEmotionalWord = ViolaBlu
                }
            
            - secondKeyColour == greenKey:
                {
                    - thirdKeyColour == redKey:
                        ~ nest_newlyDiscoveredEmotionalWord = ViolaVerdeRosso
                    - thirdKeyColour == yellowKey:
                        ~ nest_newlyDiscoveredEmotionalWord = ViolaVerdeGiallo
                    - thirdKeyColour == blueKey:
                        ~ nest_newlyDiscoveredEmotionalWord = ViolaVerdeBlu
                    - thirdKeyColour == greenKey:
                        ~ nest_newlyDiscoveredEmotionalWord = ViolaVerdeVerde
                    - thirdKeyColour == purpleKey:
                        ~ nest_newlyDiscoveredEmotionalWord = ViolaVerdeViola
                    - else:
                       ~ nest_newlyDiscoveredEmotionalWord = ViolaVerde
                }
            
            - secondKeyColour == purpleKey:
                {
                    - thirdKeyColour == redKey:
                        ~ nest_newlyDiscoveredEmotionalWord = ViolaViolaRosso
                    - thirdKeyColour == yellowKey:
                        ~ nest_newlyDiscoveredEmotionalWord = ViolaViolaGiallo
                    - thirdKeyColour == blueKey:
                        ~ nest_newlyDiscoveredEmotionalWord = ViolaViolaBlu
                    - thirdKeyColour == greenKey:
                        ~ nest_newlyDiscoveredEmotionalWord = ViolaViolaVerde
                    - thirdKeyColour == purpleKey:
                        ~ nest_newlyDiscoveredEmotionalWord = ViolaViolaViola
                    - else:
                       ~ nest_newlyDiscoveredEmotionalWord = ViolaViola
                }
            
            - else:
                ~ nest_newlyDiscoveredEmotionalWord = Viola
        }  
    
            -> emotional_words_feedback
