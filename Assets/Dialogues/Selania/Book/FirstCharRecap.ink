/* ---------------------------------

   First Char Recap

 ----------------------------------*/

=== first_character_recap
+ (check) {are_two_entities_together(FirstRecap, PG)} [FirstRecap]
~ enableBigDialogue()
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

{
    - first_character_notes.three:
        <b><i>Terza lettera di {charNameOne}.</b></i>: <>
        
            Ciao ama! Indovina chi ha fatto il suo primo concerto? <>

           {
                - firstChar_ActualName has Triangolo:
                    Non io ovviamente. Il lavoro di smistamento si mangia le giornate. Però Talco ha spaccato! Quando ha finito sono scoppiata a piangere. L3 am3 pensavano fosse gioia. Non ho avuto il coraggio di dire loro che temo di aver fatto la scelta peggiore della mia vita. La peggiore. <>
                    
                - firstChar_ActualName has RagazzaOrchestra:
                    Il collettivo! Ci chiamiamo EDERE, che è un acronimo di cui non ricordo manco più il significato ma è tipo: ci attacchiamo agli alberi e non ci leviamo più. E a questo giro la pula non ci ha levate, perché c'era troppa gente ed è stato un casino assurdo. Alcune compagne sono critiche perché temono che abbiamo spaventato la fauna. Credo che abbiano ragione. Anche se questa cosa mi rompe le ovaie. Ma vedremo di trovare una soluzione. <>
                    
                - firstChar_ActualName has FlautoDolce:
                    Il nonno! O meglio, una cover band che abbiamo tirato su con l3 am3. Abbiamo anche un suo cartonato che portiamo in giro. Ho incontrato vecchie che l'hanno conosciuto. E ho scoperto cose nuove su di lui. Anche cose che non avrei voluto sapere. Il nonno era un chillone totale comunque, e ora voglio imparare da lui. <>
                    
                - firstChar_ActualName has Ocarina:
                    I topolini! In teoria dovevano esserci anche gli scoiattoli, ma le luci li hanno spaventati. O forse quei bambini del cazzo. Che in teoria erano vietati. Però è stata una roba toppissima ama. Non so se lì prende ma nel caso cercaci su internet perché abbiamo spaccato. <>
                    
                - firstChar_ActualName has Violino:
                    Madre natura! No dai, non il primo. Il primo che abbiamo registrato. La prima collaborazione tra umani, funghi e piante. E sembra che ora parte delle nostre note stiano vibrano nel terreno. Un gruppo di scienziati ha trovato frequenze simili alle nostre in un bosco a cento chilometri e passa di distanza! Chi l'avrebbe detto che mi sarebbero piaciuti gli scienziati? Ora però dobbiamo anche imparare ad ascoltare. Perché facile che ci siano altre canzoni in giro da eoni. E questa sarà la parte difficile. Non vedo l'ora! <>
            }
            Comunque un giorno mi piacerebbe che la musica, questa musica arrivasse anche dalle vostre parti. O che, quando te ne andrai da lì, verrai ad ascoltarla con me. Un saluto. <b>{charNameOne}</b>.
}


{
    - first_character_notes.two:
        <b><i>Seconda lettera di {charNameOne}.</b></i>: <>
        
        Ciao {player_name}, qui è sempre {charNameOne} che ti scrive. Sono passate settimane dal mio ritorno, e finalmente ho avuto il coraggio di parlare con mio padre. <>

           {
                - firstChar_ActualName has Triangolo:
                    Non è che avete un traduttore padre/figlia da quelle parti? Quando gli ho detto che seguirò il suo consiglio e mi cercherò un lavoro vero, è sembrato deluso. Nei prossimi giorni farò un colloquio nella agenzia dove lavora. Forse smistare merci è un altro modo di suonare musica. <>
                    
                - firstChar_ActualName has RagazzaOrchestra:
                    Le cose non sono andate bene, abbiamo litigato per tutto il tempo. A volte la mia rabbia mi triggera, non è qualcosa che pensavo nemmeno di possedere. Per assurdo però da quando gli ho detto che è la mia vita e ho il diritto di fare i miei errori, ci sentiamo più spesso. Non so se voglio rivederlo subito, ma forse le cose stanno cambiando per il meglio. <>
                    
                - firstChar_ActualName has FlautoDolce:
                    Gli ho parlato di nonno, e gli ho detto che voglio seguire le sue tracce. Sul momento è rimasto interdetto, ma poi si è messo a piangere. Mi ha chiesto del tempo per decidere se e cosa potrebbe fare per aiutarmi. <>
                    
                - firstChar_ActualName has Ocarina:
                    Ha passato il tempo a dirmi che non prendo nulla sul serio. Parlargli dell'orchestra di topolini e scoiattoli non ha aiutato, ama. Forse cambierà idea quando avrò finito di addestrare le falene. O più plausibilmente mi taglierà tutti i fondi. <>
                    
                - firstChar_ActualName has Violino:
                    Per la prima volta credo di averlo capito. Non ci siamo trovate, non riesce a comprendere perché per me sia importante fare qualcosa di utile per l'umanità e blah blah blah. Ma ho visto nella sua preoccupazione la paura sincera che possa avere una vita difficile. Mi ha fatto insieme tenerezza e dispiacere. <>
            }
        E lì invece? Come stanno le tue piante? Sono arrivate nuove persone interessanti? Sicuro, nessunə più interessante di me! A presto, <b>{charNameOne}</b>.
}

