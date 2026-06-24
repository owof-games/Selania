//Variabili per la gestione della biblioteca
LIST library_allStories = (AdriAllora), (AlexiasDAvino), (Aza), (StenoArtico), (B), (BeatriceYBottura), (CeciliaFormicola), (FrancescaToscaRaimondi), (Jae), (Lamia), (LorisCasagrandi), (Kayleig), (ValFaustoLattanzio), (Romi), (Salvo), (Maura), (Beatrice), (LetiziaVaccarella), (Simo)

    //Tracking per l'achievement
    VAR library_allAchievementStories = ()   

//Liste per distinguere storie lette e non
    VAR library_unreadStories = ()
    VAR library_readStories = ()
    VAR library_temporaryTW = ()
    VAR library_temporaryReadTW = ()
    VAR library_temporaryShortTW = ()
    VAR library_temporaryAverageTW = ()
    VAR library_temporaryLongTW = ()
    VAR library_temporaryTransformationTW = ()
    VAR library_temporaryQuestionsTW = ()
    VAR library_temporaryUnpreparedTW = ()
    VAR library_temporaryMonstersTW = ()
    VAR library_temporaryFireTW = ()
    VAR library_temporaryRebellionTW = ()
    
//Raggruppamento per lunghezza
    LIST library_storiesDuration = Short, Average, Long
    VAR library_readingDuration = ()
    
    VAR library_shortStories = (StenoArtico, B, LorisCasagrandi, Kayleig, ValFaustoLattanzio, Maura, Jae)
    VAR library_averageStories = (AdriAllora, BeatriceYBottura, CeciliaFormicola, Lamia, Romi, Simo)
    VAR library_longStories = (Aza, AlexiasDAvino, Beatrice, FrancescaToscaRaimondi, Salvo, LetiziaVaccarella)
    
//Books about...
    VAR library_aboutTransformation = (Aza, AlexiasDAvino, B, FrancescaToscaRaimondi, Kayleig, LorisCasagrandi, ValFaustoLattanzio, Salvo, BeatriceYBottura, LetiziaVaccarella)
    VAR library_aboutQuestions = (AdriAllora, AlexiasDAvino, Beatrice, FrancescaToscaRaimondi, ValFaustoLattanzio, StenoArtico, Romi, Simo, Jae)
    VAR library_aboutUnprepared = (StenoArtico, Beatrice, Lamia, Simo, Jae)
    VAR library_aboutMonsters = (AdriAllora, Aza, B, BeatriceYBottura, CeciliaFormicola, Simo)
    VAR library_aboutFire= (Aza, CeciliaFormicola, Kayleig, BeatriceYBottura, Romi, Maura, LetiziaVaccarella)
    VAR library_aboutRebellion = (BeatriceYBottura, Lamia, Maura, Salvo, LorisCasagrandi)

    //Libro che verrà proposto
    VAR library_proposedBook = ()
    

=== book_test_intro ===
    
    {charTag(TheWitch, witch_state())}:   <i>La biblioteca mostra le sue storie a {player_name}.</i>
        
        + {library_readStories != ()} \ {charTag(PG, "neutral")}:       <i>Voglio rileggere qualcosa.</i>
            {charTag(TheWitch, witch_state())}:   <i>Ad ora {player_name} ha letto {number_translator(library_readStories)} {libro_libri(library_readStories)}.</i>
            -> reread
            
        + {library_unreadStories != ()} \ {charTag(PG, "neutral")}:        <i>Voglio una nuova storia casuale.</i>
            -> storyRandom
            
        + {library_unreadStories != ()} \ {charTag(PG, "neutral")}:       <i>Voglio scegliere la mia storia.</i>
            -> storyQuestions
    
        + \ {charTag(PG, "neutral")}:       <i>Non voglio più leggere.</i>
            -> DarkLibraryModeOff ->
            -> main

->->


=== storyRandom ===
//Questo è il più facile: recupero un titolo randomico tra i libri non letti.
    ~ library_proposedBook = ()
    ~ library_proposedBook = LIST_RANDOM(library_unreadStories)
    ->from_list_to_books


