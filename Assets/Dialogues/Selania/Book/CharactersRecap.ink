/* ---------------------------------

   First Char Recap

 ----------------------------------*/

=== first_character_recap
+ {are_two_entities_together(FirstRecap, PG)} [FirstRecap]
~ enableBigDialogue()


{
    - first_character_notes.three:
        <b><i>Terza lettera di {charNameOne}.</b></i>: <>
        
            Ciao ama! Indovina chi ha fatto il suo primo concerto? <>

           {
                - firstCharacterPossibleStates has Triangolo:
                    Non io ovviamente. Il lavoro di smistamento si mangia le giornate. Però Talco ha spaccato! Quando ha finito sono scoppiata a piangere. L3 am3 pensavano fosse gioia. Non ho avuto il coraggio di dire loro che temo di aver fatto la scelta peggiore della mia vita. La peggiore. <>
                    
                - firstCharacterPossibleStates has RagazzaOrchestra:
                    Il collettivo! Ci chiamiamo EDERE, che è un acronimo di cui non ricordo manco più il significato ma è tipo: ci attacchiamo agli alberi e non ci leviamo più. E a questo giro la pula non ci ha levate, perché c'era troppa gente ed è stato un casino assurdo. Alcune compagne sono critiche perché temono che abbiamo spaventato la fauna. Credo che abbiano ragione. Anche se questa cosa mi rompe le ovaie. Ma vedremo di trovare una soluzione. <>
                    
                - firstCharacterPossibleStates has FlautoDolce:
                    Il nonno! O meglio, una cover band che abbiamo tirato su con l3 am3. Abbiamo anche un suo cartonato che portiamo in giro. Ho incontrato vecchie che l'hanno conosciuto. E ho scoperto cose nuove su di lui. Anche cose che non avrei voluto sapere. Il nonno era un chillone totale comunque, e ora voglio imparare da lui. <>
                    
                - firstCharacterPossibleStates has Ocarina:
                    I topolini! In teoria dovevano esserci anche gli scoiattoli, ma le luci li hanno spaventati. O forse quei bambini del cazzo. Che in teoria erano vietati. Però è stata una roba toppissima ama. Non so se lì prende ma nel caso cercaci su internet perché abbiamo spaccato. <>
                    
                - firstCharacterPossibleStates has Violino:
                    Madre natura! No dai, non il primo. Il primo che abbiamo registrato. La prima collaborazione tra umani, funghi e piante. E sembra che ora parte delle nostre note stiano vibrano nel terreno. Un gruppo di scienziati ha trovato frequenze simili alle nostre in un bosco a cento chilometri e passa di distanza! Chi l'avrebbe detto che mi sarebbero piaciuti gli scienziati? Ora però dobbiamo anche imparare ad ascoltare. Perché facile che ci siano altre canzoni in giro da eoni. E questa sarà la parte difficile. Non vedo l'ora! <>
            }
            Comunque un giorno mi piacerebbe che la musica, questa musica arrivasse anche dalle vostre parti. O che, quando te ne andrai da lì, verrai ad ascoltarla con me. Un saluto. <b>{charNameOne}</b>.
}


{
    - first_character_notes.two:
        <b><i>Seconda lettera di {charNameOne}.</b></i>: <>
        
        Ciao {name}, qui è sempre {charNameOne} che ti scrive. Sono passate settimane dal mio ritorno, e finalmente ho avuto il coraggio di parlare con mio padre. <>

           {
                - firstCharacterPossibleStates has Triangolo:
                    Non è che avete un traduttore padre/figlia da quelle parti? Quando gli ho detto che seguirò il suo consiglio e mi cercherò un lavoro vero, è sembrato deluso. Nei prossimi giorni farò un colloquio nella agenzia dove lavora. Forse smistare merci è un altro modo di suonare musica. <>
                    
                - firstCharacterPossibleStates has RagazzaOrchestra:
                    Le cose non sono andate bene, abbiamo litigato per tutto il tempo. A volte la mia rabbia mi triggera, non è qualcosa che pensavo nemmeno di possedere. Per assurdo però da quando gli ho detto che è la mia vita e ho il diritto di fare i miei errori, ci sentiamo più spesso. Non so se voglio rivederlo subito, ma forse le cose stanno cambiando per il meglio. <>
                    
                - firstCharacterPossibleStates has FlautoDolce:
                    Gli ho parlato di nonno, e gli ho detto che voglio seguire le sue tracce. Sul momento è rimasto interdetto, ma poi si è messo a piangere. Mi ha chiesto del tempo per decidere se e cosa potrebbe fare per aiutarmi. <>
                    
                - firstCharacterPossibleStates has Ocarina:
                    Ha passato il tempo a dirmi che non prendo nulla sul serio. Parlargli dell'orchestra di topolini e scoiattoli non ha aiutato, ama. Forse cambierà idea quando avrò finito di addestrare le falene. O più plausibilmente mi taglierà tutti i fondi. <>
                    
                - firstCharacterPossibleStates has Violino:
                    Per la prima volta credo di averlo capito. Non ci siamo trovate, non riesce a comprendere perché per me sia importante fare qualcosa di utile per l'umanità e blah blah blah. Ma ho visto nella sua preoccupazione la paura sincera che possa avere una vita difficile. Mi ha fatto insieme tenerezza e dispiacere. <>
            }
        E lì invece? Come stanno le tue piante? Sono arrivate nuove persone interessanti? Sicuro, nessunə più interessante di me! A presto, <b>{charNameOne}</b>.
}

{
    - first_character_notes.one:
        ~ temp charNameOne = translator(firstCharacterState)
        ~ temp charNameFive = translator(fifthCharacterState)
        <b><i>Prima lettera di {charNameOne}.</b></i>: <>
    
    
        Ciao {name}, come stai? Alla fine Talco è sempre statə qui, me idiota. E ha creduto alla mia storia! Ora si è messə in testa di insegnare agli scoiattoli a suonare le noci. <>

           {
                - firstCharacterPossibleStates has Triangolo:
                    Io, invece, non riesco a prendere uno strumento in mano da che sono tornata. <>
                    
                - firstCharacterPossibleStates has RagazzaOrchestra:
                    Questa piccola idiota invece (me) ha deciso di creare un piccolo esercito di suonatrici in difesa degli alberi. <>
                    
                - firstCharacterPossibleStates has FlautoDolce:
                    Io invece per la prima volta sto provando a comporre un brano da cantare con tutte le persone a cui voglio bene.
                    E quando mi demoralizzo, Talco è subito lì a tirarmi su di morale.
                    Tu e quel posto mi avete reso una mollacciona.
                    Ma non è così male, alla fine. <>
                    
                - firstCharacterPossibleStates has Ocarina:
                    Io invece sto addestrando due topolini per suonare lo xilofono, e se la cavano alla grande!
                    Se lo dico a mio padre mi fa ricoverare subito, ma amen.
                    Sono felice ama, davvero felice. <>
                    
                - firstCharacterPossibleStates has Violino:
                    Io invece mi sono resa conto che forse, con la musica, possiamo parlare con gli animali.
                    No, non ho esagerato col vinello.
                    Ma pensaci, ama: se così fosse, potrei dimostrare che siamo tutt3 collegat3, che potremmo parlarci e comunicare tra noi! <>
            }
        Spero che lì vada tutto bene. E che {charNameFive} non sia sempre pesantona. Alla prossima lettera. <b>{charNameOne}</b>
}


{
    - first_story_gift.ink_outcome: <b><i>Appunti su dono e riscrittura:</b></i> <>
}

{
    - first_character_feedback: Mentore dice che <>

        {
            - firstCharacterPossibleStates has Triangolo: ho aiutato {translator(firstCharacterState)} a trovare il suo lato più pratico e razionale, ma che forse non era quello di cui aveva bisogno.
                
            - firstCharacterPossibleStates has RagazzaOrchestra: ora {translator(firstCharacterState)} ha accolto un'indole più oppositiva e attiva, forse però non qualcosa che sia nella sua natura.
                            
            - firstCharacterPossibleStates has FlautoDolce: probabilmente {translator(firstCharacterState)} sapeva già che gli affetti sono una cosa fondamentale per lei. Si chiede se è il massimo che potevamo fare.
                            
            - firstCharacterPossibleStates has Ocarina: ora {translator(firstCharacterState)} che ha accolto gioco e creatività è più felice. Ma Mentore non sembra convinta di questa scelta.
            
            - firstCharacterPossibleStates has Violino: abbiamo fatto un gran lavoro assieme, perché {translator(firstCharacterState)} aveva bisogno di riconoscere che per lei la vita ha senso solo con uno scopo più grande.
            
            - firstCharacterPossibleStates has Chitarra: non tutte le persone sono disposte a cambiare, e se Chitarra è rimasta {translator(firstCharacterState)}, non è una mia colpa.
        
        }
}