{
    - first_character_notes.one:
        <b><i>Prima lettera di {charNameOne}.</b></i>: <>
    
    
        Ciao {player_name}, come stai? Alla fine Talco è sempre statə qui, me idiota. E ha creduto alla mia storia! Ora si è messə in testa di insegnare agli scoiattoli a suonare le noci. <>

           {
                - firstChar_ActualName has Triangolo:
                    Io, invece, non riesco a prendere uno strumento in mano da che sono tornata. <>
                    
                - firstChar_ActualName has RagazzaOrchestra:
                    Questa piccola idiota invece (me) ha deciso di creare un piccolo esercito di suonatrici in difesa degli alberi. <>
                    
                - firstChar_ActualName has FlautoDolce:
                    Io invece per la prima volta sto provando a comporre un brano da cantare con tutte le persone a cui voglio bene.
                    E quando mi demoralizzo, Talco è subito lì a tirarmi su di morale.
                    Tu e quel posto mi avete reso una mollacciona.
                    Ma non è così male, alla fine. <>
                    
                - firstChar_ActualName has Ocarina:
                    Io invece sto addestrando due topolini per suonare lo xilofono, e se la cavano alla grande!
                    Se lo dico a mio padre mi fa ricoverare subito, ma amen.
                    Sono felice ama, davvero felice. <>
                    
                - firstChar_ActualName has Violino:
                    Io invece mi sono resa conto che forse, con la musica, possiamo parlare con gli animali.
                    No, non ho esagerato col vinello.
                    Ma pensaci, ama: se così fosse, potrei dimostrare che siamo tutt3 collegat3, che potremmo parlarci e comunicare tra noi! <>
            }
        Spero che lì vada tutto bene. E che {mentorName} non sia sempre pesantona. Alla prossima lettera. <b>{charNameOne}</b>
}


{
    - first_story_gift.ink_outcome: <b><i>Appunti su dono e riscrittura:</b></i> <>
}

{
    - first_character_feedback: Mentore dice che <>

        {
            - firstChar_ActualName has Triangolo: ho aiutato {translator(firstChar_ActualName)} a trovare il suo lato più pratico e razionale, ma che forse non era quello di cui aveva bisogno.
                
            - firstChar_ActualName has RagazzaOrchestra: ora {translator(firstChar_ActualName)} ha accolto un'indole più oppositiva e attiva, forse però non qualcosa che sia nella sua natura.
                            
            - firstChar_ActualName has FlautoDolce: probabilmente {translator(firstChar_ActualName)} sapeva già che gli affetti sono una cosa fondamentale per lei. Si chiede se è il massimo che potevamo fare.
                            
            - firstChar_ActualName has Ocarina: ora {translator(firstChar_ActualName)} che ha accolto gioco e creatività è più felice. Ma Mentore non sembra convinta di questa scelta.
            
            - firstChar_ActualName has Violino: abbiamo fatto un gran lavoro assieme, perché {translator(firstChar_ActualName)} aveva bisogno di riconoscere che per lei la vita ha senso solo con uno scopo più grande.
        
        }
}

{rewriting_proposal_first_character.ending: Dopo la Riscrittura, ha scelto un nuovo nome: <b><i>{translator(firstChar_ActualName)}.</b></i>}

{firstAffinityFeedback:
    Il valore massimo di inchistro che ho ricevuto è stato: {fromInkToNumbers(firstChar_maximum_inkLevel)}. <>
}

//Appunto sul dono fatto
{
    - first_story_gift.ink_outcome:
        {
            - firstChar_favouritesGifts has firstChar_giftedObject:
            Le ho donato <b><i>{firstChar_giftedObject}</b></i> ed era entusiasta! <>
            
            - firstChar_goodGifts has firstChar_giftedObject:
            Le ho donato <b><i>{firstChar_giftedObject}</b></i> ed ha abbastanza apprezzato. <>
            
            - else:
            Le ho donato <b><i>{firstChar_giftedObject}</b></i> e non ha apprezzato per nulla. <>
        
        }
}        


