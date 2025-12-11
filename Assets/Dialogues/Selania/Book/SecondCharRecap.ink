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
    - second_character_notes.three.bookUpdate:
    <b><i>Terza lettera di {charNameTwo}.</b></i> <><N>
        Ciao {player_name}. <><N>

           {
                - secondChar_ActualName has Grizzly:
                    Sono SUPER ARRABBIATO. <N>CON MIO FRATELLO. <N>Non avevamo mai litigato, mai. <N>Ma l'altro giorno è venuto a casa e mi ha detto che sto diventando come papà. <N>Papà si è incazzato con lui e mi ha difeso.
                    
                    Mio fratello dice che sto diventando un bullo. <N>Che un suo amico maestro a scuola gli ha detto che me la prendo coi più piccoli. <N>Papà gli ha detto che mi faccio rispettare. <N>E che non sono una checca come lui. <N>Lui mio fratello. <N>Non sono mica abituato a mio padre così.
                    
                    Ma poi in camera mi è preso male tutto. <N>Mi manca mio fratello. <N>Mi mancate voi. <N>Vorrei sapere cosa fare. <><N>
                    
                - secondChar_ActualName has Lupo:
                    Oggi sono triste, e non so perché. <N>Ho dato un pugno a un ragazzo delle medie, ma non mi è mica piaciuto. <N>A casa le cose vanno bene, ma. <N>Sì no boh. <N>Mica pensavo che è così faticoso. <N>Mamma e papà sono tranquilli solo se siamo assieme. <N>Mi sembra un lavoro. 
                    
                    E se sono giù si preoccupano tantissimo. <N>E se si preoccupano tornano a litigare. <N>Non so mica cosa fare. <N>Forse {mentorName} li può aiutare? <N>Mi mancate. <N><b>{charNameTwo}</b>. <><N>

                    
                - secondChar_ActualName has Delfino:
                    Se non l'hai capito nell'ultima lettera solo l'ultima frase non era vera: tutte le altre lo erano. <N>Però è successa una cosa divertente, {player_name}! <N>La prof di matematica mi ha detto che le mie bugie sono storie. <N>E che le storie sono da conservare. <N>E quindi abbiamo aperto assieme a altri bambini un giornale della scuola.
                    
                    Faremo uscire per tutto il resto dell'anno i nostri racconti e le notizie. <N>Mi ha solo chiesto di non scrivere più quella parolaccia che lei ha detto. <N>E di non dire niente sulla preside o si arrabbia. <N>E allora ti saluto dicendoti quella parolaccia, perché poi non la potrò più scrivere. <N>"Per il catarro del cammello!" <N>Che schifo, {player_name}. <N>Ma lì ci sono i cammelli? <N>Un saluto. <><N>
                    
                - secondChar_ActualName has Capibara:
                    Questo cervellino (il mio cervellino) ha trovato una soluzione. <N>Ho parlato con la prof di matematica, e le ho detto delle mie paure. <N>Degli animali che spariscono, dei boschi che bruciano. <N>Dei ghiacciai. <N>Lei mi ha detto che possiamo raccogliere dei soldi ma sì no boh. <N>Io pensavo all'associazione di mio fratello e del suo fidanzato, e loro insegnano a non avere paura non a spendere soldi. <N>Allora mi ha fatto fare una lezione in classe su queste cose. 
                    
                    Ho spiegato le paure. <N>E poi ho detto che se ci mettiamo assieme ci sono anche le soluzioni. <N>Alcuni compagni hanno detto che ci possiamo trovare nel campetto il pomeriggio. <N>E quindi forse qualcosa sta iniziando, {player_name}. <N>Non so cosa faremo, però è bello non farlo da solo. <N>E vorrei tanto tu fossi qui con me, ora. <N>Secondo me ci diresti tantissime cose sagge. <N>Salutami la rana. <N>{charNameTwo}. <><N>
                    
                - secondChar_ActualName has Corvo:
                    Ieri è successa una cosa fighissima. <N>Ti ricordi quell'amica di mio fratello, che dovevo conoscere al mare? <N>Sta da tre giorni da lui perché dice che è stata buttata fuori di casa. <N>E mi ha raccontato tante cose che mica sapevo. <N>Cose brutte che vengono fatte agli animali. 
                    
                    Ma, {player_name}: non aveva paura. <N>Lei dice che sono sveglio, e che per questo non devo avere paura perché posso capire tutto. <N>E che magari un giorno trovo un modo per salvare gli animali. <N>Mi ha regalato un romanzo di Ursula LeGuin (ho dovuto guardare la copertina, è un nome difficile). <N>Non sapevo di potere imparare cose dai romanzi. 
                    
                    Oggi ho chiesto alla maestra di matematica di darmi dei libri sull'ambiente. <N>Ci sono così tante cose da imparare, {player_name}, così tante! <N>Spero ci vedremo presto. <N>Salutami la rana! <N><b>{charNameTwo}</b>. <><N>
            }
        PS: Ma poi hai scoperto cos'è quel tronco nella foresta? PPS: Ho un segreto che riguarda la serra, ma te lo dirò con la prossima lettera! Ciao ciao!
}