=== storyQuestions ===
    //Svuoto il valore del libro
    ~ library_proposedBook = ()
    -> story_duration

    = story_duration
    {charTag(TheWitch, witch_state())}:   <i>{player_name} desidera una storia veloce come una pulce o lenta come la notte?</i>
        + {library_shortStories != ()} \ {charTag(PG, "neutral")}:        <i>Qualcosa di brevissimo (max 1500 battute).</i>
        //(1500 battute max)
            ~ library_readingDuration += Short
        
        + {library_averageStories != ()} \ {charTag(PG, "neutral")}:        <i>Una storia veloce (max 3000 battute).</i>
        // (3000 battute max)
            ~ library_readingDuration += Average
        
        + {library_longStories != ()} \ {charTag(PG, "neutral")}:        <i>Un racconto più lungo (max 8000 battute).</i>
        // 8000 battute max 
            ~ library_readingDuration += Long
        -
        -> story_themeChoice
        
    
    = story_themeChoice
    // transformation
    {charTag(TheWitch, witch_state())}:   <i>La biblioteca offre una storia...</i>

        + {library_readingDuration has Short && library_shortStories^ library_aboutTransformation != ()} \ {charTag(PG, "neutral")}:        <i>Che racconti di qualcosa che si <b>trasforma</b>.</i>
            ~ library_proposedBook = LIST_RANDOM(library_shortStories^ library_aboutTransformation)
             -> from_list_to_books
 
        + {library_readingDuration has Average && library_averageStories^ library_aboutTransformation != ()} \ {charTag(PG, "neutral")}:        <i>Che racconti di qualcosa che si <b>trasforma</b>.</i>
            ~ library_proposedBook = LIST_RANDOM(library_averageStories ^ library_aboutTransformation)
             -> from_list_to_books           
            
        + {library_readingDuration has Long && library_longStories^ library_aboutTransformation != ()} \ {charTag(PG, "neutral")}:        <i>Che racconti di qualcosa che si <b>trasforma</b>.</i>
            ~ library_proposedBook = LIST_RANDOM(library_longStories ^ library_aboutTransformation)
            -> from_list_to_books
        

        
    //questions       
    
        + {library_readingDuration has Short && library_shortStories^ library_aboutQuestions != ()} \ {charTag(PG, "neutral")}:        <i>Che parli di chi <b>si pone domande</b>.</i>
            ~ library_proposedBook = LIST_RANDOM(library_shortStories^ library_aboutQuestions)
            -> from_list_to_books
        
        + {library_readingDuration has Average && library_averageStories^ library_aboutQuestions != ()} \ {charTag(PG, "neutral")}:        <i>Che parli di chi <b>si pone domande</b>.</i>
            ~ library_proposedBook = LIST_RANDOM(library_averageStories ^ library_aboutQuestions)
            -> from_list_to_books

        + {library_readingDuration has Long && library_longStories^ library_aboutQuestions != ()} \ {charTag(PG, "neutral")}:        <i>Che parli di chi <b>si pone domande</b>.</i>
            ~ library_proposedBook = LIST_RANDOM(library_longStories ^ library_aboutQuestions)
            -> from_list_to_books
          
            
    // unprepared
    
        + {library_readingDuration has Short && library_shortStories^ library_aboutUnprepared != ()} \ {charTag(PG, "neutral")}:        <i>Che mi colga<b> {player_pronoun has him:impreparato|{player_pronoun has her:impreparata|impreparatə}}</b></i>
            ~ library_proposedBook = LIST_RANDOM(library_shortStories^ library_aboutUnprepared)
            -> from_list_to_books

        + {library_readingDuration has Average && library_averageStories^ library_aboutUnprepared != ()} \ {charTag(PG, "neutral")}:        <i>Che mi colga<b> {player_pronoun has him:impreparato|{player_pronoun has her:impreparata|impreparatə}}</b>.</i>
            ~ library_proposedBook = LIST_RANDOM(library_averageStories ^ library_aboutUnprepared)
            -> from_list_to_books
        </i>
        + {library_readingDuration has Long && library_longStories^ library_aboutUnprepared != ()} \ {charTag(PG, "neutral")}:        <i>Che mi colga<b> {player_pronoun has him:impreparato|{player_pronoun has her:impreparata|impreparatə}}</b>.
            ~ library_proposedBook = LIST_RANDOM(library_longStories ^ library_aboutUnprepared)
            -> from_list_to_books            
        
       
    // monsters

    
        + {library_readingDuration has Short && library_shortStories^ library_aboutMonsters != ()} \ {charTag(PG, "neutral")}:        <i>Che parli di <b>cose mostruose</b>.</i>
            ~ library_proposedBook = LIST_RANDOM(library_shortStories^ library_aboutMonsters)
            -> from_list_to_books

        + {library_readingDuration has Average && library_averageStories^ library_aboutMonsters != ()} \ {charTag(PG, "neutral")}:        <i>Che parli di <b>cose mostruose</b>.</i>
            ~ library_proposedBook = LIST_RANDOM(library_averageStories ^ library_aboutMonsters)
            -> from_list_to_books
        
        + {library_readingDuration has Long && library_longStories^ library_aboutMonsters != ()} \ {charTag(PG, "neutral")}:        <i>Che parli di <b>cose mostruose</b>.</i>
            ~ library_proposedBook = LIST_RANDOM(library_longStories ^ library_aboutMonsters)
            -> from_list_to_books            
        
    //fire  

    
        + {library_readingDuration has Short && library_shortStories^ library_aboutFire != ()} \ {charTag(PG, "neutral")}:        <i>Che racconti di <b>cose che bruciano</b>.</i>
            ~ library_proposedBook = LIST_RANDOM(library_shortStories^ library_aboutFire)
            -> from_list_to_books

        + {library_readingDuration has Average && library_averageStories^ library_aboutFire != ()} \ {charTag(PG, "neutral")}:        <i>Che racconti di <b>cose che bruciano</b>.</i>
            ~ library_proposedBook = LIST_RANDOM(library_averageStories ^ library_aboutFire)
            -> from_list_to_books
        
        + {library_readingDuration has Long && library_longStories^ library_aboutFire != ()} \ {charTag(PG, "neutral")}:        <i>Che racconti di <b>cose che bruciano</b>.</i>
            ~ library_proposedBook = LIST_RANDOM(library_longStories ^ library_aboutFire)
            -> from_list_to_books            
        

    //rebellion

    
        + {library_readingDuration has Short && library_shortStories^ library_aboutRebellion != ()} \ {charTag(PG, "neutral")}:        <i>Che urli di <b>sogni e ribellioni</b>.</i>
            ~ library_proposedBook = LIST_RANDOM(library_shortStories^ library_aboutRebellion)
            -> from_list_to_books

        + {library_readingDuration has Average && library_averageStories^ library_aboutRebellion != ()} \ {charTag(PG, "neutral")}:        <i>Che urli di <b>sogni e ribellioni</b>.</i>
            ~ library_proposedBook = LIST_RANDOM(library_averageStories ^ library_aboutRebellion)
            -> from_list_to_books
        
        + {library_readingDuration has Long && library_longStories^ library_aboutRebellion != ()} \ {charTag(PG, "neutral")}:        <i>Che urli di <b>sogni e ribellioni</b>.</i>
            ~ library_proposedBook = LIST_RANDOM(library_longStories ^ library_aboutRebellion)
            -> from_list_to_books            
        

        + \ {charTag(PG, "neutral")}:        <i>Non ho più voglia di leggere.</i>
            ~ library_readingDuration = ()
            -> book_test_intro           
        
