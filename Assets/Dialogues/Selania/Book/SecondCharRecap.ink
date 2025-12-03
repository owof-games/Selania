/* ---------------------------------

   Second Char Recap

 ----------------------------------*/

=== second_character_recap
+ (check){are_two_entities_together(SecondRecap, PG)} [SecondRecap]
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
~ enableBigDialogue()


{
    - second_character_notes.three:
    <b><i>Terza lettera di {charNameTwo}.</b></i>: <>
        Ciao {player_name}. <>

           {
                - secondChar_ActualName has Riccio:
                    Ti scrivo da casa di mio fratello. Novità: ora vivo qui! All'inizio il suo amico non era contento, ma ora mi insegna anche a fare i dolci! Fa anche delle caramelle superbuone. Papà non è più tornato. Mamma non ha nemmeno fatto storie quando me ne sono andato. Non mi sento mica felice. Sì no boh. Che cosa strana da scrivere. Però le cose sono diverse. A volte abbasso le spine. A volte mi addormento sul divano mentre guardo i telefilm con mio fratello. E non ho mica paura. Spero che tu non abbia paura. Salutami {mentorName}. Ti voglio bene. <>
 
                - secondChar_ActualName has Grizzly:
                    Sono SUPER ARRABBIATO. CON MIO FRATELLO. Non avevamo mai litigato, mai. Ma l'altro giorno è venuto a casa e mi ha detto che sto diventando come papà. Papà si è incazzato con lui e mi ha difeso. Mio fratello dice che sto diventando un bullo. Che un suo amico maestro a scuola gli ha detto che me la prendo coi più piccoli. Papà gli ha detto che mi faccio rispettare. E che non sono una checca come lui. Lui mio fratello. Non sono mica abituato a mio padre così. Ma poi in camera mi è preso male tutto. Mi manca mio fratello. Mi mancate voi. Vorrei sapere cosa fare. <>
                    
                - secondChar_ActualName has Lupo:
                    Oggi sono triste, e non so perché. Ho dato un pugno a un ragazzo delle medie, ma non mi è mica piaciuto. A casa le cose vanno bene, ma. Sì no boh. Mica pensavo che è così faticoso. Mamma e papà sono tranquilli solo se siamo assieme. Mi sembra un lavoro. E se sono giù si preoccupano tantissimo. E se si preoccupano tornano a litigare. Non so mica cosa fare. Forse {mentorName} li può aiutare? Mi mancate. <b>{charNameTwo}</b>. <>

                    
                - secondChar_ActualName has Delfino:
                    Se non l'hai capito nell'ultima lettera solo l'ultima frase non era vera: tutte le altre lo erano. Però è successa una cosa divertente, {player_name}! La prof di matematica mi ha detto che le mie bugie sono storie. E che le storie sono da conservare. E quindi abbiamo aperto assieme a altri bambini un giornale della scuola. Faremo uscire per tutto il resto dell'anno i nostri racconti e le notizie. Mi ha solo chiesto di non scrivere più quella parolaccia che lei ha detto. E di non dire niente sulla preside o si arrabbia. E allora ti saluto dicendoti quella parolaccia, perché poi non la potrò più scrivere. "Per il catarro del cammello!" Che schifo, {player_name}. Ma lì ci sono i cammelli? Un saluto. <>
                    
                - secondChar_ActualName has Capibara:
                    Questo cervellino (il mio cervellino) ha trovato una soluzione. Ho parlato con la prof di matematica, e le ho detto delle mie paure. Degli animali che spariscono, dei boschi che bruciano. Dei ghiacciai. Lei mi ha detto che possiamo raccogliere dei soldi ma sì no boh. Io pensavo all'associazione di mio fratello e del suo fidanzato, e loro insegnano a non avere paura non a spendere soldi. Allora mi ha fatto fare una lezione in classe su queste cose. Ho spiegato le paure. E poi ho detto che se ci mettiamo assieme ci sono anche le soluzioni. Alcuni compagni hanno detto che ci possiamo trovare nel campetto il pomeriggio. E quindi forse qualcosa sta iniziando, {player_name}. Non so cosa faremo, però è bello non farlo da solo. E vorrei tanto tu fossi qui con me, ora. Secondo me ci diresti tantissime cose sagge. Salutami la rana. {charNameTwo}. <>
                    
                - secondChar_ActualName has Corvo:
                    Ieri è successa una cosa fighissima. Ti ricordi quell'amica di mio fratello, che dovevo conoscere al mare? Sta da tre giorni da lui perché dice che è stata buttata fuori di casa. E mi ha raccontato tante cose che mica sapevo. Cose brutte che vengono fatte agli animali. Ma, {player_name}: non aveva paura. Lei dice che sono sveglio, e che per questo non devo avere paura perché posso capire tutto. E che magari un giorno trovo un modo per salvare gli animali. Mi ha regalato un romanzo di Ursula LeGuin (ho dovuto guardare la copertina, è un nome difficile). Non sapevo di potere imparare cose dai romanzi. Oggi ho chiesto alla maestra di matematica di darmi dei libri sull'ambiente. Ci sono così tante cose da imparare, {player_name}, così tante! Spero ci vedremo presto. Salutami la rana! <b>{charNameTwo}</b>. <>
            }
        PS: Ma poi hai scoperto cos'è quella statua nella foresta? PPS: Ho un segreto che riguarda la serra, ma te lo dirò con la prossima lettera! Ciao ciao!
}


