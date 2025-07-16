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
    - !knowing_second_character.one.nameSecond:
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


=== function fungus_tag
{
    - !talking_fungus.first_story_ended_check.nameFungus:
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
 TODO: se necessario, creare sistema reattivo per ritratto del fungo (es: chiamo la funzione e cambia l'asset a seconda di alcune condizioni).

 
/* ---------------------------------

   Funzioni per la gestione del tag dell'inchiostro 

----------------------------------*/
LIST imagesStates = offState, onState, emptyState

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
        - Empty:
                ~ return "offState"
        - Low:
                ~ return "onState"
        - Normal:
                ~ return "onState"
        - Medium:
                ~ return "onState"
        - High:
                ~ return "onState"
        - else:
            error
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
        - Empty:
                ~ return offState
        - Low:
                ~ return offState
        - Normal:
                ~ return onState
        - Medium:
                ~ return onState
        - High:
                ~ return onState
        - else:
            error
    }    

=== function ink_tag_c (charInkCheck)

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
        - Empty:
                ~ return offState
        - Low:
                ~ return offState
        - Normal:
                ~ return offState
        - Medium:
                ~ return onState
        - High:
                ~ return onState
        - else:
            error
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
        - Empty:
                ~ return offState
        - Low:
                ~ return offState
        - Normal:
                ~ return offState
        - Medium:
                ~ return offState
        - High:
                ~ return onState
        - else:
            error
    }     