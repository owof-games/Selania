//Tutorial sul game play principale
=== tutorial_carlaChoicesRelationshipStorylet ===

{
    - tutorial_CarlaDiscoveredTutorials has tutorialChoicesRelationship:
        {charTag(Carla, "neutral")}:        Le ricordo che ripeto sempre lo stesso script della prima volta, ok?
}
    
    {charTag(Carla, "bored")}:              Perché non sono andata a vivere nei boschi da sola, quando avevo vent'anni, perché?
                                            Non risponda, è una domanda retorica, e l'ufficio domande retoriche è al 5° piano, stanza 13.
    {charTag(Carla, "neutral")}:            Mi chiamo Carla, e sono qui per dirle al volo cosa deve fare.
    - (nameDiscovered)
    {charTag(Carla, "bored")}:              Il perché non è di mia competenza.

        {
            - tutorial_CarlaDiscoveredTutorials has tutorialChoicesRelationship:
                -> top2
            - else:
                -> top1    
        }

    - (top1)
   {charTag(Carla, "neutral")}:                     Vuole sentire, la spiegazione?
        + \ {charTag(PG, "neutral")}:               Certo!
            {charTag(Carla, "bored")}:              Anche meno entusiasmo, che poi mi fanno fare gli straordinari.
        + \ {charTag(PG, "neutral")}:               Passo.
            {charTag(Carla, "happy")}:              Meglio per me.
            {charTag(Carla, "bored")}:              Le ricordo che l'ufficio Incidenti e Svenimenti è chiuso fino a data indefinita.
                -> carla_closing_storylet
        -


    - (top2)
    {charTag(Carla, "sad")}:                        Lei deve parlare con le persone che trova qui in giro.
                                                    Le diranno cose più o meno personali, e si aspetteranno da lei una risposta.
                                                    La risposta influenzerà il modo in cui quella persona la vede.
                                                    E anche il giudizio che hanno su di lei le persone presenti in quel momento.
    {charTag(Carla, "neutral")}:                    Facciamo una prova.
                                                    Ora le racconto una cosa, e lei mi dà la sua opinione.
        {
            - are_two_entities_together(FirstCharacter, PG) or are_two_entities_together(SecondCharacter, PG) or are_two_entities_together(ThirdCharacter, PG) or are_two_entities_together(FourthCharacter, PG) or are_two_entities_together(FifthCharacter, PG):
        {charTag(Carla, "bored")}:                  Per non complicarmi e complicarle le cose, durante questa prova le persone presenti non saranno influenzate dal suo commento.                                            
        }                                            
        ~ tutorial_CarlaRelationshipIndicator_enabled  = true

    {charTag(Carla, "neutral")}:                    Mio figlio dice che a sessant'anni devo smetterla di farmi la cresta viola.
    {charTag(Carla, "neutral")}:                    Gli ho risposto che ha quarant'anni e che ancora non sa lavarsi le mutande da solo.
    {charTag(Carla, "bored")}:                      Questo fa di me una cattiva madre?

        + \ {charTag(PG, "neutral")}:         No.
            ~ tutorial_CarlaRelationshipIndicator ++
        + \ {charTag(PG, "neutral")}:         Sì.
            ~ tutorial_CarlaRelationshipIndicator --
        + \ {charTag(PG, "neutral")}:         No.
            ~ tutorial_CarlaRelationshipIndicator ++
        + \ {charTag(PG, "neutral")}:         No.
            ~ tutorial_CarlaRelationshipIndicator ++
        + \ {charTag(PG, "neutral")}:         No.
            ~ tutorial_CarlaRelationshipIndicator ++
        -
    {
        - tutorial_CarlaRelationshipIndicator < 0:
            {charTag(Carla, "bored")}:              Questo è un problema suo.
                                                    Se ha delle lamentele, deve fare richiesta scritta.
        
        - else:
            {charTag(Carla, "happy")}:              Concordo.
                                                    Non che me ne importi molto della sua opinione.    
    }
    {charTag(Carla, "neutral")}:                    Come avrà notato, l'indicatore sotto il mio ritratto è cambiato.
    {charTag(Carla, "sad")}:                        Se parla con una persona, e quella persona ha un indicatore sotto al ritratto, vuol dire che l'idea che quella persona si farà di lei è importante per il suo lavoro.
    {charTag(Carla, "bored")}:                      Ora disattivo il mio, non voglio che veda quanto mi sta infastidendo.

        ~ tutorial_CarlaRelationshipIndicator_enabled  = false
        
                                                    Le scelte saranno più complesse di quelle dell'esempio, e ogni scelta rappresenta una cosa diversa.
                                                    Cosa?
    {charTag(Carla, "bored")}:                      Lo chieda all'addetta alla discarica, se non è di nuovo in malattia.
    {charTag(Carla, "neutral")}:                    Sono tenuta infine a ricordarle che ogni persona ragiona in modo diverso, per cui dovrà capire da sé cosa apprezza o meno chi ha davanti.

    {
        - settings_gamerMode == true:
        {charTag(Carla, "happy")}:                  Per facilitarle il lavoro, l'ufficio centrale ha inserito nel suo libro un riepilogo delle scelte fatte, con questo indicatore grafico.
                                                        
        @sprite:tutorial_carlaChoicesRelationshipStorylet_1

                                                    Lo troverà sotto il ritratto di ogni personaggia con cui dovrà lavorare.
                                                    Tiene traccia dell'ultima e penultima scelta fatte, così può monitorare da sé le variazioni, senza stressare me.

        - else:
        {charTag(Carla, "bored")}:                  Se la cosa le sembra difficile, provi a pensare al mio di lavoro e a tutti i protocolli che devo ricordare.                                            
    }
    
    {
        - grimoire_appendices hasnt grimChoicesMentor:
            {charTag(Carla, "sad")}:                Ma non ha ancora un grimorio?
            {charTag(Carla, "neutral")}:            Strano, di solito lo consegnano in automatico all'arrivo.
            {charTag(Carla, "bored")}:              Ma qui non possiamo fare niente per aiutarla.  
    }

    {charTag(Carla, "bored")}:                      Eeeee... perfetto! 
                                                    Sono ufficialmente in pausa.
                                                    Lei vada a fare le sue cose così imporanti, prego.

    {
        - entity_location(PG) == Bedroom:
            //Se lo stiamo ascoltando in camera allora la sposto nel deposito, faccio il check di chiusura, e poi faccio in modo che si passi alla scelta della modalità di gioco e tutorial.
            ~ move_entity(Carla, Safekeeping)
            -> carla_closing_storylet ->
            -> gm_rm_activation

        - else:
            -> carla_closing_storylet    

    }
    




