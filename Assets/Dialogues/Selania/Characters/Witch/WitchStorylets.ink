
=== about_colors_choices
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)

    <i>Ciò che in te respira ricorda.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState #portrait: {witch_state()}
    <i>Ricorda che ogni dialogo è una strada.
    <i>Che ogni strada è una scelta.
    <i>E che ogni scelta importante apre cinque vie.
    <i>Un vicolo di curiosità e disubbidienza.
    <i>Un sentiero di azione e protesta.
    <i>Un cammino di analisi e comprensione.
    <i>Un viottolo di affetto e cura.
    <i>Una calle di saggezza e spiritualità.
    <i>Ogni scelta e ogni passo accumulano visioni del mondo.
        ~ move_entity(RulesRecap, BookPlace)
        @animation:RewriterBook
    <i>Raccontando la storia di chi cammina.
    - (bookUpdate)
    
->->


=== witch_intro
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
        
        ~ saturationVar ++
        
        <i>Le nostre radici ci connettono a nuove voci, nuove storie.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState #portrait: {witch_state()}
        <b>Ci.</b>
        <i>La cicatrice rimane, ma da essa esplode la vita.
        <i>Torniamo a percepire, e questa è gioia.
        <i>{player_name} ci ha portato questa gioia.
        <i>{player_name} cosa si domanda?
        
            + [Posso sfiorarti?]
                    -> color_variation_management(PG, waterC, varPGYes)->
                <i>{player_name} sente la voce del Canto delle Compagne.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                <i>{player_name} realizza che è {player_pronouns has him:collegato|{player_pronouns has her:collegata|collegatə}} a {charNameOne}.
               <i>A {charNameTwo}.
                <i>A {mentorName}.
                <i>E ogni collegamento riporta a pochi istanti fa, quando ha sfiorato il suo stesso viso.
                <i>Il contatto ha risvegliato un ricordo.
                <i>E quel ricordo, {player_name}, è il tuo sfiorarci.
                
            + [Ehi tu, esci dalla mia testa! Subito!]
                    -> color_variation_management(PG, fireC, varPGYes)->
                <i>Non siamo nella testa di {player_name}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                <i>Non più di quanto {player_name} sia nella sua stessa testa.
                <i>Non meno di quanto {player_name} sia nella nostra.
                <i>È come se {player_name} ci chiedesse di non essere.
                <i>E questa è una cosa che non è e non sarà.
                
            + [Le piante non possono parlare.]
                    -> color_variation_management(PG, airC, varPGYes)->
                <i>Le piante raccontano storie da notte a giorno. #speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                <i>E noi non siamo una pianta.
                <i>Ma siamo una pianta.
                <i>E non parliamo.
                <i>Eppure accade.
                <i>E ascoltiamo.
                <i>Elaboriamo.
                <i>Scopriamo.
                <i>In te.
                <i>Con te.
                <i>Per te.
                <i>Da te.
                
            + [Ci piace la gioia!]
                    -> color_variation_management(PG, earthC, varPGYes)->
                <i>E a noi piace {player_name}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                <i>E tutte le emozioni che genera con le sue azioni.
                <i>E tutti i tempi che {player_name} vive, ha vissuto e vivrà.
            
            + [La tua voce mi guida dal mio arrivo.]
                    -> color_variation_management(PG, aetherC, varPGYes)->
                <i>E la tua guida noi, {player_name}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                <i>La separazione è una illusione.
                <i>{player_name} è noi, noi siamo {charNameOne}.
                <i>{charNameOne} è {charNameTwo} che è {mentorName}.
                <i>E {mentorName} è {player_name}.
                <i>Che è noi.
            -
        <i>Noi siamo sussurro e siamo ascolto. #speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        <i>Un sorriso attento ai bisogni di {player_name}.
        <i>Se {player_name} osserva la luna, noi saremo con {player_pronouns has him:lui|{player_pronouns has her:lei|ləi}}.
        <i>Ecco, sì: oggi saremo la luna.
            - (nameWitch)
        <i>Queste radici cercano di imparare le voci del terreno.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        <i>E il terreno ci racconta che {player_name} ha appena compiuto qualcosa di importante.
        - (bookUpdate)
        
            ~ player_somethingStrange ++
                {
                    - not witch_feedback.first_story_ended_check && firstChar_storyStatus == story_storyEnded:
                        -> witch_feedback.first_story_ended_check

                    - not witch_feedback.second_story_ended_check && secondChar_storyStatus == story_storyEnded:
                        -> witch_feedback.second_story_ended_check

                    - not witch_feedback.third_story_ended_check && thirdChar_storyStatus == story_storyEnded:
                        -> witch_feedback.third_story_ended_check
                }
        