{
    - second_character_notes.two:
        <b><i>Seconda lettera di {charNameTwo}.</b></i>: <>
        Che strano. Ho lasciato l'altra lettera sul comodino di notte. E poi è sparita. Non so mica se ti è arrivata. O se papà l'ha buttata. <>

           {
                - secondChar_ActualName has Riccio:
                    Le cose a scuola vanno male. L'altro giorno ho picchiato un bambino perché mi ha chiamato "strano". E l'ho spinto dalle scale. Ora sono in sospensione, a casa. Papà è sparito da due giorni. Mamma piange in camera. Io non so come mi sento. Però ho ripreso a fare esperimenti. In un vecchio libro un bambino disegnava la porta sul muro, e andava in un altro mondo. Forse se trovo il modo posso tornare da voi. Mi mancate. Ciao. <>
                    
                - secondChar_ActualName has Grizzly: 
                    Se l'ha buttata urlo di nuovo, vediamo che mi dice poi. Però ti dovevo dire questa cosa: sono nella squadra di calcio. Non sono mica bravo, sinceramente. Questa roba delle forza e della velocità non è roba mia proprio. Però dice l'allenatore che ho strategia. Mamma me l'ha fatto fare perché dice che devo scaricare tutta questa "rabbia da ragazzino". E non mi chiama più bambino. Negli spogliatoi ci sono state delle risse. Ho dato un pugno straforte a uno più grande. E ora a scuola non mi rompono più le scatole. Se qualcuno ti rompe le scatole {player_name} chiamami E ti aiuto io. Ciao! <>
                    
                - secondChar_ActualName has Lupo:
                    Ma non credo: le cose negli ultimi giorni vanno meglio. Con l'amico di mio fratello ho fatto dei muffin per lui e mamma. E poi gli ho detto che mi dispiace quando litigano. E che ho capito che essere grandi fa schifo, ma che ci sono anche cose belle. Come andare al mare. Mamma si è messa a piangere. Papà è stato in silenzio tantissimo. E ho iniziato a pensare che mi avrebbe picchiato. Invece ha detto: domani si fa vacanza e si va a nuotare tutti assieme. Mamma l'ha abbracciato, e si è mangiata un intero muffin. Ti dico poi come è andata! A presto. <>
                    
                - secondChar_ActualName has Delfino:
                    In questi giorni ho ripreso a dire delle bugie. Ma invece di dirle piccole, le sto dicendo grandissime. E questa cosa fa divertire i miei nuovi amici. E anche qualche maestra. Mamma dice che da grande devo fare il comico. Papà è banale e dice che devo fare il politico. Mio fratello è preoccupato, perché teme che mi metto nei pasticci. Gioco: una di queste cose che ho detto non è vera. Tu lo capisci quale? Salutami la rana! <b>{charNameTwo}</b>. <>
                    
                - secondChar_ActualName has Capibara:
                    Dopo che gli ho detto che lui usa quella parola con mio fratello perché ha paura, non mi parla più. Mamma dice che lui ha paura di tutte le cose, ma non lo sa dire. Le ho detto che ci sono delle associazioni. Lei ha sorriso e mi ha detto che sto davvero diventando grande. Però continuo a pensarci a questa cosa delle associazioni. Tu lo sai che io ho paura per gli animali. E mi hai insegnato che le cose si affrontano con gli amici. Magari non sono bravo a farmi degli amici, ma sono bravo a parlare degli animali. E forse ci riesco a fare qualcosa così, come mio fratello fa per i suoi amici. Devo solo capire cosa. Vorrei tanto chiederlo alla rana. Salutamela! <>
                    
                - secondChar_ActualName has Corvo:
                    Ultimamente parliamo di più. Gli piace parlare di politica. Secondo me dice cose stupide, ma forse nelle sue cose stupide c'è lui, le sue paure. Almeno così dice l'amico di mio fratello. Oggi siamo stati da nonna. Ho dovuto insistere perché avevano paura che ci rimanevo male. Si no boh. Mi è spiaciuto quando non mi ha riconosciuto. Però è sempre la nonna. Quando mamma ha parlato con l'infermiera ho preso un mazzo di carte. Era sporco e mancava l'asso di picche. Ma nonna ha ricordato tutti i trucchi e mi ha stracciato. Stammi bene! <b>{charNameTwo}</b>. <>
     
            }
        PS: mi piace mettere i PS, su internet non ci sono. PPS: ma sono arrivate persone nuove poi? Qualcuna con dei dolci magari?
}