{rewriting_proposal_first_character.ending: Dopo la Riscrittura, ha scelto un nuovo nome: <b><i>{translator(firstCharacterState)}.</b></i>}



//Appunto sul dono fatto
{
    - first_story_gift.ink_outcome:
        {
            - firstGift == EderaDelleAmanti:
                Le ho donato una foglia di <b><i>Edera delle Amanti</b></i>, ma non ha compreso il significato del mio dono. <>
                
            - firstGift == BaccaDellaAddolorata:
                Le ho donato una <b><i>Bacca dell'Addolorata</b></i> e ha sorriso, si è rasserenata. <>
                
            - firstGift == LaSpazzata:
                Le ho donato un rametto della <b><i>Spazzata</b></i> e, infastidita, l'ha lanciato via. <>
                
            - firstGift == BrinaDellImpossibile: 
                Le ho donato un frammento di <b><i>Brina dell'Impossibile</b></i> e l'ha gettato a terra, spaventata. Almeno sono ricomparse le linee della mia mano. <>
                
            - firstGift == CantoDelleCompagne: 
                Le ho donato una goccia di <b><i>Canto delle Compagne</b></i> e si è messa a cantare il nome delle persone amate. <>
                
            - firstGift == LicheneDegliAbissi: 
                Le ho donato una traccia dell'odore del <b><i>Lichene degli Abissi</b></i> ed era palesemente delusa. <>
                
            - firstGift == NonTiScordarDiTe: 
                Le ho donato l'impronta del <b><i>Non Ti Scordar Di Te</b></i>: ha sussurrato "nonno" e ha inizito a piangere. <>
                
            - firstGift == CardoAspinato: 
                Le ho donato un ciuffo di peli di <b><i>Cardo Aspinato</b></i> e sul momento sembra disgustata, ma poi si è messa a ridere. <>
        
        }


{
    - rewriting_proposal_first_character:
        Dopo il dono, Chitarra mi ha detto di aver capito perché si sia ritrovata con questo nome. Crede che la Chitarra sia il segno del rimanere nel medio, nella cosa più ovvia, e questo perché mentre tutte le persone care le fanno pressioni su cosa scegliere o meno per il suo futuro, lei ha solo paura. Crede che una scelta chiuda strade, deluda persone, o possa portarti in luoghi sbagliati. E a quel punto non ci sia modo di tornare indietro. Forse, allora, è meglio che siano le altre persone a scegliere per te.
    
}        

}

    {
        - knowing_first_character.one:
            <b><i>Appunti dalle conversazioni.</b></i> <>
    }

    {
        - knowing_first_character.twelve:
            Chitarra mi ha parlato di sua madre. È stata la madre a permetterle di frequentare il conservatorio, ma con l'obiettivo di portare prestigio alla famiglia. Chitarra sa che non è possibile, che per il mondo della classica è già vecchia, ma la madre non è pronta a capirlo.
        
    }
    
    {
        - knowing_first_character.eleven:
            Per la prima volta Chitarra mi ha parlato della sua famiglia d'origine. La passione per la musica l'ha presa dal padre, ma era il nonno paterno ad essere musicista. Da piccola poteva sentire le vecchie registrazioni del nonno, giocare coi suoi strumenti. Ma ora che è grande suo padre tiene queste cose come delle reliquie. E se prima rideva molto, ora ha smesso. E vuole che la figlia si trovi "un lavoro vero".
        
    }
    
    {
        - knowing_first_character.ten:
            Chitarra mi ha raccontato qualcosa di diverso. L'anno scorso assieme ad altr3 attivist3 ha protetto gli alberi di un parco per una settimana, alberi che il Comune voleva abbattere. E quando ha sentito gli alberi cantare nel silenzio, si è sentita viva. Poi sono arrivati i poliziotti, hanno arrestato tutt3, gli alberi son stati abbattuti, e Chitarra è tornata a sentirsi inutile.
        
    }

    {
        - knowing_first_character.nine:
            Chitarra pensa di non far schifo a parlare.
        
    }

    {
        - knowing_first_character.eight:
            È tornata a parlare del Ghiberti. Dice che sembra felice ma in realtà sorride come un robot. Ed è tornata sul discorso dell'errore. Secondo Chitarra l'errore serve per fare esperienza e comunità. Se non si sbaglia non si cresce. Se non si sbaglia non c'è occasione per il perdono. Nei numerini del Ghiberti per Chitarra c'è la morte.
        
    }

    {
        - knowing_first_character.seven:
            Chitarra ha ritirato fuori quel professore, il Ghiberti. E gli sta sulle scatole perché vede la musica come qualcosa di matematico. È una cosa che non le piace, perché rende l'idea che esistano errore e verità, e cito: "anche perché quelli pieni di verità hanno sempre finito per ammazzare quell3 come me e Talco."
        
    } 
    
    {
        - knowing_first_character.six:
            Chitarra mi ha raccontato la storia di questo ragazzo, Jonah. Un prodigio che dopo una carriera sfolgorante in Cina ha deciso di tornare in Italia, e le cose gli sono andate di merda. Non si capisce se ora mendichi, suoni per i ricchi, o lavori in un supermercato. Ma la storia di Jonah lascia una domanda a Chitarra: cosa fare quando si sa fare bene solo una cosa ma il mondo non permette di farla? Si accettano compromessi o si muore di fame? O si aspetta fino a quando non è il mondo a decidere per te?
        
    }

    {
        - knowing_first_character.five:
            Chitarra ama fare festa, ed è abituata ad essere circondata da persone. Vive con cinque amich3, e poi ci sono l3 ospiti. D'estate fanno le feste sul tetto dove suonano e cantano. Il silenzio di questo posto la fa star male, perché può sentire i propri pensieri.
        
    } 

    {
        - knowing_first_character.four:
            A Chitarra il silenzio pesa, e molto. Senza musica teme di sbroccare.
        
    } 
    
    {
        - knowing_first_character.three:
            Ogni persona vicina a Chitarra sembra avere un'idea su come lei dovrebbe vivere la sua vita. Anna, una delle sue amiche, insiste perché divenga assistete di un suo professore, tal Ghiberti. Olga vuole che metta su una band e sfondi per locali. Talco vuole che partecipi a qualche reality musicale. Ed Ennio pensa che abbia completamente sbagliato strada. Tutte queste persone sono famiglia per Chitarra, ed è frustrata perché qualsiasi scelta prenderà, delulderà qualcunə.
        
    }
    
    {
        - knowing_first_character.two:
            Chitarra sembra davvero persa senza Talco. Da tanto non andava in giro senza di ləi. Di sicuro, sembra non avere in simpatia Mentore.
        
    }    
    
    {
        - knowing_first_character.one:
            Ho conosciuto una persona nuova, si chiama Chitarra. Quando l'ho incontrata era preoccupata perché non riesce a trovare lə sua migliore amicə, Talco. Non le piace molto il suo nome, ha l'impressione che essere una Chitarra per una come lei, che ha fatto il conservatorio, significhi arrendersi. Quando mi ha chiesto che nome dovrebbe avere secondo me, non sono {pronouns has him:stato|{pronouns has her:stata|statə}} capace di darle una risposta.
        
    }
    





//Eventuale commento della rana.


-> rewriter_book_with_flow

/* ---------------------------------

   Second Char Recap

 ----------------------------------*/

=== second_character_recap
+ {are_two_entities_together(SecondRecap, PG)} [SecondRecap]
        ~ temp charNameTwo = translator(secondCharacterState)
        ~ temp charNameFive = translator(fifthCharacterState)
~ enableBigDialogue()