=== tutorial_carlaRereadingStorylet ===
    
    {charTag(Carla, "bored")}:                      Questa roba è di competenza di quelli dell'amministrazione centrale, non mia.
        {
        - tutorial_CarlaDiscoveredTutorials has tutorialRereading: 
        {charTag(Carla, "bored")}:                  Ripetiamo la pappardella.
        }
    {charTag(Carla, "neutral")}:                    Sto per spiegarle come funziona la riscrittura.
        {
            - tutorial_CarlaDiscoveredTutorials has tutorialRereading:
                -> top2
            - else:
                -> top1    
        }

    - (top1)    
    {charTag(Carla, "sad")}:                            Vuole ascoltare?
        + \ {charTag(PG, "neutral")}:                   Con piacere!
            {charTag(Carla, "bored")}:                  Dubito.
        + \ {charTag(PG, "neutral")}:                   No, grazie.
            {charTag(Carla, "neutral")}:                Saggia scelta.
            {charTag(Carla, "neutral")}:                Per me per lo meno.
                -> carla_closing_storylet
        -

    - (top2)        
    {charTag(Carla, "angry")}:                          Sbrighiamoci.
    {charTag(Carla, "neutral")}:                        Non so se gliel'hanno già detto, ma lei è qui per aiutare le persone a trovare un nuovo nome.
                                                        Perché?
    {charTag(Carla, "bored")}:                          Non ne ho idea, io eseguo solo le indicazioni del ministero.
    {charTag(Carla, "neutral")}:                        Quando avrà conosciuto abbastanza una persona, potrà proporle di rileggere la sua storia e scegliersi un nuovo nome.
                                                        Quindi.
    {charTag(Carla, "happy")}:                          Uno: dice alla persona una cosa tipo "Ti va di rileggere la tua storia con me?".
    {charTag(Carla, "sad")}:                            Due: prima della riscrittura, la persona le dirà quello che pensa di lei.
                                                        Tra relazione e doni può ricevere da zero a quattro gocce di inchiostro.

        @sprite:tutorial_carlaRereadingStorylet_1

    {charTag(Carla, "bored")}:                          Non una di più, c'è scritto anche sul sito.
    {charTag(Carla, "neutral")}:                        Tre: a quel punto lei avrà diritto al suo monologo per dimostrare alla persona che la conosce davvero bene.
                                                        Il monologo si chiama <i>epilogo</i>.
    {charTag(Carla, "bored")}:                          Perché?
                                                        Perché l'addetto del Ministero sperava di diventare uno scrittore ma gli è andata male e ora ci appesta le giornate.                                                    
    {charTag(Carla, "neutral")}:                        Comunque: questa possibilità l'avrà sempre, a prescindere dalla quantità di inchiostro accumulato.
                                                        Riepilogando: più inchiostro ha accumulato, più cose potrà dire, facendo riferimento alle confidenze fatte da quella persona.
                                                        Quindi: più inchiostro uguale lavoro più facile.
                                                        Perché?
    {charTag(Carla, "happy")}:                          Perché le persone sono insicure, e devi sempre spiegargli le cose mille volte mentre tu vorresti solo andare a casa coi gatti e la switch.
    {charTag(Carla, "angry")}:                          E quando sono insicure, chiedono troppi perché.
    {charTag(Carla, "neutral")}:                        Facciamo una prova veloce.
                                                        Mettiamo che l'ho trovata così adorabile, da darle addirittura una goccia di inchiostro.
                                                        Mi ha sentito raccontare così tante cose su quella piaga di mio figlio, e così decide di dirmi.
                                                        <i>Carla: so che pensi che tuo figlio è un idiota, ma sono qui per dirti che poi guardarlo in modo diverso.</i>

        + \ {charTag(PG, "neutral")}:                   Come un peccato da espiare.
        + \ {charTag(PG, "neutral")}:                   Come un gradino in più verso il paradiso.
        + (amore)\ {charTag(PG, "neutral")}:            Come un il frutto di un atto d'amore.
        + \ {charTag(PG, "neutral")}:                   Come un termine di paragone per ricordarti quanto sei splendida.
        + \ {charTag(PG, "neutral")}:                   Come un coglione.
        -
    {charTag(Carla, "neutral")}:                        A questo punto il livello di inchiostro diminuisce.
        ~ tutorial_CarlaInkIndicator --
                                                        E visto che non c'è altro inchiostro, si passa all'epilogo.
                                                        L'epilogo di solito è l'occasione per dare un consiglio alla persona che ha davanti.
        
        + \ {charTag(PG, "neutral")}:                   È arrivato il momento di abbandonare tuo figlio sull'autostrada.
        + \ {charTag(PG, "neutral")}:                   Svuota le casse del comune e scappa sull'Isola delle Capre insieme alla tua migliore amica!
        + \ {charTag(PG, "neutral")}:                   Cambia colore di capelli!
        + \ {charTag(PG, "neutral")}:                   Fatti spostare all'ufficio <i>Reclami dei defunti</i> così non devi più lavorare!
        + \ {charTag(PG, "neutral")}:                   Ignora il dottore e riprendi a mangiare i libri della biblioteca!
        -
    {charTag(Carla, "neutral")}:                        A quel punto la persona dirà che ha ascoltato con attenzione le sue parole, e che ripensando anche a tutte le vostre chiacchierate, e che quindi il suo nuovo nome è qualcosa di diverso.
                                                        Il mio rimane Carla, perché adoro odiare la mia vita e mi sta bene così.
    {
    - amore:
    {charTag(Carla, "bored")}:                          Ma non provi di nuovo a dire che mio figlio è frutto di un atto d'amore: non amo quel caprone di mio marito dal Settantasei.    
    }                                                                                 

    {charTag(Carla, "neutral")}:                        E questa è la spiegazione su come funziona la riscrittura.
                                                        Se non l'ha capita, può sempre richiedermela.
    {charTag(Carla, "bored")}:                          Ma non lo faccia.

    {charTag(Carla, "neutral")}:                        Sono tenuta infine a ricordarle che anche se potrà fare la riscrittura dopo, che ne so, sette chiacchierate, le può convenire continuare a conoscere meglio la persona, prima di iniziare il processo.
                                                        Anche perché dopo la riscrittura, quella persona se ne andrà.
                                                        Non mi chieda dove, perché non è di mia competenza.
                                                        Ah, dimenticavo!
    {charTag(Carla, "happy")}:                          Le scelte fatte durante la riscrittura hanno un valore molto più alto di quelle durante il resto del vostro rapporto.
        {
            - player_accessiblePlaces has Nest: 
                                                        E questa cosa è importante da considerare se dovesse avere dei sigilli attivi.
            - else:
                                                        Se lo ricordi, soprattutto se dovesse usare qualcosa che modifica le sue prestazioni.    
        }
    {charTag(Carla, "bored")}:                          Ma in questo posto non arriva mai il venerdì?
    

