VAR firstChar_PondInvite = false
VAR secondChar_ForestInvite = false
VAR thirdChar_LibraryInvite = false

=== automatic_storylets ===
{debug: passo per automatic_storylets.}
/*******************************************

            APERTURE LUOGHI

*******************************************/
{
    //Invito allo stagno per aprire la cucina
    - are_two_entities_together(FirstCharacter, PG) && ((LIST_COUNT(grimoire_firstChar) + LIST_COUNT(grimoire_secondChar) + LIST_COUNT(grimoire_thirdChar)) > openingKitchen_delay) && contentsPond hasnt PG && player_accessiblePlaces hasnt Kitchen:

            {stopping:
                - Ehi {player_name}! Vediamoci allo stagno. Ho una cosa da mostrarti!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
                - Scusa, prima c'erano cose più importanti da fare, ma ritroviamoci allo stagno, è importante!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
                - La terza sarà la volta buona, spero. Ti aspetto allo stagno, preparati perché è una cosa fighissima!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
                - Bene, vediamo se è l'ultima volta. Vediamoci allo stagno {player_name}, così ti mostro quello che ho combinato!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
            }
                ~ move_entity(FirstCharacter, Pond)
                ~ firstChar_PondInvite = true
                    ->->   
            
    //Apertura cucina
    - are_two_entities_together(FirstCharacter, PG) && ((LIST_COUNT(grimoire_firstChar) + LIST_COUNT(grimoire_secondChar) + LIST_COUNT(grimoire_thirdChar)) > openingKitchen_delay) && entity_location(PG) == Pond && player_accessiblePlaces hasnt Kitchen && png_commonPauseTalking == false:
        -> open_the_kitchen

    //Invito alla foresta per aprire la biblioteca
    - are_two_entities_together(SecondCharacter, PG) && ((LIST_COUNT(grimoire_firstChar) + LIST_COUNT(grimoire_secondChar) + LIST_COUNT(grimoire_thirdChar)) > openingLibrary_delay) && contentsForest hasnt PG && contentsKitchen hasnt PG  && player_accessiblePlaces hasnt Library:
        
            {stopping:
                - Ehi {player_name}! Troviamoci alla foresta. Ho una cosa che devi vedere!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_energy
                - Uffa, prima c'era una cosa più importante ma ora dobbiamo assolutamente parlare alla foresta, vieni!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_energy
                - Vieni alla foresta, che ti dico quella cosa importante, che non c'è mica una quarta volta vero?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                - Mi arrendo. Vediamoci alla foresta, ho una cosa da farti vedere.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
            }
                ~ move_entity(SecondCharacter, Forest)
                ~ secondChar_ForestInvite = true
                ->->   


    //Apertura biblioteca    
        - are_two_entities_together(SecondCharacter, PG) && ((LIST_COUNT(grimoire_firstChar) + LIST_COUNT(grimoire_secondChar) + LIST_COUNT(grimoire_thirdChar)) > openingLibrary_delay) && entity_location(PG) == Forest && player_accessiblePlaces hasnt Library && png_commonPauseTalking == false:
            -> open_the_library

    //Invito in biblioteca per aprire il nido
        - are_two_entities_together(ThirdCharacter, PG) && ((LIST_COUNT(grimoire_firstChar) + LIST_COUNT(grimoire_secondChar) + LIST_COUNT(grimoire_thirdChar)) > openingNest_delay) && contentsLibrary hasnt PG && contentsKitchen hasnt PG && player_accessiblePlaces hasnt Nest && player_accessiblePlaces has Library:
            
                {stopping:
                    - Ehi {player_name}! Troviamoci in biblioteca. Ho una cosa che devi vedere!
                }
                    ~ move_entity(ThirdCharacter, Library)
                    ~ thirdChar_LibraryInvite = true
                    ->->   

    //Apertura biblioteca    
        - are_two_entities_together(ThirdCharacter, PG) && ((LIST_COUNT(grimoire_firstChar) + LIST_COUNT(grimoire_secondChar) + LIST_COUNT(grimoire_thirdChar)) > openingNest_delay) && LIST_COUNT(grimoire_thirdChar) >= 2 && entity_location(PG) == Library && player_accessiblePlaces hasnt Nest && png_commonPauseTalking == false:
            -> open_the_nest

    //Apertura della discarica
        - grimoire_thirdChar has grimThirdCharOne && (entity_location(FromForestToDump) == Safekeeping) && (entity_location(PG) != Forest) && grimoire_witch hasnt grimWitchOpenDump:
                -> open_the_dump
}

