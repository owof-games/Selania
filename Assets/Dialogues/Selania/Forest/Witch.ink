//Variabili per mettere in pausa la conversazione
    VAR witchPauseTalking = 0
    VAR witchCharPauseDuration = 6

//Variabili per la gestione del ritratto
    LIST moonPhases = NewMoon, FirstQuarter, FullMoon, ThirdQuarter, RedMoon
    VAR moonState = NewMoon
    VAR moonTime = 0
    //l'idea è che ogni tre passaggi sia un giorno, e che cambi ogni sette giorni.
    VAR changeMoonFase = 21
    
=== the_witch
+ {are_two_entities_together(TheWitch, PG)} [TheWitch]
   ->talking_witch
    
    
=== talking_witch
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameThree = translator(thirdCharacterState)
    ~ temp charNameFour = translator(fourthCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    
    {
        //Check per intro
        - not intro && ((firstStory == StoryEnded) or (secondStory == StoryEnded) or (thirdStory == StoryEnded)):
            -> intro
        
        //Spiegazione del nido
        - intro && about_nest:
            -> trully_about_nest
    }
    
    {
        //Check post storie dopo l'intro
        - intro && firstStory == StoryEnded && not first_story_ended_check:
            -> first_story_ended_check
        - intro && secondStory == StoryEnded && not second_story_ended_check:
            -> second_story_ended_check
        - intro && thirdStory == StoryEnded && not third_story_ended_check:
            -> third_story_ended_check
        - intro && fourthStory == StoryEnded:
            -> fourth_story_ended_check
        - intro && fifthStory == StoryEnded:
            -> fifth_story_ended_check    
        
        
        //Altre storie
        - not foundLibro && not take_this_book:
            -> foundLibro
        
        - else:
            -> descriptions
    }

    = intro
        ~ temp charNameOne = translator(firstCharacterState)
        ~ temp charNameTwo = translator(secondCharacterState)
        ~ temp charNameThree = translator(thirdCharacterState)
        ~ temp charNameFour = translator(fourthCharacterState)
        ~ temp charNameFive = translator(fifthCharacterState)
        
        ~ saturationVar ++
        ~ move_entity(vase, Bedroom)
        
        Le nostre radici ci connettono a nuove voci, nuove storie.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState #portrait: {witch_state()}
        <b>Ci.</b>
        La cicatrice rimane, ma da essa esplode la vita.
        Torniamo a percepirci, questa è gioia.
        E {name} ci ha portato questa gioia.
        E {name}, cosa si domanda?
        
            + [Posso sfiorarti?]
                ~ playerGreen ++
                Sfioraci.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                {name} sente la voce del Canto delle Compagne.
                {name} realizza che è collegata a {charNameOne}.
                Che tutto riporta a pochi istanti fa, quando ha sfiorato il suo stesso viso, e ha portato un ricordo.
                E quel ricordo, {name}, è ora che ci stai sfiorando.
                
            + [Esci dalla mia testa!]
                ~ playerRed ++
                Non siamo nella testa di {name}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                Non più di quanto {name} sia nella sua testa.
                Non meno di quanto {name} sia nella nostra.
                È come se {name} ci chiedesse di non essere.
                E questa è una cosa che non è e non sarà.
                
            + [Le piante non dovrebbero parlare.]
                ~ playerBlue ++
                Non siamo una pianta.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                Ma siamo una pianta.
                E non parliamo.
                Eppure accade.
                Ma anche ascoltiamo.
                Elaboriamo.
                Trasmettiamo.
                Assieme a te.
                
            + [Ci piace la gioia!]
                ~ playerYellow ++
                E a noi piace {name}.
                E tutte le emozioni che si spostano in questo terreno e nell'aria.
                E tutti i tempi che {name} vive, ha vissuto e vivrà.
            
            + [La tua voce mi guida dal mio arrivo.]
                ~ playerPurple ++
                E la tua guida noi, {name}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                La separazione è una illusione.
                {name} è noi, noi siamo {charNameOne}.
                {charNameOne} è {charNameTwo} che è {charNameFive}.
                E {charNameFive} è {name}.
            -
            
        Noi sussurriamo nella tua testa, ma ascoltiamo anche.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        Noi puoi non chiamarci, ma sorriderci, e noi sorrideremo.
        Pensa alla luna, e saremo con te.
        Ecco, sì: oggi saremo la luna.
        E un sorriso.
            - (nameWitch)
        Queste radici cercano di imparare le voci del terreno.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        E il terreno ci racconta che {name} ha appena compiuto qualcosa di importante.
            ~ somethingStrange ++
                {
                    - not first_story_ended_check && firstStory == StoryEnded:
                        -> first_story_ended_check
                    - not second_story_ended_check && secondStory == StoryEnded:
                        -> second_story_ended_check
                    - not third_story_ended_check && thirdStory == StoryEnded:
                        -> third_story_ended_check
                }



    = first_story_ended_check
        ~ temp charNameOne = translator(firstCharacterState)
        ~ temp charNameTwo = translator(secondCharacterState)
        ~ temp charNameThree = translator(thirdCharacterState)
        ~ temp charNameFour = translator(fourthCharacterState)
        ~ temp charNameFive = translator(fifthCharacterState)
        
        {
            - came_from(->intro):Che ha compiuto qualcosa per la prima volta.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            
            - else: Riaccogliamo con piacere {name}, per quanto non si sia mai davvero {pronouns has him:allontanato|{pronouns has her:allontanata|allontanatə}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}}.
        }
        
        Osserviamo {name} e ci chiediamo cosa provi dopo aver aiutato {charNameOne}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        
            + [Mi chiedo se sono all'altezza di tutto questo.]
                    ~ playerGreen ++
                All'altezza per {charNameOne}?#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                All'altezza per {name}?
                O all'altezza per soddisfare {charNameFive}?
                La serra è tiepida, la stazione attende, e le nubi dicono che {name} è dove deve essere.
                
            + [Sono felice per lei, ma il mondo non dovrebbe fare così paura.]
                    ~ playerRed ++
                Non è il mondo a fare paura.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                Il mondo gira e muta e muore e rinasce.
                Sono le regole degli uomini a generare la paura.
                Ma così come l'acqua cancella anche la pietra più dura, {name} e {charNameOne} possono piegare le regole più severe.
                Con l'aiuto di altre goccie.
                
            + [Non ho apprezzato la sua mancanza di senso pratico.]
                    ~ playerBlue ++
                {charNameOne} possiede un forte senso pratico.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                Soltanto, è diverso da quello di {name}.
                O di {charNameFive}.
                Il senso pratico del falco va verso l'alto.
                Quello della talpa verso il basso.
                E {charNameOne} segue ora la sua direzione.
                
            + [Pensavo sarebbe stato più divertente.]
                    ~ playerYellow ++
                Quando il leone salta su un altro leone, trova la rissa.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                Ma quando un leoncino salta su un altro leoncino, trova ruzzoloni e corse.
                Il gioco non è nell'azione, ma nell'attitudine.
                Quale attitudine è radicata nelle azioni di {name}?
            
            + [Spero che {charNameOne} sia capace di portare il suo cambiamento nel mondo.]
                    ~ playerPurple ++
                La luna distante sposta oceani.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                Il vento invisibile sradica alberi.
                {charNameOne} respira e il mondo ruota un po' più rapido.
                E {name} decide di osservare le cose nell'interezza.
                    
            -
        L'acqua nel terreno ci racconta che {charNameFive} ha molto aiutato {name} in questo viaggio.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        Anche noi vogliamo aiutare {name}, e per questo condividiamo una cosa.
        {name} può seguire la voce di {charNameFive} e scegliere di studiare la persona che ha davanti come un uomo studia la vita attraverso un libro.
        Oppure {name} può decidere di essere sé {pronouns has him:stesso|{pronouns has her:stessa|stessə}}, anche se questo può creare attrito con l'altra persona.
        E scoprire che c'è chi ha bisogno di venir contraddettə.
        A volte l'attrito genera fastidio, o volte genera fuoco.
        A volte brucia il vecchio, permettendo al nuovo di crescere.
        Nessuna persona è uguale, nessuna persona vuole lo stesso trattamento.
        Ma funghi solleticano e distraggono le nostre rinascenti radici.
        Ringraziandoti ancora {name} per ora ci congediamo.
        Ma anche dall'altra parte del mondo sai già che non saremo mai lontani.
        
        @animation:RewriterBook

                -> main
    
    
    = second_story_ended_check
        ~ temp charNameOne = translator(firstCharacterState)
        ~ temp charNameTwo = translator(secondCharacterState)
        ~ temp charNameThree = translator(thirdCharacterState)
        ~ temp charNameFour = translator(fourthCharacterState)
        ~ temp charNameFive = translator(fifthCharacterState)
        
        {
            - came_from(->intro):Che ha compiuto qualcosa per la prima volta.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            
            - else: Siamo così felici di riavere {name} qui con noi, per quanto non l'abbiamo mai {pronouns has him:lasciato solo|{pronouns has her:lasciata sola|lasciatə solə}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}}.
        }
        
        Un nuovo pezzo di statua saggia il cielo.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        L'aria finalmente ci rinfresca.
        E gli uccelli ci raccontano cose su {name}.
        E su quello che ha fatto per {charNameTwo}.
        E noi ci chiediamo: come sta {name} ora che {charNameTwo} è libero?
        
            + [Mi chiedo chi sarei ora, con una famiglia diversa alle spalle.]
                    ~ playerGreen ++
                La gemma sul ramo ignora il tronco, eppure cresce.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                Il girino nuota, non importa la dimensione dello stagno.
                {name} prova a riscrivere il passato: non si ama per ciò che è in questo presente?
     
            + [Secondo te serve uno scopo più grande per vivere davvero?]
                La rondine crea un nido di paglia.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                E quando l'inverno arriva il nido cade sul terreno.
                Formiche e funghi lo trasformano in cibo.
                Arricchiscono il terreno.
                In primavera l'erba ricresce, col caldo si secca.
                E la rondine ha paglia a sufficienza per un nuovo nido.
                    ~ playerPurple ++
                            
            + [Nonostante tutto, mi ha fatto rivalutare la forza della rabbia.]
                La lava scorre e brucia.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                Ma col tempo rende il terreno fertile.
                E dove prima cresceva solo erba, ora c'è un'intera foresta.
                    ~ playerRed ++
                
            + [Avevo dimenticato quanto conforto possa dare il sapere.]
                Il sapere è una luce.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                Il sapere è un rifugio.
                Una luce troppo forte confonde strada e burrone.
                Un rifugio col tempo può diventare prigione.
                    ~ playerBlue ++
         
            + [Dovrei reimparare a giocare, a prendere le cose alla leggera.]
                Le radici ridono quando l'erba fa solletico.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                Le foglie ridono quando il vento le sfiora.
                {name} forse ride quando non è {pronouns has him:solo|{pronouns has her:sola|solə}}.
                    ~ playerYellow ++
            -
        
        L'acqua ci ha portato le lacrime di {charNameFive}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        Questa storia per lei è stata faticosa.
        Le sue radici sembrano solide, ma il tronco ondeggia a ogni accenno di burrasca.
        Forse {name} può essere il suo sostegno.
        O forse {name} può lasciarla cadere, e ricominciare.
        Ora noi ci godiamo la brezza e il sole.
        Ma più tardi tornaci a trovare.
        
        @animation:RewriterBook

                -> main
        
    = third_story_ended_check
        ~ temp charNameOne = translator(firstCharacterState)
        ~ temp charNameTwo = translator(secondCharacterState)
        ~ temp charNameThree = translator(thirdCharacterState)
        ~ temp charNameFour = translator(fourthCharacterState)
        ~ temp charNameFive = translator(fifthCharacterState)
        
        + [Mi chiedo se sono all'altezza di tutto questo.]
                ~ playerGreen ++
            
        + [Sono felice per lei, ma il mondo non dovrebbe fare così paura.]
                ~ playerRed ++
            
        + [Non ho apprezzato la sua mancanza di senso pratico.]
                ~ playerBlue ++
     
        + [Pensavo sarebbe stato più divertente.]
                ~ playerYellow ++
 
        + [Spero che {charNameOne} sia capace di portare il suo cambiamento nel mondo.]
                ~ playerPurple ++
        -        
            -> main  
        
    = fourth_story_ended_check
        ~ temp charNameOne = translator(firstCharacterState)
        ~ temp charNameTwo = translator(secondCharacterState)
        ~ temp charNameThree = translator(thirdCharacterState)
        ~ temp charNameFour = translator(fourthCharacterState)
        ~ temp charNameFive = translator(fifthCharacterState)
        
        + [Mi chiedo se sono all'altezza di tutto questo.]
                ~ playerGreen ++
            
        + [Sono felice per lei, ma il mondo non dovrebbe fare così paura.]
                ~ playerRed ++
            
        + [Non ho apprezzato la sua mancanza di senso pratico.]
                ~ playerBlue ++
     
        + [Pensavo sarebbe stato più divertente.]
                ~ playerYellow ++
 
        + [Spero che {charNameOne} sia capace di portare il suo cambiamento nel mondo.]
                ~ playerPurple ++
        -        
        
            -> main 
    
    = fifth_story_ended_check
        ~ temp charNameOne = translator(firstCharacterState)
        ~ temp charNameTwo = translator(secondCharacterState)
        ~ temp charNameThree = translator(thirdCharacterState)
        ~ temp charNameFour = translator(fourthCharacterState)
        ~ temp charNameFive = translator(fifthCharacterState)
        
        + [Mi chiedo se sono all'altezza di tutto questo.]
                ~ playerGreen ++
            
        + [Sono felice per lei, ma il mondo non dovrebbe fare così paura.]
                ~ playerRed ++
            
        + [Non ho apprezzato la sua mancanza di senso pratico.]
                ~ playerBlue ++
     
        + [Pensavo sarebbe stato più divertente.]
                ~ playerYellow ++
 
        + [Spero che {charNameOne} sia capace di portare il suo cambiamento nel mondo.]
                ~ playerPurple ++
        -        
            -> main


=== descriptions
    {   
        //Opinioni dopo la fine di due storie    
        - (firstStory == StoryEnded) && (secondStory == StoryEnded):
            -> three
        //Opinioni dopo la fine di una storia     
        - (firstStory == StoryEnded) or (secondStory == StoryEnded):
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
    
//Altri storylets
=== trully_about_nest
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameThree = translator(thirdCharacterState)
    ~ temp charNameFour = translator(fourthCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
        Dove ci viene detto a cosa serve il nido in modo sereno.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        E ci spiega che la manipolazione è un intento, non qualcosa di inerente all'oggetto, o al nido.
    -> main

=== foundLibro
C'è un libro ai piedi del tronco, e porta il tuo nome.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}

    ~ move_entity(RewriterBook, Forest)
    ~ move_entity(WitchRecap, BookPlace)
    ~ move_entity(miniBook, Bedroom)
    ~ move_entity(nightTable, Bedroom)
    ~ somethingStrange ++
    -> main



=== final ===
    Hai donato la Selanìa, il gioco è finito.
    Compare lo sfondo stellato.
    ~ move_entity(vase, Bedroom)
-> main