=== train_stop ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}

{debug: La lista degli oggetti nella stanza è: {contentsTrainStop}.}

{
    -train_stop == 1: 
        {charTag(TheWitch, witch_state())}:   <i>La stazione profuma di aria nevosa e nuovi arrivi.</i>
}
    

-> main


=== doggo_no_notes ===
    + {are_two_entities_together(DoggoNoLetters, PG)}[DoggoNoLetters]
        
        {shuffle:
            - {charTag(Doggo, "neutral")}: waarf!
            - {charTag(Doggo, "neutral")}: bauuu!
            - {charTag(Doggo, "neutral")}: pant pant pant.
            - {charTag(Doggo, "neutral")}: bau bau!
            - {charTag(Doggo, "neutral")}: arf arf!
            - {charTag(Doggo, "neutral")}: awoo! 
        }
    
    -> main
  
  
        
=== starting_note ===
    + {are_two_entities_together(StartingNote, PG)}[StartingNote]
    
    {charTag(Documents, "docLibrary")}:         Ti scrivo perché volevo ringraziarti per quello che hai fatto.
                                                Che abbiamo fatto.
                                                A volte il quotidiano mi fa dimenticare tutto, e pensare che sia stata tutta una mia invenzione, roba nella testa.
                                                Ma poi la notte e i sogni mi ricordano che è stato tutto vero.
                                                E allora, vorrei soltanto tornare.
                                                <b>Y.</b>.
            -> main


=== first_character_notes ===
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
    + (check){are_two_entities_together(DoggoFirstLetters, PG)}[DoggoFirstLetters]
            
            ~ move_entity(DoggoFirstLetters, Safekeeping)
            ~ move_entity(DoggoNoLetters, TrainStop)
                    
        {
            - not one:
                -> one
                
            - not two:
                -> two
        
                
            - not three:
                -> three

            - not four:
                -> four

        }
    
    = one
        -> letters_firstCharLetters.one ->
        -> first_char_closing_letters
    
    = two
        -> letters_firstCharLetters.two ->
        -> first_char_closing_letters
        
    = three
        -> letters_firstCharLetters.three ->
        -> first_char_closing_letters

    = four
        -> letters_firstCharLetters.four ->
        -> first_char_closing_letters       

=== second_character_notes ===
//Mettere cose sul rapporto con nonna, papà. mamma, fratello, animali, futuro.
    + (check){are_two_entities_together(DoggoSecondLetters, PG)}[DoggoSecondLetters]
            
            ~ move_entity(DoggoSecondLetters, Safekeeping)
            ~ move_entity(DoggoNoLetters, TrainStop)
        
        {
            - not one:
                -> one
                
            - not two:
                -> two
        
                
            - not three:
                -> three

            - not four:
                -> four
                
        }
    
    = one
        -> letters_secondCharLetters.one ->
        -> second_char_closing_letters
    
    = two
        -> letters_secondCharLetters.two ->
        -> second_char_closing_letters
    
    = three
        -> letters_secondCharLetters.three ->
        -> second_char_closing_letters

    = four
        -> letters_secondCharLetters.four ->
        -> second_char_closing_letters    
    
=== third_character_notes ===
//Forse le sue lettere saranno scritte da una persona cara, vicina.
    
    + {are_two_entities_together(DoggoThirdLetters, PG)}[DoggoThirdLetters]
    
          {
            - not one:
                -> one
                
            - not two:
                -> two
        
                
            - not three:
                -> three

            - not four:
                -> four
                
        }
        
    = one
        -> letters_thirdCharLetters.one ->
        -> third_char_closing_letters

    = two
        -> letters_thirdCharLetters.two ->
        -> third_char_closing_letters
    
    = three
        -> letters_thirdCharLetters.three ->
        -> third_char_closing_letters

    = four
        -> letters_thirdCharLetters.four ->
        -> third_char_closing_letters    
    
=== fourth_character_notes ===
    
    + {are_two_entities_together(DoggoFourthLetters, PG)}[DoggoFourthLetters]
        
        {
            - not one:
                -> one
                
            - not two:
                -> two
        
                
            - not three:
                -> three

            - not four:
                -> four
                
        }
     = one
        -> letters_fourthCharLetters.one ->
        -> fourth_char_closing_letters

    = two
        -> letters_fourthCharLetters.two ->
        -> fourth_char_closing_letters
    
    = three
        -> letters_fourthCharLetters.three ->
        -> fourth_char_closing_letters

    = four
        -> letters_fourthCharLetters.four ->
        -> fourth_char_closing_letters

=== fifth_character_notes ===

    + {are_two_entities_together(DoggoFifthLetters, PG)}[DoggoFifthLetters]
    
        {
            - not one:
                -> one
                
            - not two:
                -> two
        
                
            - not three:
                -> three

            - not four:
                -> four
                
        }
        
     = one
        -> letters_fifthCharLetters.one ->
        -> fifth_char_closing_letters

    = two
        -> letters_fifthCharLetters.two ->
        -> fifth_char_closing_letters
    
    = three
        -> letters_fifthCharLetters.three ->
        -> fifth_char_closing_letters

    = four
        -> letters_fifthCharLetters.four ->
        -> fifth_char_closing_letters    