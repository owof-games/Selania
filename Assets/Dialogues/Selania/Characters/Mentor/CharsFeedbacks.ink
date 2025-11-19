//Feedback//
=== first_character_feedback
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
        Hai concluso la tua prima riscrittura, {player_name}, grande!#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_hurry
        E quindi: è tempo di feedback!
            {
                - are_two_entities_together(FirstCharacter, PG): Mmm, sembra l'ora della pagella. Me ne vado.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Other)} #portrait:chitarra_annoyed
                        ~ change_entity_place(FirstCharacter)
            }
            {
                - are_two_entities_together(SecondCharacter, PG): Non mi piacciono i voti. Ciao ciao!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                        ~ change_entity_place(SecondCharacter)
            }            
        
        {
            - firstChar_ActualName ==  Triangolo:
                Hai aiutato {charNameOne} a riscoprire il suo lato più pratico, razionale.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_neutral
                Non quello di cui aveva bisogno, temo.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_sad
                Ma per essere la tua prima riscrittura hai dato davvero il massimo.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_hurry
                Il resto, è colpa dei miei consigli imperfetti.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_sorry
                Spero mi concederai il tempo di migliorarmi.
                
            - firstChar_ActualName ==  RagazzaOrchestra:
                {charNameOne} ora sa di possedere un'idole più attiva, e anche oppositiva se serve.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_neutral
                Forse avrei potuto guidarti meglio, non sono sicura che sia la natura più vicina al suo cuore.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_sorry
                Ma faremo meglio la prossima volta.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_hurry
                
            - firstChar_ActualName ==  FlautoDolce:
                Grazie al tuo lavoro, {charNameOne} ha scoperto che gli affetti sono la cosa per lei fondamentale.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_neutral
                Forse qualcosa che sapeva già.
                Forse ora sta meglio, giusto?#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_sad
                Questo è il massimo che potevamo fare per lei, vero?
                
            - firstChar_ActualName == Ocarina:
                {charNameOne} ha trovato nella giocosità uno sblocco, ed è pronta ad abbandonarsi alla sua creatività.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_neutral
                E chi sono io per giudicare cosa fa star bene un'altra persona?#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_sorry
                E indubbiamente sembra molto più felice di quando è arrivata.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_neutral
                
            - firstChar_ActualName == Violino:
                {charNameOne} aveva bisogno di riconoscere che per lei la vita ha senso solo con uno scopo più grande, e grazie a te, ce l'ha fatta.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_neutral
                Abbiamo fatto un grande lavoro assieme, {player_name}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_hurry
                Non vedo l'ora di aiutare la prossima persona con te!
                
        }
        
        
        Non ti conosco ancora abbastanza, ma ci tengo a dirtelo: sentiti {player_pronouns has him:soddisfatto|{player_pronouns has her:soddisfatta|soddisfattə}}!#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_hurry
        Questo è un lavoro complesso, ma vedrai che col tempo sarà tutto più facile.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_neutral
        Comunque sia, direi che ti ho dato tutti gli strumenti per far sì che tu possa riscrivere storie in autonomia. 
        Ma se avrai bisogno di aiuto per i luoghi del giardino, o un po' di supporto personale, sono qui.
        O anche solo per due chiacchiere.
        A dopo.
            ~ mentor_pauseTalking = mentor_pauseDuration
            ~ mentor_tutorialPauses = true
                -> main
          
=== second_character_feedback
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)   
    
   Hai finito il percorso con {charNameTwo}, {player_name}!#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_neutral
   Ed entrambi mi avete stupita: non pensavo davvero che un bambino avrebbe avuto bisogno di questo luogo.
        {
        - are_two_entities_together(SecondCharacter, PG): Devi imparare tante cose sui bambini, tu. Vado a farmi due passi.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                ~ change_entity_place(SecondCharacter)
            Mi mancherà. Buffo, vero?#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_neutral
        
        
        }
    Eccoti il mio modesto pensiero. #speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_neutral
        {
            - are_two_entities_together(FirstCharacter, PG):Ecco che parte coi voti. E io volo via.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Other)} #portrait:chitarra_annoyed
                    ~ change_entity_place(FirstCharacter)
        }    
    
    {
            - secondChar_ActualName == Grizzly:
                A quanto pare il nostro bambino ha abbracciato il suo lato rabbioso.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_neutral
                E invece di combatterlo, l'ha fatto proprio.
                Personalmente, la rabbia non mi convince mai molto.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_sad
                Porta solo disordine e dolore.
                Ma immagino tu sappia quello che stai facendo, no?#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_neutral
    
            - secondChar_ActualName == Lupo:
                La famiglia è qualcosa di importante, {player_name}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_neutral
                E sono contenta che {charNameTwo} abbia scoperto in sé la voglia di prendersene cura.
                E magari un giorno la sua nonna e suo fratello torneranno sotto il tetto dei genitori.
                Per me sarebbe un finale davvero felice.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_hurry

            - secondChar_ActualName == Delfino:
                Sono perplessa: non pensavo l'avresti spinto ad abbracciare il suo lato più infantile.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_neutral
                Giocoso.
                So che il tuo lavoro è fare uscire queste persone dal blocco.
                Ma l'unica soluzione era quella di renderlo un giullare?#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_sad
                
            - secondChar_ActualName == Capibara:
                A volte forse devo solo dirmi: non tutto il mondo può essere come vorrei.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_sad
                Il fatto che il nostro piccolo amico ora si senta un {charNameTwo} mi lascia perplessa.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_neutral
                Non sono mai stata una grande fan de "l'unione fa la forza".
                Ma forse tu hai visto qualcosa in quel bimbo che a me sfuggiva.
                E un giorno diventerà un uomo responsabile.
                Spero.
            
            - secondChar_ActualName == Corvo:
                Non credo avresti potuto ottenere un esito migliore.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_hurry
                La sua curiosità, la sua intelligenza indirizzate verso qualcosa di concreto, utile.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_neutral
                Ce lo vedo a studiare nuovi modi per curare le persone.
                Per ridurre la fame nel mondo.
                O anche solo per inventare una variante di begonia che sia completamente nera.
                Ottimo lavoro, {player_name}!#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_hurry
        }
        
    Spero di cuore che tu sia felice di quello che stai facendo.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_neutral
    A prescindere dal risultato.
    E un giorno potrai fare questo lavoro da {player_pronouns has him:solo|{player_pronouns has her:sola|solə}}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_hurry
    E a quel punto forse anche io potrò un poco riposare.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_sad
        ~ mentor_pauseTalking = mentor_pauseDuration
        ~ mentor_tutorialPauses = true
            -> main
   

=== third_character_feedback
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName) 
    
   third_character_feedback #speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_neutral 
    -> main
   
=== fourth_character_feedback
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
    fourth_character_feedback #speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_neutral 
        -> main
    
=== fifth_character_feedback
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)    
    
    fifth_character_feedback#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_neutral 
        -> main