{
    - second_character_notes.three:
    <b><i>Terza lettera di {charNameTwo}.</b></i>: <>
        Ciao {name}. <>

           {
                - secondCharacterPossibleStates has Riccio:
                    Ti scrivo da casa di mio fratello. Novità: ora vivo qui! All'inizio il suo amico non era contento, ma ora mi insegna anche a fare i dolci! Fa anche delle caramelle superbuone. Papà non è più tornato. Mamma non ha nemmeno fatto storie quando me ne sono andato. Non mi sento mica felice. Sì no boh. Che cosa strana da scrivere. Però le cose sono diverse. A volte abbasso le spine. A volte mi addormento sul divano mentre guardo i telefilm con mio fratello. E non ho mica paura. Spero che tu non abbia paura. Salutami {charNameFive}. Ti voglio bene. <>
 
                - secondCharacterPossibleStates has Grizzly:
                    Sono SUPER ARRABBIATO. CON MIO FRATELLO. Non avevamo mai litigato, mai. Ma l'altro giorno è venuto a casa e mi ha detto che sto diventando come papà. Papà si è incazzato con lui e mi ha difeso. Mio fratello dice che sto diventando un bullo. Che un suo amico maestro a scuola gli ha detto che me la prendo coi più piccoli. Papà gli ha detto che mi faccio rispettare. E che non sono una checca come lui. Lui mio fratello. Non sono mica abituato a mio padre così. Ma poi in camera mi è preso male tutto. Mi manca mio fratello. Mi mancate voi. Vorrei sapere cosa fare. <>
                    
                - secondCharacterPossibleStates has Lupo:
                    Oggi sono triste, e non so perché. Ho dato un pugno a un ragazzo delle medie, ma non mi è mica piaciuto. A casa le cose vanno bene, ma. Sì no boh. Mica pensavo che è così faticoso. Mamma e papà sono tranquilli solo se siamo assieme. Mi sembra un lavoro. E se sono giù si preoccupano tantissimo. E se si preoccupano tornano a litigare. Non so mica cosa fare. Forse {charNameFive} li può aiutare? Mi mancate. <b>{charNameTwo}</b>. <>

                    
                - secondCharacterPossibleStates has Delfino:
                    Se non l'hai capito nell'ultima lettera solo l'ultima frase non era vera: tutte le altre lo erano. Però è successa una cosa divertente, {name}! La prof di matematica mi ha detto che le mie bugie sono storie. E che le storie sono da conservare. E quindi abbiamo aperto assieme a altri bambini un giornale della scuola. Faremo uscire per tutto il resto dell'anno i nostri racconti e le notizie. Mi ha solo chiesto di non scrivere più quella parolaccia che lei ha detto. E di non dire niente sulla preside o si arrabbia. E allora ti saluto dicendoti quella parolaccia, perché poi non la potrò più scrivere. "Per il catarro del cammello!" Che schifo, {name}. Ma lì ci sono i cammelli? Un saluto. <>
                    
                - secondCharacterPossibleStates has Capibara:
                    Questo cervellino (il mio cervellino) ha trovato una soluzione. Ho parlato con la prof di matematica, e le ho detto delle mie paure. Degli animali che spariscono, dei boschi che bruciano. Dei ghiacciai. Lei mi ha detto che possiamo raccogliere dei soldi ma sì no boh. Io pensavo all'associazione di mio fratello e del suo fidanzato, e loro insegnano a non avere paura non a spendere soldi. Allora mi ha fatto fare una lezione in classe su queste cose. Ho spiegato le paure. E poi ho detto che se ci mettiamo assieme ci sono anche le soluzioni. Alcuni compagni hanno detto che ci possiamo trovare nel campetto il pomeriggio. E quindi forse qualcosa sta iniziando, {name}. Non so cosa faremo, però è bello non farlo da solo. E vorrei tanto tu fossi qui con me, ora. Secondo me ci diresti tantissime cose sagge. Salutami la rana. {charNameTwo}. <>
                    
                - secondCharacterPossibleStates has Corvo:
                    Ieri è successa una cosa fighissima. Ti ricordi quell'amica di mio fratello, che dovevo conoscere al mare? Sta da tre giorni da lui perché dice che è stata buttata fuori di casa. E mi ha raccontato tante cose che mica sapevo. Cose brutte che vengono fatte agli animali. Ma, {name}: non aveva paura. Lei dice che sono sveglio, e che per questo non devo avere paura perché posso capire tutto. E che magari un giorno trovo un modo per salvare gli animali. Mi ha regalato un romanzo di Ursula LeGuin (ho dovuto guardare la copertina, è un nome difficile). Non sapevo di potere imparare cose dai romanzi. Oggi ho chiesto alla maestra di matematica di darmi dei libri sull'ambiente. Ci sono così tante cose da imparare, {name}, così tante! Spero ci vedremo presto. Salutami la rana! <b>{charNameTwo}</b>. <>
            }
        PS: Ma poi hai scoperto cos'è quella statua nella foresta? PPS: Ho un segreto che riguarda la serra, ma te lo dirò con la prossima lettera! Ciao ciao!
}


{
    - second_character_notes.two:
        <b><i>Seconda lettera di {charNameTwo}.</b></i>: <>
        Che strano. Ho lasciato l'altra lettera sul comodino di notte. E poi è sparita. Non so mica se ti è arrivata. O se papà l'ha buttata. <>

           {
                - secondCharacterPossibleStates has Riccio:
                    Le cose a scuola vanno male. L'altro giorno ho picchiato un bambino perché mi ha chiamato "strano". E l'ho spinto dalle scale. Ora sono in sospensione, a casa. Papà è sparito da due giorni. Mamma piange in camera. Io non so come mi sento. Però ho ripreso a fare esperimenti. In un vecchio libro un bambino disegnava la porta sul muro, e andava in un altro mondo. Forse se trovo il modo posso tornare da voi. Mi mancate. Ciao. <>
                    
                - secondCharacterPossibleStates has Grizzly: 
                    Se l'ha buttata urlo di nuovo, vediamo che mi dice poi. Però ti dovevo dire questa cosa: sono nella squadra di calcio. Non sono mica bravo, sinceramente. Questa roba delle forza e della velocità non è roba mia proprio. Però dice l'allenatore che ho strategia. Mamma me l'ha fatto fare perché dice che devo scaricare tutta questa "rabbia da ragazzino". E non mi chiama più bambino. Negli spogliatoi ci sono state delle risse. Ho dato un pugno straforte a uno più grande. E ora a scuola non mi rompono più le scatole. Se qualcuno ti rompe le scatole {name} chiamami E ti aiuto io. Ciao! <>
                    
                - secondCharacterPossibleStates has Lupo:
                    Ma non credo: le cose negli ultimi giorni vanno meglio. Con l'amico di mio fratello ho fatto dei muffin per lui e mamma. E poi gli ho detto che mi dispiace quando litigano. E che ho capito che essere grandi fa schifo, ma che ci sono anche cose belle. Come andare al mare. Mamma si è messa a piangere. Papà è stato in silenzio tantissimo. E ho iniziato a pensare che mi avrebbe picchiato. Invece ha detto: domani si fa vacanza e si va a nuotare tutti assieme. Mamma l'ha abbracciato, e si è mangiata un intero muffin. Ti dico poi come è andata! A presto. <>
                    
                - secondCharacterPossibleStates has Delfino:
                    In questi giorni ho ripreso a dire delle bugie. Ma invece di dirle piccole, le sto dicendo grandissime. E questa cosa fa divertire i miei nuovi amici. E anche qualche maestra. Mamma dice che da grande devo fare il comico. Papà è banale e dice che devo fare il politico. Mio fratello è preoccupato, perché teme che mi metto nei pasticci. Gioco: una di queste cose che ho detto non è vera. Tu lo capisci quale? Salutami la rana! <b>{charNameTwo}</b>. <>
                    
                - secondCharacterPossibleStates has Capibara:
                    Dopo che gli ho detto che lui usa quella parola con mio fratello perché ha paura, non mi parla più. Mamma dice che lui ha paura di tutte le cose, ma non lo sa dire. Le ho detto che ci sono delle associazioni. Lei ha sorriso e mi ha detto che sto davvero diventando grande. Però continuo a pensarci a questa cosa delle associazioni. Tu lo sai che io ho paura per gli animali. E mi hai insegnato che le cose si affrontano con gli amici. Magari non sono bravo a farmi degli amici, ma sono bravo a parlare degli animali. E forse ci riesco a fare qualcosa così, come mio fratello fa per i suoi amici. Devo solo capire cosa. Vorrei tanto chiederlo alla rana. Salutamela! <>
                    
                - secondCharacterPossibleStates has Corvo:
                    Ultimamente parliamo di più. Gli piace parlare di politica. Secondo me dice cose stupide, ma forse nelle sue cose stupide c'è lui, le sue paure. Almeno così dice l'amico di mio fratello. Oggi siamo stati da nonna. Ho dovuto insistere perché avevano paura che ci rimanevo male. Si no boh. Mi è spiaciuto quando non mi ha riconosciuto. Però è sempre la nonna. Quando mamma ha parlato con l'infermiera ho preso un mazzo di carte. Era sporco e mancava l'asso di picche. Ma nonna ha ricordato tutti i trucchi e mi ha stracciato. Stammi bene! <b>{charNameTwo}</b>. <>
     
            }
        PS: mi piace mettere i PS, su internet non ci sono. PPS: ma sono arrivate persone nuove poi? Qualcuna con dei dolci magari?
}


