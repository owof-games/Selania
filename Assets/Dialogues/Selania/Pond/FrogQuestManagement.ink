=== discovered_things_updater ===
//Questo nodo mi permette di aggiornare sempre lo stato delle missioni autonome, e di eliminare le eventuali quest fatte di già senza dover tracciare le condizioni mille volte.
//Ci arrivo sempre prima di andare al dispatcher delle missioni.
{debug_frog: passo da discovered_things_updater.}
{debug_frog: frog_firstCharObtainedGifts è uguale a {frog_firstCharObtainedGifts}.}
{debug_frog: frog_secondCharObtainedGifts è uguale a {frog_secondCharObtainedGifts}.}

        //Aggiornare lo stato delle cose che posso donare o meno alla PG
        //Nota: per come è strutturata ora la cosa, è un check extra, perché in teoria la variazione dovrebbe avvenire già durante il dono
        {
            //Ho già fatto il dono (ed è il primo check)
            - firstChar_giftedObject != () && frog_firstCharObtainedGifts hasnt charOneCultivable:
                    ~ frog_firstCharObtainedGifts += charOneCultivable
    
            //Ho già cucinato (ed è il primo check). Traccio il nodo più vicino alla fine per prevenire problemi con eventuali crush del gioco
            - ending_cooking_with_first_char && frog_firstCharObtainedGifts hasnt charOneCooking:
                    ~ frog_firstCharObtainedGifts += charOneCooking
        }
        
        
        {
            //Ho già fatto il dono (ed è il primo check)
            - secondChar_giftedObject != () && frog_secondCharObtainedGifts hasnt charTwoCultivable:
                    ~ frog_secondCharObtainedGifts += charTwoCultivable
                    
            //Ho già cucinato (ed è il primo check). Traccio il nodo più vicino alla fine per prevenire problemi con eventuali crush del gioco
            - ending_cooking_with_second_char && frog_secondCharObtainedGifts hasnt charTwoCooking:
                    ~ frog_secondCharObtainedGifts += charTwoCooking
        
        }
    //Ripeto con le altre png
    

->->



