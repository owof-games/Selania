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
        ???: Grazie per quello che hai fatto, Mentore.
        ???: Le cose qui ora hanno ripreso a funzionare.
        ???: Spero un giorno di incontarti ancora.
            -> main

-> main

=== first_character_notes ===
    ~ temp charNameOne = uppercaseTranslator(firstCharacterState)
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
    {charNameOne}: Ciao {name}, come stai?
    {charNameOne}: Alla fine Talco è sempre statə qui.
    {charNameOne}: Non pensavo avrebbe creduto alla mia storia, sai?
    {charNameOne}: E invece ora si è messə in testa di insegnare agli scoiattoli a suonare le noci.
       {
            - firstCharacterPossibleStates has Triangolo:
                {charNameOne}: Io, invece, non riesco a prendere uno strumento in mano da che sono tornata.
            - firstCharacterPossibleStates has RagazzaOrchestra:
                {charNameOne}: Voglio creare un piccolo esercito di suonatori in difesa degli alberi.
            - firstCharacterPossibleStates has FlautoDolce:
                {charNameOne}: Io invece per la prima volta sto provando a comporre un brano da cantare con tutte le persone a cui voglio bene.
                {charNameOne}: E quando mi demoralizzo, Talco è subito lì a tirarmi su di morale.
            - firstCharacterPossibleStates has Ocarina:
                {charNameOne}: Io invece sto addestrando due topolini per suonare lo xilofono, e se la cavano alla grande!
            - firstCharacterPossibleStates has Violino:
                {charNameOne}: Sembrerà assurdo, ma mi sono resa conto che forse, con la musica, possiamo parlare con gli animali.
                {charNameOne}: Se così fosse, potrei dimostrare che siamo tutto fuorché distanti.
        }
    {charNameOne}: Spero che lì vada tutto bene.
    {charNameOne}: Alla prossima lettera.
    {charNameOne}: <i>{charNameOne}</i>
            ~ firstWritingPause = firstWritingPauseDuration
        -> main
    
    = two
    {charNameOne}: Ciao {name}, qui è sempre {charNameOne}.
    {charNameOne}: Sono passate settimane dal mio ritorno, e finalmente ho avuto il coraggio di parlare con mio padre.
       {
            - firstCharacterPossibleStates has Triangolo:
                {charNameOne}: Quando gli ho detto che seguirò il suo consiglio e mi cercherò un lavoro vero, è sembrato deluso.
                {charNameOne}: Nei prossimi giorni farò un colloquio nella agenzia dove lavora.
                {charNameOne}: Forse smistare merci è un altro modo di suonare musica.
            - firstCharacterPossibleStates has RagazzaOrchestra:
                {charNameOne}: Le cose non sono andate bene, abbiamo litigato per tutto il tempo.
                {charNameOne}: Sinceramente a volte la mia rabbia mi spaventa, non è qualcosa che pensavo nemmeno di possedere.
                {charNameOne}: Per assurdo però da quando gli ho detto che è la mia vita e ho il diritto di fare i miei errori, ci sentiamo più spesso.
                {charNameOne}: Non so se voglio rivederlo subito, ma forse le cose stanno cambiando per il meglio.
            - firstCharacterPossibleStates has FlautoDolce:
                {charNameOne}: Gli ho parlato di nonno, e gli ho detto che voglio seguire le sue tracce.
                {charNameOne}: Sul momento è rimasto interdetto, ma poi si è messo a piangere.
                {charNameOne}: Mi ha chiesto del tempo per decidere se e cosa potrebbe fare per aiutarmi.
            - firstCharacterPossibleStates has Ocarina:
                {charNameOne}: Ha passato il tempo a dirmi che non prendo nulla sul serio.
                {charNameOne}: Parlargli dell'orchestra di topolini e scoiattoli non ha aiutato.
                {charNameOne}: Forse cambierà idea quando avrò finito di addestrare le falene.
            - firstCharacterPossibleStates has Violino:
                {charNameOne}: Per la prima volta credo di averlo capito.
                {charNameOne}: Non ci siamo trovati, non riesce a comprendere perché per me sia importante fare qualcosa di utile, di trasformativo per tutt3.
                {charNameOne}: Ma ho visto nella sua preoccupazione la paura sincera che possa avere una vita difficile.
                {charNameOne}: Spero un giorno di scrivere una canzone che gli faccia capire che l'unica vita difficile per me è una vita che non pensa al prossimo.
        }
    {charNameOne}: E lì invece? Come stanno le tue piante?
    {charNameOne}: Sono arrivate nuove persone interessanti?
    {charNameOne}: A presto, <i>{charNameOne}</i>.
        ~ firstWritingPause = firstWritingPauseDuration
        -> main
        
    = three
    {charNameOne}: terza lettera
        ~ firstWritingPause = firstWritingPauseDuration
    -> main
    
=== second_character_notes ===
//Mettere cose sul rapporto con nonna, papà. mamma, fratello, animali, futuro.
    + {are_two_entities_together(SecondCharacterNotes, PG)}[SecondCharacterNotes]
    
    {
            - not one:
                -> one
                
            - not two && secondWritingPause < 0:
                -> two
                
            - not three && secondWritingPause < 0:
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
                {charNameTwo}: Sembrerà assurdo, ma mi sono resa conto che forse, con la musica, possiamo parlare con gli animali.
            - secondCharacterPossibleStates has IlCorvo:
                {charNameTwo}: Io, invece, non riesco a prendere uno strumento in mano da che sono tornata.    
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
                {charNameTwo}: Sembrerà assurdo, ma mi sono resa conto che forse, con la musica, possiamo parlare con gli animali.
            - secondCharacterPossibleStates has IlCorvo:
                {charNameTwo}: Io, invece, non riesco a prendere uno strumento in mano da che sono tornata.    
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
                {charNameTwo}: Sembrerà assurdo, ma mi sono resa conto che forse, con la musica, possiamo parlare con gli animali.
            - secondCharacterPossibleStates has IlCorvo:
                {charNameTwo}: Io, invece, non riesco a prendere uno strumento in mano da che sono tornata.    
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
