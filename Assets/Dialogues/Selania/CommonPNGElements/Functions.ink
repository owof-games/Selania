//Gestione della pausa per gli storylets comuni e automatici.
VAR png_commonPauseTalking = false

//Gestione degli inviti.
VAR chars_MaxOpenPlacesWaiting = 4

VAR firstChar_PondInvite = false
VAR firstChar_PondWaiting = 0

VAR secondChar_ForestInvite = false
VAR secondChar_ForestWaiting = 0

VAR thirdChar_LibraryInvite = false
VAR thirdChar_LibraryWaiting = 0


//Indicatori per le soglie delle relazioni
// negative:        da -9 a -4 (6 valori)
// neutral:         da -3 a +3 (7 valori)
// positive:        da +4 a +7 (4 valori)
// enthusiastic:    da +8 a +9 (2 valori)
VAR relationshipIndicatorNegativeValue = -4
VAR relationshipIndicatorPositiveValue = 4
VAR relationshipIndicatorEnthusiasticValue = 8
VAR relationshipIndicatorNeutralValue = 0


//Funzione di calcolo dell'affinità tra PNG e PG
=== function affinity_calc(PNG)
~ temp relationshipIndicator = 0
~ temp relationshipStatus = neutral
//prima: check di chi parlo, e assegno il valore della relazione alla variabile temporanea.
{
    - PNG == FirstCharacter:
        ~ relationshipIndicator = firstChar_relationshipIndicator
    
    - PNG == SecondCharacter:
        ~ relationshipIndicator = secondChar_relationshipIndicator

    - PNG == ThirdCharacter:
        ~ relationshipIndicator = thirdChar_relationshipIndicator

    - PNG == FourthCharacter:
        ~ relationshipIndicator = fourthChar_relationshipIndicator

    - PNG == FifthCharacter:
        ~ relationshipIndicator = fifthChar_relationshipIndicator            
}

//uso la variabile temporanea relationshipIndicator per definire lo stato della relazione
{
    - relationshipIndicator <= relationshipIndicatorNegativeValue:
        ~ relationshipStatus = negative

    - relationshipIndicator >= relationshipIndicatorEnthusiasticValue:
        ~ relationshipStatus = enthusiastic

    - (relationshipIndicator >= relationshipIndicatorPositiveValue) && (relationshipIndicator < relationshipIndicatorEnthusiasticValue):
        ~ relationshipStatus = positive

    - else:
        ~ relationshipStatus = neutral
}

//attribuisco lo stato della relazione alla persona corretta.
{
    - PNG == FirstCharacter:
        ~ firstChar_relationshipStatus = relationshipStatus
    
    - PNG == SecondCharacter:
        ~ secondChar_relationshipStatus = relationshipStatus

    - PNG == ThirdCharacter:
        ~ thirdChar_relationshipStatus = relationshipStatus

    - PNG == FourthCharacter:
        ~ fourthChar_relationshipStatus = relationshipStatus

    - PNG == FifthCharacter:
        ~ fifthChar_relationshipStatus = relationshipStatus            
}


//Preparazione alla riscrittura
=== function rewriting_prep(PNG)
{debug: passo per rewriting_prep.}

            //Prima di tutto chiamo la funzione per il calcolo dello stato della relazione
                ~ affinity_calc(PNG)
            //"Trasformo" la relazione in inchiostro
                ~ fromRelationshipToInk(PNG)
            //Mando ai feedback
            {PNG:
                - FirstCharacter:
                    ~ firstAffinityFeedback()

                - SecondCharacter:
                    ~ secondAffinityFeedback()

                - ThirdCharacter:
                    ~ thirdAffinityFeedback()

                - FourthCharacter:
                     ~ fourthAffinityFeedback()

                - FifthCharacter:
                     ~ fifthAffinityFeedback()               

            }

            //Arriva il commento della strega
                ~ inkLevel(PNG)
            //Salvo il massimo di inchiostro raggiunto con la personaggia
                ~ maxInkLevelUpdater(PNG)
            //Vario la variabile glyph_itIsRewriting, così sono sicura che choiceManager mi faccia le dovute moltiplicazioni
                ~ glyph_itIsRewriting = true

=== function rewriting_end(PNG)

        //Disattivo la variabile glyph_itIsRewriting.
            ~ glyph_itIsRewriting = false
    
        //E  genero il nome
            ~ newName(PNG)




=== endingPNGstory(PNG)
//Chiamiamo questa funzione a fine riscrittura, per fare tutti i passaggi previsti di quando finisce una storia.
{
    - PNG == FirstCharacter:
        
        ~ story_endedStories += story_firstCharStoryEnded
        ~ firstChar_storyStatus = story_storyPostal
        ~ firstChar_mailPause = firstChar_mailPauseDuration
            //Spostiamo poi le varianti della PNG
            ~ move_entity(FirstCharacterTriangolo, Safekeeping)
            ~ move_entity(FirstCharacterFlautoDolce, Safekeeping)
            ~ move_entity(FirstCharacterOrchestra, Safekeeping)
            ~ move_entity(FirstCharacterViolino, Safekeeping)
            ~ move_entity(FirstCharacterOcarina, Safekeeping)


    - PNG == SecondCharacter:
        
        ~ story_endedStories += story_secondCharStoryEnded
        ~ secondChar_storyStatus = story_storyPostal
        ~ secondChar_mailPause = secondChar_mailPauseDuration
            //Spostiamo poi le varianti della PNG
            ~ move_entity(SecondCharacterOrso, Safekeeping)
            ~ move_entity(SecondCharacterDelfino, Safekeeping)
            ~ move_entity(SecondCharacterLupo, Safekeeping)
            ~ move_entity(SecondCharacterCapibara, Safekeeping)
            ~ move_entity(SecondCharacterCorvo, Safekeeping)

    - PNG == ThirdCharacter:
        {
            - thirdChar_storyStatus == story_storyStarted:
                ~ thirdChar_storyStatus = story_storyRemote
                ~ thirdChar_mailPause = thirdChar_mailPauseDuration
                 ~ move_entity(ThirdCharacter, Safekeeping)

            - thirdChar_storyStatus == story_storyRemote:
                ~ story_endedStories += story_thirdCharStoryEnded
                ~ thirdChar_storyStatus = story_storyPostal
                //Il ritratto ha senso che compaia solo quando è stato davvero riscritto, praticamente quando lo vediamo a fine gioco
                //Le sue varianti sono già state gestite prima
        }
        
        

    - PNG == FourthCharacter:
        
        ~ story_endedStories += story_fourthCharStoryEnded
        ~ fourthChar_storyStatus = story_storyPostal
        ~ fourthChar_mailPause = fourthChar_mailPauseDuration
            //Spostiamo poi le varianti della PNG
            // ~ move_entity(SecondCharacterOrso, Safekeeping)
            // ~ move_entity(SecondCharacterDelfino, Safekeeping)
            // ~ move_entity(SecondCharacterLupo, Safekeeping)
            // ~ move_entity(SecondCharacterCapibara, Safekeeping)
            // ~ move_entity(SecondCharacterCorvo, Safekeeping)  

    - PNG == FifthCharacter:
        
        ~ story_endedStories += story_fifthCharStoryEnded
        ~ fifthChar_storyStatus = story_storyPostal
        ~ fifthChar_mailPause = fifthChar_mailPauseDuration
            //Spostiamo poi le varianti della PNG
            // ~ move_entity(SecondCharacterOrso, Safekeeping)
            // ~ move_entity(SecondCharacterDelfino, Safekeeping)
            // ~ move_entity(SecondCharacterLupo, Safekeeping)
            // ~ move_entity(SecondCharacterCapibara, Safekeeping)
            // ~ move_entity(SecondCharacterCorvo, Safekeeping)  
        
}

