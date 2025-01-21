=== bus_stop ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
//Qui non compaiono anime e animelle
//Da qui possiamo riprendere una storia in corso, o prenderne una nuova. Se c'è una storia in corso le altre non sono accessibili, e plausibilmente vedremo il fantasma di turno che ci aspetta.
{bus_stop==1: <i>Questa è la fermata del bus</i>|<i>La fermata {~ è pacifica|resta silente|brilla di luce leggera}</i>}.
    + [Mi guardo attorno.]
    -
        -> main
        
        
=== starting_note ===
    + {are_two_entities_together(StartingNote, PG)}[StartingNote]
    Note Iniziali
    -> main

-> main
=== first_character_notes ===
    + {are_two_entities_together(FirstCharacterNotes, PG)}[FirstCharacterNotes]
    Ciao {name}, come stai?
    Qui succedono un sacco di cose da quando me ne sono andato.
    Tuo.
    {traduttorePersonaggeMaiuscolo(firstCharacterState)}
    
    -> main
    
=== second_character_notes ===
    + {are_two_entities_together(SecondCharacterNotes, PG)}[SecondCharacterNotes]
    Lettere random note da parte della personaggia
    -> main
    
=== third_character_notes ===
    + {are_two_entities_together(ThirdCharacterNotes, PG)}[ThirdCharacterNotes]
    Lettere random note da parte della personaggia
    -> main
    
=== fourth_character_notes ===
    + {are_two_entities_together(FourthCharacterNotes, PG)}[FourthCharacterNotes]
    Lettere random note da parte della personaggia
    -> main

=== fifth_character_notes ===
    + {are_two_entities_together(FifthCharacterNotes, PG)}[FifthCharacterNotes]
    Lettere random note da parte della personaggia
    -> main

=== sixth_character_notes ===
    + {are_two_entities_together(SixthCharacterNotes, PG)}[SixthCharacterNotes]
    Lettere random note da parte della personaggia
    -> main

=== seventh_character_notes ===
    + {are_two_entities_together(SeventhCharacterNotes, PG)}[SeventhCharacterNotes]
    Lettere random note da parte della personaggia
    -> main