{
    - second_character_notes.one:
        <b><i>Prima lettera di {charNameTwo}.</b></i>: <>
    
        Sono a lezione e mi sto rompendo e quindi ho deciso di scrivere a {player_name}. Cioè a te. Anche se non ho mica capito come te la mando la lettera. Ma come sta la rana? Hai scoperto poi se è elettrica? <>

           {
                - secondChar_ActualName has Riccio:
                    Qui le cose sono strane. Forse perché sono uguali a prima. Ora passo più tempo in camera. Papà è contento perché dice che non rompo. Mamma è preoccupata perché vuole che gioco con gli altri. A volte guardo fuori dalla finestra e basta. E vado a letto e non correggo più nulla. Mi addormento, e aspetto. A volte voglio tornare lì da voi. Ma non so cosa fare. La prof di matematica mi guarda male. Ci sentiamo {player_name}. <>
                    
                - secondChar_ActualName has Grizzly:
                    Oggi per la prima volta ho litigato con papà. Nel senso che non è stato mica lui a cominciare ma io. Ha cercato di picchiarmi e gli ho urlato che è un bullo. E poi ho preso i miei libri e glieli ho tirati contro. Lui si è arrabbiato così tanto, {player_name}! E allora ho urlato. Urlato come un orso. Che si dice che ho bramito quindi. E lui se ne è andato sbattendo la porta, urlando a mamma che ha tirato su un deficiente. Però sono felice perché ho meno paura ora. Mamma mi guarda strano. Ma so che tu mica mi avresti guardato così. <>
                    
                - secondChar_ActualName has Lupo: 
                    L'altro giorno ho parlato con l'amico di mio fratello. Gli ho detto che per me siamo un branco ma che secondo me lui mica mi ci vede in questo branco. E lui mi ha detto una cosa strana. Che non ce l'ha con me. Ma che non sa parlare coi bambini. Allora gli ho detto di non parlarmi come un bambino. Che so cosa sono i lupi, le frazioni, l'elettricità. Lui ha riso e mi ha detto: "Ma sai creare un muffin?". E mi ha insegnato a fare i muffin. Mi sono divertito tanto. E voglio portartene uno. <>
                    
                - secondChar_ActualName has Delfino:
                    A scuola sto finendo tantissimo nei guai. Ho iniziato a fare qualche dispetto ai bambini prepotenti. Secondo me hanno funzionato, ma le maestre si sono arrabbiate. Soprattutto per l'inchiostro sulle loro scarpe. Ma non è colpa mia se si sono messe in mezzo! Però mi sono fatto due nuovi amici, e l'altro giorno abbiamo passato mezz'ora in castigo assieme. Quando la maestra di matematica è tornata e ha trovato la stanza tutta legata con lo spago, ha detto una parolaccia grossa. Ma grossa grossa. Quando l'ho ridetta a mio fratello è scoppiato a ridere. Ma forse qui non te la scrivo, per ora. <>
                    
                - secondChar_ActualName has Capibara:
                    Ieri ho avuto una conversazione da grandi con mio fratello. Me l'ha fatta perché ho chiamato il suo amico "frocio" quando mi ha sgridato. E non avevo fatto nulla di male. A parte mettere della tempera nel suo frullatore. Mio fratello mi ha spiegato perché fa male quella parola. E perché papà la usa quando è arrabbiato. Mi ha detto che tantissime persone usano quella parola come scusa per fare del male ad altre persone. E lo fanno perché hanno paura. E poi mi ha portato in una associazione che serve per chi è come mio fratello o il suo amico e non vuole più avere paura. E io non avevo mai capito che si possono fare tutte queste cose assieme. Mi è dispiaciuto tantissimo aver fatto male al suo amico. Però sono anche contento che mi hanno detto le cose per bene dopo tutti questi anni. E tu hai paura di alcune persone? <>
                    
                - secondChar_ActualName has Corvo:
                    L'altro giorno ho detto a mamma e papà che voglio diventare un veterinario. Per studiare e salvare gli animali. Mamma ha detto che allora forse dovrei diventare un etologo (questo l'ho fatto scrivere a lei, che però vuole sapere chi sei, è preoccupata). Quando poi ne ho parlato con mio fratello, mi ha detto che questa estate se voglio mi fa conoscere una persona che fa una cosa bellissima: salva gli animali dai laboratori. Mio fratello dice che studiare è importante, ma che per cambiare le cose devo capire come lottare. Avevo capito che dovevo lasciarla via la rabbia, {player_name}. Ma lui mi dice che la rabbia serve. Va solo mandata nella giusta direzione. Ti scriverò appena scopro qual è quella giusta e quale è quella sbagliata. <>
                
     
            }
          PS: come sta {mentorName}? Mi spiace per come l'ho trattata mentre ero lì, sai? Ma non dirglielo. Per ora per lo meno. Ciao!
}

