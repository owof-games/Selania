

=== rewriting_proposal_third_character
~ temp charNameTwo = translator(thirdChar_ActualName)
//Così se decido di uscire dalla conversazione, posso riprendere da dove eravamo rimaste.
    {
        - not confession:
            -> confession
            
        - else:
            -> rewriting

    }
    
    = confession
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

        Da quando nonna è nella casa dei vecchi fa tutto schifo.
        @animation:RewriterBook
        Io voglio solo fare il bambino.

            + Ti ho ascoltato, {charNameThree}, e posso aiutarti a riscrivere la tua storia.
                -> rewriting
            
            + Capisco il tuo dolore, ma ho bisogno di riflettere un attimo.
                -> main


    = rewriting
    ~ temp charNameTwo = translator(secondChar_ActualName)

            Va bene.

            //Avvio aggiornamento relazione + commento PNG + commento strega
                -> thirdAffinityCalc ->
                
            //Vado a svuotare i contatori di colore, così son tranquilla.
                -> storage_glyphs(ThirdCharacter) ->
            
            //E poi a thirda dello stato di inchiostro, mi sposto sulla domanda prevista      
                {
                    - thirdChar_InkLevel == ink_empty:
                        -> ending
                    - else: 
                        -> one
                } 


    = one
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)


        Comunque possiamo cominciare quando vuoi.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        
        //Affrontiamo gli adulti in generale
            Hai detto che da quando nonna è nella casa dei vecchi fa tutto schifo.#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral

            + Tua nonna ti ha insegnato a lottare: lotta anche tu!
                -> glyph_modifier_variation_management(ThirdCharacter, fireC)->
                E ti ha insegnato a barare!
                E a sputare nel caffè di chi ti fa male.
                {
                    - about_violence_and_peace:
                        Pensa a prima, a quando hai convinto {mentorName} a chiederti scusa.
                        Sapevi di avere ragione, e per questo hai ottenuto quello di cui avevi bisogno.
                }
                    
            
            + I tuoi genitori sono infelici, {charNameTwo}, prova a comprenderli.
                -> glyph_modifier_variation_management(ThirdCharacter, waterC)->
                Tutti i litigi, la fuga di tuo padre.
                Il modo in cui si arrabbia per tutto.
                Le paure di tua mamma.
                Sono cose che puoi capire, che vivi anche tu.
                    
                    
            + Tuo fratello però ha trovato la gioia anche in questo casino.
                -> glyph_modifier_variation_management(ThirdCharacter, earthC)->
                Ci sono le sue statue, c'è il suo amico.
                {
                    -third_char_main_storylets.eleven:
                        E quando sei a casa sua, ti lascia sperimentare con le cose di casa.
                }

                                
            + E la casa dei vecchi è un posto attrezzato, organizzato.
                    -> glyph_modifier_variation_management(ThirdCharacter, airC)->
                Una persona anziana ha bisogno di cure, {charNameTwo}.
                Di persone che le diano quello di cui ha bisogno.
                È giusto che tu senta la sua mancanza.
                Ma sarebbe la cosa giusta per lei, riportarla a casa?
                    
    
            + Ma è grazie al pianto che puoi essere diverso da loro.
                -> glyph_modifier_variation_management(ThirdCharacter, aetherC)->
                Tu tieni agli animali.
                A tuo fratello.
                Alla nonna.
                E anche a loro.
                Puoi imparare a fidarti.
                    
            
        -
            ~ numberQuestion ++  
        Sì no boh.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #portrait:riccio_neutral
        Continua.
        
            {
                - story_endedStories == ():
                    {charTag(TheWitch, witch_state())}:   <i>{player_name} ha utilizzato la sua prima goccia di inchiostro per compiere una riscrittura.
            }        

            {
            - thirdChar_InkLevel == ink_low:
                -> ending
            - else: 
                -> two
            }        
        
    
    = two
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)

        A scuola le maestre dicono che sei cattivo, bugiardo, violento, e finisci sempre in punizione.#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral

        + Le bugie alla fine sono solo storie. Usale per divertirti.
                -> glyph_modifier_variation_management(ThirdCharacter, earthC)->
            {
                - cooking_with_third_char.third_theme:
                    L'hai detto anche mentre cucinavamo: non tutte le bugie sono uguali.
                    E che sei felice di inventare storie con tuo fratello.
            }    
            Ti piace immaginare giornate diverse: prova a condividere questa cosa con i tuoi amici.
            La tua testa è un bellissimo parco giochi: perché non condividerla con gli altri?
            {
                - open_the_library:
                    Come i racconti che hai trovato in biblioteca!
            }
                   
        + Tutto a questo mondo cambia. Anche un bambino cocciuto e bugiardo.
                -> glyph_modifier_variation_management(ThirdCharacter, airC)->
            Quando sei arrivato qui hai litigato con {mentorName}.
            E mi hai detto molte bugie.
            Ma hai anche chiesto scusa.
            Puoi partire da questo per cambiare.
                   
        + La rabbia è parte della tua vita, della tua famiglia: trasformala.
                -> glyph_modifier_variation_management(ThirdCharacter, fireC)->
            Come quando ti arrabbi perché gli animali stanno scomparendo.
            O perché papà tratta male nonna.
            Puoi prendere quello che senti a farci qualcosa di buono per te e le persone che ami.
            {
                - a_story_of_rebellion:
                    L'hai detto anche quando hai letto il racconto del sassolino: i grandi non sempre vedono l'aragosta.
                    Ma tu sì, e puoi cambiare tante cose.
            }
                    
        + Ma non sei solo questo: sei gentile, sei curioso, sei divertente.
                -> glyph_modifier_variation_management(ThirdCharacter, waterC)->
            Hai sviluppato un bel rapporto con {charNameOne}.
            Mi hai raccontato tante cose interessanti sugli animali.
            Hai fatto amicizia con la rana.
            Ti sei preso le tue responsabilità.
            Forse a volte sei violento.
            E menti.
            Ma sei anche tante altre cose, {charNameTwo}.
                   
        + Eppure hai trovato il modo di fare pace con {mentorName}.
                -> glyph_modifier_variation_management(ThirdCharacter, aetherC)->
            Hai fatto lo sforzo di capirla.
            E mi hai chiesto scusa più volte per le tue bugie.
            Stai già cambiando, {charNameTwo}!
                   

        -
        ~ numberQuestion ++  
        Non ci avevo pensato, pensato davvero.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #portrait:riccio_neutral
        Che posso fare qualcosa per gli animali.
        
            {
                - story_endedStories == ():
                    {charTag(TheWitch, witch_state())}:   <i>{player_name} ha utilizzato la sua thirda goccia di inchiostro per procedere con la riscrittura.
            }         
        
            {
            - thirdChar_InkLevel == ink_normal:
                -> ending
            - else: 
                -> three
            }
        
    = three
    ~ temp charNameTwo = translator(secondChar_ActualName)
    //Affrontiamo il mondo. Rabbia, bugie, fantasia, violenza etc.
            Tuo fratello dice che il mondo è orribile e che non si può più aggiustare.#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral
            E hai paura che gli animali possano sparire.
            Così è logico vedere il futuro come un posto spaventoso.
    
        + Eppure ci sono le associazioni che proteggono gli animali.
            -> glyph_modifier_variation_management(ThirdCharacter, aetherC)->
            Come quelle di cui ti ha parlato la tua maestra.
            E la sua amica del canile.
            {
                - third_char_main_storylets.twelve:
                    E magari da grande studierai davvero come si curano i pesci.
            }

        + Eppure tuo fratello ama il suo ragazzo.
            -> glyph_modifier_variation_management(ThirdCharacter, waterC)->
            E ama te.
            E fa in modo che possiate passare tanto tempo assieme.
            Che tu possa avere uno spazio felice.
            E così rende il mondo un po' meno orribile.
                   
        + Eppure tuo fratello lotta contro tuo padre perché tu stia meglio.
            -> glyph_modifier_variation_management(ThirdCharacter, fireC)->
            {
                - third_char_main_storylets.eleven:
                    E quando sei a casa sua ti fa fare un sacco di esperimenti.
            }
            Si è creato una nuova casa.
            Non si è fatto mettere i piedi in testa da nessuno.
            E questo lo fai se pensi ci sia un futuro dove andare.
                    
        + Ma sai anche trovare la fantasia e la giocosità nel mondo.
            -> glyph_modifier_variation_management(ThirdCharacter, earthC)->
            Sei arrivato in questo posto sconosciuto e invece di avere paura, ti sei messo a curiosare.
            Ti sei fatto amico una rana parlante.
                {
                    - dog_third_char:
                        E ti sei esaltato quando hai incontrato il cane.
                }
                {
                    - cooking_with_third_char.third_theme:
                        E un giorno avrai uno struzzo!
                }    
            Quando tu giochi non hai paura di nulla.

        + Eppure sistematicamente tuo fratello per lavoro aggiusta le cose.
            -> glyph_modifier_variation_management(ThirdCharacter, airC)->
            Vede le cose rotte e le ripara.
            Quindi ci sono cose che si possono aggiustare.
            Serve solo un meccanico per le cose che lo spaventano.
                   
        -

        ~ numberQuestion ++ 
        Si no boh.
        Magari hai ragione.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #portrait:riccio_neutral
        
            {
                - story_endedStories == ():
                    {charTag(TheWitch, witch_state())}:   <i>{player_name} ha utilizzato la terza goccia di inchiostro, proponendo una riscrittura.
            }         
        
            {
            - thirdChar_InkLevel == ink_medium:
                -> ending
            - else: 
                -> four
            }
    
    = four
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)

        Hai detto che i grandi fanno schifo, e che non vuoi diventare grande.#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral
        
            + Ma puoi essere un adulto combattente, come tua nonna.
                -> glyph_modifier_variation_management(ThirdCharacter, fireC)->
                {
                    - cooking_with_third_char.first_theme:
                        Un adulto che dice le cose come sono, come mi raccontavi cucinando.
                }
                {
                    - cooking_with_third_char.third_theme:
                        Essere furbo, come ti ha detto lei.
                }
                E non farti mettere i piedi in testa da nessuna persona!
                        
        
            + Ma puoi essere un adulto curioso e studioso, come un po' già sei.
                -> glyph_modifier_variation_management(ThirdCharacter, airC)->

                E tutto quello che ora sai degli animali diventerà mille volte ancora di più.

            
            + Ma puoi essere un adulto in cerca di uno scopo più grande, come {charNameOne}.
                -> glyph_modifier_variation_management(ThirdCharacter, aetherC)->
                {
                    - cooking_with_third_char.first_theme:
                        Non uno di quegli adulti che fanno le cose perché devono, come raccontavi in cucina.
                }
                E trovare modi inaspettati di aiutare le altre persone, gli animali, il mondo.
                    
            + Ma puoi essere un adulto che si prende cura delle persone, come {mentorName}.
                -> glyph_modifier_variation_management(ThirdCharacter, waterC)->
                E rendere più facile la vita all3 altr3.
                {
                    - cooking_with_third_char.third_theme:
                        Una brava persona, come ti ha detto tuo fratello.
                }
                {
                    - about_violence_and_peace:
                        Non uno di quei grandi che chiedono sempre scusa per tutte le cose ma poi le rifanno, come hai detto a {mentorName}.
                        Ma un adulto responsabile, come tuo fratello.
                }

            + Ma puoi essere un adulto creativo, come tuo fratello.
                -> glyph_modifier_variation_management(ThirdCharacter, earthC)->
                E condividere le tue storie e i tuoi esperimenti.
                Essere felice nel farli.
                        

        -
        ~ numberQuestion ++  
        Posso essere un adulto buono.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #portrait:riccio_neutral
        Woah.
        
            {
                - story_endedStories == ():
                    {charTag(TheWitch, witch_state())}:   <i>{player_name} ha utilizzato la quarta e ultima unità di inchiostro, compiendo il massimo di riscritture possibili.
            }  
            
            -> ending

    
    = ending
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)

        Cfireo di aver compreso quale sia il tuo blocco, perché sei qui.#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral
        E riguarda gli adulti.
        Perché se chi dovrebbe proteggerti ti ha ferito, come fai a fidarti delle persone?
        E per questo ti dico {charNameTwo}:
            
            {
                - story_endedStories == ():
                    {charTag(TheWitch, witch_state())}:   <i>{player_name} sta per utilizzare il potere dell'<b><i>epilogo</b></i>.
                
                - else:
                    {charTag(TheWitch, witch_state())}:   <i>Quale <b><i>epilogo</b></i> proporrà {player_name}?   
            }     
     
        + (fire)Diventa il più forte, il più coraggioso.
            -> glyph_modifier_variation_management(ThirdCharacter, fireC)->
            Sei un testardo, bugiardo, dispettoso.
            Queste cose unite possono renderti indistruttibile.
            E di cosa avrà mai paura un ragazzo indistruttibile?
                    
    
        + (aether)Tutti abbiamo paura. Condividi questa paura con le altre persone.
            -> glyph_modifier_variation_management(ThirdCharacter, aetherC)->
            Falle sentire meno sole.
            Meno sbagliate.
            A quel punto saranno pronte a fare il passo.
            A cambiare le cose a loro volta.
            Assieme.
                   

        + (earth)L'opposto della paura è la curiosità.
            -> glyph_modifier_variation_management(ThirdCharacter, earthC)->
            E tu sei il ritratto della curiosità.
            Guarda le cose che arriveranno chiedendoti "Chissà se..." o "E se invece..." o "Perché accade questo?".
            E a quel punto ogni paura diventerà solo un problema da risolvere.
                   
                
        + (water)I tuoi genitori sono spaventati, aiutatevi a vicenda.
            -> glyph_modifier_variation_management(ThirdCharacter, waterC)->
            Nessuna persona può cambiare il mondo da sola.
            Ma possiamo partire dal cambiare le cose che ci circondano, un pezzo alla volta.
                   
      
        + (air)Con la tua intelligenza puoi rendere il mondo migliore.
            -> glyph_modifier_variation_management(ThirdCharacter, airC)->
            Puoi aiutare gli adulti a essere meno tristi.
            E gli animali a non morire.
            E tua nonna a uscire dalla casa dei vecchi.
                   
    
        -
    //Nota: la parte di accettazione del nome è prima dell'aggiornamento, così il nome nuovo compare solo quando viene dichiarato.
    Sì. #speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #portrait:riccio_neutral
    No.
    Boh.

            {
                - ending.fire:
                    Non ci avevo mai pensato, che il fatto che sono bugiardo e dispettoso può rendermi indistruttibile. #speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                
                - ending.aether:
                    Non è che vedo sempre che anche le altre persone hanno paura.
                    Questa cosa mi ha fatto sentire meno stupido.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic

                - ending.earth:
                    Mi piace quella cosa che hai detto sulla curiosità perché è vera.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                    Curioso sempre, curioso forte!

                - ending.water:
                    Io non ci avevo mica pensato che anche i miei genitori hanno paura.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic

                - ending.air:
                    Hai detto che la mia intelligenza può fare felici le altre persone.
                    È una cosa bella, {player_name}.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
                    
            }
    Cavoli, quante parole che ho in testa!#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #portrait:riccio_neutral        

            //Prima chiamo il moltiplicatore di colori, così che comunque le scelte fatte qui abbiano un impatto maggiore.
                -> glyph_modifier(ThirdCharacter, thirdChar_glyphVariation) ->
            
            //Poi aggiorniamo i colori, così il valore complessivo conta per la scelta del nome
                -> update_glyphs(ThirdCharacter) ->     
     
            //E infine genero il nome
                -> thirdNaming ->naming
                
    
    
    = naming
    ~ temp charNameTwo = translator(secondChar_ActualName)
    
        {

            - thirdChar_ActualName has Grizzly:
                    {
                        - ending.fire:
                            E se penso a tutte le cose che abbiamo detto, c'è questo animale che è un po' me e che mi piace.
                        - else:
                            Ma se penso a tutte le cose che abbiamo detto c'è un animale che mi piace e che so che è il nome che mi serve.
                    }
                Il mio vero nome è <b><i>{charNameTwo}</b></i>.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                Combatterò la mia paura e diventerò il più forte di tutti, imbattibile!
            
            - thirdChar_ActualName has Lupo:
                    {
                        - ending.water:
                            E se penso a tutte le cose che abbiamo detto, c'è questo animale che è un po' me e che mi piace.
                        - else:
                            Ma se penso a tutte le cose che abbiamo detto c'è un animale che mi piace e che so che è il nome che mi serve.
                    }
                Mi chiamerò <b><i>{charNameTwo}</b></i>.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                E proteggerò il mio branco.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #portrait:riccio_neutral
                Mamma, papà, nonna e mio fratello.
                Nessuna delle persone a cui voglio bene deve più stare male.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #portrait:riccio_energy
              
            - thirdChar_ActualName has Delfino:
                    {
                        - ending.earth:
                            E se penso a tutte le cose che abbiamo detto, c'è questo animale che è un po' me e che mi piace.
                        - else:
                            Ma se penso a tutte le cose che abbiamo detto c'è un animale che mi piace e che so che è il nome che mi serve.
                    }
                E il mio nome è <b><i>{charNameTwo}</b></i>.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                Perché tutto è un gioco.
                La mia fantasia e le mie bugie aiuteranno le altre persone ad avere meno paura.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #portrait:riccio_emotional
                               
            
            - thirdChar_ActualName has Capibara:
                    {
                        - ending.aether:
                            E se penso a tutte le cose che abbiamo detto, c'è questo animale che è un po' me e che mi piace.
                        - else:
                            Ma se penso a tutte le cose che abbiamo detto c'è un animale che mi piace e che so che è il nome che mi serve.
                    }
                Mi chiamerò <b><i>{charNameTwo}</b></i>.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
                E imparerò ad avere tantissimi amici.
                Ci sentiremo meno soli!#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #portrait:riccio_energy
                E così avremo meno paura.
                    
            - thirdChar_ActualName has Corvo:
                    {
                        - ending.air:
                            E se penso a tutte le cose che abbiamo detto, c'è questo animale che è un po' me e che mi piace.
                        - else:
                            Ma se penso a tutte le cose che abbiamo detto c'è un animale che mi piace e che so che è il nome che mi serve.
                    }
                Io sono <b><i>{charNameTwo}</b></i>.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                Sono sveglio e posso capire ciò che mi circonda!#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #portrait:riccio_neutral
                E posso cambiare le cose che mi fanno paura.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #portrait:riccio_emotional
                Aiutare gli altri.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #portrait:riccio_neutral
                    
        }
        

            {
            - thirdChar_specialEvent == true:
                -> secret_ending
            - else:
                -> exit
            }
    
    
    = secret_ending
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

            {
                - not rewriting_proposal_second_character.secret_ending or not rewriting_proposal_first_character.secret_ending:
                    {charTag(TheWitch, witch_state())}:   <i>{charNameTwo} ripone piena fiducia in {player_name}, ed è pronto a condividere con {player_pronouns has him:lui|{player_pronouns has her:lei|ləi}} una informazione importante.
            }

        Voglio dirti una cosa {player_name}.
            -> close
            
     = exit
     ~ temp charNameTwo = translator(secondChar_ActualName)
        {
            - contentsNest hasnt fireGlyph:
            Ah {player_name}, prima ho trovato una cosa in giro.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #portrait:riccio_neutral
            O forse l'ho rubata.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #portrait:riccio_melanchonic
            Ma ho pensato che magari tu ci cavi qualcosa.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #portrait:riccio_neutral
            Devo iniziare a comportarmi diversamente, mi sa. 
            Vero?
            {
                - player_accessiblePlaces has Nest: 
                    Ho chiesto a un amico di lasciartela nel nido.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #portrait:riccio_neutral
                
                - else: 
                    Stavo per dartela direttamente, ma Franco mi ha detto che te l'avrebbe fatta trovare quando ti sarà servita.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #portrait:riccio_neutral
            }
            ~ move_entity(fireGlyph, Nest)

        }
            
    -> close



    = close
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
        
        Me ne vado.
        Salutami
            {
                - secondChar_storyStatus == story_storyStarted:
                    E {charNameTwo}.

            }
            {
                - thirdChar_storyStatus == story_storyStarted:
                    E anche {charNameThree}.

            }
        

        
        -> endingPNGstory(ThirdCharacter)