{
    - second_character_notes.two.bookUpdate:
        <b><i>Seconda lettera di {charNameTwo}.</b></i> <><N>Che strano: ho lasciato l'altra lettera sul comodino di notte.<N>E poi è sparita.<N>Non so mica se ti è arrivata.<N>O se papà l'ha buttata.

           {

                - secondChar_ActualName has Grizzly: 
                    Se l'ha buttata urlo di nuovo, vediamo che mi dice poi. <N>Però ti dovevo dire questa cosa: sono nella squadra di calcio. <N>Non sono mica bravo, sinceramente. <N>Questa roba delle forza e della velocità non è roba mia proprio. <N>Però dice l'allenatore che ho strategia. <N>Mamma me l'ha fatto fare perché dice che devo scaricare tutta questa "rabbia da ragazzino". 
                    
                    E non mi chiama più bambino. <N>Negli spogliatoi ci sono state delle risse. <N>Ho dato un pugno straforte a uno più grande. <N>E ora a scuola non mi rompono più le scatole. <N>Se qualcuno ti rompe le scatole {player_name} chiamami E ti aiuto io. <N>Ciao! <><N>
                    
                - secondChar_ActualName has Lupo:
                    Ma non credo: le cose negli ultimi giorni vanno meglio. <N>Con l'amico di mio fratello ho fatto dei muffin per lui e mamma. <N>E poi gli ho detto che mi dispiace quando litigano. <N>E che ho capito che essere grandi fa schifo, ma che ci sono anche cose belle. <N>Come andare al mare. <N>Mamma si è messa a piangere.
                    
                    Papà è stato in silenzio tantissimo. <N>E ho iniziato a pensare che mi avrebbe picchiato. <N>Invece ha detto: domani si fa vacanza e si va a nuotare tutti assieme. <N>Mamma l'ha abbracciato, e si è mangiata un intero muffin. <N>Ti dico poi come è andata! <N>A presto. <><N>
                    
                - secondChar_ActualName has Delfino:
                    In questi giorni ho ripreso a dire delle bugie. <N>Ma invece di dirle piccole, le sto dicendo grandissime. <N>E questa cosa fa divertire i miei nuovi amici. <N>E anche qualche maestra. <N>Mamma dice che da grande devo fare il comico. <N>Papà dice che devo fare il politico. <N>Mio fratello è preoccupato, perché teme che mi metto nei pasticci. 
                    Gioco: una di queste cose che ho detto non è vera. <N>Tu lo capisci quale? <N>Salutami la rana! <N><b>{charNameTwo}</b>. <><N>
                    
                - secondChar_ActualName has Capibara:
                    Dopo che gli ho detto che lui usa quella parola con mio fratello perché ha paura, non mi parla più. <N>Mamma dice che lui ha paura di tutte le cose, ma non lo sa dire. <N>Le ho detto che ci sono delle associazioni. <N>Lei ha sorriso e mi ha detto che sto davvero diventando grande. <N>Però continuo a pensarci a questa cosa delle associazioni.
                    
                    Tu lo sai che io ho paura per gli animali. <N>E mi hai insegnato che le cose si affrontano con gli amici. <N>Magari non sono bravo a farmi degli amici, ma sono bravo a parlare degli animali. <N>E forse ci riesco a fare qualcosa così, come mio fratello fa per i suoi amici. <N>Devo solo capire cosa. <N>Vorrei tanto chiederlo alla rana. <N>Salutamela! <><N>
                    
                - secondChar_ActualName has Corvo:
                    Ultimamente parliamo di più. <N>Gli piace parlare di politica. <N>Secondo me dice cose stupide, ma forse nelle sue cose stupide c'è lui, le sue paure. <N>Almeno così dice l'amico di mio fratello. <N>Oggi siamo stati da nonna. <N>Ho dovuto insistere perché avevano paura che ci rimanevo male.
                    
                    Si no boh. <N>Mi è spiaciuto quando non mi ha riconosciuto. <N>Però è sempre la nonna. <N>Quando mamma ha parlato con l'infermiera ho preso un mazzo di carte. <N>Era sporco e mancava l'asso di picche. <N>Ma nonna ha ricordato tutti i trucchi e mi ha stracciato.<N> Stammi bene! <N><b>{charNameTwo}</b>. <><N>
     
            }
        PS: mi piace mettere i PS, su internet non ci sono.<N>PPS: ma sono arrivate persone nuove poi? Qualcuna con dei dolci magari?
}

