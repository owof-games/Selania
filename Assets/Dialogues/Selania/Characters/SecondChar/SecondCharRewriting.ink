

=== rewriting_proposal_second_character
~ temp charNameTwo = translator(secondChar_ActualName)
//Così se decido di uscire dalla conversazione, posso riprendere da dove eravamo rimaste.
    {
        - not confession:
            -> confession
            
        - else:
            -> rewriting

    }
    
    = confession
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ change_entity_place(Mentor)

        Da quando nonna è nella casa dei vecchi fa tutto schifo.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
        Papà è tornato ma litiga sempre con mamma.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        E quando papà non c'è mamma si arrabbia con me.
        E l'unica cosa che mi dice è che devo smetterla di piangere e fare il grande.
        Che anche se piango nonna non torna e che è in un posto migliore.
        E a scuola le maestre sono fastidiose.
        Dicono che sono cattivo e bugiardo e sono violento, e finisco sempre in punizione.
        Mio fratello dice che il mondo è un posto orribile e che non si può più aggiustare.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        Gli animali spariranno tutti e non posso fare nulla.
        Papà dice che devo crescere, non pensare agli animali perché ora sono grande.
        Ma i grandi fanno schifo.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
        E non voglio fare schifo.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
        E non voglio diventare grande.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
        Per questo sono venuto qui.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        Per stare con gli animali.
        E non è il mio compleanno.
        Ma se non mi invento un motivo per le cose nessuno mi ascolta.
        Scusa per la bugia {player_name}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
        Io voglio solo fare il bambino.
        Invece i grandi mi dicono che mi vogliono bene.
        Ma poi mi fanno male.
        E io non mi fido più di voi.

            @animation:RewriterBook
        
            + [Ti ho ascoltato, {charNameTwo}, e posso aiutarti a riscrivere la tua storia.]
                -> rewriting
            
            + [Capisco il tuo dolore, ma ho bisogno di riflettere un attimo.]
                -> main


    = rewriting
    ~ temp charNameTwo = translator(secondChar_ActualName)

            Va bene.
            Ma stavo pensando una cosa però prima.
            Abbiamo parlato tantissimo noi due.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
            Ma davvero TANTISSSSSSIMO!
            E sai cosa penso di te?

            //Avvio aggiornamento relazione + commento PNG + commento strega
                -> secondAffinityCalc ->
                
            //Vado a svuotare i contatori di colore, così son tranquilla.
                -> storage_colors(SecondCharacter) ->
            
            //E poi a seconda dello stato di inchiostro, mi sposto sulla domanda prevista      
                {
                    - secondChar_InkLevel == ink_empty:
                        -> ending
                    - else: 
                        -> one
                } 


    = one
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    ~ change_entity_place(Mentor)

        Comunque possiamo cominciare quando vuoi.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        
        //Affrontiamo gli adulti in generale
            Hai detto che da quando nonna è nella casa dei vecchi fa tutto schifo.#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral
            Che tuo papà litiga con tua mamma, e che mamma si arrabbia con te e di non piangere perché nonna è in un posto migliore.

            + [Tua nonna ti ha insegnato a lottare: lotta anche tu!]
                -> color_variation_management(SecondCharacter, redC)->
                E ti ha insegnato a barare!
                E a sputare nel caffè di chi ti fa male.
                {
                    - about_violence_and_peace:
                        Pensa a prima, a quando hai convinto {mentorName} a chiederti scusa.
                        Sapevi di avere ragione, e per questo hai ottenuto quello di cui avevi bisogno.
                }
                    
            
            + [I tuoi genitori sono infelici, {charNameTwo}, prova a comprenderli.]
                -> color_variation_management(SecondCharacter, greenC)->
                Tutti i litigi, la fuga di tuo padre.
                Il modo in cui si arrabbia per tutto.
                Le paure di tua mamma.
                Sono cose che puoi capire, che vivi anche tu.
                    
                    
            + [Tuo fratello però ha trovato il bello anche in questo casino.]
                -> color_variation_management(SecondCharacter, yellowC)->
                Ci sono le sue statue, c'è il suo amico.
                {
                    -second_char_main_storylets.eleven:
                        E quando sei a casa sua, ti lascia sperimentare con le cose di casa.
                }

                                
            + [E la casa dei vecchi è un posto attrezzato, organizzato.]
                    -> color_variation_management(SecondCharacter, blueC)->
                Una persona anziana ha bisogno di cure, {charNameTwo}.
                Di persone che le diano quello di cui ha bisogno.
                È giusto che tu senta la sua mancanza.
                Ma sarebbe la cosa giusta per lei, riportarla a casa?
                    
    
            + [Ma è grazie al pianto che puoi essere diverso da loro.]
                -> color_variation_management(SecondCharacter, purpleC)->
                Tu tieni agli animali.
                A tuo fratello.
                Alla nonna.
                E anche a loro.
                Puoi imparare a fidarti.
                    
            
        -
            ~ numberQuestion ++  
        Sì no boh.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_neutral
        Continua.
        
            {
                - firstChar_storyStatus != story_storyEnded:
                    {player_name} ha utilizzato la sua prima goccia di inchiostro per compiere una riscrittura.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            }        

            {
            - secondChar_InkLevel == ink_low:
                -> ending
            - else: 
                -> two
            }        
        
    
    = two
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour= translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)

        A scuola le maestre dicono che sei cattivo, bugiardo, violento, e finisci sempre in punizione.#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral

        + [Le bugie alla fine sono solo storie. Usale per divertirti.]
                -> color_variation_management(SecondCharacter, yellowC)->
            {
                - cooking_with_second_char.third_theme:
                    L'hai detto anche mentre cucinavamo: non tutte le bugie sono uguali.
                    E che sei felice di inventare storie con tuo fratello.
            }    
            Ti piace immaginare giornate diverse: prova a condividere questa cosa con i tuoi amici.
            La tua testa è un bellissimo parco giochi: perché non condividerla con gli altri?
            {
                - open_the_library:
                    Come i racconti che hai trovato in biblioteca!
            }
                   
        + [Tutto a questo mondo cambia. Anche un bambino cocciuto e bugiardo.]
                -> color_variation_management(SecondCharacter, blueC)->
            Quando sei arrivato qui hai litigato con {mentorName}.
            E mi hai detto molte bugie.
            Ma hai anche chiesto scusa.
            Puoi partire da questo per cambiare.
                   
        + [La rabbia è parte della tua vita, della tua famiglia: trasformala.]
                -> color_variation_management(SecondCharacter, redC)->
            Come quando ti arrabbi perché gli animali stanno scomparendo.
            O perché papà tratta male nonna.
            Puoi prendere quello che senti a farci qualcosa di buono per te e le persone che ami.
            {
                - a_story_of_rebellion:
                    L'hai detto anche quando hai letto il racconto del sassolino: i grandi non sempre vedono l'aragosta.
                    Ma tu sì, e puoi cambiare tante cose.
            }
                    
        + [Ma non sei solo questo: sei gentile, sei curioso, sei divertente.]
                -> color_variation_management(SecondCharacter, greenC)->
            Hai sviluppato un bel rapporto con {charNameOne}.
            Mi hai raccontato tante cose interessanti sugli animali.
            Hai fatto amicizia con la rana.
            Ti sei preso le tue responsabilità.
            Forse a volte sei violento.
            E menti.
            Ma sei anche tante altre cose, {charNameTwo}.
                   
        + [Eppure hai trovato il modo di fare pace con {mentorName}.]
                -> color_variation_management(SecondCharacter, purpleC)->
            Hai fatto lo sforzo di capirla.
            E mi hai chiesto scusa più volte per le tue bugie.
            Stai già cambiando, {charNameTwo}!
                   


        // + [Non puoi prevedere il futuro. Goditi quello che c'è senza rimpianti.]
        //     Se le cose sono incerte, prenditi le certezze.
        //     E la cosa certa è che gli animali ci sono ancora.
        //     Che tuo fratello ti vuole bene.
        //     E le caramelle sono buone.
        //            -> color_variation_management(SecondCharacter, yellowC)->
 
        // + [Sei giovane ma sai già un sacco di cose. Studia e salvali.]
        //     Si ha paura solo se non si conosce una cosa.
        //     Impara a conoscere quello di cui hai paura.
        //     E a quel punto saprai anche come cambiare le cose.
        //            -> color_variation_management(SecondCharacter, blueC)->

        // + [E allora lotta. Unisciti ad altri e protesta!]
        //     Sei abituato a stare in castigo, di cosa hai paura?
        //     A scuola fai quello che vuoi.
        //     Fallo anche fuori.
        //     Per salvare il mondo.
        //             -> color_variation_management(SecondCharacter, redC)->

        // + [Inventa storie, bugie che creino compassione, che cambino le persone.]
        //     Un po' come la bugia del compleanno.
        //     Ma per far sì che ogni bosco abbia migliaia di compleanni.
        //     Usa il tuo dono per convincere le persone a cambiare.
        //            -> color_variation_management(SecondCharacter, greenC)->
  
        // + [La paura blocca, la paura è una scusa comoda.]
        //     La paura è un rifugio.
        //     Se hai paura, non agisci.
        //     Se agisci non cambi nulla.
        //     Davvero vuoi restare per sempre bloccato dalla paura?
        //            -> color_variation_management(SecondCharacter, purpleC)->
                   
        -
        ~ numberQuestion ++  
        Non ci avevo pensato, pensato davvero.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_neutral
        Che posso fare qualcosa per gli animali.
        
            {
                - firstChar_storyStatus != story_storyEnded:
                    {player_name} ha utilizzato la sua seconda goccia di inchiostro per procedere con la riscrittura.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            }         
        
            {
            - secondChar_InkLevel == ink_normal:
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
    
        + [Eppure ci sono le associazioni che proteggono gli animali.]
            -> color_variation_management(SecondCharacter, purpleC)->
            Come quelle di cui ti ha parlato la tua maestra.
            E la sua amica del canile.
            {
                - second_char_main_storylets.twelve:
                    E magari da grande studierai davvero come si curano i pesci.
            }

        + [Eppure tuo fratello ama il suo ragazzo.]
            -> color_variation_management(SecondCharacter, greenC)->
            E ama te.
            E fa in modo che possiate passare tanto tempo assieme.
            Che tu possa avere uno spazio felice.
            E così rende il mondo un po' meno orribile.
                   
        + [Eppure tuo fratello lotta contro tuo padre perché tu stia meglio.]
            -> color_variation_management(SecondCharacter, redC)->
            {
                - second_char_main_storylets.eleven:
                    E quando sei a casa sua ti fa fare un sacco di esperimenti.
            }
            Si è creato una nuova casa.
            Non si è fatto mettere i piedi in testa da nessuno.
            E questo lo fai se pensi ci sia un futuro dove andare.
                    
        + [Ma sai anche trovare la gioia e la giocosità nel mondo.]
            -> color_variation_management(SecondCharacter, yellowC)->
            Sei arrivato in questo posto sconosciuto e invece di avere paura, ti sei messo a curiosare.
            Ti sei fatto amico una rana parlante.
                {
                    - dog_second_char:
                        E ti sei esaltato quando hai incontrato il cane.
                }
                {
                    - cooking_with_second_char.third_theme:
                        E un giorno avrai uno struzzo!
                }    
            Quando tu giochi non hai paura di nulla.

        + [Eppure sistematicamente tuo fratello per lavoro aggiusta le cose.]
            -> color_variation_management(SecondCharacter, blueC)->
            Vede le cose rotte e le ripara.
            Quindi ci sono cose che si possono aggiustare.
            Serve solo un meccanico per le cose che lo spaventano.
                   
        -

        ~ numberQuestion ++ 
        Si no boh.
        Magari hai ragione.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_neutral
        
            {
                - firstChar_storyStatus != story_storyEnded:
                    {player_name} ha utilizzato la terza goccia di inchiostro, proponendo una riscrittura.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            }         
        
            {
            - secondChar_InkLevel == ink_medium:
                -> ending
            - else: 
                -> four
            }
    
    = four
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName) 

        Hai detto che i grandi fanno schifo, e che non vuoi diventare grande.#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral
        
            + [Ma puoi essere un adulto combattente, come tua nonna.]
                -> color_variation_management(SecondCharacter, redC)->
                {
                    - cooking_with_second_char.first_theme:
                        Un adulto che dice le cose come sono, come mi raccontavi cucinando.
                }
                {
                    - cooking_with_second_char.second_theme:
                        Essere furbo, come ti ha detto lei.
                }
                E non farti mettere i piedi in testa da nessuna persona!
                        
        
            + [Ma puoi essere un adulto curioso e studioso, come un po' già sei.]
                -> color_variation_management(SecondCharacter, blueC)->
                {
                    -first_second_chit_chat:
                        Come quando hai detto a {charNameOne} che volevi scoprire dove vanno tutti i posti chiusi qui.
                        E come trovare le caramelle.
                }
                E tutto quello che ora sai degli animali diventerà mille volte ancora di più.

            
            + [Ma puoi essere un adulto in cerca di uno scopo più grande, come {charNameOne}.]
                {
                    - cooking_with_second_char.first_theme:
                        Non uno di quegli adulti che fanno le cose perché devono, come raccontavi in cucina.
                }
                E trovare modi inaspettati di aiutare le altre persone, gli animali, il mondo.
                    -> color_variation_management(SecondCharacter, purpleC)->

                
            + [Ma puoi essere un adulto che si prende cura delle persone, come {mentorName}.]
                -> color_variation_management(SecondCharacter, greenC)->
                E rendere più facile la vita all3 altr3.
                {
                    - cooking_with_second_char.second_theme:
                        Una brava persona, come ti ha detto tuo fratello.
                }
                {
                    - about_violence_and_peace:
                        Non uno di quei grandi che chiedono sempre scusa per tutte le cose ma poi le rifanno, come hai detto a {mentorName}.
                        Ma un adulto responsabile, come tuo fratello.
                }

            + [Ma puoi essere un adulto creativo, come tuo fratello.]
                -> color_variation_management(SecondCharacter, yellowC)->
                E condividere le tue storie e i tuoi esperimenti.
                Essere felice nel farli.
                        

        -
        ~ numberQuestion ++  
        Posso essere un adulto buono.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_neutral
        Woah.
        
            {
                - firstChar_storyStatus!=story_storyEnded:
                    {player_name} ha utilizzato la quarta e ultima unità di inchiostro, compiendo il massimo di riscritture possibili.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            }  
            
            -> ending

    
    = ending
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

        Credo di aver compreso quale sia il tuo blocco, perché sei qui.
        E riguarda gli adulti.
        Perché se chi dovrebbe proteggerti ti ha ferito, come fai a fidarti delle persone?
        E per questo ti dico {charNameTwo}:#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral
            
            {
                - firstChar_storyStatus != story_storyEnded:
                    {player_name} sta per utilizzare il potere dell'<b><i>epilogo</b></i>.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                - else:
                    Quale <b><i>epilogo</b></i> proporrà {player_name}?#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}   
            }     
     
        + (red)[Diventa il più forte, il più coraggioso.]
            Sei un testardo, bugiardo, dispettoso.
            Queste cose unite possono renderti indistruttibile.
            E di cosa avrà mai paura un ragazzo indistruttibile?
                    -> color_variation_management(SecondCharacter, redC)->
    
        + (purple)[Tutti abbiamo paura. Condividi questa paura con le altre persone.]
            Falle sentire meno sole.
            Meno sbagliate.
            A quel punto saranno pronte a fare il passo.
            A cambiare le cose a loro volta.
            Assieme.
                   -> color_variation_management(SecondCharacter, purpleC)->

        + (yellow)[L'opposto della paura è la curiosità.]
            E tu sei il ritratto della curiosità.
            Guarda le cose che arriveranno chiedendoti "Chissà se..." o "E se invece..." o "Perché accade questo?".
            E a quel punto ogni paura diventerà solo un problema da risolvere.
                   -> color_variation_management(SecondCharacter, yellowC)->
                
        + (green)[I tuoi genitori sono spaventati, aiutatevi a vicenda.]
            Nessuna persona può cambiare il mondo da sola.
            Ma possiamo partire dal cambiare le cose che ci circondano, un pezzo alla volta.
                   -> color_variation_management(SecondCharacter, greenC)->
      
        + (blue)[Con la tua intelligenza puoi rendere il mondo migliore.]
            Puoi aiutare gli adulti a essere meno tristi.
            E gli animali a non morire.
            E tua nonna a uscire dalla casa dei vecchi.
                   -> color_variation_management(SecondCharacter, blueC)->
    
        -
    //Nota: la parte di accettazione del nome è prima dell'aggiornamento, così il nome nuovo compare solo quando viene dichiarato.
    Sì. #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_neutral
    No.
    Boh.

            {
                - ending.red:
                    Non ci avevo mai pensato, che il fatto che sono bugiardo e dispettoso può rendermi indistruttibile.
                
                - ending.purple:
                    Non è che vedo sempre che anche le altre persone hanno paura.
                    Questa cosa mi ha fatto sentire meno stupido.

                - ending.yellow:
                    Mi piace quella cosa che hai detto sulla curiosità perché è vera.
                    Curioso sempre, curioso forte!

                - ending.green:
                    Io non ci avevo mica pensato che anche i miei genitori hanno paura.

                - ending.blue:
                    Hai detto che la mia intelligenza può fare felici le altre persone.
                    È una cosa bella, {player_name}.
                    
            }

            //Prima chiamo il moltiplicatore di colori, così che comunque le scelte fatte qui abbiano un impatto maggiore.
                -> color_modifier(SecondCharacter, secondChar_colorVariation) ->
            
            //Poi aggiorniamo i colori, così il valore complessivo conta per la scelta del nome
                -> update_colors(SecondCharacter) ->     
     
            //E infine genero il nome
                -> secondNaming ->naming
                
    
    
    = naming
    ~ temp charNameTwo = translator(secondChar_ActualName)
    
        {

            - secondChar_ActualName has Grizzly:
                    {
                        - ending.red:
                            E se penso a tutte le cose che abbiamo detto, c'è questo animale che è un po' me e che mi piace.
                        - else:
                            Ma se penso a tutte le cose che abbiamo detto c'è un animale che mi piace e che so che è il nome che mi serve.
                    }
                Il mio vero nome è <b><i>{charNameTwo}</b></i>.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                Combatterò la mia paura e diventerò il più forte di tutti, imbattibile!
            
            - secondChar_ActualName has Lupo:
                    {
                        - ending.green:
                            E se penso a tutte le cose che abbiamo detto, c'è questo animale che è un po' me e che mi piace.
                        - else:
                            Ma se penso a tutte le cose che abbiamo detto c'è un animale che mi piace e che so che è il nome che mi serve.
                    }
                Mi chiamerò <b><i>{charNameTwo}</b></i>.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                E proteggerò il mio branco.
                Mamma, papà, nonna e mio fratello.
                Nessuna delle persone a cui voglio bene deve più stare male.
              
            - secondChar_ActualName has Delfino:
                    {
                        - ending.yellow:
                            E se penso a tutte le cose che abbiamo detto, c'è questo animale che è un po' me e che mi piace.
                        - else:
                            Ma se penso a tutte le cose che abbiamo detto c'è un animale che mi piace e che so che è il nome che mi serve.
                    }
                E il mio nome è <b><i>{charNameTwo}</b></i>.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                Perché tutto è un gioco.
                La mia fantasia e le mie bugie aiuteranno le altre persone ad avere meno paura.
                               
            
            - secondChar_ActualName has Capibara:
                    {
                        - ending.purple:
                            E se penso a tutte le cose che abbiamo detto, c'è questo animale che è un po' me e che mi piace.
                        - else:
                            Ma se penso a tutte le cose che abbiamo detto c'è un animale che mi piace e che so che è il nome che mi serve.
                    }
                Mi chiamerò <b><i>{charNameTwo}</b></i>.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
                E imparerò ad avere tantissimi amici.
                Ci sentiremo meno soli!
                E così avremo meno paura.
                    
            - secondChar_ActualName has Corvo:
                    {
                        - ending.blue:
                            E se penso a tutte le cose che abbiamo detto, c'è questo animale che è un po' me e che mi piace.
                        - else:
                            Ma se penso a tutte le cose che abbiamo detto c'è un animale che mi piace e che so che è il nome che mi serve.
                    }
                Io sono <b><i>{charNameTwo}</b></i>.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                Sono sveglio e posso capire ciò che mi circonda!
                E posso cambiare le cose che mi fanno paura.
                Aiutare gli altri.
                    
        }
        

            ~ book_BGVariations ++
            
            {
            - secondChar_specialEvent == true:
                -> secret_ending
            - else:
                -> close
            }
    
    
    = secret_ending
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

            {
                - not rewriting_proposal_first_character.secret_ending:
                    {charNameTwo} ripone piena fiducia in {player_name}, ed è pronto a condividere con {player_pronouns has him:lui|{player_pronouns has her:lei|ləi}} una informazione importante.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            }

        Voglio dirti una cosa {player_name}. #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_neutral
        Su {mentorName}.
        A me non mi sembra mica felice.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
        Mi ricorda mamma quando gira per casa dando consigli e dicendo cose sorridendo.
        E poi si rinchiude in camera e resta in silenzio per ore.
        Ora fa tante cose e parla tanto.
        Ma non mi sembra felice.
            -> close
            
    
    = close
        ~ temp charNameTwo = translator(secondChar_ActualName)
            Ora voglio stare ancora un po' qui prima di prendere il treno. #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_neutral
            Mi mancherà la rana!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
            @animation:RewriterBook
            
            ~ story_endedStories += story_secondCharStoryEnded
            ~ secondChar_storyStatus = story_storyEnded
            ~ player_movementsCounter = 0
            ~ PG_advance_management(SecondCharacter)
            ~ numberQuestion = 0
            ~ secondChar_InkLevel = ink_empty
                -> main