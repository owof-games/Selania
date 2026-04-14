//Possibili nomi
    LIST mentor_possibleStates = Mentore
    VAR mentor_ActualName = Mentore
    
//Per mentore, fifthChar_storyStatus sarà la parte di riscrittura, mentorChar_storyStatus tutta la parte di interazione come Mentore
    VAR mentorChar_storyStatus = story_storyNotStarted
    VAR mentor_storyletsForRewritingCount = 0
    
//Variabili per mettere in pausa la conversazione. Plausibilmente per mentore sarà molto alta all'inizio.
    VAR mentor_pauseTalking = 0
    VAR mentor_pauseDuration = 1

//Check per monitorare l'ultima volta che abbiamo parlato con Mentore.
    VAR mentor_lastTimeTalking = 0
    VAR mentor_MAX_lastTimeTalking = 10

//Questo è per il conteggio totale delle scelte prese con la PNG
    VAR mentor_totalChoices = 0        

//Variabili colore
    VAR mentor_aether = 0.00
    VAR mentor_earth = 0.00
    VAR mentor_air = 0.00
    VAR mentor_water = 0.00
    VAR mentor_fire = 0.00     


//VARIABILI NARRATIVE
    VAR mentor_riccioMentoreViciniColpo = false
    

//Funzione per farsi notare
=== talk_to_me ===
{debug: passo per talk_to_me. Il valore di mentor_lastTimeTalking è {mentor_lastTimeTalking}.}

    
{   
    - mentor_lastTimeTalking < mentor_MAX_lastTimeTalking:
            ~ mentor_lastTimeTalking ++
        {debug: aumento il valore di mentor_lastTimeTalking, che ora è {mentor_lastTimeTalking}.}    
        ->->  

    - else:
    {
        - are_two_entities_together(Mentor, PG) && grimoire_appendices has grimChoicesMentor:
            { 
                - (contentsTrainStop has DoggoFirstLetters or contentsTrainStop has DoggoSecondLetters) && (contentsTrainStop hasnt Mentor):
                    {stopping:
                        - Ma hai visto {player_name} che c'è qualcunə che ti aspetta alla fermata del treno?#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                        - Mi sembra di aver sentito un rumore alla fermata prima.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                        - Credo ci sia della posta per te alla fermata, {player_name}.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                        - Sono sicura di aver sentito un abbaio alla stazione: tu sai già chi è, vero?#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                        - Credo sia arrivata una lettera per te, {player_name}. La trovi come sempre in stazione.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                    }
                        ~ mentor_lastTimeTalking = 0
                        ->->
                
                - else:
                    {shuffle:
                        - Ehi {player_name}, spero vada tutto bene.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:mentore_hurry
                        - Ehi {player_name}, è da un po' che non parliamo.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:mentore_hurry
                        - {player_name}, se ti vanno due chiacchiere sono qui.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:mentore_hurry
                        - Ciao {player_name}, spero tu non ti stia affaticando troppo.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:mentore_sad     
                    }
                        ~ mentor_lastTimeTalking = 0
                        ->->
            }
                
        - else:
            {debug: Mentore e PG non sono assieme, per cui vado avanti.}
            ->->   
    }         

}


->->


=== mentor_closing_storylet ===
        //Questo evita che venga proposto un altro storylet fino a quando la pausa non è finita
        ~ mentor_pauseTalking = mentor_pauseDuration
        //Cooldown comune
        ~ png_commonPauseTalking = true
        //Aggiorno il contatore ansiosetto
        ~ mentor_lastTimeTalking = 0
        //L'animazione per via dell'informazione nuova
        @animation:RewriterBook

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
            - growing_witch_storylet && grimoire_fifthChar hasnt grimMentorWitchTwo:
                ~ grimoire_fifthChar += grimMentorWitchTwo
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
        //Aggiornamento lista di quelli comuni
        -> grimoire_common_storylets_updater ->
        //Gestione crescita piante
        -> growing_check ->

->->