//Appunto sul dono fatto

{
    - second_story_gift.ink_outcome: <b><i>Appunti su dono e riscrittura:</b></i> <>
}

{

    - second_character_feedback: Dopo aver aiutato {charNameTwo}, Mentore mi ha detto che <>
            {
            - secondChar_ActualName has Grizzly:
                "il nostro bambino" ha abbracciato il lato rabbioso, e l'ha fatto proprio. E lei non è una fan della rabbia.
            
            - secondChar_ActualName has Lupo: forse un giorno la nonna e il fratello di {charNameTwo} torneranno a vivere sotto il tetto dei genitori. E questo senso di famiglia così forte per lei sarebbe un finale davvero felice.
            
            - secondChar_ActualName has Delfino:
                è perplessa, perché ho reso {charNameTwo} un giullare.
                            
            - secondChar_ActualName has Capibara:
                non sempre il mondo può essere come vuole lei, e che non è una grande fan dell'idea che l'unione faccia la forza.
            
            - secondChar_ActualName has Corvo:
                non avrei potuto ottenere un esito migliore. Che ce lo vede a studiare nuovi modi per curare le persone, o ridurre la fame nel mondo. O creare una begonia totalmente nera.

        }

}

{rewriting_proposal_second_character.ending: Dopo la nostra conversazione, {charNameTwo} ha scelto un nuovo nome: <b><i>{charNameTwo}.}

{secondAffinityFeedback:
    Il valore massimo di inchiostro che ho ricevuto è stato: {fromInkToNumbers(SecondCharacter)}. <>
}

{
    - second_story_gift.ink_outcome:
        {
            - secondChar_favouritesGifts has secondChar_giftedObject:
            Gli ho donato <b><i>{secondChar_giftedObject}</b></i> ed era entusiasta! <>
            
            - secondChar_goodGifts has secondChar_giftedObject:
            Gli ho donato <b><i>{secondChar_giftedObject}</b></i> ed ha abbastanza apprezzato. <>
            
            - else:
            Gli ho donato <b><i>{secondChar_giftedObject}</b></i> e non ha apprezzato per nulla. <>
        
        }
}        


