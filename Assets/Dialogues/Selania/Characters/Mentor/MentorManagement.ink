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

//Tracciamento apprezzamento glifi. Tutto ciò che è fuori da questa lista = reazione neutrale.
    VAR mentorChar_positiveGlyphs = ()
    VAR mentorChar_negativeGlyphs = ()

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
        - are_two_entities_together(Mentor, PG) && welcome:
            { 
                - (contentsTrainStop has FirstCharacterNotes or contentsTrainStop has SecondCharacterNotes) && (contentsTrainStop hasnt Mentor):
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
        //Gestione crescita piante
        -> growing_check ->
        //Questo evita che venga proposto un altro storylet fino a quando la pausa non è finita
        ~ mentor_pauseTalking = mentor_pauseDuration
        //L'animazione per via dell'informazione nuova
        @animation:RewriterBook


->->