/* ---------------------------------

   Gestione avvio e chiusura storie personagge 

 ----------------------------------*/
    LIST storyStates = NotStarted, Active, Ended
    VAR minStoryQuesTCountFirstChar = 7
    VAR minStoryQuesTCountSecondChar = 8
    
//COME PROMEMORIA. LISTA DI TIPI DI TONO CHE POSSIAMO TENERE IN UNA CONVERSAZIONE: ROSSO (RABBIA, PASSIONE, AZIONE, OPPOSIZIONE). VIOLA (SPIRITUALITA', VISIONE DEL GRANDE SCHEMA DELLE COSE, SGUARDO POETICO, TESA VERSO UNA MISSIONE). GIALLO (GIOCOSITA', RISATA, DIVERTIMENTO, FANCIULLEZZA). VERDE (CUORE, AFFETTI, CURA DELLE PERSONE CARE, RIFLESSIONE EMOTIVA). BLU (RAZIONALITA', CALCOLO, VISIONE PRATICA, DISCIPLINA).

//Attesa comparsa prima personaggia
    VAR delayFirstChar = 5

//Attesa comparsa quarta personaggia
    VAR delayFourthChar = 20
    
    
=== story_time_management_for_PNG
    //Qui commentato a manetta per non fare partire cose che non dovrebbero partire.
    
    {
        - movementsCounter == delayFirstChar && firstStory == NotStarted:
                ~ move_entity(FirstCharacter, TrainStop)
                ~ firstStory = Active
                
    //A metà della storia della prima personaggia, compare la seconda      
        - knowing_first_character.three && secondStory == NotStarted:
                ~ move_entity(SecondCharacter, TrainStop)    
                ~ secondStory = Active
    
    //A metà della storia della seconda personaggia e finita la prima (così la biblioteca è aperta), compare la terza
        //- knowing_second_character.four && firstStory == Ended && thirdStory == NotStarted:
               // ~ move_entity(ThirdCharacter, TrainStop)    
                //~ thirdStory = Active
                
    //Dopo un po' da quando la terza storia è finita, compare una quarta personaggia
        //- movementsCounter == delayFourthChar && thirdStory == Ended:
            //Ma magari questo spettro vuole comparire altrove
                //~ move_entity(FourthCharacter, TrainStop)
                //~ fourthStory = Active
                
    //E quando la storia della quarta è a metà, iniziamo a modo quella della mentore
        //- knowing_fourth_character.five && fifthStory == NotStarted:
                //~ fifthStory = Active
                    
    
    
    //Check per l'allontanamento delle personagge
        //- firstStory == Ended && movementsCounter > 10:
            //~ move_entity(FirstCharacter, Safekeeping)
            //~ move_entity(FirstCharacterNotes, TrainStop)
            
        //- secondStory == Ended && movementsCounter > 10:
            //~ move_entity(SecondCharacter, Safekeeping)
            //~ move_entity(SecondCharacterNotes, TrainStop)
            
        //- thirdStory == Ended && movementsCounter > 10:
            //~ move_entity(ThirdCharacter, Safekeeping)
            //~ move_entity(ThirdCharacterNotes, TrainStop)
            
        //- fourthStory == Ended && movementsCounter > 10:
            //~ move_entity(FourthCharacter, Safekeeping)
           // ~ move_entity(FourthCharacterNotes, TrainStop)
            
        //- fifthStory == Ended && movementsCounter > 10:
            //~ move_entity(Mentor, Safekeeping)
           // ~ move_entity(FifthCharacterNotes, TrainStop)
    }
    
        ->->

                /* ---------------------------------
                
                   Funzione di traduzione da variabile a stringa 
                
                 ----------------------------------*/

=== function translator(characterState)
    {characterState:
    
    //Personaggia Uno
        - Chitarra:
            ~ return "Chitarra"
        - Triangolo:
            ~ return "Triangolo"
        - RagazzaOrchestra:
            ~ return "Orchestra"
        - FlautoDolce:
            ~ return "Flauto Dolce"
        - Ocarina:
            ~ return "Ocarina"
        - Violino:
            ~ return "Violino"

    //Personaggia Due       
        - Riccio:
            ~ return "Riccio"
        - Grizzly:
            ~ return "Grizzly"
        - Lupo:
            ~ return "Lupo"
        - Delfino:
            ~ return "Delfino"
        - Capibara:
            ~ return "Capibara"
        - Corvo:
            ~ return "Corvo"

    //Personaggia Tre
        - SpettroDelVuoto:
            ~ return "Spettro del Vuoto"
        - Consapevole: 
            ~ return "Consapevole"
        - Guarente: 
            ~ return "Guarente"    
        - Socievole: 
            ~ return "Socievole"
        - Terrorizzato: 
            ~ return "Terrorizzato"
        - Abbandonato: 
            ~ return "Abbandonato"    
        - Arrabbiato: 
            ~ return "Arrabbiato"            
    
    //Personaggia Quattro        
        - Mondatrice:
            ~ return "Mondatrice"

    //Personaggia Cinque        
        - Mentore:
            ~ return "Mentore"

    }
    
=== on_movement_events
//Qui metto tutte quelle funzioni e variazioni che sono richieste a ogni cambio stanza.

//Riduzioni di contatori legati al tempo:
    ~ firstWritingPause --
    ~ secondWritingPause --
    ~ thirdWritingPause --
    ~ fifthWritingPause --
    
    ~ lastMindfulness --
    
//Aumento di contatori:
    ~ movementsCounter ++

//Comparsa lettere dopo fine delle storie (così non compaiono subito.
    {firstCharacterPossibleStates hasnt Chitarra && first_char_story_ended.goodbye:
            ~ move_entity(FirstCharacterNotes, TrainStop)
            {debug: Ho messo la nota della prima personaggia alla fermata del bus.}
    }
    {second_char_story_ended.goodbye:
            ~ move_entity(SecondCharacterNotes, TrainStop)
            {debug: Ho messo la nota del secondo personaggio alla fermata del bus.}
    }    
    {
        - knowing_second_character.six.theFrog && not are_two_entities_together(TheFrog, Mentor):
            {debug: Ho spostato la rana allo stagno.}
            ~  move_entity(TheFrog, GreenhouseMiddlePath)
        - else:
            ~  move_entity(TheFrog, Safekeeping)
            {debug: Ho spostato la rana nel Safekeeping.}
    }
//Altre funzioni:
    -> characters_speaking ->
    -> randomizer_png_location ->
    -> story_time_management_for_PNG->    
->->

//Riduzione del tempo di pausa del dialogo fino a quando non siamo a 0
=== characters_speaking
    {
        - firstPauseTalking > 0:
            ~ firstPauseTalking --
            {debug: Il valore di firstPauseTalking è {firstPauseTalking}}
        
        - secondPauseTalking > 0:
            ~ secondPauseTalking --
        
        - thirdPauseTalking > 0:
            ~ thirdPauseTalking --
        
        - fifthPauseTalking > 0:
            ~ fifthPauseTalking --    
    }
->->    