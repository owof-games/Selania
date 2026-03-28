//Tutorial sul game play principale

=== tutorial_carlaChoicesRelationshipStorylet ===

    {
        - tutorial_carlaChoicesRelationshipStorylet > 1:
            Le ricordo che ripeto sempre lo stesso script della prima volta, ok?#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_neutral
    }
    
    Perché non sono andata a vivere nei boschi da sola, quando avevo vent'anni, perché?#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_sad
    Non risponda, è una domanda retorica, e l'ufficio domande retoriche è al 5° piano, stanza 13.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored
    Sono qui per dirle al volo cosa deve fare.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_neutral
    Il perché non è di mia competenza.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored

        {
            - tutorial_carlaChoicesRelationshipStorylet > 1:
                -> top2
            - else:
                -> top1    
        }

    - (top1)
    Vuole sentire, la spiegazione?#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_neutral
        + Certo!
            Anche meno entusiasmo.
        + Passo.
            Meglio per me.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_happy
            Le ricordo che l'ufficio Incidenti e Svenimenti è chiuso fino a data indefinita.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored
                {
                    - entity_location(Carla) != Forest:
                        ~ move_entity(Carla, Forest)
                }
                -> main
        -


    - (top2)
    Lei deve parlare con le persone che trova qui in giro.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_sad
    Le diranno cose più o meno personali, e si aspetteranno da lei una risposta.
    La risposta influenzerà il modo in cui quella persona la vede.
    Facciamo una prova.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_neutral
    Ora le racconto una cosa, e lei mi dà la sua opinione.
    Mio figlio dice che a sessant'anni devo smetterla di farmi la cresta viola.
    Gli ho risposto che ha quarant'anni e che ancora non sa lavarsi le mutande da solo.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_neutral
    Questo fa di me una cattiva madre?#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored
        + No.
            ~ tutorial_CarlaRelationshipIndicator ++
        + Sì.
            ~ tutorial_CarlaRelationshipIndicator --
        + No.
            ~ tutorial_CarlaRelationshipIndicator ++
        + No.
            ~ tutorial_CarlaRelationshipIndicator ++
        + No.
            ~ tutorial_CarlaRelationshipIndicator ++
        -
    {
        - tutorial_CarlaRelationshipIndicator < 0:
            Questo è un problema suo.
            Se ha delle lamentele, deve fare richiesta scritta.
        
        - else:
            Concordo.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_happy
            Non che me ne importi molto della sua opinione.    
    }
    Come avrà notato, l'indicatore sotto il mio ritratto è cambiato.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_neutral
    Se parla con una persona, e quella persona ha un indicatore sotto al ritratto, vuol dire che l'idea che quella persona si farà di lei è importante per il suo lavoro.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_sad
    Ora disattivo il mio, non voglio che veda quanto mi sta infastidendo.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored
    Le scelte saranno più complesse di quelle dell'esempio, e ogni scelta rappresenta una cosa diversa.
    Cosa?
    Lo chieda all'addetta alla discarica, se non è di nuovo in malattia.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored
    Sono tenuta infine a ricordarle che ogni persona ragiona in modo diverso, per cui dovrà capire da sé cosa apprezza o meno chi ha davanti.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_neutral
    Per facilitarle il lavoro, l'ufficio centrale ha inserito nel suo libro un riepilogo delle scelte fatte, con questo indicatore grafico.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_happy
    Lo troverà sotto il ritratto di ogni personaggia con cui dovrà lavorare.
    Tiene traccia dell'ultima e penultima scelta fatte, così può monitorare da sé le variazioni, senza stressare me.
    {
        - not tutorial_mentorTalkingChoiceRelationship:
            Non ha ancora il suo libro?#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_sad
            Strano, di solito lo consegnano in automatico all'arrivo.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_neutral
            Ma qui non possiamo fare niente per aiutarla.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored  
    }

    E ora sono in pausa.
    Vada a fare le sue cose.
    //Resetto, così se viene richiamato più avanti riparte da capo
        ~ tutorial_CarlaRelationshipIndicator = 0

    {
        - entity_location(Carla) != Forest:
            ~ move_entity(Carla, Forest)
    }


->->




