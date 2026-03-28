                    /* ---------------------------------
                    
                      Gestione timing e valori della storia
                    
                     ----------------------------------*/

//Possibili stati Chitarra
    LIST firstChar_possibleStates = Chitarra, Triangolo, RagazzaOrchestra, FlautoDolce, Ocarina, Violino
    VAR firstChar_ActualName = Chitarra
    
    //Stato della storia (non avviata, avviata, conclusa)
    VAR firstChar_storyStatus = story_storyNotStarted
    
    //Ordine di conclusione della riscrittura (prima storia conclusa, seconda storia conclusa)
    VAR firstChar_storyEndingPosition = ()


//Tracciamento della relazione
    //Status = chiamato da cucina e prima della riscrittura per valutare il rapporto creato e il relativo inchiostro
    VAR firstChar_relationshipStatus = 0
    //Indicator = l'informazione che diamo a Unity per indicare in una scala -x/x quale sia il rapporto con lx PNG
    VAR firstChar_relationshipIndicator = 0
    //Reaction: qui registriamo la reazione che verrà attivata coi sigilli
    VAR firstChar_relationshipReaction = neutral


//Tracciamento cucina
    //Autonoma
        VAR kitchen_firstCharIsCooking = false
        VAR kitchen_firstCharCookingTime = 0
        //Tempo che ci impiega a fare la sua ricetta
        VAR kitchen_firstCharCookingMaxTime = 8
    //Nostro invito
        //l'abbiamo invitata
        VAR kitchen_firstCharCookingTogetherInvite = false
        //Quante volte l'abbiamo invitata
        VAR kitchen_firstCharCookingTogetherNumberInvite = 0
        //Da quanto ci sta aspettando
        VAR kitchen_firstCharCookingTogetherWaiting = 0
        //Quanta pazienza ha ad aspettarci
        VAR kitchen_firstCharCookingMAXTogetherWaiting = 8
        //Ricetta creata
        VAR kitchen_firstCharRecipe = ""
        //Suggerimento rana
        VAR frog_first_char_ingredient = ""
        VAR frog_first_temp_growing_ingredient = false
            
    //Valore quarto ingrediente
        VAR kitchen_firstCharExtraIngredient = ()
        VAR kitchen_firstCharExtraIngredientReaction = notReaction

//Tracciamento apprezzamento doni/ingredienti. Tutto ciò che è fuori da questa lista = reazione neutrale/disgustata.
    VAR firstChar_favouritesGifts = (NonTiScordarDiTe, BaccaDellaAddolorata, CantoDelleCompagne)
    VAR firstChar_goodGifts = (ErbaLiccia, Olobino, BastoneDellOzioso, LanaNotturna)
    //Dono consigliato dalla rana
    VAR frog_first_char_gift = ""
    VAR frog_first_temp_growing_gift = false
    
//Tracciamento del dono
    VAR firstChar_giftedObject = ()

//Tracciamento apprezzamento glifi. Tutto ciò che è fuori da questa lista = reazione neutrale.
    // VAR firstChar_positiveGlyphs = ()
    // VAR firstChar_negativeGlyphs = ()

//Tracciamento del racconto
    VAR frog_first_novel = ""

//Tengo conto delle interazioni avute per aprire la possibilità di avviare la riscrittura
    VAR firstChar_storyletsForRewritingCount = 0
//Quantità di storylets letti dalla giocatrice prima di accedere alla riscrittura
    VAR firstChar_minStoryletsForRewriting = 9    
    VAR firstChar_specialEvent = false

//Questo è per il conteggio totale delle scelte prese con la PNG
    VAR firstChar_totalChoices = 0    
    
//Variabili per mettere in pausa la conversazione
    VAR firstChar_pauseTalking = 0
    VAR firstChar_pauseDuration = 1
    //Questa variabile verifica se abbiamo appena parlato con unx PNG, in modo tale da presentarci in modo diverso le possibili proposte che possiamo farle.
    VAR firstChar_justTalked = false
    
//Variabile per il countdown per la sua uscita di scena
    VAR firstChar_exitCounter = 0
    VAR firstChar_startingValueExitCounter = 6
    
//Variabile per il tempo di attesa tra una lettera e l'altra
    VAR firstChar_mailPause = 0
    VAR firstChar_mailPauseDuration = 5
    
