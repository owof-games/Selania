=== emotional_words_dispatcher
//Qui è dove le scelte vengono combinate
{debug_nest: passo per emotional_words_generator.}
{debug_nest: i valori delle tre note sono {nest_firstKeyColour} {nest_secondKeyColour} {nest_thirdKeyColour}.}
//Qui abbiamo il primo dispatcher, che ci manda a dei sottonodi di assegnazione, così da non avere dei blocconi giganteschi di roba
{
    - nest_firstKeyColour == redKey:
        -> redDispatcher
        
    - nest_firstKeyColour == yellowKey:
        -> yellowDispatcher
        
    - nest_firstKeyColour == blueKey:
        -> blueDispatcher
        
    - nest_firstKeyColour == greenKey:
        -> greenDispatcher
        
    - nest_firstKeyColour == purpleKey:
        -> purpleDispatcher
}


    = redDispatcher
    {debug_nest: il primo colore è {nest_firstKeyColour} passo per emotional_words_generator.redDispatcher.}
    
        {
            - nest_secondKeyColour == redKey:
                {
                    - nest_thirdKeyColour == redKey:
                        ~ nest_newlyDiscoveredEmotionalWord = RossoRossoRosso
                    - nest_thirdKeyColour == yellowKey:
                        ~ nest_newlyDiscoveredEmotionalWord = RossoRossoGiallo
                    - nest_thirdKeyColour == blueKey:
                        ~ nest_newlyDiscoveredEmotionalWord = RossoRossoBlu
                    - nest_thirdKeyColour == greenKey:
                        ~ nest_newlyDiscoveredEmotionalWord = RossoRossoVerde
                    - nest_thirdKeyColour == purpleKey:
                        ~ nest_newlyDiscoveredEmotionalWord = RossoRossoViola
                    - else:
                       ~ nest_newlyDiscoveredEmotionalWord = RossoRosso
                }
            
            - nest_secondKeyColour == yellowKey:
                {
                    - nest_thirdKeyColour == redKey:
                        ~ nest_newlyDiscoveredEmotionalWord = RossoGialloRosso
                    - nest_thirdKeyColour == yellowKey:
                        ~ nest_newlyDiscoveredEmotionalWord = RossoGialloGiallo
                    - nest_thirdKeyColour == blueKey:
                        ~ nest_newlyDiscoveredEmotionalWord = RossoGialloBlu
                    - nest_thirdKeyColour == greenKey:
                        ~ nest_newlyDiscoveredEmotionalWord = RossoGialloVerde
                    - nest_thirdKeyColour == purpleKey:
                        ~ nest_newlyDiscoveredEmotionalWord = RossoGialloViola
                    - else:
                       ~ nest_newlyDiscoveredEmotionalWord = RossoGiallo
                }
            
            - nest_secondKeyColour == blueKey:
                {
                    - nest_thirdKeyColour == redKey:
                        ~ nest_newlyDiscoveredEmotionalWord = RossoBluRosso
                    - nest_thirdKeyColour == yellowKey:
                        ~ nest_newlyDiscoveredEmotionalWord = RossoBluGiallo
                    - nest_thirdKeyColour == blueKey:
                        ~ nest_newlyDiscoveredEmotionalWord = RossoBluBlu
                    - nest_thirdKeyColour == greenKey:
                        ~ nest_newlyDiscoveredEmotionalWord = RossoBluVerde
                    - nest_thirdKeyColour == purpleKey:
                        ~ nest_newlyDiscoveredEmotionalWord = RossoBluViola
                    - else:
                       ~ nest_newlyDiscoveredEmotionalWord = RossoBlu
                }
            
            - nest_secondKeyColour == greenKey:
                {
                    - nest_thirdKeyColour == redKey:
                        ~ nest_newlyDiscoveredEmotionalWord = RossoVerdeRosso
                    - nest_thirdKeyColour == yellowKey:
                        ~ nest_newlyDiscoveredEmotionalWord = RossoVerdeGiallo
                    - nest_thirdKeyColour == blueKey:
                        ~ nest_newlyDiscoveredEmotionalWord = RossoVerdeBlu
                    - nest_thirdKeyColour == greenKey:
                        ~ nest_newlyDiscoveredEmotionalWord = RossoVerdeVerde
                    - nest_thirdKeyColour == purpleKey:
                        ~ nest_newlyDiscoveredEmotionalWord = RossoVerdeViola
                    - else:
                       ~ nest_newlyDiscoveredEmotionalWord = RossoVerde
                }
            
            - nest_secondKeyColour == purpleKey:
                {
                    - nest_thirdKeyColour == redKey:
                        ~ nest_newlyDiscoveredEmotionalWord = RossoViolaRosso
                    - nest_thirdKeyColour == yellowKey:
                        ~ nest_newlyDiscoveredEmotionalWord = RossoViolaGiallo
                    - nest_thirdKeyColour == blueKey:
                        ~ nest_newlyDiscoveredEmotionalWord = RossoViolaBlu
                    - nest_thirdKeyColour == greenKey:
                        ~ nest_newlyDiscoveredEmotionalWord = RossoViolaVerde
                    - nest_thirdKeyColour == purpleKey:
                        ~ nest_newlyDiscoveredEmotionalWord = RossoViolaViola
                    - else:
                       ~ nest_newlyDiscoveredEmotionalWord = RossoViola
                }
            
            - else:
                ~ nest_newlyDiscoveredEmotionalWord = Rosso
        }
            -> emotional_words_feedback

    = yellowDispatcher
    {debug_nest: il primo colore è {nest_firstKeyColour} passo per emotional_words_generator.yellowDispatcher.}
    
        {
            - nest_secondKeyColour == redKey:
                {
                    - nest_thirdKeyColour == redKey:
                        ~ nest_newlyDiscoveredEmotionalWord = GialloRossoRosso
                    - nest_thirdKeyColour == yellowKey:
                        ~ nest_newlyDiscoveredEmotionalWord = GialloRossoGiallo
                    - nest_thirdKeyColour == blueKey:
                        ~ nest_newlyDiscoveredEmotionalWord = GialloRossoBlu
                    - nest_thirdKeyColour == greenKey:
                        ~ nest_newlyDiscoveredEmotionalWord = GialloRossoVerde
                    - nest_thirdKeyColour == purpleKey:
                        ~ nest_newlyDiscoveredEmotionalWord = GialloRossoViola
                    - else:
                       ~ nest_newlyDiscoveredEmotionalWord = GialloRosso
                }
            
            - nest_secondKeyColour == yellowKey:
                {
                    - nest_thirdKeyColour == redKey:
                        ~ nest_newlyDiscoveredEmotionalWord = GialloGialloRosso
                    - nest_thirdKeyColour == yellowKey:
                        ~ nest_newlyDiscoveredEmotionalWord = GialloGialloGiallo
                    - nest_thirdKeyColour == blueKey:
                        ~ nest_newlyDiscoveredEmotionalWord = GialloGialloBlu
                    - nest_thirdKeyColour == greenKey:
                        ~ nest_newlyDiscoveredEmotionalWord = GialloGialloVerde
                    - nest_thirdKeyColour == purpleKey:
                        ~ nest_newlyDiscoveredEmotionalWord = GialloGialloViola
                    - else:
                       ~ nest_newlyDiscoveredEmotionalWord = GialloGiallo
                }
            
            - nest_secondKeyColour == blueKey:
                {
                    - nest_thirdKeyColour == redKey:
                        ~ nest_newlyDiscoveredEmotionalWord = GialloBluRosso
                    - nest_thirdKeyColour == yellowKey:
                        ~ nest_newlyDiscoveredEmotionalWord = GialloBluGiallo
                    - nest_thirdKeyColour == blueKey:
                        ~ nest_newlyDiscoveredEmotionalWord = GialloBluBlu
                    - nest_thirdKeyColour == greenKey:
                        ~ nest_newlyDiscoveredEmotionalWord = GialloBluVerde
                    - nest_thirdKeyColour == purpleKey:
                        ~ nest_newlyDiscoveredEmotionalWord = GialloBluViola
                    - else:
                       ~ nest_newlyDiscoveredEmotionalWord = GialloBlu
                }
            
            - nest_secondKeyColour == greenKey:
                {
                    - nest_thirdKeyColour == redKey:
                        ~ nest_newlyDiscoveredEmotionalWord = GialloVerdeRosso
                    - nest_thirdKeyColour == yellowKey:
                        ~ nest_newlyDiscoveredEmotionalWord = GialloVerdeGiallo
                    - nest_thirdKeyColour == blueKey:
                        ~ nest_newlyDiscoveredEmotionalWord = GialloVerdeBlu
                    - nest_thirdKeyColour == greenKey:
                        ~ nest_newlyDiscoveredEmotionalWord = GialloVerdeVerde
                    - nest_thirdKeyColour == purpleKey:
                        ~ nest_newlyDiscoveredEmotionalWord = GialloVerdeViola
                    - else:
                       ~ nest_newlyDiscoveredEmotionalWord = GialloVerde
                }
            
            - nest_secondKeyColour == purpleKey:
                {
                    - nest_thirdKeyColour == redKey:
                        ~ nest_newlyDiscoveredEmotionalWord = GialloViolaRosso
                    - nest_thirdKeyColour == yellowKey:
                        ~ nest_newlyDiscoveredEmotionalWord = GialloViolaGiallo
                    - nest_thirdKeyColour == blueKey:
                        ~ nest_newlyDiscoveredEmotionalWord = GialloViolaBlu
                    - nest_thirdKeyColour == greenKey:
                        ~ nest_newlyDiscoveredEmotionalWord = GialloViolaVerde
                    - nest_thirdKeyColour == purpleKey:
                        ~ nest_newlyDiscoveredEmotionalWord = GialloViolaViola
                    - else:
                       ~ nest_newlyDiscoveredEmotionalWord = GialloViola
                }
            
            - else:
                ~ nest_newlyDiscoveredEmotionalWord = Giallo
        }
            -> emotional_words_feedback
    
    = blueDispatcher
    {debug_nest: il primo colore è {nest_firstKeyColour} passo per emotional_words_generator.blueDispatcher.}
    
              {
            - nest_secondKeyColour == redKey:
                {
                    - nest_thirdKeyColour == redKey:
                        ~ nest_newlyDiscoveredEmotionalWord = BluRossoRosso
                    - nest_thirdKeyColour == yellowKey:
                        ~ nest_newlyDiscoveredEmotionalWord = BluRossoGiallo
                    - nest_thirdKeyColour == blueKey:
                        ~ nest_newlyDiscoveredEmotionalWord = BluRossoBlu
                    - nest_thirdKeyColour == greenKey:
                        ~ nest_newlyDiscoveredEmotionalWord = BluRossoVerde
                    - nest_thirdKeyColour == purpleKey:
                        ~ nest_newlyDiscoveredEmotionalWord = BluRossoViola
                    - else:
                       ~ nest_newlyDiscoveredEmotionalWord = BluRosso
                }
            
            - nest_secondKeyColour == yellowKey:
                {
                    - nest_thirdKeyColour == redKey:
                        ~ nest_newlyDiscoveredEmotionalWord = BluGialloRosso
                    - nest_thirdKeyColour == yellowKey:
                        ~ nest_newlyDiscoveredEmotionalWord = BluGialloGiallo
                    - nest_thirdKeyColour == blueKey:
                        ~ nest_newlyDiscoveredEmotionalWord = BluGialloBlu
                    - nest_thirdKeyColour == greenKey:
                        ~ nest_newlyDiscoveredEmotionalWord = BluGialloVerde
                    - nest_thirdKeyColour == purpleKey:
                        ~ nest_newlyDiscoveredEmotionalWord = BluGialloViola
                    - else:
                       ~ nest_newlyDiscoveredEmotionalWord = BluGiallo
                }
            
            - nest_secondKeyColour == blueKey:
                {
                    - nest_thirdKeyColour == redKey:
                        ~ nest_newlyDiscoveredEmotionalWord = BluBluRosso
                    - nest_thirdKeyColour == yellowKey:
                        ~ nest_newlyDiscoveredEmotionalWord = BluBluGiallo
                    - nest_thirdKeyColour == blueKey:
                        ~ nest_newlyDiscoveredEmotionalWord = BluBluBlu
                    - nest_thirdKeyColour == greenKey:
                        ~ nest_newlyDiscoveredEmotionalWord = BluBluVerde
                    - nest_thirdKeyColour == purpleKey:
                        ~ nest_newlyDiscoveredEmotionalWord = BluBluViola
                    - else:
                       ~ nest_newlyDiscoveredEmotionalWord = BluBlu
                }
            
            - nest_secondKeyColour == greenKey:
                {
                    - nest_thirdKeyColour == redKey:
                        ~ nest_newlyDiscoveredEmotionalWord = BluVerdeRosso
                    - nest_thirdKeyColour == yellowKey:
                        ~ nest_newlyDiscoveredEmotionalWord = BluVerdeGiallo
                    - nest_thirdKeyColour == blueKey:
                        ~ nest_newlyDiscoveredEmotionalWord = BluVerdeBlu
                    - nest_thirdKeyColour == greenKey:
                        ~ nest_newlyDiscoveredEmotionalWord = BluVerdeVerde
                    - nest_thirdKeyColour == purpleKey:
                        ~ nest_newlyDiscoveredEmotionalWord = BluVerdeViola
                    - else:
                       ~ nest_newlyDiscoveredEmotionalWord = BluVerde
                }
            
            - nest_secondKeyColour == purpleKey:
                {
                    - nest_thirdKeyColour == redKey:
                        ~ nest_newlyDiscoveredEmotionalWord = BluViolaRosso
                    - nest_thirdKeyColour == yellowKey:
                        ~ nest_newlyDiscoveredEmotionalWord = BluViolaGiallo
                    - nest_thirdKeyColour == blueKey:
                        ~ nest_newlyDiscoveredEmotionalWord = BluViolaBlu
                    - nest_thirdKeyColour == greenKey:
                        ~ nest_newlyDiscoveredEmotionalWord = BluViolaVerde
                    - nest_thirdKeyColour == purpleKey:
                        ~ nest_newlyDiscoveredEmotionalWord = BluViolaViola
                    - else:
                       ~ nest_newlyDiscoveredEmotionalWord = BluViola
                }
            
            - else:
                ~ nest_newlyDiscoveredEmotionalWord = Blu
        }
            -> emotional_words_feedback
    
    = greenDispatcher
    {debug_nest: il primo colore è {nest_firstKeyColour} passo per emotional_words_generator.greenDispatcher.}
    
        {
            - nest_secondKeyColour == redKey:
                {
                    - nest_thirdKeyColour == redKey:
                        ~ nest_newlyDiscoveredEmotionalWord = VerdeRossoRosso
                    - nest_thirdKeyColour == yellowKey:
                        ~ nest_newlyDiscoveredEmotionalWord = VerdeRossoGiallo
                    - nest_thirdKeyColour == blueKey:
                        ~ nest_newlyDiscoveredEmotionalWord = VerdeRossoBlu
                    - nest_thirdKeyColour == greenKey:
                        ~ nest_newlyDiscoveredEmotionalWord = VerdeRossoVerde
                    - nest_thirdKeyColour == purpleKey:
                        ~ nest_newlyDiscoveredEmotionalWord = VerdeRossoViola
                    - else:
                       ~ nest_newlyDiscoveredEmotionalWord = VerdeRosso
                }
            
            - nest_secondKeyColour == yellowKey:
                {
                    - nest_thirdKeyColour == redKey:
                        ~ nest_newlyDiscoveredEmotionalWord = VerdeGialloRosso
                    - nest_thirdKeyColour == yellowKey:
                        ~ nest_newlyDiscoveredEmotionalWord = VerdeGialloGiallo
                    - nest_thirdKeyColour == blueKey:
                        ~ nest_newlyDiscoveredEmotionalWord = VerdeGialloBlu
                    - nest_thirdKeyColour == greenKey:
                        ~ nest_newlyDiscoveredEmotionalWord = VerdeGialloVerde
                    - nest_thirdKeyColour == purpleKey:
                        ~ nest_newlyDiscoveredEmotionalWord = VerdeGialloViola
                    - else:
                       ~ nest_newlyDiscoveredEmotionalWord = VerdeGiallo
                }
            
            - nest_secondKeyColour == blueKey:
                {
                    - nest_thirdKeyColour == redKey:
                        ~ nest_newlyDiscoveredEmotionalWord = VerdeBluRosso
                    - nest_thirdKeyColour == yellowKey:
                        ~ nest_newlyDiscoveredEmotionalWord = VerdeBluGiallo
                    - nest_thirdKeyColour == blueKey:
                        ~ nest_newlyDiscoveredEmotionalWord = VerdeBluBlu
                    - nest_thirdKeyColour == greenKey:
                        ~ nest_newlyDiscoveredEmotionalWord = VerdeBluVerde
                    - nest_thirdKeyColour == purpleKey:
                        ~ nest_newlyDiscoveredEmotionalWord = VerdeBluViola
                    - else:
                       ~ nest_newlyDiscoveredEmotionalWord = VerdeBlu
                }
            
            - nest_secondKeyColour == greenKey:
                {
                    - nest_thirdKeyColour == redKey:
                        ~ nest_newlyDiscoveredEmotionalWord = VerdeVerdeRosso
                    - nest_thirdKeyColour == yellowKey:
                        ~ nest_newlyDiscoveredEmotionalWord = VerdeVerdeGiallo
                    - nest_thirdKeyColour == blueKey:
                        ~ nest_newlyDiscoveredEmotionalWord = VerdeVerdeBlu
                    - nest_thirdKeyColour == greenKey:
                        ~ nest_newlyDiscoveredEmotionalWord = VerdeVerdeVerde
                    - nest_thirdKeyColour == purpleKey:
                        ~ nest_newlyDiscoveredEmotionalWord = VerdeVerdeViola
                    - else:
                       ~ nest_newlyDiscoveredEmotionalWord = VerdeVerde
                }
            
            - nest_secondKeyColour == purpleKey:
                {
                    - nest_thirdKeyColour == redKey:
                        ~ nest_newlyDiscoveredEmotionalWord = VerdeViolaRosso
                    - nest_thirdKeyColour == yellowKey:
                        ~ nest_newlyDiscoveredEmotionalWord = VerdeViolaGiallo
                    - nest_thirdKeyColour == blueKey:
                        ~ nest_newlyDiscoveredEmotionalWord = VerdeViolaBlu
                    - nest_thirdKeyColour == greenKey:
                        ~ nest_newlyDiscoveredEmotionalWord = VerdeViolaVerde
                    - nest_thirdKeyColour == purpleKey:
                        ~ nest_newlyDiscoveredEmotionalWord = VerdeViolaViola
                    - else:
                       ~ nest_newlyDiscoveredEmotionalWord = VerdeViola
                }
            
            - else:
                ~ nest_newlyDiscoveredEmotionalWord = Verde
        }
           -> emotional_words_feedback
    
    = purpleDispatcher
    {debug_nest: il primo colore è {nest_firstKeyColour} passo per emotional_words_generator.purpleDispatcher.}
    
        {
            - nest_secondKeyColour == redKey:
                {
                    - nest_thirdKeyColour == redKey:
                        ~ nest_newlyDiscoveredEmotionalWord = ViolaRossoRosso
                    - nest_thirdKeyColour == yellowKey:
                        ~ nest_newlyDiscoveredEmotionalWord = ViolaRossoGiallo
                    - nest_thirdKeyColour == blueKey:
                        ~ nest_newlyDiscoveredEmotionalWord = ViolaRossoBlu
                    - nest_thirdKeyColour == greenKey:
                        ~ nest_newlyDiscoveredEmotionalWord = ViolaRossoVerde
                    - nest_thirdKeyColour == purpleKey:
                        ~ nest_newlyDiscoveredEmotionalWord = ViolaRossoViola
                    - else:
                       ~ nest_newlyDiscoveredEmotionalWord = ViolaRosso
                }
            
            - nest_secondKeyColour == yellowKey:
                {
                    - nest_thirdKeyColour == redKey:
                        ~ nest_newlyDiscoveredEmotionalWord = ViolaGialloRosso
                    - nest_thirdKeyColour == yellowKey:
                        ~ nest_newlyDiscoveredEmotionalWord = ViolaGialloGiallo
                    - nest_thirdKeyColour == blueKey:
                        ~ nest_newlyDiscoveredEmotionalWord = ViolaGialloBlu
                    - nest_thirdKeyColour == greenKey:
                        ~ nest_newlyDiscoveredEmotionalWord = ViolaGialloVerde
                    - nest_thirdKeyColour == purpleKey:
                        ~ nest_newlyDiscoveredEmotionalWord = ViolaGialloViola
                    - else:
                       ~ nest_newlyDiscoveredEmotionalWord = ViolaGiallo
                }
            
            - nest_secondKeyColour == blueKey:
                {
                    - nest_thirdKeyColour == redKey:
                        ~ nest_newlyDiscoveredEmotionalWord = ViolaBluRosso
                    - nest_thirdKeyColour == yellowKey:
                        ~ nest_newlyDiscoveredEmotionalWord = ViolaBluGiallo
                    - nest_thirdKeyColour == blueKey:
                        ~ nest_newlyDiscoveredEmotionalWord = ViolaBluBlu
                    - nest_thirdKeyColour == greenKey:
                        ~ nest_newlyDiscoveredEmotionalWord = ViolaBluVerde
                    - nest_thirdKeyColour == purpleKey:
                        ~ nest_newlyDiscoveredEmotionalWord = ViolaBluViola
                    - else:
                       ~ nest_newlyDiscoveredEmotionalWord = ViolaBlu
                }
            
            - nest_secondKeyColour == greenKey:
                {
                    - nest_thirdKeyColour == redKey:
                        ~ nest_newlyDiscoveredEmotionalWord = ViolaVerdeRosso
                    - nest_thirdKeyColour == yellowKey:
                        ~ nest_newlyDiscoveredEmotionalWord = ViolaVerdeGiallo
                    - nest_thirdKeyColour == blueKey:
                        ~ nest_newlyDiscoveredEmotionalWord = ViolaVerdeBlu
                    - nest_thirdKeyColour == greenKey:
                        ~ nest_newlyDiscoveredEmotionalWord = ViolaVerdeVerde
                    - nest_thirdKeyColour == purpleKey:
                        ~ nest_newlyDiscoveredEmotionalWord = ViolaVerdeViola
                    - else:
                       ~ nest_newlyDiscoveredEmotionalWord = ViolaVerde
                }
            
            - nest_secondKeyColour == purpleKey:
                {
                    - nest_thirdKeyColour == redKey:
                        ~ nest_newlyDiscoveredEmotionalWord = ViolaViolaRosso
                    - nest_thirdKeyColour == yellowKey:
                        ~ nest_newlyDiscoveredEmotionalWord = ViolaViolaGiallo
                    - nest_thirdKeyColour == blueKey:
                        ~ nest_newlyDiscoveredEmotionalWord = ViolaViolaBlu
                    - nest_thirdKeyColour == greenKey:
                        ~ nest_newlyDiscoveredEmotionalWord = ViolaViolaVerde
                    - nest_thirdKeyColour == purpleKey:
                        ~ nest_newlyDiscoveredEmotionalWord = ViolaViolaViola
                    - else:
                       ~ nest_newlyDiscoveredEmotionalWord = ViolaViola
                }
            
            - else:
                ~ nest_newlyDiscoveredEmotionalWord = Viola
        }  
    
            -> emotional_words_feedback