->->


//Gestione TW temporanei
=== tempTW
{debug: Entro in tempTW. Prima di operare la funzione, il valore di library_proposedBook è {library_proposedBook}. Unreadstories ha questi libri: {library_unreadStories}, mentre readstories ha questi {library_readStories}.}
    {
    - library_unreadStories has library_proposedBook:
    	~ library_unreadStories -= library_proposedBook
    	~ library_temporaryTW += library_proposedBook
    - library_readStories has library_proposedBook:
    	~ library_readStories -= library_proposedBook
    	~ library_temporaryReadTW +=library_proposedBook
    }
    
    {
    - library_shortStories has library_proposedBook:
        ~ library_shortStories -= library_proposedBook
        ~ library_temporaryShortTW += library_proposedBook
    - library_averageStories has library_proposedBook:
        ~ library_averageStories -= library_proposedBook
        ~ library_temporaryAverageTW += library_proposedBook
    - library_longStories has library_proposedBook:
        ~ library_longStories -= library_proposedBook
        ~ library_temporaryLongTW += library_proposedBook
    }

    {
    - library_aboutTransformation has library_proposedBook:
        ~ library_aboutTransformation -= library_proposedBook
        ~ library_temporaryTransformationTW += library_proposedBook
    }
    {
    - library_aboutQuestions has library_proposedBook:
        ~ library_aboutQuestions -= library_proposedBook
        ~ library_temporaryQuestionsTW += library_proposedBook
    }
    {
    - library_aboutUnprepared has library_proposedBook:
        ~ library_aboutUnprepared -= library_proposedBook
        ~ library_temporaryUnpreparedTW += library_proposedBook
    }
    {
    - library_aboutMonsters has library_proposedBook:
        ~ library_aboutMonsters -= library_proposedBook
        ~ library_temporaryMonstersTW += library_proposedBook
    }
    {
    - library_aboutFire has library_proposedBook:
        ~ library_aboutFire -= library_proposedBook
        ~ library_temporaryFireTW += library_proposedBook
    }
    {
    - library_aboutRebellion has library_proposedBook:
        ~ library_aboutRebellion -= library_proposedBook
        ~ library_temporaryRebellionTW += library_proposedBook
    }