=== tutorial_carlaRereadingStorylet ===
    
    Questa roba è di competenza di quelli dell'amministrazione centrale, non mia.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored
        {
            - tutorial_carlaRereadingStorylet > 1: 
                Ripetiamo la pappardella.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored
        }
    Sto per spiegarle come funziona la riscrittura.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_neutral
        {
            - tutorial_carlaChoicesRelationshipStorylet > 1:
                -> top2
            - else:
                -> top1    
        }

    - (top1)    
    Vuole ascoltare?#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_sad
        + Con piacere!
            Dubito.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored
        + No, grazie.
            Saggia scelta.
            Per me per lo meno.
                {
                    - entity_location(Carla) != Forest:
                        ~ move_entity(Carla, Forest)
                }
                -> main
        -

    - (top2)        
    Sbrighiamoci.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_angry
    Non so se gliel'hanno già detto, ma lei è qui per aiutare le persone a trovare un nuovo nome.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_neutral
    Perché?
    Non ne ho idea, io eseguo solo le indicazioni del ministero.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored
    Quando avrà conosciuto abbastanza una persona, potrà proporle di rileggere la sua storia e scegliersi un nuovo nome.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_neutral
    Quindi.
    Uno: dice alla persona una cosa tipo "Ti va di rileggere la tua storia con me?".#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_happy
    Due: prima della riscrittura, la persona le dirà quello che pensa di lei.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_sad
    Tra relazione e doni può ricevere da zero a quattro gocce di inchiostro.
    Non una di più, c'è scritto anche sul sito.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored
    Tre: a quel punto lei avrà diritto al suo monologo per dimostrare alla persona che la conosce davvero bene.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_neutral
    Più inchiostro ha accumulato, più cose potrà dire, facendo riferimento alle confidenze fatte da quella persona.
    Quindi: più inchiostro uguale lavoro più facile.
    Perché?
    Perché le persone sono insicure, e devi sempre spiegargli le cose mille volte mentre tu vorresti solo andare a casa coi gatti e la switch.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_happy
    E quando sono insicure, chiedono troppi perché.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_angry
    Sono tenuta comunque a ricordarle che anche se potrà fare la riscrittura dopo, che ne so, sette chiacchierate, le può convenire continuare a conoscere meglio la persona, prima di iniziare il processo.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_neutral
    Anche perché poco dopo la riscrittura, quella persona se ne andrà.
    Non mi chieda dove, perché non è di mia competenza.
    Ah, dimenticavo!
    Le scelte fatte durante la riscrittura hanno un valore molto più alto di quelle durante il resto del vostro rapporto.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_happy
        {
            - player_accessiblePlaces has Nest: 
                E questa cosa è importante da considerare se dovesse avere dei sigilli attivi.
            - else:
                Se lo ricordi, soprattutto se dovesse usare qualcosa che modifica le sue prestazioni.    
        }
    Ma in questo posto non arriva mai il venerdì?#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored
    

->->


//Tutorial sulle interfacce

=== tutorial_carlaInterfaceStorylets ===

    Ma quando mi finisce il turno?#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_angry
    {
        - tutorial_carlaInterfaceStorylets > 1:
            Ripeterò le cose esattamente come la prima volta, voglio brucare in santa pace.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored
    }
    Sono Carla, e prima di entrare in Selanìa devo dirle cinque cose su come muoversi in questi luoghi.
        {
            - tutorial_carlaChoicesRelationshipStorylet > 1:
                -> top2
            - else:
                -> top1    
        }

    - (top1) 
    Iniziamo?#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_sad
        + Non vedo l'ora.
            Buffo.
            Anche io non vedo l'ora che finisca il mio turno.
        + So già tutto, grazie.
            Allora mi spieghi perché a sessant'anni sono ancora in questo ufficio.
            Buona continuazione.
                {
                    - entity_location(Carla) != Forest:
                        ~ move_entity(Carla, Forest)
                }
                -> main
        -

    - (top2)    
    Prenda appunti perché odio ripetermi.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored
    Uno: può utilizzare mouse, tastiera e controller, e passare da uno strumento all'altro.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_neutral
    Col mouse basta passare sopra le cose che deve toccare, e cliccare.
    Idem con il controller.
    Con la tastiera può anche usare i numeri per le scelte.
    Quali scelte?
    Per risponderle serve il documento 13/12 in doppia coppia e la marca da bollo.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored
    Seconda informazione: quello che può toccare ha un bordo nero.
    Se sa parlare, si ferma quando lo sfiora.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_happy
    Se non sa parlare, si muove quando lo sfiora.
    E il cursore cambia.
    Cos'è un cursore?
    Forse lo sanno all'ufficio accanto.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored
    Terza informazione: in camera troverà un citofono.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_neutral
    Lo può usare per modificare le impostazioni.
    Più avanti le daranno un libro.
    Potrà trovare il citofono anche nel libro.
    Perché un citofono nel libro?
    Direttive dalla sede centrale.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored
    Quarta informazione: quello che fa viene salvato in automatico.
    Se vede questa icona, non deve fare niente.
    Non è difficile.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_angry
    Quinta informazione: se qualcosa va storto <>
            {
                - settings_gamerMode:
                    può tornare indietro nel tempo cliccando questa icona.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_happy
                    Appena le daranno il libro.

                - else:
                    trova questa icona nelle impostazioni.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_happy
                    La farà viaggiare nel tempo.
                    Come?
                    Non siamo autorizzate a dare spiegazioni.
            }
    Infine dovrei spiegarle il sistema di relazioni.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_sad
    Ma non è di mia competenza.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_happy
    {
        - entity_location(Carla) != Forest:
            Lo sportello chiude.
    }
    

