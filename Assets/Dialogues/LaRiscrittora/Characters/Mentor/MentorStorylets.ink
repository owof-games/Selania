=== mentor_storylets ===
~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
~ temp charNameOne = uppercaseTranslator(firstCharacterState)

{
//Introduzioni

    - welcome == 0:
        -> welcome
    - gifts_and_ink == 0:
        {
            - not talk_with_first_character:
                {charNameFive}: Hai provato a parlare con quella persona?
                ->->
            - talk_with_first_character:
                {charNameFive}: Sembra che quella persona ti abbia raccontato qualcosa di sè!
                -> gifts_and_ink
        }
                
        
    - not questions:
        {
            - first_story_gift.ink_outcome:
                -> questions
            - else:
            {
                - firstStoryQuestCount >= minStoryQuesTCount: {charNameFive}: Hai fatto il tuo dono?
                  ->->
                - else:
                    {charNameFive}: Quando conoscerai meglio {charNameOne} potrai donarle qualcosa.
                      ->->
            }
        }
        
    - not first_character_feedback:
        {
            - firstStory == Ended:
                -> first_character_feedback
            - else:
                {charNameFive}: Prenditi il tuo tempo, ma ricordati che presto o tardi dovrai aiutare quella persona a trovare il suo nuovo nome.
                ->->

        }
        
    
//Presentazione dei luoghi
    - are_entities_together_in(PG, Mentor, Greenhouse) && not first_greenhouse_visit:
        -> first_greenhouse_visit

    - are_entities_together_in(PG, Mentor, Library) && not first_library_visit:
        -> first_library_visit

    - are_entities_together_in(PG, Mentor, Nest) && not first_nest_visit:
        -> first_nest_visit

    - are_entities_together_in(PG, Mentor, Laboratory) && not first_laboratory_visit:
        -> first_laboratory_visit

    - are_entities_together_in(PG, Mentor, BusStop) && not first_bus_stop_visit:
        -> first_bus_stop_visit
 
//Da creare: storylets per quando anime (non animelle) e Mentor sono assieme

    - else:
        ->->

}



// STORYLETS PRESENTAZIONE DEI LUOGHI
=== first_greenhouse_visit
~ temp charNameFive = uppercaseTranslator(fifthCharacterState)

    {charNameFive}: Hai trovato la serra!
    {charNameFive}: Qui puoi coltivare cose molto diverse tra loro.
    {charNameFive}: Tutte quelle cose che tendiamo a ignorare ma che sono fondamentali per la vita.
    {charNameFive}: Ad esempio: sapevi che i funghi sono il punto di contatto tra vita e morte?
    {charNameFive}: Trasformano la materia inorganica e in decomposizione in sostanze fondamentali per i viventi.
    {charNameFive}: Senza funghi la vita stessa sarebbe impensabile.
    {charNameFive}: E senza la serra, ogni riscrittura sarebbe più difficile.
    {charNameFive}: Lasciati coinvolgere dalle sue suggestioni, e quando quello che hai coltivato sarà cresciuto, potresti trovare qualcosa di utile per le altre persone.
    {charNameFive}: E per te.
    {charNameFive}: Riscrivere è un lavoro faticoso, e per questo è importante che ogni {pronouns has him: riscrittore|{pronouns has her: riscrittora|riscrittorə}} abbia dei momenti per prendersi cura di sé.
    {charNameFive}: Tornaci spesso: momento dopo momento quello che hai piantato sarà via via più rigoglioso.
        -> main

=== first_bus_stop_visit
~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    {charNameFive}: Questa è la fermata del bus.
    {charNameFive}: È un posto di passaggio: è da qui che arrivano e vanno le persone che cercano il tuo aiuto.
    {charNameFive}: Ed è da qui che potrai andare e tornare quando vorrai.
        -> main

=== first_nest_visit
~ temp charNameFive = uppercaseTranslator(fifthCharacterState)

    -> main


=== first_library_visit
~ temp charNameFive = uppercaseTranslator(fifthCharacterState)

    -> main


=== first_laboratory_visit
~ temp charNameFive = uppercaseTranslator(fifthCharacterState)

    -> main
