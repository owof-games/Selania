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



//Funzione di calcolo dell'affinità tra PNG e PG
=== function affinity_calc(PNG)
~ temp relationshipIndicator = 0
~ temp relationshipStatus = neutral
//prima: check di chi parlo, e assegno il valore della relazione alla variabile temporanea.
{
    - PNG == FirstCharacter:
        ~ relationshipIndicator = firstChar_relationshipIndicator
    
    - PNG == SecondCharacter:
        ~ relationshipIndicator = firstChar_relationshipIndicator

    - PNG == ThirdCharacter:
        ~ relationshipIndicator = firstChar_relationshipIndicator

    - PNG == FourthCharacter:
        ~ relationshipIndicator = firstChar_relationshipIndicator

    - PNG == FifthCharacter:
        ~ relationshipIndicator = firstChar_relationshipIndicator            
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
            //Vado a svuotare i contatori di colore, così son tranquilla.
                ~ storage_glyphs(PNG)



=== function rewriting_end(PNG)
~ temp char_glyphVariation = 0
    {PNG:
        - FirstCharacter:
            ~ char_glyphVariation = firstChar_glyphVariation

        - SecondCharacter:
            ~ char_glyphVariation = secondChar_glyphVariation

        - ThirdCharacter:
            ~ char_glyphVariation = thirdChar_glyphVariation

        - FourthCharacter:
            ~ char_glyphVariation = fourthChar_glyphVariation

        - FifthCharacter:
            ~ char_glyphVariation = fifthChar_glyphVariation

    }

        //Prima chiamo il moltiplicatore di colori, così che comunque le scelte fatte qui abbiano un impatto maggiore.
            ~ glyph_modifier(PNG, char_glyphVariation)
        
        //Poi aggiorniamo i colori, così il valore complessivo conta per la scelta del nome
            ~ update_glyphs(PNG)
    
        //E infine genero il nome
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
            ~ move_entity(SecondCharacterGrizzly, Safekeeping)
            ~ move_entity(SecondCharacterDelfino, Safekeeping)
            ~ move_entity(SecondCharacterLupo, Safekeeping)
            ~ move_entity(SecondCharacterCapibara, Safekeeping)
            ~ move_entity(SecondCharacterCorvo, Safekeeping)

    - PNG == ThirdCharacter:
        {
            - thirdChar_storyStatus == story_storyStarted:
                ~ thirdChar_storyStatus = story_storyRemote
                ~ thirdChar_mailPause = thirdChar_mailPauseDuration

            - else:
                ~ story_endedStories += story_thirdCharStoryEnded
                ~ thirdChar_storyStatus = story_storyEnded
                //Il ritratto ha senso che compaia solo quando è stato davvero riscritto, praticamente quando lo vediamo a fine gioco
                //Spostiamo poi le varianti della PNG
                // ~ move_entity(SecondCharacterGrizzly, Safekeeping)
                // ~ move_entity(SecondCharacterDelfino, Safekeeping)
                // ~ move_entity(SecondCharacterLupo, Safekeeping)
                // ~ move_entity(SecondCharacterCapibara, Safekeeping)
                // ~ move_entity(SecondCharacterCorvo, Safekeeping)  
        }
        
        
        
        

    - PNG == FourthCharacter:
        
        ~ story_endedStories += story_fourthCharStoryEnded
        ~ fourthChar_storyStatus = story_storyPostal
        ~ fourthChar_mailPause = fourthChar_mailPauseDuration
            //Spostiamo poi le varianti della PNG
            // ~ move_entity(SecondCharacterGrizzly, Safekeeping)
            // ~ move_entity(SecondCharacterDelfino, Safekeeping)
            // ~ move_entity(SecondCharacterLupo, Safekeeping)
            // ~ move_entity(SecondCharacterCapibara, Safekeeping)
            // ~ move_entity(SecondCharacterCorvo, Safekeeping)  

    - PNG == FifthCharacter:
        
        ~ story_endedStories += story_fifthCharStoryEnded
        ~ fifthChar_storyStatus = story_storyPostal
        ~ fifthChar_mailPause = fifthChar_mailPauseDuration
            //Spostiamo poi le varianti della PNG
            // ~ move_entity(SecondCharacterGrizzly, Safekeeping)
            // ~ move_entity(SecondCharacterDelfino, Safekeeping)
            // ~ move_entity(SecondCharacterLupo, Safekeeping)
            // ~ move_entity(SecondCharacterCapibara, Safekeeping)
            // ~ move_entity(SecondCharacterCorvo, Safekeeping)  
        
}

