LIST nest_speakersForEwWordTag = Influenced, Other

/* ---------------------------------

   Funzioni per la gestione del tag del nome 

 ----------------------------------*/

=== function charTag(PNG, mood)
~ temp displayName = charName(PNG)
~ return "{PNG}, {displayName}, {mood}"

=== function charName(PNG)
{PNG:
    - PG:
        ~ return player_name
    - FirstCharacter:
        {
            - !first_char_main_storylets.one.firstPresentation:
                ~ return "???"
                
            - firstChar_ActualName == Chitarra:
                ~ return "Chitarra"
                
            - firstChar_ActualName == Triangolo:
                ~ return "Triangolo"
                
            - firstChar_ActualName == RagazzaOrchestra:
                ~ return "Orchestra"
                
            - firstChar_ActualName == FlautoDolce:
                ~ return "Flauto"
                
            - firstChar_ActualName == Ocarina:
                ~ return "Ocarina"
                
            - firstChar_ActualName == Violino:
                ~ return "Violino"
                
        }  

    - SecondCharacter:
        {
            - ! second_char_main_storylets.one.nameSecond:
                ~ return "???"
                
            - secondChar_ActualName == Riccio:
                ~ return "Riccio"
            
            - secondChar_ActualName == Grizzly:
                ~ return "Grizzly"
                
            - secondChar_ActualName == Lupo:
                ~ return "Lupo"
                
            - secondChar_ActualName == Delfino:
                ~ return "Delfino"
                
            - secondChar_ActualName == Capibara:
                ~ return "Capibara"
                
            - secondChar_ActualName == Corvo:
                ~ return "Corvo"
        
        }

    - ThirdCharacter:
        {

            - ! third_char_main_storylets.one:
                ~ return "???"
            
            - thirdChar_ActualName == Boccale:
                ~ return "Boccale"
        }

    - FourthCharacter:
        {

            - !tutorial_mentorTalkingChoiceRelationship.waterChoice && !tutorial_mentorTalkingChoiceRelationship.selfName:
                ~ return "???"
            
            - fourthChar_ActualName == Mentore:
                ~ return "Mentore"
        }    
    
    - Mentor:
        {
            - !tutorial_mentorTalkingChoiceRelationship.waterChoice && !tutorial_mentorTalkingChoiceRelationship.selfName:
                ~ return "???"
            
            - mentor_ActualName == Mentore:
                ~ return "Mentore"
        }
    
    - FifthCharacter:
        {
            - !tutorial_mentorTalkingChoiceRelationship.waterChoice && !tutorial_mentorTalkingChoiceRelationship.selfName:
                ~ return "???"
            
            - mentor_ActualName == Mentore:
                ~ return "Mentore"
        }
    
    - TheWitch:
        {
            - witch_intro.nameWitch:
                ~ return "<i>Luna</i>"
            
            - else:
                ~ return ""
        }

    - Franco:
        {
            - frog_nameDiscovered == false:
                ~ return "???"
            
            - are_two_entities_together(PG, Franco) && entity_location(PG) == Kitchen:
                ~ return "Franco Lo Chef"

            - else:
                ~ return "Franco La Rana"
        }

    - Documents:
        ~ return ""

    - Carla:
        {
            - tutorial_carlaChoicesRelationshipStorylet.nameDiscovered:
                ~ return "Carla"

            - else:
                ~ return "???"
        }
        

    - Doggo:
        ~ return "Doggo"

}







=== function firstChar_tag
{
    - !first_char_main_storylets.one.firstPresentation:
        ~ return "???"
        
    - firstChar_ActualName == Chitarra:
	    ~ return "Chitarra"
	    
    - firstChar_ActualName == Triangolo:
	    ~ return "Triangolo"
	    
	- firstChar_ActualName == RagazzaOrchestra:
	    ~ return "Orchestra"
	    
	- firstChar_ActualName == FlautoDolce:
	    ~ return "Flauto"
	    
	- firstChar_ActualName == Ocarina:
	    ~ return "Ocarina"
	    
	- firstChar_ActualName == Violino:
	    ~ return "Violino"
	    
}



=== function secondChar_tag
{
    - ! second_char_main_storylets.one.nameSecond:
        ~ return "???"
        
    - secondChar_ActualName == Riccio:
	    ~ return "Riccio"
	
	- secondChar_ActualName == Grizzly:
	    ~ return "Grizzly"
	    
    - secondChar_ActualName == Lupo:
	    ~ return "Lupo"
	    
    - secondChar_ActualName == Delfino:
	    ~ return "Delfino"
	    
    - secondChar_ActualName == Capibara:
	    ~ return "Capibara"
	    
    - secondChar_ActualName == Corvo:
	    ~ return "Corvo"
	
}

=== function thirdChar_tag
{

    - ! third_char_main_storylets.one:
	    ~ return "???"
    - thirdChar_ActualName == Boccale:
	    ~ return "Boccale"
}


=== function fourthChar_tag
{

    - !tutorial_mentorTalkingChoiceRelationship.waterChoice && !tutorial_mentorTalkingChoiceRelationship.selfName:
	    ~ return "???"
    - fourthChar_ActualName == Mentore:
	    ~ return "Mentore"
}

