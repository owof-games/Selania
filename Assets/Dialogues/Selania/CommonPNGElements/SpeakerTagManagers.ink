/* ---------------------------------

   Funzioni per la gestione del tag del nome 

 ----------------------------------*/

=== function charTag(PNG, mood)
~ temp displayName = charName(PNG)
{PNG:
    - FirstCharacter:
        {
            - firstChar_storyStatus == story_storyPostal:
                ~ return "{PNG}, {displayName}, {mood}"
            
            - grimoire_firstChar hasnt grimFirstCharPresentation:
                ~ return "{PNG}, {displayName}, Chitarra_{mood}"
        
            - else:
                ~ return "{PNG}, {displayName}, {displayName}_{mood}"        
        }        

    - SecondCharacter:
        {   
            - secondChar_storyStatus == story_storyPostal:
                ~ return "{PNG}, {displayName}, {mood}"

            - grimoire_secondChar hasnt grimSecondCharPresentation:
                ~ return "{PNG}, {displayName}, Riccio_{mood}"
            
            - else:
                ~ return "{PNG}, {displayName}, {displayName}_{mood}"        
        }

    - ThirdCharacter:
        {   
            - thirdChar_storyStatus == story_storyPostal:
                ~ return "{PNG}, {displayName}, {mood}"

            - grimoire_thirdChar hasnt grimThirdCharPresentation:
                ~ return "{PNG}, {displayName}, Boccale_{mood}"
            
            - else:
                ~ return "{PNG}, {displayName}, {displayName}_{mood}"        
        }

    - FourthCharacter:
        {   
            - fourthChar_storyStatus == story_storyPostal:
                ~ return "{PNG}, {displayName}, {mood}"
                
            - grimoire_fourthChar hasnt grimFourthCharPresentation:
                ~ return "{PNG}, {displayName}, NonnaMolotov_{mood}"
            
            - else:
                ~ return "{PNG}, {displayName}, {displayName}_{mood}"        
        } 

    - FifthCharacter:
        {   
            - firstChar_storyStatus == story_storyPostal:
                ~ return "{PNG}, {displayName}, {mood}"

            //Chiamo sempre FifthCharacter, senza separazione da Mentore, ma faccio un check a seconda che la storia come Mostro sia partita o meno.
            - fifthChar_storyStatus == story_storyStarted:
                {
                    - grimoire_fifthChar hasnt grimFifthCharPresentation:
                        ~ return "{PNG}, {displayName}, Mostro_{mood}"
                    - else:
                        ~ return "{PNG}, {displayName}, {displayName}_{mood}"
                }
                
            - else: 
                    ~ return "Mentor, {displayName}, Mentore_{mood}"

        }             

    - else:
        ~ return "{PNG}, {displayName}, {mood}"  

}


{debug: entro in charTag(PNG, mood). Il valore di PNG è {PNG}, di displayName {displayName}, di mood {mood}.}

=== function charName(PNG)
{debug: entro in charName. Il valore di PNG è {PNG}.}
{PNG:
    - PG:
        ~ return "{player_name}"
    
    - FirstCharacter:
        {
            - grimoire_firstChar hasnt grimFirstCharPresentation:
                {
                    - gm_rm_activation.witch.riscrittura:
                        ~ return "Chitarra"
                    - else:
                        ~ return "???"
                }
                
            - firstChar_ActualName == Chitarra:
                ~ return "Chitarra"
                
            - firstChar_ActualName == Triangolo:
                ~ return "Triangolo"
                
            - firstChar_ActualName == Orchestra:
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
                {
                    - gm_rm_activation.witch.riscrittura:
                        ~ return "Riccio"
                    - else:
                        ~ return "???"
                }
                
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
                {
                    - gm_rm_activation.witch.riscrittura:
                        ~ return "Boccale"
                    - else:
                        ~ return "Boccale"
                }
            
            - thirdChar_ActualName == Boccale:
                ~ return "Boccale"

            - thirdChar_ActualName == ThirdB:
                ~ return "ThirdB"

            - thirdChar_ActualName == ThirdC:
                ~ return "ThirdC"

            - thirdChar_ActualName == ThirdD:
                ~ return "ThirdD"

            - thirdChar_ActualName == ThirdE:
                ~ return "ThirdE"

            - thirdChar_ActualName == ThirdF:
                ~ return "ThirdF"                     
        }

    - FourthCharacter:
        {

            - !tutorial_mentorTalkingChoiceRelationship.waterChoice && !tutorial_mentorTalkingChoiceRelationship.selfName:
                ~ return "???"
            
            - fourthChar_ActualName == NonnaMolotov:
                ~ return "Nonna Molotov"
            
            - fourthChar_ActualName == FourthB:
                ~ return "FourthB"

            - fourthChar_ActualName == FourthC:
                ~ return "FourthC"

            - fourthChar_ActualName == FourthD:
                ~ return "FourthD"

            - fourthChar_ActualName == FourthE:
                ~ return "FourthE"

            - fourthChar_ActualName == FourthF:
                ~ return "FourthF"      
        }    
    

    - FifthCharacter:
        {
            - !tutorial_mentorTalkingChoiceRelationship.waterChoice && !tutorial_mentorTalkingChoiceRelationship.selfName:
                {
                    - gm_rm_activation.witch.riscrittura:
                        ~ return "Mentore"
                    - else:
                        ~ return "???"
                }

            - fifthChar_ActualName == Mentore:
                ~ return "Mentore"    
            
            - fifthChar_ActualName == Mostro:
                ~ return "Mostro"
            
            - fifthChar_ActualName == FifthB:
                ~ return "FifthB"

            - fifthChar_ActualName == FifthC:
                ~ return "FifthC"

            - fifthChar_ActualName == FifthD:
                ~ return "FifthD"

            - fifthChar_ActualName == FifthE:
                ~ return "FifthE"

            - fifthChar_ActualName == FifthF:
                ~ return "FifthF"      
        }
    
    - TheWitch:
        {
                - not witch_intro.nameChosen:
                    ~ return ""

                - witch_actualName == Luna: 
                    ~ return "Luna"

                - witch_actualName == Strega:
                    ~ return "Strega"     

                - witch_actualName == Radice:
                    ~ return "Radice"

                - witch_actualName == Fiamma:
                    ~ return "Fiamma"
                    
                - witch_actualName == Parola
                    ~ return "Parola"
        }

    - Franco:
        {
            - frog_nameDiscovered == false:
                {
                    - gm_rm_activation.witch.riscrittura:
                        ~ return "Franco La Rana"
                    - else:
                        ~ return "???"
                }
                
            - are_two_entities_together(PG, FrancoCucina) && entity_location(PG) == Kitchen:
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
                {
                    - gm_rm_activation.witch.riscrittura:
                        ~ return "Carla"
                    - else:
                        ~ return "???"
                }
                
        }
        

    - Doggo:
        ~ return "Doggo"

    - else:
        ERROR: name not found. PNG = {PNG}.

}

 
/* ---------------------------------

   Funzioni per la gestione del ritratto 

 ----------------------------------*/

=== function portrait_Franco()
    {
        - are_two_entities_together(PG, Franco) && entity_location(PG) == Kitchen:
            ~ return "kitchen"

        - else:
            ~ return "neutral"
    }


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