{
- rewriting_proposal_second_character: 
        Dopo il dono, {charNameTwo} mi ha detto che da quando la nonna è nella casa dei vecchi, tutto fa schifo. Suo padre è tornato e litiga sempre con sua madre. Se il padre non c'è, la madre si incazza con lui, e gli dice di smetterla di piangere e di fare il grande. Le maestre sono "fastidiose". Il fratello dice che il mondo è un posto orribile e irreparabile. Gli animali spariranno tutti per colpa nostra. I grandi fanno schifo e per questo non vuole crescere. E ha inventato la storia del compleanno perché se non inventa motivi, nessuno lo ascolta.
}


{
    - second_char_main_storylets.one:
           <b><i>Appunti dalle conversazioni.</b></i> <>
}
{
    - at_table_with_second_char.good_reaction:
        Dopo aver cucinato assieme, {charNameTwo} ha detto a {player_name} che gli piacciono le persone coerenti.

    - at_table_with_second_char.meh_reaction:
        Dopo aver cucinato assieme, {charNameTwo} ha detto a {player_name} che gli piacciono i cani, ma non gli piace quando fanno le cose a caso. Tipo correre a destra e sinistra e ovunque.Devi andare dove devi andare. Come quando si parla.
}
{
    - ending_cooking_with_second_char:
        Cucinando assieme, abbiamo preparato un buon piatto di {kitchen_secondCharRecipe}.
}
{
    - second_char_main_storylets.twelve:
        {charNameTwo} ama la biblioteca, e l'altra nonna, una che vive al mare, ha tantissimi libri. Ama stare in quel posto, anche perché sua madre e suo padre non ci vanno. E così può passare il tempo che suo fratello e il suo amico, studiare con la nonna del mare. Al mare quando va a letto non deve "correggere le giornate". L'altra nonna è nella "casa dei vecchi", e per questo {charNameTwo} ora vorrebbe andare a vivere con la nonna del mare. E mi ha invitato a leggere i libri della biblioteca che avrà quando sarà grande.
    
}

{
    - second_char_main_storylets.eleven:
        Il piccolo chimico {charNameTwo} ama fare pasticci: si è intossicato mischiando prodotti per la pulizia; ha riempito il letto della madre di sabbia; ha distrutto il frullatore dell'amico del fratello. Però ha scoperto cos'è l'elettricità e i fili elettrici nel muro, e questo l'ha reso felice. Ritiene che noi (noi chi {charNameTwo}, noi chi?) non ci facciamo abbastanza domande su questo posto, e che quindi tocchi a lui trovare le risposte.
    
}


{
    - second_char_main_storylets.ten:
        {charNameTwo} mi ha raccontato di un bambino che ha picchiato a scuola. L'ha picchiato fino a farlo piangere, e allora si è arrabbiato ancora di più. La maestra di matematica l'ha messo in castigo. Ora lui si sente in colpa, vorrebbe chiedergli scusa ma il bimbo scappa, e la sorellina una volta gli ha lanciato una scarpa in faccia. Secondo il fratello fare a botte è normale. Il padre dà la colpa a {charNameTwo}, quando lo picchia. E {charNameTwo} vorrebbe né farsi picchiare né picchiare. Ma non sa cosa fare quando è arrabbiato. E ha chiuso dicendo: "Essere adulti è terribile. Ma non è bello nemmeno essere bambini".
    
}


{
    - second_char_main_storylets.nine:
        {charNameTwo} e il lavoro. Ovvero: tutti l3 su3 compagn3 fanno mille cose, e lui invece è interessato solo agli animali. Ma ha paura che non esisteranno più animali quando sarà grande per via del cambiamento climatico. E per questo non vuole diventare grande, ma nemmeno restare bambino. Però gli piacerebbe fare il veterinario.
    
}


{
    - second_char_main_storylets.eight:
        Ha iniziato a dirmi delle cose sul fratello (che è campione di Karate, che ha una macchina enorme, e muscoli etc.) ma poi ha detto subito che stava mentendo. Suo fratello e suo padre litigano spesso. Il fratello lavora in una officina, crea statue coi pezzi rotti delle auto, e vive con un amico. E va a trovare {charNameTwo} solo quando il padre non c'è. Mentre {charNameTwo} va a trovarlo poco, perché l'amico non gli sembra felice quando {charNameTwo} va da loro. Però fa dei dolci buonissimi.
    
}