//Cose comuni
    ~ state_ending_stories(PNG)
    ~ tree_advance_management(PNG)
    //Spengo anche qui per sicurezza il moltiplicatore legato alla riscrittura
    ~ glyph_itIsRewriting = false


//Elementi non dipendenti dallx PNG
~ temp currentPlace = entity_location(PG)
~ move_entity(TrainNoiseGoingAway, currentPlace)
//@animation:RewriterBook

-> achievements_onGame_statusUpdate_GM ->        
-> main  
        
    
=== rewriting_witch_feedback(point) ===
LIST rewritingPoints = oneR, twoR, threeR, fourR, endR
//Assegnazione parlante
    {
        - story_endedStories != ():
            ->->
    }

    {
        - point == oneR:
            {charTag(TheWitch, witch_state())}:   <i>{player_name} ha utilizzato la sua prima goccia di inchiostro per compiere una riscrittura.</i>

        - point == twoR:
            {charTag(TheWitch, witch_state())}:   <i>{player_name} ha utilizzato la sua seconda goccia di inchiostro per procedere con la riscrittura.</i>

        - point == threeR:
            {charTag(TheWitch, witch_state())}:   <i>{player_name} ha utilizzato la terza goccia di inchiostro, proponendo una riscrittura.</i>

        - point == fourR:
            {charTag(TheWitch, witch_state())}:   <i>{player_name} ha utilizzato la quarta e ultima unità di inchiostro, compiendo il massimo di riscritture possibili.</i>

        - point == endR:
            {charTag(TheWitch, witch_state())}:     <i>{player_name} sta per utilizzare per la prima volta il potere dell'<b><i>epilogo</b></i>.

    }

->->



=== function characterPortraitsManagement(PNG)
{PNG:
    
    - FirstCharacter:

        ~ move_entity(FirstCharacter, Safekeeping)

        { 
            - firstChar_ActualName == Triangolo:
                ~ return "triangolo"
                
            - firstChar_ActualName == Orchestra:
                ~ return "orchestra"
                
            - firstChar_ActualName == FlautoDolce:
                ~ return "flautoDolce"
                
            - firstChar_ActualName == Ocarina:
                ~ return "ocarina"
                
            - firstChar_ActualName == Violino:
                ~ return "violino"
                
        }  

    - SecondCharacter:

        ~ move_entity(SecondCharacter, Safekeeping)

        {
            - secondChar_ActualName == Orso:
                ~ return "orso"

            - secondChar_ActualName == Lupo:
                ~ return "lupo"
                
            - secondChar_ActualName == Delfino:
                ~ return "delfino"
                
            - secondChar_ActualName == Capibara:
                ~ return "capibara"
                
            - secondChar_ActualName == Corvo:
                ~ return "corvo"
        
        }

    - ThirdCharacter:

        ~ move_entity(ThirdCharacter, Safekeeping)

        {
            - thirdChar_ActualName == Forum:
                ~ return "Forum"

            - thirdChar_ActualName == Canovaccio:
                ~ return "Canovaccio"

            - thirdChar_ActualName == Sigaro:
                ~ return "Sigaro"

            - thirdChar_ActualName == Guantone:
                ~ return "Guantone"

            - thirdChar_ActualName == Cerchio:
                ~ return "Cerchio"                     
        }

    - FourthCharacter:

        ~ move_entity(FourthCharacter, Safekeeping)

        {
            - fourthChar_ActualName == FourthB:
                ~ return "FourthB"

            - fourthChar_ActualName == FourthC:
                ~ return "FourthC"

            - fourthChar_ActualName == FourthD:
                ~ return "FourthD"

            - fourthChar_ActualName == FourthE:
                ~ return "FourthE"

            - fourthChar_ActualName == FourthF:
                ~ return "FourthF"      
        }    
    

    - FifthCharacter:

        ~ move_entity(FifthCharacter, Safekeeping)

        {
            - fifthChar_ActualName == Mostro:
                ~ return "Mostro"
            
            - fifthChar_ActualName == FifthB:
                ~ return "FifthB"

            - fifthChar_ActualName == FifthC:
                ~ return "FifthC"

            - fifthChar_ActualName == FifthD:
                ~ return "FifthD"

            - fifthChar_ActualName == FifthE:
                ~ return "FifthE"

            - fifthChar_ActualName == FifthF:
                ~ return "FifthF"      
        }

}