/*******************************************

            STORYLETS COLLETTIVI

*******************************************/
{

    //Feedback da parte di Mentore su pensieri strega se le abbiamo detto che abbiamo parlato con lei
        - are_two_entities_together(Mentor, PG) && are_two_entities_together(TheWitch, PG) && little_storylets.talkingWitch && grimoire_fifthChar hasnt grimMentorWitchOne && png_commonPauseTalking == false:
            -> the_witch_and_the_mentor
    
    //Tra PNG
        //Chiacchiere tra Riccio e Chitarra
        - are_two_entities_together(FirstCharacter, PG) && are_two_entities_together(SecondCharacter, PG) && png_commonPauseTalking == false && grimoire_firstChar hasnt grimFirstSecondChar:
            -> first_second_chit_chat

        //Chiacchiere tra Riccio e PNG3
        - are_two_entities_together(ThirdCharacter, PG) && are_two_entities_together(SecondCharacter, PG) && png_commonPauseTalking == false && grimoire_secondChar hasnt grimSecondThirdChar:
            -> third_second_chit_chat        

        //Chiacchiere tra Chitarra e PNG3
        - are_two_entities_together(ThirdCharacter, PG) && are_two_entities_together(FirstCharacter, PG) && png_commonPauseTalking == false && grimoire_firstChar hasnt grimFirstThirdChar:
            -> third_first_chit_chat 

    
    //Con PNG e Mentore
        //Mentore e Riccio parlano dopo il litigio. Parte fintanto che riccio non ha cucinato da solo.
        - are_two_entities_together(Mentor, PG) && are_two_entities_together(SecondCharacter, PG) && png_commonPauseTalking == false && grimoire_fifthChar has grimMentorViolence && grimoire_fifthChar hasnt grimSecondCharMentorPeace: 
            -> about_violence_and_peace
        
        //Riccio ha cucinato, e vediamo la scena del dono
        - are_two_entities_together(SecondCharacter, PG) && are_two_entities_together(Mentor, PG) && second_char_cooking_tracker && kitchen_secondCharIsCooking == false && about_violence_and_peace && png_commonPauseTalking == false && (not food_gift_second_char):
            -> food_gift_second_char        
        
        //Chiacchiere tra Chitarra e Mentore
        - are_two_entities_together(FirstCharacter, PG) && are_two_entities_together(Mentor, PG) && first_char_main_storylets.three  && png_commonPauseTalking == false && not first_mentor_chit_chat:
            -> first_mentor_chit_chat
        
        //Chiacchiere tra Franco e Mentore
        - are_two_entities_together(Mentor, PG) && tutorial_mentorTalkingChoiceRelationship && are_two_entities_together (Franco, PG)  && png_commonPauseTalking == false && not frog_and_mentor_chit_chat:
            -> frog_and_mentor_chit_chat
        
        //Chiacchiera tra PNG3 e Mentore
        - are_two_entities_together(ThirdCharacter, PG) && are_two_entities_together(Mentor, PG) && png_commonPauseTalking == false && third_char_main_storylets.one && not third_mentor_chit_chat:
            -> third_mentor_chit_chat

    
    //Con PNG e Franco
        //Chiacchiera tra Chitarra e Franco                
        - are_two_entities_together(FirstCharacter, PG) && are_two_entities_together(Franco, PG) && png_commonPauseTalking == false && not frog_and_first_char_chit_chat :
            -> frog_and_first_char_chit_chat

        //Chiacchiera tra Riccio e Franco
        - are_two_entities_together(SecondCharacter, PG) && are_two_entities_together(Franco, PG) && png_commonPauseTalking == false && not frog_and_second_char_chit_chat :
            -> frog_and_second_char_chit_chat

        //Chiacchiera tra Tre e Franco
        - are_two_entities_together(ThirdCharacter, PG) && are_two_entities_together(Franco, PG) && png_commonPauseTalking == false && not frog_and_third_char_chit_chat :
            -> frog_and_third_char_chit_chat
    
    //Altre
        //Scambio tra Riccio e Carla
        - are_two_entities_together(SecondCharacter, PG) && are_two_entities_together(Carla, PG) && png_commonPauseTalking == false && not carla_and_second_char_chit_chat:
            -> carla_and_second_char_chit_chat
        
        //Primo commento di Franco quando entriamo nel nest con lui
        - are_two_entities_together(Franco, PG) && entity_location(PG) == Nest && nest_francoChosenSigil == () && not special_mission_one_contents:
            -> special_mission_one_contents
        
        //Missione speciale Franco chiusa
        - are_two_entities_together(Franco, PG) && entity_location(PG) == Nest && nest_francoChosenSigil != ():
            -> special_mission_one_closed 
}  