{debug: Dopo aver operato la funzione, il valore di library_proposedBook è {library_proposedBook}. Unreadstories ha questi libri: {library_unreadStories}, mentre readstories ha questi {library_readStories}.}    
->->


//Chiamo questa funzione per i trigger warning temporanei, quando voglio evitare una storia solo in una occasione
=== empty_tempTW
{debug: passo per empty_tempTW. Prima di operare la funzione, la lista di storie non lette contiene {library_unreadStories} e la lista delle storie non lette ed evitate contiene {library_temporaryTW}. La lista delle storie da rileggere è {library_readStories} e le storie da rileggere evitate sono {library_temporaryReadTW}.}
    ~ library_unreadStories += library_temporaryTW
    ~ library_temporaryTW = ()
    ~ library_readStories += library_temporaryReadTW
    ~ library_temporaryReadTW = ()

    ~ library_shortStories += library_temporaryShortTW
    ~ library_temporaryShortTW = ()
    ~ library_averageStories += library_temporaryAverageTW
    ~ library_temporaryAverageTW = ()
    ~ library_longStories += library_temporaryLongTW
    ~ library_temporaryLongTW = ()

    ~ library_aboutTransformation += library_temporaryTransformationTW
    ~ library_temporaryTransformationTW = ()
    ~ library_aboutQuestions += library_temporaryQuestionsTW
    ~ library_temporaryQuestionsTW = ()
    ~ library_aboutUnprepared += library_temporaryUnpreparedTW
    ~ library_temporaryUnpreparedTW = ()
    ~ library_aboutMonsters += library_temporaryMonstersTW
    ~ library_temporaryMonstersTW = ()
    ~ library_aboutFire += library_temporaryFireTW
    ~ library_temporaryFireTW = ()
    ~ library_aboutRebellion += library_temporaryRebellionTW
    ~ library_temporaryRebellionTW = ()

{debug: dopo aver applicato empty_tempTW, la lista di storie non lette contiene {library_unreadStories} e la lista delle storie evitate contiene {library_temporaryTW}.La lista delle storie da rileggere è {library_readStories} e i trigger sono attivi per {library_temporaryReadTW}.}

->->

//Funzione di rimozione permanente di un racconto
=== permanentTW
{debug: Entro in permanentTW. Prima di operare la funzione, il valore di library_proposedBook è {library_proposedBook}. Unreadstories ha questi libri: {library_unreadStories}, mentre readstories ha questi {library_readStories}.}
{
    - library_unreadStories has library_proposedBook:
    	~ library_unreadStories -= library_proposedBook
    - library_readStories has library_proposedBook:
    	~ library_readStories -= library_proposedBook
}
{debug: Dopo aver operato la funzione, il valore di library_proposedBook è {library_proposedBook}. Unreadstories ha questi libri: {library_unreadStories}, mentre readstories ha questi {library_readStories}.}   
->->
    
=== refresh_book_lists
//A prescindere prima di tutto levo il libro dalle storie non lette e lo metto tra le storie lette.

    ~ library_readingDuration =()
{
    
    - library_shortStories has library_proposedBook:
        ~ library_shortStories -= library_proposedBook
    - library_averageStories has library_proposedBook:
        ~ library_averageStories -= library_proposedBook
    - library_longStories has library_proposedBook:
        ~ library_longStories -= library_proposedBook
}
{
    - library_aboutTransformation has library_proposedBook:
        ~ library_aboutTransformation -= library_proposedBook
}
{
    - library_aboutQuestions has library_proposedBook:
        ~ library_aboutQuestions -= library_proposedBook
}
{
    - library_aboutUnprepared has library_proposedBook:
        ~ library_aboutUnprepared -= library_proposedBook
}
{
    - library_aboutMonsters has library_proposedBook:
        ~ library_aboutMonsters -= library_proposedBook
}
{
    - library_aboutFire has library_proposedBook:
        ~ library_aboutFire -= library_proposedBook
}
{
    - library_aboutRebellion has library_proposedBook:
        ~ library_aboutRebellion -= library_proposedBook

}
->->