{
    - second_character_notes.one:
        <b><i>Prima lettera di {charNameTwo}.</b></i>: <>
    
        Sono a lezione e mi sto rompendo e quindi ho deciso di scrivere a {name}. Cioè a te. Anche se non ho mica capito come te la mando la lettera. Ma come sta la rana? Hai scoperto poi se è elettrica? <>

           {
                - secondCharacterPossibleStates has Riccio:
                    Qui le cose sono strane. Forse perché sono uguali a prima. Ora passo più tempo in camera. Papà è contento perché dice che non rompo. Mamma è preoccupata perché vuole che gioco con gli altri. A volte guardo fuori dalla finestra e basta. E vado a letto e non correggo più nulla. Mi addormento, e aspetto. A volte voglio tornare lì da voi. Ma non so cosa fare. La prof di matematica mi guarda male. Ci sentiamo {name}. <>
                    
                - secondCharacterPossibleStates has Grizzly:
                    Oggi per la prima volta ho litigato con papà. Nel senso che non è stato mica lui a cominciare ma io. Ha cercato di picchiarmi e gli ho urlato che è un bullo. E poi ho preso i miei libri e glieli ho tirati contro. Lui si è arrabbiato così tanto, {name}! E allora ho urlato. Urlato come un orso. Che si dice che ho bramito quindi. E lui se ne è andato sbattendo la porta, urlando a mamma che ha tirato su un deficiente. Però sono felice perché ho meno paura ora. Mamma mi guarda strano. Ma so che tu mica mi avresti guardato così. <>
                    
                - secondCharacterPossibleStates has Lupo: 
                    L'altro giorno ho parlato con l'amico di mio fratello. Gli ho detto che per me siamo un branco ma che secondo me lui mica mi ci vede in questo branco. E lui mi ha detto una cosa strana. Che non ce l'ha con me. Ma che non sa parlare coi bambini. Allora gli ho detto di non parlarmi come un bambino. Che so cosa sono i lupi, le frazioni, l'elettricità. Lui ha riso e mi ha detto: "Ma sai creare un muffin?". E mi ha insegnato a fare i muffin. Mi sono divertito tanto. E voglio portartene uno. <>
                    
                - secondCharacterPossibleStates has Delfino:
                    A scuola sto finendo tantissimo nei guai. Ho iniziato a fare qualche dispetto ai bambini prepotenti. Secondo me hanno funzionato, ma le maestre si sono arrabbiate. Soprattutto per l'inchiostro sulle loro scarpe. Ma non è colpa mia se si sono messe in mezzo! Però mi sono fatto due nuovi amici, e l'altro giorno abbiamo passato mezz'ora in castigo assieme. Quando la maestra di matematica è tornata e ha trovato la stanza tutta legata con lo spago, ha detto una parolaccia grossa. Ma grossa grossa. Quando l'ho ridetta a mio fratello è scoppiato a ridere. Ma forse qui non te la scrivo, per ora. <>
                    
                - secondCharacterPossibleStates has Capibara:
                    Ieri ho avuto una conversazione da grandi con mio fratello. Me l'ha fatta perché ho chiamato il suo amico "frocio" quando mi ha sgridato. E non avevo fatto nulla di male. A parte mettere della tempera nel suo frullatore. Mio fratello mi ha spiegato perché fa male quella parola. E perché papà la usa quando è arrabbiato. Mi ha detto che tantissime persone usano quella parola come scusa per fare del male ad altre persone. E lo fanno perché hanno paura. E poi mi ha portato in una associazione che serve per chi è come mio fratello o il suo amico e non vuole più avere paura. E io non avevo mai capito che si possono fare tutte queste cose assieme. Mi è dispiaciuto tantissimo aver fatto male al suo amico. Però sono anche contento che mi hanno detto le cose per bene dopo tutti questi anni. E tu hai paura di alcune persone? <>
                    
                - secondCharacterPossibleStates has Corvo:
                    L'altro giorno ho detto a mamma e papà che voglio diventare un veterinario. Per studiare e salvare gli animali. Mamma ha detto che allora forse dovrei diventare un etologo (questo l'ho fatto scrivere a lei, che però vuole sapere chi sei, è preoccupata). Quando poi ne ho parlato con mio fratello, mi ha detto che questa estate se voglio mi fa conoscere una persona che fa una cosa bellissima: salva gli animali dai laboratori. Mio fratello dice che studiare è importante, ma che per cambiare le cose devo capire come lottare. Avevo capito che dovevo lasciarla via la rabbia, {name}. Ma lui mi dice che la rabbia serve. Va solo mandata nella giusta direzione. Ti scriverò appena scopro qual è quella giusta e quale è quella sbagliata. <>
                
     
            }
          PS: come sta {charNameFive}? Mi spiace per come l'ho trattata mentre ero lì, sai? Ma non dirglielo. Per ora per lo meno. Ciao!
}

//Appunto sul dono fatto

{
    - second_story_gift.ink_outcome: <b><i>Appunti su dono e riscrittura:</b></i> <>
}

{

    - second_character_feedback: Dopo aver aiutato {charNameTwo}, Mentore mi ha detto che <>
            {
            - secondCharacterPossibleStates has Grizzly:
                "il nostro bambino" ha abbracciato il lato rabbioso, e l'ha fatto proprio. E lei non è una fan della rabbia.
            
            - secondCharacterPossibleStates has Lupo: forse un giorno la nonna e il fratello di {charNameTwo} torneranno a vivere sotto il tetto dei genitori. E questo senso di famiglia così forte per lei sarebbe un finale davvero felice.
            
            - secondCharacterPossibleStates has Delfino:
                è perplessa, perché ho reso {charNameTwo} un giullare.
                            
            - secondCharacterPossibleStates has Capibara:
                non sempre il mondo può essere come vuole lei, e che non è una grande fan dell'idea che l'unione faccia la forza.
            
            - secondCharacterPossibleStates has Corvo:
                non avrei potuto ottenere un esito migliore. Che ce lo vede a studiare nuovi modi per curare le persone, o ridurre la fame nel mondo. O creare una begonia totalmente nera.
            
            - secondCharacterPossibleStates has Riccio: forse avrebbe dovuto darmi più aiuto (o forse che io dovrei ascoltare di più le altre persone) perché {charNameTwo} non si è liberato né delle paure, né dell'atteggiamento violento.
        }

}

{rewriting_proposal_second_character.ending: Dopo la nostra conversazione, Riccio ha scelto un nuovo nome: <b><i>{charNameTwo}.}


{
    - second_story_gift.ink_outcome:
        {
            - secondGift == EderaDelleAmanti:
                Gli ho donato una foglia di <b><i>Edera delle Amanti</b></i>, e mi ha guardato imbarazzato. <>
                
            - secondGift == BaccaDellaAddolorata:
                Gli ho donato una <b><i>Bacca dell'Addolorata</b></i> ma non gli è interessata. <>
                
            - secondGift == LaSpazzata:
                Gli ho donato un rametto della <b><i>Spazzata</b></i> e si è esaltato, ha continuato a rigirarsi il frammento tra le dita, pieno di gioia rabbiosa. <>
                
            - secondGift == BrinaDellImpossibile: 
                Gli ho donato un frammento di <b><i>Brina dell'Impossibile</b></i> e ha iniziato a tremare e piangere. Le linee della mia mano sono ricomparse. <>
                
            - secondGift == CantoDelleCompagne: 
                Gli ho donato una goccia di <b><i>Canto delle Compagne</b></i>: ha provato ad assaggiarla e ha vomitato. <>
                
            - secondGift == LicheneDegliAbissi: 
                Gli ho donato una traccia dell'odore del <b><i>Lichene degli Abissi</b></i>, ha provato a dire qualcosa ma poi si è zittito. <>
                
            - secondGift == NonTiScordarDiTe: 
                Gli ho donato l'impronta del <b><i>Non Ti Scordar Di Te</b></i>: mi ha abbracciato, per poi allontanarsi imbarazzato. <>
                
            - secondGift == CardoAspinato: 
                Gli ho donato un ciuffo di peli di <b><i>Cardo Aspinato</b></i> e si è messo a ridere, poi mi ha ringraziato. <>
        
        }    

}


