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
    
    
    + (check){are_two_entities_together(DoggoFirstLetters, PG)}[DoggoFirstLetters]
            
            ~ move_entity(DoggoFirstLetters, Safekeeping)
            ~ move_entity(DoggoNoLetters, TrainStop)
                    
        {
            - grimoire_firstChar hasnt grimFirstCharLetterOne:
                -> one
                
            - grimoire_firstChar hasnt grimFirstCharLetterTwo:
                -> two
        
            - grimoire_firstChar hasnt grimFirstCharLetterThree:
                -> three

            - grimoire_firstChar hasnt grimFirstCharLetterFour:
                -> four

        }
    
    = one
    ~ temp charNameOne = translator(firstChar_ActualName)
    
        
        {charTag(FirstCharacter, "writer")}:           Ciao {player_name}, come stai?

        ~ letters_firstCharLetters_one()
        -> first_char_closing_letters -> main
    
    = two
    ~ temp charNameOne = translator(firstChar_ActualName)
    

        {charTag(FirstCharacter, "writer")}:           Ciao {player_name}, qui è sempre {charNameOne} che ti scrive.

        ~ letters_firstCharLetters_two()
        -> first_char_closing_letters -> main
        
    = three
    ~ temp charNameOne = translator(firstChar_ActualName)
    

        {charTag(FirstCharacter, "writer")}:           Ciao ama!
        Dopo la prima o seconda lettera (verificare), viene chiamato il ricalcolo del feedback relazione e riceviamo un commento.
        ~ third_char_relationshipFromLiveToLetters()

        ~ letters_firstCharLetters_three()
        -> first_char_closing_letters -> main

    = four
    ~ temp charNameOne = translator(firstChar_ActualName)
    

        {charTag(FirstCharacter, "writer")}:           Rieccomi ama.
    
        ~ letters_firstCharLetters_four()
        -> first_char_closing_letters -> main       

=== second_character_notes ===
//Mettere cose sul rapporto con nonna, papà. mamma, fratello, animali, futuro.
    + (check){are_two_entities_together(DoggoSecondLetters, PG)}[DoggoSecondLetters]
            
            ~ move_entity(DoggoSecondLetters, Safekeeping)
            ~ move_entity(DoggoNoLetters, TrainStop)
        
        {
            - grimoire_secondChar hasnt grimSecondCharLetterOne:
                -> one
                
            - grimoire_secondChar hasnt grimSecondCharLetterTwo:
                -> two
        
                
            - grimoire_secondChar hasnt grimSecondCharLetterThree:
                -> three

            - grimoire_secondChar hasnt grimSecondCharLetterFour:
                -> four

        }
    
    = one
        {charTag(SecondCharacter, "writer")}:          Sono a lezione e mi sto rompendo e quindi ho deciso di scrivere a {player_name}.
        ~ letters_secondCharLetters_one()
        -> second_char_closing_letters -> main
    
    = two
        {charTag(SecondCharacter, "writer")}:          Che strano.
        ~ letters_secondCharLetters_two()
        -> second_char_closing_letters -> main
    
    = three
        {charTag(SecondCharacter, "writer")}:          Ciao {player_name}.
        ~ letters_secondCharLetters_three()
        -> second_char_closing_letters -> main

    = four
        {charTag(SecondCharacter, "writer")}:          Ehi.
        ~ letters_secondCharLetters_four()
        -> second_char_closing_letters -> main    
    
=== third_character_notes ===
//Forse le sue lettere saranno scritte da una persona cara, vicina.
    
    + {are_two_entities_together(DoggoThirdLetters, PG)}[DoggoThirdLetters]
    
        
        {
            - grimoire_thirdChar hasnt grimThirdCharLetterOne:
                -> one
                
            - grimoire_thirdChar hasnt grimThirdCharLetterTwo:
                -> two
        
                
            - grimoire_thirdChar hasnt grimThirdCharLetterThree:
                -> three

            - grimoire_thirdChar hasnt grimThirdCharLetterFour:
                -> four

        }
        
    = one
        ~ letters_thirdCharLetters_one()
        -> third_char_letters_choices.one ->
        -> third_char_closing_letters -> main

    = two
        ~ letters_thirdCharLetters_two()
        -> third_char_letters_choices.two ->
        -> third_char_closing_letters -> main
    
    = three
        ~ letters_thirdCharLetters_three()
        -> third_char_letters_choices.three ->
        -> third_char_closing_letters -> main

    = four
        ~ letters_thirdCharLetters_four()
        -> third_char_letters_choices.four ->
        -> third_char_closing_letters -> main

    = five
        ~ letters_thirdCharLetters_five()
        -> third_char_letters_choices.five ->
        -> third_char_closing_letters -> main

    = six
        ~ letters_thirdCharLetters_six()
        -> third_char_letters_choices.six ->
        -> third_char_closing_letters -> main

    = seven
        ~ letters_thirdCharLetters_seven()
        -> third_char_letters_choices.seven ->
        -> third_char_closing_letters -> main

    
=== fourth_character_notes ===
    
    + {are_two_entities_together(DoggoFourthLetters, PG)}[DoggoFourthLetters]
        
         
        {
            - grimoire_fourthChar hasnt grimFourthCharLetterOne:
                -> one
                
            - grimoire_fourthChar hasnt grimFourthCharLetterTwo:
                -> two
        
                
            - grimoire_fourthChar hasnt grimFourthCharLetterThree:
                -> three

            - grimoire_fourthChar hasnt grimFourthCharLetterFour:
                -> four

        }
     = one
        ~ letters_fourthCharLetters_one()
        -> fourth_char_closing_letters -> main

    = two
        ~ letters_fourthCharLetters_two()
        -> fourth_char_closing_letters -> main
    
    = three
        ~ letters_fourthCharLetters_three()
        -> fourth_char_closing_letters -> main

    = four
        ~ letters_fourthCharLetters_four()
        -> fourth_char_closing_letters -> main

=== fifth_character_notes ===

    + {are_two_entities_together(DoggoFifthLetters, PG)}[DoggoFifthLetters]
    
        
        {
            - grimoire_fifthChar hasnt grimFifthCharLetterOne:
                -> one
                
            - grimoire_fifthChar hasnt grimFifthCharLetterTwo:
                -> two
        
                
            - grimoire_fifthChar hasnt grimFifthCharLetterThree:
                -> three

            - grimoire_fifthChar hasnt grimFifthCharLetterFour:
                -> four

        }
        
     = one
        ~ letters_fifthCharLetters_one()
        -> fifth_char_closing_letters -> main

    = two
        ~ letters_fifthCharLetters_two()
        -> fifth_char_closing_letters -> main
    
    = three
        ~ letters_fifthCharLetters_three()
        -> fifth_char_closing_letters -> main

    = four
        ~ letters_fifthCharLetters_four()
        -> fifth_char_closing_letters -> main    