=== automatic_storylets ===
{debug: passo per automatic_storylets.}

{   
    //Prima faccio un check lato pausa dialogo, perché se c'è la pausa, non c'è nessuno storylet
    - png_commonPauseTalking == true:
        ->->
}


/*******************************************

            STORYLETS COLLETTIVI

*******************************************/

{

    //Tra PNG e la strega
        - are_two_entities_together(Mentor, PG) && are_two_entities_together(TheWitch, PG) && little_storylets.talkingWitch && grimoire_fifthChar hasnt grimMentorWitchOne:
            -> the_witch_and_the_mentor

        - are_two_entities_together (ThirdCharacter, PG) && are_two_entities_together(TheWitch, PG) && grimoire_thirdChar hasnt grimWitchThirdChar:
            -> the_witch_and_the_men
    
    //Tra PNG
        //Chiacchiere tra Riccio e Chitarra
        - are_two_entities_together(FirstCharacter, PG) && are_two_entities_together(SecondCharacter, PG) && grimoire_firstChar hasnt grimFirstSecondChar:
            -> first_second_chit_chat

        //Chiacchiere tra Riccio e PNG3
        - are_two_entities_together(ThirdCharacter, PG) && are_two_entities_together(SecondCharacter, PG) && grimoire_secondChar hasnt grimSecondThirdChar && grimoire_thirdChar has grimThirdCharOne:
            -> third_second_chit_chat        

        //Chiacchiere tra Chitarra e PNG3
        - are_two_entities_together(ThirdCharacter, PG) && are_two_entities_together(FirstCharacter, PG) && grimoire_firstChar hasnt grimFirstThirdChar && grimoire_thirdChar has grimThirdCharTwo:
            -> third_first_chit_chat 

    
    //Con PNG e Mentore
        //Mentore e Riccio parlano dopo il litigio. Parte fintanto che riccio non ha cucinato da solo.
        - are_two_entities_together(Mentor, PG) && are_two_entities_together(SecondCharacter, PG) && grimoire_fifthChar has grimMentorViolence && grimoire_fifthChar hasnt grimSecondCharMentorPeace: 
            -> about_violence_and_peace
        
        //Riccio ha cucinato, e vediamo la scena del dono
        - are_two_entities_together(SecondCharacter, PG) && are_two_entities_together(Mentor, PG) && kitchen_secondCharHasCooked == true && grimoire_fifthChar has grimSecondCharMentorPeace && grimoire_secondChar hasnt grimSecondCharKitchenAlone:
            -> food_gift_second_char        
        
        //Chiacchiere tra Chitarra e Mentore
        //Su di loro
        - are_two_entities_together(FirstCharacter, PG) && are_two_entities_together(Mentor, PG) && grimoire_firstChar has grimFirstCharThree && grimoire_firstChar hasnt grimFirstCharMentor:
            -> first_mentor_chit_chat
        
        //In merito a Boccale
        - are_two_entities_together(FirstCharacter, PG) && are_two_entities_together(Mentor, PG) && not are_two_entities_together(ThirdCharacter, PG) && grimoire_thirdChar has grimFourthCharThree && grimoire_firstChar hasnt grimFirstCharMentorAboutThirdChar:
            -> first_mentor_about_third_char
        
        //Chiacchiere tra Franco e Mentore
        - are_two_entities_together(Mentor, PG) && grimoire_fifthChar has grimMentorIntro && are_two_entities_together (Franco, PG) && grimoire_fifthChar hasnt grimMentorFranco && frog_commonStoryletsPause == 0:
            -> frog_and_mentor_chit_chat
        
        //Chiacchiera tra PNG3 e Mentore
        - are_two_entities_together(ThirdCharacter, PG) && are_two_entities_together(Mentor, PG) && grimoire_thirdChar has grimThirdCharTwo && grimoire_thirdChar hasnt grimThirdCharMentor:
            -> third_mentor_chit_chat

    //Con PNG e Franco
        //Chiacchiera tra Chitarra e Franco                
        - are_two_entities_together(FirstCharacter, PG) && are_two_entities_together(Franco, PG) && grimoire_firstChar hasnt grimFirstCharFranco && frog_commonStoryletsPause == 0:
            -> frog_and_first_char_chit_chat

        //Chiacchiera tra Riccio e Franco
        - are_two_entities_together(SecondCharacter, PG) && are_two_entities_together(Franco, PG) && grimoire_secondChar hasnt grimSecondCharFranco && frog_commonStoryletsPause == 0:
            -> frog_and_second_char_chit_chat

        //Chiacchiera tra Boccale e Franco
        - are_two_entities_together(ThirdCharacter, PG) && are_two_entities_together(Franco, PG) && grimoire_thirdChar hasnt grimThirdCharFranco && frog_commonStoryletsPause == 0:
            -> frog_and_third_char_chit_chat
    
    //Altre
        //Scambio tra Riccio e Carla
        - are_two_entities_together(SecondCharacter, PG) && are_two_entities_together(Carla, PG) && grimoire_secondChar hasnt grimSecondCharCarla:
            -> carla_and_second_char_chit_chat
        
        //Primo commento di Franco quando entriamo nel nest con lui
        - are_two_entities_together(Franco, PG) && entity_location(PG) == Nest && nest_francoChosenSigil == () && not special_mission_one_contents:
            -> special_mission_one_contents
        
        //Missione speciale Franco chiusa
        - are_two_entities_together(Franco, PG) && entity_location(PG) == Nest && nest_francoChosenSigil != () && special_mission_one_contents:
            -> special_mission_one_closed 
}  

