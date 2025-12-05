=== witch_storylets
    {    
    
        //Dono del libro
        - not foundLibro && not take_this_book:
            -> foundLibro
        
        //Commento sul libro
        - witch_intro && not about_the_book:
            -> about_the_book
            
        //Spiegazione del nido
        - witch_intro&& about_nest && not trully_about_nest:
            -> trully_about_nest
        
        //Dialogo su Franco
        - closed_mission_verify && not the_witch_and_the_frog:
            -> the_witch_and_the_frog
        
        - else:
            -> witch_feedback

    }


=== about_colors_choices
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)

    Ciò che in te respira ricorda.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState #portrait: {witch_state()}
    Ricorda che ogni dialogo è una strada.
    Che ogni strada è una scelta.
    E che ogni scelta importante apre cinque strade.
    Un vicolo di curiosità e disubbidienza.
    Un sentiero di azione e protesta.
    Un cammino di analisi e comprensione.
    Un viottolo di affetto e cura.
    Una calle di saggezza e spiritualità.
    Ogni scelta e ogni passo accumulano visioni del mondo.
    Raccontando la storia di chi cammina.

->->


=== witch_intro
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
        
        ~ saturationVar ++
        //~ move_entity(vase, Bedroom)
        
        Le nostre radici ci connettono a nuove voci, nuove storie.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState #portrait: {witch_state()}
        <b>Ci.</b>
        La cicatrice rimane, ma da essa esplode la vita.
        Torniamo a percepire, e questa è gioia.
        {player_name} ci ha portato questa gioia.
        {player_name} cosa si domanda?
        
            + [Posso sfiorarti?]
                    -> color_variation_management(PG, greenC)->
                {player_name} sente la voce del Canto delle Compagne.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                {player_name} realizza che è {player_pronouns has him:collegato|{player_pronouns has her:collegata|collegatə}} a {charNameOne}.
                A {charNameTwo}.
                A {mentorName}.
                E ogni collegamento riporta a pochi istanti fa, quando ha sfiorato il suo stesso viso.
                Il contatto ha risvegliato un ricordo.
                E quel ricordo, {player_name}, è il tuo sfiorarci.
                
            + [Esci dalla mia testa!]
                    -> color_variation_management(PG, redC)->
                Non siamo nella testa di {player_name}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                Non più di quanto {player_name} sia nella sua stessa testa.
                Non meno di quanto {player_name} sia nella nostra.
                È come se {player_name} ci chiedesse di non essere.
                E questa è una cosa che non è e non sarà.
                
            + [Le piante non possono parlare.]
                    -> color_variation_management(PG, blueC)->
                Le piante raccontano storie da notte a giorno. #speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                E noi non siamo una pianta.
                Ma siamo una pianta.
                E non parliamo.
                Eppure accade.
                E ascoltiamo.
                Elaboriamo.
                Scopriamo.
                In te.
                Con te.
                Per te.
                Da te.
                
            + [Ci piace la gioia!]
                    -> color_variation_management(PG, yellowC)->
                E a noi piace {player_name}.
                E tutte le emozioni che genera con le sue azioni.
                E tutti i tempi che {player_name} vive, ha vissuto e vivrà.
            
            + [La tua voce mi guida dal mio arrivo.]
                    -> color_variation_management(PG, purpleC)->
                E la tua guida noi, {player_name}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                La separazione è una illusione.
                {player_name} è noi, noi siamo {charNameOne}.
                {charNameOne} è {charNameTwo} che è {mentorName}.
                E {mentorName} è {player_name}.
                Che è noi.
            -
        Noi siamo sussurro e siamo ascolto. #speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        Un sorriso attento ai bisogni di {player_name}.
        Se {player_name} osserva la luna, noi saremo con {player_pronouns has him:lui|{player_pronouns has her:lei|ləi}}.
        Ecco, sì: oggi saremo la luna.
        E un sorriso.
            - (nameWitch)
        Queste radici cercano di imparare le voci del terreno.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        E il terreno ci racconta che {player_name} ha appena compiuto qualcosa di importante.
        
            ~ player_somethingStrange ++
                {
                    - not witch_feedback.first_story_ended_check && firstChar_storyStatus == story_storyEnded:
                        -> witch_feedback.first_story_ended_check

                    - not witch_feedback.second_story_ended_check && secondChar_storyStatus == story_storyEnded:
                        -> witch_feedback.second_story_ended_check

                    - not witch_feedback.third_story_ended_check && thirdChar_storyStatus == story_storyEnded:
                        -> witch_feedback.third_story_ended_check
                }


=== foundLibro
    Un libro.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    Carta sgualcita e pagine mancanti.
    E un nome che è il nome di chi legge queste parole.

        ~ move_entity(RewriterBook, Forest)
        ~ move_entity(WitchRecap, BookPlace)
        ~ move_entity(miniBook, Bedroom)
        ~ move_entity(nightTable, Bedroom)
        ~ player_somethingStrange ++
        -> main


=== about_the_book
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(mentor_ActualName)

        {player_name} <> #speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            {
                - first_character_recap.check && second_character_recap.check && greenhouse_recap.check:
                    cerca spesso risposte tra le pagine del libro.
                
                - else:
                    cerca di rado risposte tra le pagine del libro.
            }
        Un libro è ricordo condiviso.
        Una magia che pronuncia sé stessa.
        Per questo le pagine si popolano man mano che {player_name} vive.
        A volte il libro usa la nostra voce.
        A volte ritrova altri nomi e parole.
        In una canzone collettiva che guida {player_name} alla comprensione.

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
            -> color_variation_management(PG, greenC)->
            
        + [SCelta rossa.]
            -> color_variation_management(PG, redC)->
            
        + [Scelta blu.]
            -> color_variation_management(PG, blueC)->
     
        + [Scelta gialla.]
            -> color_variation_management(PG, yellowC)->
 
        + [Scelta viola.]
            -> color_variation_management(PG, purpleC)->
        -        
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
            -> color_variation_management(PG, greenC)->
            
        + [SCelta rossa.]
            -> color_variation_management(PG, redC)->
            
        + [Scelta blu.]
            -> color_variation_management(PG, blueC)->
     
        + [Scelta gialla.]
            -> color_variation_management(PG, yellowC)->
 
        + [Scelta viola.]
            -> color_variation_management(PG, purpleC)->
        -        
    Cose.
    ~ move_entity(vase, Bedroom)
-> main