{
    - second_character_notes.one.bookUpdate:
        <b><i>Prima lettera di {charNameTwo}.</b></i><N>Sono a lezione e mi sto rompendo e quindi ho deciso di scrivere a {player_name}. <N>Cioè a te. <N>Anche se non ho mica capito come te la mando la lettera. <N>Ma come sta la rana? <N>Hai scoperto poi se è elettrica?

           {
                - secondChar_ActualName has Grizzly:
                    Oggi per la prima volta ho litigato con papà. <N>Nel senso che non è stato mica lui a cominciare ma io. <N>Ha cercato di picchiarmi e gli ho urlato che è un bullo. <N>E poi ho preso i miei libri e glieli ho tirati contro. <N>Lui si è arrabbiato così tanto, {player_name}! <N>E allora ho urlato. 
                    
                    Urlato come un orso. <N>Che si dice che ho bramito quindi. <N>E lui se ne è andato sbattendo la porta, urlando a mamma che ha tirato su un deficiente. <N>Però sono felice perché ho meno paura ora. <N>Mamma mi guarda strano. <N>Ma so che tu mica mi avresti guardato così. <><N>
                    
                - secondChar_ActualName has Lupo: 
                    L'altro giorno ho parlato con l'amico di mio fratello. <N>Gli ho detto che per me siamo un branco ma che secondo me lui mica mi ci vede in questo branco. <N>E lui mi ha detto una cosa strana. <N>Che non ce l'ha con me. <N>Ma che non sa parlare coi bambini. <N>Allora gli ho detto di non parlarmi come un bambino.
                    
                    Che so cosa sono i lupi, le frazioni, l'elettricità. <N>Lui ha riso e mi ha detto: "Ma sai creare un muffin?". <N>E mi ha insegnato a fare i muffin. <N>Mi sono divertito tanto. <N>E voglio portartene uno. <><N>
                    
                - secondChar_ActualName has Delfino:
                    A scuola sto finendo tantissimo nei guai. <N>Ho iniziato a fare qualche dispetto ai bambini prepotenti. <N>Secondo me hanno funzionato, ma le maestre si sono arrabbiate. <N>Soprattutto per l'inchiostro sulle loro scarpe. <N>Ma non è colpa mia se si sono messe in mezzo! <N>Però mi sono fatto due nuovi amici, e l'altro giorno abbiamo passato mezz'ora in castigo assieme.
                    
                    Quando la maestra di matematica è tornata e ha trovato la stanza tutta legata con lo spago, ha detto una parolaccia grossa. <N>Ma grossa grossa. <N>Quando l'ho ridetta a mio fratello è scoppiato a ridere. <N>Ma forse qui non te la scrivo, per ora. <><N>
                    
                - secondChar_ActualName has Capibara:
                    Ieri ho avuto una conversazione da grandi con mio fratello. <N>Me l'ha fatta perché ho chiamato il suo amico "frocio" quando mi ha sgridato. <N>E non avevo fatto nulla di male. <N>A parte mettere della tempera nel suo frullatore. <N>Mio fratello mi ha spiegato perché fa male quella parola. <N>E perché papà la usa quando è arrabbiato.
                    
                    Mi ha detto che tantissime persone usano quella parola come scusa per fare del male ad altre persone. <N>E lo fanno perché hanno paura. <N>E poi mi ha portato in una associazione che serve per chi è come mio fratello o il suo amico e non vuole più avere paura. <N>E io non avevo mai capito che si possono fare tutte queste cose assieme. <N>Mi è dispiaciuto tantissimo aver fatto male al suo amico. 
                    
                    Però sono anche contento che mi hanno detto le cose per bene dopo tutti questi anni. <N>E tu hai paura di alcune persone? <><N>
                    
                - secondChar_ActualName has Corvo:
                    L'altro giorno ho detto a mamma e papà che voglio diventare un veterinario. <N>Per studiare e salvare gli animali. <N>Mamma ha detto che allora forse dovrei diventare un etologo (questo l'ho fatto scrivere a lei, che però vuole sapere chi sei, è preoccupata). <N>Quando poi ne ho parlato con mio fratello, mi ha detto che questa estate se voglio mi fa conoscere una persona che fa una cosa bellissima: salva gli animali dai laboratori. 
                    
                    Mio fratello dice che studiare è importante, ma che per cambiare le cose devo capire come lottare. <N>Avevo capito che dovevo lasciarla via la rabbia, {player_name}. <N>Ma lui mi dice che la rabbia serve. <N>Va solo mandata nella giusta direzione. <N>Ti scriverò appena scopro qual è quella giusta e quale è quella sbagliata. <><N>
                
     
            }
          PS: come sta {mentorName}? Mi spiace per come l'ho trattata mentre ero lì, sai? Ma non dirglielo. Per ora per lo meno. <N>Ciao!
}

