=== mentor_storylets ===
~ temp charName = uppercaseTranslator(seventhCharacterState)
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
                {charName}: Hai fatto il tuo dono?
                ->->
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
    {charName}: Qui puoi far crescere moltissime cose del sottobosco.
    {charName}: Tutte quelle cosine che tendiamo a ignorare ma sono fondamentali per la vita.
    {charName}: Sapevi ad esempio che i funghi sono il punto di contatto tra vita e morte?
    {charName}: Trasformano la materia inorganica e in decomposizione in sostanze fondamentali per i viventi.
    {charName}: Senza funghi la vita stessa sarebbe impensabile.
    {charName}: E poi hanno migliaia di odori diversi, per la gioia del mio nasino.
    {charName}: Qui svolgono anche un'altra funzione:
    {charName}: consegnando loro ciò che vogliamo che rimanga nel passato, ci offrono nutrimenti per il presente e il futuro.
    {charName}: Riscrivere è un lavoro faticoso, e per questo è importante che ogni {pronouns has him: riscrittore|{pronouns has her: riscrittora|riscrittorə}} abbia dei momenti per prendersi cura di sé.
    {charName}: Tornaci spesso: tutto nel giardino cambia spesso.
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