->->

=== tutorial_carlaGrimoireStorylet ===

        {
            - tutorial_carlaGrimoireStorylet > 1: 
                Per fortuna questa è breve.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored
        }

    Ha finalmente ricevuto il suo Grimorio.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_neutral
    Festa.
    Rumore di trombette.
    Espressione di gioia.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_happy
    Altra espressione di gioia.
    Basta.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored
    Alcune informazioni pratiche sul Grimorio, gentilmente offerte dal Ministero.
        {
            - tutorial_carlaChoicesRelationshipStorylet > 1:
                -> top2
            - else:
                -> top1    
        }

    - (top1)     
    Le vuole ascoltare?
        + Gliene sarei grat{player_pronouns has him:o|{player_pronouns has her:a|ə}}.
            Se sapesse le cose che penso di lei, non mi sarebbe grat{player_pronouns has him:o|{player_pronouns has her:a|ə}} di nulla.
        + Non importa.
            Siamo in due.
            Sono tenuta giusto a ricordarle che il Ministero la riterrà responsabile di ogni uso sconsiderato del Grimorio.
                {
                    - entity_location(Carla) != Forest:
                        ~ move_entity(Carla, Forest)
                }
                -> main
        -

    - (top2)    
    Che gentilmente potrebbe pagarmi di più.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_happy
    Quando apre il grimorio vedrà due pagine.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_neutral
    A destra troverà alcune informazioni utili per il suo lavoro, mentre a sinistra è presente l'indice.
    L'indice serve per portarla ai vari capitoli del Grimorio, che di solito raccolgono informazioni su un luogo o una persona.
    Se c'è un bottone, può cliccarlo per andare al relativo capitolo.
    Se c'è un lucchetto, deve ancora scoprire quella voce.
    Alcuni capitoli possono avere delle sottosezioni, e la logica è la stessa: lucchetto uguale informazione bloccata.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_neutral
    Perché un lucchetto?
    La risposta non è di mia competenza.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored
    Ai lati del Grimorio troverà delle etichette.
    Servono per chiuderlo, per tornare verso l'indice, o per sfogliare le pagine.
    Infine, se vede questa icona, vuol dire che c'è una nuova informazione per lei.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_happy
    Se qualcosa non torna, può contattare la sezione Lamentele Inevadibili, al 9° piano.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored
    Se lo dimentica in giro, non posso garantirle che non ne mangerò le pagine.


->->