=== function mentor_tag
{

    - !tutorial_mentorTalkingChoiceRelationship.waterChoice && !tutorial_mentorTalkingChoiceRelationship.selfName:
	    ~ return "???"
    - mentor_ActualName == Mentore:
	    ~ return "Mentore"
}


=== function fifthChar_tag
{

    - !tutorial_mentorTalkingChoiceRelationship.waterChoice && !tutorial_mentorTalkingChoiceRelationship.selfName:
	    ~ return "???"
    - mentor_ActualName == Mentore:
	    ~ return "Mentore"
}


=== function witch_tag
{
    - !witch_intro.nameWitch:
        ~ return ""
    - else:
        ~ return "<i>Luna</i>"
}

=== function frog_tag
{
    - frog_nameDiscovered == false:
        ~ return "???"
    
    - are_two_entities_together(PG, Franco) && entity_location(PG) == Kitchen:
        ~ return "Franco Lo Chef"

    - else:
        ~ return "Franco La Rana"

}
    
    
=== function PG_tag
    {
        - player_nameChosen == false:
            ~ return "???"
            
        - else:
            ~ return "{player_name}"
    
    }
  
  
=== function em_state(speaker)
//Creare esclusione per: strega, PNG, Rana, Mentore non in dialogo personale
{speaker:
    - Influenced:
        {
            //Se c'è una parola attiva
            - glyph_actualActiveSigil != ():
                {
                    //E ci sono utilizzi multipli a disposizione
                    - glyph_temporaryWordUsageCounter > 1:
                        ~ return "{sigils_translator(glyph_actualActiveSigil)}, {glyph_temporaryWordUsageCounter} usi disponibili."
                    
                    //Altrimenti:
                    - glyph_temporaryWordUsageCounter == 1:
                        ~ return "{sigils_translator(glyph_actualActiveSigil)}, {glyph_temporaryWordUsageCounter} uso disponibile."  
                }
            
            - else:
                ~ return ""
        
        }
    
    - Other:
        ~ return ""
    
}    
    
/* ---------------------------------

   Funzioni per la gestione del ritratto 

 ----------------------------------*/

 === function witch_state()
//{
    //- not witch_feedback.intro.nameWitch:
    //   ~ return "witch_new_moon"
    //- else:
       {
        - witch_moonState == NewMoon:
            ~ return "witch_new_moon"
        - witch_moonState == FirstQuarter:
            ~ return "witch_first_quarter"
        - witch_moonState == FullMoon:
            ~ return "witch_full_moon"
        - witch_moonState == ThirdQuarter:
            ~ return "witch_third_quarter"
        - witch_moonState == RedMoon:
            ~ return "witch_red_moon"
       
       }
//}


//Modifica della variabile witch_moonState
=== moon_state_management
~ temp dice_roll = RANDOM(1, 3)
{debug: passo per moon_state management. Prima di agire, il valore di witch_moonState è {witch_moonState}. Il valore di witch_moonTime è {witch_moonTime}.}

        ~ witch_moonTime ++

//Non passando più per l'uscita, devo farlo crescere in altri modi, ma con lentezza. Il passaggio 1 spostamento = 1 giorno rischia di essere troppo veloce. Possiamo provare a fare 3 spostamenti = 1 giorno?
{

    - witch_moonTime == witch_timeForChangingMoonPhase:
        ~ witch_moonTime = 0
        {
            //- not witch_feedback.intro.nameWitch:
            //    ->->
            - witch_moonState == FirstQuarter:
                {
                    - dice_roll == 1:
                        ~ witch_moonState = ()
                        ~ witch_moonState = RedMoon
                    - else:
                        ~ witch_moonState = ()
                        ~ witch_moonState = FullMoon
                }
            
            - witch_moonState == ThirdQuarter:
                ~ witch_moonState = ()
                ~ witch_moonState = NewMoon
            
            - witch_moonState == RedMoon:
                ~ witch_moonState = ()
                ~ witch_moonState = ThirdQuarter
            
            - else:
                ~ witch_moonState ++    
        }
    
    - else:
        ->->
}

{debug: Dopo il passaggio, il valore di dice_random è {dice_roll}, e il valore di witch_moonState è {witch_moonState}.}

->->

/* ---------------------------------

   Funzioni per la gestione del tag dell'inchiostro: incremento 

----------------------------------*/
LIST ink_imagesStates = offState, onState, emptyState
VAR numberQuestion = 0