//Appunto sul dono fatto

{
    - second_story_gift.ink_outcome: <b><i>Appunti su dono e riscrittura:</b></i> <><N>
}

    {

        - second_character_feedback.bookUpdate: Dopo aver aiutato {charNameTwo}, Mentor ha detto a {player_name} che <>
                {
                - secondChar_ActualName has Grizzly:
                    "il nostro bambino" ha abbracciato il lato rabbioso, e l'ha fatto proprio. E lei non è una fan della rabbia.
                
                - secondChar_ActualName has Lupo: forse un giorno la nonna e il fratello di {charNameTwo} torneranno a vivere sotto il tetto dei genitori. E questo senso di famiglia così forte per lei sarebbe un finale davvero felice.
                
                - secondChar_ActualName has Delfino:
                    è perplessa, perché {player_name} ha reso {charNameTwo} un giullare.
                                
                - secondChar_ActualName has Capibara:
                    non sempre il mondo può essere come vuole lei, e che non è una grande fan dell'idea che l'unione faccia la forza.
                
                - secondChar_ActualName has Corvo:
                    non avrei potuto ottenere un esito migliore. Che ce lo vede a studiare nuovi modi per curare le persone, o ridurre la fame nel mondo. O creare una begonia totalmente nera.
            }

    }

    {rewriting_proposal_second_character.close.bookUpdate: Dopo la conversazione con {player_name}, {charNameTwo} ha scelto un nuovo nome: <b><i>{charNameTwo}.}

    {secondAffinityFeedback:
        Il valore massimo di inchiostro che {player_name} ha raggiunto è stato: {fromInkToNumbers(SecondCharacter)}. <>
    }

    {
        - second_story_gift.ink_outcome:
            {
                - secondChar_favouritesGifts has secondChar_giftedObject:
                {player_name} gli ha donato <b><i>{secondChar_giftedObject}</b></i> ed era entusiasta! <>
                
                - secondChar_goodGifts has secondChar_giftedObject:
                {player_name} gli ha donato <b><i>{secondChar_giftedObject}</b></i> ed ha abbastanza apprezzato. <>
                
                - else:
                {player_name} gli ha donato <b><i>{secondChar_giftedObject}</b></i> e non ha apprezzato per nulla. <>
            
            }
    }        


    {
        - rewriting_proposal_second_character.bookUpdate: 
            Dopo il dono, {charNameTwo} ha detto a {player_name} che da quando la nonna è nella casa dei vecchi, tutto fa schifo. Suo padre è tornato e litiga sempre con sua madre. Se il padre non c'è, la madre si incazza con lui, e gli dice di smetterla di piangere e di fare il grande. Le maestre sono "fastidiose". Il fratello dice che il mondo è un posto orribile e irreparabile. Gli animali spariranno tutti per colpa nostra. I grandi fanno schifo e per questo non vuole crescere. E ha inventato la storia del compleanno perché se non inventa motivi, nessuno lo ascolta.
    }


