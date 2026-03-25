//Tutorial sul game play principale

=== tutorial_choicesRelationshipStorylet ===

    {
        - tutorial_choicesRelationshipStorylet > 1: Le ricordo che ripeto sempre lo stesso script della prima volta, ok?#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored
    }
    
    Perché non sono andata a vivere nei boschi da sola, quando avevo vent'anni, perché?#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored
    Non risponda, è una domanda retorica, e l'ufficio domande retoriche è al 5° piano, stanza 13.
    Sono qui per dirle al volo cosa deve fare.
    Il perché non è di mia competenza.
    Lei deve parlare con le persone che trova qui in giro.
    Le diranno cose più o meno personali, e si aspetteranno da lei una risposta.
    La risposta influenzerà il modo in cui quella persona la vede.
    Facciamo una prova.
    Ora le racconto una cosa, e lei mi dà la sua opinione.
    Mio figlio dice che a sessant'anni devo smetterla di farmi la cresta viola.
    Gli ho risposto che ha quarant'anni e che ancora non sa lavarsi le mutande da solo.
    Questo fa di me una cattiva madre?
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
            Concordo.
            Non che me ne importi molto della sua opinione.    
    }
    Come avrà notato, l'indicatore sotto il mio ritratto è cambiato.
    Se parla con una persona, e quella persona ha un indicatore sotto al ritratto, vuol dire che l'idea che quella persona si farà di lei è importante per il suo lavoro.
    Ora disattivo il mio, non voglio che veda quanto mi sta infastidendo.
    Le scelte saranno più complesse di quelle dell'esempio, e ogni scelta rappresenta una cosa diversa.
    Cosa?
    Lo chieda all'addetta alla discarica, se non è di nuovo in malattia.
    Sono tenuta infine a ricordarle che ogni persona ragiona in modo diverso, per cui dovrà capire da sé cosa apprezza o meno chi ha davanti.
    Per facilitarle il lavoro, l'ufficio centrale ha inserito nel suo libro un riepilogo delle scelte fatte, con questo indicatore grafico.
    Lo troverà sotto il ritratto di ogni personaggia con cui dovrà lavorare.
    Tiene traccia dell'ultima e penultima scelta fatte, così può monitorare da sé le variazioni, senza stressare me.
    {
        - not welcome:
            Non ha ancora il suo libro?
            Strano, di solito lo consegnano in automatico all'arrivo.
            Ma qui non possiamo fare niente per aiutarla.    
    }

    E ora sono in pausa.
    Vada a fare le sue cose.


    {
        - entity_location(Carla) != Forest:
            ~ move_entity(Carla, Forest)
    }


->->




=== tutorial_rereadingStorylet ===
    
    Questa roba è di competenza di quelli dell'amministrazione centrale, non mia.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored
    Sbrighiamoci.
    Non so se gliel'hanno già detto, ma lei è qui per aiutare le persone a trovare un nuovo nome.
    Perché?
    Non ne ho idea, io eseguo solo le indicazioni del ministero.
    Quando avrà conosciuto abbastanza una persona, potrà proporle di rileggere la sua storia e scegliersi un nuovo nome.
    Quindi.
    Uno: dice alla persona una cosa tipo "Ti va di rileggere la tua storia con me?".
    Due: prima della riscrittura, la persona le dirà quello che pensa di lei.
    Tra relazione e doni può ricevere da zero a quattro gocce di inchiostro.
    Non una di più, c'è scritto anche sul sito.
    Tre: a quel punto lei avrà diritto al suo monologo per dimostrare alla persona che la conosce davvero bene.
    Più inchiostro ha accumulato, più cose potrà dire, facendo riferimento alle confidenze fatte da quella persona.
    Quindi: più inchiostro uguale lavoro più facile.
    Perché?
    Perché le persone sono insicure, e devi sempre spiegargli le cose mille volte mentre tu vorresti solo andare a casa coi gatti e la switch.
    E quando sono insicure, chiedono troppi perché.
    Sono tenuta comunque a ricordarle che anche se potrà fare la riscrittura dopo, che ne so, sette chiacchierate, le può convenire continuare a conoscere meglio la persona, prima di iniziare il processo.
    Anche perché poco dopo la riscrittura, quella persona se ne andrà.
    Ah, dimenticavo!
    Le scelte fatte durante la riscrittura hanno un valore molto più alto di quelle durante il resto del vostro rapporto.
        {
            - player_accessiblePlaces has Nest: 
                E questa cosa è importante da considerare se dovesse avere dei sigilli attivi.
            - else:
                Se lo ricordi, soprattutto se dovesse usare qualcosa che modifica le sue prestazioni.    
        }
    Ma in questo posto non arriva mai il venerdì?
    

