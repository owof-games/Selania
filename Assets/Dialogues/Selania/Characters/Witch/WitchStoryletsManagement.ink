=== witch_storylets_management
    {    
        
        //Check per intro
        - grimoire_witch hasnt grimWitchIntro:
            -> witch_intro

        //Conversazione con Boccale
        - are_two_entities_together (ThirdCharacter, PG) && are_two_entities_together(TheWitch, PG) && grimoire_thirdChar hasnt grimWitchThirdChar:
            -> the_witch_and_the_men
        
        
        //Gli storylets sopra devono comparire a prescindere dalla pausa, poi è la pausa a dettare se gli altri ci saranno o meno
        -  witch_pauseTalking > 0:
            -> descriptions

        //Tutorials
        - are_two_entities_together(TheWitch, PG) && entity_location(PG) == Dump && grimoire_witch has grimWitchIntro && grimoire_fifthChar has grimMentorIntro && grimoire_witch hasnt grimChoicesWitch:
            -> tutorial_witchRelationship

        - are_two_entities_together(TheWitch, PG) && entity_location(PG) == Dump && player_accessiblePlaces has Nest && grimoire_witch has grimChoicesWitch && grimoire_witch hasnt grimSigilsWitch:
            -> tutorial_witchSigils    

        //Feedback post riscrittura
        - grimoire_witch has grimWitchIntro && LIST_COUNT(story_endedStories) > 0 && grimoire_witch hasnt grimWitchFirstDebrief:
            -> witch_first_debrief

        - grimoire_witch has grimWitchIntro && LIST_COUNT(story_endedStories) > 1 && grimoire_witch hasnt grimWitchSecondDebrief:
            -> witch_second_debrief

        - grimoire_witch has grimWitchIntro && LIST_COUNT(story_endedStories) > 2 && grimoire_witch hasnt grimWitchThirdDebrief:
            -> witch_third_debrief

        - grimoire_witch has grimWitchIntro && LIST_COUNT(story_endedStories) > 3 && grimoire_witch hasnt grimWitchFourthDebrief:
            -> witch_fourth_debrief

        - grimoire_witch has grimWitchIntro && LIST_COUNT(story_endedStories) > 4 && grimoire_witch hasnt grimWitchFifthDebrief:
            -> witch_fifth_debrief    
    

        //Pezzi della sua storia. Compaiono linearmente, in base a quante storie ho fatto fino in fondo.
        - LIST_COUNT(listDumpGraphics) > 0 && grimoire_witch hasnt grimWitchMainOne:
            -> witch_first_confession

        - LIST_COUNT(listDumpGraphics) > 1 && grimoire_witch hasnt grimWitchMainTwo:
            -> witch_second_confession

        - LIST_COUNT(listDumpGraphics) > 2 && grimoire_witch hasnt grimWitchMainThree:
            -> witch_third_confession

        - LIST_COUNT(listDumpGraphics) > 3 && grimoire_witch hasnt grimWitchMainFour:
            -> witch_fourth_confession

        - LIST_COUNT(listDumpGraphics) > 4 && grimoire_witch hasnt grimWitchMainFive:
            -> witch_fifth_confession    
        

        //Commento sul libro
        - grimoire_witch has grimWitchIntro && grimoire_isEnabled && grimoire_witch hasnt grimWitchBook:
            -> about_the_book

        //Dialogo su Franco
        - grimoire_witch has grimWitchIntro && grimoire_franco != () && grimoire_witch hasnt grimWitchFrog:
            -> the_witch_and_the_frog    
        
        - else:
            -> descriptions

    }