=== from_list_to_books ===
{library_proposedBook:
    - AdriAllora:
        -> adri_allora
    - Aza:
        -> aza
    - AlexiasDAvino:
        -> alexias_d_avino
    - StenoArtico:
        -> steno_artico
    - B:
        -> b
    - Beatrice:
        -> beatrice
    - BeatriceYBottura:
        -> beatrice_y_bottura

        
    - CeciliaFormicola:
        -> cecilia_formicola
    - FrancescaToscaRaimondi:
        -> francesca_tosca_raimondi
    
    - Kayleig:
        -> kayleig
    - Jae:
        -> jae    
    - Lamia:
        -> lamia       
    - LorisCasagrandi:
        -> loris_casagrandi
    - ValFaustoLattanzio:
        -> val_fausto_lattanzio        
    - Romi:
        -> romi
        
    - Salvo:
        -> salvo
    - Maura:
        -> maura
    - Simo:
        -> simo    
    - LetiziaVaccarella:
        -> letizia_vaccarella
    // - QueerginiaWolf:
    //     -> queerginia_wolf

    - else: {charTag(TheWitch, witch_state())}:   <i>La biblioteca non riesce a trovare un racconto adatto.</i>
        -> book_test_intro
    
}


-> DONE

=== reread ===
//Per sicurezza svuoto library_proposedBook
~ library_proposedBook = ()