=== function characterChangingObjects(PNG)
~ temp currentLocation = entity_location(PG)
{PNG:
    
    - FirstCharacter:

        ~ move_entity(FirstCharacter, Safekeeping)

        { 
            - firstChar_ActualName == Triangolo:
                ~ move_entity(FirstCharacterTriangolo, currentLocation)
                ~ move_entity(PaintTriangolo, Bedroom)
                
            - firstChar_ActualName == Orchestra:
                ~ move_entity(FirstCharacterOrchestra, currentLocation)
                ~ move_entity(PaintOrchestra, Bedroom)
                
            - firstChar_ActualName == FlautoDolce:
                ~ move_entity(FirstCharacterFlautoDolce, currentLocation)
                ~ move_entity(PaintFlautoDolce, Bedroom)
                
            - firstChar_ActualName == Ocarina:
                ~ move_entity(FirstCharacterOcarina, currentLocation)
                ~ move_entity(PaintOcarina, Bedroom)
                
            - firstChar_ActualName == Violino:
                ~ move_entity(FirstCharacterViolino, currentLocation)
                ~ move_entity(PaintViolino, Bedroom)
                
        }  

    - SecondCharacter:

        ~ move_entity(SecondCharacter, Safekeeping)

        {
            - secondChar_ActualName == Orso:
                ~ move_entity(SecondCharacterOrso, currentLocation)
                ~ move_entity(PaintOrso, Bedroom)
                
            - secondChar_ActualName == Lupo:
                ~ move_entity(SecondCharacterLupo, currentLocation)
                ~ move_entity(PaintLupo, Bedroom)
                
            - secondChar_ActualName == Delfino:
                ~ move_entity(SecondCharacterDelfino, currentLocation)
                ~ move_entity(PaintDelfino, Bedroom)
                
            - secondChar_ActualName == Capibara:
                ~ move_entity(SecondCharacterCapibara, currentLocation)
                ~ move_entity(PaintCapibara, Bedroom)
                
            - secondChar_ActualName == Corvo:
                ~ move_entity(SecondCharacterCorvo, currentLocation)
                ~ move_entity(PaintCorvo, Bedroom)
        
        }

    - ThirdCharacter:

        ~ move_entity(ThirdCharacter, Safekeeping)

        {
            - thirdChar_ActualName == Forum:
                ~ move_entity(ThirdCharacterForum, currentLocation)
                ~ move_entity(PaintForum, Bedroom)

            - thirdChar_ActualName == Canovaccio:
                ~ move_entity(ThirdCharacterCanovaccio, currentLocation)
                ~ move_entity(PaintCanovaccio, Bedroom)

            - thirdChar_ActualName == Sigaro:
                ~ move_entity(ThirdCharacterSigaro, currentLocation)
                ~ move_entity(PaintSigaro, Bedroom)

            - thirdChar_ActualName == Guantone:
                ~ move_entity(ThirdCharacterGuantone, currentLocation)
                ~ move_entity(PaintGuantone, Bedroom)

            - thirdChar_ActualName == Cerchio:
                ~ move_entity(ThirdCharacterCerchio, currentLocation)
                ~ move_entity(PaintCerchio, Bedroom)                    
        }

    - FourthCharacter:

        ~ move_entity(FourthCharacter, Safekeeping)

        {
            - fourthChar_ActualName == FourthB:
                ~ return "FourthB"

            - fourthChar_ActualName == FourthC:
                ~ return "FourthC"

            - fourthChar_ActualName == FourthD:
                ~ return "FourthD"

            - fourthChar_ActualName == FourthE:
                ~ return "FourthE"

            - fourthChar_ActualName == FourthF:
                ~ return "FourthF"      
        }    
    

    - FifthCharacter:

        ~ move_entity(FifthCharacter, Safekeeping)

        {
            - fifthChar_ActualName == Mostro:
                ~ return "Mostro"
            
            - fifthChar_ActualName == FifthB:
                ~ return "FifthB"

            - fifthChar_ActualName == FifthC:
                ~ return "FifthC"

            - fifthChar_ActualName == FifthD:
                ~ return "FifthD"

            - fifthChar_ActualName == FifthE:
                ~ return "FifthE"

            - fifthChar_ActualName == FifthF:
                ~ return "FifthF"      
        }

}
            

