/* ---------------------------------

   Funzioni per la gestione del tag del nome 

 ----------------------------------*/

=== function firstChar_tag
{
    - !knowing_first_character.one.firstPresentation:
        ~ return "???"
        
    - firstCharacterState == Chitarra:
	    ~ return "Chitarra"
	    
    - firstCharacterState == Triangolo:
	    ~ return "Triangolo"
	    
	- firstCharacterState == RagazzaOrchestra:
	    ~ return "Orchestra"
	    
	- firstCharacterState == FlautoDolce:
	    ~ return "Flauto Dolce"
	    
	- firstCharacterState == Ocarina:
	    ~ return "Ocarina"
	    
	- firstCharacterState == Violino:
	    ~ return "Violino"
	    
}



=== function secondChar_tag
{
    - ! that_little_liar_storylet.nameSecond:
        ~ return "???"
        
    - secondCharacterState == Riccio:
	    ~ return "Riccio"
	
	- secondCharacterState == Grizzly:
	    ~ return "Grizzly"
	    
    - secondCharacterState == Lupo:
	    ~ return "Lupo"
	    
    - secondCharacterState == Delfino:
	    ~ return "Delfino"
	    
    - secondCharacterState == Capibara:
	    ~ return "Capibara"
	    
    - secondCharacterState == Corvo:
	    ~ return "Corvo"
	
}

=== function thirdChar_tag
{

    - !welcome.chiSei && !welcome.your_name.selfName:
	    ~ return "???"
    - thirdCharacterState == Mentore:
	    ~ return "Mentore"
}


=== function fourthChar_tag
{

    - !welcome.chiSei && !welcome.your_name.selfName:
	    ~ return "???"
    - fourthCharacterState == Mentore:
	    ~ return "Mentore"
}



=== function fifthChar_tag
{

    - !welcome.chiSei && !welcome.your_name.selfName:
	    ~ return "???"
    - fifthCharacterState == Mentore:
	    ~ return "Mentore"
}


=== function witch_tag
{
    - !talking_witch.intro.nameWitch:
        ~ return "..."
    - else:
        ~ return "^_^"
}

=== function frog_tag
    ~ return "La Rana Parlante"
    
=== function PG_tag
    {
        - nameChosen == false:
            ~ return "???"
            
        - else:
            ~ return "{name}"
    
    }
  
  
=== function em_state
    {
        //Se c'è una parola attiva
        - activeEmotionalWord != ():
            {
                //E ci sono utilizzi multipli a disposizione
                - temporaryWordUsageCounter > 1:
                    ~ return "{emotional_words_translator(activeEmotionalWord)}: {temporaryWordUsageCounter} usi disponibili."
                
                //Altrimenti:
                - temporaryWordUsageCounter == 1:
                    ~ return "{emotional_words_translator(activeEmotionalWord)}: {temporaryWordUsageCounter} uso disponibile."  
            }
        
        - else:
            ~ return ""
    
    } 
    
/* ---------------------------------

   Funzioni per la gestione del ritratto 

 ----------------------------------*/

 === function witch_state()
//{
    //- not talking_witch.intro.nameWitch:
    //   ~ return "witch_new_moon"
    //- else:
       {
        - moonState == NewMoon:
            ~ return "witch_new_moon"
        - moonState == FirstQuarter:
            ~ return "witch_first_quarter"
        - moonState == FullMoon:
            ~ return "witch_full_moon"
        - moonState == ThirdQuarter:
            ~ return "witch_third_quarter"
        - moonState == RedMoon:
            ~ return "witch_red_moon"
       
       }
//}


//Modifica della variabile moonState
=== moon_state_management
~ temp dice_roll = RANDOM(1, 18)
{debug: passo per moon_state management. Prima di agire, il valore di moonState è {moonState}. Il valore di moonTime è {moonTime}.}

        ~ moonTime ++