->->


//Tutorial sulle interfacce

=== tutorial_interfaceStorylets ===

    Ma quando mi finisce il turno?#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored
    {
        - tutorial_interfaceStorylets > 1: Ripeterò le cose esattamente come la prima volta, voglio brucare in santa pace.
    }
    Sono Carla, e prima di entrare in Selanìa devo dirle cinque cose.
    Prenda appunti perché odio ripetermi.
    Uno: può utilizzare mouse, tastiera e controller, e passare da uno strumento all'altro.
    Col mouse basta passare sopra le cose che deve toccare, e cliccare.
    Idem con il controller.
    Con la tastiera può anche usare i numeri per le scelte.
    Quali scelte?
    Per risponderle serve il documento 13/12 in doppia coppia e la marca da bollo.
    Seconda informazione: quello che può toccare ha un bordo nero.
    Se sa parlare, si ferma quando lo sfiora.
    Se non sa parlare, si muove quando lo sfiora.
    E il cursore cambia.
    Cos'è un cursore?
    Forse lo sanno all'ufficio accanto.
    Terza informazione: in camera troverà un citofono.
    Lo può usare per modificare le impostazioni.
    Più avanti le daranno un libro.
    Potrà trovare il citofono anche nel libro.
    Perché un citofono nel libro?
    Direttive dalla sede centrale.
    Quarta informazione: quello che fa viene salvato in automatico.
    Se vede questa icona, non deve fare niente.
    Non è difficile.
    Quinta informazione: se qualcosa va storto <>
            {
                - settings_gamerMode:
                    può tornare indietro nel tempo cliccando questa icona.
                    Appena le daranno il libro.

                - else:
                    trova questa icona nelle impostazioni.
                    La farà viaggiare nel tempo.
                    Come?
                    Non siamo autorizzate a dare spiegazioni.
            }
    Infine devo spiegarle il sistema di relazioni.
    Ma è finito il mio turno.
    {
        - entity_location(Carla) != Forest:
            Lo sportello chiude.
    }
    

->->

=== tutorial_GrimoireStorylet ===

    Ha finalmente ricevuto il suo Grimorio!#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored
    Festa!
    Rumore di trombette!
    Espressione di gioia.
    Altra espressione di gioia.
    Basta.
    Alcune informazioni pratiche sul Grimorio, gentilmente offerte dal Ministero.
    Che gentilmente potrebbe pagarmi di più.
    Quando apre il grimorio vedrà due pagine.
    A destra troverà alcune informazioni utili per il suo lavoro, mentre a sinistra è presente l'indice.
    L'indice serve per portarla ai vari capitoli del Grimorio, che di solito raccolgono informazioni su un luogo o una persona.
    Se c'è un bottone, può cliccarlo per andare al relativo capitolo.
    Se c'è un lucchetto, deve ancora scoprire quella voce.
    Alcuni capitoli possono avere delle sottosezioni, e la logica è la stessa: lucchetto uguale informazione bloccata.
    Perché un lucchetto?
    La risposta non è di mia competenza.
    Ai lati del Grimorio troverà delle etichette.
    Servono per chiuderlo, per tornare verso l'indice, o per sfogliare le pagine.
    Infine, se vede questa icona, vuol dire che c'è una nuova informazione per lei.
    Se qualcosa non torna, può contattare la sezione Lamentele Inevadibili, al 9° piano.
    Se lo dimentica in giro, non posso garantirle che non ne mangerò le pagine.


->->