=== grimoire_storylets_updater
                        /******************************

                                Storylets comuni

                        ********************************/


        {
            //First Char
            - first_second_chit_chat && grimoire_firstChar hasnt grimFirstSecondChar:
                ~ grimoire_firstChar += grimFirstSecondChar
                ~ grimoire_secondChar += grimFirstSecondChar
        }

        {
            - first_mentor_chit_chat && grimoire_firstChar hasnt grimFirstCharMentor:
                ~ grimoire_firstChar += grimFirstCharMentor
                ~ grimoire_fifthChar += grimFirstCharMentor
        }

        {
            - first_mentor_about_third_char && grimoire_firstChar hasnt grimFirstCharMentorAboutThirdChar:
                ~ grimoire_firstChar += grimFirstCharMentorAboutThirdChar
                ~ grimoire_fifthChar += grimFirstCharMentorAboutThirdChar
        }

        {
            - frog_and_first_char_chit_chat && grimoire_firstChar hasnt grimFirstCharFranco:
                ~ grimoire_firstChar += grimFirstCharFranco
                ~ grimoire_franco += grimFirstCharFranco
                //Mettiamo in pausa gli storylets con Franco
                ~ frog_commonStoryletsPause = frog_commonStoryletsPauseMaxValue
        }

        {
            - third_first_chit_chat && grimoire_firstChar hasnt grimFirstThirdChar:
                ~ grimoire_firstChar += grimFirstThirdChar
                ~ grimoire_thirdChar += grimFirstThirdChar 
        }

        {
            //Second Char
            - about_violence_and_peace && grimoire_secondChar hasnt grimSecondCharMentorOne:
                ~ grimoire_secondChar += grimSecondCharMentorOne
                ~ grimoire_fifthChar += grimSecondCharMentorOne
        }

        {
            - frog_and_second_char_chit_chat && grimoire_secondChar hasnt grimSecondCharFranco:
                ~ grimoire_secondChar += grimSecondCharFranco
                ~ grimoire_franco += grimSecondCharFranco
                //Mettiamo in pausa gli storylets con Franco
                ~ frog_commonStoryletsPause = frog_commonStoryletsPauseMaxValue
        }

        {
            - third_second_chit_chat && grimoire_secondChar hasnt grimSecondThirdChar:
                ~ grimoire_secondChar += grimSecondThirdChar
                ~ grimoire_thirdChar += grimSecondThirdChar
        }


        {
            //Third Char
            - third_mentor_chit_chat && grimoire_thirdChar hasnt grimThirdCharMentor:
                ~ grimoire_thirdChar += grimThirdCharMentor
                ~ grimoire_fifthChar += grimThirdCharMentor 
        }

        {   
            //Il .forward è fondamentale o mi compare la situazione anche se non ho fatto la scelta
            - the_witch_and_the_men.forward && grimoire_thirdChar hasnt grimWitchThirdChar:
                ~ grimoire_thirdChar += grimWitchThirdChar
                ~ grimoire_witch += grimWitchThirdChar

            - the_witch_and_the_men.no && grimoire_thirdChar hasnt grimWitchThirdCharNo:
                ~ grimoire_thirdChar += grimWitchThirdCharNo
                ~ grimoire_witch += grimWitchThirdCharNo

        }
        {   
            //Il .end è sia se dono che no il mio corpo a Strega.
            - the_witch_and_the_men.end && witch_thirdCharSummoned == true:
                //In questo modo Boccale può riprendere a girellare
                ~ witch_thirdCharSummoned = false
                //E lo spostiamo al pond, dove potrebbe esserci almeno un'altra personaggia, così favoriamo la possibilità di una conversazione a due
                ~ move_entity(ThirdCharacter, Pond)
        }

        {
            - frog_and_third_char_chit_chat && grimoire_thirdChar hasnt grimThirdCharFranco:
                ~ grimoire_thirdChar += grimThirdCharFranco
                ~ grimoire_franco += grimThirdCharFranco
                //Mettiamo in pausa gli storylets con Franco
                ~ frog_commonStoryletsPause = frog_commonStoryletsPauseMaxValue
        }


        {
            //Mentor
            - the_witch_and_the_mentor && grimoire_fifthChar hasnt grimMentorWitchOne:
                ~ grimoire_fifthChar += grimMentorWitchOne
                ~ grimoire_witch += grimMentorWitchOne
                {
                    - player_somethingStrange has strangeVase:
                        ~ player_somethingStrange -= strangeVase

                }
        }

        {
            - frog_and_mentor_chit_chat && grimoire_fifthChar hasnt grimMentorFranco:
                ~ grimoire_fifthChar += grimMentorFranco
                ~ grimoire_franco += grimMentorFranco
                ~ player_somethingStrangeTalkable += strangeMentor
                //Mettiamo in pausa gli storylets con Franco
                ~ frog_commonStoryletsPause = frog_commonStoryletsPauseMaxValue
        }


        {
            //Feedback sulle png
            - first_character_feedback && grimoire_firstChar hasnt grimFirstCharMentorFeedback:
                ~ grimoire_firstChar += grimFirstCharMentorFeedback
        }

        {
            - second_character_feedback && grimoire_secondChar hasnt grimSecondCharMentorFeedback:
                ~ grimoire_secondChar += grimSecondCharMentorFeedback
        }

        {
            - third_character_feedback && grimoire_thirdChar hasnt grimThirdCharMentorFeedback:
                ~ grimoire_thirdChar += grimThirdCharMentorFeedback
        }

        {
            - fourth_character_feedback && grimoire_fourthChar hasnt grimFourthCharMentorFeedback:
                ~ grimoire_fourthChar += grimFourthCharMentorFeedback
        }

        {
            - fifth_character_feedback && grimoire_fifthChar hasnt grimFifthCharMentorFeedback:
                ~ grimoire_fifthChar += grimFifthCharMentorFeedback    

        }
        //Nonna e Mostro
        {
            - monster_and_molotov_one && grimoire_fifthChar hasnt grimMonsterMolotovOne:
                ~ grimoire_fourthChar += grimMonsterMolotovOne
                ~ grimoire_fifthChar += grimMonsterMolotovOne   
        }

        {
            - monster_and_molotov_two && grimoire_fifthChar hasnt grimMonsterMolotovTwo:
                ~ grimoire_fourthChar += grimMonsterMolotovTwo
                ~ grimoire_fifthChar += grimMonsterMolotovTwo   
        }

        {
            - monster_and_molotov_three && grimoire_fifthChar hasnt grimMonsterMolotovThree:
                ~ grimoire_fourthChar += grimMonsterMolotovThree
                ~ grimoire_fifthChar += grimMonsterMolotovThree   
        }

        {
            - monster_and_molotov_four && grimoire_fifthChar hasnt grimMonsterMolotovFour:
                ~ grimoire_fourthChar += grimMonsterMolotovFour
                ~ grimoire_fifthChar += grimMonsterMolotovFour   
        }

        {
            - monster_and_molotov_five && grimoire_fifthChar hasnt grimMonsterMolotovFive:
                ~ grimoire_fourthChar += grimMonsterMolotovFive
                ~ grimoire_fifthChar += grimMonsterMolotovFive   
        }

        {
            - monster_and_molotov_six && grimoire_fifthChar hasnt grimMonsterMolotovSix:
                ~ grimoire_fourthChar += grimMonsterMolotovSix
                ~ grimoire_fifthChar += grimMonsterMolotovSix   
        }

                        /******************************

                            Storylets FirstCharacter

                        ********************************/


         {
            //Main storylets
            - first_char_main_storylets.one && grimoire_firstChar hasnt grimFirstCharOne:
                ~ grimoire_firstChar += grimFirstCharOne
        }

        {
            - first_char_main_storylets.one.firstPresentation:
                ~ grimoire_firstChar += grimFirstCharPresentation
        }

        {
            - first_char_main_storylets.two && grimoire_firstChar hasnt grimFirstCharTwo:
                ~ grimoire_firstChar += grimFirstCharTwo
        }

        {
            - first_char_main_storylets.three && grimoire_firstChar hasnt grimFirstCharThree:
                ~ grimoire_firstChar += grimFirstCharThree    
        }

        {
            - first_char_main_storylets.four && grimoire_firstChar hasnt grimFirstCharFour:
                ~ grimoire_firstChar += grimFirstCharFour  
        }

        {
            - first_char_main_storylets.five && grimoire_firstChar hasnt grimFirstCharFive:
                ~ grimoire_firstChar += grimFirstCharFive
        }

        {
            - first_char_main_storylets.six && grimoire_firstChar hasnt grimFirstCharSix:
                ~ grimoire_firstChar += grimFirstCharSix
        }

        {
            - first_char_main_storylets.seven && grimoire_firstChar hasnt grimFirstCharSeven:
                ~ grimoire_firstChar += grimFirstCharSeven
        }

        {
            - first_char_main_storylets.eight && grimoire_firstChar hasnt grimFirstCharEight:
                ~ grimoire_firstChar += grimFirstCharEight    
        }

        {
            - first_char_main_storylets.nine && grimoire_firstChar hasnt grimFirstCharNine:
                ~ grimoire_firstChar += grimFirstCharNine  
        }

        {
            - first_char_main_storylets.ten && grimoire_firstChar hasnt grimFirstCharTen:
                ~ grimoire_firstChar += grimFirstCharTen 
        }

        {
            - first_char_main_storylets.eleven && grimoire_firstChar hasnt grimFirstCharEleven:
                ~ grimoire_firstChar += grimFirstCharEleven   
        }

        {
            - first_char_main_storylets.twelve && grimoire_firstChar hasnt grimFirstCharTwelve:
                ~ grimoire_firstChar += grimFirstCharTwelve
        }




        {
            //Storylets legati alla cucina
            - cooking_with_first_char.first_theme && grimoire_firstChar hasnt grimFirstCharKitchenOne:
                ~ grimoire_firstChar += grimFirstCharKitchenOne  
        }

        {
            - cooking_with_first_char.second_theme && grimoire_firstChar hasnt grimFirstCharKitchenTwo:
                ~ grimoire_firstChar += grimFirstCharKitchenTwo     
        }

        {
            - cooking_with_first_char.third_theme && grimoire_firstChar hasnt grimFirstCharKitchenThree:
                ~ grimoire_firstChar += grimFirstCharKitchenThree
        }

        {
            - ending_cooking_with_first_char && grimoire_firstChar hasnt grimFirstCharKitchenEnded:
                ~ grimoire_firstChar += grimFirstCharKitchenEnded 
        }

        {
            - food_gift_first_char && grimoire_firstChar hasnt grimFirstCharKitchenAlone:
                ~ grimoire_firstChar += grimFirstCharKitchenAlone                
        }




        {
            //Riscrittura
            - rewriting_proposal_first_character.confession && grimoire_firstChar hasnt grimFirstCharProposal:
                ~ grimoire_firstChar += grimFirstCharProposal
        }

        {
            - rewriting_proposal_first_character.close && grimoire_firstChar hasnt grimFirstCharNewName:
                ~ grimoire_firstChar += grimFirstCharNewName
        }

        {
            - rewriting_proposal_first_character.secret_ending && grimoire_fifthChar hasnt grimMentorFirstSecretEnding:
                ~ grimoire_fifthChar += grimMentorFirstSecretEnding
        }



        {    
            //Storylets speciali
            - open_the_kitchen && grimoire_firstChar hasnt grimFirstOpenKitchen:
                ~ grimoire_firstChar += grimFirstOpenKitchen
                ~ grimoire_appendices += grimFirstOpenKitchen
                //Cose legate all'evento
                ~ kitchen_cookingAloneCoolDown = kitchen_cookingAloneCoolDownMAX
                ~ firstChar_PondInvite = true
        }

        {
            - a_story_of_revenge && grimoire_firstChar hasnt grimFirstCharNovel:
                ~ grimoire_firstChar += grimFirstCharNovel
        }   

        {
            - first_char_third_char_departure_comment && grimoire_firstChar hasnt grimFirstCharThirdCharDepartureComment:
                ~ grimoire_firstChar += grimFirstCharThirdCharDepartureComment
        }

        {
            - first_char_second_char_departure_comment && grimoire_firstChar hasnt grimFirstCharSecondCharDepartureComment:
                ~ grimoire_firstChar += grimFirstCharSecondCharDepartureComment
        } 


        {
            - dog_first_char && grimoire_firstChar hasnt grimFirstCharDog:
                ~ grimoire_firstChar += grimFirstCharDog
        }



                        /******************************

                            Storylets SecondCharacter

                        ********************************/
         {
            //Main storylets
            - second_char_main_storylets.one && grimoire_secondChar hasnt grimSecondCharOne:
                ~ grimoire_secondChar += grimSecondCharOne
                //Dopo la prima chiacchierata lo sposto al pond, così almeno il discorso su Franco ha senso
                ~ move_entity(SecondCharacter, Pond)
        }

        {
            - second_char_main_storylets.one.nameSecond:
                ~ grimoire_secondChar += grimSecondCharPresentation
        }


        {    
            - second_char_main_storylets.two && grimoire_secondChar hasnt grimSecondCharTwo:
                ~ grimoire_secondChar += grimSecondCharTwo
                //sblocco a Riccio la possibilità di avere storylets automatici
                ~ secondChar_frogPresentationPause = false
        }

        {
            - second_char_main_storylets.him_liar && (grimoire_secondChar hasnt grimSecondCharThreeHim or grimoire_secondChar hasnt grimSecondCharThreeHer or grimoire_secondChar hasnt grimSecondCharThreeThey):
                ~ grimoire_secondChar += grimSecondCharThreeHim   
        }

        {
             - second_char_main_storylets.her_liar && (grimoire_secondChar hasnt grimSecondCharThreeHim or grimoire_secondChar hasnt grimSecondCharThreeHer or grimoire_secondChar hasnt grimSecondCharThreeThey):
                ~ grimoire_secondChar += grimSecondCharThreeHer    
        }

        {
            - second_char_main_storylets.they_liar && (grimoire_secondChar hasnt grimSecondCharThreeHim or grimoire_secondChar hasnt grimSecondCharThreeHer or grimoire_secondChar hasnt grimSecondCharThreeThey):
                ~ grimoire_secondChar += grimSecondCharThreeThey    
        }

        {
            - second_char_main_storylets.four && grimoire_secondChar hasnt grimSecondCharFour:
                ~ grimoire_secondChar += grimSecondCharFour  
        }

        {
            - second_char_main_storylets.five && grimoire_secondChar hasnt grimSecondCharFive:
                ~ grimoire_secondChar += grimSecondCharFive
        }

        {
            - second_char_main_storylets.six && grimoire_secondChar hasnt grimSecondCharSix:
                ~ grimoire_secondChar += grimSecondCharSix
        }

        {
            - second_char_main_storylets.seven && grimoire_secondChar hasnt grimSecondCharSeven:
                ~ grimoire_secondChar += grimSecondCharSeven
        }

        {
            - second_char_main_storylets.eight && grimoire_secondChar hasnt grimSecondCharEight:
                ~ grimoire_secondChar += grimSecondCharEight    
        }

        {
            - second_char_main_storylets.nine && grimoire_secondChar hasnt grimSecondCharNine:
                ~ grimoire_secondChar += grimSecondCharNine  
        }

        {
            - second_char_main_storylets.ten && grimoire_secondChar hasnt grimSecondCharTen:
                ~ grimoire_secondChar += grimSecondCharTen 
        }

        {
            - second_char_main_storylets.eleven && grimoire_secondChar hasnt grimSecondCharEleven:
                ~ grimoire_secondChar += grimSecondCharEleven   
        }

        {
            - second_char_main_storylets.twelve && grimoire_secondChar hasnt grimSecondCharTwelve:
                ~ grimoire_secondChar += grimSecondCharTwelve
        }



        {
            //Storylets legati alla cucina
            - cooking_with_second_char.second_theme && grimoire_secondChar hasnt grimSecondCharKitchenOne:
                ~ grimoire_secondChar += grimSecondCharKitchenOne  
        }

        {
            - cooking_with_second_char.second_theme && grimoire_secondChar hasnt grimSecondCharKitchenTwo:
                ~ grimoire_secondChar += grimSecondCharKitchenTwo     
        }

        {
            - cooking_with_second_char.third_theme && grimoire_secondChar hasnt grimSecondCharKitchenThree:
                ~ grimoire_secondChar += grimSecondCharKitchenThree
        }

        {
            - ending_cooking_with_second_char && grimoire_secondChar hasnt grimSecondCharKitchenEnded:
                ~ grimoire_secondChar += grimSecondCharKitchenEnded 
        }

        {
            - food_gift_second_char && grimoire_secondChar hasnt grimSecondCharKitchenAlone:
                ~ grimoire_secondChar += grimSecondCharKitchenAlone
                ~ grimoire_fifthChar += grimSecondCharKitchenAlone                
        }




        {
            //Riscrittura
            - rewriting_proposal_second_character.confession && grimoire_secondChar hasnt grimSecondCharProposal:
                ~ grimoire_secondChar += grimSecondCharProposal
        }

        {
            - rewriting_proposal_second_character.close && grimoire_secondChar hasnt grimSecondCharNewName:
                ~ grimoire_secondChar += grimSecondCharNewName
        }

        {
            - rewriting_proposal_second_character.secret_ending && grimoire_fifthChar hasnt grimMentorSecondSecretEnding:
                ~ grimoire_fifthChar += grimMentorSecondSecretEnding
        }



        {    
            //Storylets speciali
            - open_the_library && grimoire_secondChar hasnt grimSecondOpenLibrary:
                ~ grimoire_secondChar += grimSecondOpenLibrary
                //Così ci aspetta nella foresta
                ~ secondChar_ForestInvite = true
        }

        {
            - a_story_of_rebellion && grimoire_secondChar hasnt grimSecondCharNovel:
                ~ grimoire_secondChar += grimSecondCharNovel
        }

        {
            - dog_second_char && grimoire_secondChar hasnt grimSecondCharDog:
                ~ grimoire_secondChar += grimSecondCharDog
        }

        {
            - about_violence_and_peace && grimoire_secondChar hasnt grimSecondCharMentorPeace:
                    ~ grimoire_secondChar += grimSecondCharMentorPeace
        }

        {
            - carla_and_second_char_chit_chat && grimoire_secondChar hasnt grimSecondCharCarla:
                    ~ grimoire_secondChar += grimSecondCharCarla

        }

        {
            - second_char_third_char_departure_comment && grimoire_secondChar hasnt grimSecondCharThirdCharDepartureComment:
                ~ grimoire_secondChar += grimSecondCharThirdCharDepartureComment
        }

        {
            - second_char_first_char_departure_comment && grimoire_secondChar hasnt grimSecondCharFirstCharDepartureComment:
                ~ grimoire_secondChar += grimSecondCharFirstCharDepartureComment
        } 


                        /******************************

                            Storylets ThirdCharacter

                        ********************************/
        {
            //Main storylets
            - third_char_main_storylets.one && grimoire_thirdChar hasnt grimThirdCharOne:
                ~ grimoire_thirdChar += grimThirdCharOne
        }

        {
            - third_char_main_storylets.two && grimoire_thirdChar hasnt grimThirdCharTwo:
                ~ grimoire_thirdChar += grimThirdCharTwo
        }

        {
            - third_char_main_storylets.three && grimoire_thirdChar hasnt grimThirdCharThree:
                ~ grimoire_thirdChar += grimThirdCharThree
        }

        {
            - third_char_main_storylets.four && grimoire_thirdChar hasnt grimThirdCharFour:
                ~ grimoire_thirdChar += grimThirdCharFour  
        }

        {
            - third_char_main_storylets.five && grimoire_thirdChar hasnt grimThirdCharFive:
                ~ grimoire_thirdChar += grimThirdCharFive
        }

        {
            - third_char_main_storylets.six && grimoire_thirdChar hasnt grimThirdCharSix:
                ~ grimoire_thirdChar += grimThirdCharSix
        }


        {
            //Storylets legati alla cucina
            - cooking_with_third_char.first_theme && grimoire_thirdChar hasnt grimThirdCharKitchenOne:
                ~ grimoire_thirdChar += grimThirdCharKitchenOne  
        }

        {
            - cooking_with_third_char.second_theme && grimoire_thirdChar hasnt grimThirdCharKitchenTwo:
                ~ grimoire_thirdChar += grimThirdCharKitchenTwo     
        }

        {
            - cooking_with_third_char.third_theme && grimoire_thirdChar hasnt grimThirdCharKitchenThree:
                ~ grimoire_thirdChar += grimThirdCharKitchenThree
        }

        {
            - ending_cooking_with_third_char && grimoire_thirdChar hasnt grimThirdCharKitchenEnded:
                ~ grimoire_thirdChar += grimThirdCharKitchenEnded 
        }

        {
            - food_gift_third_char && grimoire_thirdChar hasnt grimThirdCharKitchenAlone:
                ~ grimoire_thirdChar += grimThirdCharKitchenAlone                
        }



        //Riscrittura
        {
            - rewriting_proposal_third_character.confession && grimoire_thirdChar hasnt grimThirdCharFirstProposal:
                ~ grimoire_thirdChar += grimThirdCharFirstProposal
        }

        {
            - third_char_first_rewriting.close && grimoire_thirdChar hasnt grimThirdCharFirstRewriting:
                ~ grimoire_thirdChar += grimThirdCharFirstRewriting
                //per addressare la cosa a mentore
                ~ player_somethingStrangeTalkable += strangeBoccale
        }       

        {
            - third_character_notes.seven && grimoire_thirdChar hasnt grimThirdCharSecondProposal:
                    ~ grimoire_thirdChar += grimThirdCharSecondProposal
        }

        {
            - third_char_post_rewriting.close && grimoire_thirdChar hasnt grimThirdCharNewName:
                ~ grimoire_thirdChar += grimThirdCharNewName
        }

        {
            - third_char_post_rewriting.secret_ending && grimoire_fifthChar hasnt grimMentorThirdSecretEnding:
                ~ grimoire_fifthChar += grimMentorThirdSecretEnding
        }

        //Storylets speciali

        {
            - pre_open_the_nest && grimoire_thirdChar hasnt grimThirdPreOpenNest:
                ~ grimoire_thirdChar += grimThirdPreOpenNest
        }

        {
            - third_witch_follow_up && grimoire_thirdChar hasnt grimWitchThirdCharFollowUp:
                ~ grimoire_thirdChar += grimWitchThirdCharFollowUp
        }

        {        
            
            - open_the_nest && grimoire_thirdChar hasnt grimThirdOpenNest:
                ~ grimoire_thirdChar += grimThirdOpenNest
                ~ grimoire_appendices += grimThirdOpenNest
                //Spostamenti legati all'evento
                ~ thirdChar_LibraryInvite = false
                ~ move_entity(ThirdCharacter, Forest)
        }

        {
            - third_read_story_library && grimoire_thirdChar hasnt grimThirdCharNovel:
                ~ grimoire_thirdChar += grimThirdCharNovel
        }

        {
            - dog_third_char && grimoire_thirdChar hasnt grimThirdCharDog:
                ~ grimoire_thirdChar += grimThirdCharDog

        }

        {
            - third_char_second_char_departure_comment && grimoire_thirdChar hasnt grimThirdCharSecondCharDepartureComment:
                ~ grimoire_thirdChar += grimThirdCharSecondCharDepartureComment
        } 

        {
            - third_char_first_char_departure_comment && grimoire_thirdChar hasnt grimThirdCharFirstCharDepartureComment:
                ~ grimoire_thirdChar += grimThirdCharFirstCharDepartureComment
        } 

                        /******************************

                            Storylets FourthCharacter

                        ********************************/

                        /******************************

                            Storylets FifthCharacter

                        ********************************/
        {
            //Tutorial
            - tutorial_mentorTalkingChoiceRelationship && grimoire_appendices hasnt grimChoicesMentor:
                ~ grimoire_appendices += grimChoicesMentor
                ~ grimoire_fifthChar += grimChoicesMentor
        }

        {
            - tutorial_mentorInkAndYouAreARewriter && grimoire_appendices hasnt grimInkMentor:
                ~ grimoire_appendices += grimInkMentor
        }

        {
            - tutorial_mentorInkAndRewriting && grimoire_appendices hasnt grimRewritingMentor:
                ~ grimoire_appendices += grimRewritingMentor
        }

        {
            - about_greenhouse && grimoire_appendices hasnt grimGreenhouseMentor:
                ~ grimoire_appendices += grimGreenhouseMentor
        }

        {
            - about_kitchen && grimoire_fifthChar hasnt grimKitchenMentor:
                ~ grimoire_appendices += grimKitchenMentor    
                ~ grimoire_fifthChar += grimKitchenMentor                 
        }

        {
            - about_nest && grimoire_appendices hasnt grimSigilsMentor:
                ~ grimoire_appendices += grimSigilsMentor                  
        }


        //Main storylets come Mentore
        {
           - fifth_char_intro && grimoire_fifthChar hasnt grimMentorIntro:
            ~ grimoire_fifthChar += grimMentorIntro
        }    
        
        {
    
            - knowing_mentor_character.one && grimoire_fifthChar hasnt grimMentorOne:
                ~ grimoire_fifthChar += grimMentorOne
        }

        {
            - knowing_mentor_character.two && grimoire_fifthChar hasnt grimMentorTwo:
                ~ grimoire_fifthChar += grimMentorTwo
        }

        {
            - knowing_mentor_character.three && grimoire_fifthChar hasnt grimMentorThree:
                ~ grimoire_fifthChar += grimMentorThree    
        }

        {
            - knowing_mentor_character.four && grimoire_fifthChar hasnt grimMentorFour:
                ~ grimoire_fifthChar += grimMentorFour  
        }

        {
            - knowing_mentor_character.five && grimoire_fifthChar hasnt grimMentorFive:
                ~ grimoire_fifthChar += grimMentorFive
        }

        {
            - knowing_mentor_character.six && grimoire_fifthChar hasnt grimMentorSix:
                ~ grimoire_fifthChar += grimMentorSix
        }


        {        
            //StoryletsSpeciali
            - the_witch_and_the_mentor && grimoire_fifthChar hasnt grimMentorWitchOne:
                ~ grimoire_fifthChar += grimMentorWitchOne
        }

        {
            - about_not_mandatory_work && grimoire_fifthChar hasnt grimMentorNotMandatory:
                ~ grimoire_fifthChar += grimMentorNotMandatory    
        }


        {
            - that_little_liar_storylet && grimoire_fifthChar hasnt grimMentorLiar:
                ~ grimoire_fifthChar += grimMentorLiar    
        }

        {
            - addressing_violence && grimoire_fifthChar hasnt grimMentorViolence:
                ~ grimoire_fifthChar += grimMentorViolence
                //Questo storylet genera uno spostamento di Mentore
                ~ change_entity_place(Mentor)
        }

        {
            - about_violence_and_peace && grimoire_fifthChar hasnt grimSecondCharMentorPeace:
                    ~ grimoire_fifthChar += grimSecondCharMentorPeace
                    //A fine discorso, Riccio se ne va
                    ~ change_entity_place(SecondCharacter)    
        }

        {
            - a_story_of_transformation && grimoire_fifthChar hasnt grimMentorNovel:
                ~ grimoire_fifthChar += grimMentorNovel 
        }

        {
            - dog_mentor && grimoire_fifthChar hasnt grimMentorDog:
                ~ grimoire_fifthChar += grimMentorDog   
        }

        {
            - about_olobino && grimoire_fifthChar hasnt grimMentorOlobinoUno:
                ~ grimoire_fifthChar += grimMentorOlobinoUno
        }

        {
            - again_about_olobino && grimoire_fifthChar hasnt grimMentorOlobinoDue:
                ~ grimoire_fifthChar += grimMentorOlobinoDue    
        }

        {
            - mentor_meltdown && grimoire_fifthChar hasnt grimMentorMeltdown:
                ~ grimoire_fifthChar += grimMentorMeltdown
                //Disattiviamo anche l'attivazione del meltdown
                ~ fifth_char_meltdown_activated = false
                //Spostiamo Mentor nel safekeeping, e l'uovo nella serra
                ~ move_entity(FifthCharacterEgg, Greenhouse)
                ~ move_entity(Mentor, Safekeeping)
        }

        {
            - (first_char_new_mail or second_char_new_mail or third_char_new_mail) && grimoire_fifthChar hasnt grimMentorNewMail:
                ~ grimoire_fifthChar += grimMentorNewMail    
        }

        //Main storylets come Mostro

        {
    
            - fifth_char_main_storylets.one && grimoire_fifthChar hasnt grimFifthCharOne:
                ~ grimoire_fifthChar += grimFifthCharOne
        }

        {
            - fifth_char_main_storylets.two && grimoire_fifthChar hasnt grimFifthCharTwo:
                ~ grimoire_fifthChar += grimFifthCharTwo
        }

        {
            - fifth_char_main_storylets.three && grimoire_fifthChar hasnt grimFifthCharThree:
                ~ grimoire_fifthChar += grimFifthCharThree    
        }

        {
            - fifth_char_main_storylets.four && grimoire_fifthChar hasnt grimFifthCharFour:
                ~ grimoire_fifthChar += grimFifthCharFour  
        }

        {
            - fifth_char_main_storylets.five && grimoire_fifthChar hasnt grimFifthCharFive:
                ~ grimoire_fifthChar += grimFifthCharFive
        }
        
        {
            - fifth_char_main_storylets.six && grimoire_fifthChar hasnt grimFifthCharSix:
                ~ grimoire_fifthChar += grimFifthCharSix
        }

                        /******************************

                            Storylets Witch

                        ********************************/
                        
        {
            //Tutorial e supporto
            - tutorial_witchRelationship && grimoire_appendices hasnt grimChoicesWitch:
                ~ grimoire_appendices += grimChoicesWitch
                ~ grimoire_witch += grimChoicesWitch
        }

        {
            - tutorial_witchSigils && grimoire_appendices hasnt grimSigilsWitch:
                ~ grimoire_appendices += grimSigilsWitch
                ~ grimoire_witch += grimSigilsWitch
        }

        {
            - witch_allSigils_opening && grimoire_appendices hasnt grimWitchAllSigilsOpened:
                ~ grimoire_appendices += grimWitchAllSigilsOpened
                ~ grimoire_witch += grimWitchAllSigilsOpened
        }


        {
            - witch_about_appendices && grimoire_appendices hasnt grimWitchAboutAppendices:
                ~ grimoire_appendices += grimWitchAboutAppendices
                ~ grimoire_witch += grimWitchAboutAppendices
        }
        
        {
            - witch_notification_choice && grimoire_witch hasnt grimWitchNotificationChoice:
                ~ grimoire_witch += grimWitchNotificationChoice
        }

        {
        
            //Debrief
            - witch_first_debrief && grimoire_witch hasnt grimWitchFirstDebrief:
                ~ grimoire_witch += grimWitchFirstDebrief
        }

        {
            - witch_second_debrief && grimoire_witch hasnt grimWitchSecondDebrief:
                ~ grimoire_witch += grimWitchSecondDebrief
        }

        {
            - witch_third_debrief && grimoire_witch hasnt grimWitchThirdDebrief:
                ~ grimoire_witch += grimWitchThirdDebrief
        }

        {
            - witch_fourth_debrief && grimoire_witch hasnt grimWitchFourthDebrief:
                ~ grimoire_witch += grimWitchFourthDebrief  
        }

        {
            - witch_fifth_debrief && grimoire_witch hasnt grimWitchFifthDebrief:
                ~ grimoire_witch += grimWitchFifthDebrief                  
        }

        {
            //Main storylets
            - open_the_dump && grimoire_witch hasnt grimWitchOpenDump:
                ~ grimoire_witch += grimWitchOpenDump
                //Tutte le cose legate all'apertura del dump
                ~ move_entity(FromForestToDumpBlocked, Safekeeping)
                ~ move_entity(FromForestToDump, Forest)
                ~ move_entity(mapDump, TrainStop)
                ~ player_accessiblePlaces += Dump
        }

        {
            - witch_intro && grimoire_witch hasnt grimWitchIntro:
                ~ grimoire_witch += grimWitchIntro
        }

        {
            - the_witch_and_the_frog && grimoire_witch hasnt grimWitchFrog:
                ~ grimoire_witch += grimWitchFrog
        }

        {
            - about_the_book && grimoire_witch hasnt grimWitchBook:
                ~ grimoire_witch += grimWitchBook    
        }

        {            
            //Storia personale strega
            - witch_first_confession && grimoire_witch hasnt grimWitchMainOne:
                ~ grimoire_witch += grimWitchMainOne    
        }

        {
            - witch_second_confession && grimoire_witch hasnt grimWitchMainTwo:
                ~ grimoire_witch += grimWitchMainTwo  
        }

        {
            - witch_third_confession && grimoire_witch hasnt grimWitchMainThree:
                ~ grimoire_witch += grimWitchMainThree
        }

        {
            - witch_fourth_confession && grimoire_witch hasnt grimWitchMainFour:
                ~ grimoire_witch += grimWitchMainFour
        }

        {
            - witch_fifth_confession && grimoire_witch hasnt grimWitchMainFive:
                ~ grimoire_witch += grimWitchMainFive
        }

                        /******************************

                            Storylets Letters

                        ********************************/

    //FirstCharacter    
    {
        - first_character_notes.one && grimoire_firstChar hasnt grimFirstCharLetterOne:
                ~ grimoire_firstChar += grimFirstCharLetterOne
    }

    {
        - first_character_notes.two && grimoire_firstChar hasnt grimFirstCharLetterTwo:
                ~ grimoire_firstChar += grimFirstCharLetterTwo                 
    }

    {
        - first_character_notes.three && grimoire_firstChar hasnt grimFirstCharLetterThree:
                ~ grimoire_firstChar += grimFirstCharLetterThree
    }

    {
        - first_character_notes.four && grimoire_firstChar hasnt grimFirstCharLetterFour:
                ~ grimoire_firstChar += grimFirstCharLetterFour
    }

    //SecondCharacter
    {
        - second_character_notes.one && grimoire_secondChar hasnt grimSecondCharLetterOne:
                ~ grimoire_secondChar += grimSecondCharLetterOne
    }

    {
        - second_character_notes.two && grimoire_secondChar hasnt grimSecondCharLetterTwo:
                ~ grimoire_secondChar += grimSecondCharLetterTwo                 
    }

    {
        - second_character_notes.three && grimoire_secondChar hasnt grimSecondCharLetterThree:
                ~ grimoire_secondChar += grimSecondCharLetterThree
    }                

    {
        - second_character_notes.four && grimoire_secondChar hasnt grimSecondCharLetterFour:
                ~ grimoire_secondChar += grimSecondCharLetterFour
    }       

    //ThirdCharacter 
    {
        - third_character_notes.one && grimoire_thirdChar hasnt grimThirdCharLetterOne:
                ~ grimoire_thirdChar += grimThirdCharLetterOne
    }

    {
        - third_character_notes.two && grimoire_thirdChar hasnt grimThirdCharLetterTwo:
                ~ grimoire_thirdChar += grimThirdCharLetterTwo                 
    }

    {
        - third_character_notes.three && grimoire_thirdChar hasnt grimThirdCharLetterThree:
                ~ grimoire_thirdChar += grimThirdCharLetterThree
    }

    {
        - third_character_notes.four && grimoire_thirdChar hasnt grimThirdCharLetterFour:
                ~ grimoire_thirdChar += grimThirdCharLetterFour
    }

    {
        - third_character_notes.five && grimoire_thirdChar hasnt grimThirdCharLetterFive:
                ~ grimoire_thirdChar += grimThirdCharLetterFive
    }

    {
        - third_character_notes.six && grimoire_thirdChar hasnt grimThirdCharLetterSix:
                ~ grimoire_thirdChar += grimThirdCharLetterSix
    }

    {
        - third_character_notes.seven && grimoire_thirdChar hasnt grimThirdCharLetterSeven:
                ~ grimoire_thirdChar += grimThirdCharLetterSeven
    }


    {
        - third_character_notes.eight && grimoire_thirdChar hasnt grimThirdCharLetterEight:
                ~ grimoire_thirdChar += grimThirdCharLetterEight
    }

    //FourthCharacter
    {
        - fourth_character_notes.one && grimoire_fourthChar hasnt grimFourthCharLetterOne:
                ~ grimoire_fourthChar += grimFourthCharLetterOne
    }

    {
        - fourth_character_notes.two && grimoire_fourthChar hasnt grimFourthCharLetterTwo:
                ~ grimoire_fourthChar += grimFourthCharLetterTwo                 
    }

    {
        - fourth_character_notes.three && grimoire_fourthChar hasnt grimFourthCharLetterThree:
                ~ grimoire_fourthChar += grimFourthCharLetterThree
    }

    {
        - fourth_character_notes.four && grimoire_fourthChar hasnt grimFourthCharLetterFour:
                ~ grimoire_fourthChar += grimFourthCharLetterFour
    }
    //FifthCharacter
    {
        - fifth_character_notes.one && grimoire_fifthChar hasnt grimFifthCharLetterOne:
                ~ grimoire_fifthChar += grimFifthCharLetterOne
    }

    {
        - fifth_character_notes.two && grimoire_fifthChar hasnt grimFifthCharLetterTwo:
                ~ grimoire_fifthChar += grimFifthCharLetterTwo                 
    }

    {
        - fifth_character_notes.three && grimoire_fifthChar hasnt grimFifthCharLetterThree:
                ~ grimoire_fifthChar += grimFifthCharLetterThree
    }

    {
        - fifth_character_notes.four && grimoire_fifthChar hasnt grimFifthCharLetterFour:
                ~ grimoire_fifthChar += grimFifthCharLetterFour
    }
        



    //Azioni condivise
        //Svuotiamo la lista dei parlanti che decide se mostrare o meno una reazione davanti a una scelta
            ~ list_currentActors = ()
        //Cooldown storylets comuni, per evitare catena.
            ~ png_commonPauseTalking = true
        //L'animazione per via dell'informazione nuova
            //@animation:RewriterBook  
        // //Gestione crescita piante -> SPOSTATA ALL'ACCESSO IN SERRA
        //     -> growing_check ->
        //Check stato achievements
            -> achievements_onGame_statusUpdate_RM ->
            -> achievements_onGame_statusUpdate_GM ->
        //E la situazione delle task di Franco
            -> notification_system ->     
->->        