-> carla_closing_storylet


//Tutorial sulle interfacce

=== tutorial_carlaInterfaceStorylets ===

    {charTag(Carla, "angry")}:                          Ma quando mi finisce il turno?
    {
        - tutorial_CarlaDiscoveredTutorials has tutorialInterface:
            {charTag(Carla, "bored")}:                  Ripeterò le cose esattamente come la prima volta, voglio brucare in santa pace.
    }
    {charTag(Carla, "bored")}:                          Sono Carla, e prima di entrare in Selanìa devo dirle cinque cose su come muoversi in questi luoghi.
        {
            - tutorial_CarlaDiscoveredTutorials has tutorialInterface:
                -> top2
            - else:
                -> top1    
        }

    - (top1) 
    {charTag(Carla, "sad")}:                            Iniziamo?
        + \ {charTag(PG, "neutral")}:                   Non vedo l'ora.
            {charTag(Carla, "neutral")}:                Buffo.
            {charTag(Carla, "bored")}:                  Anche io non vedo l'ora che finisca il mio turno.
        + \ {charTag(PG, "neutral")}:                   So già tutto, grazie.
            {charTag(Carla, "bored")}:                  Allora mi spieghi perché a sessant'anni sono ancora in questo ufficio.
            {charTag(Carla, "neutral")}:                Buona continuazione.
                -> carla_closing_storylet
        -

    - (top2)    
    {charTag(Carla, "bored")}:                      Prenda appunti perché odio ripetermi.
    {charTag(Carla, "neutral")}:                    Uno: può utilizzare mouse, tastiera e controller, e passare da uno strumento all'altro.
                                                    Col mouse basta passare sopra le cose che deve toccare, e cliccare.
                                                    Idem con il controller.

        @sprite:tutorial_carlaInterfaceStorylets_1

                                                    Con la tastiera può anche usare i numeri per le scelte.
                                                    Quali scelte?
    {charTag(Carla, "bored")}:                      Per risponderle serve il documento 13/12 in doppia coppia e la marca da bollo.
                                                    Seconda informazione: quello che può toccare ha un bordo nero.

        @sprite:tutorial_carlaInterfaceStorylets_2

    {charTag(Carla, "happy")}:                      Se sa parlare, si ferma quando lo sfiora.
                                                    Se non sa parlare, si muove quando lo sfiora.
                                                    E il cursore cambia.

        @sprite:tutorial_carlaInterfaceStorylets_3

                                                    Cos'è un cursore?
    {charTag(Carla, "bored")}:                      Se se lo chiede, forse ha sbagliato lavoro.
    {charTag(Carla, "neutral")}:                    Terza informazione: in camera troverà un citofono.
                                                    Lo può usare per modificare le impostazioni.

        @sprite:tutorial_carlaInterfaceStorylets_4

                                                    Più avanti le daranno un libro.
                                                    Potrà trovare il citofono anche nel libro.
                                                    Perché un citofono nel libro?
    {charTag(Carla, "bored")}:                      Direttive dalla sede centrale.
                                                    Quarta informazione: quello che fa viene salvato in automatico.
                                                    Se vede questa icona, non deve fare niente.

        @sprite:tutorial_carlaInterfaceStorylets_5

    {charTag(Carla, "angry")}:                      Non è difficile.
                                                    Quinta informazione: se qualcosa va storto <>
        {
            - settings_gamerMode:
            TODO: in realtà qui non sarà "gamerMode" ma il setting che abilita l'upload
            {charTag(Carla, "happy")}:              può tornare indietro nel tempo cliccando questa icona.

                @sprite:tutorial_carlaInterfaceStorylets_6

                                                    Appena le daranno il libro.

            - else:
            {charTag(Carla, "happy")}:              trova questa icona nelle impostazioni.

                @sprite:tutorial_carlaInterfaceStorylets_6
                
                                                    La farà viaggiare nel tempo.
                                                    Come?
            {charTag(Carla, "bored")}:              Sta parlando con una capra ed è questa la cosa che la perplime?!?!
        }
    {charTag(Carla, "sad")}:                        Infine dovrei spiegarle il sistema di relazioni.
    {charTag(Carla, "happy")}:                      Ma è arrivata l'ora della mia pausa.

