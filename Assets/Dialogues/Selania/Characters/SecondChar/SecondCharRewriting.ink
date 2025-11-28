

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
        Che anche se piango nonna non torna.
        E a scuola le maestre sono fastidiose.
        <b><i>Stronze</b></i>.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
        Scusa.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
        Mio fratello dice che il mondo è un posto orribile e che non si può più aggiustare.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        Gli animali spariranno tutti ed è colpa nostra.
        Papà dice che devo crescere, non pensare agli animali perché ora sono grande.
        Ma i grandi fanno schifo.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
        E non voglio fare schifo.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
        E non voglio diventare grande.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
        Per questo sono venuto qui.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        Per stare con gli animali.
        Non è il mio compleanno.
        Scusa per la bugia.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
            @animation:RewriterBook
        Ma se non mi invento un motivo per le cose nessuno mi ascolta.
    
            + [Ti ho ascoltato, {charNameTwo}, e posso aiutarti a stare meglio.]
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
    ~ change_entity_place(Mentor)
            {
                -   are_two_entities_together(FirstCharacter, PG):Qui le cose si fanno serie, e io me ne vado. Buona fortuna, {player_name}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:chitarra_affectionate
                        ~ change_entity_place(FirstCharacter)
            }        
      //Affrontiamo gli adulti in generale
    Hai detto che i grandi fanno schifo e che non ti fidi di loro.#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral

        + [Però tua nonna e tuo fratello spaccano.]
            Tua nonna ti ha insegnato a barare!
            Tuo fratello crea cose e ti protegge.
            Anche loro sono adulti.
                   -> color_variation_management(SecondCharacter, redC)->

        
        + [I tuoi genitori sono infelici, essere adulti è difficile.]
            Tutti i litigi, la fuga di tuo padre.
            Diventiamo grandi, abbiamo un sacco di doveri, e non sappiamo cosa fare.
            Per questo i grandi fanno cose brutte.
            Ma questo non li rende schifosi.
                   -> color_variation_management(SecondCharacter, greenC)->
                   
        
        + [Il problema è che agli adulti non è permesso giocare.]
            Tua nonna gioca, bara, e infatti è super.
            I tuoi genitori lavorano e litigano e sono infelici.
            Tu puoi essere un grande che gioca.
            E che gioca con gli animali per vivere.
            Ed essere felice.
                   -> color_variation_management(SecondCharacter, yellowC)->
                            

            
        + [Però gli adulti hanno anche scoperto le cose che ti piacciono.]
            L'elettricità.
            Gli studi sugli animali.
            Le caramelle.
            Le action figures.
                   -> color_variation_management(SecondCharacter, blueC)->
 
        + [Hai ragione. Ma tu puoi essere un altro tipo di adulto.]
            Un adulto che sa correggere le giornate.
            Anche per le altre persone.
            Che può tornare a fidarsi delle altre persone.
                   -> color_variation_management(SecondCharacter, purpleC)->
            
        -
        ~ numberQuestion ++  
        Continua.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_neutral
        
            {
                - firstChar_storyStatus!=story_storyEnded:{player_name} ha utilizzato la sua prima unità di inchiostro per compiere una riscrittura. L'inchiostro ora si è consumato.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            }        

            {
            - secondChar_InkLevel == ink_low:
                -> ending
            - else: 
                -> two
            }        
        
    
    = two
    ~ temp charNameTwo = translator(secondChar_ActualName)
    Hai paura che il mondo stia finendo e che spariranno tutti gli animali.#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral
  
        + [Non puoi prevedere il futuro. Goditi quello che c'è senza rimpianti.]
            Se le cose sono incerte, prenditi le certezze.
            E la cosa certa è che gli animali ci sono ancora.
            Che tuo fratello ti vuole bene.
            E le caramelle sono buone.
                   -> color_variation_management(SecondCharacter, yellowC)->
 
        + [Sei giovane ma sai già un sacco di cose. Studia e salvali.]
            Si ha paura solo se non si conosce una cosa.
            Impara a conoscere quello di cui hai paura.
            E a quel punto saprai anche come cambiare le cose.
                   -> color_variation_management(SecondCharacter, blueC)->

        + [E allora lotta. Unisciti ad altri e protesta!]
            Sei abituato a stare in castigo, di cosa hai paura?
            A scuola fai quello che vuoi.
            Fallo anche fuori.
            Per salvare il mondo.
                    -> color_variation_management(SecondCharacter, redC)->

        + [Inventa storie, bugie che creino compassione, che cambino le persone.]
            Un po' come la bugia del compleanno.
            Ma per far sì che ogni bosco abbia migliaia di compleanni.
            Usa il tuo dono per convincere le persone a cambiare.
                   -> color_variation_management(SecondCharacter, greenC)->
  
        + [La paura blocca, la paura è una scusa comoda.]
            La paura è un rifugio.
            Se hai paura, non agisci.
            Se agisci non cambi nulla.
            Davvero vuoi restare per sempre bloccato dalla paura?
                   -> color_variation_management(SecondCharacter, purpleC)->
                   
        -
        ~ numberQuestion ++  
        Mmm, posso pensarci.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_neutral
        
            {
                - firstChar_storyStatus!=story_storyEnded:{player_name} ha utilizzato la sua seconda unità di inchiostro per procedere con la riscrittura. La boccetta ora è vuota.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
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
    
        + [Eppure crea arte.]
            E l'arte è respiro, futuro, è cambiamento.
            L'arte è credere che le cose possano migliorare.
            Definisce un presente, per lanciarci altrove.
            E rende il mondo un posto meno orribile.
                   -> color_variation_management(SecondCharacter, purpleC)->
   
        + [Eppure ama il suo ragazzo.]
            E ama te.
            E fa in modo che possiate passare tanto tempo assieme.
            Che tu possa avere uno spazio felice.
            E così rende il mondo un po' meno orribile.
                   -> color_variation_management(SecondCharacter, greenC)->
 
        + [Eppure lotta contro tuo padre perché tu stia meglio.]
            Si è creato una nuova casa.
            Non si è fatto mettere i piedi in testa da nessuno.
            E questo lo fai se pensi ci sia un futuro dove andare.
                    -> color_variation_management(SecondCharacter, redC)->
  
        + [Eppure gioca con te.]
            Si diverte, lascia che le cose belle accadano.
            In un mondo orribile, esisterebbe davvero il piacere?
                   -> color_variation_management(SecondCharacter, yellowC)->

        + [Eppure per lavoro aggiusta le cose.]
            Vede le cose rotte e le ripara.
            Quindi ci sono cose che si possono aggiustare.
            Serve solo un meccanico per le cose che lo spaventano.
                   -> color_variation_management(SecondCharacter, blueC)->
  
        -
        ~ numberQuestion ++  
        Ok...#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_neutral
        
            {
                - firstChar_storyStatus!=story_storyEnded:{player_name} ha utilizzato la terza unità di inchiostro, proponendo una riscrittura.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            }         
        
            {
            - secondChar_InkLevel == ink_medium:
                -> ending
            - else: 
                -> four
            }
    
    = four
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)    
    
    //Commento più personale
    {mentorName} ti ha chiamato {charNameTwo}.#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral
    
        + [Vuoi davvero dargliela vinta?]
            Non ti piace da quando sei arrivato qui.
            Ti ha fatto arrabbiare dal primo momento.
            Vuoi davvero che sia lei a decidere come ti chiami?
                    -> color_variation_management(SecondCharacter, redC)->
     
        + [I ricci resistono a tantissimi veleni.]
            Ogni animale ha la sua dote, il suo modo di superare le paure.
            Puoi studiare e diventare un superanimale.
            O divertirti a cambiare quando vuoi.
            E tornare riccio, quando le cose si fanno velenose.
                   -> color_variation_management(SecondCharacter, blueC)->
        
        + [A volte ci raggomitoliamo per superare il peggio.]
            Quello che conta è: cosa facciamo, dopo?
            Quando le cose sono superate?
            Restiamo ancora nel nostro posto sicuro?
            O decidiamo di guardare le cose da una prospettiva diversa, e cambiarle?
                   -> color_variation_management(SecondCharacter, purpleC)->

            
        + [Anche se la schiena ha le spine, la loro pancia è tenera e gentile.]
            E tu sei stato tenero molte volte da quando sei qui.
            Con me, con la rana.
            E con le cose che hai raccontato.
            Ti servono ancora quelle spine?
                   -> color_variation_management(SecondCharacter, greenC)->

        + [I ricci hanno un olfatto super, possono trovare tutte le caramelle del mondo.]
            E dopo che hai trovato le caramelle, cambia animale.
            Diventa qualcosa che vede fino alla luna, e insegui le stelle.
            Oppure impara a nuotare fino all'altra parte del mondo.
            Continua a cambiare.
                    -> color_variation_management(SecondCharacter, yellowC)->

        -
        ~ numberQuestion ++  
        ...#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_neutral
        
        {
            - firstChar_storyStatus!=story_storyEnded:{player_name}ha utilizzato la quarta e ultima unità di inchiostro, compiendo il massimo di riscritture possibili.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        }  
        
            -> ending

    
    = ending
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
    Per questo ti dico:#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral
            {
                - firstChar_storyStatus != story_storyEnded:{player_name} sta per utilizzare il potere dell'<b><i>epilogo</b></i>.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
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
    {player_name}.
    Tu mi dici queste cose e io mi dico che c'è un animale.
    Un animale che mi piace.
    Un animale che un po' è me.
    E lo voglio come mio nuovo nome.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
            {
                - ending.red:
                    
                
                - ending.purple:
                    

                - ending.yellow:
                    

                - ending.green:
                    

                - ending.blue:
                    

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
                            E se ripenso a tutto quello che ci siamo dett3 fino ad ora, credo che questa sia la mia canzone.
                        - else:
                            Ma se ripenso a tutto quello che ci siamo dett3 fino ad ora, è un'altra la mia canzone.
                    }
                Il mio vero nome è <b><i>{charNameTwo}</b></i>.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                Combatterò la mia paura e diventerò il più forte di tutti, imbattibile!
            
            - secondChar_ActualName has Lupo:
                    {
                        - ending.green:
                            E se ripenso a tutto quello che ci siamo dett3 fino ad ora, credo che questa sia la mia canzone.
                        - else:
                            Ma se ripenso a tutto quello che ci siamo dett3 fino ad ora, è un'altra la mia canzone.
                    }
                Mi chiamerò <b><i>{charNameTwo}</b></i>.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                E proteggerò il mio branco.
                Mamma, papà, nonna e mio fratello.
                Nessuna delle persone a cui voglio bene deve più stare male.
              
            
            - secondChar_ActualName has Delfino:
                    {
                        - ending.yellow:
                            E se ripenso a tutto quello che ci siamo dett3 fino ad ora, credo che questa sia la mia canzone.
                        - else:
                            Ma se ripenso a tutto quello che ci siamo dett3 fino ad ora, è un'altra la mia canzone.
                    }
                E il mio nome è <b><i>{charNameTwo}</b></i>.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                Se lo guardi bene tutto è un gioco.
                La mia fantasia e le mie bugie aiuteranno le altre persone ad avere meno paura.
                               
            
            - secondChar_ActualName has Capibara:
                    {
                        - ending.purple:
                            E se ripenso a tutto quello che ci siamo dett3 fino ad ora, credo che questa sia la mia canzone.
                        - else:
                            Ma se ripenso a tutto quello che ci siamo dett3 fino ad ora, è un'altra la mia canzone.
                    }
                Mi chiamerò <b><i>{charNameTwo}</b></i>.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
                E imparerò ad avere tantissimi amici.
                Ci sentiremo meno soli!
                E così avremo meno paura.
                    
            
            - secondChar_ActualName has Corvo:
                    {
                        - ending.blue:
                            E se ripenso a tutto quello che ci siamo dett3 fino ad ora, credo che questa sia la mia canzone.
                        - else:
                            Ma se ripenso a tutto quello che ci siamo dett3 fino ad ora, è un'altra la mia canzone.
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
                -> exit
            }
    
    
    = secret_ending
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
            {
                - not rewriting_proposal_first_character.secret_ending:
                    La fiducia che {charNameTwo} ha verso {player_name} fa sentire {charNameTwo} pieno della voglia di condividere una informazione importante.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            }
        Voglio dirti una cosa {player_name}. #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_neutral
        Su {mentorName}.
        A me non mi sembra mica felice.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
        Mi ricorda mamma quando gira per casa dando consigli e dicendo cose sorridendo.
        E poi si rinchiude in camera e resta in silenzio per ore.
        Per me non sta mica bene.

            -> close
            
    = exit
    ~ temp charNameTwo = translator(secondChar_ActualName)
        Voglio stare ancora un po' qui prima di prendere il treno. #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_neutral
        Mi mancherà la rana!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
            -> close  
    
    = close
        Ci sono alcune cose che devo ancora vedere prima di andarmene.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
        A dopo, {player_name}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        
            @animation:RewriterBook
            
            ~ secondChar_InkLevel = ink_empty
            ~ numberQuestion = 0
            ~ secondChar_storyStatus = story_storyEnded
            ~ player_movementsCounter = 0
            ~ story_endedStories += story_secondCharStoryEnded
            ~ PG_advance_management(SecondCharacter)
                -> main