//Non passando più per l'uscita, devo farlo crescere in altri modi, ma con lentezza. Il passaggio 1 spostamento = 1 giorno rischia di essere troppo veloce. Possiamo provare a fare 3 spostamenti = 1 giorno?
{

    - moonTime == changeMoonFase:
        ~ moonTime = 0
        {
            //- not talking_witch.intro.nameWitch:
            //    ->->
            - moonState == FirstQuarter:
                {
                    - dice_roll == 1:
                        ~ moonState = ()
                        ~ moonState = RedMoon
                    - else:
                        ~ moonState = ()
                        ~ moonState = FullMoon
                }
            
            - moonState == ThirdQuarter:
                ~ moonState = ()
                ~ moonState = NewMoon
            
            - moonState == RedMoon:
                ~ moonState = ()
                ~ moonState = ThirdQuarter
            
            - else:
                ~ moonState ++    
        }
    
    - else:
        ->->
}

{debug: Dopo il passaggio, il valore di dice_random è {dice_roll}, e il valore di moonState è {moonState}.}

->->

/* ---------------------------------

   Funzioni per la gestione del tag dell'inchiostro: incremento 

----------------------------------*/
LIST imagesStates = offState, onState, emptyState
VAR numberQuestion = 0

=== function ink_tag_a (charInkCheck)

    {
        - charInkCheck == firstCharacterInkLevel:
            ~ Ink = firstCharacterInkLevel
        
        - charInkCheck == secondCharacterInkLevel:
            ~ Ink = secondCharacterInkLevel
        
        - charInkCheck == thirdCharacterInkLevel:
            ~ Ink = thirdCharacterInkLevel
            
        - charInkCheck == fourthCharacterInkLevel:
            ~ Ink = fourthCharacterInkLevel
        
        - charInkCheck == fifthCharacterInkLevel:
            ~ Ink = fifthCharacterInkLevel    
            
    }
    
    {Ink:
                
        - Low:
            {
                - numberQuestion == 0:
                    ~ return "onState"
                - numberQuestion == 1:
                    ~ return "emptyState"
        
            }
                
        
        - Normal:
            {
                - numberQuestion == 0:
                    ~ return "onState"            
                - numberQuestion == 1:
                    ~ return "onState"
                - numberQuestion == 2:
                    ~ return "emptyState"
            }    
            
                
        - Medium:
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
            
        - High:
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
        - charInkCheck == firstCharacterInkLevel:
            ~ Ink = firstCharacterInkLevel
        
        - charInkCheck == secondCharacterInkLevel:
            ~ Ink = secondCharacterInkLevel
        
        - charInkCheck == thirdCharacterInkLevel:
            ~ Ink = thirdCharacterInkLevel
            
        - charInkCheck == fourthCharacterInkLevel:
            ~ Ink = fourthCharacterInkLevel
        
        - charInkCheck == fifthCharacterInkLevel:
            ~ Ink = fifthCharacterInkLevel    
            
    }
    
    {Ink:
    
        - Normal:
            {
                - numberQuestion == 0:
                    ~ return "onState"            
                - numberQuestion == 1:
                    ~ return "emptyState"
                - numberQuestion == 2:
                    ~ return "emptyState"                    
            }    
            
                
        - Medium:
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
            
        - High:
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
        - charInkCheck == firstCharacterInkLevel:
            ~ Ink = firstCharacterInkLevel
        
        - charInkCheck == secondCharacterInkLevel:
            ~ Ink = secondCharacterInkLevel
        
        - charInkCheck == thirdCharacterInkLevel:
            ~ Ink = thirdCharacterInkLevel
            
        - charInkCheck == fourthCharacterInkLevel:
            ~ Ink = fourthCharacterInkLevel
        
        - charInkCheck == fifthCharacterInkLevel:
            ~ Ink = fifthCharacterInkLevel    
            
    }
    
    {Ink:
    
        - Medium:
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
            
        - High:
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
        - charInkCheck == firstCharacterInkLevel:
            ~ Ink = firstCharacterInkLevel
        
        - charInkCheck == secondCharacterInkLevel:
            ~ Ink = secondCharacterInkLevel
        
        - charInkCheck == thirdCharacterInkLevel:
            ~ Ink = thirdCharacterInkLevel
            
        - charInkCheck == fourthCharacterInkLevel:
            ~ Ink = fourthCharacterInkLevel
        
        - charInkCheck == fifthCharacterInkLevel:
            ~ Ink = fifthCharacterInkLevel    
            
    }
    
    {Ink:
    
        - High:
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