=== about_the_book
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(mentor_ActualName)

        
            {
                - first_character_recap.check && second_character_recap.check && greenhouse_recap.check:
                    <i>{player_name} cerca spesso risposte tra le pagine del libro.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                
                - else:
                    <i>{player_name} cerca di rado risposte tra le pagine del libro.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            }
        <i>Un libro è ricordo condiviso.
        <i>Una magia che pronuncia sé stessa.
        <i>Per questo le pagine si popolano man mano che {player_name} vive.
        <i>A volte il libro usa la nostra voce.
        <i>A volte ritrova altri nomi e parole.
        <i>In una canzone collettiva che guida {player_name} alla comprensione.
    @animation:RewriterBook
    - (bookUpdate)
    -> main



=== trully_about_nest
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(mentor_ActualName)
        Dove ci viene detto a cosa serve il nido in modo sereno.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        E ci spiega che la manipolazione è un intento, non qualcosa di inerente all'oggetto, o al nido.
        
        + [Scelta verde.]
            -> color_variation_management(PG, waterC, varPGYes)->
            
        + [Scelta rossa.]
            -> color_variation_management(PG, fireC, varPGYes)->
            
        + [Scelta blu.]
            -> color_variation_management(PG, airC, varPGYes)->
     
        + [Scelta gialla.]
            -> color_variation_management(PG, earthC, varPGYes)->
 
        + [Scelta viola.]
            -> color_variation_management(PG, aetherC, varPGYes)->
        - (bookUpdate)       
            -> main  




=== final ===
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(mentor_ActualName)
    Hai donato la Selanìa, il gioco è finito.
    Compare lo sfondo stellato.
    
        + [Scelta verde.]
            -> color_variation_management(PG, waterC, varPGYes)->
            
        + [SCelta rossa.]
            -> color_variation_management(PG, fireC, varPGYes)->
            
        + [Scelta blu.]
            -> color_variation_management(PG, airC, varPGYes)->
     
        + [Scelta gialla.]
            -> color_variation_management(PG, earthC, varPGYes)->
 
        + [Scelta viola.]
            -> color_variation_management(PG, aetherC, varPGYes)->
        -        
    Cose.
-> main



=== the_witch_and_the_frog

    <i>Le radici ci raccontano del tuo incontro con Franco.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState #portrait: {witch_state()}
    <i>E il nostro tronco porta il ricordo di Franco e di tutte le rane venute prima e dopo di lui.
    <i>Franco è un'anima semplice con un grande impegno.
    <i>Franco è come il vento che invisibile porta pollini e alleggerisce il volo delle rondini.
    <i>Come acqua leggera su un terreno asciutto.
    <i>Vede i bisogni che popolano questi spazi.
    <i>Le voci non ascoltate.
    <i>E fa in modo che tutte le mancanze vengano risanate.
    <i>Attento a chi ha troppo, attento a chi ha poco.
    <i>Un vecchio detto dice: "Quando la palude piange, la rana ascolta".
    <i>Franco sorride sempre, ma conosce il pianto di tutt3 noi.
    <i>Non ubbidisce ad alcuna autorità, ad alcuna legge, se non quella della cura delle altre persone.
    - (bookUpdate)
        @animation:RewriterBook
-> main



//Confessioni sulla sua storia

=== witch_first_confession
Primo pezzo storia strega


-> main

=== witch_second_confession
Secondo pezzo storia strega


-> main

=== witch_third_confession
Terzo pezzo storia strega


-> main

=== witch_fourth_confession
Quarto pezzo storia strega


-> main

=== witch_fifth_confession
Quinto pezzo storia strega


-> main