//Variabili per mettere in pausa la conversazione
    VAR witchPauseTalking = 0
    VAR witchCharPauseDuration = 6
    
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
        
        <i>Le nostre radici ci connettono a nuove voci, nuove storie.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState #portrait: {witch_state()}
        <i><b>Ci.</b></i>
        <i>La cicatrice rimane, ma da essa esplode la vita.</i>
        <i>Torniamo a percepirci, questa è gioia.</i>
        <i>E {name} ci ha portato questa gioia.</i>
        <i>E {name}, cosa si domanda?</i>
        
            + [Posso sfiorarti?]
                ~ playerGreen ++
                <i>Sfioraci.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
                <i>{name} sente la voce del Canto delle Compagne.</i>
                <i>{name} realizza che è collegata a {charNameOne}.</i>
                <i>Che tutto riporta a pochi istanti fa, quando ha sfiorato il suo stesso viso, e ha portato un ricordo.</i>
                <i>E quel ricordo, {name}, è ora che ci stai sfiorando.</i>
                
            + [Esci dalla mia testa!]
                ~ playerRed ++
                <i>Non siamo nella testa di {name}.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
                <i>Non più di quanto {name} sia nella sua testa.</i>
                <i>Non meno di quanto {name} sia nella nostra.</i>
                <i>È come se {name} ci chiedesse di non essere.</i>
                <i>E questa è una cosa che non è e non sarà.</i>
                
            + [Le piante non dovrebbero parlare.]
                ~ playerBlue ++
                <i>Non siamo una pianta.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
                <i>Ma siamo una pianta.</i>
                <i>E non parliamo.</i>
                <i>Eppure accade.</i>
                <i>Ma anche ascoltiamo.</i>
                <i>Elaboriamo.</i>
                <i>Trasmettiamo.</i>
                <i>Assieme a te.</i>
                
            + [Ci piace la gioia!]
                ~ playerYellow ++
                <i>E a noi piace {name}.</i>
                <i>E tutte le emozioni che si spostano in questo terreno e nell'aria.</i>
                <i>E tutti i tempi che {name} vive, ha vissuto e vivrà.</i>
            
            + [La tua voce mi guida dal mio arrivo.]
                ~ playerPurple ++
                <i>E la tua guida noi, {name}.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
                <i>La separazione è una illusione.</i>
                <i>{name} è noi, noi siamo {charNameOne}.</i>
                <i>{charNameOne} è {charNameTwo} che è {charNameFive}.</i>
                <i>E {charNameFive} è {name}.</i>
            -
            
        <i>Noi sussurriamo nella tua testa, ma ascoltiamo anche.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
        <i>Noi puoi non chiamarci, ma sorriderci, e noi sorrideremo.</i>
        <i>Pensa alla luna, e saremo con te.</i>
        <i>Ecco, sì: oggi saremo la luna.</i>
        <i>E un sorriso.</i>
            - (nameWitch)
        <i>Queste radici cercano di imparare le voci del terreno.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
        <i>E il terreno ci racconta che {name} ha appena compiuto qualcosa di importante.</i>
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
            - came_from(->intro):<i>Che ha compiuto qualcosa per la prima volta.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
            
            - else: <i>Riaccogliamo con piacere {name}, per quanto non si sia mai davvero {pronouns has him:allontanato|{pronouns has her:allontanata|allontanatə}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}}.
        }
        
        <i>Osserviamo {name} e ci chiediamo cosa provi dopo aver aiutato {charNameOne}.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
        
            + [Mi chiedo se sono all'altezza di tutto questo.]
                    ~ playerGreen ++
                <i>All'altezza per {charNameOne}?</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
                <i>All'altezza per {name}?</i>
                <i>O all'altezza per soddisfare {charNameFive}?</i>
                <i>La serra è tiepida, la stazione attende, e le nubi dicono che {name} è dove deve essere.</i>
                
            + [Sono felice per lei, ma il mondo non dovrebbe fare così paura.]
                    ~ playerRed ++
                <i>Non è il mondo a fare paura.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
                <i>Il mondo gira e muta e muore e rinasce.</i>
                <i>Sono le regole degli uomini a generare la paura.</i>
                <i>Ma così come l'acqua cancella anche la pietra più dura, {name} e {charNameOne} possono piegare le regole più severe.</i>
                <i>Con l'aiuto di altre goccie.</i>
                
            + [Non ho apprezzato la sua mancanza di senso pratico.]
                    ~ playerBlue ++
                <i>{charNameOne} possiede un forte senso pratico.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
                <i>Soltanto, è diverso da quello di {name}.</i>
                <i>O di {charNameFive}.</i>
                <i>Il senso pratico del falco va verso l'alto.</i>
                <i>Quello della talpa verso il basso.</i>
                <i>E {charNameOne} segue ora la sua direzione.</i>
                
            + [Pensavo sarebbe stato più divertente.]
                    ~ playerYellow ++
                <i>Quando il leone salta su un altro leone, trova la rissa.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
                <i>Ma quando un leoncino salta su un altro leoncino, trova ruzzoloni e corse.</i>
                <i>Il gioco non è nell'azione, ma nell'attitudine.</i>
                <i>Quale attitudine è radicata nelle azioni di {name}?</i>
            
            + [Spero che {charNameOne} sia capace di portare il suo cambiamento nel mondo.]
                    ~ playerPurple ++
                <i>La luna distante sposta oceani.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
                <i>Il vento invisibile sradica alberi.</i>
                <i>{charNameOne} respira e il mondo ruota un po' più rapido.</i>
                <i>E {name} decide di osservare le cose nell'interezza.</i>
                    
            -
        <i>L'acqua nel terreno ci racconta che {charNameFive} ha molto aiutato {name} in questo viaggio.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
        <i>Anche noi vogliamo aiutare {name}, e per questo condividiamo una cosa.</i>
        <i>{name} può seguire la voce di {charNameFive} e scegliere di studiare la persona che ha davanti come un uomo studia la vita attraverso un libro.</i>
        <i>Oppure {name} può decidere di essere sé {pronouns has him:stesso|{pronouns has her:stessa|stessə}}, anche se questo può creare attrito con l'altra persona.</i>
        <i>E scoprire che c'è chi ha bisogno di venir contraddettə.</i>
        <i>A volte l'attrito genera fastidio, o volte genera fuoco.</i>
        <i>A volte brucia il vecchio, permettendo al nuovo di crescere.</i>
        <i>Nessuna persona è uguale, nessuna persona vuole lo stesso trattamento.</i>
        <i>Ma funghi solleticano e distraggono le nostre rinascenti radici.</i>
        <i>Ringraziandoti ancora {name} per ora ci congediamo.</i>
        <i>Ma anche dall'altra parte del mondo sai già che non saremo mai lontani.</i>
        
        @animation:RewriterBook

                -> main
    
    
    = second_story_ended_check
        ~ temp charNameOne = translator(firstCharacterState)
        ~ temp charNameTwo = translator(secondCharacterState)
        ~ temp charNameThree = translator(thirdCharacterState)
        ~ temp charNameFour = translator(fourthCharacterState)
        ~ temp charNameFive = translator(fifthCharacterState)
        
        {
            - came_from(->intro):<i>Che ha compiuto qualcosa per la prima volta.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
            
            - else: <i>Siamo così felici di riavere {name} qui con noi, per quanto non l'abbiamo mai {pronouns has him:lasciato solo|{pronouns has her:lasciata sola|lasciatə solə}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}}.
        }
        
        <i>Un nuovo pezzo di statua saggia il cielo.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
        <i>L'aria finalmente ci rinfresca.</i>
        <i>E gli uccelli ci raccontano cose su {name}.</i>
        <i>E su quello che ha fatto per {charNameTwo}.</i>
        <i>E noi ci chiediamo: come sta {name} ora che {charNameTwo} è libero?</i>
        
            + [Mi chiedo chi sarei ora, con una famiglia diversa alle spalle.]
                    ~ playerGreen ++
                <i>La gemma sul ramo ignora il tronco, eppure cresce.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
                <i>Il girino nuota, non importa la dimensione dello stagno.</i>
                <i>{name} prova a riscrivere il passato: non si ama per ciò che è in questo presente?</i>
     
            + [Secondo te serve uno scopo più grande per vivere davvero?]
                <i>La rondine crea un nido di paglia.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
                <i>E quando l'inverno arriva il nido cade sul terreno.</i>
                <i>Formiche e funghi lo trasformano in cibo.</i>
                <i>Arricchiscono il terreno.</i>
                <i>In primavera l'erba ricresce, col caldo si secca.</i>
                <i>E la rondine ha paglia a sufficienza per un nuovo nido.</i>
                    ~ playerPurple ++
                            
            + [Nonostante tutto, mi ha fatto rivalutare la forza della rabbia.]
                <i>La lava scorre e brucia.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
                <i>Ma col tempo rende il terreno fertile.</i>
                <i>E dove prima cresceva solo erba, ora c'è un'intera foresta.</i>
                    ~ playerRed ++
                
            + [Avevo dimenticato quanto conforto possa dare il sapere.]
                <i>Il sapere è una luce.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
                <i>Il sapere è un rifugio.</i>
                <i>Una luce troppo forte confonde strada e burrone.</i>
                <i>Un rifugio col tempo può diventare prigione.</i>
                    ~ playerBlue ++
         
            + [Dovrei reimparare a giocare, a prendere le cose alla leggera.]
                <i>Le radici ridono quando l'erba fa solletico.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
                <i>Le foglie ridono quando il vento le sfiora.</i>
                <i>{name} forse ride quando non è {pronouns has him:solo|{pronouns has her:sola|solə}}.</i>
                    ~ playerYellow ++
            -
        
        <i>L'acqua ci ha portato le lacrime di {charNameFive}.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
        <i>Questa storia per lei è stata faticosa.</i>
        <i>Le sue radici sembrano solide, ma il tronco ondeggia a ogni accenno di burrasca.</i>
        <i>Forse {name} può essere il suo sostegno.</i>
        <i>O forse {name} può lasciarla cadere, e ricominciare.</i>
        <i>Ora noi ci godiamo la brezza e il sole.</i>
        <i>Ma più tardi tornaci a trovare.</i>
        
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
        <i>{~Vecchie radici si ancorano nella memoria.|La corteccia tenace resiste alla dimenticanza.|Formiche inquiete cercano riparo nel vecchio legno.}</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
            -> main
    
    = two
    //Opinioni dopo la fine di una storia  
        <i>{~Gambe chiedono di percorrere nuove strade.|Nuovi piedi si riempiono di vecchie domande.|Porcellini di terra rotolano tra dita distese.}</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
            -> main

    = three
    //Opinioni dopo la fine di due storie 
        <i>{~L'aria saggia scalda il petto.|Un braccio steso in cerca di risposte.|Il tronco si torce inquieto.|L'erba si rinfresca ai piedi della nuova ombra.}</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
            -> main

    = four
    
    -> main
    
=== foundLibro
<i>C'è un libro ai piedi del tronco, e porta il tuo nome.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}

    ~ move_entity(RewriterBook, Forest)
    ~ move_entity(WitchRecap, BookPlace)
    ~ move_entity(miniBook, Bedroom)
    ~ somethingStrange ++
    -> main



=== final ===
    Hai donato la Selanìa, il gioco è finito.
    Compare lo sfondo stellato.
    ~ move_entity(vase, Bedroom)
-> main