//Cose comuni
    ~ state_ending_stories(PNG)
    ~ tree_advance_management(PNG)


//Elementi non dipendenti dallx PNG
~ temp currentPlace = entity_location(PG)
~ move_entity(TrainNoiseGoingAway, currentPlace)
@animation:RewriterBook

-> achievements_onGame_statusUpdate_GM ->        
-> main  
        
    
=== rewriting_witch_feedback(point) ===
LIST rewritingPoints = oneR, twoR, threeR, fourR, endR
//Assegnazione parlante

{
    - point == oneR && story_endedStories == ():
        {charTag(TheWitch, witch_state())}:   <i>{player_name} ha utilizzato la sua prima goccia di inchiostro per compiere una riscrittura.</i>

    - point == twoR && story_endedStories == ():
        {charTag(TheWitch, witch_state())}:   <i>{player_name} ha utilizzato la sua seconda goccia di inchiostro per procedere con la riscrittura.</i>

    - point == threeR && story_endedStories == ():
        {charTag(TheWitch, witch_state())}:   <i>{player_name} ha utilizzato la terza goccia di inchiostro, proponendo una riscrittura.</i>

    - point == fourR && story_endedStories == ():
        {charTag(TheWitch, witch_state())}:   <i>{player_name} ha utilizzato la quarta e ultima unità di inchiostro, compiendo il massimo di riscritture possibili.</i>

    - point == endR && story_endedStories == ():
        {
            - story_endedStories == ():
                {charTag(TheWitch, witch_state())}:     <i>{player_name} sta per utilizzare per la prima volta il potere dell'<b><i>epilogo</b></i>.
                                                        <i>Quale epilogo proporrà?
            
            - else:
                {charTag(TheWitch, witch_state())}:     <i>Quale <b><i>epilogo</b></i> proporrà {player_name}?</i>   
        }    

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
            - secondChar_ActualName == Grizzly:
                ~ return "grizzly"

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
            - thirdChar_ActualName == ThirdB:
                ~ return "ThirdB"

            - thirdChar_ActualName == ThirdC:
                ~ return "ThirdC"

            - thirdChar_ActualName == ThirdD:
                ~ return "ThirdD"

            - thirdChar_ActualName == ThirdE:
                ~ return "ThirdE"

            - thirdChar_ActualName == ThirdF:
                ~ return "ThirdF"                     
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
            - secondChar_ActualName == Grizzly:
                ~ move_entity(SecondCharacterGrizzly, currentLocation)
                ~ move_entity(PaintGrizzly, Bedroom)
                
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
            - thirdChar_ActualName == ThirdB:
                ~ return "ThirdB"

            - thirdChar_ActualName == ThirdC:
                ~ return "ThirdC"

            - thirdChar_ActualName == ThirdD:
                ~ return "ThirdD"

            - thirdChar_ActualName == ThirdE:
                ~ return "ThirdE"

            - thirdChar_ActualName == ThirdF:
                ~ return "ThirdF"                     
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
            - frog_and_first_char_chit_chat && grimoire_firstChar hasnt grimFirstCharFranco:
                ~ grimoire_firstChar += grimFirstCharFranco
                ~ grimoire_franco += grimFirstCharFranco
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
            - frog_and_third_char_chit_chat && grimoire_thirdChar hasnt grimThirdCharFranco:
                ~ grimoire_thirdChar += grimThirdCharFranco
                ~ grimoire_franco += grimThirdCharFranco
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
        }

        {
            - second_char_main_storylets.him_liar && grimoire_secondChar hasnt grimSecondCharThreeHim:
                ~ grimoire_secondChar += grimSecondCharThreeHim   
        }

        {
             - second_char_main_storylets.her_liar && grimoire_secondChar hasnt grimSecondCharThreeHer:
                ~ grimoire_secondChar += grimSecondCharThreeHer    
        }

        {
            - second_char_main_storylets.they_liar && grimoire_secondChar hasnt grimSecondCharThreeThey:
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
            - third_char_main_storylets.seven && grimoire_thirdChar hasnt grimThirdCharSeven:
                ~ grimoire_thirdChar += grimThirdCharSeven
        }

        {
            - third_char_main_storylets.eight && grimoire_thirdChar hasnt grimThirdCharEight:
                ~ grimoire_thirdChar += grimThirdCharEight    
        }

        {
            - third_char_main_storylets.nine && grimoire_thirdChar hasnt grimThirdCharNine:
                ~ grimoire_thirdChar += grimThirdCharNine  
        }

        {
            - third_char_main_storylets.ten && grimoire_thirdChar hasnt grimThirdCharTen:
                ~ grimoire_thirdChar += grimThirdCharTen 
        }

        {
            - third_char_main_storylets.eleven && grimoire_thirdChar hasnt grimThirdCharEleven:
                ~ grimoire_thirdChar += grimThirdCharEleven   
        }

        {
            - third_char_main_storylets.twelve && grimoire_thirdChar hasnt grimThirdCharTwelve:
                ~ grimoire_thirdChar += grimThirdCharTwelve
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




        {
            //Riscrittura
            - rewriting_proposal_third_character.confession && grimoire_thirdChar hasnt grimThirdCharProposal:
                ~ grimoire_thirdChar += grimThirdCharProposal
        }

        {
            - first_rewriting.close && grimoire_thirdChar hasnt grimThirdCharNewName:
                ~ grimoire_thirdChar += grimThirdCharNewName
        }

        {
            - first_rewriting.secret_ending && grimoire_fifthChar hasnt grimMentorThirdSecretEnding:
                ~ grimoire_fifthChar += grimMentorThirdSecretEnding
        }



        {        
            //Storylets speciali
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
        }

        {
            - about_nest && grimoire_appendices hasnt grimSigilsMentor:
                ~ grimoire_appendices += grimSigilsMentor                  
        }
        
        {

            //Main storylets
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

            - knowing_mentor_character.six && grimoire_fifthChar hasnt grimMentorSix:
                ~ grimoire_fifthChar += grimMentorSix
        }

        {
            - knowing_mentor_character.seven && grimoire_fifthChar hasnt grimMentorSeven:
                ~ grimoire_fifthChar += grimMentorSeven
        }

        {
            - knowing_mentor_character.eight && grimoire_fifthChar hasnt grimMentorEight:
                ~ grimoire_fifthChar += grimMentorEight    
        }

        {
            - knowing_mentor_character.nine && grimoire_fifthChar hasnt grimMentorNine:
                ~ grimoire_fifthChar += grimMentorNine  
        }

        {
            - knowing_mentor_character.ten && grimoire_fifthChar hasnt grimMentorEight:
                ~ grimoire_fifthChar += grimMentorEight 
        }

        {
            - knowing_mentor_character.eleven && grimoire_fifthChar hasnt grimMentorEleven:
                ~ grimoire_fifthChar += grimMentorEleven   
        }

        {
            - knowing_mentor_character.twelve && grimoire_fifthChar hasnt grimMentorTwelve:
                ~ grimoire_fifthChar += grimMentorTwelve
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
            - mentor_rage && grimoire_fifthChar hasnt grimMentorRage:
                ~ grimoire_fifthChar += grimMentorRage    
        }

        {
            - (first_char_new_mail or second_char_new_mail or third_char_new_mail) && grimoire_fifthChar hasnt grimMentorNewMail:
                ~ grimoire_fifthChar += grimMentorNewMail    
        }

                        /******************************

                            Storylets Witch

                        ********************************/
                        
        {
            //Tutorial e supporto
            - tutorial_witchRelationship && grimoire_appendices hasnt grimChoicesWitch:
                ~ grimoire_appendices += grimChoicesWitch
        }

        {
            - tutorial_witchSigils && grimoire_appendices hasnt grimSigilsWitch:
                ~ grimoire_appendices += grimSigilsWitch
        }

        {
            - witch_allSigils_opening && grimoire_appendices hasnt grimWitchAllSigilsOpened:
                ~ grimoire_appendices += grimWitchAllSigilsOpened  
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
        //Cooldown storylets comuni, per evitare catena.
            ~ png_commonPauseTalking = true
        //L'animazione per via dell'informazione nuova
            @animation:RewriterBook  
        //Gestione crescita piante
            -> growing_check ->
        //Check stato achievements
            -> achievements_onGame_statusUpdate_RM ->
            -> achievements_onGame_statusUpdate_GM ->
        //E la situazione delle task di Franco
            -> notification_system ->     
->->        