/*******************************************

            STORYLETS SOLITARI
            AUTOMATICI

*******************************************/
 //Storylets speciali First Character
{   
    //Cucina
        //Chitarra ha cucinato, e vediamo la scena del dono (a sé stessa)
        - are_two_entities_together(FirstCharacter, PG) && kitchen_firstCharHasCooked == true && kitchen_firstCharIsCooking == false && grimoire_firstChar hasnt grimFirstCharKitchenAlone:
            -> food_gift_first_char

    //Racconto di Aza letto
        - are_two_entities_together(FirstCharacter, PG) && library_readStories has Aza && grimoire_firstChar hasnt grimFirstCharNovel:
            -> a_story_of_revenge
    
    //Commento sul cane    
        - are_two_entities_together(FirstCharacter, PG) && (grimoire_secondChar has grimSecondCharLetterOne or grimoire_thirdChar has grimThirdCharLetterOne) && grimoire_firstChar hasnt grimFirstCharDog:
            -> dog_first_char 

    //Commento su fuga Boccale
        -  are_two_entities_together(FirstCharacter, PG) && thirdChar_storyStatus == story_storyRemote && grimoire_firstChar hasnt grimFirstCharThirdCharDepartureComment:    
            -> first_char_third_char_departure_comment

    //Commento su partenza Riccio
        -  are_two_entities_together(FirstCharacter, PG) && secondChar_storyStatus == story_storyPostal && grimoire_firstChar hasnt grimFirstCharSecondCharDepartureComment:    
            -> first_char_second_char_departure_comment        
}

//Storylets speciali Second Char
{
    //Lettura Riccio
        - are_two_entities_together(SecondCharacter, PG) && library_readStories has Lamia && grimoire_secondChar hasnt grimSecondCharNovel:
            -> a_story_of_rebellion
                
    //Commento sul cane    
        - are_two_entities_together(SecondCharacter, PG) && (grimoire_firstChar has grimFirstCharLetterOne or grimoire_thirdChar has grimThirdCharLetterOne) && grimoire_secondChar hasnt grimSecondCharDog:
            -> dog_second_char

    //Commento su fuga Boccale
        -  are_two_entities_together(SecondCharacter, PG) && thirdChar_storyStatus == story_storyRemote && grimoire_secondChar hasnt grimSecondCharThirdCharDepartureComment:    
            -> second_char_third_char_departure_comment

    //Commento su partenza Chitarra
        -  are_two_entities_together(SecondCharacter, PG) && firstChar_storyStatus == story_storyPostal && grimoire_secondChar hasnt grimSecondCharFirstCharDepartureComment:    
            -> second_char_first_char_departure_comment              

}

//Storylets speciali Third Char
{
    //Boccale ha cucinato, e vediamo la scena del dono
        - are_two_entities_together(ThirdCharacter, PG)  && kitchen_thirdCharHasCooked == true  && kitchen_thirdCharIsCooking == false && grimoire_thirdChar hasnt grimThirdCharKitchenAlone:
            -> food_gift_third_char            

    //Lettura Boccale
        - are_two_entities_together(ThirdCharacter, PG) && library_readStories has Maura && grimoire_thirdChar hasnt grimThirdCharNovel:
            -> third_read_story_library
                
    //Commento sul cane    
        - are_two_entities_together(ThirdCharacter, PG) && (grimoire_firstChar has grimFirstCharLetterOne or grimoire_secondChar has grimSecondCharLetterOne) && grimoire_thirdChar hasnt grimThirdCharDog:
            -> dog_third_char        

    //Commento su partenza Riccio
        -  are_two_entities_together(ThirdCharacter, PG) && secondChar_storyStatus == story_storyPostal && grimoire_thirdChar hasnt grimThirdCharSecondCharDepartureComment:    
            -> third_char_second_char_departure_comment              

    //Commento su partenza Chitarra
        -  are_two_entities_together(ThirdCharacter, PG) && firstChar_storyStatus == story_storyPostal && grimoire_thirdChar hasnt grimThirdCharFirstCharDepartureComment:    
            -> third_char_first_char_departure_comment             
} 


//Speciali della strega
{
    //Apertura di tutti i sigilli
    - LIST_COUNT(story_endedStories) > 4 && grimoire_witch hasnt grimWitchAllSigilsOpened: 
        -> witch_allSigils_opening    
}

//Infine:
//Check frase ansiosa di Mentore
    -> talk_to_me

->->