/*******************************************

            STORYLETS SOLITARI
            AUTOMATICI

*******************************************/
 //Storylets speciali First Character
{   
    //Cucina
        //Chitarra sta cucinando ed entriamo in cucina
        - are_two_entities_together(FirstCharacter, PG) && entity_location(PG) == Kitchen && png_commonPauseTalking == false:
            -> first_char_cooking_alone
    
        //Chitarra ha cucinato, e vediamo la scena del dono (a sé stessa)
        - are_two_entities_together(FirstCharacter, PG) && first_char_cooking_tracker && kitchen_firstCharIsCooking == false && png_commonPauseTalking == false && not food_gift_first_char:
            -> food_gift_first_char
        
        //Chitarra cucina con noi
        -  are_two_entities_together(FirstCharacter, PG) && entity_location(PG) == Kitchen && not ending_cooking_with_first_char && kitchen_firstCharIsCooking == false:
            -> cooking_with_first_char
        
    //Racconto di Aza letto
        - are_two_entities_together(FirstCharacter, PG) && library_readStories has Aza && png_commonPauseTalking == false && not a_story_of_revenge:
            -> a_story_of_revenge
    
    //Commento sul cane    
        - are_two_entities_together(FirstCharacter, PG) && second_character_notes.one or third_character_notes.one && png_commonPauseTalking == false && not dog_first_char:
            -> dog_first_char      
            
}

//Storylets speciali Second Char
{
    //Cucina
        //Riccio sta cucinando ed entriamo in cucina
        - are_two_entities_together(SecondCharacter, PG) && entity_location(PG) == Kitchen && kitchen_secondCharIsCooking == true && png_commonPauseTalking == false:
            -> second_char_cooking_alone
    
        //Riccio cucina con noi
        -  are_two_entities_together(SecondCharacter, PG) && entity_location(PG) == Kitchen && not ending_cooking_with_second_char && kitchen_secondCharIsCooking == false:
            -> cooking_with_second_char        

    //Lettura Riccio
    - are_two_entities_together(SecondCharacter, PG) && library_readStories has Lamia && png_commonPauseTalking == false && not a_story_of_rebellion:
        -> a_story_of_rebellion
                
    //Commento sul cane    
        - are_two_entities_together(SecondCharacter, PG) && first_character_notes.one or third_character_notes.one && png_commonPauseTalking == false && not dog_second_char:
            -> dog_second_char

}

//Storylets speciali Third Char
{
    //Cucina
        //Boccale sta cucinando ed entriamo in cucina
        - are_two_entities_together(ThirdCharacter, PG) && entity_location(PG) == Kitchen && kitchen_thirdCharIsCooking == true && png_commonPauseTalking == false:
            -> third_char_cooking_alone
    
        //Boccale cucina con noi
        -  are_two_entities_together(ThirdCharacter, PG) && entity_location(PG) == Kitchen && not ending_cooking_with_third_char && kitchen_thirdCharIsCooking == false:
            -> cooking_with_third_char

        //Boccale ha cucinato, e vediamo la scena del dono
        - are_two_entities_together(ThirdCharacter, PG) && third_char_cooking_tracker && kitchen_thirdCharIsCooking == false && png_commonPauseTalking == false && not food_gift_third_char:
            -> food_gift_third_char            

    //Lettura Boccale
    - are_two_entities_together(ThirdCharacter, PG) && library_readStories has Lamia && png_commonPauseTalking == false && not a_story_of_rebellion:
        -> third_read_story_library
                
    //Commento sul cane    
        - are_two_entities_together(ThirdCharacter, PG) && first_character_notes.one or second_character_notes.one && png_commonPauseTalking == false && not dog_third_char:
            -> dog_third_char        
} 


//Speciali della strega
{
    //Apertura di tutti i sigilli
    - LIST_COUNT(story_endedStories) > 4 && grimoire_witch hasnt grimWitchAllSigilsOpened: 
        -> witch_allSigils_opening    
}

//Infine:
//Check frasina ansiosa di Mentore
-> talk_to_me ->

->->