{
- rewriting_proposal_second_character: 
        Dopo il dono, Riccio mi ha detto che da quando la nonna è nella casa dei vecchi, tutto fa schifo. Suo padre è tornato e litiga sempre con sua madre. Se il padre non c'è, la madre si incazza con lui, e gli dice di smetterla di piangere e di fare il grande. Le maestre sono "fastidiose". Il fratello dice che il mondo è un posto orribile e irreparabile. Gli animali spariranno tutti per colpa nostra. I grandi fanno schifo e per questo non vuole crescere. E ha inventato la storia del compleanno perché se non inventa motivi, nessuno lo ascolta.
}


{
    - knowing_second_character.one:
           <b><i>Appunti dalle conversazioni.</b></i> <>
}

{
    - knowing_second_character.twelve:
        Riccio ama la biblioteca, e l'altra nonna, una che vive al mare, ha tantissimi libri. Ama stare in quel posto, anche perché sua madre e suo padre non ci vanno. E così può passare il tempo che suo fratello e il suo amico, studiare con la nonna del mare. Al mare quando va a letto non deve "correggere le giornate". L'altra nonna è nella "casa dei vecchi", e per questo Riccio ora vorrebbe andare a vivere con la nonna del mare. E mi ha invitato a leggere i libri della biblioteca che avrà quando sarà grande.
    
}

{
    - knowing_second_character.eleven:
        Il piccolo chimico Riccio ama fare pasticci: si è intossicato mischiando prodotti per la pulizia; ha riempito il letto della madre di sabbia; ha distrutto il frullatore dell'amico del fratello. Però ha scoperto cos'è l'elettricità e i fili elettrici nel muro, e questo l'ha reso felice. Ritiene che noi (noi chi Riccio, noi chi?) non ci facciamo abbastanza domande su questo posto, e che quindi tocchi a lui trovare le risposte.
    
}


{
    - knowing_second_character.ten:
        Riccio mi ha raccontato di un bambino che ha picchiato a scuola. L'ha picchiato fino a farlo piangere, e allora si è arrabbiato ancora di più. La maestra di matematica l'ha messo in castigo. Ora lui si sente in colpa, vorrebbe chiedergli scusa ma il bimbo scappa, e la sorellina una volta gli ha lanciato una scarpa in faccia. Secondo il fratello fare a botte è normale. Il padre dà la colpa a Riccio, quando lo picchia. E Riccio vorrebbe né farsi picchiare né picchiare. Ma non sa cosa fare quando è arrabbiato. E ha chiuso dicendo: "Essere adulti è terribile. Ma non è bello nemmeno essere bambini".
    
}


{
    - knowing_second_character.nine:
        Riccio e il lavoro. Ovvero: tutti l3 su3 compagn3 fanno mille cose, e lui invece è interessato solo agli animali. Ma ha paura che non esisteranno più animali quando sarà grande per via del cambiamento climatico. E per questo non vuole diventare grande, ma nemmeno restare bambino. Però gli piacerebbe fare il veterinario.
    
}


{
    - knowing_second_character.eight:
        Ha iniziato a dirmi delle cose sul fratello (che è campione di Karate, che ha una macchina enorme, e muscoli etc.) ma poi ha detto subito che stava mentendo. Suo fratello e suo padre litigano spesso. Il fratello lavora in una officina, crea statue coi pezzi rotti delle auto, e vive con un amico. E va a trovare Riccio solo quando il padre non c'è. Mentre Riccio va a trovarlo poco, perché l'amico non gli sembra felice quando Riccio va da loro. Però fa dei dolci buonissimi.
    
}


{
    - knowing_second_character.seven:
        Abbiamo uno scrittore. O per lo meno, un Riscrittore. Perché Riccio la sera va a letto presto per "correggere le giornate", immaginarle in modo diverso, per far sì che i suoi non litighino, o che sia più forte degli altri bambini così che gli altri divengano suoi amici. E ha provato a leccare la rana.
    
}


{
    - knowing_second_character.six:
        A quanto pare dalla serra è scomparso l'innaffiatoio. E quando ne ho parlato con Riccio, mi ha detto che a scuola tutti gli danno la colpa. Che i grandi lo picchiano, anche se lui è felice di non piangere perché "non sono una femmina". Non va d'accordo con le compagne, e le maestre lo mettono sempre in castigo. Anche se sembra che gli abbia dato più fastidio che quella di matematica si sia mostrata dispiaciuta per lui, dopo aver parlato con la nonna. Comunque dice che l'innaffiatoio è dove l'ho lasciato.
    
}


{
    - knowing_second_character.five:
        Sembra che ci sia una rana nello stagno, e Riccio è preso benissimo. E la rana gli ha detto che ha un regalo per me. Buffo.
    
}




{
    - knowing_second_character.four:
        Riccio mi ha parlato di sua nonna. Dice che lei non lo tratta come un bambino, e che gli ha insegnato a barare con le carte. Il tempo passato con lei sembra davvero bello. Il padre a un certo punto se ne è andato, e lei ha aiutato la mamma di Riccio "a stare bene". Ma quando suo padre è tornato, la madre ha ripreso a trattare male la nonna. Che ha detto a Riccio che i grandi fanno cose cattive senza saperlo. E poi ha detto che gli dispiace essere scappato di casa. E mi ha chiesto scusa per le bugie: non è il suo compleanno, la madre non gli ha organizzato alcuna festa. Ha promesso di non mentire più.
    
}


{
    - knowing_second_character.him_liar:
        Riccio mi ha chiesto finalmente il nome. E quando ha capito che sono un maschio, si è lamentato di Mentore. Poi ha tirato fuori di nuovo il discorso delle action figures. La madre sembra faccia storie nel comprargli cose, e non vuole prendere niente che lei lega alla violenza. Il fratello lo fa giocare alla Switch.
    
}

{
    - knowing_second_character.her_liar:
        Riccio mi ha chiesto finalmente il nome. Ma non ha apprezzato che io sia una ragazza. Dice che le ragazze sono strane. Che sua mamma è strana, ma le vuole bene. Anche se si dimentica le cose, tipo che oggi si è dimenticata il suo compleanno. E non sa che lui è qui.
    
}

{
    - knowing_second_character.they_liar:
        Riccio mi ha chiesto finalmente il nome. E quando gli ho detto che uso i pronomi neutri, mi ha detto che vorrebbe anche lui un pronome <i>strano</i>. Non il modo peggiore di reagire, direi. Poi ha detto che sua mamma si è dimenticata il suo compleanno, e anche quello dell'anno scorso. E che l'anno scorso per farsi perdonare gli ha regalato una action figure di Spidreman, anche se lui preferisce le Tartarughe Ninja.
    
}


{
    - knowing_second_character.two:
        Non ci sono altri bambini, non ne ha invitati. Il bimbo è preso bene dagli animali che vivono qui, è una specie di Wikipedia delle bestiole. Ma quando gli ho fatto presente che ha picchiato Mentore, non l'ha presa bene. E ha detto che se Mentore non lo lascia in pace, chiamerà il suo fortissimo fratello. A proposito di Mentore: ha detto che le ricorda un Riccio, e penso che per comodità lo chaimerò così.
    
}



