//Gradualmente ognuno dei cinque feedback che lei ci dà serviranno per tracciare un percorso che parta dalla riscrittura come esperienza personale a qualcosa che è parte di un cambiamento per forza collettivo, inevitabilmente collettivo.

=== witch_first_story_ended_check
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
        

        <i>Osserviamo {player_name} e ci chiediamo cosa provi dopo aver aiutato {charNameOne}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        
            + Mi chiedo se sono all'altezza di tutto questo.
                    -> glyph_modifier_variation_management(PG, waterC)->
                <i>All'altezza per {charNameOne}?#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                <i>All'altezza per {player_name}?
                <i>O all'altezza per soddisfare {mentorName}?
                <i>La serra è tiepida, la stazione attende, e le nubi dicono che {player_name} è dove deve essere.
                
            + Sono felice per lei, ma il mondo non deve farle così paura.
                    -> glyph_modifier_variation_management(PG, fireC)->
                <i>Non è il mondo a farle paura.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                <i>Il mondo gira e muta e muore e rinasce.
                <i>Sono le regole degli uomini a generare la paura.
                <i>Ma così come l'acqua cancella anche la pietra più dura, {player_name} e {charNameOne} possono piegare le regole più severe.
                <i>Con l'aiuto di altre gocce.
                
            + Non ho apprezzato la sua mancanza di senso logico.
                   -> glyph_modifier_variation_management(PG, airC)->
                <i>{charNameOne} possiede un forte senso logico.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                <i>Soltanto, è diverso da quello di {player_name}.
                <i>O di {mentorName}.
                <i>Il senso logico del falco lo spinge verso l'alto.
                <i>Quello della talpa verso il basso.
                <i>E {charNameOne} segue ora la sua nuova direzione.
                
            + Pensavo sarebbe stato più divertente.
                    -> glyph_modifier_variation_management(PG, earthC)->
                <i>Quando il leone salta su un altro leone, trova la rissa.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                <i>Ma quando un leoncino salta su un altro leoncino, trova ruzzoloni e corse.
                <i>Il gioco non è nell'azione, ma nell'attitudine.
                <i>Quale attitudine è radicata nelle azioni di {player_name}?
                <i>Dove {player_name} trova il suo giocare?
            
            + Spero che {charNameOne} sia capace di portare il suo cambiamento nel mondo.
                    -> glyph_modifier_variation_management(PG, aetherC)->
                <i>La luna distante sposta oceani.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                <i>Il vento invisibile sradica alberi.
                <i>{charNameOne} respira e il mondo ruota un po' più rapido.
                <i>E {player_name} decide di osservare le cose nell'interezza.
            -

        <i>L'acqua antica di {charNameOne} raccoglie tutti i sempre e i mai e ciò che non è stato.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        <i>E ci racconta che {mentorName} ha molto aiutato {player_name} in questo viaggio.
        <i>Anche noi vogliamo aiutare {player_name}, e per questo condividiamo una cosa.
        <i>{player_name} può seguire la voce di {mentorName} e scegliere di studiare la persona che ha davanti come un uomo studia la vita attraverso un libro.
        <i>Oppure {player_name} può decidere di essere sé {player_pronouns has him:stesso|{player_pronouns has her:stessa|stessə}}, anche se questo può creare attrito con l'altra persona.
        <i>E scoprire che c'è chi ha bisogno di venir contraddettə.
        <i>A volte l'attrito genera fastidio, o volte genera fuoco.
        <i>A volte brucia il vecchio, permettendo al nuovo di crescere.
        <i>Nessuna persona è uguale, nessuna persona vuole lo stesso trattamento.
        <i>Ma funghi solleticano e distraggono le nostre rinascenti radici.
        <i>Ringraziandoti ancora {player_name} per ora ci congediamo.
        <i>Senza mai davvero lasciarti.
        - 

        -> witch_closing_storylet ->
        -> main
    
    
    === witch_second_story_ended_check
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)

        <i>Un nuovo pezzo di noi ritrova spazio in questo mondo.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        <i>L'aria finalmente ci rinfresca.
        <i>E gli uccelli ci raccontano cose su {player_name}.
        <i>E su quello che ha fatto per {charNameTwo}.
        <i>E noi ci chiediamo: come sta {player_name} ora che {charNameTwo} è libero?
        
            + Mi chiedo chi sarei ora, con una famiglia diversa alle spalle.
                    -> glyph_modifier_variation_management(PG, waterC)->
                <i>La gemma sul ramo ignora il tronco, eppure cresce.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                <i>Il girino nuota, non importa la dimensione dello stagno.
                <i>{player_name} prova a riscrivere il passato.
                <i>La sua voce può forse cercare nuovi modi di guardarlo?
     
            + Secondo te serve uno scopo più grande per vivere davvero?
                    -> glyph_modifier_variation_management(PG, aetherC)->
                <i>La rondine crea un nido di paglia.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                <i>E quando l'inverno arriva il nido cade sul terreno.
                <i>I funghi lo trasformano in cibo per il terreno.
                <i>In primavera l'erba ricresce, il caldo la secca.
                <i>La rondine crea un nido di paglia.
                            
            + La rabbia è sottovalutata. Ha protetto questo bambino.
                    -> glyph_modifier_variation_management(PG, fireC)->
                <i>La lava scorre e brucia.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                <i>Col tempo rende il terreno fertile.
                <i>E dove prima cresceva solo erba, ora c'è un'intera foresta.
                
            + Avevo dimenticato quanto conforto possa dare il sapere.
                    -> glyph_modifier_variation_management(PG, airC)->
                <i>Il sapere è una luce.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                <i>Il sapere è un rifugio.
                <i>Una luce troppo forte confonde strada e burrone.
                <i>Un rifugio col tempo può diventare prigione.
         
            + Devo riprendere a giocare, a prendere le cose alla leggera.
                    -> glyph_modifier_variation_management(PG, earthC)->
                <i>Le radici ridono quando l'erba fa solletico.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                <i>Le foglie ridono quando il vento le sfiora.
                <i>{player_name} forse ride quando non è {player_pronouns has him:solo|{player_pronouns has her:sola|solə}}.
            -
        <i>Un'amica ci disse in tempi inquieti che per trovare il sentiero della magia occorre osservare con attenzione il bimbo che gioca.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        <i>{charNameTwo} ha portato in questi spazi sentieri inaspettati.
        <i>Così come l'acqua ci ha portato le lacrime di {mentorName}.
        <i>Questa storia per lei è stata faticosa.
        <i>Le sue radici sembrano solide, ma il tronco ondeggia a ogni accenno di burrasca.
        <i>Forse {player_name} può essere il suo sostegno.
        <i>O forse {player_name} può lasciarla cadere, e ricominciare.
        <i>Ora noi ci godiamo la brezza e il sole.
        <i>Ma più tardi tornaci a trovare.
        - 
        
        -> witch_closing_storylet ->
        -> main
        
    === witch_third_story_ended_check
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
        
        Domanda: chi mi ha insegnato a vedermi così? cosa me l'ha insegnato? In generale: da dove vengono le credenze su di sé, queste riscritture che dobbiamo poi andare a fare?

        + Scelta verde.
            -> glyph_modifier_variation_management(PG, waterC)->
            
        + SCelta rossa.
            -> glyph_modifier_variation_management(PG, fireC)->
            
        + Scelta blu.
            -> glyph_modifier_variation_management(PG, airC)->
     
        + Scelta gialla.
            -> glyph_modifier_variation_management(PG, earthC)->
 
        + Scelta viola.
            -> glyph_modifier_variation_management(PG, aetherC)->
        -        
        -> witch_closing_storylet ->
        -> main 
        
    === witch_fourth_story_ended_check
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
        
        Nonna molotov ci ha insegnate ora in modo evidente che il problema è sistemico. A cosa serve riscriversi, quando un problema è sistemico?

        + Scelta verde.
            -> glyph_modifier_variation_management(PG, waterC)->
            
        + SCelta rossa.
            -> glyph_modifier_variation_management(PG, fireC)->
            
        + Scelta blu.
            -> glyph_modifier_variation_management(PG, airC)->
     
        + Scelta gialla.
            -> glyph_modifier_variation_management(PG, earthC)->
 
        + Scelta viola.
            -> glyph_modifier_variation_management(PG, aetherC)->
        -        
        -> witch_closing_storylet ->
        -> main  
    
    === witch_fifth_story_ended_check
         ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)

        Personale e sociale non sono scollegati. E la rilettura di Mentore diventa la presenza di una doppia strada: prendersi cura di sé, cambiare il mondo.
        Con gli altri.
        Mentore stava di merda perché cercava di essere qualcosa che non era.
        Ma non perché fosse pazza, ma perché il nostro mondo ci dice: sii una sola cosa, o smetti di esistere.
        
        + Scelta verde.
            -> glyph_modifier_variation_management(PG, waterC)->
            
        + SCelta rossa.
            -> glyph_modifier_variation_management(PG, fireC)->
            
        + Scelta blu.
            -> glyph_modifier_variation_management(PG, airC)->
     
        + Scelta gialla.
            -> glyph_modifier_variation_management(PG, earthC)->
 
        + Scelta viola.
            -> glyph_modifier_variation_management(PG, aetherC)->
        -        
        -> witch_closing_storylet ->
        -> main 