//Tutorial attivati da luoghi
=== tutorial_greenhouseGiftsInkStorylet ===
    {
        - tutorial_greenhouseGiftsInkStorylet == 1:
            ~ move_entity(Carla, Greenhouse)
    }

    Deve parlare con la responsabile.#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored
    {
        - tutorial_greenhouseGiftsInkStorylet > 1: Abbiamo uno script da seguire, per cui non cambierò una virgola rispetto a prima.
    }
    Ah no scusi, è l'abitudine.
    Mi è stato chiesto di spiegarle come funziona la serra.
    Ci fa crescere le piante ed è fatta.
    Arrivederci.
    Mmm, ah.
    La responsabile dice che c'è fila in mensa, e devo ammazzare il tempo.
    Uno: se non sta crescendo niente, la serra le farà due domande, e lei deve rispondere come se la sente.
    A quel punto inizierà a crescere una pianta.
    E dopo un po' potrà raccoglierne un pezzo.
    Perché uno solo?
    Perché sennò muoiono, no?
    Due: alcune persone possono accettare in dono da parte sua una pianta.
        {
            - player_accessiblePlaces has Kitchen: Oppure può usarle come ingrediente in cucina.
        }
    Per fare un dono basta dire alla persona: "Ehi, voglio donarti una cosa" o qualcosa del genere.
    A quel punto si aprirà il suo grimorio, e lei potrà scegliere quale pianta donare.
    Perché attraverso il grimorio?
    Ho aperto una pratica, le faremo sapere.
    Tre: il dono genera inchiostro.
    Se ha fatto un dono moooolto apprezzato, riceverà due gocce di inchiostro.
    Se abbastanza apprezzato, una.
    Altrimenti, zero.
    E no, non possiamo fare eccezioni, mi spiace.
    Si può fare un solo dono a persona, per cui valuti bene.
    E non mi chieda perché, perché è sempre stato così.
    Quattro: a cosa serve l'inchiostro?
    Aspetti, ho in linea la mia responsabile.
    In che senso stanno finendo i germogli? 
    Un po' di gramigna è rimasta?
    Volo!

        {
            - entity_location(Carla) != Forest:
                ~ move_entity(Carla, Forest)
                ->->
        }

->->



=== tutorial_kitchenStorylet ===

        {
            - tutorial_kitchenStorylet == 1:
                ~ move_entity(Carla, Kitchen)
        }


    Quindi non ci stavano ampliando la mensa?!?#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored
    Salve.
    Di nuovo.
    Sono qui per spiegarle come funziona questa cucina.
    Sperando sia più sveglio di mio figlio.
    Uno: ogni persona cucinerà con lei solo una volta.
    Perché?
    Il Ministero ha tagliato i fondi.
    Due: prima di cucinare, proporrà alla persona di approfondire un argomento che avete già affrontato.
    Ogni persona di solito ha tre argomenti a disposizione.
    Se ne vede meno, vuole dire che deve conoscere meglio quella persona per potergliene poi parlare.
    Tre: farà delle scelte, come sempre.
    Ma la cucina è una pausa dal mondo, e per questo la persona le darà un feedback sull'impressione che si è fatta su di lei mentre cucinavate.
    Questo è molto utile per capire che tipo di rapporto state creando, e se ci sono correzioni da fare.
    Quattro: in cucina le persone le faranno domande personali.
    Potrà rispondere non a parole, ma aggiungendo ingredienti.
    Non ha senso?
    Prenda un appuntamento con la sezione Disprezzi e Disservizi.
    Cinque: opzionalmente potrà decidere di aggiungere come ingrediente una pianta coltivata in serra.
    Se la persona apprezzerà l'ingrediente, le dirà qualcosa di utile a capire meglio come ragiona.
    Non sono previsti rimborsi in caso di insuccesso.
    Non dovrei dirglielo, ma il signor Franco potrebbe aiutarla in caso di difficoltà.
    

        {
            - entity_location(Carla) != Forest:
                ~ move_entity(Carla, Forest)
                    -> main
        }

    
->->


=== tutorial_SigilsActivationStorylet ===
// - Cosa ci indica:
//     - Che i sigilli sono strumenti che influenzano il modo in cui vengono interpretate le tue scelte. Come? Non sta a me dirlo.
//     - Per attivarli basta andare sul Grimorio e cliccare il bottone. puoi avere un solo sigillo attivo alla volta, e si consuma durante tre utilizzi. Poi non è riutilizzabile.
//     - Come capire che hai un sigillo attivo? Spazio recap in prima pagina, più animazione in secondo e terzo livello.
//     - Inoltre sono presenti durante il dialogo con le personagge, con l’indicatore degli utilizzi a disposizione.
//     - Se hai un sigillo attivo ma non lo vedi quando parli con qualcunx, vuol dire che quella persona è immune all’effetto del sigillo, e non verrà consumato.
//     - Man mano che li utilizzerai, compariranno anche delle descrizioni, utili per capirne la logica.
//     - Ma come li scopri? vediamoci nel nido.


    {
        - entity_location(Carla) != Forest:
            ~ move_entity(Carla, Forest)
            ->->
    }

->->


=== tutorial_nestStorylet ===
{
    - tutorial_nestStorylet == 1:
        ~ move_entity(Carla, Nest)
}

// - Cosa ci indica:
//     - Composizione: i glifi sono disponibili, possono essere usati solo una volta per sigillo, e quando sono consumati si spengono.
//     - Ogni sigillo è composto da tre glifi.
//     - Quando scoprirai un sigillo il grimorio si aggiornerà in automatico.
//     - Non puoi creare due volte lo stesso sigillo.


Tutorial nido spiegato da Carla#speaker:Carla#inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:carla_bored


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
