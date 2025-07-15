TODO: se necessario, creare sistema reattivo per ritratto del fungo (es: chiamo la funzione e cambia l'asset a seconda di alcune condizioni).

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