-> carla_closing_storylet

=== tutorial_carlaGrimoireStorylet ===

        {
            - tutorial_CarlaDiscoveredTutorials has tutorialGrimoire: 
            {charTag(Carla, "bored")}:          Per fortuna questa è breve.
        }

    {charTag(Carla, "neutral")}:                Ha finalmente ricevuto il suo Grimorio.
                                                Festa.
                                                Giubilo.
                                                Rumore di trombette.
    {charTag(Carla, "happy")}:                  Espressione di gioia.
                                                Altra espressione di gioia.
    {charTag(Carla, "bored")}:                  Basta.
                                                Alcune informazioni pratiche sul Grimorio, gentilmente offerte dal Ministero.
        {
            - tutorial_CarlaDiscoveredTutorials has tutorialGrimoire:
                -> top2
            - else:
                -> top1    
        }

    - (top1)     
                                                Le vuole ascoltare?

    + \ {charTag(PG, "neutral")}:               Gliene sarei grat{player_pronoun has him:o|{player_pronoun has her:a|ə}}.
        {charTag(Carla, "bored")}:              Se sapesse cosa penso di lei, non mi sarebbe grat{player_pronoun has him:o|{player_pronoun has her:a|ə}} di nulla.
    + \ {charTag(PG, "neutral")}:               Non importa.
        {charTag(Carla, "neutral")}:            Siamo in due.
        {charTag(Carla, "bored")}:              Sono tenuta giusto a ricordarle che il Ministero la riterrà responsabile di ogni uso sconsiderato del Grimorio.
            -> carla_closing_storylet
        -

    - (top2)    
    {charTag(Carla, "happy")}:                  Che gentilmente potrebbe pagarmi di più.
    {charTag(Carla, "neutral")}:                Quando apre il grimorio vedrà due pagine.
                                                A destra troverà alcune informazioni utili per il suo lavoro, mentre a sinistra è presente l'indice.

        @sprite:tutorial_carlaGrimoireStorylet_1

                                                L'indice serve per portarla ai vari capitoli del Grimorio, che di solito raccolgono informazioni su un luogo o una persona.
                                                Se c'è un bottone, può cliccarlo per andare al relativo capitolo.
                                                Se c'è un lucchetto, deve ancora scoprire quella voce.
    {charTag(Carla, "neutral")}:                Alcuni capitoli possono avere delle sottosezioni, e la logica è la stessa: lucchetto uguale informazione bloccata.
                                                Perché un lucchetto?
    {charTag(Carla, "bored")}:                  La risposta non è di mia competenza.
                                                Ai lati del Grimorio troverà delle etichette.

        @sprite:tutorial_carlaGrimoireStorylet_2

                                                Servono per chiuderlo, per tornare verso l'indice, o per sfogliare le pagine.
    {charTag(Carla, "happy")}:                  Infine, se vede questa icona, vuol dire che c'è una nuova informazione per lei.

        @sprite:tutorial_carlaGrimoireStorylet_3

    {charTag(Carla, "bored")}:                  Se qualcosa non torna, può contattare la sezione Lamentele Inevadibili, al 9° piano.
                                                Se lo dimentica in giro, non posso garantirle che non ne mangerò le pagine.

        -> carla_closing_storylet