{
    - second_char_main_storylets.one.bookUpdate:
           <b><i>Appunti dalle conversazioni.</b></i> <>
}


    {
        - ending_cooking_with_second_char.bookUpdate:
            Cucinando assieme, {charNameTwo} e {player_name} hanno preparato un buon piatto di {kitchen_secondCharRecipe}.<>
            {
                - at_table_with_second_char.good_reaction:
                    Dopo aver cucinato assieme, {charNameTwo} ha detto a {player_name} che gli piacciono le persone coerenti.

                - at_table_with_second_char.meh_reaction:
                    Dopo aver cucinato assieme, {charNameTwo} ha detto a {player_name} che gli piacciono i cani, ma non gli piace quando fanno le cose a caso. Tipo correre a destra e sinistra e ovunque.Devi andare dove devi andare. Come quando si parla.
            }
    }
    {
        - cooking_with_second_char.first_theme.bookUpdate:
            Durante l'incontro in cucina, {charNameTwo} e {player_name} hanno parlato di animali. {charNameTwo} ha raccontato che gli piace inventare animali unendo pezzi diversi, e poi si è lamentato perché gli adulti non si divertono davvero. E dopo aver chiesto a {player_name} come gli piaccia divertirsi, {player_pronouns has him:gli|{player_pronouns has her:le|lə}} ha detto che per capire meglio le persone, le associa agli animali. E ha chiesto a {player_name} che animale si sente, e se {player_pronouns has him:lui|{player_pronouns has her:lei|ləi}} capisce le persone. E poi, frustrato, ha detto che i grandi lo ritengono strano, ma lui li trova strani, e ha chiesto a {player_name} se {player_pronouns has him:gli|{player_pronouns has her:le|lə}} piace come le altre persone l{player_pronouns has him:o|{player_pronouns has her:a|ə}} trattano.
    }
    {
        - cooking_with_second_char.second_theme.bookUpdate:
            Durante l'incontro in cucina, {charNameTwo} e {player_name} hanno parlato di scuola. {charNameTwo} all'inizio non l'ha presa bene, e si è molto lamentato delle punizioni, per poi voler sapere come se la cava {player_name} nelle cose che fa. Ha raccontato di come la madre dia per scontate le cose giuste che fa a scuola ma si arrabbia se lui sbaglia, e che lei gli dice che deve essere bravo a scuola, il fratello buono, la nonna furbo, e lui non sa chi essere. Ha chiesto a {player_name} come {player_pronouns has him:gli|{player_pronouns has her:le|lə}} piace lavorare, per poi confidar{player_pronouns has him:gli|{player_pronouns has her:le|lə}} che si nasconde a scuola in un posto segreto per leggere. E ha chiesto a {player_name} se non si sente mai sol{player_pronouns has him:o|{player_pronouns has her:a|ə}}.
    }
    {
        - cooking_with_second_char.third_theme.bookUpdate:
            Durante l'incontro in cucina, {charNameTwo} e {player_name} hanno parlato di bugie. {charNameTwo} ha temuto che {player_name} volesse sgridarlo di nuovo, per poi chiedere scusa e domandare se tutte le bugie sono sbagliate. Ha raccontato che a scuola dice molte bugie e che per questo ha un soprannome, ma che è l'unico modo per farsi amici. E che suo fratello gli ha detto che le storie sono delle bugie per affrontare le cose schifose. Ha concluso chiedendo a {player_name} cosa significhi per {player_pronouns has him:lui|{player_pronouns has her:lei|ləi}} essere grande.
    }

    {
        - food_gift_second_char.bookUpdate:
            {charNameTwo} ha donato a {mentorName} un suo piatto, che si chiama PanTutto. E ha raccontato a {mentorName} e {player_name} che a casa è spesso da solo e per questo ha imparato a cucinare cose inventate. E parlando di cibo e dolci, {charNameTwo} e {mentorName} hanno fatto ufficialmente pace.
    }
    {
        - open_the_library.bookUpdate:
            Dopo aver aperto la biblioteca, {charNameTwo} ha fatto capire a {player_name} che è la cosa più bella che si possa trovare. Ed è esaltato perché ha trovato dei librogame, e vuole trovare delle matite per scrivere le sue storie.
    }

    {
        - a_story_of_rebellion.bookUpdate:
            Dopo la lettura de <b>Il sassolino</b> di Lamia, {charNameTwo} ha chiesto esaltato che cosa avrebbe fatto {player_name} in quella situazione. E poi {player_pronouns has him:gli|{player_pronouns has her:le|lə}} ha detto che gli ricorda molto la scuola, che le maestre vogliono che i bambini stiano sempre fermi, e che gli adulti non vedono mai certi problemi.
    }
    
    {
        - frog_and_second_char_chit_chat.bookUpdate:
            {charNameTwo} e Franco la Rana hanno discusso sulla capacità o meno delle rane di nuotare. Franco ha forse convinto {charNameTwo} di non essere un bambino ma un riccio.
    }

    {
        - first_second_chit_chat.bookUpdate:
            {charNameOne} e {charNameTwo} si sono presentat3, discutendo di alieni e pisolini.
    }
    
    {
    
        - frog_second_char_gift != "":
            {player_name} ha chiesto un consiglio a Franco la Rana su cosa donare a {charNameTwo}, e la risposta di Franco è stata: {frog_second_char_gift}.
    }
    
    {
    
        - frog_second_char_ingredient != "":
            {player_name} ha chiesto un consiglio a Franco la Rana su cosa inserire nel piatto da cucinare con {charNameTwo}, e la risposta di Franco è stata: {frog_second_char_ingredient}.
    }
    
    {
    
        - frog_second_novel != "":
            {player_name} ha chiesto un consiglio a Franco la Rana su un racconto di cui parlare con {charNameTwo}, e la risposta di Franco è stata: {frog_second_novel}.
    }
    
    {
        - about_violence_and_peace.bookUpdate:
            {mentorName} e {charNameTwo} hanno provato a chiarirsi. {mentorName} con un po' di fatica ha ammesso che non avrebbe dovuto fare male a {charNameTwo}. E quando lui ha reagito senza entusiasmo, ci è rimasta male. A quel punto {charNameTwo} ha detto a {mentorName} che "I grandi chiedono sempre scusa per tutte le cose ma poi le rifanno. Poi piangono e chiedono scusa. E poi le rifanno.". Lei ha detto che ci crede davvero, ma {charNameTwo} se ne è andato.
    }

    {
        - second_char_main_storylets.twelve.bookUpdate:
            {charNameTwo} ha raccontato a {player_name} che ama la biblioteca, e l'altra nonna, una che vive al mare, ha tantissimi libri. Adora stare in quel posto, anche perché sua madre e suo padre non ci vanno. E così può passare il tempo che suo fratello e il suo amico, studiare con la nonna del mare. Al mare quando va a letto non deve "correggere le giornate". L'altra nonna è nella "casa dei vecchi", e per questo {charNameTwo} ora vorrebbe andare a vivere con la nonna del mare. E ha invitato {player_name} a leggere i libri della biblioteca che avrà quando sarà grande.
    }

    {
        - second_char_main_storylets.eleven.bookUpdate:
            Il piccolo chimico {charNameTwo} ama fare pasticci: si è intossicato mischiando prodotti per la pulizia; ha riempito il letto della madre di sabbia; ha distrutto il frullatore dell'amico del fratello. Però ha scoperto cos'è l'elettricità e i fili elettrici nel muro, e questo l'ha reso felice. Ritiene che "loro" (non abbiamo capito se anche {player_name} è inclus{player_pronouns has him:o|{player_pronouns has her:a|ə}} e se anche noi lo siamo) non si fanno abbastanza domande su questo posto, e che quindi tocchi a lui trovare le risposte.
    }

    {
        - second_char_main_storylets.ten.bookUpdate:
            {charNameTwo} ha raccontato a {player_name} di un bambino che ha picchiato a scuola. L'ha picchiato fino a farlo piangere, e allora si è arrabbiato ancora di più. La maestra di matematica l'ha messo in castigo. Ora lui si sente in colpa, vorrebbe chiedergli scusa ma il bimbo scappa, e la sorellina una volta gli ha lanciato una scarpa in faccia. Secondo il fratello fare a botte è normale. Il padre dà la colpa a {charNameTwo}, quando lo picchia. E {charNameTwo} vorrebbe né farsi picchiare né picchiare. Ma non sa cosa fare quando è arrabbiato. E ha chiuso dicendo: "Essere adulti è terribile. Ma non è bello nemmeno essere bambini"
    }

    {
        - second_char_main_storylets.nine.bookUpdate:
            {charNameTwo} ha parlato a {player_name} di lavoro. Ovvero: tutt3 l3 su3 compagn3 fanno mille cose, e lui invece è interessato solo agli animali. Ma ha paura che non esisteranno più animali quando sarà grande per via del cambiamento climatico. E per questo non vuole diventare grande, ma nemmeno restare bambino. Però gli piacerebbe fare il veterinario.
    }

    {
        - second_char_main_storylets.eight.bookUpdate:
            {charNameTwo} ha iniziato a dire a {player_name} delle cose sul fratello (che è campione di Karate, che ha una macchina enorme, e muscoli etc.) ma poi ha detto subito che stava mentendo. Suo fratello e suo padre litigano spesso. Il fratello lavora in una officina, crea statue coi pezzi rotti delle auto, e vive con un amico. E va a trovare {charNameTwo} solo quando il padre non c'è. Mentre {charNameTwo} va a trovarlo poco, perché l'amico non gli sembra felice quando {charNameTwo} va da loro. Però fa dei dolci buonissimi.
    }

    {
        - second_char_main_storylets.seven.bookUpdate:
            {charNameTwo} sembra avere l'anima di uno scrittore. O per lo meno, un riscrittore. Perché {charNameTwo} la sera va a letto presto per "correggere le giornate", immaginarle in modo diverso, per far sì che i suoi non litighino, o che sia più forte degli altri bambini così che gli altri divengano suoi amici. E ha provato a leccare la rana.
    }

    {
        - second_char_main_storylets.six.bookUpdate:
            {charNameTwo} ha detto {player_name} detto che a scuola tutti gli danno la colpa. Che i grandi lo picchiano, anche se lui è felice di non piangere perché "non sono una femmina". Non va d'accordo con le compagne, e le maestre lo mettono sempre in castigo. Anche se sembra che gli abbia dato più fastidio che quella di matematica si sia mostrata dispiaciuta per lui, dopo aver parlato con la nonna. Non sembra piacergli molto, la scuola.
    }

    {
        - second_char_main_storylets.five.bookUpdate:
            {charNameTwo} ha raccontato aneddoti sulla nonna. Dice che lei non lo tratta come un bambino, e che gli ha insegnato a barare con le carte. Il tempo passato con lei sembra davvero bello. Il padre a un certo punto se ne è andato, e lei ha aiutato la mamma di {charNameTwo} "a stare bene". Ma quando suo padre è tornato, la madre ha ripreso a trattare male la nonna. Che ha detto a {charNameTwo} che i grandi fanno cose cattive senza saperlo. E poi ha detto che gli dispiace essere scappato di casa. E ha chiesto scusa a {player_name} per le bugie: non è il suo compleanno, la madre non gli ha organizzato alcuna festa. Ha promesso di non mentire più.
    }

    {
        - second_char_main_storylets.four.bookUpdate:
            {charNameTwo} ha detto a {player_name} che in realtà non ci sono altri bambini, non ne ha invitati. {charNameTwo} è preso bene dagli animali che vivono qui, è una specie di Wikipedia delle bestiole. Ma quando {player_name} gli ha fatto presente che ha picchiato {mentorName}, non l'ha presa bene. E ha detto che se {mentorName} non lo lascia in pace, chiamerà il suo fortissimo fratello.
    }


    {
        - second_char_main_storylets.him_liar:
            {charNameTwo} ha chiesto a {player_name} il suo nome. E quando ha capito che {player_name} è un ragazzo, si è lamentato di {mentorName}. Poi ha tirato fuori di nuovo il discorso delle action figures. La madre sembra faccia storie nel comprargli cose, e non vuole prendere niente che lei lega alla violenza. Il fratello lo fa giocare alla Switch.
    }

    {
        - second_char_main_storylets.her_liar:
            {charNameTwo} ha chiesto a {player_name} il suo nome. Ma non ha apprezzato che {player_name} sia una ragazza. Dice che le ragazze sono strane. Che sua mamma è strana, ma le vuole bene. Anche se si dimentica le cose, tipo che oggi si è dimenticata il suo compleanno. E non sa che lui è qui.
    }

    {
        - second_char_main_storylets.they_liar:
            {charNameTwo} ha chiesto a {player_name} il suo nome. E quando {player_name} gli ha detto che usa i pronomi neutri, ha risposto che vorrebbe anche lui un pronome <i>strano</i> (ci viene da aggiungere che sarebbe potuta andare peggio). Poi ha detto che sua mamma si è dimenticata il suo compleanno, e anche quello dell'anno scorso. E che l'anno scorso per farsi perdonare gli ha regalato una action figure di Spiderman, anche se lui preferisce le Tartarughe Ninja.
    }


    {
        - second_char_main_storylets.two.bookUpdate:
            Sembra che ci sia una rana nello stagno, e {charNameTwo} è preso benissimo. E la rana gli ha detto che ha un regalo per {player_name}.
    }


    {
        - second_char_main_storylets.one.bookUpdate:
            È comparso un bambino. È partito chiedendo a {player_name} come mai fosse qui senza presentarsi e senza chiedere a {player_name} il suo nome. Poi ha raccontato che è il suo compleanno, che sua mamma gli ha promesso una festa FIGHISSIMA (l'ha urlato). E che suo padre gli ha rubato le action figures lo scorso anno, e per questo non potrà venire qui alla festa quest'anno. E ha chiesto a {player_name} di cercare i suoi compagni di scuola.
    }

    -> rewriter_book_with_flow