{
    - second_char_main_storylets.seven:
        Abbiamo uno scrittore. O per lo meno, un riscrittore. Perché {charNameTwo} la sera va a letto presto per "correggere le giornate", immaginarle in modo diverso, per far sì che i suoi non litighino, o che sia più forte degli altri bambini così che gli altri divengano suoi amici. E ha provato a leccare la rana.
    
}


{
    - second_char_main_storylets.six:
        A quanto pare dalla serra è scomparso l'innaffiatoio. E quando ne ho parlato con {charNameTwo}, mi ha detto che a scuola tutti gli danno la colpa. Che i grandi lo picchiano, anche se lui è felice di non piangere perché "non sono una femmina". Non va d'accordo con le compagne, e le maestre lo mettono sempre in castigo. Anche se sembra che gli abbia dato più fastidio che quella di matematica si sia mostrata dispiaciuta per lui, dopo aver parlato con la nonna. Comunque dice che l'innaffiatoio è dove l'ho lasciato.
    
}


{
    - second_char_main_storylets.five:
        Sembra che ci sia una rana nello stagno, e {charNameTwo} è preso benissimo. E la rana gli ha detto che ha un regalo per me. Buffo.
    
}




{
    - second_char_main_storylets.three:
        {charNameTwo} mi ha parlato di sua nonna. Dice che lei non lo tratta come un bambino, e che gli ha insegnato a barare con le carte. Il tempo passato con lei sembra davvero bello. Il padre a un certo punto se ne è andato, e lei ha aiutato la mamma di {charNameTwo} "a stare bene". Ma quando suo padre è tornato, la madre ha ripreso a trattare male la nonna. Che ha detto a {charNameTwo} che i grandi fanno cose cattive senza saperlo. E poi ha detto che gli dispiace essere scappato di casa. E mi ha chiesto scusa per le bugie: non è il suo compleanno, la madre non gli ha organizzato alcuna festa. Ha promesso di non mentire più.
    
}


{
    - second_char_main_storylets.him_liar:
        {charNameTwo} mi ha chiesto finalmente il nome. E quando ha capito che sono un maschio, si è lamentato di Mentore. Poi ha tirato fuori di nuovo il discorso delle action figures. La madre sembra faccia storie nel comprargli cose, e non vuole prendere niente che lei lega alla violenza. Il fratello lo fa giocare alla Switch.
    
}

{
    - second_char_main_storylets.her_liar:
        {charNameTwo} mi ha chiesto finalmente il nome. Ma non ha apprezzato che io sia una ragazza. Dice che le ragazze sono strane. Che sua mamma è strana, ma le vuole bene. Anche se si dimentica le cose, tipo che oggi si è dimenticata il suo compleanno. E non sa che lui è qui.
    
}

{
    - second_char_main_storylets.they_liar:
        {charNameTwo} mi ha chiesto finalmente il nome. E quando gli ho detto che uso i pronomi neutri, mi ha detto che vorrebbe anche lui un pronome <i>strano</i>. Non il modo peggiore di reagire, direi. Poi ha detto che sua mamma si è dimenticata il suo compleanno, e anche quello dell'anno scorso. E che l'anno scorso per farsi perdonare gli ha regalato una action figure di Spidreman, anche se lui preferisce le Tartarughe Ninja.
    
}


{
    - second_char_main_storylets.two:
        Non ci sono altri bambini, non ne ha invitati. Il bimbo è preso bene dagli animali che vivono qui, è una specie di Wikipedia delle bestiole. Ma quando gli ho fatto presente che ha picchiato Mentore, non l'ha presa bene. E ha detto che se Mentore non lo lascia in pace, chiamerà il suo fortissimo fratello. A proposito di Mentore: ha detto che le ricorda un {charNameTwo}, e penso che per comodità lo chiamerò così.
    
}



{
    - second_char_main_storylets.one:
        È comparso un bambino. È partito chiedendomi come mai fossi qui, senza nemmeno presentarsi, senza chiedermi il nome. E poi mi ha raccontato che è il suo compleanno, che sua mamma gli ha promesso una festa FIGHISSIMA (l'ha urlato). E che suo padre gli ha rubato le action figures lo scorso anno, e per questo non potrà venire qui alla festa quest'anno. E mi ha chiesto di cercare i suoi compagni di scuola.
    
}




    -> rewriter_book_with_flow