{shuffle:
    - {library_readStories has AdriAllora: -> reread_adri_allora| -> reread}
    - {library_readStories has AlexiasDAvino: -> reread_alexias_d_avino| -> reread}    
    - {library_readStories has Aza: -> reread_aza| -> reread}    
    - {library_readStories has StenoArtico: -> reread_steno_artico| -> reread}
    - {library_readStories has B: -> reread_b| -> reread}     
    - {library_readStories has Beatrice: -> reread_beatrice| -> reread}    
    - {library_readStories has BeatriceYBottura: -> reread_beatrice_y_bottura| -> reread}
    
    - {library_readStories has CeciliaFormicola: -> reread_cecilia_formicola| -> reread}
    - {library_readStories has FrancescaToscaRaimondi: -> reread_francesca_tosca_raimondi| -> reread}   
    
    - {library_readStories has Kayleig: -> reread_kayleig| ->reread}
    - {library_readStories has Jae: -> reread_jae| ->reread} 
    - {library_readStories has Lamia: -> reread_lamia| ->reread}
    - {library_readStories has LorisCasagrandi: -> reread_loris_casagrandi| ->reread} 
    - {library_readStories has ValFaustoLattanzio: -> reread_val_lattanzio| ->reread}
    - {library_readStories has Romi: -> reread_romi| ->reread}
    
    - {library_readStories has Salvo: -> reread_salvo| -> reread}
    - {library_readStories has Maura: -> reread_maura| -> reread}
    - {library_readStories has Simo: -> reread_simo| -> reread}
    - {library_readStories has LetiziaVaccarella: -> reread_letizia_vaccarella| -> reread}
    // - {library_readStories has QueerginiaWolf: -> reread_queerginia_wolf| -> reread}
}


    
    = reread_adri_allora
    {charTag(TheWitch, witch_state())}:   <i>La biblioteca si chiede cosa {player_name} voglia rileggere.</i>
    
        +  \ {charTag(PG, "neutral")}:       <i>Rileggo <b>Il mio bellissimo gatto</b> di Adri Allora(ləi).</i>
                -> adri_allora
        +  {LIST_COUNT(library_readStories) > 1}\ {charTag(PG, "neutral")}: <i>Vorrei rileggere qualcosa di diverso.</i>
                -> reread
        +  \ {charTag(PG, "neutral")}:       <i>Ho cambiato idea, voglio una storia nuova.</i>
                -> book_test_intro
    
    = reread_alexias_d_avino
    {charTag(TheWitch, witch_state())}:   <i>La biblioteca si chiede cosa {player_name} voglia rileggere.</i>
    
        +  \ {charTag(PG, "neutral")}:       <i>Rileggo <b>Il Riflesso</b> di Alexias D'Avino (lui/lei).</i>
                -> alexias_d_avino
        +  {LIST_COUNT(library_readStories) > 1}\ {charTag(PG, "neutral")}: <i>Vorrei rileggere qualcosa di diverso.</i>
                -> reread
        +  \ {charTag(PG, "neutral")}:       <i>Ho cambiato idea, voglio una storia nuova.</i>
                -> book_test_intro            
                
    = reread_aza
    {charTag(TheWitch, witch_state())}:   <i>La biblioteca si chiede cosa {player_name} voglia rileggere.</i>
        +  \ {charTag(PG, "neutral")}:       <i>Rileggo <b>Luna vergine</b> di Aza (any).
                -> aza
        +  {LIST_COUNT(library_readStories) > 1}\ {charTag(PG, "neutral")}: <i>Vorrei rileggere qualcosa di diverso.</i>
                -> reread
        +  \ {charTag(PG, "neutral")}:       <i>Ho cambiato idea, voglio una storia nuova.</i>
                -> book_test_intro                 
    
    = reread_steno_artico
    {charTag(TheWitch, witch_state())}:   <i>La biblioteca si chiede cosa {player_name} voglia rileggere.</i>
    
        +  \ {charTag(PG, "neutral")}:       <i>Rileggo <b>Questa rabbia, che mi è stata rubata</b> by StenoArtico (he/him, none).</i>
                -> steno_artico
        +  {LIST_COUNT(library_readStories) > 1}\ {charTag(PG, "neutral")}: <i>Vorrei rileggere qualcosa di diverso.</i>
                -> reread
        +  \ {charTag(PG, "neutral")}:       <i>Ho cambiato idea, voglio una storia nuova.</i>
                -> book_test_intro 
    
    = reread_b
    {charTag(TheWitch, witch_state())}:   <i>La biblioteca si chiede cosa {player_name} voglia rileggere.</i>
    
        +  \ {charTag(PG, "neutral")}:       <i>Rileggo <b>Il tocco della rabbia</b> di K.(she/her).</i>
                -> b
        +  {LIST_COUNT(library_readStories) > 1}\ {charTag(PG, "neutral")}: <i>Vorrei rileggere qualcosa di diverso.</i>
                -> reread
        +  \ {charTag(PG, "neutral")}:       <i>Ho cambiato idea, voglio una storia nuova.</i>
                -> book_test_intro 
                
    = reread_beatrice
    {charTag(TheWitch, witch_state())}:   <i>La biblioteca si chiede cosa {player_name} voglia rileggere.</i>
    
        +  \ {charTag(PG, "neutral")}:       <i>Rileggo <b>La rete non esiste</b> di Beatrice (she/her).</i>
                -> beatrice
        +  {LIST_COUNT(library_readStories) > 1}\ {charTag(PG, "neutral")}: <i>Vorrei rileggere qualcosa di diverso.</i>
                -> reread
        +  \ {charTag(PG, "neutral")}:       <i>Ho cambiato idea, voglio una storia nuova.</i>
                -> book_test_intro 
                
    = reread_beatrice_y_bottura
    {charTag(TheWitch, witch_state())}:   <i>La biblioteca si chiede cosa {player_name} voglia rileggere.</i>
    
        +  \ {charTag(PG, "neutral")}:       <i>Rileggo <b>Artigli Rosso Ruggine</b> di Beatrice Y. Bottura (she/it).</i>
                -> beatrice_y_bottura
        +  {LIST_COUNT(library_readStories) > 1}\ {charTag(PG, "neutral")}: <i>Vorrei rileggere qualcosa di diverso.</i>
                -> reread
        +  \ {charTag(PG, "neutral")}:       <i>Ho cambiato idea, voglio una storia nuova.</i>
                -> book_test_intro 



                
    = reread_cecilia_formicola
    {charTag(TheWitch, witch_state())}:   <i>La biblioteca si chiede cosa {player_name} voglia rileggere.</i>
    
        +  \ {charTag(PG, "neutral")}:       <i>Rileggo <b>Fuochino</b> di Cecilia Formicola (she/her).</i>
                -> cecilia_formicola
        +  {LIST_COUNT(library_readStories) > 1}\ {charTag(PG, "neutral")}: <i>Vorrei rileggere qualcosa di diverso.</i>
                -> reread
        +  \ {charTag(PG, "neutral")}:       <i>Ho cambiato idea, voglio una storia nuova.</i>
                -> book_test_intro 
 
    = reread_francesca_tosca_raimondi
    {charTag(TheWitch, witch_state())}:   <i>La biblioteca si chiede cosa {player_name} voglia rileggere.</i>
    
        +  \ {charTag(PG, "neutral")}:       <i>Rileggo <b>Trecentotrenta metri</b> di Francesca Tosca Raimondi (she/her).</i>
                -> francesca_tosca_raimondi
        +  {LIST_COUNT(library_readStories) > 1}\ {charTag(PG, "neutral")}: <i>Vorrei rileggere qualcosa di diverso.</i>
                -> reread
        +  \ {charTag(PG, "neutral")}:       <i>Ho cambiato idea, voglio una storia nuova.</i>
                -> book_test_intro 
    
    
    = reread_kayleig
    {charTag(TheWitch, witch_state())}:   <i>La biblioteca si chiede cosa {player_name} voglia rileggere.</i>
    
        +  \ {charTag(PG, "neutral")}:       <i>Rileggo <b>Volevo che mia madre fosse forte</b> di Kayleig (she/her).</i>
                -> kayleig
        +  {LIST_COUNT(library_readStories) > 1}\ {charTag(PG, "neutral")}: <i>Vorrei rileggere qualcosa di diverso.</i>
                -> reread
        +  \ {charTag(PG, "neutral")}:       <i>Ho cambiato idea, voglio una storia nuova.</i>
                -> book_test_intro  
    
    = reread_jae
    {charTag(TheWitch, witch_state())}:   <i>La biblioteca si chiede cosa {player_name} voglia rileggere.</i>
    
        +  \ {charTag(PG, "neutral")}:       <i>Rileggo <b>Chiarirsi, divertirsi</b> di Jae (she/they).</i>
                -> jae
        +  {LIST_COUNT(library_readStories) > 1}\ {charTag(PG, "neutral")}: <i>Vorrei rileggere qualcosa di diverso.</i>
                -> reread
        +  \ {charTag(PG, "neutral")}:       <i>Ho cambiato idea, voglio una storia nuova.</i>
                -> book_test_intro  

    = reread_lamia
    {charTag(TheWitch, witch_state())}:   <i>La biblioteca si chiede cosa {player_name} voglia rileggere.</i>
    
        +  \ {charTag(PG, "neutral")}:       <i>Rileggo <b>Il sassolino</b> di Lamia (she/they).</i>
                -> lamia
        +  {LIST_COUNT(library_readStories) > 1}\ {charTag(PG, "neutral")}: <i>Vorrei rileggere qualcosa di diverso.</i>
                -> reread
        +  \ {charTag(PG, "neutral")}:       <i>Ho cambiato idea, voglio una storia nuova.</i>
                -> book_test_intro 
    
    = reread_loris_casagrandi
    {charTag(TheWitch, witch_state())}:   <i>La biblioteca si chiede cosa {player_name} voglia rileggere.</i>
    
        +  \ {charTag(PG, "neutral")}:       <i>Rileggo <b>Volevo essere solo cervello</b> di Loris Casagrandi (he/him - she/her).</i>
                -> loris_casagrandi
        +  {LIST_COUNT(library_readStories) > 1}\ {charTag(PG, "neutral")}: <i>Vorrei rileggere qualcosa di diverso.</i>
                -> reread
        +  \ {charTag(PG, "neutral")}:       <i>Ho cambiato idea, voglio una storia nuova.</i>
                -> book_test_intro             
    
    = reread_val_lattanzio
    {charTag(TheWitch, witch_state())}:   <i>La biblioteca si chiede cosa {player_name} voglia rileggere.</i>
    
        +  \ {charTag(PG, "neutral")}:       <i>Rileggo <b>Home</b> di Val Fausto Lattanzio (he/they).</i>
                -> val_fausto_lattanzio
        +  {LIST_COUNT(library_readStories) > 1}\ {charTag(PG, "neutral")}: <i>Vorrei rileggere qualcosa di diverso.</i>
                -> reread
        +  \ {charTag(PG, "neutral")}:       <i>Ho cambiato idea, voglio una storia nuova.</i>
                -> book_test_intro        
    
    = reread_romi
    {charTag(TheWitch, witch_state())}:   <i>La biblioteca si chiede cosa {player_name} voglia rileggere.</i>
    
        +  \ {charTag(PG, "neutral")}:       <i>Rileggo <b>Il principe sbagliato</b> di Romi (any).</i>
                -> romi
        +  {LIST_COUNT(library_readStories) > 1}\ {charTag(PG, "neutral")}: <i>Vorrei rileggere qualcosa di diverso.</i>
                -> reread
        +  \ {charTag(PG, "neutral")}:       <i>Ho cambiato idea, voglio una storia nuova.</i>
                -> book_test_intro   
 
 
    = reread_salvo
    {charTag(TheWitch, witch_state())}:   <i>La biblioteca si chiede cosa {player_name} voglia rileggere.</i>
    
        +  \ {charTag(PG, "neutral")}:       <i>Rileggo <b>Il cancello</b> di Salvo (he/him).</i>
                -> salvo
        +  {LIST_COUNT(library_readStories) > 1}\ {charTag(PG, "neutral")}: <i>Vorrei rileggere qualcosa di diverso.</i>
                -> reread
        +  \ {charTag(PG, "neutral")}:       <i>Ho cambiato idea, voglio una storia nuova.</i>
                -> book_test_intro 
                
    = reread_maura
    {charTag(TheWitch, witch_state())}:   <i>La biblioteca si chiede cosa {player_name} voglia rileggere.</i>
    
        +  \ {charTag(PG, "neutral")}:       <i>Rileggo <b>Polvere</b> di Maura (she/they).</i>
                -> maura
        +  {LIST_COUNT(library_readStories) > 1}\ {charTag(PG, "neutral")}: <i>Vorrei rileggere qualcosa di diverso.</i>
                -> reread
        +  \ {charTag(PG, "neutral")}:       <i>Ho cambiato idea, voglio una storia nuova.</i>
                -> book_test_intro        
    
    = reread_simo
    {charTag(TheWitch, witch_state())}:   <i>La biblioteca si chiede cosa {player_name} voglia rileggere.</i>
    
        +  \ {charTag(PG, "neutral")}:       <i>Rileggo <b>SCP</b> di Simo (they/he).</i>
                -> simo
        +  {LIST_COUNT(library_readStories) > 1}\ {charTag(PG, "neutral")}: <i>Vorrei rileggere qualcosa di diverso.</i>
                -> reread
        +  \ {charTag(PG, "neutral")}:       <i>Ho cambiato idea, voglio una storia nuova.</i>
                -> book_test_intro 

    = reread_letizia_vaccarella
    {charTag(TheWitch, witch_state())}:   <i>La biblioteca si chiede cosa {player_name} voglia rileggere.</i>
    
        +  \ {charTag(PG, "neutral")}:       <i>Rileggo <b>Dodici Stelle</b> di Letizia Vaccarella (she/her).</i>
                -> letizia_vaccarella
        +  {LIST_COUNT(library_readStories) > 1}\ {charTag(PG, "neutral")}: <i>Vorrei rileggere qualcosa di diverso.</i>
                -> reread
        +  \ {charTag(PG, "neutral")}:       <i>Ho cambiato idea, voglio una storia nuova.</i>
                -> book_test_intro     
    
    // = reread_queerginia_wolf
    // {charTag(TheWitch, witch_state())}:   <i>La biblioteca si chiede cosa {player_name} voglia rileggere.</i>
    
    //     +  \ {charTag(PG, "neutral")}:       <i>Rileggo <b>Giallo</b> di Queerginia Wolf/Marco Spelgatti (she/he/they).</i>
    //             -> queerginia_wolf
    //     +  {LIST_COUNT(library_readStories) > 1}\ {charTag(PG, "neutral")}: <i>Vorrei rileggere qualcosa di diverso.</i>
    //             -> reread
    //     +  \ {charTag(PG, "neutral")}:       <i>Ho cambiato idea, voglio una storia nuova.</i>
    //             -> book_test_intro 
    


->->

=== function number_translator(list)
{
    - LIST_COUNT(list) == 0: zero
    - LIST_COUNT(list) == 1: un
    - LIST_COUNT(list) == 2: due
    - LIST_COUNT(list) == 3: tre
    - LIST_COUNT(list) == 4: quattro
    - LIST_COUNT(list) == 5: cinque
    - LIST_COUNT(list) == 6: sei
    - LIST_COUNT(list) == 7: sette
    - LIST_COUNT(list) == 8: otto
    - LIST_COUNT(list) == 9: nove
    - LIST_COUNT(list) == 10: dieci
    - LIST_COUNT(list) == 11: undici
    - LIST_COUNT(list) == 12: dodici
    - LIST_COUNT(list) == 13: tredici
    - LIST_COUNT(list) == 14: quattordici
    - LIST_COUNT(list) == 15: quindici
    - LIST_COUNT(list) == 16: sedici
    - LIST_COUNT(list) == 17: diciassette
    - LIST_COUNT(list) == 18: diciotto
    - LIST_COUNT(list) == 19: diciannove
    - LIST_COUNT(list) == 20: venti
    
}


=== function libro_libri(list)
    {LIST_COUNT(list) == 1:racconto|racconti}