//Tutorial attivati da luoghi
=== tutorial_carlaGreenhouseGiftsInkStorylet ===
    {
        - tutorial_CarlaDiscoveredTutorials hasnt tutorialGreenhouse:
            ~ move_entity(Carla, Greenhouse)
    }

    {charTag(Carla, "bored")}:                  Deve parlare con la responsabile.
        {
            - tutorial_CarlaDiscoveredTutorials has tutorialGreenhouse:
                                                Abbiamo uno script da seguire, per cui non cambierò una virgola rispetto a prima.
        }
    {charTag(Carla, "neutral")}:                Ah no scusi, è l'abitudine.
    {charTag(Carla, "sad")}:                    Mi è stato chiesto di spiegarle come funziona la serra.
        {
            - tutorial_CarlaDiscoveredTutorials has tutorialGreenhouse:
                -> top2
            - else:
                -> top1    
        }

    - (top1)     
    {charTag(Carla, "neutral")}:                È pront{player_pronoun has him:o|{player_pronoun has her:a|ə}}?
    + \ {charTag(PG, "neutral")}:               Adoro le piante!
        {charTag(Carla, "bored")}:              Le assicuro che la cosa non è reciproca.
    + \ {charTag(PG, "neutral")}:               Non serve, ho il pollice verde.
        {charTag(Carla, "neutral")}:            Allora dovrebbe fare segnalazione al Ministero per i Malanni Immaginari.
        {charTag(Carla, "neutral")}:            Ottavo piano, a destra dopo l'ascensore guasto.
            -> carla_closing_storylet
        -

    - (top2)    
    {charTag(Carla, "neutral")}:                Ci fa crescere le piante ed è fatta.
                                                Arrivederci.
                                                Mmm, ah.
    {charTag(Carla, "angry")}:                  La responsabile dice che c'è fila in mensa, e devo ammazzare il tempo.
    {charTag(Carla, "neutral")}:                Uno: se non sta crescendo niente, la serra le farà due domande, e lei deve rispondere come se la sente.
                                                A quel punto inizierà a crescere una pianta.
                                                E dopo un po' potrà raccoglierne un pezzo.
                                                Perché uno solo?
    {charTag(Carla, "angry")}:                  Perché sennò muoiono, no?
    {charTag(Carla, "bored")}:                  Facciamo une esempio di domande sulla serra.
                                                Farò la voce mistica da serra.
    {charTag(TheWitch, witch_state())}:         <i>Quella è la nostra voce.</i>
    {charTag(Carla, "bored")}:                  <i>Il figlio di Carla...</i>
        + \ {charTag(PG, "neutral")}:           Finalmente si è laureato in Architettura.
        + \ {charTag(PG, "neutral")}:           Osserva il soffitto, il cervello vuoto.
        -
    {charTag(Carla, "neutral")}:                <i>La busta paga di Carla...</i>
        + \ {charTag(PG, "neutral")}:           Non aumenta dal 1976.
        + \ {charTag(PG, "neutral")}:           È stata accreditata per sbaglio a quel deficiente dell'ufficio Parcheggi e Paracadute.
        -
    {charTag(TheWitch, witch_state())}:         <i>Non abbiamo trovato molto di mistico in questa simulazione.</i>    
    {charTag(Carla, "neutral")}:                Bene.
                                                La serra farà le sue cose e poi le dirà che qualcosa è cambiato.
                                                A questo punto lei va in giro a chiacchierare, la pianta cresce e quando tornerà in serra la voce mistica le dirà qualcosa tipo.
    {charTag(Carla, "bored")}:                  <i>Gengive infiammate e sciatica che urla: è cresciuta la pianta del <b>Mannaggia perché sono nata?</b></i>
    {charTag(Carla, "neutral")}:                A quel punto potrà raccoglierla.
                                                Ma perché raccoglierla?
    {charTag(Carla, "bored")}:                  Sì, anticipo le sue domande così facciamo prima.                                          
    {charTag(Carla, "neutral")}:                Alcune persone possono accettare in dono da parte sua una pianta.
        {
            - player_accessiblePlaces has Kitchen:
                                                Oppure può usarle come ingrediente in cucina.
        }
    {charTag(Carla, "happy")}:                  Per fare un dono basta dire alla persona: "Ehi, voglio donarti una cosa" o qualcosa del genere.
                                                A quel punto si aprirà il suo grimorio, e lei potrà scegliere quale pianta donare.

        @sprite:tutorial_carlaGreenhouseGiftsInkStorylet_1

                                                Perché attraverso il grimorio?
    {charTag(Carla, "bored")}:                  Ho aperto una pratica, le faremo sapere.
    {charTag(Carla, "neutral")}:                Tre: il dono genera inchiostro.
    {charTag(Carla, "happy")}:                  Se ha fatto un dono moooolto apprezzato, riceverà due gocce di inchiostro.
    {charTag(Carla, "neutral")}:                Se abbastanza apprezzato, una.
    {charTag(Carla, "sad")}:                    Altrimenti, zero.
    {charTag(Carla, "bored")}:                  E no, non possiamo fare eccezioni, mi spiace.
    {charTag(Carla, "neutral")}:                Si può fare un solo dono a persona, per cui valuti bene.
    {charTag(Carla, "bored")}:                  E non mi chieda perché, perché è sempre stato così.
    {charTag(Carla, "neutral")}:                Quattro: a cosa serve l'inchiostro?
                                                Aspetti, ho in linea la mia responsabile.
    {charTag(Carla, "angry")}:                  In che senso stanno finendo i germogli? 
                                                Un po' di gramigna è rimasta?
                                                Volo!
    {charTag(Carla, "bored")}:                  Ah: se rimane a stomaco vuoto, non è un problema di mia competenza.

