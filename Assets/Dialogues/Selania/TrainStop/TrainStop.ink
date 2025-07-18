=== train_stop ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
TODO: eliminare Bus anche da Unity
{debug: <i>La lista degli oggetti nella stanza è: {trainStopContents}.}

{train_stop == 1: <i>Questa è la stazione del treno.|<i>{~ La stazione profuma di partenze.|La panchina aspetta fremente una nuova conoscenza.|Sulle vette la luce brilla leggera.|Un vento fresco ti sospinge lungo la strada.|Le lettere ondeggiano sulla bacheca.|L'odore della foresta scalda il sentiero.}</i>}#speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: fungus_neutral

    + [Mi guardo attorno.]
    -
        -> main
        
        
=== starting_note ===
    + {are_two_entities_together(StartingNote, PG)}[StartingNote]
    
    Ti scrivo perché volevo ringraziarti per quello che hai fatto. #speaker:Sconosciutə #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait:unknown
        Le cose nella mia vita hanno ripreso a funzionare. 
    Ci sono ancora molte giornate no, ma sempre più  più spesso anche delle giornate sni.
    E persino qualche giornata YEAH!
        Spero che un giorno potrai avere anche tu la tua giornata yeah.
    E magari di passarla assieme.
        
            -> main


=== first_character_notes ===
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    
    + {are_two_entities_together(FirstCharacterNotes, PG)}[FirstCharacterNotes]
    
        {
            - not one:
                -> one
                
            - not two:
                {  
                    - firstWritingPause < 0:
                        -> two
                    - else:
                        -> one
                }
                
            - not three:
                {  
                    - firstWritingPause < 0:
                        -> three
                    - else:
                        -> two
                }
            
            - else:
                -> three
            
        }
    
    = one
        ~ temp charNameOne = translator(firstCharacterState)
        ~ temp charNameFive = translator(fifthCharacterState)
        
        Ciao {name}, come stai?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB:{ink_tag_b(firstCharacterInkLevel)}  #inkC:{ink_tag_c(firstCharacterInkLevel)}  #inkD:{ink_tag_d(firstCharacterInkLevel)} #portrait:chitarra_neutral
        Alla fine Talco è sempre statə qui, me idiota.
        E ha creduto alla mia storia!
        Ora si è messə in testa di insegnare agli scoiattoli a suonare le noci.
           
           {
                - firstCharacterPossibleStates has Triangolo:
                    
                    Io, invece, non riesco a prendere uno strumento in mano da che sono tornata.
                    
                - firstCharacterPossibleStates has RagazzaOrchestra:
                    
                    Questa piccola idiota invece (me) ha deciso di creare un piccolo esercito di suonatrici in difesa degli alberi.
                    
                - firstCharacterPossibleStates has FlautoDolce:
                    
                    Io invece per la prima volta sto provando a comporre un brano da cantare con tutte le persone a cui voglio bene.
                    E quando mi demoralizzo, Talco è subito lì a tirarmi su di morale.
                    Tu e quel posto mi avete reso una mollacciona.
                    Ma non è così male, alla fine.
                    
                - firstCharacterPossibleStates has Ocarina:
                    
                    Io invece sto addestrando due topolini per suonare lo xilofono, e se la cavano alla grande!
                    Se lo dico a mio padre mi fa ricoverare subito, ma amen.
                    Sono felice ama, davvero felice.
                    
                - firstCharacterPossibleStates has Violino:
                    
                    Io invece mi sono resa conto che forse, con la musica, possiamo parlare con gli animali.
                    No, non ho esagerato col vinello.
                    Ma pensaci, ama: se così fosse, potrei dimostrare che siamo tutt3 collegat3, che potremmo parlarci e comunicare tra noi!
            }
        
        Spero che lì vada tutto bene.
        E che {charNameFive} non sia sempre pesantona.
        Alla prossima lettera.
        <i>{charNameOne}</i>
        
        ~ firstWritingPause = firstWritingPauseDuration
            -> main
    
    = two
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    
    Ciao {name}, qui è sempre {charNameOne} che ti scrive.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB:{ink_tag_b(firstCharacterInkLevel)}  #inkC:{ink_tag_c(firstCharacterInkLevel)}  #inkD:{ink_tag_d(firstCharacterInkLevel)} #portrait:chitarra_neutral
    Sono passate settimane dal mio ritorno, e finalmente ho avuto il coraggio di parlare con mio padre.
       
       {
            - firstCharacterPossibleStates has Triangolo:
                Non è che avete un traduttore padre/figlia da quelle parti?
                Quando gli ho detto che seguirò il suo consiglio e mi cercherò un lavoro vero, è sembrato deluso.
                Nei prossimi giorni farò un colloquio nella agenzia dove lavora.
                Forse smistare merci è un altro modo di suonare musica.
                
            - firstCharacterPossibleStates has RagazzaOrchestra:
                Le cose non sono andate bene, abbiamo litigato per tutto il tempo.
                A volte la mia rabbia mi triggera, non è qualcosa che pensavo nemmeno di possedere.
                Per assurdo però da quando gli ho detto che è la mia vita e ho il diritto di fare i miei errori, ci sentiamo più spesso.
                Non so se voglio rivederlo subito, ma forse le cose stanno cambiando per il meglio.
                
            - firstCharacterPossibleStates has FlautoDolce:
                Gli ho parlato di nonno, e gli ho detto che voglio seguire le sue tracce.
                Sul momento è rimasto interdetto, ma poi si è messo a piangere.
                Mi ha chiesto del tempo per decidere se e cosa potrebbe fare per aiutarmi.
                
            - firstCharacterPossibleStates has Ocarina:
                Ha passato il tempo a dirmi che non prendo nulla sul serio.
                Parlargli dell'orchestra di topolini e scoiattoli non ha aiutato, ama.
                Forse cambierà idea quando avrò finito di addestrare le falene.
                O più plausibilmente mi taglierà tutti i fondi.
                
            - firstCharacterPossibleStates has Violino:
                Per la prima volta credo di averlo capito.
                Non ci siamo trovate, non riesce a comprendere perché per me sia importante fare qualcosa di utile per l'umanità e blah blah blah.
                Ma ho visto nella sua preoccupazione la paura sincera che possa avere una vita difficile.
                Mi ha fatto insieme tenerezza e dispiacere.
        }
    E lì invece? Come stanno le tue piante?
    Sono arrivate nuove persone interessanti?
    Sicuro, mai quanto me!
    A presto, <i>{charNameOne}</i>.
        ~ firstWritingPause = firstWritingPauseDuration
        -> main
        
    = three
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    
    Ciao ama!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB:{ink_tag_b(firstCharacterInkLevel)}  #inkC:{ink_tag_c(firstCharacterInkLevel)}  #inkD:{ink_tag_d(firstCharacterInkLevel)} #portrait:chitarra_neutral
    Indovina chi ha fatto il suo primo concerto?
    
     {
            - firstCharacterPossibleStates has Triangolo:
                Non io ovviamente.
                Il lavoro di smistamento si mangia le giornate.
                Per Talco ha spaccato!
                Quando ha finito sono scoppiata a piangere.
                L3 am3 pensavano fosse gioia.
                Non ho avuto il coraggio di dire loro che temo di aver fatto la scelta peggiore della mia vita.
                La peggiore.

                
            - firstCharacterPossibleStates has RagazzaOrchestra:
                Il collettivo!
                Ci chiamiamo EDERE, che è un acronimo di cui non ricordo manco più il significato ma è tipo: ci attacchiamo agli alberi e non ci leviamo più.
                E a questo giro la pula non ci ha levate, perché c'era troppa gente ed è stato un casino assurdo.
                Alcune compagne sono critiche perché temono che abbiamo spaventato la fauna.
                Credo che abbiano ragione.
                Anche se questa cosa mi rompe le ovaie.
                Ma vedremo di trovare una soluzione.

                
            - firstCharacterPossibleStates has FlautoDolce:
                Il nonno!
                O meglio, una cover band che abbiamo tirato su con l3 am3.
                Abbiamo anche un suo cartonato che portiamo in giro.
                Ho incontrato vecchie che l'hanno conosciuto.
                E ho scoperto cose nuove su di lui.
                Anche cose che non avrei voluto sapere.
                Il nonno era un chillone totale comunque, e ora voglio imparare da lui.
    
                
            - firstCharacterPossibleStates has Ocarina:
                I topolini!
                In teoria dovevano esserci anche gli scoiattoli, ma le luci li hanno spaventati.
                O forse quei bambini del cazzo.
                Che in teoria erano vietati.
                Però è stata una roba toppissima ama.
                Non so se lì prende ma nel caso cercaci su internet perché abbiamo spaccato.
      
                
            - firstCharacterPossibleStates has Violino:
                Madre natura!
                No dai, non il primo.
                Il primo che abbiamo registrato.
                La prima collaborazione tra umani, funghi e piante.
                E sembra che ora parte delle nostre note stiano vibrano nel terreno.
                Un gruppo di scienziati ha trovato frequenze simili alle nostre in un bosco a cento chilometri e passa di distanza!
                Chi l'avrebbe detto che mi sarebbero piaciuti gli scienziati?
                Ora però dobbiamo anche imparare ad ascoltare.
                Perché facile che ci siano altre canzoni in giro da eoni.
                E questa sarà la parte difficile.
                Non vedo l'ora!
        }
    Comunque un giorno mi piacerebbe che la musica, questa musica arrivasse anche dalle vostre parti.
    O che, quando te ne andrai da lì, verrai ad ascoltarla con me.
    Un saluto.
    {charNameOne}.
    -> main
    
=== second_character_notes ===
//Mettere cose sul rapporto con nonna, papà. mamma, fratello, animali, futuro.
    + {are_two_entities_together(SecondCharacterNotes, PG)}[SecondCharacterNotes]
    
    {
            - not one:
                -> one
                
            - not two:
                {  
                    - secondWritingPause < 0:
                        -> two
                    - else:
                        -> one
                }
                
            - not three:
                {  
                    - secondWritingPause < 0:
                        -> three
                    - else:
                        -> two
                }
            
            - else:
                -> three
            
        }
    
    = one
        ~ temp charNameTwo = translator(secondCharacterState)
        ~ temp charNameFive = translator(fifthCharacterState)
        
        Sono a lezione e mi sto rompendo e quindi ho deciso di scrivere a {name}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral
        Cioè a te.
        Anche se non ho mica capito come te la mando la lettera.
        Ma come sta la rana?
        Hai scoperto poi se è elettrica?
            
            {
                - secondCharacterPossibleStates has Riccio:
                    
                    Qui le cose sono strane.
                    Forse perché sono uguali a prima.
                    Ora passo più tempo in camera.
                    Papà è contento perché dice che non rompo.
                    Mamma è preoccupata perché vuole che gioco con gli altri.
                    A volte guardo fuori dalla finestra e basta.
                    E vado a letto e non correggo più nulla.
                    Mi addormento, e aspetto.
                    A volte voglio tornare lì da voi.
                    Ma non so cosa fare.
                    La prof di matematica mi guarda male.
                    Ci sentiamo {name}.
                    
                - secondCharacterPossibleStates has Grizzly:
                    
                    Oggi per la prima volta ho litigato con papà.
                    Nel senso che non è stato mica lui a cominciare ma io.
                    Ha cercato di picchiarmi e gli ho urlato che è un bullo.
                    E poi ho preso i miei libri e glieli ho tirati contro.
                    Lui si è arrabbiato così tanto, {name}!
                    E allora ho urlato.
                    Urlato come un orso.
                    Che si dice che ho bramito quindi.
                    E lui se ne è andato sbattendo la porta, urlando a mamma che ha tirato su un deficiente.
                    Però sono felice perché ho meno paura ora.
                    Mamma mi guarda strano.
                    Ma so che tu mica mi avresti guardato così.
                    Salutami la rana!
                    
                - secondCharacterPossibleStates has Lupo:
                    
                    L'altro giorno ho parlato con l'amico di mio fratello.
                    Gli ho detto che per me siamo un branco ma che secondo me lui mica mi ci vede in questo branco.
                    E lui mi ha detto una cosa strana.
                    Che non ce l'ha con me.
                    Ma che non sa parlare coi bambini.
                    Allora gli ho detto di non parlarmi come un bambino.
                    Che so cosa sono i lupi, le frazioni, l'elettricità.
                    Lui ha riso e mi ha detto: "Ma sai creare un muffin?".
                    E mi ha insegnato a fare i muffin.
                    Mi sono divertito tanto.
                    E voglio portartene uno.
                    A presto!
    
                - secondCharacterPossibleStates has Delfino:
                    
                    A scuola sto finendo tantissimo nei guai.
                    Ho iniziato a fare qualche dispetto ai bambini prepotenti.
                    Secondo me hanno funzionato, ma le maestre si sono arrabbiate.
                    Soprattutto per l'inchiostro sulle loro scarpe.
                    Ma non è colpa mia se si sono messe in mezzo!
                    Però mi sono fatto due nuovi amici, e l'altro giorno abbiamo passato mezz'ora in castigo assieme.
                    Quando la maestra di matematica è tornata e ha trovato la stanza tutta legata con lo spago, ha detto una parolaccia grossa.
                    Ma grossa grossa.
                    Quando l'ho ridetta a mio fratello è scoppiato a ridere.
                    Ma forse qui non te la scrivo, per ora.
                    Ci vediamo!
                    
                - secondCharacterPossibleStates has Capibara:
                    
                    Ieri ho avuto una conversazione da grandi con mio fratello.
                    Me l'ha fatta perché ho chiamato il suo amico "frocio" quando mi ha sgridato.
                    E non avevo fatto nulla di male.
                    A parte mettere della tempera nel suo frullatore.
                    Mio fratello mi ha spiegato perché fa male quella parola.
                    E perché papà la usa quando è arrabbiato.
                    Mi ha detto che tantissime persone usano quella parola come scusa per fare del male ad altre persone.
                    E lo fanno perché hanno paura.
                    E poi mi ha portato in una associazione che serve per chi è come mio fratello o il suo amico e non vuole più avere paura.
                    E io non avevo mai capito che si possono fare tutte queste cose assieme.
                    Mi è dispiaciuto tantissimo aver fatto male al suo amico.
                    Però sono anche contento che mi hanno detto le cose per bene dopo tutti questi anni.
                    E tu hai paura di alcune persone?
                    Ciao ciao!
                    
                - secondCharacterPossibleStates has Corvo:
                    
                    L'altro giorno ho detto a mamma e papà che voglio diventare un veterinario.
                    Per studiare e salvare gli animali.
                    Mamma ha detto che allora forse dovrei diventare un etologo (questo l'ho fatto scrivere a lei).
                    Quando poi ne ho parlato con mio fratello, mi ha detto che questa estate se voglio mi fa conoscere una persona che fa una cosa bellissima: salva gli animali dai laboratori.
                    Mio fratello dice che studiare è importante, ma che per cambiare le cose devo capire come lottare.
                    Avevo capito che dovevo lasciarla via la rabbia, {name}.
                    Ma lui mi dice che la rabbia serve.
                    Va solo mandata nella giusta direzione.
                    Ti scriverò appena scopro qual è quella giusta e quale è quella sbagliata.
                    Ciao!
            }
                
            ~ secondWritingPause = secondWritingPauseDuration
                -> main
    
    = two
        ~ temp charNameTwo = translator(secondCharacterState)
        ~ temp charNameFive = translator(fifthCharacterState)
        
        Che strano.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral
        Ho lasciato l'altra lettera sul comodino di notte.
        E poi è sparita.
        Non so mica se ti è arrivata.
        O se papà l'ha buttata.
            
            {
                - secondCharacterPossibleStates has Riccio:
                
                    Le cose a scuola vanno male.
                    L'altro giorno ho picchiato un bambino perché mi ha chiamato "strano".
                    E l'ho spinto dalle scale.
                    Ora sono in sospensione, a casa.
                    Papà è sparito da due giorni.
                    Mamma piange in camera.
                    Io non so come mi sento.
                    Però ho ripreso a fare esperimenti.
                    In un vecchio libro un bambino disegnava la porta sul muro, e andava in un altro mondo.
                    Forse se trovo il modo posso tornare da voi.
                    Mi mancate.
                    Ciao.
    
                - secondCharacterPossibleStates has Grizzly:
                
                    Se l'ha buttata urlo di nuovo, vediamo che mi dice poi.
                    Però ti dovevo dire questa cosa: sono nella squadra di calcio.
                    Non sono mica bravo, sinceramente.
                    Questa roba delle forza e della velocità non è roba mia proprio.
                    Però dice l'allenatore che ho strategia.
                    Mamma me l'ha fatto fare perché dice che devo scaricare tutta questa "rabbia da ragazzino".
                    E non mi chiama più bambino.
                    Negli spogliatoi ci sono state delle risse.
                    Ho dato un pugno straforte a uno più grande.
                    E ora a scuola non mi rompono più le scatole.
                    Se qualcuno ti rompe le scatole {name} chiamami.
                    E ti aiuto io.
                    Ciao!
    
                - secondCharacterPossibleStates has Lupo:
                
                    Ma non credo: le cose negli ultimi giorni vanno meglio.
                    Con l'amico di mio fratello ho fatto dei muffin per lui e mamma.
                    E poi gli ho detto che mi dispiace quando litigano.
                    E che ho capito che essere grandi fa schifo, ma che ci sono anche cose belle.
                    Come andare al mare.
                    Mamma si è messa a piangere.
                    Papà è stato in silenzio tantissimo.
                    E ho iniziato a pensare che mi avrebbe picchiato.
                    Invece ha detto: domani si fa vacanza e si va a nuotare tutti assieme.
                    Mamma l'ha abbracciato, e si è mangiata un intero muffin.
                    Ti dico poi come è andata!
                    A presto.
                    
                - secondCharacterPossibleStates has Delfino:
                
                    In questi giorni ho ripreso a dire delle bugie.
                    Ma invece di dirle piccole, le sto dicendo grandissime.
                    E questa cosa fa divertire i miei nuovi amici.
                    E anche qualche maestra.
                    Mamma dice che da grande devo fare il comico.
                    Papà è banale e dice che devo fare il politico.
                    Mio fratello è preoccupato, perché teme che mi metto nei pasticci.
                    Gioco: una di queste cose che ho detto non è vera.
                    Tu lo capisci quale?
                    Salutami la rana!
                    {charNameTwo}.
                    
                - secondCharacterPossibleStates has Capibara:
                
                    Dopo che gli ho detto che lui usa quella parola con mio fratello perché ha paura, non mi parla più.
                    Mamma dice che lui ha paura di tutte le cose, ma non lo sa dire.
                    Le ho detto che ci sono delle associazioni.
                    Lei ha sorriso e mi ha detto che sto davvero diventando grande.
                    Però continuo a pensarci a questa cosa delle associazioni.
                    Tu lo sai che io ho paura per gli animali.
                    E mi hai insegnato che le cose si affrontano con gli amici.
                    Magari non sono bravo a farmi degli amici, ma sono bravo a parlare degli animali.
                    E forse ci riesco a fare qualcosa così, come mio fratello fa per i suoi amici.
                    Devo solo capire cosa.
                    Vorrei tanto chiederlo alla rana.
                    Salutamela!
                
                - secondCharacterPossibleStates has Corvo:
                
                    Ultimamente parliamo di più.
                    Gli piace parlare di politica.
                    Secondo me dice cose stupide, ma forse nelle sue cose stupide c'è lui, le sue paure.
                    Almeno così dice l'amico di mio fratello.
                    Oggi siamo stati da nonna.
                    Ho dovuto insistere perché avevano paura che ci rimanevo male.
                    Si no boh.
                    Mi è spiaciuto quando non mi ha riconosciuto.
                    Però è sempre la nonna.
                    Quando mamma ha parlato con l'infermiera ho preso un mazzo di carte.
                    Era sporco e mancava l'asso di picche.
                    Ma nonna ha ricordato tutti i trucchi e mi ha stracciato.
                    Stammi bene!
                    {charNameTwo}.
            }    
            
            ~ secondWritingPause = secondWritingPauseDuration
                -> main
    
    = three
        ~ temp charNameTwo = translator(secondCharacterState)
        ~ temp charNameFive = translator(fifthCharacterState)
        
        Ciao {name}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral
                
                {
                - secondCharacterPossibleStates has Riccio:
                    
                    Ti scrivo da casa di mio fratello.
                    Novità: ora vivo qui!
                    All'inizio il suo amico non era contento, ma ora mi insegna anche a fare i dolci!
                    Fa anche delle caramelle superbuone.
                    Papà non è più tornato.
                    Mamma non ha nemmeno fatto storie quando me ne sono andato.
                    Non mi sento mica felice.
                    Sì no boh.
                    Che cosa strana da scrivere.
                    Però le cose sono diverse.
                    A volte abbasso le spine.
                    A volte mi addormento sul divano mentre guardo i telefilm con mio fratello.
                    E non ho mica paura.
                    Spero che tu non abbia paura.
                    Salutami {charNameFive}.
                    Ti voglio bene.
                    
                - secondCharacterPossibleStates has Grizzly:
                    
                    Sono SUPER ARRABBIATO.
                    CON MIO FRATELLO.
                    Non avevamo mai litigato, mai.
                    Ma l'altro giorno è venuto a casa e mi ha detto che sto diventando come papà.
                    Papà si è incazzato con lui e mi ha difeso.
                    Mio fratello dice che sto diventando un bullo.
                    Che un suo amico maestro a scuola gli ha detto che me la prendo coi più piccoli.
                    Papà gli ha detto che mi faccio rispettare.
                    E che non sono una checca come lui.
                    Lui mio fratello.
                    Non sono mica abituato a mio padre così.
                    Ma poi in camera mi è preso male tutto.
                    Mi manca mio fratello.
                    Mi mancate voi.
                    Vorrei sapere cosa fare.
                    
                - secondCharacterPossibleStates has Lupo:
                    
                    Oggi sono triste, e non so perché.
                    Ho dato un pugno a un ragazzo delle medie, ma non mi è mica piaciuto.
                    A casa le cose vanno bene, ma.
                    Sì no boh.
                    Mica pensavo che è così faticoso.
                    Mamma e papà sono tranquilli solo se siamo assieme.
                    Mi sembra un lavoro.
                    E se sono giù si preoccupano tantissimo.
                    E se si preoccupano tornano a litigare.
                    Non so mica cosa fare.
                    Forse {charNameFive} li può aiutare?
                    Mi mancate.
                    {charNameTwo}.
                    
                - secondCharacterPossibleStates has Delfino:
                    
                    Se non l'hai capito nell'ultima lettera solo l'ultima frase non era vera: tutte le altre lo erano.
                    Però è successa una cosa divertente, {name}!
                    La prof di matematica mi ha detto che le mie bugie sono storie.
                    E che le storie sono da conservare.
                    E quindi abbiamo aperto assieme a altri bambini un giornale della scuola.
                    Faremo uscire per tutto il resto dell'anno i nostri racconti e le notizie.
                    Mi ha solo chiesto di non scrivere più quella parolaccia che lei ha detto.
                    E di non dire niente sulla preside o si arrabbia.
                    E allora ti saluto dicendoti quella parolaccia, perché poi non la potrò più scrivere.
                    "Per il catarro del cammello!"
                    Che schifo, {name}.
                    Ma lì ci sono i cammelli?
                    Un saluto.
                    {charNameTwo}.
                    
                - secondCharacterPossibleStates has Capibara:
        
                    Questo cervellino (il mio cervellino) ha trovato una soluzione.
                    Ho parlato con la prof di matematica, e le ho detto delle mie paure.
                    Degli animali che spariscono, dei boschi che bruciano.
                    Dei ghiacciai.
                    Lei mi ha detto che possiamo raccogliere dei soldi ma sì no boh.
                    Io pensavo all'associazione di mio fratello e del suo fidanzato, e loro insegnano a non avere paura non a spendere soldi.
                    Allora mi ha fatto fare una lezione in classe su queste cose.
                    Ho spiegato le paure.
                    E poi ho detto che se ci mettiamo assieme ci sono anche le soluzioni.
                    Alcuni compagni hanno detto che ci possiamo trovare nel campetto il pomeriggio.
                    E quindi forse qualcosa sta iniziando, {name}.
                    Non so cosa faremo, però è bello non farlo da solo.
                    E vorrei tanto tu fossi qui con me, ora.
                    Secondo me ci diresti tantissime cose sagge.
                    Salutami la rana.
                    {charNameTwo}.
                
                - secondCharacterPossibleStates has Corvo:
                
                    Ieri è successa una cosa fighissima.
                    Ti ricordi quell'amica di mio fratello, che dovevo conoscere al mare?
                    Sta da tre giorni da lui perché dice che è stata buttata fuori di casa.
                    E mi ha raccontato tante cose che mica sapevo.
                    Cose brutte che vengono fatte agli animali.
                    Ma, {name}: non aveva paura.
                    Lei dice che sono sveglio, e che per questo non devo avere paura perché posso capire tutto.
                    E che magari un giorno trovo un modo per salvare gli animali.
                    Mi ha regalato un romanzo di Ursula LeGuin (ho dovuto guardare la copertina, è un nome difficile).
                    Non sapevo di potere imparare cose dai romanzi.
                    Oggi ho chiesto alla maestra di matematica di darmi dei libri sull'ambiente.
                    Ci sono così tante cose da imparare, {name}, così tante!
                    Spero ci vedremo presto.
                    Salutami la rana!
                    {charNameTwo}.
                    
            }
        
        ~ secondWritingPause = secondWritingPauseDuration
    
            -> main
    
=== third_character_notes ===
//Forse le sue lettere saranno scritte da una persona cara, vicina.
    
    + {are_two_entities_together(ThirdCharacterNotes, PG)}[ThirdCharacterNotes]
    
        {
            - not one:
                -> one
                
            - not two && thirdWritingPause < 0:
                -> two
                
            - not three && thirdWritingPause < 0:
                -> three
        }
        
    = one
        ~ temp charNameThree = translator(thirdCharacterState)
        ~ temp charNameFive = translator(fifthCharacterState)
        
        {charNameThree}: Lettere random note da parte della personaggia #speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdCharacterInkLevel)} #inkB:{ink_tag_b(thirdCharacterInkLevel)} #inkC:{ink_tag_c(thirdCharacterInkLevel)}  #inkD:{ink_tag_d(thirdCharacterInkLevel)} #portrait:third_neutral
        
        {
            - thirdCharacterPossibleStates has Riccio: 
                {charNameThree}: xy
            - thirdCharacterPossibleStates has Capibara:
                {charNameThree}: zz
        }
        
        ~ thirdWritingPause = thirdWritingPauseDuration
            -> main
    
    = two
        ~ temp charNameThree = translator(thirdCharacterState)
        ~ temp charNameFive = translator(fifthCharacterState)
        
        {charNameThree}: seconda lettera
        
        {
            - thirdCharacterPossibleStates has Riccio: 
                {charNameThree}: xy
            - thirdCharacterPossibleStates has Capibara:
                {charNameThree}: zz
        }    
        
        ~ thirdWritingPause = thirdWritingPauseDuration
            -> main
    
    = three
        ~ temp charNameThree = translator(thirdCharacterState)
        ~ temp charNameFive = translator(fifthCharacterState)
        
        {charNameThree}: terza lettera
        
        {
            - thirdCharacterPossibleStates has Riccio: 
                {charNameThree}: xy
            - thirdCharacterPossibleStates has Capibara:
                {charNameThree}: zz
        }    
        
        ~ thirdWritingPause = thirdWritingPauseDuration
            -> main
    
=== fourth_character_notes ===
    
    + {are_two_entities_together(FourthCharacterNotes, PG)}[FourthCharacterNotes]
        
        {
            - not one:
                -> one
                
            - not two && thirdWritingPause < 0:
                -> two
                
            - not three && thirdWritingPause < 0:
                -> three
            
        }
        
    = one
        ~ temp charNameFour = translator(fourthCharacterState)
        ~ temp charNameFive = translator(fifthCharacterState)
        
        {charNameFour}: Lettere random note da parte della personaggia#speaker:{fourthChar_tag()} #inkA:{ink_tag_a(fourthCharacterInkLevel)} #inkB:{ink_tag_b(fourthCharacterInkLevel)} #inkC:{ink_tag_c(fourthCharacterInkLevel)}  #inkD:{ink_tag_d(fourthCharacterInkLevel)} #portrait:fourth_neutral
        
        {
            - fourthCharacterPossibleStates has Riccio: 
                {charNameFour}: xy
            - fourthCharacterPossibleStates has Capibara:
                {charNameFour}: zz
        }    
        
        ~ fourthWritingPause = fourthWritingPauseDuration
            -> main
    
    = two
        ~ temp charNameFour = translator(fourthCharacterState)
        ~ temp charNameFive = translator(fifthCharacterState)
        
        {charNameFour}: seconda lettera
        
        {
            - fourthCharacterPossibleStates has Riccio: 
                {charNameFour}: xy
            - fourthCharacterPossibleStates has Capibara:
                {charNameFour}: zz
        }  
        
        ~ fourthWritingPause = fourthWritingPauseDuration
            -> main
    
    = three
        ~ temp charNameFour = translator(fourthCharacterState)
        ~ temp charNameFive = translator(fifthCharacterState)
        {charNameFour}: terza lettera
    
        {
            - fourthCharacterPossibleStates has Riccio: 
                {charNameFour}: xy
            - fourthCharacterPossibleStates has Capibara:
                {charNameFour}: zz
        }      
        
        ~ fourthWritingPause = fourthWritingPauseDuration
            -> main

=== fifth_character_notes ===

    + {are_two_entities_together(FifthCharacterNotes, PG)}[FifthCharacterNotes]
    
        {
            - not one:
                -> one
                
            - not two && thirdWritingPause < 0:
                -> two
                
            - not three && thirdWritingPause < 0:
                -> three
            
        }
        
    = one
        ~ temp charNameOne = translator(firstCharacterState)
        ~ temp charNameTwo = translator(secondCharacterState)
        ~ temp charNameThree = translator(thirdCharacterState)
        ~ temp charNameFour = translator(fourthCharacterState)
        ~ temp charNameFive = translator(fifthCharacterState)
        
        {charNameFive}: Lettere random note da parte della personaggia#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)}  #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
        
        {
            - fifthCharacterPossibleStates has Riccio: 
                {charNameFive}: xy
            - fifthCharacterPossibleStates has Capibara:
                {charNameFive}: zz
        }
        
        ~ fifthWritingPause = fifthWritingPauseDuration
            -> main
    
    = two
        ~ temp charNameOne = translator(firstCharacterState)
        ~ temp charNameTwo = translator(secondCharacterState)
        ~ temp charNameThree = translator(thirdCharacterState)
        ~ temp charNameFour = translator(fourthCharacterState)
        ~ temp charNameFive = translator(fifthCharacterState)
        
        {charNameFive}: seconda lettera
        
        {
            - fifthCharacterPossibleStates has Riccio: 
                {charNameFive}: xy
            - fifthCharacterPossibleStates has Capibara:
                {charNameFive}: zz
        }
            
        ~ fifthWritingPause = fifthWritingPauseDuration
            -> main
    
    = three
        ~ temp charNameOne = translator(firstCharacterState)
        ~ temp charNameTwo = translator(secondCharacterState)
        ~ temp charNameThree = translator(thirdCharacterState)
        ~ temp charNameFour = translator(fourthCharacterState)
        ~ temp charNameFive = translator(fifthCharacterState)
        {charNameFive}: terza lettera
        
        {
            - fifthCharacterPossibleStates has Riccio: 
                {charNameFive}: xy
            - fifthCharacterPossibleStates has Capibara:
                {charNameFive}: zz
        }
            
        ~ fifthWritingPause = fifthWritingPauseDuration
            -> main