{
    - rewriting_proposal_first_character:
        Dopo il dono, {charNameOne} mi ha detto di aver capito perché si sia ritrovata con questo nome. Crede che la {charNameOne} sia il segno del rimanere nel medio, nella cosa più ovvia, e questo perché mentre tutte le persone care le fanno pressioni su cosa scegliere o meno per il suo futuro, lei ha solo paura. Crede che una scelta chiuda strade, deluda persone, o possa portarti in luoghi sbagliati. E a quel punto non ci sia modo di tornare indietro. Forse, allora, è meglio che siano le altre persone a scegliere per te.
    
}        



    {
        - first_char_main_storylets.one:
            <b><i>Appunti dalle conversazioni.</b></i> <>
    }

    {
        - first_char_main_storylets.twelve:
            {charNameOne} mi ha parlato di sua madre. È stata la madre a permetterle di frequentare il conservatorio, ma con l'obiettivo di portare prestigio alla famiglia. {charNameOne} sa che non è possibile, che per il mondo della classica è già vecchia, ma la madre non è pronta a capirlo.
        
    }
    
    {
        - first_char_main_storylets.eleven:
            Per la prima volta {charNameOne} mi ha parlato della sua famiglia d'origine. La passione per la musica l'ha presa dal padre, ma era il nonno paterno ad essere musicista. Da piccola poteva sentire le vecchie registrazioni del nonno, giocare coi suoi strumenti. Ma ora che è grande suo padre tiene queste cose come delle reliquie. E se prima rideva molto, ora ha smesso. E vuole che la figlia si trovi "un lavoro vero".
        
    }
    
    {
        - first_char_main_storylets.ten:
            {charNameOne} mi ha raccontato qualcosa di diverso. L'anno scorso assieme ad altr3 attivist3 ha protetto gli alberi di un parco per una settimana, alberi che il Comune voleva abbattere. E quando ha sentito gli alberi cantare nel silenzio, si è sentita viva. Poi sono arrivati i poliziotti, hanno arrestato tutt3, gli alberi son stati abbattuti, e {charNameOne} è tornata a sentirsi inutile.
        
    }

    {
        - first_char_main_storylets.nine:
            {charNameOne} pensa di non far schifo a parlare.
        
    }

    {
        - first_char_main_storylets.eight:
            È tornata a parlare del Ghiberti. Dice che sembra felice ma in realtà sorride come un robot. Ed è tornata sul discorso dell'errore. Secondo {charNameOne} l'errore serve per fare esperienza e comunità. Se non si sbaglia non si cresce. Se non si sbaglia non c'è occasione per il perdono. Nei numerini del Ghiberti per {charNameOne} c'è la morte.
        
    }

    {
        - first_char_main_storylets.seven:
            {charNameOne} ha ritirato fuori quel professore, il Ghiberti. E gli sta sulle scatole perché vede la musica come qualcosa di matematico. È una cosa che non le piace, perché rende l'idea che esistano errore e verità, e cito: "anche perché quelli pieni di verità hanno sempre finito per ammazzare quell3 come me e Talco."
        
    } 
    
    {
        - first_char_main_storylets.six:
            {charNameOne} mi ha raccontato la storia di questo ragazzo, Jonah. Un prodigio che dopo una carriera sfolgorante in Cina ha deciso di tornare in Italia, e le cose gli sono andate di merda. Non si capisce se ora mendichi, suoni per i ricchi, o lavori in un supermercato. Ma la storia di Jonah lascia una domanda a {charNameOne}: cosa fare quando si sa fare bene solo una cosa ma il mondo non permette di farla? Si accettano compromessi o si muore di fame? O si aspetta fino a quando non è il mondo a decidere per te?
        
    }

    {
        - first_char_main_storylets.five:
            {charNameOne} ama fare festa, ed è abituata ad essere circondata da persone. Vive con cinque amich3, e poi ci sono l3 ospiti. D'estate fanno le feste sul tetto dove suonano e cantano. Il silenzio di questo posto la fa star male, perché può sentire i propri pensieri.
        
    } 

    {
        - first_char_main_storylets.four:
            A {charNameOne} il silenzio pesa, e molto. Senza musica teme di sbroccare.
        
    } 
    
    {
        - first_char_main_storylets.three:
            Ogni persona vicina a {charNameOne} sembra avere un'idea su come lei dovrebbe vivere la sua vita. Anna, una delle sue amiche, insiste perché divenga assistete di un suo professore, tal Ghiberti. Olga vuole che metta su una band e sfondi per locali. Talco vuole che partecipi a qualche reality musicale. Ed Ennio pensa che abbia completamente sbagliato strada. Tutte queste persone sono famiglia per {charNameOne}, ed è frustrata perché qualsiasi scelta prenderà, delulderà qualcunə.
        
    }
    
    {
        - first_char_main_storylets.two:
            {charNameOne} sembra davvero persa senza Talco. Da tanto non andava in giro senza di ləi. Di sicuro, sembra non avere in simpatia Mentore.
        
    }    
    
    {
        - first_char_main_storylets.one:
            Ho conosciuto una persona nuova, si chiama {charNameOne}. Quando l'ho incontrata era preoccupata perché non riesce a trovare lə sua migliore amicə, Talco. Non le piace molto il suo nome, ha l'impressione che essere una {charNameOne} per una come lei, che ha fatto il conservatorio, significhi arrendersi. Quando mi ha chiesto che nome dovrebbe avere secondo me, non sono {player_pronouns has him:stato|{player_pronouns has her:stata|statə}} capace di darle una risposta.
        
    }
    





//Eventuale commento della rana.


-> rewriter_book_with_flow