-> carla_closing_storylet



=== tutorial_carlaKitchenStorylet ===
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    
        {
        - tutorial_CarlaDiscoveredTutorials hasnt tutorialKitchen:
            ~ move_entity(Carla, Kitchen)
        }

        {
        - tutorial_CarlaDiscoveredTutorials hasnt tutorialKitchen:
        {charTag(Carla, "bored")}:              Quindi non ci stavano ampliando la mensa?!?

        - else: 
        {charTag(Carla, "neutral")}:            Perché ho sempre fame?
        }

    {charTag(Carla, "happy")}:                  Sono qui per spiegarle come funziona questa cucina.
    {charTag(Carla, "bored")}:                  Sperando sia più svegli{player_pronoun has him:o|{player_pronoun has her:a|ə}} di mio figlio.
        {
            - tutorial_CarlaDiscoveredTutorials has tutorialKitchen:
                -> top2
            - else:
                -> top1    
        }

    - (top1) 
    {charTag(Carla, "neutral")}:                Accetta di ascoltare la mia spiegazione?
    + \ {charTag(PG, "neutral")}:               Ne ho proprio bisogno.
        {charTag(Carla, "bored")}:              È quello che temevo.
    + \ {charTag(PG, "neutral")}:               Non serve, sono laureat{player_pronoun has him:o|{player_pronoun has her:a|ə}} in MasterChef.
        {charTag(Carla, "neutral")}:            Mmm.
        {charTag(Carla, "bored")}:              Forse mio figlio è più sveglio di lei.
                                                Si ricordi che gli incidenti in cucina non sono coperti dall'assicurazione.
            -> carla_closing_storylet
        -

    - (top2)    
    {charTag(Carla, "neutral")}:                Uno: ogni persona cucinerà con lei solo una volta.
                                                Perché?
    {charTag(Carla, "bored")}:                  Il Ministero ha tagliato i fondi.
                                                E {charNameOne} ha fatto il possibile con quello che aveva.
                                                Due: prima di cucinare, proporrà alla persona di approfondire un argomento che avete già affrontato.
                                                Ogni persona di solito ha tre argomenti a disposizione.
                                                Se ne percepisce meno a disposizione, di solito vuole dire che deve conoscere meglio quella persona per potergliene poi parlare.
    {charTag(Carla, "neutral")}:                Tre: farà delle scelte, come sempre.
                                                Ma la cucina è una pausa dal mondo, e per questo la persona le darà un feedback sull'impressione che si è fatta su di lei mentre cucinavate.
                                                Questo è molto utile per capire che tipo di rapporto state creando, e se ci sono correzioni da fare.
                                                Ad esempio, dopo tutte le nostre conversazioni, le posso dire che <>
                                                ~ temp carlaDice = RANDOM (1, 3)
        {carlaDice:
            - 1:
        {charTag(Carla, "neutral")}:            non mi annoiavo così tanto con qualcuno da quando mi sono ritrovata bloccata in ascensore con il responsabile dei premi assicurativi per i dipendenti.                                                                                   
            - 2:
        {charTag(Carla, "bored")}:              un po' lei mi disgusta, mi spiace.
                                                No, non è vero: non mi dispiace.
            - 3:
        {charTag(Carla, "happy")}:              non è male chiacchierare con lei.
                                                Anche se preferirei non chiacchierare affatto.        
        }                                                                                
    {charTag(Carla, "happy")}:                  Quattro: in cucina le persone le faranno domande personali.
                                                Potrà rispondere non a parole, ma aggiungendo ingredienti.
                                                Cose come "insalata dell'insufficienza renale" o "hummus speziato con lacrime della quattordicesima ribassata".
                                                Non ha senso?
    {charTag(Carla, "bored")}:                  Prenda un appuntamento con la sezione Disprezzi e Disservizi.
    {charTag(Carla, "happy")}:                  Cinque: opzionalmente potrà decidere di aggiungere come ingrediente una pianta coltivata in serra, sempre utilizzando il grimorio.

        @sprite:tutorial_carlaKitchenStorylet_1

                                                Se la persona apprezzerà l'ingrediente, le dirà qualcosa di utile a capire meglio come ragiona.
                                                Non sempre in modo chiaro: la gente fa di tutto per incasinare la vita a chi lavora, non trova?
    {charTag(Carla, "bored")}:                  Non sono previsti rimborsi in caso di insuccesso.
    {charTag(Carla, "happy")}:                  Non dovrei dirglielo, ma il signor Franco potrebbe aiutarla in caso di difficoltà.
    {charTag(Carla, "neutral")}:                Perché?
                                                Perché è un bravo ranocchio.
                                                Perché è un bravo ranocchio?
    {charTag(Carla, "bored")}:                  Non è di mia competenza.

