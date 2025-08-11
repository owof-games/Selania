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
	    ~ return "Ragazza Orchestra"
	    
	- firstCharacterState == FlautoDolce:
	    ~ return "Flauto Dolce"
	    
	- firstCharacterState == Ocarina:
	    ~ return "Ocarina"
	    
	- firstCharacterState == Violino:
	    ~ return "Chitarra"
	    
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
    - !talking_witch.first_story_ended_check.nameWitch:
        ~ return "..."
    - else:
        ~ return "^_^"
}

=== function frog_tag
    ~ return "La Rana Parlante"
    
=== function PG_tag
    ~ return "{name}"
    
/* ---------------------------------

   Funzioni per la gestione del tag del ritratto 

 ----------------------------------*/

 
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