//Tutorial attivati da luoghi
=== tutorial_carlaGreenhouseGiftsInkStorylet ===
    {
        - tutorial_carlaGreenhouseGiftsInkStorylet == 1:
            ~ move_entity(Carla, Greenhouse)
    }

    Deve parlare con la responsabile.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored
        {
            - tutorial_carlaGreenhouseGiftsInkStorylet > 1:
                Abbiamo uno script da seguire, per cui non cambierò una virgola rispetto a prima.
        }
    Ah no scusi, è l'abitudine.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_neutral
    Mi è stato chiesto di spiegarle come funziona la serra.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_sad
        {
            - tutorial_carlaChoicesRelationshipStorylet > 1:
                -> top2
            - else:
                -> top1    
        }

    - (top1)     
    È pront{player_pronouns has him:o|{player_pronouns has her:a|ə}}?#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_neutral
        + Adoro le piante!
            Le assicuro che la cosa non è reciproca.
        + Non serve, ho il pollice verde.
            Allora dovrebbe fare segnalazione al Ministero per i Malanni Immaginari.
            Ottavo piano, a destra dopo l'ascensore guasto.
                {
                    - entity_location(Carla) != Forest:
                        ~ move_entity(Carla, Forest)
                }
                -> main
        -

    - (top2)    
    Ci fa crescere le piante ed è fatta.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_neutral
    Arrivederci.
    Mmm, ah.
    La responsabile dice che c'è fila in mensa, e devo ammazzare il tempo.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_angry
    Uno: se non sta crescendo niente, la serra le farà due domande, e lei deve rispondere come se la sente.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_neutral
    A quel punto inizierà a crescere una pianta.
    E dopo un po' potrà raccoglierne un pezzo.
    Perché uno solo?
    Perché sennò muoiono, no?#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_angry
    Due: alcune persone possono accettare in dono da parte sua una pianta.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_neutral
        {
            - player_accessiblePlaces has Kitchen:
                Oppure può usarle come ingrediente in cucina.
        }
    Per fare un dono basta dire alla persona: "Ehi, voglio donarti una cosa" o qualcosa del genere.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_happy
    A quel punto si aprirà il suo grimorio, e lei potrà scegliere quale pianta donare.
    Perché attraverso il grimorio?
    Ho aperto una pratica, le faremo sapere.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored
    Tre: il dono genera inchiostro.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_neutral
    Se ha fatto un dono moooolto apprezzato, riceverà due gocce di inchiostro.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_happy
    Se abbastanza apprezzato, una.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_neutral
    Altrimenti, zero.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_sad
    E no, non possiamo fare eccezioni, mi spiace.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored
    Si può fare un solo dono a persona, per cui valuti bene.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_neutral
    E non mi chieda perché, perché è sempre stato così.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored
    Quattro: a cosa serve l'inchiostro?#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_neutral
    Aspetti, ho in linea la mia responsabile.
    In che senso stanno finendo i germogli? #speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_angry
    Un po' di gramigna è rimasta?
    Volo!
    Ah: se rimane a stomaco vuoto, non è un problema di mia competenza.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored

        {
            - entity_location(Carla) != Forest:
                ~ move_entity(Carla, Forest)
                -> greenhouse_entry_check
        }

->->



=== tutorial_carlaKitchenStorylet ===

        {
            - tutorial_carlaKitchenStorylet == 1:
                ~ move_entity(Carla, Kitchen)
        }

        {
            - tutorial_carlaKitchenStorylet == 1:
                Quindi non ci stavano ampliando la mensa?!?#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored

            - else: 
                Perché ho sempre fame?#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_neutral
        }

    Sono qui per spiegarle come funziona questa cucina.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_happy
    Sperando sia più svegli{player_pronouns has him:o|{player_pronouns has her:a|ə}} di mio figlio.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored
        {
            - tutorial_carlaChoicesRelationshipStorylet > 1:
                -> top2
            - else:
                -> top1    
        }

    - (top1) 
    Accetta di ascoltare la mia spiegazione?#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_neutral
        + Ne ho proprio bisogno.
            È quello che temevo.
        + Non serve, sono laureat{player_pronouns has him:o|{player_pronouns has her:a|ə}} in Masterchef.
            Mmm.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_neutral
            Forse mio figlio è più sveglio di lei.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored
            Si ricordi che gli incidenti in cucina non sono coperti dall'assicurazione.
                {
                    - entity_location(Carla) != Forest:
                        ~ move_entity(Carla, Forest)
                }
                -> main
        -

    - (top2)    
    Uno: ogni persona cucinerà con lei solo una volta.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_neutral
    Perché?
    Il Ministero ha tagliato i fondi.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored
    Due: prima di cucinare, proporrà alla persona di approfondire un argomento che avete già affrontato.
    Ogni persona di solito ha tre argomenti a disposizione.
    Se ne vede meno, vuole dire che deve conoscere meglio quella persona per potergliene poi parlare.
    Tre: farà delle scelte, come sempre.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_neutral
    Ma la cucina è una pausa dal mondo, e per questo la persona le darà un feedback sull'impressione che si è fatta su di lei mentre cucinavate.
    Questo è molto utile per capire che tipo di rapporto state creando, e se ci sono correzioni da fare.
    Quattro: in cucina le persone le faranno domande personali.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_happy
    Potrà rispondere non a parole, ma aggiungendo ingredienti.
    Non ha senso?
    Prenda un appuntamento con la sezione Disprezzi e Disservizi.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored
    Cinque: opzionalmente potrà decidere di aggiungere come ingrediente una pianta coltivata in serra.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_happy
    Se la persona apprezzerà l'ingrediente, le dirà qualcosa di utile a capire meglio come ragiona.
    Non sono previsti rimborsi in caso di insuccesso.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored
    Non dovrei dirglielo, ma il signor Franco potrebbe aiutarla in caso di difficoltà.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_happy
    Perché?#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_neutral
    Perché è un bravo ranocchio.
    Perché è un bravo ranocchio?
    Non è di mia competenza.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored


        {
            - entity_location(Carla) != Forest:
                ~ move_entity(Carla, Forest)
                    -> main
        }

    
