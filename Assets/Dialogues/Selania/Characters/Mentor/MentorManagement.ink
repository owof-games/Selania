//Possibili nomi
    LIST mentor_possibleStates = Mentore
    VAR mentor_ActualName = Mentore
    
//Per mentore, fifthChar_storyStatus sarà la parte di riscrittura, mentorChar_storyStatus tutta la parte di interazione come Mentore
    VAR mentorChar_storyStatus = story_storyNotStarted
    VAR mentor_storyletsForRewritingCount = 0
    
//Questa variabile mi serve solo per evitare che Mentore mi dia subito lo storylet questions dopo gifts_and_inks
    VAR mentor_tutorialPauses = false
    
//Variabili per mettere in pausa la conversazione. Plausibilmente per mentore sarà molto alta all'inizio.
    VAR mentor_pauseTalking = 0
    VAR mentor_pauseDuration = 10

//Check per monitorare l'ultima volta che abbiamo parlato con Mentore.
    VAR mentor_lastTimeTalking = 0
    VAR mentor_MAX_lastTimeTalking = 10

//Variabili colore
    VAR mentor_purple = 0.00
    VAR mentor_yellow = 0.00
    VAR mentor_blue = 0.00
    VAR mentor_green = 0.00
    VAR mentor_red = 0.00     


//VARIABILI NARRATIVE
    VAR riccioMentoreViciniColpo = false
    VAR riccioMentoreViciniInnaffiatoio = false
    


//Funzione per farsi notare
=== talk_to_me ===
{debug: passo per talk_to_me. Il valore di mentor_lastTimeTalking è {mentor_lastTimeTalking}.}
    {
        - are_two_entities_together(Mentor, PG) && welcome:
            {
                - mentor_lastTimeTalking < mentor_MAX_lastTimeTalking:
                    ~ mentor_lastTimeTalking ++
                    ->->    

                - else:
                    {shuffle:
                        - Ehi {player_name}, spero vada tutto bene.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:mentore_neutral
                        - Ehi {player_name}, è da un po' che non parliamo.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:mentore_neutral
                        - {player_name}, se ti vanno due chiacchiere sono qui.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:mentore_neutral
                        - Ciao {player_name}, spero tu non ti stia affaticando troppo.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:mentore_neutral
                    }
                    ->->    

            }

    }

->->