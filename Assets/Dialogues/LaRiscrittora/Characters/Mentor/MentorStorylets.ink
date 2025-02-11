=== mentor_storylets ===
~ temp charName = uppercaseTranslator(seventhCharacterState)
~ temp charNameUno = uppercaseTranslator(firstCharacterState)
{
//Introduzioni

    - welcome == 0:
        -> welcome
    - gifts_and_ink == 0:
        {
            - not talk_with_first_character:
                {charName}: Hai provato a parlare con quella persona?
                ->->
            - talk_with_first_character:
                {charName}: Sembra che quella persona ti abbia raccontato qualcosa di sè!
                -> gifts_and_ink
        }
                
        
    - not questions:
        {
            - first_story_gift.ink_outcome:
                -> questions
            - else:
            {
                - firstStoryQuestCount >= minStoryQuesTCount: {charName}: Hai fatto il tuo dono?
                  ->->
                - else:
                    {charName}: Quando conoscerai meglio {charNameUno} potrai donarle qualcosa.
                      ->->
            }
        }
        
    - not first_character_feedback:
        {
            - firstStory == Ended:
                -> first_character_feedback
            - else:
                {charName}: Prenditi il tuo tempo, ma ricordati che presto o tardi dovrai aiutare quella persona a trovare il suo nuovo nome.
                ->->

        }
        
    
//Presentazione dei luoghi
    - are_entities_together_in(PG, Mentor, Greenhouse) && not first_greenhouse_visit:
        -> first_greenhouse_visit

    - are_entities_together_in(PG, Mentor, Libary) && not first_library_visit:
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
~ temp charName = uppercaseTranslator(seventhCharacterState)
    {charName}: Hai trovato la serra!
    {charName}: Qui puoi coltivare cose molto diverse tra loro.
    {charName}: Tutte quelle cose che tendiamo a ignorare ma che sono fondamentali per la vita.
    {charName}: Ad esempio: sapevi che i funghi sono il punto di contatto tra vita e morte?
    {charName}: Trasformano la materia inorganica e in decomposizione in sostanze fondamentali per i viventi.
    {charName}: Senza funghi la vita stessa sarebbe impensabile.
    {charName}: E senza la serra, ogni riscrittura sarebbe più difficile.
    {charName}: Lasciati coinvolgere dalle sue suggestioni, e quando quello che hai coltivato sarà cresciuto, potresti trovare qualcosa di utile per le altre persone.
    {charName}: E per te.
    {charName}: Riscrivere è un lavoro faticoso, e per questo è importante che ogni {pronouns has him: riscrittore|{pronouns has her: riscrittora|riscrittorə}} abbia dei momenti per prendersi cura di sé.
    {charName}: Tornaci spesso: momento dopo momento quello che hai piantato sarà via via più rigoglioso.
        -> main

=== first_bus_stop_visit
~ temp charName = uppercaseTranslator(seventhCharacterState)
    {charName}: Questa è la fermata del bus.
    {charName}: È un posto di passaggio: è da qui che arrivano e vanno le persone che cercano il tuo aiuto.
    {charName}: Ed è da qui che potrai andare e tornare quando vorrai.
        -> main

=== first_nest_visit
~ temp charName = uppercaseTranslator(seventhCharacterState)

    -> main


=== first_library_visit
~ temp charName = uppercaseTranslator(seventhCharacterState)

    -> main


=== first_laboratory_visit
~ temp charName = uppercaseTranslator(seventhCharacterState)

    -> main
