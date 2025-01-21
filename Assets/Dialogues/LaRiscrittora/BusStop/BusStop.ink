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
    + {are_two_entities_together(FirstPersonNotes, PG)}[FirstPersonNotes]
    Ciao {name}, come stai?
    Qui succedono un sacco di cose da quando me ne sono andato.
    Tuo.
    {traduttorePersonaggeMaiuscolo(effettivoStatoPersonaggiaUno)}
    
    -> main
    
=== second_character_notes ===
    + {are_two_entities_together(SecondPersonNotes, PG)}[SecondPersonNotes]
    Lettere random note da parte della personaggia
    -> main
    
=== third_character_notes ===
    + {are_two_entities_together(NotePersonaggiaTre, PG)}[NotePersonaggiaTre]
    Lettere random note da parte della personaggia
    -> main
    
=== fourth_character_notes ===
    + {are_two_entities_together(NotePersonaggiaQuattro, PG)}[NotePersonaggiaQuattro]
    Lettere random note da parte della personaggia
    -> main

=== fifth_character_notes ===
    + {are_two_entities_together(NotePersonaggiaCinque, PG)}[NotePersonaggiaCinque]
    Lettere random note da parte della personaggia
    -> main

=== sixth_character_notes ===
    + {are_two_entities_together(NotePersonaggiaSei, PG)}[NotePersonaggiaSei]
    Lettere random note da parte della personaggia
    -> main

=== seventh_character_notes ===
    + {are_two_entities_together(NotePersonaggiaSette, PG)}[NotePersonaggiaSette]
    Lettere random note da parte della personaggia
    -> main