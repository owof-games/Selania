=== function firstChar_tag
{
    - !knowing_first_character.one.firstPresentation:
        ~ return "???"
    - firstCharacterState == Chitarra:
	    ~ return "Chitarra"
}

=== function fifthChar_tag
{

    - !welcome.chiSei && !welcome.your_name.selfName:
	    ~ return "???"
    - fifthCharacterState == Mentore:
	    ~ return "Mentore"
}