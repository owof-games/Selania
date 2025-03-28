=== bus_stop ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
//Qui non compaiono anime e animelle
//Da qui possiamo riprendere una storia in corso, o prenderne una nuova. Se c'è una storia in corso le altre non sono accessibili, e plausibilmente vedremo il fantasma di turno che ci aspetta.
{bus_stop==1: <i>Questa è la stazione del treno.|<i>{~ La stazione profuma di partenze.|La panchina aspetta fremente una nuova conoscenza.|Sulle vette la luce brilla leggera.|Un vento fresco ti sospinge lungo la strada.|Le lettere ondeggiano sulla bacheca.|L'odore della foresta scalda il sentiero.}</i>}
    + [Mi guardo attorno.]
    -
        -> main
        
        
=== starting_note ===
    + {are_two_entities_together(StartingNote, PG)}[StartingNote]
        ???: Ti scrivo perché volevo ringraziarti per quello che hai fatto.
        ???: Le cose nella mia vita hanno ripreso a funzionare.
        ???: Ci sono ancora molte giornate giornate no, ma molto più spesso anche delle giornate sni.
        ???: E persino qualche giornata YEAH!
        ???: Spero che un giorno potrai avere anche tu la tua giornata yeah.
        ???: E magari di passarla assieme.
            -> main


=== first_character_notes ===
    ~ temp charNameOne = uppercaseTranslator(firstCharacterState)
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    
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
    ~ temp charNameOne = uppercaseTranslator(firstCharacterState)
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    
    {charNameOne}: Ciao {name}, come stai?
    {charNameOne}: Alla fine Talco è sempre statə qui, me idiota.
    {charNameOne}: E ha creduto alla mia storia!
    {charNameOne}: Ora si è messə in testa di insegnare agli scoiattoli a suonare le noci.
       {
            - firstCharacterPossibleStates has Triangolo:
                {charNameOne}: Io, invece, non riesco a prendere uno strumento in mano da che sono tornata.
                
            - firstCharacterPossibleStates has RagazzaOrchestra:
                {charNameOne}: Questa piccola idiota invece (me) ha deciso di creare un piccolo esercito di suonatrici in difesa degli alberi.
                
            - firstCharacterPossibleStates has FlautoDolce:
                {charNameOne}: Io invece per la prima volta sto provando a comporre un brano da cantare con tutte le persone a cui voglio bene.
                {charNameOne}: E quando mi demoralizzo, Talco è subito lì a tirarmi su di morale.
                {charNameOne}: Tu e quel posto mi avete reso una mollacciona.
                {charNameOne}: Ma non è così male, alla fine.
                
            - firstCharacterPossibleStates has Ocarina:
                {charNameOne}: Io invece sto addestrando due topolini per suonare lo xilofono, e se la cavano alla grande!
                {charNameOne}: Se lo dico a mio padre mi fa ricoverare subito, ma amen.
                {charNameOne}: Sono felice ama, davvero felice.
                
            - firstCharacterPossibleStates has Violino:
                {charNameOne}: Io invece mi sono resa conto che forse, con la musica, possiamo parlare con gli animali.
                {charNameOne}: No, non ho esagerato col vinello.
                {charNameOne}: Ma pensaci, ama: se così fosse, potrei dimostrare che siamo tutt3 collegat3, che potremmo parlarci e comunicare tra noi!
        }
    {charNameOne}: Spero che lì vada tutto bene.
    {charNameOne}: E che {charNameFive} non sia sempre pesantona.
    {charNameOne}: Alla prossima lettera.
    {charNameOne}: <i>{charNameOne}</i>
            ~ firstWritingPause = firstWritingPauseDuration
        -> main
    
    = two
    ~ temp charNameOne = uppercaseTranslator(firstCharacterState)
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    
    {charNameOne}: Ciao {name}, qui è sempre {charNameOne} che ti scrive.
    {charNameOne}: Sono passate settimane dal mio ritorno, e finalmente ho avuto il coraggio di parlare con mio padre.
       {
            - firstCharacterPossibleStates has Triangolo:
                {charNameOne}: Non è che avete un traduttore padre/figlia da quelle parti?
                {charNameOne}: Quando gli ho detto che seguirò il suo consiglio e mi cercherò un lavoro vero, è sembrato deluso.
                {charNameOne}: Nei prossimi giorni farò un colloquio nella agenzia dove lavora.
                {charNameOne}: Forse smistare merci è un altro modo di suonare musica.
                
            - firstCharacterPossibleStates has RagazzaOrchestra:
                {charNameOne}: Le cose non sono andate bene, abbiamo litigato per tutto il tempo.
                {charNameOne}: A volte la mia rabbia mi triggera, non è qualcosa che pensavo nemmeno di possedere.
                {charNameOne}: Per assurdo però da quando gli ho detto che è la mia vita e ho il diritto di fare i miei errori, ci sentiamo più spesso.
                {charNameOne}: Non so se voglio rivederlo subito, ma forse le cose stanno cambiando per il meglio.
                
            - firstCharacterPossibleStates has FlautoDolce:
                {charNameOne}: Gli ho parlato di nonno, e gli ho detto che voglio seguire le sue tracce.
                {charNameOne}: Sul momento è rimasto interdetto, ma poi si è messo a piangere.
                {charNameOne}: Mi ha chiesto del tempo per decidere se e cosa potrebbe fare per aiutarmi.
                
            - firstCharacterPossibleStates has Ocarina:
                {charNameOne}: Ha passato il tempo a dirmi che non prendo nulla sul serio.
                {charNameOne}: Parlargli dell'orchestra di topolini e scoiattoli non ha aiutato, ama.
                {charNameOne}: Forse cambierà idea quando avrò finito di addestrare le falene.
                {charNameOne}: O più plausibilmente mi taglierà tutti i fondi.
                
            - firstCharacterPossibleStates has Violino:
                {charNameOne}: Per la prima volta credo di averlo capito.
                {charNameOne}: Non ci siamo trovate, non riesce a comprendere perché per me sia importante fare qualcosa di utile per l'umanità e blah blah blah.
                {charNameOne}: Ma ho visto nella sua preoccupazione la paura sincera che possa avere una vita difficile.
                {charNameOne}: Mi ha fatto insieme tenerezza e dispiacere.
        }
    {charNameOne}: E lì invece? Come stanno le tue piante?
    {charNameOne}: Sono arrivate nuove persone interessanti?
    {charNameOne}: Sicuro, mai quanto me!
    {charNameOne}: A presto, <i>{charNameOne}</i>.
        ~ firstWritingPause = firstWritingPauseDuration
        -> main
        
    = three
    ~ temp charNameOne = uppercaseTranslator(firstCharacterState)
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    
    {charNameOne}: Ciao ama!
    {charNameOne}: Indovina chi ha fatto il suo primo concerto?
    
     {
            - firstCharacterPossibleStates has Triangolo:
                {charNameOne}: Non io ovviamente.
                {charNameOne}: Il lavoro di smistamento si mangia le giornate.
                {charNameOne}: Per Talco ha spaccato!
                {charNameOne}: Quando ha finito sono scoppiata a piangere.
                {charNameOne}: L3 am3 pensavano fosse gioia.
                {charNameOne}: Non ho avuto il coraggio di dire loro che temo di aver fatto la scelta peggiore della mia vita.
                {charNameOne}: La peggiore.

                
            - firstCharacterPossibleStates has RagazzaOrchestra:
                {charNameOne}: Il collettivo!
                {charNameOne}: Ci chiamiamo EDERE, che è un acronimo di cui non ricordo manco più il significato ma è tipo: ci attacchiamo agli alberi e non ci leviamo più.
                {charNameOne}: E a questo giro la pula non ci ha levate, perché c'era troppa gente ed è stato un casino assurdo.
                {charNameOne}: Alcune compagne sono critiche perché temono che abbiamo spaventato la fauna.
                {charNameOne}: Credo che abbiano ragione.
                {charNameOne}: Anche se questa cosa mi rompe le ovaie.
                {charNameOne}: Ma vedremo di trovare una soluzione.

                
            - firstCharacterPossibleStates has FlautoDolce:
                {charNameOne}: Il nonno!
                {charNameOne}: O meglio, una cover band che abbiamo tirato su con l3 am3.
                {charNameOne}: Abbiamo anche un suo cartonato che portiamo in giro.
                {charNameOne}: Ho incontrato vecchie che l'hanno conosciuto.
                {charNameOne}: E ho scoperto cose nuove su di lui.
                {charNameOne}: Anche cose che non avrei voluto sapere.
                {charNameOne}: Il nonno era un chillone totale comunque, e ora voglio imparare da lui.
    
                
            - firstCharacterPossibleStates has Ocarina:
                {charNameOne}: I topolini!
                {charNameOne}: In teoria dovevano esserci anche gli scoiattoli, ma le luci li hanno spaventati.
                {charNameOne}: O forse quei bambini del cazzo.
                {charNameOne}: Che in teoria erano vietati.
                {charNameOne}: Però è stata una roba toppissima ama.
                {charNameOne}: Non so se lì prende ma nel caso cercaci su internet perché abbiamo spaccato.
      
                
            - firstCharacterPossibleStates has Violino:
                {charNameOne}: Madre natura!
                {charNameOne}: No dai, non il primo.
                {charNameOne}: Il primo che abbiamo registrato.
                {charNameOne}: La prima collaborazione tra umani, funghi e piante.
                {charNameOne}: E sembra che ora parte delle nostre note stiano vibrano nel terreno.
                {charNameOne}: Un gruppo di scienziati ha trovato frequenze simili alle nostre in un bosco a cento chilometri e passa di distanza!
                {charNameOne}: Chi l'avrebbe detto che mi sarebbero piaciuti gli scienziati?
                {charNameOne}: Ora però dobbiamo anche imparare ad ascoltare.
                {charNameOne}: Perché facile che ci siano altre canzoni in giro da eoni.
                {charNameOne}: E questa sarà la parte difficile.
                {charNameOne}: Non vedo l'ora!
        }
    {charNameOne}: Comunque un giorno mi piacerebbe che la musica, questa musica arrivasse anche dalle vostre parti.
    {charNameOne}: O che, quando te ne andrai da lì, verrai ad ascoltarla con me.
    {charNameOne}: Un saluto.
    {charNameOne}: {charNameOne}.
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
    ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
    {charNameTwo}: Sono a lezione e mi sto rompendo e quindi ho deciso di scrivere a {name};
    {charNameTwo}: Cioè a te.
    {charNameTwo}: Anche se non ho mica capito come te la mando la lettera.
    {charNameTwo}: Ma come sta la rana?
    {charNameTwo}: Hai scoperto poi se è elettrica?
        {
            - secondCharacterPossibleStates has IlRiccio:
                {charNameTwo}: Qui le cose sono strane.
                {charNameTwo}: Forse perché sono uguali a prima.
                {charNameTwo}: Ora passo più tempo in camera.
                {charNameTwo}: Papà è contento perché dice che non rompo.
                {charNameTwo}: Mamma è preoccupata perché vuole che gioco con gli altri.
                {charNameTwo}: A volte guardo fuori dalla finestra e basta.
                {charNameTwo}: E vado a letto e non correggo più nulla.
                {charNameTwo}: Mi addormento, e aspetto.
                {charNameTwo}: A volte voglio tornare lì da voi.
                {charNameTwo}: Ma non so cosa fare.
                {charNameTwo}: La prof di matematica mi guarda male.
                {charNameTwo}: Ci sentiamo {name}.
                
            - secondCharacterPossibleStates has IlGrizzly:
                {charNameTwo}: Oggi per la prima volta ho litigato con papà.
                {charNameTwo}: Nel senso che non è stato mica lui a cominciare ma io.
                {charNameTwo}: Ha cercato di picchiarmi e gli ho urlato che è un bullo.
                {charNameTwo}: E poi ho preso i miei libri e glieli ho tirati contro.
                {charNameTwo}: Lui si è arrabbiato così tanto, {name}!
                {charNameTwo}: E allora ho urlato.
                {charNameTwo}: Urlato come un orso.
                {charNameTwo}: Che si dice che ho bramito quindi.
                {charNameTwo}: E lui se ne è andato sbattendo la porta, urlando a mamma che ha tirato su un deficiente.
                {charNameTwo}: Però sono felice perché ho meno paura ora.
                {charNameTwo}: Mamma mi guarda strano.
                {charNameTwo}: Ma so che tu mica mi avresti guardato così.
                {charNameTwo}: Salutami la rana!
                
            - secondCharacterPossibleStates has IlLupo:
                {charNameTwo}: L'altro giorno ho parlato col l'amico di mio fratello.
                {charNameTwo}: Gli ho detto che per me siamo un branco ma che secondo me lui mica mi ci vede in questo branco.
                {charNameTwo}: E lui mi ha detto una cosa strana.
                {charNameTwo}: Che non ce l'ha con me.
                {charNameTwo}: Ma che non sa parlare coi bambini.
                {charNameTwo}: Allora gli ho detto di non parlarmi come un bambino.
                {charNameTwo}: Che so cosa sono i lupi, le frazioni, l'elettricità.
                {charNameTwo}: Lui ha riso e mi ha detto: "Ma sai creare un muffin?".
                {charNameTwo}: E mi ha insegnato a fare i muffin.
                {charNameTwo}: Mi sono divertito tanto.
                {charNameTwo}: E voglio portartene uno.
                {charNameTwo}: A presto!
                
                
            - secondCharacterPossibleStates has IlDelfino:
                {charNameTwo}: A scuola sto finendo tantissimo nei guai.
                {charNameTwo}: Ho iniziato a fare qualche dispetto ai bambini prepotenti.
                {charNameTwo}: Secondo me hanno funzionato, ma le maestre si sono arrabbiate.
                {charNameTwo}: Soprattutto per l'inchiostro sulle loro scarpe.
                {charNameTwo}: Ma non è colpa mia se si sono messe in mezzo!
                {charNameTwo}: Però mi sono fatto due nuovi amici, e l'altro giorno abbiamo passato mezz'ora in castigo assieme.
                {charNameTwo}: Quando la maestra di matematica è tornata e ha trovato la stanza tutta legata con lo spago, ha detto una parolaccia grossa.
                {charNameTwo}: Ma grossa grossa.
                {charNameTwo}: Quando l'ho ridetta a mio fratello è scoppiato a ridere.
                {charNameTwo}: Ma forse qui non te la scrivo, per ora.
                {charNameTwo}: Ci vediamo!
                
                
            - secondCharacterPossibleStates has IlCapibara:
                {charNameTwo}: Ieri ho avuto una conversazione da grandi con mio fratello.
                {charNameTwo}: Me l'ha fatta perché ho chiamato il suo amico "frocio" quando mi ha sgridato.
                {charNameTwo}: E non avevo fatto nulla di male.
                {charNameTwo}: A parte mettere della tempera nel suo frullatore.
                {charNameTwo}: Mio fratello mi ha spiegato perché fa male quella parola.
                {charNameTwo}: E perché papà la usa quando è arrabbiato.
                {charNameTwo}: Mi ha detto che tantissime persone usano quella parola come scusa per fare del male ad altre persone.
                {charNameTwo}: E lo fanno perché hanno paura.
                {charNameTwo}: E poi mi ha portato in una associazione che serve per chi è come mio fratello o il suo amico e non vuole più avere paura.
                {charNameTwo}: E io non avevo mai capito che si possono fare tutte queste cose assieme.
                {charNameTwo}: Mi è dispiaciuto tantissimo aver fatto male al suo amico.
                {charNameTwo}: Però sono anche contento che mi hanno detto le cose per bene dopo tutti questi anni.
                {charNameTwo}: E tu hai paura di alcune persone?
                {charNameTwo}: Ciao ciao!
                
                
            - secondCharacterPossibleStates has IlCorvo:
                {charNameTwo}: L'altro giorno ho detto a mamma e papà che voglio diventare un veterinario.
                {charNameTwo}: Per studiare e salvare gli animali.
                {charNameTwo}: Mamma ha detto che allora forse dovrei diventare un etologo (questo l'ho fatto scrivere a lei).
                {charNameTwo}: Quando poi ne ho parlato con mio fratello, mi ha detto che questa estate se voglio mi fa conoscere una persona che fa una cosa bellissima: salva gli animali dai laboratori.
                {charNameTwo}: Mio fratello dice che studiare è importante, ma che per cambiare le cose devo capire come lottare.
                {charNameTwo}: Avevo capito che dovevo lasciarla via la rabbia, {name}.
                {charNameTwo}: Ma lui mi dice che la rabbia serve.
                {charNameTwo}: Va solo mandata nella giusta direzione.
                {charNameTwo}: Ti scriverò appena scopro qual è quella giusta e quale è quella sbagliata.
                {charNameTwo}: Ciao!
        }
        ~ secondWritingPause = secondWritingPauseDuration
            -> main
    
    = two
    ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
    {charNameTwo}: Che strano.
    {charNameTwo}: Ho lasciato l'altra lettera sul comodino di notte.
    {charNameTwo}: E poi è sparita.
    {charNameTwo}: Non so mica se ti è arrivata.
    {charNameTwo}: O se papà l'ha buttata.
        {
            - secondCharacterPossibleStates has IlRiccio:
                {charNameTwo}: Le cose a scuola vanno male.
                {charNameTwo}: L'altro giorno ho picchiato un bambino perché mi ha chiamato "strano".
                {charNameTwo}: E l'ho spinto dalle scale.
                {charNameTwo}: Ora sono in sospensione, a casa.
                {charNameTwo}: Papà è sparito da due giorni.
                {charNameTwo}: Mamma piange in camera.
                {charNameTwo}: Io non so come mi sento.
                {charNameTwo}: Però ho ripreso a fare esperimenti.
                {charNameTwo}: In un vecchio libro un bambino disegnava la porta sul muro, e andava in un altro mondo.
                {charNameTwo}: Forse se trovo il modo posso tornare da voi.
                {charNameTwo}: Mi mancate.
                {charNameTwo}: Ciao.
                
    
            - secondCharacterPossibleStates has IlGrizzly:
                {charNameTwo}: Se l'ha buttata urlo di nuovo, vediamo che mi dice poi.
                {charNameTwo}: Però ti dovevo dire questa cosa: sono nella squadra di calcio.
                {charNameTwo}: Non sono mica bravo, sinceramente.
                {charNameTwo}: Questa roba delle forza e della velocità non è roba mia proprio.
                {charNameTwo}: Però dice l'allenatore che ho strategia.
                {charNameTwo}: Mamma me l'ha fatto fare perché dice che devo scaricare tutta questa "rabbia da ragazzino".
                {charNameTwo}: E non mi chiama più bambino.
                {charNameTwo}: Negli spogliatoi ci sono state delle risse.
                {charNameTwo}: Ho dato un pugno straforte a uno più grande.
                {charNameTwo}: E ora a scuola non mi rompono più le scatole.
                {charNameTwo}: Se qualcuno ti rompe le scatole {name} chiamami.
                {charNameTwo}: E ti aiuto io.
                {charNameTwo}: Ciao!
                
                
            - secondCharacterPossibleStates has IlLupo:
                {charNameTwo}: Ma non credo: le cose negli ultimi giorni vanno meglio.
                {charNameTwo}: Con l'amico di mio fratello ho fatto dei muffin per lui e mamma.
                {charNameTwo}: E poi gli ho detto che mi dispiace quando litigano.
                {charNameTwo}: E che ho capito che essere grandi fa schifo, ma che ci sono anche cose belle.
                {charNameTwo}: Come andare al mare.
                {charNameTwo}: Mamma si è messa a piangere.
                {charNameTwo}: Papà è stato in silenzio tantissimo.
                {charNameTwo}: E ho iniziato a pensare che mi avrebbe picchiato.
                {charNameTwo}: Invece ha detto: domani si fa vacanza e si va a nuotare tutti assieme.
                {charNameTwo}: Mamma l'ha abbracciato, e si è mangiata un intero muffin.
                {charNameTwo}: Ti dico poi come è andata!
                {charNameTwo}: A presto.
                
                
            - secondCharacterPossibleStates has IlDelfino:
                {charNameTwo}: In questi giorni ho ripreso a dire delle bugie.
                {charNameTwo}: Ma invece di dirle piccole, le sto dicendo grandissime.
                {charNameTwo}: E questa cosa fa divertire i miei nuovi amici.
                {charNameTwo}: E anche qualche maestra.
                {charNameTwo}: Mamma dice che da grande devo fare il comico.
                {charNameTwo}: Papà è banale e dice che devo fare il politico.
                {charNameTwo}: Mio fratello è preoccupato, perché teme che mi metto nei pasticci.
                {charNameTwo}: Gioco: una di queste cose che ho detto non è vera.
                {charNameTwo}: Tu lo capisci quale?
                {charNameTwo}: Salutami la rana!
                {charNameTwo}: {charNameTwo}.
                
                
            - secondCharacterPossibleStates has IlCapibara:
                {charNameTwo}: Dopo che gli ho detto che lui usa quella parola con mio fratello perché ha paura, non mi parla più.
                {charNameTwo}: Mamma dice che lui ha paura di tutte le cose, ma non lo sa dire.
                {charNameTwo}: Le ho detto che ci sono delle associazioni.
                {charNameTwo}: Lei ha sorriso e mi ha detto che sto davvero diventando grande.
                {charNameTwo}: Però continuo a pensarci a questa cosa delle associazioni.
                {charNameTwo}: Tu lo sai che io ho paura per gli animali.
                {charNameTwo}: E mi hai insegnato che le cose si affrontano con gli amici.
                {charNameTwo}: Magari non sono bravo a farmi degli amici, ma sono bravo a parlare degli animali.
                {charNameTwo}: E forse ci riesco a fare qualcosa così, come mio fratello fa per i suoi amici.
                {charNameTwo}: Devo solo capire cosa.
                {charNameTwo}: Vorrei tanto chiederlo alla rana.
                {charNameTwo}: Salutamela!
            
            
            
            - secondCharacterPossibleStates has IlCorvo:
                {charNameTwo}: Ultimamente parliamo di più.
                {charNameTwo}: Gli piace parlare di politica.
                {charNameTwo}: Secondo me dice cose stupide, ma forse nelle sue cose stupide c'è lui, le sue paure.
                {charNameTwo}: Almeno così dice l'amico di mio fratello.
                {charNameTwo}: Oggi siamo stati da nonna.
                {charNameTwo}: Ho dovuto insistere perché avevano paura che ci rimanevo male.
                {charNameTwo}: Si no boh.
                {charNameTwo}: Mi è spiaciuto quando non mi ha riconosciuto.
                {charNameTwo}: Però è sempre la nonna.
                {charNameTwo}: Quando mamma ha parlato con l'infermiera ho preso un mazzo di carte.
                {charNameTwo}: Era sporco e mancava l'asso di picche.
                {charNameTwo}: Ma nonna ha ricordato tutti i trucchi e mi ha stracciato.
                {charNameTwo}: Stammi bene!
                {charNameTwo}: {charNameTwo}.
        }    
    ~ secondWritingPause = secondWritingPauseDuration
        -> main
    
    = three
    ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState) 
    {charNameTwo}: Ciao {name}.
            {
            - secondCharacterPossibleStates has IlRiccio:
                {charNameTwo}: Ti scrivo da casa di mio fratello.
                {charNameTwo}: Novità: ora vivo qui!
                {charNameTwo}: All'inizio il suo amico non era contento, ma ora mi insegna anche a fare i dolci!
                {charNameTwo}: Fa anche delle caramelle superbuone.
                {charNameTwo}: Papà non è più tornato.
                {charNameTwo}: Mamma non ha nemmeno fatto storie quando me ne sono andato.
                {charNameTwo}: Non mi sento mica felice.
                {charNameTwo}: Sì no boh.
                {charNameTwo}: Che cosa strana da scrivere.
                {charNameTwo}: Però le cose sono diverse.
                {charNameTwo}: A volte abbasso le spine.
                {charNameTwo}: A volte mi addormento sul divano mentre guardo i telefilm con mio fratello.
                {charNameTwo}: E non ho mica paura.
                {charNameTwo}: Spero che tu non abbia paura.
                {charNameTwo}: Salutami {charNameFive}.
                {charNameTwo}: Ti voglio bene.
                
                
                
            - secondCharacterPossibleStates has IlGrizzly:
                {charNameTwo}: Sono SUPER ARRABBIATO.
                {charNameTwo}: CON MIO FRATELLO.
                {charNameTwo}: Non avevamo mai litigato, mai.
                {charNameTwo}: Ma l'altro giorno è venuto a casa e mi ha detto che sto diventando come papà.
                {charNameTwo}: Papà si è incazzato con lui e mi ha difeso.
                {charNameTwo}: Mio fratello dice che sto diventando un bullo.
                {charNameTwo}: Che un suo amico maestro a scuola gli ha detto che me la prendo coi più piccoli.
                {charNameTwo}: Papà gli ha detto che mi faccio rispettare.
                {charNameTwo}: E che non sono una checca come lui.
                {charNameTwo}: Lui mio fratello.
                {charNameTwo}: Non sono mica abituato a mio padre così.
                {charNameTwo}: Ma poi in camera mi è preso male tutto.
                {charNameTwo}: Mi manca mio fratello.
                {charNameTwo}: Mi mancate voi.
                {charNameTwo}: Vorrei sapere cosa fare.
                
            
            - secondCharacterPossibleStates has IlLupo:
                {charNameTwo}: Oggi sono triste, e non so perché.
                {charNameTwo}: Ho dato un pugno a un ragazzo delle medie, ma non mi è mica piaciuto.
                {charNameTwo}: A casa le cose vanno bene, ma.
                {charNameTwo}: Sì no boh.
                {charNameTwo}: Mica pensavo che è così faticoso.
                {charNameTwo}: Mamma e papà sono tranquilli solo se siamo assieme.
                {charNameTwo}: Mi sembra un lavoro.
                {charNameTwo}: E se sono giù si preoccupano tantissimo.
                {charNameTwo}: E se si preoccupano tornano a litigare.
                {charNameTwo}: Non so mica cosa fare.
                {charNameTwo}: Forse {charNameFive} li può aiutare?
                {charNameTwo}: Mi mancate.
                {charNameTwo}: {charNameTwo}.
                
                
                
            - secondCharacterPossibleStates has IlDelfino:
                {charNameTwo}: Se non l'hai capito nell'ultima lettera solo l'ultima frase non era vera: tutte le altre lo erano.
                {charNameTwo}: Però è successa una cosa divertente, {name}!
                {charNameTwo}: La prof di matematica mi ha detto che le mie bugie sono storie.
                {charNameTwo}: E che le storie sono da conservare.
                {charNameTwo}: E quindi abbiamo aperto assieme a altri bambini un giornale della scuola.
                {charNameTwo}: Faremo uscire per tutto il resto dell'anno i nostri racconti e le notizie.
                {charNameTwo}: Mi ha solo chiesto di non scrivere più quella parolaccia che lei ha detto.
                {charNameTwo}: E di non dire niente sulla preside o si arrabbia.
                {charNameTwo}: E allora ti saluto dicendoti quella parolaccia, perché poi non la potrò più scrivere.
                {charNameTwo}: "Per il catarro del cammello!"
                {charNameTwo}: Che schifo, {name}.
                {charNameTwo}: Ma lì ci sono i cammelli?
                {charNameTwo}: Un saluto.
                {charNameTwo}: {charNameTwo}.
                
                
                
            - secondCharacterPossibleStates has IlCapibara:
                {charNameTwo}: Questo cervellino (il mio cervellino) ha trovato una soluzione.
                {charNameTwo}: Ho parlato con la prof di matematica, e le ho detto delle mie paure.
                {charNameTwo}: Degli animali che spariscono, dei boschi che bruciano.
                {charNameTwo}: Dei ghiacciai.
                {charNameTwo}: Lei mi ha detto che possiamo raccogliere dei soldi ma sì no boh.
                {charNameTwo}: Io pensavo all'associazione di mio fratello e del suo fidanzato, e loro insegnano a non avere paura non a spendere soldi.
                {charNameTwo}: Allora mi ha fatto fare una lezione in classe su queste cose.
                {charNameTwo}: Ho spiegato le paure.
                {charNameTwo}: E poi ho detto che se ci mettiamo assieme ci sono anche le soluzioni.
                {charNameTwo}: Alcuni compagni hanno detto che ci possiamo trovare nel campetto il pomeriggio.
                {charNameTwo}: E quindi forse qualcosa sta iniziando, {name}.
                {charNameTwo}: Non so cosa faremo, però è bello non farlo da solo.
                {charNameTwo}: E vorrei tanto tu fossi qui con me, ora.
                {charNameTwo}: Secondo me ci diresti tantissime cose sagge.
                {charNameTwo}: Salutami la rana.
                {charNameTwo}: {charNameTwo}.
            
            - secondCharacterPossibleStates has IlCorvo:
                {charNameTwo}: Ieri è successa una cosa fighissima.
                {charNameTwo}: Ti ricordi quell'amica di mio fratello, che dovevo conoscere al mare?
                {charNameTwo}: Sta da tre giorni da lui perché dice che è stata buttata fuori di casa.
                {charNameTwo}: E mi ha raccontato tante cose che mica sapevo.
                {charNameTwo}: Cose brutte che vengono fatte agli animali.
                {charNameTwo}: Ma, {name}: non aveva paura.
                {charNameTwo}: Lei dice che sono sveglio, e che per questo non devo avere paura perché posso capire tutto.
                {charNameTwo}: E che magari un giorno trovo un modo per salvare gli animali.
                {charNameTwo}: Mi ha regalato un romanzo di Ursula LeGuin (ho dovuto guardare la copertina, è un nome difficile).
                {charNameTwo}: Non sapevo di potere imparare cose dai romanzi.
                {charNameTwo}: Oggi ho chiesto alla maestra di matematica di darmi dei libri sull'ambiente.
                {charNameTwo}: Ci sono così tante cose da imparare, {name}, così tante!
                {charNameTwo}: Spero ci vedremo presto.
                {charNameTwo}: Salutami la rana!
                {charNameTwo}: {charNameTwo}.
                
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
    ~ temp charNameThree = uppercaseTranslator(thirdCharacterState)
    {charNameThree}: Lettere random note da parte della personaggia
        ~ thirdWritingPause = thirdWritingPauseDuration
        -> main
    
    = two
    ~ temp charNameThree = uppercaseTranslator(thirdCharacterState)
    {charNameThree}: seconda lettera
        ~ thirdWritingPause = thirdWritingPauseDuration
        -> main
    
    = three
    ~ temp charNameThree = uppercaseTranslator(thirdCharacterState)
    {charNameThree}: terza lettera
        ~ thirdWritingPause = thirdWritingPauseDuration
        -> main
    
=== fourth_character_notes ===
    + {are_two_entities_together(FourthCharacterNotes, PG)}[FourthCharacterNotes]
    Lettere random note da parte della personaggia
    -> main

=== fifth_character_notes ===
    + {are_two_entities_together(FifthCharacterNotes, PG)}[FifthCharacterNotes]
    Lettere random note da parte della personaggia
    -> main