=== function ink_tag_a (charInkCheck)

    {
        - charInkCheck == firstChar_InkLevel:
            ~ Ink = firstChar_InkLevel
        
        - charInkCheck == secondChar_InkLevel:
            ~ Ink = secondChar_InkLevel
        
        - charInkCheck == thirdChar_InkLevel:
            ~ Ink = thirdChar_InkLevel
            
        - charInkCheck == fourthChar_InkLevel:
            ~ Ink = fourthChar_InkLevel
        
        - charInkCheck == fifthChar_InkLevel:
            ~ Ink = fifthChar_InkLevel    
            
    }
    
    {Ink:
                
        - ink_low:
            {
                - numberQuestion == 0:
                    ~ return "onState"
                - numberQuestion == 1:
                    ~ return "emptyState"
        
            }
                
        
        - ink_normal:
            {
                - numberQuestion == 0:
                    ~ return "onState"            
                - numberQuestion == 1:
                    ~ return "onState"
                - numberQuestion == 2:
                    ~ return "emptyState"
            }    
            
                
        - ink_medium:
            {
                - numberQuestion == 0:
                    ~ return "onState"            
                - numberQuestion == 1:
                    ~ return "onState"
                - numberQuestion == 2:
                    ~ return "onState"
                - numberQuestion == 3:
                    ~ return "emptyState"    
            }
            
        - ink_high:
            {
                - numberQuestion == 0:
                    ~ return "onState"            
                - numberQuestion == 1:
                    ~ return "onState"
                - numberQuestion == 2:
                    ~ return "onState"
                - numberQuestion == 3:
                    ~ return "onState"
                - numberQuestion == 4:
                    ~ return "emptyState"                    
            }
            
        - else:
            ~ return "offState"
    }



=== function ink_tag_b (charInkCheck)

    {
        - charInkCheck == firstChar_InkLevel:
            ~ Ink = firstChar_InkLevel
        
        - charInkCheck == secondChar_InkLevel:
            ~ Ink = secondChar_InkLevel
        
        - charInkCheck == thirdChar_InkLevel:
            ~ Ink = thirdChar_InkLevel
            
        - charInkCheck == fourthChar_InkLevel:
            ~ Ink = fourthChar_InkLevel
        
        - charInkCheck == fifthChar_InkLevel:
            ~ Ink = fifthChar_InkLevel    
            
    }
    
    {Ink:
    
        - ink_normal:
            {
                - numberQuestion == 0:
                    ~ return "onState"            
                - numberQuestion == 1:
                    ~ return "emptyState"
                - numberQuestion == 2:
                    ~ return "emptyState"                    
            }    
            
                
        - ink_medium:
            {
                - numberQuestion == 0:
                    ~ return "onState"            
                - numberQuestion == 1:
                    ~ return "onState"
                - numberQuestion == 2:
                    ~ return "emptyState"
                - numberQuestion == 3:
                    ~ return "emptyState"                      
            }
            
        - ink_high:
            {
                - numberQuestion == 0:
                    ~ return "onState"            
                - numberQuestion == 1:
                    ~ return "onState"
                - numberQuestion == 2:
                    ~ return "onState"
                - numberQuestion == 3:
                    ~ return "emptyState"
                - numberQuestion == 4:
                    ~ return "emptyState"                     
            }
            
        - else:
            ~ return "offState"
    }

=== function ink_tag_c(charInkCheck)

    {
        - charInkCheck == firstChar_InkLevel:
            ~ Ink = firstChar_InkLevel
        
        - charInkCheck == secondChar_InkLevel:
            ~ Ink = secondChar_InkLevel
        
        - charInkCheck == thirdChar_InkLevel:
            ~ Ink = thirdChar_InkLevel
            
        - charInkCheck == fourthChar_InkLevel:
            ~ Ink = fourthChar_InkLevel
        
        - charInkCheck == fifthChar_InkLevel:
            ~ Ink = fifthChar_InkLevel    
            
    }
    
    {Ink:
    
        - ink_medium:
            {
                - numberQuestion == 0:
                    ~ return "onState"            
                - numberQuestion == 1:
                    ~ return "emptyState"
                - numberQuestion == 2:
                    ~ return "emptyState"
                - numberQuestion == 3:
                    ~ return "emptyState"                     
            }
            
        - ink_high:
            {
                - numberQuestion == 0:
                    ~ return "onState"            
                - numberQuestion == 1:
                    ~ return "onState"
                - numberQuestion == 2:
                    ~ return "emptyState"
                - numberQuestion == 3:
                    ~ return "emptyState"
                - numberQuestion == 4:
                    ~ return "emptyState"                    
            }
            
        - else:
            ~ return "offState"
    }    

=== function ink_tag_d (charInkCheck)

    {
        - charInkCheck == firstChar_InkLevel:
            ~ Ink = firstChar_InkLevel
        
        - charInkCheck == secondChar_InkLevel:
            ~ Ink = secondChar_InkLevel
        
        - charInkCheck == thirdChar_InkLevel:
            ~ Ink = thirdChar_InkLevel
            
        - charInkCheck == fourthChar_InkLevel:
            ~ Ink = fourthChar_InkLevel
        
        - charInkCheck == fifthChar_InkLevel:
            ~ Ink = fifthChar_InkLevel    
            
    }
    
    {Ink:
    
        - ink_high:
            {
                - numberQuestion == 0:
                    ~ return "onState"            
                - numberQuestion == 1:
                    ~ return "emptyState"
                - numberQuestion == 2:
                    ~ return "emptyState"
                - numberQuestion == 3:
                    ~ return "emptyState"
                - numberQuestion == 4:
                    ~ return "emptyState"                    
            }
            
        - else:
            ~ return "offState"
    }    