->->


=== tutorial_carlaSigilsActivationStorylet ===
~ temp charNameThree = translator(thirdChar_ActualName)

        {
            - entity_location(Carla) != Forest:
                ~ move_entity(Carla, Forest)
                ->->
        }

    Ma perché questi non si fanno mai i cavoli propri? #speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored
        {
            - tutorial_carlaSigilsActivationStorylet > 1:
                Devo recuperare il documento del Ministero.
        }

    Quindi {charNameThree} le ha aperto il Nido!
    Ma che gentile.
    Già.
    Mannaggia al.
        {
            - tutorial_carlaChoicesRelationshipStorylet > 1:
                -> top2
            - else:
                -> top1    
        }

    - (top1) 
    Vuole che le spieghi come funzionano i Sigilli?
        + Sarebbe magnifico.
            No.
            Magnifica è la pensione.
            Non questa mole immensa di scartoffie.
        + Preferisco imparare sul campo.
            È una scelta.
            Le ricordo che il numero verde per gli incidenti magici e le trasformazioni involontarie è fuori servizio dal millenovecentoottantaquattro.
                {
                    - entity_location(Carla) != Forest:
                        ~ move_entity(Carla, Forest)
                }
                -> main
        -
    - (top2)    
    Il Nido le sblocca i Sigilli, e i Sigilli sono una cosa pericolosa.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_happy
    Leggo direttamente dalla comunicazione ministeriale.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_neutral
    "Premesso che la Combinata Triglifica Esoterica Espansa (da qui in avanti per brevità chiamato Sigillo) è uno strumento di cui ancora conosciamo poco.
    Premesso che il Sigillo influenza il modo in cui viene percepito il parlante che lo attiva.
    Preso inoltre atto della necessità di utilizzare un Grimorio (da qui in avanti per chiarezza chiamato Libro Oscuro di Sapienza e Potere) per farne l'attivazione.
    E considerata infine la durata limitata di utilizzo di un sigillo (tre utilizzi, non ripetibili né combinabili).
    Il Ministero, con l'obiettivo di facilitare il lavoro dellə Riscrittorə, ha istituito il Servizio di Indicazione Stato Sigillo Integrato (SISSI).
    Qualora un sigillo fosse attivo, la SISSI sarà presente a ogni livello del Libro Oscuro di Sapienza e Potere attraverso la caratteristica animazione.
    La SISSI inoltre comparirà durante il dialogo con le persone che ne possono essere condizionate.
    Nel caso in cui un Sigillo fosse attivo e la SISSI non fosse presente durante il dialogo, questo significa che la persona non è in assoluto o in quel momento influenzabile dal potere del sigillo.
    Dopo l'aggiornamento 13.12c, la SISSI indica anche la quantità residua di utilizzi, costantemente aggiornata.
    Per sua natura invece il Libro Oscuro di Sapienza e Potere aggiornerà i descrittori del sigillo ad ogni utilizzo.
    La comprensione dei descrittori è fondamentale per ogni Riscrittorə per anticipare l'effetto e la portata dei sigilli.
    Altre informazioni non sono di nostra competenza."
    Questa conversazione poteva essere una mail.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored
    Vado in pausa sigaretta, anche se non fumo dall'Ottantaquattro.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_happy
    Ora dovrei spiegarle come crearli, ma purtroppo il sistema è fuori uso.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored
    E io ho dimenticato tutto.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_happy
    Sono solo una capra.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_neutral
    Bee.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_happy

->->


