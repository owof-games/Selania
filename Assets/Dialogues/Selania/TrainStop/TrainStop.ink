=== train_stop ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}

{debug: La lista degli oggetti nella stanza è: {contentsTrainStop}.}

{
    -train_stop == 1: 
        <i>La stazione profuma di aria nevosa e nuovi arrivi.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
}
    
{
    - contentsSafekeeping has BedClosingGame:
        ~ move_entity (BedClosingGame, Bedroom)
}

-> main


=== doggo_no_notes ===
    + {are_two_entities_together(DoggoNoLetters, PG)}[DoggoNoLetters]
        
        {shuffle:
            - waarf!#speaker:Doggo #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:doggo_neutral
            - bauuu!#speaker:Doggo #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:doggo_neutral
            - pant pant pant.#speaker:Doggo #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:doggo_neutral
            - bau bau!#speaker:Doggo #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:doggo_neutral
            - arf arf!#speaker:Doggo #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:doggo_neutral
            - awoo! #speaker:Doggo #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:doggo_neutral
        }
    
    -> main
  
  
        
=== starting_note ===
    + {are_two_entities_together(StartingNote, PG)}[StartingNote]
    
    Ti scrivo perché volevo ringraziarti per quello che hai fatto. #speaker:Sconosciutə #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:writer_writer_unknown
        Che abbiamo fatto.
        A volte il quotidiano mi fa dimenticare tutto, e pensare che sia stata tutta una mia invenzione, roba nella testa.
        Ma poi la notte e i sogni mi ricordano che è stato tutto vero.
        E allora, vorrei soltanto tornare.
        <b>K</b>.
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
                {  
                    - firstChar_mailPause < 0:
                        -> two
                    - else:
                        -> one
                }
                
            - not three:
                {  
                    - firstChar_mailPause < 0:
                        -> three
                    - else:
                        -> two
                }
            
            - else:
                -> three
            
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
    
=== second_character_notes ===
//Mettere cose sul rapporto con nonna, papà. mamma, fratello, animali, futuro.
    + (check){are_two_entities_together(DoggoSecondLetters, PG)}[DoggoSecondLetters]
            
            ~ move_entity(DoggoSecondLetters, Safekeeping)
            ~ move_entity(DoggoNoLetters, TrainStop)
        
    {
            - not one:
                -> one
                
            - not two:
                {  
                    - secondChar_mailPause < 0:
                        -> two
                    - else:
                        -> one
                }
                
            - not three:
                {  
                    - secondChar_mailPause < 0:
                        -> three
                    - else:
                        -> two
                }
            
            - else:
                -> three
            
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
    
=== third_character_notes ===
//Forse le sue lettere saranno scritte da una persona cara, vicina.
    
    + {are_two_entities_together(DoggoThirdLetters, PG)}[DoggoThirdLetters]
    
        {
            - not one:
                -> one
                
            - not two:
                {  
                    - thirdChar_mailPause < 0:
                        -> two
                    - else:
                        -> one
                }
                
            - not three:
                {  
                    - thirdChar_mailPause < 0:
                        -> three
                    - else:
                        -> two
                }
            
            - else:
                -> three
            
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
    
=== fourth_character_notes ===
    
    + {are_two_entities_together(DoggoFourthLetters, PG)}[DoggoFourthLetters]
        
        {
            - not one:
                -> one
                
            - not two:
                {  
                    - fourthChar_mailPause < 0:
                        -> two
                    - else:
                        -> one
                }
                
            - not three:
                {  
                    - fourthChar_mailPause < 0:
                        -> three
                    - else:
                        -> two
                }
            
            - else:
                -> three
            
        }
     = one
        -> letters_fourthCharLetters.one ->
        -> third_char_closing_letters

    = two
        -> letters_fourthCharLetters.two ->
        -> third_char_closing_letters
    
    = three
        -> letters_fourthCharLetters.three ->
        -> third_char_closing_letters


=== fifth_character_notes ===

    + {are_two_entities_together(DoggoFifthLetters, PG)}[DoggoFifthLetters]
    
        {
            - not one:
                -> one
                
            - not two:
                {  
                    - fifthChar_mailPause < 0:
                        -> two
                    - else:
                        -> one
                }
                
            - not three:
                {  
                    - fifthChar_mailPause < 0:
                        -> three
                    - else:
                        -> two
                }
            
            - else:
                -> three
            
        }
        
     = one
        -> letters_fifthCharLetters.one ->
        -> third_char_closing_letters

    = two
        -> letters_fifthCharLetters.two ->
        -> third_char_closing_letters
    
    = three
        -> letters_fifthCharLetters.three ->
        -> third_char_closing_letters