=== autonomy_mission_verify ===
//Verifico quante missioni autonome ha fatto la giocatrice.
{debug_frog: passo da autonomy_mission_verify.}
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    //Missione uno: utilizzo del libro della riscrittora.
        {
            - first_character_recap.check && second_character_recap.check && greenhouse_recap.check && frog_availableCommonMissions has missionOne:
                ~ frog_availableCommonMissions -= missionOne

                Ma sei un portento, girino!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                Pensa che ero qui a dirmi "Servirebbe una persona con una bella testolina, più grande di quella di zia Torba."
                "Una capace di leggere quasi quanto {charNameTwo}."
                    {
                        - are_two_entities_together(SecondCharacter, PG):
                                Quasi però!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                                Perché io sono il più megagrande lettore della scuola!
                    }
                E cosa scopro?#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                Che tu hai già letto tante ma tante delle pagine del libro che ti è stato donato!
                E come dico sempre: la conoscenza è sapere!
                E il sapere è sapore per cui: dimmi come posso aiutarti.
                    -> frog_about_who_questions
        }
        
    //Missione due: coltivare almeno tre piante in serra.
        {
            - LIST_COUNT(greenhouse_backupCultivable) < 12 && frog_availableCommonMissions has missionTwo:
                ~ frog_availableCommonMissions -= missionTwo
                
                Dove l'ho messo di nuovo.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                Ah eccolo!
                Mi hanno scritto le formiche per dirmi che ti stai prendendo cura della serra!
                Ed è una cosa grandiosa girino, e sai perché?
                Io no.
                Ah no, eccolo, me lo scrivono sempre le formiche.
                "Avevamo fame."
                Mi sembra una buona motivazione.
                    {
                        - are_two_entities_together(FirstCharacter, PG):
                            Il cibo è sempre una motivazione.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                    }
                E a proposito di cose buone: vediamo come posso aiutarti!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    -> frog_about_who_questions
        }
        
    //Missione tre: mindfulness
        {
            - mindfulness && frog_availableCommonMissions has missionThree:
                ~ frog_availableCommonMissions -= missionThree

                Girino!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                Sei sempre un salto avanti!
                L'altro giorno un'amica, quell'amica comune sai, quella che ci parla nella testa, quell'amica hai capito no.
                    {
                        - are_two_entities_together(FirstCharacter, PG):
                            Aspè: avete un'amica comune in testa?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
                            No, non voglio sapere.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                    }
                <i>A noi piace molto la compagnia della rana Franco.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                Ecco, lei mi ha fatto notare che {mentorName} ha una fissa.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    {
                        - are_two_entities_together(Mentor, PG):
                            Franco, guarda che sono qui e ti sento.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                            E io sono cra!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    }
                Una cosa più fissa in testa della passione di mio cugino Gracco per la pasta coi lombrichi.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                Ama tanto cercare modi per stare bene.
                Ma nessuno glieli chiede mai.
                Nessuno, eccetto te, {player_name}!
                E così ora {mentorName} è più felice.
                E questo posto è un po' più felice.
                    {
                        - are_two_entities_together(Mentor, PG):
                            Uh.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                            Ehm.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
                            Sono in imbarazzo.
                            Ma sì, mi fa piacere aiutare.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                            Non è una cosa brutta, vero?#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
                            No no.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                            Una cosa brutta è invitare un pescatore a un matrimonio tra carpe.
                            Ma torniamo a {player_name}: tu hai fatto una cosa felice.
                    }
                E allora io ti rendo un po' più felice: dimmi come posso aiutarti.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    -> frog_about_who_questions                      
        }
        
    //Missione quattro: gossips 
        {
            - little_storylets && frog_availableCommonMissions has missionFour:
                ~ frog_availableCommonMissions -= missionFour

                Questa no.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                Nemmeno questa.
                {player_name}, tu non sai quanto sia bravo mio marito Tullio ad allungare lo stagno quando parla.
                Non arriva mai al punto.
                    {
                        - are_two_entities_together(FirstCharacter, PG):
                            Perché tu arrivi sempre al punto, Franco.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                            Sì sì, sempre.#inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                            Preciso cone una mosca.
                            Non credo che.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                            Ah, lascia perdere.
                            Non perdo mai.#inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                            E Tullio non perde mai la parola.
                    }

                Nemmeno sui bigliettini.#inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                Ah, ecco qui.
                "Ricordati di recuperare i gemelli al nido."
                No, non era questo.
                "Ricordati <b>davvero</b> di recuperare i gemelli al nido. Non come quella volta che sono tornati con la carpa delle otto da soli."
                "A proposito di carpe: le sorelle Qualqui vengono per cena. Mi prendi due etti di termiti e qualche seme? Ti amo."
                Dall'arrivo dei gemelli ha un tritone per capello.
                Avere centosedici figli non è una passeggiata.
                Sempre meglio di zia Graaak, che ormai va per il migliaio.
                Non hai idea del casino del ricordare tutti i compleanni.
                    {
                        - are_two_entities_together(SecondCharacter, PG):
                            Però non ti devi dimenticare il mio!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                            Ehm sì certo.#inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                            Me lo sono segnato per il craaatto di girinnaio.
                    }
                Ma io dovevo dirti qualcosa, {player_name}!#inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                Cosa?
                Ah sì: che il gossip è importante.
                Per cui hai fatto benissimo a parlare con {mentorName} delle cose insolite che hai incontrato.
                Non sai quanto abbia bisogno quella donna di uscire dal suo guscio.
                Per cui: vediamo come posso aiutarti!
                    -> frog_about_who_questions                        
        }
        
        
    //Missione cinque: chiacchiere tra PNG 
        {
            - first_second_chit_chat && frog_availableCommonMissions has missionFive:
                ~ frog_availableCommonMissions -= missionFive

                Avannotti!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                Era "avannotti".
                Non "ananassi."
                Franco, hai sempre la testa tra le alghe.
                Cosa buffa, {player_name}.
                Prima mio marito Tullio e l'altro marito, Giulio, stavano parlando di una partita di pallanuoto tra ananassi.
                E, girino, quanto ero confuso!
                Però a volte ho paura di sembrare tonto come una conchiglia, e quindi non chiedo nulla.
                Invece sono contento che prima hai partecipato alla conversazione tra {charNameOne} e {charNameTwo}, girino.
                        {
                            - are_two_entities_together(FirstCharacter, PG):
                                Ci stavi spiando quindi?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                        }                        

                Non hai avuto paura di dire una cosa e sembrare stupid{player_pronouns has him:o|{player_pronouns has her:a|ə}}!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                        {
                            - are_two_entities_together(SecondCharacter, PG):
                                La nonna dice sempre che non ci sono domande stupide ma solo risposte sbagliate.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                        }

                Quindi: non essere come Franco. E se vedi due persone vicine, prova a chiacchierare con loro.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                Però una partita tra ananassi io me la guarderei.
                Dopo lo dico a Giulio, magari ne esce qualcosa.
                Come quella volta che abbiamo tirato su una band.
                Ci chiamavamo Depeche Pond.
                Ma non è stata una bella idea quella di mettere gli amplificatori in acqua.
                I ricci sono ancora arrabbiati con noi.
                Ma devo aiutarti, mannaggia alla mia distrazione.
                Zio Gracco lo dice sempre: Franco!
                Zio Gracco è un rospo di poche parole. 
                    -> frog_about_who_questions                        
        }
        
    //Missione sei: conoscere la strega
        {
            - witch_intro && frog_availableCommonMissions has missionSix:
                ~ frog_availableCommonMissions -= missionSix

                Girino!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                Ho saputo che finalmente hai parlato con la nostra amica comune!
                E tu dirai: "Ma Franco, come fai a sapere sempre tutto?"
                E io ti dirò: "Ma Franco è sempre la prima ruota del gatto, ovvio che sa tutto!"
                E tu dirai: "Ma i gatti non hanno le ruote."
                E allora io dirò: "I gatti hanno tante cose, ma non ce le vogliono fare sapere!"
                E poi ti dirò: "Una volta ho conosciuto un gatto con un buffo cappello in testa."
                E quando gli ho chiesto: "Giovandomenico, ma cosa ci fai con un cappello così in testa?"
                Lui mi ha detto: "Meow!"
                I gatti sono così saggi.
                Ma zia Graaak dice sempre: tanto va la gatta allo stagno, che ci rimette il girino.
                Uh, una lettera di Tullio.
                "Franco, di a quel{player_pronouns has her:la|lə} pover{player_pronouns has him:o|{player_pronouns has her:a|ə}} {player_name} quello che devi dir{player_pronouns has him:gli|{player_pronouns has her:le|lə}}!"
                Uh, è sempre così nervoso.
                Comunque {player_name}: sono felice che hai parlato con chi sai tu.
                Perché il lavoro che fai è molto delicato.
                Molto.
                Ed è bello avere una guida, un'alleata così saggia.
                <i>La saggezza ha molte facce, e una porta il volto di Franco.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState #portrait: {witch_state()}
                E ora quindi è il mio momento di aiutarti.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    -> frog_about_who_questions                        
        }
        
    //Missione sette: leggere una lettera
        {
            - first_character_notes.check or second_character_notes.check && frog_availableCommonMissions has missionSeven:
                ~ frog_availableCommonMissions -= missionSeven

                I gemelli stanno facendo lo sciopero del sonno.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                A fatica mi ricordo il mio nome.
                E tutto perché Giulio non vuole prendergli un cane.
                    {
                        - are_two_entities_together(SecondCharacter, PG):
                            Anche io voglio un caneeeeeeeeeeeeee!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                            Allora sciopera coi gemelli!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    }

                Comunque è tutta colpa di Dora l'ape.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                Quella passa il tempo a svolazzare in giro, e poi se ne sta lì sulla riva a bere acqua e raccontare cose.
                E ha detto ai gemelli che c'è un cane alla fermata del treno.
                Scusa, sono arrabbiato.
                Dora è una brava ape, buona come l'alga.
                Ma ho sonno!
                E l'altra sera l'ho detto ai gemelli.
                Li ho fatti sedere tutti e centosedici in cerchio.
                "Un cane non sa respirare sott'acqua, punto."
                Ma poi Euforbo, che è il più sveglio dei gemelli, ha un mese e mezzo ma sta già nella classe dei tre mesi, mi dice: "Papà, siamo anfibi."
                "E quindi?" gli chiedo, sperando solo di andare a dormire.
                "E quindi sappiamo respirare fuori dall'acqua, papà Franco!"
                E la sorpresa, {player_name}!
                Non ci avevo mai pensato, ma respiro fuori dall'acqua!
                    {
                        - are_two_entities_together(FirstCharacter, PG):
                            Franco, ma tu come ci sei arrivato all'età adulta?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                            Un po' a piedi, un po' col treno.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    }
                E il mondo ora mi sembra così grande.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                E pieno di possibilità.
                Come quella di avere un cane.
                Ora sto scioperando anche io coi gemelli.
                Ma non sai quanto ho sonno!
                E Dora mi ha detto che hai conosciuto il cane del treno!
                E allora io ti aiuterò con il tuo lavoro.
                Così magari Giulio capisce che sono un bravo girino, e ci prende il cane!
                    -> frog_about_who_questions                        
        }
        
    //Missione otto: leggere un libro della biblioteca
        {
            - library_readStories != () && frog_availableCommonMissions has missionEight:
                ~ frog_availableCommonMissions -= missionEight

                "Caro zio Gracco."#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                "La algonara è stata inventata nemmeno cento schiuse fa."
                "Quindi se ci metto la panna no, non è un crimine contro lo stagno."
                "Tuo nipote Franco."
                "PS: potresti tenere i gemelli sabato? Vorrei andare alla partita degli ananassi con Tullio e Giulio. Grazie mille."
                "PPS: non è che mi passeresti anche la ricetta per la frittura di opilione? Grazie mille!"
                Ehi {player_name}, eccoti cra!
                Scusa, ero preso dalla corrispondenza.
                Mi passa tra poco la carpa del pomeriggio, e quella è pignola con la posta.
                Come si dice? Cerca sempre la squama nel batterio.
                O era il batterio nella salamandra?
                No, quella era la parola segreta per il karaoke di cugina Sputt.
                Cugina è una che canta benissimo, girino!
                Ha una voce così forte che a volte vengono a lamentarsi anche i topi della biblioteca.
                E a proposito di biblioteca!
                Ho visto che ti sei mess{player_pronouns has him:o|{player_pronouns has her:a|ə}} a leggere qualche racconto!
                Un po' ti invidio: se tocco la carta i libri si rovinano.
                Però la nostra amica comune a volte mi legge qualche storia.
                La mia preferita è quella del principe ranocchio.
                Quando lei lo bacia e le vengono tutte le verruche.
                    {
                        - are_two_entities_together(FirstCharacter, PG):
                            Onesto.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                    }
                Gli umani dovrebbero imparare a lasciarci in pace.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    {
                        - are_two_entities_together(SecondCharacter, PG):
                            Anche io?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                            {
                                - frog_and_second_char_chit_chat:
                                    Ma abbiamo già detto che tu sei una rana, {charNameTwo}!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                                - else:
                                    Mmm.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                                    Io non sono sicuro che tu sei un umano.
                                    Sei troppo basso.    
                            }
                            Ma quando sei qui mi diverto tanto.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                            Quindi sono in pace.
                        
                    }
                E a proposito di pace: vediamo come posso aiutarti!
                    -> frog_about_who_questions                        
        }
     

        {
            - frog_availableCommonMissions == ():
                Mmm.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                Non ho molto da chiederti ora.
                Ma come dice sempre zia Graaak: non è una scusa per lavarsene le zampette.
                Quindi, vediamo come ti posso aiutare!
                    -> frog_about_who_questions 
                
            - else:
                -> missions_dispatcher
            
        }

->->




=== missions_dispatcher ===
{debug_frog: passo da missions_dispatcher.}
{debug_frog: frog_aboutGiftRequest == {frog_aboutGiftRequest}.}
//Alla fine le missioni sono scollegate dai doni, e sono letteralmente scritte secondo bisogno.
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    ~ temp maxRandomDice = 0

        - (top)
        //Dato che no mi fa fare questa cosa direttamente nella variabile, provo così.
        //~ frog_maxValueRandomMissionDice = LIST_COUNT(frog_allMissions)
        
        //Tiro il dado
        ~ frog_randomMissionDice = RANDOM(1,8)

        
        {frog_randomMissionDice:
        
            - 1 && frog_availableCommonMissions has missionOne && LIST_COUNT(greenhouse_backupCultivable) < 12:
                -> mission_one
            - 2 && frog_availableCommonMissions has missionTwo:
                -> mission_two
            - 3 && frog_availableCommonMissions has missionThree:
                -> mission_three
            - 4 && frog_availableCommonMissions has missionFour:
                -> mission_four
            - 5 && frog_availableCommonMissions has missionFive && (firstChar_storyStatus == story_storyStarted) && (secondChar_storyStatus == story_storyStarted):
                -> mission_five
            - 6 && frog_availableCommonMissions has missionSix && ((firstChar_storyStatus == story_storyEnded) or (secondChar_storyStatus == story_storyEnded) or (thirdChar_storyStatus == story_storyEnded)):
                -> mission_six
            - 7 && frog_availableCommonMissions has missionSeven && (contentsTrainStop has FirstCharacterNotes) or (contentsTrainStop has SecondCharacterNotes):
                -> mission_seven
            - 8 && player_accessiblePlaces has Library:
                -> mission_eight
            - else:
                {debug_frog: il valore di frog_randomMissionDice è {frog_randomMissionDice}, e la missione associata è già stata fatta. Ritiro il dado.}
                
                {   
                    //Faccio in modo di tirare comunque un po' di volte il dado, se però non esce nulla dopo un po', a quel punto passo al piano b.
                    - maxRandomDice < 9:
                        ~ maxRandomDice ++
                            -> top

                                        //E il piano b è: se ci sono "normali" disponibili, ti dico comunque di tornare più tardi (è un problema di condizioni), altrimenti ti dico che hai ripulito tutto.     
      
                    - else:
                        {
                            - frog_availableCommonMissions != () && frog_availableSpecialMissions != ():
                                Naa {player_name}, per ora sono qui con le zampe in zampa.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                                Ma torna più tardi e mi invento qualcosa da farti fare!
                                    -> main
                            
                            - else:
                                Ehi {player_name}!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                                Hai fatto un lavoro così buono ma così buono, che non ho niente da farti fare.
                                Complimenti girino.
                                Ora non ti resta che riposare!
                                    -> main
                        }    

                }
                
                
        }
    
->->



=== closed_mission_verify
{debug_frog: passo da closed_mission_verify. Il valore di frog_currentMission è {frog_currentMission}.}
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
    {frog_currentMission:
        //Qui la logica da implementare sarà: se le condizione è stata risolta (es: nodo attraversato) allora svuoto frog_currentMission (~ frog_currentMission = ()) e tolgo la missione da frog_availableCommonMissions, e invio la giocatrice alla parte del dono, altrimenti ho un reminder che mi ricorda di fare la missione.
        - missionOne:
            {
                - first_character_recap.check && second_character_recap.check && greenhouse_recap.check:
                        
                        Ma sei un portento, girino!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                        Pensa che ero qui a dirmi "Servirebbe una persona con una bella testolina, più grande di quella di zia Torba."
                        "Una capace di leggere quasi quanto {charNameTwo}."
                            {
                                - are_two_entities_together(SecondCharacter, PG):
                                    Quasi però!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                                    Perché io sono il più megagrande lettore della scuola!
                            }
                        E tu hai già letto tante ma tante delle pagine del libro che ti è stato donato!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                        E come dico sempre: la conoscenza è sapere!
                        E il sapere è sapore per cui: dimmi come posso aiutarti.
                            ~ frog_currentMission = ()

                            -> frog_about_who_questions
                
                - else:
                        Ehi girino!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                        Ricordati di leggere un po' dal tuo libro magico.
                        Io ti aspetto qui.
                        Ma hai visto che bella che è questa rana riflessa nell'acqua?
                        Ciao bellezza!
                            -> main
            
            }
            
        - missionTwo:
            {
                - LIST_COUNT(greenhouse_backupCultivable) < 11:
                {debug_frog: backupColtivabili = {LIST_COUNT(greenhouse_backupCultivable)}}
                    
                    Dove l'ho messo di nuovo.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Ah eccolo!
                    Mi hanno scritto le formiche per dirmi che ti stai prendendo cura della serra!
                    Ed è una cosa grandiosa girino, e sai perché?
                    Io no.
                    Ah no, eccolo, me lo scrivono sempre le formiche.
                   "Avevamo fame."
                    Mi sembra una buona motivazione.
                        {
                            - are_two_entities_together(FirstCharacter, PG):
                                Il cibo è sempre una motivazione.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                        }
                    E a proposito di cose buone: vediamo come posso aiutarti!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                        ~ frog_currentMission = ()

                        -> frog_about_who_questions
                - else:
                        {player_name}! #speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                        Come sta andando con le piante della serra?
                        Torna qui quando ce ne saranno abbastanza per le formiche!
                            -> main            
            }
            
        - missionThree:
            {
                - mindfulness:
                    
                    Girino!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Mi hanno detto che hai chiesto a {mentorName} di darti qualche consiglio di benessere.
                    Come lo so?
                    Perché ora li sta dando a tutte le persone che incontra.
                        {
                            - are_two_entities_together(Mentor, PG):
                                Non a tutte tutte.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                                Però poi Franco ho una dritta per quella tensione muscolare!#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                        }
                    Tullio mi ha anche detto: "Franco, sei una brava persona, ma devi farti due domande prima di chiedere certe cose a {player_name}."#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Gli ho chiesto quali fossero le due domande, e lui mi ha baciato sulla testa.
                    E poi mi ha detto "Per fortuna che sei simpatico."
                    Ci amiamo così tanto.
                    Però ora {mentorName} è più felice.
                    E questo posto è un po' più felice.
                    E allora io ti rendo un po' più felice: dimmi come posso aiutarti.
                        ~ frog_currentMission = ()
                        -> frog_about_who_questions

                - else:
                    Ma ecco di nuovo qui il mio girino preferito!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Hai poi chiesto a {mentorName} come stare bene?
                        {
                            - are_two_entities_together(Mentor, PG):
                                Ma grazie Franco!#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                                Ho tantissimi consigli da dare a {player_name}!
                                {
                                    - are_two_entities_together(FirstCharacter, PG):
                                        Non ne dubitavo {mentorName}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                                }
                        
                        }
                    Intanto sistemo la posta arretrata.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Che poi se deve andare avanti, non dovrebbe essere "avanzata"?
                    Però non si muove.
                    Forse è quindi "posta fermata"?
                        -> main  
            }
            
        - missionFour:
            {
                - little_storylets:

                    Questa no.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Nemmeno questa.
                    {player_name}, tu non sai quanto sia bravo mio marito Tullio ad allungare lo stagno quando parla.
                    Non arriva mai al punto.
                     {
                        - are_two_entities_together(FirstCharacter, PG):
                            Perché tu arrivi sempre al punto, Franco.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                            Sì sì, sempre.#inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                            Preciso cone una mosca.
                            Non credo che.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                            Ah, lascia perdere.
                            Non perdo mai.#inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                            E Tullio non perde mai la parola.
                    }
                    Nemmeno sui bigliettini.#inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Ah, ecco qui.
                    "Ricordati di recuperare i gemelli al nido."
                    No, non era questo.
                    "Ricordati <b>davvero</b> di recuperare i gemelli al nido. Non come quella volta che sono tornati con l'anatra delle otto da soli."
                    "A proposito di anatre: le sorelle Qualqui vengono per cena. Mi prendi due etti di termiti e qualche seme? Ti amo."
                    Dall'arrivo dei gemelli ha un tritone per capello.
                    Avere centosedici figli non è una passeggiata.
                    Sempre meglio di zia Graaak, che ormai va per il migliaio.
                    Non hai idea del casino del ricordare tutti i compleanni, {player_name}!
                    Ma io dovevo dirti qualcosa.
                    Cosa?
                    Ah sì: che il gossip è importante.
                    Per cui grazie per aver parlato con {mentorName} delle cose insolite che hai incontrato.
                    Non sai quanto abbia bisogno quella donna di uscire dal suo guscio.
                    Per cui: vediamo come posso aiutarti!
                        ~ frog_currentMission = ()
                            -> frog_about_who_questions

                - else:
                    {player_name}!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Le mie spie mi hanno detto che ancora non hai raccontato stranezze a {mentorName}!
                        {
                            - are_two_entities_together(Mentor, PG):
                                Stranezze?#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                        }
                    Uh, non ho davvero delle spie.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Giusto qualche girino.
                    E Dora l'ape.
                    E la nostra amica che a volte mi aiuta a capire meglio le cose.
                        -> main  
            }        
        
        - missionFive:
            {
                //TODO: per questa come condizioni mettere anche le altre storie condivise
                - first_second_chit_chat:
                    Avannotti!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Era "avannotti".
                    Non "ananassi."
                    Franco, hai sempre la testa tra le alghe.
                    Cosa buffa, {player_name}.
                    Prima mio marito Tullio e l'altro marito, Giulio, stavano parlando di una partita di pallanuoto tra ananassi.
                    E, girino, quanto ero confuso!
                    Però a volte ho paura di sembrare tonto come una conchiglia, e quindi non chiedo nulla.
                    Invece sono contento che prima hai partecipato alla conversazione tra {charNameOne} e {charNameTwo}, girino.
                         {
                            - are_two_entities_together(FirstCharacter, PG):
                                Ci stavi spiando quindi?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                        }                        

                    Non hai avuto paura di dire una cosa e sembrare stupid{player_pronouns has him:o|{player_pronouns has her:a|ə}}!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                        {
                            - are_two_entities_together(SecondCharacter, PG):
                                La nonna dice sempre che non ci sono domande stupide ma solo risposte sbagliate.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                        }
                    Quindi: non essere come Franco. E se vedi due persone vicine, prova ancora a chiacchierare con loro.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Però una partita tra ananassi io me la guarderei.
                    Dopo lo dico a Giulio, magari ne esce qualcosa.
                    Come quella volta che abbiamo tirato su una band.
                    Ci chiamavamo Depeche pond.
                    Ma non è stata una bella idea quella di mettere gli amplificatori in acqua.
                    I ricci sono ancora arrabbiati con noi.
                    Ma devo aiutarti, mannaggia alla mia distrazione.
                    Zio Gracco lo dice sempre: Franco!
                    Zio Gracco è un rospo di poche parole.
                        ~ frog_currentMission = ()
                            -> frog_about_who_questions

                - else:
                    Girino, sapevi che se metto la zampa nell'acqua si spezza?speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Ma se poi la tiro fuori, è intera!
                    Questa è magia!
                    Continuo a studiare questa cosa mentre tu provi a parlare assieme a {charNameOne} e {charNameTwo}.
                        {
                            - are_two_entities_together(FirstCharacter, PG):
                                In che senso scusa?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
                                In senso diagonale, vedi?#inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                                Ora la zampa è dritta.
                                Ora è in acqua ed è spezzata!
                        }
                    Se scopro come succede potrei cambiare il mondo!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    E tutti un giorno parleranno di Franco la rana!
                        -> main  
            }         
        
        - missionSix:
            {
                - witch_intro:
                    Girino!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Ho saputo che finalmente hai parlato con la nostra amica comune!
                    E tu dirai: "Ma Franco, come fai a sapere sempre tutto?"
                    E io ti dirò: "Ma Franco è sempre la prima ruota del gatto, ovvio che sa tutto!"
                    E tu dirai: "Ma i gatti non hanno le ruote."
                    E allora io dirò: "I gatti hanno tante cose, ma non ce le vogliono fare sapere!"
                    E poi ti dirò: "Una volta ho conosciuto un gatto con un buffo cappello in testa."
                    E quando gli ho chiesto: "Giovandomenico, ma cosa ci fai con un cappello così in testa?"
                    Lui mi ha detto: "Meow!"
                    I gatti sono così saggi.
                    Ma zia Graaak dice sempre: tanto va la gatta allo stagno, che ci rimette il girino.
                    Uh, una lettera di Tullio.
                    "Franco, di a quel{player_pronouns has her:la|lə} pover{player_pronouns has him:o|{player_pronouns has her:a|ə}} {player_name} quello che devi dir{player_pronouns has him:gli|{player_pronouns has her:le|lə}}!"
                    Uh, è sempre così nervoso.
                    Comunque {player_name}: sono felice che hai parlato con chi sai tu.
                    Perché il lavoro che fai è molto delicato.
                    Molto.
                    Ed è bello avere una guida, un'alleata così saggia.
                    <i>La saggezza ha molte facce, e una porta il volto di Franco.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState #portrait: {witch_state()}
                    E ora quindi è il mio momento di aiutarti.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                        ~ frog_currentMission = ()
                            -> frog_about_who_questions

                - else:
                    Parla con la nostra amica comune, girino.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Intanto resterò qui a scrivere una lettera di scuse a Tullio e Giulio.
                    "Cari miei amori. Prometto di non dimenticare mai mai più i gemelli al nido..."
                        -> main  
            } 
        
        - missionSeven:
            {
                - first_character_notes.check or second_character_notes.check:
                    I gemelli stanno facendo lo sciopero del sonno.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    A fatica mi ricordo il mio nome.
                    E tutto perché Giulio non vuole prendergli un cane.
                        {
                            - are_two_entities_together(SecondCharacter, PG):
                                Anche io voglio un caneeeeeeeeeeeeee!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                                Allora sciopera coi gemelli!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                        }
                    Comunque è sempre colpa di Dora l'ape.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Quella passa il tempo a svolazzare in giro, e poi se ne sta lì sulla riva a bere acqua e raccontare cose.
                    E ha detto ai gemelli del cane alla fermata del treno.
                    Scusa, sono arrabbiato.
                    Dora è una brava ape, buona come l'alga.
                    Ma ho sonno!
                    E l'altra sera l'ho detto ai gemelli.
                    Li ho fatti sedere tutti e centosedici in cerchio.
                    "Un cane non sa respirare sott'acqua, punto."
                    Ma poi Euforbo, che è il più sveglio dei gemelli, ha un mese e mezzo ma sta già nella classe dei tre mesi, mi dice: "Papà, siamo anfibi."
                    "E quindi?" gli chiedo, sperando solo di andare a dormire.
                    "E quindi sappiamo respirare fuori dall'acqua, papà Franco!"
                    E la sorpresa, {player_name}!
                    Non ci avevo mai pensato, ma respiro fuori dall'acqua!
                        {
                            - are_two_entities_together(FirstCharacter, PG):
                                Franco, ma tu come ci sei arrivato all'età adulta?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                                Un po' a piedi, un po' col treno.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                        }
                    E il mondo ora mi sembra così grande.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    E pieno di possibilità.
                    Come quella di avere un cane.
                    Ora sto scioperando anche io coi gemelli.
                    Ma non sai quanto ho sonno!
                    E Dora mi ha detto che hai conosciuto il cane del treno!
                    E allora io ti aiuterò con il tuo lavoro.
                    Così magari Giulio capisce che sono un bravo girino, e ci prende il cane!
                        ~ frog_currentMission = ()
                            -> frog_about_who_questions

                - else:
                    Girino!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Come diceva Gambusia de Filippi: c'è fitoplancton per te.
                    Uh, forse non c'entra molto.
                    Fammi sapere quando hai letto la lettera che ti aspetta alla stazione dei treni.
                        -> main  
            }
        
        - missionEight:
            {
                - library_readStories != ():
                     "Caro zio Gracco."#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    "La algonara è stata inventata nemmeno cento schiuse fa."
                    "Quindi se ci metto la panna no, non è un crimine contro lo stagno."
                    "Tuo nipote Franco."
                    "PS: potresti tenere i gemelli sabato? Vorrei andare alla partita degli ananassi con Tullio e Giulio. Grazie mille."
                    "PPS: non è che mi passeresti anche la ricetta per la frittura di opilione? Grazie mille!"
                    Ehi {player_name}, eccoti cra!
                    Scusa, ero preso dalla corrispondenza.
                    Mi passa tra poco la carpa del pomeriggio, e quella è pignola con la posta.
                    Come si dice? Cerca sempre la squama nel batterio.
                    O era il batterio nella salamandra?
                    No, quella era la parola segreta per il karaoke di cugina Sputt.
                    Cugina è una che canta benissimo, girino!
                    Ha una voce così forte che a volte vengono a lamentarsi anche i topi della biblioteca.
                    E a proposito di biblioteca!
                    Ho visto che hai ascoltato il mio consiglio e hai letto qualche racconto!
                    Un po' ti invidio: se tocco la carta i libri si rovinano.
                    Però la nostra amica comune a volte mi legge qualche storia.
                    La mia preferita è quella del principe ranocchio.
                    Quando lei lo bacia e le vengono tutte le verruche.
                        {
                            - are_two_entities_together(FirstCharacter, PG):
                                Onesto.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                        }
                    Gli umani dovrebbero imparare a lasciarci in pace.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                        {
                            - are_two_entities_together(SecondCharacter, PG):
                                Anche io?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                                {
                                    - frog_and_second_char_chit_chat:
                                        Ma abbiamo già detto che tu sei una rana, {charNameTwo}!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                                    - else:
                                        Mmm.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                                        Io non sono sicuro che tu sei un umano.
                                        Sei troppo basso.    
                                }
                                Ma quando sei qui mi diverto tanto.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                                Quindi sono in pace.
                    }
                    E a proposito di pace: vediamo come posso aiutarti!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                        ~ frog_currentMission = ()
                            -> frog_about_who_questions
                            
                - else:
                    {player_name}, continuano ad arrivarmi lettere dai topi della biblioteca. #speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Non è che riesci a farci un salto e smuovere qualche racconto?
                    Intanto scelgo la canzone per il prossimo karaoke.
                    Quasi quasi a questo giro porto "Il ballo del cra cra".
                    O "Craande, Craande, Craande".
                    Oppure ripasso anche il balletto con Tullio e Giulio e ci rifacciamo "Craak!... I did it again".
                        -> main  
            }
        
  
    
        //Le missioni speciali risolvono il dono direttamente, senza andare a frog_about_who_questions
        - specialMissionOne:
            {
                - special_mission_one_dialogue:
                    Hai assistito alla discussione tra Riccio e Mentore, {player_name}.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    {
                        - special_mission_one_dialogue.not_intervention:
                            E hai deciso di non intervenire.
                        
                        - special_mission_one_dialogue.pro_mentor:
                            E scelto Wicked: dillo a Fabio!
                        
                        - special_mission_one_dialogue.pro_riccio:
                            E scelto Attack of Titan, lovvo.
                        
                        - special_mission_one_dialogue.disagree:
                            E hai optato per The Lady: tu si che capisci il mondo.
                        
                        - special_mission_one_dialogue.paracula:
                            E hai proposto Attack of The Wicked: discutibile.
                    }
                L'armonia è importante.
                Per questo ti dono una nota, che troverai al Nido.
                    ~ move_entity(aetherGlyph, Nest)
                    ~ frog_currentMission = ()
                    ~ frog_aboutGiftRequest = ()
                    //Metto in pausa le missioni speciali
                    ~ frog_pauseSpecialMission = frog_pauseSpecialMissionMax
                    -> main
                    
                - else:
                Ricorda {player_name}: ascolta la discussione tra Mentore e Riccio.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    E poi torna da me.
                    -> main
            }
            

        
        - else:
            //Vuol dire che non ci sono missioni attive e posso proporne di nuove, se la rana non risulterà stanca
            {
                //Ma voglio evitare questa cosa per la prima missione.
                - !missions_dispatcher:
                    //andiamo a vedere se ci sono state missioni compiute in autonomia
                        -> autonomy_mission_verify
                    
                - else:
                    -> tired_frog 
            }
    }
->->

=== tired_frog
{debug_frog: passo da tired_frog.}
 ~ temp dice = RANDOM(1,5)
 
{
    - frog_tiredValue > 0:
        -> top
        
    - dice == 5:
        ~ frog_tiredValue = frog_maxTiredValue
            -> top
    
    - else:
        //andiamo a vedere se ci sono state missioni compiute in autonomia
        -> autonomy_mission_verify
              
}
    
- (top)

    Girino! #speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
    Franco è stanchino ora.
    Torna più tardi e provo a darti una zampa.
    Basta che poi me la restituisci, sennò non so come grattare la schiena di zio Gracco.

-> main


=== cultivable_recovery
{debug_frog: passo da cultivable_recovery.}
Vorrei recuperare...#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral

    + {frog_recoverableCultivables has BaccaDellaAddolorata} ...{ingredientTranslator(BaccaDellaAddolorata)}.
            ~  frog_aboutGiftRequest = missionObjects
            ~  frog_cultivableRequested = BaccaDellaAddolorata
            ~  frog_recoveredCultivables += BaccaDellaAddolorata
            -> frog_gift_dispatcher
            
    + {frog_recoverableCultivables has BarbaDellInciampo} ...{ingredientTranslator(BarbaDellInciampo)}.
            ~  frog_aboutGiftRequest = missionObjects
            ~  frog_cultivableRequested = BarbaDellInciampo
            ~  frog_recoveredCultivables += BarbaDellInciampo
            -> frog_gift_dispatcher
            
    + {frog_recoverableCultivables has BastoneDellOzioso} ...{ingredientTranslator(BastoneDellOzioso)}.
            ~  frog_aboutGiftRequest = missionObjects
            ~  frog_cultivableRequested = BastoneDellOzioso
            ~  frog_recoveredCultivables += BastoneDellOzioso
            -> frog_gift_dispatcher
            
    + {frog_recoverableCultivables has BrinaDellImpossibile} ...{ingredientTranslator(BrinaDellImpossibile)}.
            ~  frog_aboutGiftRequest = missionObjects
            ~  frog_cultivableRequested = BrinaDellImpossibile
            ~  frog_recoveredCultivables += BrinaDellImpossibile
            -> frog_gift_dispatcher
            
    + {frog_recoverableCultivables has CantoDelleCompagne}  ...{ingredientTranslator(CantoDelleCompagne)}.
            ~  frog_aboutGiftRequest = missionObjects
            ~  frog_cultivableRequested = CantoDelleCompagne
            ~  frog_recoveredCultivables += CantoDelleCompagne
            -> frog_gift_dispatcher
            
    + {frog_recoverableCultivables has CardoAspinato} ...{ingredientTranslator(CardoAspinato)}.
            ~  frog_aboutGiftRequest = missionObjects
            ~  frog_cultivableRequested = CardoAspinato
            ~  frog_recoveredCultivables += CardoAspinato
            -> frog_gift_dispatcher
            
    + {frog_recoverableCultivables has EderaDelleAmanti} ...{ingredientTranslator(EderaDelleAmanti)}.
            ~  frog_aboutGiftRequest = missionObjects
            ~  frog_cultivableRequested = EderaDelleAmanti
            ~  frog_recoveredCultivables += EderaDelleAmanti
            -> frog_gift_dispatcher
            
    + {frog_recoverableCultivables has ErbaLiccia} ...{ingredientTranslator(ErbaLiccia)}.
            ~  frog_aboutGiftRequest = missionObjects
            ~  frog_cultivableRequested = ErbaLiccia
            ~  frog_recoveredCultivables += ErbaLiccia
            -> frog_gift_dispatcher
            
    + {frog_recoverableCultivables has FalsaPalude} ...{ingredientTranslator(FalsaPalude)}.
            ~  frog_aboutGiftRequest = missionObjects
            ~  frog_cultivableRequested = FalsaPalude
            ~  frog_recoveredCultivables += FalsaPalude
            -> frog_gift_dispatcher
            
    + {frog_recoverableCultivables has LanaNotturna} ...{ingredientTranslator(LanaNotturna)}.
            ~  frog_aboutGiftRequest = missionObjects
            ~  frog_cultivableRequested = LanaNotturna
            ~  frog_recoveredCultivables += LanaNotturna
            -> frog_gift_dispatcher
            
    + {frog_recoverableCultivables has LicheneDegliAbissi} ...{ingredientTranslator(LicheneDegliAbissi)}.
            ~  frog_aboutGiftRequest = missionObjects
            ~  frog_cultivableRequested = LicheneDegliAbissi
            ~  frog_recoveredCultivables += LicheneDegliAbissi
            -> frog_gift_dispatcher
            
    + {frog_recoverableCultivables has NonTiScordarDiTe} ...{ingredientTranslator(NonTiScordarDiTe)}.
            ~  frog_aboutGiftRequest = missionObjects
            ~  frog_cultivableRequested = NonTiScordarDiTe
            ~  frog_recoveredCultivables += NonTiScordarDiTe
            -> frog_gift_dispatcher
            
    + {frog_recoverableCultivables has Olobino} ...{ingredientTranslator(Olobino)}.
            ~  frog_aboutGiftRequest = missionObjects
            ~  frog_cultivableRequested = Olobino
            ~  frog_recoveredCultivables += Olobino
            -> frog_gift_dispatcher
            
    + {frog_recoverableCultivables has LaSpazzata} ...{ingredientTranslator(LaSpazzata)}.
            ~  frog_aboutGiftRequest = missionObjects
            ~  frog_cultivableRequested = LaSpazzata
            ~  frog_recoveredCultivables += LaSpazzata
            -> frog_gift_dispatcher
            
    
    + Ho cambiato idea
        -> frog_about_who_questions
    
           



=== witch_frog_mission_notifier
//Questa è la notifica della "strega" se chiudiamo una missione
{debug_frog: passo da witch_frog_mission_notifier.}
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
    {
        - frog_witch_notification == false:
            {
                - frog_currentMission has missionOne:
                    {
                        - first_character_recap.check && second_character_recap.check && greenhouse_recap.check:
                            -> notification
                        
                        - else:
                            ->->
                    }
                    
                - frog_currentMission has missionTwo:
                    {
                        - LIST_COUNT(greenhouse_backupCultivable) < 11:
                            -> notification
                        
                        - else:
                            ->->    
                    }
                    
                - frog_currentMission has missionThree && mindfulness:
                    -> notification
                       
                - frog_currentMission has missionFour && little_storylets:
                    -> notification       
        
                - frog_currentMission has missionFive && first_second_chit_chat:
                    -> notification 
               
                
                - frog_currentMission has missionSix && witch_intro:
                    -> notification
            
                - frog_currentMission has missionSeven:
                    {
                        - first_character_notes.check or second_character_notes.check:
                            -> notification
                        
                        - else:
                            ->->    
                    }
                
                - frog_currentMission has missionEight && library_readStories != ():
                    -> notification
                
                - frog_currentMission has specialMissionOne && special_mission_one_dialogue:
                    -> notification
                    
                - frog_currentMission has specialMissionTwo && cooking_alone :
                    -> notification
                    
                    
                - else:
                    ->->
            }
        
        - else:
            ->->    
}



= notification
<i>{player_name} ha soddisfatto la richiesta fatta da Franco La Rana.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState #portrait: {witch_state()}
        ~ frog_witch_notification = true
-> main

=== special_mission_pause_check
{debug_frog: passo da special_mission_pause_check.}    
{debug_frog: il valore di frog_pauseSpecialMission è {frog_pauseSpecialMission}.}    
    {
        - frog_pauseSpecialMission > 0:
            ~ frog_pauseSpecialMission --
        {debug_frog: il valore di frog_pauseSpecialMission è {frog_pauseSpecialMission}.}    
    }
->->