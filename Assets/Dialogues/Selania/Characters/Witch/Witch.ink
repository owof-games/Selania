
=== the_witch
+ {are_two_entities_together(TheWitch, PG)} [TheWitch]
   -> witch_storylets
    
    
=== witch_feedback
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
    {
        //Check per intro
        - not intro && ((firstChar_storyStatus == story_storyEnded) or (secondChar_storyStatus == story_storyEnded) or (thirdChar_storyStatus == story_storyEnded)):
            -> intro

    }
    
    {
        //Check post storie dopo l'intro
        - intro && firstChar_storyStatus == story_storyEnded && not first_story_ended_check:
            -> first_story_ended_check
        - intro && secondChar_storyStatus == story_storyEnded && not second_story_ended_check:
            -> second_story_ended_check
        - intro && thirdChar_storyStatus == story_storyEnded && not third_story_ended_check:
            -> third_story_ended_check
        - intro && fourthChar_storyStatus == story_storyEnded:
            -> fourth_story_ended_check
        - intro && fifthChar_storyStatus == story_storyEnded:
            -> fifth_story_ended_check    

        
        - else:
            -> descriptions
    }

    = intro
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
        
        ~ saturationVar ++
        ~ move_entity(vase, Bedroom)
        
        Le nostre radici ci connettono a nuove voci, nuove storie.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState #portrait: {witch_state()}
        <b>Ci.</b>
        La cicatrice rimane, ma da essa esplode la vita.
        Torniamo a percepirci, questa è gioia.
        E {player_name} ci ha portato questa gioia.
        E {player_name}, cosa si domanda?
        
            + [Posso sfiorarti?]
                -> color_variation_management(PG, greenC)->
                Sfioraci.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                {player_name} sente la voce del Canto delle Compagne.
                {player_name} realizza che è collegata a {charNameOne}.
                Che tutto riporta a pochi istanti fa, quando ha sfiorato il suo stesso viso, e ha portato un ricordo.
                E quel ricordo, {player_name}, è ora che ci stai sfiorando.
                
            + [Esci dalla mia testa!]
                -> color_variation_management(PG, redC)->
                Non siamo nella testa di {player_name}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                Non più di quanto {player_name} sia nella sua testa.
                Non meno di quanto {player_name} sia nella nostra.
                È come se {player_name} ci chiedesse di non essere.
                E questa è una cosa che non è e non sarà.
                
            + [Le piante non dovrebbero parlare.]
                ~ player_blue ++
                Non siamo una pianta.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                Ma siamo una pianta.
                E non parliamo.
                Eppure accade.
                Ma anche ascoltiamo.
                Elaboriamo.
                Trasmettiamo.
                Assieme a te.
                
            + [Ci piace la gioia!]
                -> color_variation_management(PG, yellowC)->
                E a noi piace {player_name}.
                E tutte le emozioni che si spostano in questo terreno e nell'aria.
                E tutti i tempi che {player_name} vive, ha vissuto e vivrà.
            
            + [La tua voce mi guida dal mio arrivo.]
                -> color_variation_management(PG, purpleC)->
                E la tua guida noi, {player_name}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                La separazione è una illusione.
                {player_name} è noi, noi siamo {charNameOne}.
                {charNameOne} è {charNameTwo} che è {mentorName}.
                E {mentorName} è {player_name}.
            -
            
        Noi sussurriamo nella tua testa, ma ascoltiamo anche.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        Noi puoi non chiamarci, ma sorriderci, e noi sorrideremo.
        Pensa alla luna, e saremo con te.
        Ecco, sì: oggi saremo la luna.
        E un sorriso.
            - (nameWitch)
        Queste radici cercano di imparare le voci del terreno.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        E il terreno ci racconta che {player_name} ha appena compiuto qualcosa di importante.
            ~ player_somethingStrange ++
                {
                    - not first_story_ended_check && firstChar_storyStatus == story_storyEnded:
                        -> first_story_ended_check
                    - not second_story_ended_check && secondChar_storyStatus == story_storyEnded:
                        -> second_story_ended_check
                    - not third_story_ended_check && thirdChar_storyStatus == story_storyEnded:
                        -> third_story_ended_check
                }



    = first_story_ended_check
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
        
        {
            - came_from(->intro):Che ha compiuto qualcosa per la prima volta.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            
            - else: Riaccogliamo con piacere {player_name}, per quanto non si sia mai davvero {player_pronouns has him:allontanato|{player_pronouns has her:allontanata|allontanatə}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}}.
        }
        
        Strega ci riprende il discorso dell'acqua antica di chitarra

        Osserviamo {player_name} e ci chiediamo cosa provi dopo aver aiutato {charNameOne}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        
            + [Mi chiedo se sono all'altezza di tutto questo.]
                    -> color_variation_management(PG, greenC)->
                All'altezza per {charNameOne}?#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                All'altezza per {player_name}?
                O all'altezza per soddisfare {mentorName}?
                La serra è tiepida, la stazione attende, e le nubi dicono che {player_name} è dove deve essere.
                
            + [Sono felice per lei, ma il mondo non dovrebbe fare così paura.]
                    -> color_variation_management(PG, redC)->
                Non è il mondo a fare paura.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                Il mondo gira e muta e muore e rinasce.
                Sono le regole degli uomini a generare la paura.
                Ma così come l'acqua cancella anche la pietra più dura, {player_name} e {charNameOne} possono piegare le regole più severe.
                Con l'aiuto di altre goccie.
                
            + [Non ho apprezzato la sua mancanza di senso pratico.]
                   -> color_variation_management(PG, blueC)->
                {charNameOne} possiede un forte senso pratico.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                Soltanto, è diverso da quello di {player_name}.
                O di {mentorName}.
                Il senso pratico del falco va verso l'alto.
                Quello della talpa verso il basso.
                E {charNameOne} segue ora la sua direzione.
                
            + [Pensavo sarebbe stato più divertente.]
                    -> color_variation_management(PG, yellowC)->
                Quando il leone salta su un altro leone, trova la rissa.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                Ma quando un leoncino salta su un altro leoncino, trova ruzzoloni e corse.
                Il gioco non è nell'azione, ma nell'attitudine.
                Quale attitudine è radicata nelle azioni di {player_name}?
            
            + [Spero che {charNameOne} sia capace di portare il suo cambiamento nel mondo.]
                    -> color_variation_management(PG, purpleC)->
                La luna distante sposta oceani.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                Il vento invisibile sradica alberi.
                {charNameOne} respira e il mondo ruota un po' più rapido.
                E {player_name} decide di osservare le cose nell'interezza.
                    
            -
        L'acqua nel terreno ci racconta che {mentorName} ha molto aiutato {player_name} in questo viaggio.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        Anche noi vogliamo aiutare {player_name}, e per questo condividiamo una cosa.
        {player_name} può seguire la voce di {mentorName} e scegliere di studiare la persona che ha davanti come un uomo studia la vita attraverso un libro.
        Oppure {player_name} può decidere di essere sé {player_pronouns has him:stesso|{player_pronouns has her:stessa|stessə}}, anche se questo può creare attrito con l'altra persona.
        E scoprire che c'è chi ha bisogno di venir contraddettə.
        A volte l'attrito genera fastidio, o volte genera fuoco.
        A volte brucia il vecchio, permettendo al nuovo di crescere.
        Nessuna persona è uguale, nessuna persona vuole lo stesso trattamento.
        Ma funghi solleticano e distraggono le nostre rinascenti radici.
        Ringraziandoti ancora {player_name} per ora ci congediamo.
        Ma anche dall'altra parte del mondo sai già che non saremo mai lontani.
        
        @animation:RewriterBook

                -> main
    
    
    = second_story_ended_check
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
        
        {
            - came_from(->intro):Che ha compiuto qualcosa per la prima volta.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            
            - else: Siamo così felici di riavere {player_name} qui con noi, per quanto non l'abbiamo mai {player_pronouns has him:lasciato solo|{player_pronouns has her:lasciata sola|lasciatə solə}}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        }
        
        Un nuovo pezzo di statua saggia il cielo.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        L'aria finalmente ci rinfresca.
        E gli uccelli ci raccontano cose su {player_name}.
        E su quello che ha fatto per {charNameTwo}.
        E noi ci chiediamo: come sta {player_name} ora che {charNameTwo} è libero?
        
            + [Mi chiedo chi sarei ora, con una famiglia diversa alle spalle.]
                    -> color_variation_management(PG, greenC)->
                La gemma sul ramo ignora il tronco, eppure cresce.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                Il girino nuota, non importa la dimensione dello stagno.
                {player_name} prova a riscrivere il passato: non si ama per ciò che è in questo presente?
     
            + [Secondo te serve uno scopo più grande per vivere davvero?]
                -> color_variation_management(PG, purpleC)->
                La rondine crea un nido di paglia.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                E quando l'inverno arriva il nido cade sul terreno.
                Formiche e funghi lo trasformano in cibo.
                Arricchiscono il terreno.
                In primavera l'erba ricresce, col caldo si secca.
                E la rondine ha paglia a sufficienza per un nuovo nido.
                    
                            
            + [Nonostante tutto, mi ha fatto rivalutare la forza della rabbia.]
                -> color_variation_management(PG, redC)->
                La lava scorre e brucia.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                Ma col tempo rende il terreno fertile.
                E dove prima cresceva solo erba, ora c'è un'intera foresta.
                
            + [Avevo dimenticato quanto conforto possa dare il sapere.]
                -> color_variation_management(PG, blueC)->
                Il sapere è una luce.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                Il sapere è un rifugio.
                Una luce troppo forte confonde strada e burrone.
                Un rifugio col tempo può diventare prigione.
         
            + [Dovrei reimparare a giocare, a prendere le cose alla leggera.]
                -> color_variation_management(PG, yellowC)->
                Le radici ridono quando l'erba fa solletico.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                Le foglie ridono quando il vento le sfiora.
                {player_name} forse ride quando non è {player_pronouns has him:solo|{player_pronouns has her:sola|solə}}.
            -
        
        L'acqua ci ha portato le lacrime di {mentorName}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        Questa storia per lei è stata faticosa.
        Le sue radici sembrano solide, ma il tronco ondeggia a ogni accenno di burrasca.
        Forse {player_name} può essere il suo sostegno.
        O forse {player_name} può lasciarla cadere, e ricominciare.
        Ora noi ci godiamo la brezza e il sole.
        Ma più tardi tornaci a trovare.
        
        @animation:RewriterBook

                -> main
        
    = third_story_ended_check
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
        
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
        
    = fourth_story_ended_check
         ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
        
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
    
    = fifth_story_ended_check
         ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
        
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

=== descriptions
    {   
        //Opinioni dopo la fine di due storie    
        - (firstChar_storyStatus == story_storyEnded) && (secondChar_storyStatus == story_storyEnded):
            -> three
        //Opinioni dopo la fine di una storia     
        - (firstChar_storyStatus == story_storyEnded) or (secondChar_storyStatus == story_storyEnded):
            -> two
        //Opinioni presenti da inizio gioco    
        - else:
            -> one
    }
    
    = one
    //Contenuti iniziali
        {~Vecchie radici si ancorano nella memoria.|La corteccia tenace resiste alla dimenticanza.|Formiche inquiete cercano riparo nel vecchio legno.}#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            -> main
    
    = two
    //Opinioni dopo la fine di una storia  
        {~Gambe chiedono di percorrere nuove strade.|Nuovi piedi si riempiono di vecchie domande.|Porcellini di terra rotolano tra dita distese.}#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            -> main

    = three
    //Opinioni dopo la fine di due storie 
        {~L'aria saggia scalda il petto.|Un braccio steso in cerca di risposte.|Il tronco si torce inquieto.|L'erba si rinfresca ai piedi della nuova ombra.}#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            -> main

    = four
    
    -> main
    
