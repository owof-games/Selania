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
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

        {charTag(Documents, "writer_firstChar")}:   Ciao {player_name}, come stai?

        ~ letters_firstCharLetters_first()
        -> first_char_closing_letters
    
    = two
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

        {charTag(Documents, "writer_firstChar")}:   Ciao {player_name}, qui è sempre {charNameOne} che ti scrive.

        ~ letters_firstCharLetters_second()
        -> first_char_closing_letters
        
    = three
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

        {charTag(Documents, "writer_firstChar")}:   Ciao ama!

        ~ letters_firstCharLetters_third()
        -> first_char_closing_letters

    = four
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

        {charTag(Documents, "writer_firstChar")}:   Ehi {player_name}.
    
        ~ letters_firstCharLetters_fourth()
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
        {charTag(Documents, "writer_secondChar")}:      Sono a lezione e mi sto rompendo e quindi ho deciso di scrivere a {player_name}.
        ~ letters_secondCharLetters_first()
        -> second_char_closing_letters
    
    = two
        {charTag(Documents, "writer_secondChar")}:          Che strano.
        ~ letters_secondCharLetters_second()
        -> second_char_closing_letters
    
    = three
        {charTag(Documents, "writer_secondChar")}:      Ciao {player_name}.
        ~ letters_secondCharLetters_third()
        -> second_char_closing_letters

    = four
        {charTag(Documents, "writer_secondChar")}:     Ehi.
        ~ letters_secondCharLetters_fourth()
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
        ~ letters_thirdCharLetters_first()
        -> third_char_closing_letters

    = two
        ~ letters_thirdCharLetters_second()
        -> third_char_closing_letters
    
    = three
        ~ letters_thirdCharLetters_third()
        -> third_char_closing_letters

    = four
        ~ letters_thirdCharLetters_fourth()
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
        ~ letters_fourthCharLetters_first()
        -> fourth_char_closing_letters

    = two
        ~ letters_fourthCharLetters_second()
        -> fourth_char_closing_letters
    
    = three
        ~ letters_fourthCharLetters_third()
        -> fourth_char_closing_letters

    = four
        ~ letters_fourthCharLetters_fourth()
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
        ~ letters_fifthCharLetters_first()
        -> fifth_char_closing_letters

    = two
        ~ letters_fifthCharLetters_second()
        -> fifth_char_closing_letters
    
    = three
        ~ letters_fifthCharLetters_third()
        -> fifth_char_closing_letters

    = four
        ~ letters_fifthCharLetters_fourth()
        -> fifth_char_closing_letters    