-> carla_closing_storylet


=== tutorial_carlaSigilsActivationStorylet ===
~ temp charNameThree = translator(thirdChar_ActualName)
    {charTag(Carla, "bored")}:                  Ma perché questi non si fanno mai i cavoli propri? 
        {
            - tutorial_CarlaDiscoveredTutorials has tutorialSigils:
                Devo recuperare il documento del Ministero.
        }

    {charTag(Carla, "bored")}:                  Quindi {charNameThree} le ha aperto il Nido!
                                                Ma che gentile.
    {charTag(Carla, "neutral")}:                Già.
    {charTag(Carla, "bored")}:                  Mannaggia al.
        {
            - tutorial_CarlaDiscoveredTutorials has tutorialSigils:
                -> top2
            - else:
                -> top1    
        }

    - (top1) 
                                                Vuole che le spieghi come funzionano i Sigilli?
    + \ {charTag(PG, "neutral")}:               Sarebbe magnifico.
        {charTag(Carla, "bored")}:              No.
        {charTag(Carla, "happy")}:              Magnifica è la pensione.
        {charTag(Carla, "neutral")}:            Non questa mole immensa di scartoffie.
    + \ {charTag(PG, "neutral")}:               Preferisco imparare sul campo.
        {charTag(Carla, "bored")}:              È una scelta.
        {charTag(Carla, "neutral")}:            Le ricordo che il numero verde per gli incidenti magici e le trasformazioni involontarie è fuori servizio dal millenovecentoottantaquattro.
            -> carla_closing_storylet
        -
    - (top2)    
    {charTag(Carla, "happy")}:                  Il Nido le sblocca i Sigilli, e i Sigilli sono una cosa pericolosa.
    {charTag(Carla, "neutral")}:                Leggo direttamente dalla comunicazione ministeriale.
                                                "Premesso che la Combinata Triglifica Esoterica Espansa (da qui in avanti per brevità chiamato Sigillo) è uno strumento di cui ancora conosciamo poco.
                                                Premesso che il Sigillo influenza il modo in cui viene percepito il parlante che lo attiva.
                                                Preso inoltre atto della necessità di utilizzare un Grimorio (da qui in avanti per chiarezza chiamato Libro Oscuro di Sapienza e Potere) per farne l'attivazione.
                                                E considerata infine la durata limitata di utilizzo di un sigillo (tre utilizzi, non ripetibili né combinabili).
                                                Il Ministero, con l'obiettivo di facilitare il lavoro dellə Riscrittorə, ha istituito il Servizio di Indicazione Stato Sigillo Integrato (SISSI).
                                                Qualora un sigillo fosse attivo, la SISSI sarà presente a ogni livello del Libro Oscuro di Sapienza e Potere attraverso la caratteristica animazione.

        @sprite:tutorial_carlaSigilsActivationStorylet_1

                                                La SISSI inoltre comparirà durante il dialogo con le persone che ne possono essere condizionate.
                                                Nel caso in cui un Sigillo fosse attivo e la SISSI non fosse presente durante il dialogo, questo significa che la persona non è in assoluto o in quel momento influenzabile dal potere del sigillo.
                                                Dopo l'aggiornamento 13.12c, la SISSI indica anche la quantità residua di utilizzi, costantemente aggiornata.

        @sprite:tutorial_carlaSigilsActivationStorylet_2
                                    
                                                Per sua natura invece il Libro Oscuro di Sapienza e Potere aggiornerà i descrittori del sigillo ad ogni utilizzo.
                                                La comprensione dei descrittori è fondamentale per ogni Riscrittorə per anticipare l'effetto e la portata dei sigilli.
                                                Altre informazioni non sono di nostra competenza."
    {charTag(Carla, "bored")}:                  Questa conversazione poteva essere una mail.
    {charTag(Carla, "happy")}:                  Vado in pausa sigaretta, anche se non fumo dall'ottantaquattro.
    {charTag(Carla, "bored")}:                  Ora dovrei spiegarle come crearli, ma purtroppo il sistema è fuori uso.
    {charTag(Carla, "happy")}:                  E io ho dimenticato tutto.
    {charTag(Carla, "neutral")}:                Sono solo una capra.
    {charTag(Carla, "happy")}:                  Bee.
                                                Provi a cliccare un po' in giro.