{
    - knowing_second_character.one:
        È comparso un bambino. È partito chiedendomi come mai fossi qui, senza nemmeno presentarsi, senza chiedermi il nome. E poi mi ha raccontato che è il suo compleanno, che sua mamma gli ha promesso una festa FIGHISSIMA (l'ha urlato). E che suo padre gli ha rubato le action figures lo scorso anno, e per questo non potrà venire qui alla festa quest'anno. E mi ha chiesto di cercare i suoi compagni di scuola.
    
}




    -> rewriter_book_with_flow



=== third_character_recap
+ {are_two_entities_together(ThirdRecap, PG)} [ThirdRecap]
~ enableBigDialogue()

{
    - knowing_third_character.one: prima informazione.
    
}

{
    - knowing_third_character.two: prima informazione.
    
}

{
    - knowing_third_character.three: prima informazione.
    
}

{
    - knowing_third_character.four: prima informazione.
    
}

{
    - knowing_third_character.five: prima informazione.
    
}

{
    - knowing_third_character.six: prima informazione.
    
}

{
    - knowing_third_character.seven: prima informazione.
    
}

{
    - knowing_third_character.eight: prima informazione.
    
}

{
    - knowing_third_character.nine: prima informazione.
    
}

{
    - knowing_third_character.ten: prima informazione.
    
}

{
    - knowing_third_character.eleven: prima informazione.
    
}

{
    - knowing_third_character.twelve: prima informazione.
    
}

//Appunto sul dono fatto
{
    - third_story_gift.ink_outcome:
    {
    
        - thirdGift == EderaDelleAmanti:
            Ho donato dell'Edera delle Amanti e la reazione è stata:
        - thirdGift == BaccaDellaAddolorata:
            Ho donato della Bacca dell'Addolorata e la reazione è stata:
        - thirdGift == LaSpazzata:
            Ho donato della Spazzata e la reazione è stata:
        - thirdGift == BrinaDellImpossibile: 
            Ho donato della Brina dell'Impossibile e la reazione è stata:
        - thirdGift == CantoDelleCompagne: 
            Ho donato del Canto delle Compagne e la reazione è stata:
        - thirdGift == LicheneDegliAbissi: 
            Ho donato del Lichene degli Abissi e la reazione è stata:
        - thirdGift == NonTiScordarDiTe: 
            Ho donato del Non Ti Scordar Di Te e la reazione è stata:
        - thirdGift == CardoAspinato: 
            Ho donato del Cardo Aspinato e la reazione è stata:
    
    }    

}



{main_story_third_character: confessione.}

//Eventuale commento della rana.


{main_story_third_character.ending: Dopo la nostra conversazione, ha scelto un nuovo nome: {thirdCharacterState}.}

{third_character_feedback: Dopo aver aiutato {thirdCharacterState}, {fifthCharacterState} mi ha detto che<>}
{
    - thirdCharacterPossibleStates has Grizzly: feedback Mentore
        
    - thirdCharacterPossibleStates has Lupo: feedback Mentore
                    
    - thirdCharacterPossibleStates has Delfino:feedback Mentore
                    
    - thirdCharacterPossibleStates has Capibara:feedback Mentore
    
    - thirdCharacterPossibleStates has Corvo:feedback Mentore
}

{third_character_notes.one: Dopo la sua partenza, {thirdCharacterState} mi ha scritto una lettera, dove mi ha raccontato che<>}
{
    - thirdCharacterPossibleStates has Grizzly: Io, invece, non riesco a prendere uno strumento in mano da che sono tornata.
        
    - thirdCharacterPossibleStates has Lupo: Questa piccola idiota invece (me) ha deciso di creare un piccolo esercito di suonatrici in difesa degli alberi.
                    
    - thirdCharacterPossibleStates has Delfino:Io invece per la prima volta sto provando a comporre un brano da cantare con tutte le persone a cui voglio bene.
        E quando mi demoralizzo, Talco è subito lì a tirarmi su di morale.
        Tu e quel posto mi avete reso una mollacciona.
        Ma non è così male, alla fine.
                    
    - thirdCharacterPossibleStates has Capibara:Io invece sto addestrando due topolini per suonare lo xilofono, e se la cavano alla grande!
        Se lo dico a mio padre mi fa ricoverare subito, ma amen.
        Sono felice ama, davvero felice.
                    
    - thirdCharacterPossibleStates has Corvo:
        sddd
}

{third_character_notes.two: Nella sua seconda lettera {thirdCharacterState} mi ha scritto una lettera, dove mi ha raccontato che<>}
{
    - thirdCharacterPossibleStates has Grizzly: Io, invece, non riesco a prendere uno strumento in mano da che sono tornata.
        
    - thirdCharacterPossibleStates has Lupo: Questa piccola idiota invece (me) ha deciso di creare un piccolo esercito di suonatrici in difesa degli alberi.
                    
    - thirdCharacterPossibleStates has Delfino:Io invece per la prima volta sto provando a comporre un brano da cantare con tutte le persone a cui voglio bene.
        E quando mi demoralizzo, Talco è subito lì a tirarmi su di morale.
        Tu e quel posto mi avete reso una mollacciona.
        Ma non è così male, alla fine.
                    
    - thirdCharacterPossibleStates has Capibara:Io invece sto addestrando due topolini per suonare lo xilofono, e se la cavano alla grande!
        Se lo dico a mio padre mi fa ricoverare subito, ma amen.
        Sono felice ama, davvero felice.
                    
    - thirdCharacterPossibleStates has Corvo:
        sddd
}


{third_character_notes.three: Nella sua terza lettera {thirdCharacterState} mi ha scritto una lettera, dove mi ha raccontato che<>}
{
    - thirdCharacterPossibleStates has Grizzly: Io, invece, non riesco a prendere uno strumento in mano da che sono tornata.
        
    - thirdCharacterPossibleStates has Lupo: Questa piccola idiota invece (me) ha deciso di creare un piccolo esercito di suonatrici in difesa degli alberi.
                    
    - thirdCharacterPossibleStates has Delfino:Io invece per la prima volta sto provando a comporre un brano da cantare con tutte le persone a cui voglio bene.
        E quando mi demoralizzo, Talco è subito lì a tirarmi su di morale.
        Tu e quel posto mi avete reso una mollacciona.
        Ma non è così male, alla fine.
                    
    - thirdCharacterPossibleStates has Capibara:Io invece sto addestrando due topolini per suonare lo xilofono, e se la cavano alla grande!
        Se lo dico a mio padre mi fa ricoverare subito, ma amen.
        Sono felice ama, davvero felice.
                    
    - thirdCharacterPossibleStates has Corvo:
        sddd
}
-> rewriter_book_with_flow



=== fourth_character_recap
+ {are_two_entities_together(FourthRecap, PG)} [FourthRecap]
~ enableBigDialogue()

{knowing_fourth_character.one: prima informazione.}
{knowing_fourth_character.two: seconda informazione.}
{knowing_fourth_character.three: terza informazione.}
{knowing_fourth_character.four: quarta informazione.}
{knowing_fourth_character.five: quinta informazione.}
{knowing_fourth_character.six: sesta informazione.}
{knowing_fourth_character.seven: settima informazione.}
{knowing_fourth_character.eight: ottava informazione.}
{knowing_fourth_character.nine: nona informazione.}
{knowing_fourth_character.ten: decima informazione.}
{knowing_fourth_character.eleven: undicesima informazione.}
{knowing_fourth_character.twelve: dodicesiam informazione.}

//Appunto sul dono fatto
{
    - fourth_story_gift.ink_outcome:
    {
    
        - fourthGift == EderaDelleAmanti:
            Ho donato dell'Edera delle Amanti e la reazione è stata:
        - fourthGift == BaccaDellaAddolorata:
            Ho donato della Bacca dell'Addolorata e la reazione è stata:
        - fourthGift == LaSpazzata:
            Ho donato della Spazzata e la reazione è stata:
        - fourthGift == BrinaDellImpossibile: 
            Ho donato della Brina dell'Impossibile e la reazione è stata:
        - fourthGift == CantoDelleCompagne: 
            Ho donato del Canto delle Compagne e la reazione è stata:
        - fourthGift == LicheneDegliAbissi: 
            Ho donato del Lichene degli Abissi e la reazione è stata:
        - fourthGift == NonTiScordarDiTe: 
            Ho donato del Non Ti Scordar Di Te e la reazione è stata:
        - fourthGift == CardoAspinato: 
            Ho donato del Cardo Aspinato e la reazione è stata:
    
    }    

}


{main_story_fourth_character: confessione.}
{main_story_fourth_character.ending: Dopo la nostra conversazione, ha scelto un nuovo nome: {fourthCharacterState}.}

//Eventuale commento della rana.

{fourth_character_feedback: Dopo aver aiutato {fourthCharacterState}, {fifthCharacterState} mi ha detto che<>}
{
    - fourthCharacterPossibleStates has Grizzly: feedback Mentore
        
    - fourthCharacterPossibleStates has Lupo: feedback Mentore
                    
    - fourthCharacterPossibleStates has Delfino:feedback Mentore
                    
    - fourthCharacterPossibleStates has Capibara:feedback Mentore
    
    - fourthCharacterPossibleStates has Corvo:feedback Mentore
}

{fourth_character_notes.one: Dopo la sua partenza, {fourthCharacterState} mi ha scritto una lettera, dove mi ha raccontato che<>}
{
    - fourthCharacterPossibleStates has Grizzly: Io, invece, non riesco a prendere uno strumento in mano da che sono tornata.
        
    - fourthCharacterPossibleStates has Lupo: Questa piccola idiota invece (me) ha deciso di creare un piccolo esercito di suonatrici in difesa degli alberi.
                    
    - fourthCharacterPossibleStates has Delfino:Io invece per la prima volta sto provando a comporre un brano da cantare con tutte le persone a cui voglio bene.
        E quando mi demoralizzo, Talco è subito lì a tirarmi su di morale.
        Tu e quel posto mi avete reso una mollacciona.
        Ma non è così male, alla fine.
                    
    - fourthCharacterPossibleStates has Capibara:Io invece sto addestrando due topolini per suonare lo xilofono, e se la cavano alla grande!
        Se lo dico a mio padre mi fa ricoverare subito, ma amen.
        Sono felice ama, davvero felice.
                    
    - fourthCharacterPossibleStates has Corvo:
        sddd
}

{fourth_character_notes.two: Nella sua seconda lettera {fourthCharacterState} mi ha scritto una lettera, dove mi ha raccontato che<>}
{
    - fourthCharacterPossibleStates has Grizzly: Io, invece, non riesco a prendere uno strumento in mano da che sono tornata.
        
    - fourthCharacterPossibleStates has Lupo: Questa piccola idiota invece (me) ha deciso di creare un piccolo esercito di suonatrici in difesa degli alberi.
                    
    - fourthCharacterPossibleStates has Delfino:Io invece per la prima volta sto provando a comporre un brano da cantare con tutte le persone a cui voglio bene.
        E quando mi demoralizzo, Talco è subito lì a tirarmi su di morale.
        Tu e quel posto mi avete reso una mollacciona.
        Ma non è così male, alla fine.
                    
    - fourthCharacterPossibleStates has Capibara:Io invece sto addestrando due topolini per suonare lo xilofono, e se la cavano alla grande!
        Se lo dico a mio padre mi fa ricoverare subito, ma amen.
        Sono felice ama, davvero felice.
                    
    - fourthCharacterPossibleStates has Corvo:
        sddd
}


{fourth_character_notes.three: Nella sua terza lettera {fourthCharacterState} mi ha scritto una lettera, dove mi ha raccontato che<>}
{
    - fourthCharacterPossibleStates has Grizzly: Io, invece, non riesco a prendere uno strumento in mano da che sono tornata.
        
    - fourthCharacterPossibleStates has Lupo: Questa piccola idiota invece (me) ha deciso di creare un piccolo esercito di suonatrici in difesa degli alberi.
                    
    - fourthCharacterPossibleStates has Delfino:Io invece per la prima volta sto provando a comporre un brano da cantare con tutte le persone a cui voglio bene.
        E quando mi demoralizzo, Talco è subito lì a tirarmi su di morale.
        Tu e quel posto mi avete reso una mollacciona.
        Ma non è così male, alla fine.
                    
    - fourthCharacterPossibleStates has Capibara:Io invece sto addestrando due topolini per suonare lo xilofono, e se la cavano alla grande!
        Se lo dico a mio padre mi fa ricoverare subito, ma amen.
        Sono felice ama, davvero felice.
                    
    - fourthCharacterPossibleStates has Corvo:
        sddd
}

-> rewriter_book_with_flow


=== fifth_character_recap
+ {are_two_entities_together(FifthRecap, PG)} [FifthRecap]
~ enableBigDialogue()
        ~ temp charNameOne = translator(firstCharacterState)
        ~ temp charNameTwo = translator(secondCharacterState)
        ~ temp charNameFive = translator(fifthCharacterState)
        

<b><i>Appunti dalle conversazioni.</b></i> Ho incontrato una persona che mi ha detto di chiamarla Mentore, perché mi farà da guida in questo luogo. E dopo avermi chiesto nomi e pronomi, mi ha {pronouns has him:invitato|{pronouns has her:invitata|invitatə}} a parlare con le persone che trovo in giro. {about_ink_usage: Per poi dirmi che sono {pronouns has him:un Riscrittore|{pronouns has her:una Riscrittora|unə Riscrittorə}}, e darmi un po' di indicazioni su cosa dovrei fare.}

{that_little_liar_storylet: Dopo l'arrivo del bimbo, la prima cosa che mi ha chiesto è se son {pronouns has him:riuscito|{pronouns has her:riuscita|riuscitə}} a mandarlo a casa. Dice che qui non è sicuro per i bambini, che lui le ha tirato un calcio. Ma che le fa tenerezza, e per questo gli sembra un Riccio.}


{
    - knowing_fifth_character.five:
        Da quando sono qui, per la prima volta Mentore ha ammesso di essere stanca. E di sentire caldo. E poi si è lasciata andare ai ricordi: il suo primo bacio, l'uomo che ha sposato. A cui ha dedicato il resto dei suoi giorni, fino a quando non è arrivata qui. E mi ha chiesto cosa significa per me amare un'altra persona. Per poi definirsi una "sciocca romantica", e dirmi che l'amore è ovunque, anche qui. Amore per noi.
    
}



{
    - knowing_fifth_character.four:
        Ora che {charNameTwo} ha trovato il suo nome, Mentore si chiede se non sia stata troppo severa con lui. Dice che era spaventata, e forse ha reagito con violenza. Si è chiesta cosa possa significare essere un genitore che si rende conto che suo figlio, così piccolo, ha già perso la sua strada. E perché non pensa al pallone, o allo studio, invece che al futuro e all'ambiente.
}


{
    - knowing_fifth_character.three:
        Mentore mi ha raccontato che a volte ci sono persone, persone passate da qui, che vorrebbe sentire più spesso. Ma le loro lettere non arrivano, o arrivano sempre più di rado E allora si chiede se ha sbagliato qualcosa.
    
}



{
    - knowing_fifth_character.two:
        Mentore è rimasta colpita da come {charNameOne} sia stata insieme consapevole delle opinioni delle persone care, eppure capace di non perdere sé stessa. E poi mi ha chiesto di pregare per lei.
}



{
    - knowing_fifth_character.one:
        Durante una chiacchierata, Mentore mi ha raccontato che il suo posto preferito è la serra, perché vedere crescere le cose la fa sentire appagata, la sensazione di permettere con le proprie mani a un altro corpo di crescere al meglio.
}


//Da riordinare

{
    - knowing_fifth_character.six: prima informazione.
    
}

{
    - knowing_fifth_character.seven: prima informazione.
    
}

{
    - knowing_fifth_character.eight: prima informazione.
    
}

{
    - knowing_fifth_character.nine: prima informazione.
    
}

{
    - knowing_fifth_character.ten: prima informazione.
    
}

{
    - knowing_fifth_character.eleven: prima informazione.
    
}

{
    - knowing_fifth_character.twelve: prima informazione.
    
}



{
    - rewriting_proposal_first_character.secret_ending: 
    Dopo aver concluso la sua riscrittura, {charNameOne} mi ha chiesto qual è secondo me il confine tra essere una brava persona ed essere una manipolatrice, riferendosi a {charNameFive}.
}

{
    - rewriting_proposal_second_character.secret_ending: 
    Dopo aver scelto il suo nome, {charNameTwo} mi ha detto che {charNameFive} non gli sembra felice. Che gli ricorda mamma quando gira per casa dando cosnigli e dicendo cose sorridendo, per poi rinchiudersi in camera e restare in silenzio per ore.
}

//Appunto sul dono fatto
{
    - fifth_story_gift.ink_outcome:
    {
    
        - fifthGift == EderaDelleAmanti:
            Ho donato dell'Edera delle Amanti e la reazione è stata:
        - fifthGift == BaccaDellaAddolorata:
            Ho donato della Bacca dell'Addolorata e la reazione è stata:
        - fifthGift == LaSpazzata:
            Ho donato della Spazzata e la reazione è stata:
        - fifthGift == BrinaDellImpossibile: 
            Ho donato della Brina dell'Impossibile e la reazione è stata:
        - fifthGift == CantoDelleCompagne: 
            Ho donato del Canto delle Compagne e la reazione è stata:
        - fifthGift == LicheneDegliAbissi: 
            Ho donato del Lichene degli Abissi e la reazione è stata:
        - fifthGift == NonTiScordarDiTe: 
            Ho donato del Non Ti Scordar Di Te e la reazione è stata:
        - fifthGift == CardoAspinato: 
            Ho donato del Cardo Aspinato e la reazione è stata:
    
    }    

}


//Eventuale commento della rana.

{main_story_fifth_character: confessione.}

{main_story_fifth_character.ending: Dopo la nostra conversazione, ha scelto un nuovo nome: {fifthCharacterState}.}

{fifth_character_feedback: Dopo aver aiutato {fifthCharacterState}, {fifthCharacterState} mi ha detto che<>}
{
    - fifthCharacterPossibleStates has Grizzly: feedback Mentore
        
    - fifthCharacterPossibleStates has Lupo: feedback Mentore
                    
    - fifthCharacterPossibleStates has Delfino:feedback Mentore
                    
    - fifthCharacterPossibleStates has Capibara:feedback Mentore
    
    - fifthCharacterPossibleStates has Corvo:feedback Mentore
}


{
    - first_character_notes.one:
        <b>Lettere di {charNameOne}.</b></i>
    
    
        Ciao {name}, come stai? Alla fine Talco è sempre statə qui, me idiota. E ha creduto alla mia storia! Ora si è messə in testa di insegnare agli scoiattoli a suonare le noci. <>

           {
                - firstCharacterPossibleStates has Triangolo:
                    Io, invece, non riesco a prendere uno strumento in mano da che sono tornata. <>
                    
                - firstCharacterPossibleStates has RagazzaOrchestra:
                    Questa piccola idiota invece (me) ha deciso di creare un piccolo esercito di suonatrici in difesa degli alberi. <>
                    
                - firstCharacterPossibleStates has FlautoDolce:
                    Io invece per la prima volta sto provando a comporre un brano da cantare con tutte le persone a cui voglio bene.
                    E quando mi demoralizzo, Talco è subito lì a tirarmi su di morale.
                    Tu e quel posto mi avete reso una mollacciona.
                    Ma non è così male, alla fine. <>
                    
                - firstCharacterPossibleStates has Ocarina:
                    Io invece sto addestrando due topolini per suonare lo xilofono, e se la cavano alla grande!
                    Se lo dico a mio padre mi fa ricoverare subito, ma amen.
                    Sono felice ama, davvero felice. <>
                    
                - firstCharacterPossibleStates has Violino:
                    Io invece mi sono resa conto che forse, con la musica, possiamo parlare con gli animali.
                    No, non ho esagerato col vinello.
                    Ma pensaci, ama: se così fosse, potrei dimostrare che siamo tutt3 collegat3, che potremmo parlarci e comunicare tra noi! <>
            }
        Spero che lì vada tutto bene. E che {charNameFive} non sia sempre pesantona. Alla prossima lettera. <i>{charNameOne}</i>
}

{fifth_character_notes.one: Dopo la sua partenza, {fifthCharacterState} mi ha scritto una lettera, dove mi ha raccontato che<>}
{
    - fifthCharacterPossibleStates has Grizzly: Io, invece, non riesco a prendere uno strumento in mano da che sono tornata.
        
    - fifthCharacterPossibleStates has Lupo: Questa piccola idiota invece (me) ha deciso di creare un piccolo esercito di suonatrici in difesa degli alberi.
                    
    - fifthCharacterPossibleStates has Delfino:Io invece per la prima volta sto provando a comporre un brano da cantare con tutte le persone a cui voglio bene.
        E quando mi demoralizzo, Talco è subito lì a tirarmi su di morale.
        Tu e quel posto mi avete reso una mollacciona.
        Ma non è così male, alla fine.
                    
    - fifthCharacterPossibleStates has Capibara:Io invece sto addestrando due topolini per suonare lo xilofono, e se la cavano alla grande!
        Se lo dico a mio padre mi fa ricoverare subito, ma amen.
        Sono felice ama, davvero felice.
                    
    - fifthCharacterPossibleStates has Corvo:
        sddd
}

{fifth_character_notes.two: Nella sua seconda lettera {fifthCharacterState} mi ha scritto una lettera, dove mi ha raccontato che<>}
{
    - fifthCharacterPossibleStates has Grizzly: Io, invece, non riesco a prendere uno strumento in mano da che sono tornata.
        
    - fifthCharacterPossibleStates has Lupo: Questa piccola idiota invece (me) ha deciso di creare un piccolo esercito di suonatrici in difesa degli alberi.
                    
    - fifthCharacterPossibleStates has Delfino:Io invece per la prima volta sto provando a comporre un brano da cantare con tutte le persone a cui voglio bene.
        E quando mi demoralizzo, Talco è subito lì a tirarmi su di morale.
        Tu e quel posto mi avete reso una mollacciona.
        Ma non è così male, alla fine.
                    
    - fifthCharacterPossibleStates has Capibara:Io invece sto addestrando due topolini per suonare lo xilofono, e se la cavano alla grande!
        Se lo dico a mio padre mi fa ricoverare subito, ma amen.
        Sono felice ama, davvero felice.
                    
    - fifthCharacterPossibleStates has Corvo:
        sddd
}


{fifth_character_notes.three: Nella sua terza lettera {fifthCharacterState} mi ha scritto una lettera, dove mi ha raccontato che<>}
{
    - fifthCharacterPossibleStates has Grizzly: Io, invece, non riesco a prendere uno strumento in mano da che sono tornata.
        
    - fifthCharacterPossibleStates has Lupo: Questa piccola idiota invece (me) ha deciso di creare un piccolo esercito di suonatrici in difesa degli alberi.
                    
    - fifthCharacterPossibleStates has Delfino:Io invece per la prima volta sto provando a comporre un brano da cantare con tutte le persone a cui voglio bene.
        E quando mi demoralizzo, Talco è subito lì a tirarmi su di morale.
        Tu e quel posto mi avete reso una mollacciona.
        Ma non è così male, alla fine.
                    
    - fifthCharacterPossibleStates has Capibara:Io invece sto addestrando due topolini per suonare lo xilofono, e se la cavano alla grande!
        Se lo dico a mio padre mi fa ricoverare subito, ma amen.
        Sono felice ama, davvero felice.
                    
    - fifthCharacterPossibleStates has Corvo:
        sddd
}

-> rewriter_book_with_flow


=== frog_character_recap
+ {are_two_entities_together(FrogRecap, PG)} [FrogRecap]
~ enableBigDialogue()
C'è una rana bluastra dalle parti dello stagno, e sembra propensa a darmi consigli.
{
    - the_frog.frog:
        Mi ha detto che Riccio si lamenta molto degli adulti, esclusi nonna e fratello. E che la cosa che gli piace meno degli adulti è che non sono coerenti. Per questo, secondo la rana, per conquistarlo non devo dargli ragione: devo mostrare coerenza. Ma sta a me comunque decidere che fare.
}
{

    - the_frog.second:
        Secondo la rana, Chitarra detesta le persone troppo razionali. E quando si siede allo stagno, parla molto di spiritualità. E poi, ha bisogno di uno stuzzichino (la rana, non Chitarra).

}

-> rewriter_book_with_flow


=== dog_character_recap
+ {are_two_entities_together(DogRecap, PG)} [DogRecap]
~ enableBigDialogue()

dog
-> rewriter_book_with_flow



=== witch_character_recap
+ {are_two_entities_together(WitchRecap, PG)} [WitchRecap]
~ temp charNameOne = translator(firstCharacterState)
        ~ temp charNameTwo = translator(secondCharacterState)
        ~ temp charNameThree = translator(thirdCharacterState)
        ~ temp charNameFour = translator(fourthCharacterState)
        ~ temp charNameFive = translator(fifthCharacterState)
~ enableBigDialogue()

{take_this_book:Un vecchio tronco|Un vecchio tronco, sotto le cui radici ho trovato questo diario.}

//{
//    - (firstStory == StoryEnded) or (firstStory == StoryEnded): E che si ritrova con un paio di gambe.
//    
//}
//{
//    - (firstStory == StoryEnded && firstStory == StoryEnded): E che ora ha anche un busto.
//}



{
    - talking_witch.intro:
        Non è solo un vecchio tronco, comunque. Sembra che venga da qui la voce che mi sento in testa, che mi descrive i luoghi e altre cose di questo posto. Dice che è, anzi, sono tornati a precepirsi. E che saranno la luna e un sorriso.
}

{
    - talking_witch.first_story_ended_check:
        Mi hanno anche detto che posso studiare le persone come un libro, come vorrebbe Mentore, ma potrei anche decidere secondo quello che è giusto per me. Che a volte le persone hanno bisogno di venire contraddette, perché la frizzione genera fuoco e il fuoco brucia il vecchio, dando la possibilità al nuovo di crescere.
}

{
    - talking_witch.second_story_ended_check: 
        Secondo la voce, la storia di {charNameTwo} è stata faticosa per Mentore. Dice che le sue radici sembrano solide, ma il suo tronco ondeggia a ogni accenno di burrasca. E che io posso decidere di essere sostegno, o di lasciarla cadere, e ricominciare.
}
{talking_witch.third_story_ended_check: cose che scopro sul fungo a fine della third storia.}
{talking_witch.fourth_story_ended_check: cose che scopro sul fungo a fine della fourth storia.}
{talking_witch.fifth_story_ended_check: cose che scopro sul fungo a fine della fifth storia.}

-> rewriter_book_with_flow