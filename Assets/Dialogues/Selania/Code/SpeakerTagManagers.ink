=== function firstChar_tag
{
    - !knowing_first_character.one.firstPresentation:
        ~ return "???"
    - firstCharacterState == Chitarra:
	    ~ return "Chitarra"
}


=== function secondChar_tag
{
    - !knowing_second_character.one.nameSecond:
        ~ return "???"
    - secondCharacterState == Riccio:
	    ~ return "Riccio"
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