=== tutorial_carlaNestStorylet ===
~ temp charNameThree = translator(thirdChar_ActualName)

        {
            - tutorial_carlaNestStorylet == 1:
                ~ move_entity(Carla, Nest)
        }

        {
            - tutorial_carlaNestStorylet > 1:
                E quindi rispieghiamo i glifi. Che gioia!#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored
        }
  
    Ogni volta che vedo questi cosi mi chiedo perché non ho concluso la laurea in ingegneria.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_angry
        {
            - tutorial_carlaChoicesRelationshipStorylet > 1:
                -> top2
            - else:
                -> top1    
        }

    - (top1) 
    Le spiego i sassi, va bene?
        + Sassiiiiiiiiiiiiii!
            Anche meno, figliol{player_pronouns has him:o|{player_pronouns has her:a|ə}}.
            Anche meno.
        + Sassnooooooooooooo!
            Lei è amic{player_pronouns has him:o|{player_pronouns has her:a|ə}} di Franco, vero?
            Avrebbe dovuto dirmelo prima.
            Avrei evitato di sprecare il mio tempo.
                {
                    - entity_location(Carla) != Forest:
                        ~ move_entity(Carla, Forest)
                }
                -> main
        -

    - (top2)
    Questi sassi sono qui per creare i Sigilli, che abbiamo già visto quando il suo caro amico {charNameThree} ha deciso di aprire questo posto.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_neutral
    Uno: un sigillo utilizzabile è sempre composta da tre glifi.
    Non è sempre vero, ma il resto non è di mia competenza.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored
    Due: per creare un sigillo basta iniziare cliccando uno per volta i glifi a disposizione.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_happy
    Tre: un sigillo è composto da tre glifi diversi, per cui ogni volta che sceglierà un glifo, quello non sarà disponibile fino a nuova composizione.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_sad
    Quattro: Grimorio e glifi comunicano, e per questo i glifi si disattiveranno in automatico se non ci saranno nuove composizioni disponibili.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_neutral
    Cinque: il Ministero ha tracciato una quantità invereconda di glifi in giro per gli universi, e infiniti sigilli, ma per qualche motivo in questa zona ne funzionano solo.
    Uh, quanti erano?#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored
        {
            - LIST_COUNT(contentsNest) == 6:
                Boh, ne vedo tre qui, quindi immagino siano tre.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_happy
            - LIST_COUNT(contentsNest) == 7:
                Boh, ne vedo quattro qui, quindi immagino siano quattro.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_happy
            - LIST_COUNT(contentsNest) == 8:
                Cinque. Sì. Da queste parti funzionano solo cinque sigilli.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_happy

        }

    Se qualcosa non dovesse funzionare, non contatti me.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored
    Ah, dimenticavo: ogni volta che scoprirà un nuovo sigillo, verrà aggiunto in automatico sul grimorio.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_happy
    E potrà essere attivato in qualsiasi momento, se non c'è un sigillo già attivo.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_neutral
    Non chieda eccezioni: il sistema non lo permette.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored

    {
        - entity_location(Carla) != Forest:
            ~ move_entity(Carla, Forest)
            -> main
    }

    
->->


=== carla_achievements
Achievements Gamer Mode
achievements_oneRewrite: {achievements_oneRewrite}, {achievements_oneRewrite_text}
achievements_threeRewrite: {achievements_threeRewrite}, {achievements_threeRewrite_text}
achievements_fiveRewrite: {achievements_fiveRewrite}, {achievements_fiveRewrite_text}
achievements_fullKitchen: {achievements_fullKitchen}, {achievements_fullKitchen_text}
achievements_onePerfectIngredient: {achievements_onePerfectIngredient}, {achievements_onePerfectIngredient_text}
achievements_fivePerfectIngredients: {achievements_fivePerfectIngredients}, {achievements_fivePerfectIngredients_text}
achievements_onePerfectGift: {achievements_onePerfectGift}, {achievements_onePerfectGift_text}
achievements_fivePerfectGifts: {achievements_fivePerfectGifts}, {achievements_fivePerfectGifts_text}
achievements_fullFranco: {achievements_fullFranco}, {achievements_fullFranco_text}
achievements_allSigils: {achievements_allSigils}, {achievements_allSigils_text}
achievements_allLetters: {achievements_allLetters}, {achievements_allLetters_text}
achievements_fullGreenhouse: {achievements_fullGreenhouse}, {achievements_fullGreenhouse_text}

Achievements Reader Mode
achievements_goodListener: {achievements_goodListener}, {achievements_goodListener_text}
achievements_fullLore: {achievements_fullLore}, {achievements_fullLore_text}
achievements_goodReader: {achievements_goodReader}, {achievements_goodReader_text}


->->