//Moltiplicatore del colore per il personaggio
    VAR firstChar_glyphVariation = 3.0    
    
//STATI UP: water & aether.
//STATI DOWN: Air.
    VAR firstChar_aether = 0.00
    VAR firstChar_earth = 0.00
    VAR firstChar_air = 0.00
    VAR firstChar_water = 0.00
    VAR firstChar_fire= 0.00

    //Storage precedente valore
    VAR firstChar_last_aether = 0.00
    VAR firstChar_last_earth = 0.00
    VAR firstChar_last_air = 0.00
    VAR firstChar_last_water = 0.00
    VAR firstChar_last_fire= 0.00






                    /* ---------------------------------
                    
                       Gestione relazione e nomi
                    
                     ----------------------------------*/

=== firstAffinityCalc ===
//Questo mi serve per aggiornare il valore di affinità.
//Ad ora è chiamata solo in cucina e prima della riscrittura, e solo in riscrittura stampa una informazione.
//Per la prima personaggia l'importante è che il blu sia bassissimo

    //In questa prima fase di testing, punterò su una soluzione di difficoltà media: basta che o giallo o viola siano maggiori del blu.
    {
        - firstChar_aether or firstChar_water > firstChar_air:
            ~ firstChar_relationshipStatus ++
            {debug: aumento l'inchiostro della prima personaggia di un livello. Ora è a {~ firstChar_relationshipStatus}}
    }
    
    {
    
            //Se vengo dalla pre riscrittura:
            - rewriting_proposal_first_character.rewriting:
                {debug: ho cliccato rewriting e quindi faccio gli ultimi passaggi e attivo il feedback.} 
                //"Trasformo" la relazione in inchiostro
                    ~ fromRelationshipToInk(FirstCharacter)
                
                // Mando ai feedback
                    -> firstAffinityFeedback ->
                
                //Arriva il commento della strega
                    ~ inkLevel(FirstCharacter)
                
                //Salvo il massimo di inchiostro raggiunto con la personaggia
                    ~ maxInkLevelUpdater(FirstCharacter)    
                        ->-> 
            
            // altrimenti, mando avanti
            - else:
                ->->    
    
    }
    

    
    //La soluzione più tosta potrebbe essere questa invece.
    
    //{
    //    - firstChar_aether && firstChar_earth > firstChar_air:
    //        ~ firstChar_relationshipStatus ++
    //            ->->
    //}

            ->->
    




=== firstAffinityFeedback
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
{debug: passo per firstAffinityFeedback. Lo stato di inchiostro è {firstChar_InkLevel}.}

    Prima però ci terrei a dirti come sono andate le cose tra noi, qui.
            
        {
            -   are_two_entities_together(Mentor, PG):
                Vi lascio un po' di privacy. In bocca al lupo {player_name} e {charNameOne}.#speaker:{mentor_tag()}  #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)}  #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #portrait:mentore_neutral
                    ~ change_entity_place(Mentor)
        }
        {
            -   are_two_entities_together(SecondCharacter, PG):
                {charNameTwo}, potresti lasciarci un po' da sol3?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                Certissimamente! A dopo!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
                    ~ change_entity_place(SecondCharacter)
        }
        {
            - are_two_entities_together(Franco, PG):
                Non fate caso a me, sto provando a raccogliere tutte le bolle in un unico posto, ma continuano a scappare.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral        
        }

        
        {
            - firstChar_InkLevel == ink_empty:
                Come direbbe la mia vecchia insegnate di piano: apprezzo lo sforzo, manca il risultato.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                Ci sono stati momenti carini, ma ammetto che per lo più non mi sono sentita molto capita da te.
                Scusa.

            - firstChar_InkLevel == ink_low:
                E, insomma.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                Non è che ci capiamo molto noi due, sai?
                È come se io suonassi Chopin e tu la lambada.
                E la lambada è carina, ma non è roba mia.
                Ha senso? 
            
            - firstChar_InkLevel == ink_normal:
                Ci sono stati beni momenti tra noi, sai?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                Ma anche momenti no, in cui non mi sono sentita capita.
                Non è un reato.
                Ma, insomma, non riesco a fidarmi fino in fondo.
                Scusa.
            
            
            - firstChar_InkLevel == ink_medium:
                E {player_name}: non pensavo avrei trovato una persona amica, qui.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                Mi hai reso l'assenza di Talco, di Ennio, di Valeria moooolto più sopportabile.
                Grazie.
            
            
            - firstChar_InkLevel == ink_high:
                E mi chiedevo: ma che ci hanno separat3 alla nascita?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                Perché mi sento tipo come se avessimo un unico neurone.
                Unit3 in tutto.
                Ed è figa come cosa.
                Talco continua a mancarmi, ma con te mi sento come se fossimo parte da sempre della stessa band.
        }


->->


//Settaggio nome quando partiamo con la discussione (non finale quindi)

=== firstNaming ===
{debug: passo per firstNaming.}
{debug: prima di operare,il valore del nome è: {firstChar_ActualName}.}
 //Svuoto il valore per sicurezza
 ~ firstChar_ActualName = ()
 {debug: svuoto firstChar_ActualName : {firstChar_ActualName}.}
 
    {
        //Blu colore più usato
        - (firstChar_air > firstChar_water) && (firstChar_air > firstChar_fire) && (firstChar_air > firstChar_earth) && (firstChar_air > firstChar_aether):
            ~ firstChar_ActualName += Triangolo
            {debug: passo per Triangolo e il nome è : {firstChar_ActualName}.}
                ->->
        
        //Rosso colore più usato        
        - (firstChar_fire> firstChar_water) && (firstChar_fire> firstChar_air) && (firstChar_fire> firstChar_earth) && (firstChar_fire> firstChar_aether):
            ~ firstChar_ActualName += RagazzaOrchestra
            {debug: passo per Orchestra e il nome è : {firstChar_ActualName}.}
                ->->
        
        //Verde colore più usato        
        - (firstChar_water > firstChar_air) && (firstChar_water > firstChar_fire) && (firstChar_water > firstChar_earth) && (firstChar_water > firstChar_aether):
            ~ firstChar_ActualName += Violino
            {debug: passo per Violino e il nome è : {firstChar_ActualName}.}
                ->->
        
        //Giallo colore più usato        
        - (firstChar_earth > firstChar_water) && (firstChar_earth > firstChar_fire) && (firstChar_earth > firstChar_air) && (firstChar_earth > firstChar_aether):
            ~ firstChar_ActualName += Ocarina
            {debug: passo per Ocarina e il nome è : {firstChar_ActualName}.}
                ->->
        
        //Viola colore più usato        
        - (firstChar_aether > firstChar_water) && (firstChar_aether > firstChar_fire) && (firstChar_aether > firstChar_earth) && (firstChar_aether > firstChar_air):
        {debug: passo per FlautoDolce e il nome è : {firstChar_ActualName}.}
            ~ firstChar_ActualName += FlautoDolce    
                ->->
                
        - else:
            {
                - (firstChar_aether < firstChar_air) && (firstChar_water < firstChar_air):
                        ~ firstChar_ActualName += Triangolo
                        {debug: passo per Triangolo e il nome è : {firstChar_ActualName}.}
                        ->->
                
                - firstChar_aether && firstChar_water > firstChar_air:
                        ~ firstChar_ActualName += FlautoDolce
                            {debug: passo per FlautoDolce e il nome è : {firstChar_ActualName}.}
                        ->->
                - (firstChar_water > firstChar_air) && (not firstChar_aether > firstChar_air):
                        ~ firstChar_ActualName += Violino
                        {debug: passo per Violino e il nome è : {firstChar_ActualName}.}
                            ->->
                - (firstChar_aether > firstChar_air) && (not firstChar_water > firstChar_air):
                    {debug: passo per Ocarina e il nome è : {firstChar_ActualName}.}
                        ~ firstChar_ActualName += Ocarina 
                            ->->
                - else:
                        ~ firstChar_ActualName += RagazzaOrchestra
                            {debug: passo per Orchestra e il nome è : {firstChar_ActualName}.}
                            ->->
            }
        }
        ->->
        
//Formula per la chiusura di uno storylet
=== first_char_closing_storylet
        //Gestione crescita piante
        -> growing_check ->
        //Questo evita che venga proposto un altro storylet fino a quando la pausa non è finita
        ~ firstChar_pauseTalking = firstChar_pauseDuration
        //Questo è per la gestione delle domande
        ~ firstChar_justTalked = true
        //L'animazione per via dell'informazione nuova
        @animation:RewriterBook
        //E poi facciamo il check degli storylets.
        {
            //Main storylets
            - first_char_main_storylets.one && grimoire_firstChar hasnt grimFirstCharOne:
                ~ grimoire_firstChar += grimFirstCharOne

            - first_char_main_storylets.two && grimoire_firstChar hasnt grimFirstCharTwo:
                ~ grimoire_firstChar += grimFirstCharTwo

            - first_char_main_storylets.three && grimoire_firstChar hasnt grimFirstCharThree:
                ~ grimoire_firstChar += grimFirstCharThree    

            - first_char_main_storylets.four && grimoire_firstChar hasnt grimFirstCharFour:
                ~ grimoire_firstChar += grimFirstCharFour  

            - first_char_main_storylets.five && grimoire_firstChar hasnt grimFirstCharFive:
                ~ grimoire_firstChar += grimFirstCharFive

            - first_char_main_storylets.six && grimoire_firstChar hasnt grimFirstCharSix:
                ~ grimoire_firstChar += grimFirstCharSix

            - first_char_main_storylets.seven && grimoire_firstChar hasnt grimFirstCharSeven:
                ~ grimoire_firstChar += grimFirstCharSeven

            - first_char_main_storylets.eight && grimoire_firstChar hasnt grimFirstCharEight:
                ~ grimoire_firstChar += grimFirstCharEight    

            - first_char_main_storylets.nine && grimoire_firstChar hasnt grimFirstCharNine:
                ~ grimoire_firstChar += grimFirstCharNine  

            - first_char_main_storylets.ten && grimoire_firstChar hasnt grimFirstCharTen:
                ~ grimoire_firstChar += grimFirstCharTen 

            - first_char_main_storylets.eleven && grimoire_firstChar hasnt grimFirstCharEleven:
                ~ grimoire_firstChar += grimFirstCharEleven   

            - first_char_main_storylets.twelve && grimoire_firstChar hasnt grimFirstCharTwelve:
                ~ grimoire_firstChar += grimFirstCharTwelve

            //Storylets legati alla cucina
            - cooking_with_first_char.first_theme && grimoire_firstChar hasnt grimFirstCharKitchenOne:
                ~ grimoire_firstChar += grimFirstCharKitchenOne  

            - cooking_with_first_char.second_theme && grimoire_firstChar hasnt grimFirstCharKitchenTwo:
                ~ grimoire_firstChar += grimFirstCharKitchenTwo     

            - cooking_with_first_char.third_theme && grimoire_firstChar hasnt grimFirstCharKitchenThree:
                ~ grimoire_firstChar += grimFirstCharKitchenThree

            - ending_cooking_with_first_char && grimoire_firstChar hasnt grimFirstCharKitchenEnded:
                ~ grimoire_firstChar += grimFirstCharKitchenEnded 

            - first_char_cooking_alone && grimoire_firstChar hasnt grimFirstCharKitchenAlone:
                ~ grimoire_firstChar += grimFirstCharKitchenAlone                

            //Riscrittura
            - rewriting_proposal_first_character.confession && grimoire_firstChar hasnt grimFirstCharProposal:
                ~ grimoire_firstChar += grimFirstCharProposal

            - rewriting_proposal_first_character.close && grimoire_firstChar hasnt grimFirstCharNewName:
                ~ grimoire_firstChar += grimFirstCharNewName
            
            //Storylets speciali
            - open_the_kitchen && grimoire_firstChar hasnt grimFirstOpenKitchen:
                ~ grimoire_firstChar += grimFirstOpenKitchen

            - a_story_of_revenge && grimoire_firstChar hasnt grimFirstCharNovel:
                ~ grimoire_firstChar += grimFirstCharNovel

            - dog_first_char && grimoire_firstChar hasnt grimFirstCharDog:
                ~ grimoire_firstChar += grimFirstCharDog

            //Lettere    
            - first_character_notes.one && grimoire_firstChar hasnt grimFirstCharLetterOne:
                ~ grimoire_firstChar += grimFirstCharLetterOne

            - first_character_notes.two && grimoire_firstChar hasnt grimFirstCharLetterTwo:
                ~ grimoire_firstChar += grimFirstCharLetterTwo

            - first_character_notes.three && grimoire_firstChar hasnt grimFirstCharLetterThree:
                ~ grimoire_firstChar += grimFirstCharLetterThree        


        }
        //Aggiornamento lista di quelli comuni
        -> grimoire_common_storylets_updater ->

->->