-> carla_closing_storylet


=== tutorial_carlaNestStorylet ===
~ temp charNameThree = translator(thirdChar_ActualName)

    {
    - tutorial_CarlaDiscoveredTutorials hasnt tutorialNest:
            ~ move_entity(Carla, Nest)
    }

    {
    - tutorial_CarlaDiscoveredTutorials has tutorialNest:
    {charTag(Carla, "bored")}:                  E quindi rispieghiamo i glifi. Che gioia!
    }
  
    {charTag(Carla, "angry")}:                  Ogni volta che vedo questi cosi mi chiedo perché non ho concluso la laurea in ingegneria.
    {
        - tutorial_CarlaDiscoveredTutorials has tutorialNest:
            -> top2
        - else:
            -> top1    
    }

    - (top1) 
                                                Le spiego i sassi, va bene?
    + \ {charTag(PG, "neutral")}:               Sassiiiiiiiiiiiiii!
        {charTag(Carla, "bored")}:              Anche meno, figliol{player_pronoun has him:o|{player_pronoun has her:a|ə}}.
        {charTag(Carla, "neutral")}:            Anche meno.
    + \ {charTag(PG, "neutral")}:               Sassnooooooooooooo!
        {charTag(Carla, "bored")}:              Lei è amic{player_pronoun has him:o|{player_pronoun has her:a|ə}} di Franco, vero?
        {charTag(Carla, "neutral")}:            Avrebbe dovuto dirmelo prima.
        {charTag(Carla, "bored")}:              Avrei evitato di sprecare il mio tempo.
            -> carla_closing_storylet
    -

    - (top2)
    {charTag(Carla, "neutral")}:                Questi sassi sono qui per creare i Sigilli, che abbiamo già visto quando il suo caro amico {charNameThree} ha deciso di aprire questo posto.
                                                Uno: un sigillo utilizzabile è sempre composto da tre glifi.
    {charTag(Carla, "happy")}:                  Due: per creare un sigillo basta iniziare cliccando uno per volta i glifi a disposizione.
    {charTag(Carla, "sad")}:                    Tre: un sigillo è composto da tre glifi diversi, per cui ogni volta che sceglierà un glifo, quello non sarà disponibile fino a nuova composizione.

            @sprite:tutorial_carlaNestStorylet_1

            @sprite:tutorial_carlaNestStorylet_2

    {charTag(Carla, "neutral")}:                Quattro: Grimorio e glifi comunicano, e per questo i glifi si disattiveranno in automatico se non ci saranno nuove composizioni disponibili.
                                                Cinque: il Ministero ha tracciato una quantità invereconda di glifi in giro per gli universi, e infiniti sigilli, ma per qualche motivo in questa zona ne funzionano solo.
    {charTag(Carla, "bored")}:                  Uh, quanti erano?
                                                Non ricordo, ma immagino lo capirà dal grimorio.
    {charTag(Carla, "bored")}:                  Se qualcosa non dovesse funzionare, non contatti me.
    {charTag(Carla, "happy")}:                  Ah, dimenticavo: ogni volta che scoprirà un nuovo sigillo, verrà aggiunto in automatico sul grimorio.
    {charTag(Carla, "neutral")}:                E potrà essere attivato in qualsiasi momento, se non c'è un sigillo già attivo.
    {charTag(Carla, "bored")}:                  Non chieda eccezioni: il sistema non lo permette.

-> carla_closing_storylet



