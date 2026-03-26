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
    - first_character_notes.three.bookUpdate:
        <b><i>Terza lettera di {charNameOne}.</b></i><N>Ciao ama!<N><>
     {
            - firstChar_ActualName has Triangolo:
                Qui...<N>Uh.<N>Continua a piacermi questa cosa di essere {charNameOne}, ma non è facilissima.<N>Talco ha rimandato per due volte i nostri incontri, e credo sia una scusa.<N>E a lavoro sembra che non rinnoveranno i contratti a nessunə.<N>Hanno già fatto arrivare tre persone nuove, e Luca sta facendo di tutto per tenercele lontane.<N>Ho questa sensazione strana.
                
                Che sia facile dire "goditi le piccole cose" quando tutto va bene.<N>Ma ora è.<N>È difficile.<N>Però, nota positiva: con Ennio stiamo davvero bene.<N>È come se ci fossimo risintonizzat3.<N>E le sere assieme sono tranquillizzanti. <>

            - firstChar_ActualName has RagazzaOrchestra:
                Ti sto scrivendo da... Boston!<N>Ok no, questa battuta fa ridere solo una volta.<N>Ti sto scrivendo in realtà <i>dal</i> Boston.<N>Un pub dove Talco giura di aver beccato Björk più di una volta.<N>Un posticino adorabile a Reykjavík.<N>I primi giorni qui sono stati assurdi.<N>Thomas è adorabile ora che è nel suo ambiente naturale.<N>E Talco.<N>Madonna, non l'avrei pensato, ma spacca come genitore.

                Ennio sta continuando a dirmi che gli manco.<N>Che casa sua è aperta.<N>Ma non ha più parlato della possibilità che lui venga qui.<N>E...<N>Mi va bene così.<N>Per la seconda volta nella mia vita posso fare un reset.<N>Posso provare a essere me stessa.<N>Ma con una consapevolezza che non avevo a diciannove anni.

                Forse anche per questo sfacciatamente mi sono proposta per suonare in una band locale.<N>E tra qualche sera porteremo due pezzi a un festival jazz.<N>Io.<N>Jazz.<N>Mai pensato.<N>E invece la vita può sempre sorprenderci, vero?
                
                E tu?<N>Come stai?<N>Come sta {charNameTwo}?<N>E {mentorName}?<N>Mi mancate.<N><>

            - firstChar_ActualName has FlautoDolce:
                Stai parlando ufficialmente con la presidentessa di 'sto cazzo de La Rifugia.<N>Siamo una associazione a modino.<N>Ed anche se è una cosa piccola, ne sono felice.<N>E tra le varie, stiamo tirando su un sistema di finanziamento per cantanti emergenti senza cittadinanza.<N>Ed è un casino burocratico che aiuto.<N>Ma la musica che stanno portando quest3 figliol3, non ne hai idea.<N>Per la prima volta ci sono storie e cose che proprio non capisco.<N>E mi va bene così.

                Ci ho messo una vita a capire che non posso farmi sempre capire da tutt3, ma non per questo la mia storia non conta.<N>E ora sto imparando a fare lo stesso con loro.<N>Sto diventando una persona adulta?<N>Cringe.<N>Ma intanto di mando un abbraccio giganterrimo.<N><>
                
            - firstChar_ActualName has Ocarina:
                Qui oggi la malinconia imperversa.<N>Mi manca Valeria, mi mancano le ragazze.<N>La Rifugia continua anche senza di me e una piccola piccola parte di me che è vanitosa, si è sentita subito dimenticabile.<N>Ma sono felice perché hanno fatto il primo concerto grandicello di beneficenza.<N>Grandi!<N>E ho riscritto a Talco, raccontandolə quello che sto combinando qui.

                La prima volta mi ha detto che spostarmi per spostarmi potevo andare da ləi, ma ora sembra più tranquillə sul tema.<N>Ci sono state anche le prime questioni pratiche da affrontare.<N>Tipo che non ho la patente e qui i mezzi pubblici col cavolo che funzionano come su.<N>Per un po' Ennio mi ha detto che avrebbe potuto fare avanti e indietro lui per portarmi a un ipotetico lavoro.<N>Ma poi papà ha fatto un giro di telefonate e mi ha recuperato questo motorino che sicuro sicuro è più vecchio di me.<N>E ora provo a farci avanti e indietro per il cortile dei miei e mi sento come quando ho imparato ad usare la bici da piccola.

                Ma con più lividi e graffi perché solo la Madonna sa quante volte sono cascata.<N>L'altra sera, dolorante e un po' alticcia, stavo per raccontare di te, del posto.<N>Ma poi le parole non sono venute.<N>Come se fosse proprio un'altra lingua.<N>E forse è meglio così.<N>Credo.<N><>
                
            - firstChar_ActualName has Violino:
                Sono passati mesi, spero che lì le cose vadano bene.<N>Qui... vanno.<N>No, non voglio essere negativa.<N>Alla fine abbiamo preso casa in provincia.<N>E non è male.<N>Ci sono tante passeggiate da fare, per esempio.
                
                E c'è un silenzio che mi entra dentro e mi rassicura.<N>Ho iniziato a lavorare a un ristorante, conduzione familiare.<N>Lei una dea, lui un maniaco.<N>Credo che lo menerò abbastanza presto.<N>Settimana scorsa sono scesa a trovare i miei, e quando sono tornata, Ennio mi ha fatto trovare una sorpresa.<N>Il pezzettino di attico che abbiamo, trasformato in uno studiolo per la mia musica.<N>E lì, qualcosa mi è morto dentro.<N>Lo so, sono stronza.
                
                Ma mi sono chiesta per la prima volta se davvero lui mi capisca.<N>Perché per me la musica non è una cosa da fare da sola.<N>Non è una cosa da mettere su Youtube.<N>E ho avuto questa immagine, da signora degli anni Cinquanta che suona il pianoforte per i colleghi del marito.<N>E avrei voluto urlare.<N>Abbiamo litigato.<N>Ma litigato pesante {player_name}.
                
                E non me l'aspettavo.<N>Ora le cose sono più calme.<N>E l'altra sera dopo giorni abbiamo fatto di nuovo l'amore.<N>Ma ho fatto una piccola valigia, con le cose essenziali, e l'ho nascosta nello studiolo.<N>Mi serve qualcosa che mi ricordi che posso sempre andarmene.<N><>
                
        }
        Un saluto.<N><b>{charNameOne}</b>.
}
{
    - first_character_notes.two.bookUpdate:
        <b><i>Seconda lettera di {charNameOne}.</b></i><N>Ciao {player_name}, qui è sempre {charNameOne} che ti scrive.<N><>
       {
            - firstChar_ActualName has Triangolo:
                Talco mi ha risposto, e abbiamo ripreso a videochiamarci.<N>Lə bimbə è adorabile.<N>Le prime volte ci siamo raccontat3 il mondo.<N>Ma ultimamente ci sono molti silenzi.<N>Ləi mi racconta le sue giornate, ma mi rendo conto che le mie sono piccoline.
                
                La cosa più grossa è anche la meno bella: ci sono dei casini sul lavoro.<N>Hanno scoperto il tentativo di fare sindacato, e c'è aria di vendetta.<N>Cerco di non cagarmi addosso, ma non è facilissimo.<N><>
                
            - firstChar_ActualName has RagazzaOrchestra:
                Anche se dovrei chiamarmi "La piagnona".<N>Mentre le cose pratiche per trasferirmi vanno avanti, ho iniziato a dirlo all3 altr3.<N>Con Valeria abbiamo passato una serata a bere e fare progetti.<N>E mi ha promesso che non diventeremo "amiche da ricorrenza".<N>Si sta già organizzando per venire a trovarmi.<N>Ma la sorpresa più grande l'ho avuta da Ennio.
                
                Prima cosa: per la prima volta l'ho visto piangere.<N>Seconda cosa: mi ha detto "l'ho sempre saputo".<N>Mi ha detto che sapeva che tutto questo era troppo poco per me.<N>Che lui era troppo poco per me.<N>Mi si è spezzato il cuore.<N>Gli ho detto che lo amo, che questa scelta è per me, per vivere.<N>Lui mi ha detto che lo sa, e che ci penserà un po' sopra.<N>Per un attimo ha detto "potrei venire anche io".<N>E ho reagito con gioia.
                
                Ma non oso credere possa accadere.<N>Sono una codarda, {player_name}?<N><>
            
            - firstChar_ActualName has FlautoDolce:
                In poche settimane ho fatto una collezione assurda di "prime volte".<N>La mia prima volta in Questura, e solo perché ho osato tirare fuori uno striscione.<N>Il mio primo concerto sold out.<N>E ok, è facile fare sold out in un buco di culo come quello in cui eravamo.<N>Ma le persone hanno cantato i nostri brani, {player_name}!<N>I soldi sono andati in parte a La Rifugia, in parte a un'associazione migranti.
                
                E con Valeria abbiamo deciso che è il caso di tirare su una associazione anche noi, a modo.<N>Sia per non finire nei casini sia perché, boh, sembra che il nostro progetto possa davvero funzionare.<N>E questa gioia mi aiuta ad affrontare la terza "prima volta".<N>Ennio mi ha lasciato.<N>E non mi sono mai sentita così disperata.<N>Lo amo tanto, ma tanto tanto.<N>E lui lo sa.<N>E mi ama anche lui.
                
                Ma mi ha detto che ha bisogno di una relazione in cui non si senta secondo.<N>In cui non debba aspettare ogni giorno per sapere se mi ricorderò di lui.<N>Sinceramente è stata una cosa crudele da dirmi.<N>Ma vera, forse.<N>Perché musica e associazione si stanno mangiando le mie giornate.
                
                Ma {player_name}: mi sento viva come non mi è mai successo.<N><>
                
            - firstChar_ActualName has Ocarina:
                Sono ufficialmente a casa da due settimane, e i sentimenti sono complicati.<N>Prima cosa: papà è ancora arrabbiato.<N>Ma: un po' meno arrabbiato.<N>Perché, sorpresa delle sorprese, si trova bene con Ennio.<N>Ed Ennio il sedentario, la roccia, quello con tutte le sue routine, qui sta diventando un'altra persona.
                
                Si fa passeggiate chilometriche.<N>Va a farsi la bevutina con mio padre e i suoi amici.<N>Ha anche iniziato a recuperare il vecchio orto dei miei, che mia mamma ora con la schiena a pezzi non riesce a starci dietro.<N>E quando sistema le piante mi racconta cose per ore, cose che non avevo mai sentito.<N>C'è anche un gatto che girella qui e che lui ha deciso di adottare, e l'ha chiamato Shinji.<N>E l'altra sera eravamo nella mia cameretta abbracciati, con Shinji che faceva avanti e indietro dalla portafinestra socchiusa.
                
                La pancia piena del cibo che ho cucinato con mia madre.<N>Mi sono sentita completa.<N><>
                
            - firstChar_ActualName has Violino:
                La situazione col coinquilino è estremamente tesa, e mi spiace tantissimo.<N>Ennio la prende sempre con la sua filosofia, ma sono giorni che non si parlano.<N>Ma non riusciamo a trovare una casa che una, soprattutto coi nostri stipendi.<N>L'alternativa è spostarci fuori dalla città.<N>E di molto.<N>E questo significherebbe mettere una croce sulla band, e sul La Rifugia.
                
                Già ora Valeria mi scrive spesso che le manco.<N>Ma quando dico ad Ennio che esco, il suo sguardo è sempre più distaccato, quasi ferito.<N>L'altra sera stavamo guardando un film a letto e mi ha detto: "Non ti basto, vero?"<N>Gli ho detto che lo amo.<N>E lui mi ha risposto che non è la stessa cosa.
                
                Ho lasciato che si addormentasse, e sono andata in bagno a piangere.<N><>
        }
    E lì invece? Come stanno le tue piante?<N>Sono arrivate nuove persone interessanti?<N>Sicuro, nessunə più interessante di me!<N>A presto, <b>{charNameOne}</b>.
}
{
    - first_character_notes.one.bookUpdate:
        <b><i>Prima lettera di {charNameOne}.</b></i><N><>
    
        Ciao {player_name}, come stai?<N>Qui, questi primi giorni qui sono stati strani.<N>A quanto pare la mia assenza è stata solo per qualche ora.<N>E nessunə mi ha fatto domande su nulla.<N>Eppure io vedo i cambiamenti, i cambiamenti in me.
           
           {
                - firstChar_ActualName has Triangolo:
                    Sto prendendo le cose con un'altra piega.<N>A lavoro riesco a trovare il bello nelle piccole cose.<N>E mi sto interessando ai giochi di Ennio.<N>E ho scritto una lettera a Talco, per dirlə che non mi trasferirò, ma mi manca.<N>Spero mi risponda presto.<N>Intanto ti mando un grande abbraccio.<N><>
                    
                - firstChar_ActualName has RagazzaOrchestra:
                    L'altra sera ho mandato un messaggio a Talco.<N>"Ci sto."<N>E mi ha chiamata dopo dieci minuti dieci.<N>Ed è stato come tornare a casa.<N>Ci vorranno almeno due mesi prima di riuscire a combinare tutto, e va bene così.<N>Almeno ho due mesi di tempo per informare Ennio.<N>E Valeria.
                    
                    Non avevo pensato a quanto mi avrebbe fatto paura lasciare questa casa.<N>Ti aggiornerò presto comunque.<N>Così magari vieni a trovarci!<N><>

                - firstChar_ActualName has FlautoDolce:
                    Tipo: ho mollato il lavoro.<N>Prima ne ho parlato con Valeria, e ci siamo organizzate per una cosa sgamosa che, coff coff, chiameremo subaffitto, circa.<N>Insomma: divido camera con un'altra figliola, e per ora non pago l'affitto, ma mi occupo della gestione della casa.<N>Perché?<N>Perché così posso dedicarmi totalmente sia alla Rifugia, sia alla musica.
                    
                    E non hai idea di quanto abbia scritto da quando sono tornata.<N>E non solo: ho un po' meno paura.<N>Paura di dire cosa penso sulle cose politiche.<N>Di fare proposte.<N>Di cercare soluzioni.<N>Valeria è totalmente presa bene da tutto questo.<N>Ennio, non si pronuncia.
                    
                    E un po' mi fa paura.<N>E fa strano forse, ma ti vorrei qui.<N>A fare questo casino con me.<N><>
                    
                - firstChar_ActualName has Ocarina:
                    Partiamo dalle cose strane.<N>Mio padre si è incazzato quando gli ho detto che tornerò giù.<N>E non me l'aspettavo.<N>Mi ha detto che mi condanno a una vita di casini e lavori di merda.<N>E che anche se stanno invecchiando, se la sanno cavare.<N>Gli ho detto che ci penserò un po' su, ma non è vero: so già cosa voglio.<N>E invece mamma mi scrive tutti i giorni ora.
                    
                    Lei, che di solito si fa sentire una volta al mese.<N>Ma forse la cosa più strana è stata Ennio: mi ha detto che potrebbe scendere anche lui.<N>Per un po', per provare.<N>Che comunque il lavoro è in remoto.<N>E non sopporta da mo il suo coinquilino.<N>E che sarebbe più vicino ai suoi, così.<N>E l'idea mi piace.<N>È come se due pezzi della mia vita si unissero.<N><>

                - firstChar_ActualName has Violino:
                    Tipo che vivo già con Ennio da due giorni.<N>Il suo coinquilino non l'ha presa benissimo, ma ci stiamo guardando in giro per cercare un posto solo per noi.<N>A casa vecchia hanno trovato una coinquilina in quindici secondi.<N>Però sono spesso lì per le cose de La Rifugia.<N>Ogni tanto guardo la cartolina di Talco, e mi chiedo cosa scriverlə.<N>Ho l'impressione che non apprezzerebbe molto questa versione di me.
                    
                    Mentre a lavoro le colleghe più anziane hanno già iniziato a chiedermi: a quando un figlio?<N>Credo che prima o poi ne inforchetto una, così la piantano.<N><>
            }
        Alla prossima lettera.<N><b>{charNameOne}</b>
}
{
    - first_story_gift.ink_outcome: <b><i>Appunti su dono e riscrittura.</b></i><N><>
}
{
    - first_character_feedback.bookUpdate: {mentorName} ha detto a {player_name} che <>

        {
            - firstChar_ActualName has Triangolo: ha aiutato {translator(firstChar_ActualName)} a trovare il bello nel quotidiano, cosa che {mentorName} apprezza molto.
                
            - firstChar_ActualName has RagazzaOrchestra: è rimasta colpita dalla partenza di {translator(firstChar_ActualName)} per l'Islanda, perché ha già vicine persone che le vogliono bene. E che i problemi seguono le persone anche quando se ne vanno.
                            
            - firstChar_ActualName has FlautoDolce: mettere al centro della propria vita la propria passione, come ha fatto {translator(firstChar_ActualName)} non è cosa da tutt3.
                            
            - firstChar_ActualName has Ocarina: il suo cuoricino ha tremato dopo che {translator(firstChar_ActualName)} ha deciso di tornare a vivere coi suoi genitori, riscoprendo le sue radici.

            - firstChar_ActualName has Violino: {translator(firstChar_ActualName)} ha scelto l'amore, e spera possa trovare la felicità di cui ha bisogno.
        
        }
}
    {
    - rewriting_proposal_first_character.close.bookUpdate: 
        Dopo la riscrittura, ha scelto un nuovo nome: <b><i>{translator(firstChar_ActualName)}.</b></i><N><>
    }
{firstAffinityFeedback:
    Il valore massimo di inchiostro che {player_name} ha raggiunto con {charNameOne} è stato: <b>{fromInkToNumbers(FirstCharacter)}</b>. <>
}

//Appunto sul dono fatto
{
    - first_story_gift.ink_outcome:
        {
            - firstChar_favouritesGifts has firstChar_giftedObject:
            {player_name} le ha donato <b><i>{ingredientTranslator(firstChar_giftedObject)}</b></i> ed era entusiasta!
            
            - firstChar_goodGifts has firstChar_giftedObject:
            {player_name} le ha donato <b><i>{ingredientTranslator(firstChar_giftedObject)}</b></i> ed ha abbastanza apprezzato.
            
            - else:
            {player_name} le ha donato <b><i>{ingredientTranslator(firstChar_giftedObject)}</b></i> e non ha apprezzato per nulla.
        
        }
}        
{
    - rewriting_proposal_first_character.bookUpdate:
        Dopo il dono, {charNameOne} ha detto a {player_name} di aver capito perché si sia ritrovata con questo nome. Crede che la chitarra sia la cosa media, la cosa che possono fare tutt3. Lei si aspettava grandi cose dalla vita, e invece ora ha una vita comune. E si chiede se questo è il massimo che può aspettarsi dalla vita, e se le cose non andranno sempre peggio.
}        
    {
        - first_char_main_storylets.one.bookUpdate: <b><i>Appunti dalle conversazioni.</b></i><N><>
    }
    {
    
        - frog_first_char_gift != "":
            {player_name} ha chiesto un consiglio a Franco la Rana su cosa donare a {charNameOne}, e la risposta di Franco è stata: <b>{ingredientTranslator(frog_first_char_gift)}</b>.
    }
    
    {
    
        - frog_first_char_ingredient != "":
            {player_name} ha chiesto un consiglio a Franco la Rana su cosa inserire nel piatto da cucinare con {charNameOne}, e la risposta di Franco è stata: <b>{ingredientTranslator(frog_first_char_ingredient)}</b>.
    }
    
    {
    
        - frog_first_novel != "":
            {player_name} ha chiesto un consiglio a Franco la Rana su un racconto di cui parlare con {charNameOne}, e la risposta di Franco è stata: <b>{frog_first_novel}</b>.
    }
    
    {
        - food_gift_first_char.bookUpdate:
            Dopo aver cucinato da sola, {charNameOne} ha parlato del rapporto che ha con sua madre, e di come lei non la capisca fino in fondo. Ma sa che è una donna che parla poco ma ci tiene tanto alle altre persone. Ha raccontato a {player_name} del cibo che ha preparato quando è salita a trovarla, del riordino della casa, del saper dire "Ti voglio bene" solo coi fornelli. E che da quando {charNameOne} questa cosa un po' l'ha portata con sé, cucinando cenoni con le ame.
    }

    {
        - ending_cooking_with_first_char.bookUpdate:
            Cucinando assieme, {charNameOne} e {player_name} hanno preparato un buon piatto di {kitchen_firstCharRecipe}. <>
            {
                - at_table_with_first_char.good_reaction:
                    Dopo aver cucinato assieme, {charNameOne} ha detto a {player_name} che <b>si trova più a suo agio con le cose emotive, che non con i dati freddi e distaccati</b>.

                - at_table_with_first_char.meh_reaction:
                    Dopo aver cucinato assieme, {charNameOne} ha detto a {player_name} che <b>ci sono cose che stanno nel mezzo per lei, tipo quando una persona dice che si risolve tutto facendo cose, o che non prende mai le cose sul serio</b>. Sono cose che non le dicono niente, ma non fanno nemmeno schifo.
            }
    }
    {
        - cooking_with_first_char.first_theme.bookUpdate:
            Durante l'incontro in cucina, {charNameOne} ha parlato delle sue relazione. Ha raccontato di aver avuto un'infanzia senza amici, ma con un forte legame con suo padre, che le ha passato l'amore per la musica. E dai suoi ha imparato che le relazioni sono cura e sacrificio. Con l'arrivo al nord ha fatto molte amicizie in Conservatorio, scoprendo però che nei gruppi si litiga, e questa cosa l'ha riempita di conflitti, soprattutto quando il rapporto con un'amica è stato lasciato morire. Crede anche che non ci sia una differenza vera tra amicizia e amore, e che sia un problema per lo più culturale e linguistico, e le complicazioni che nascono vengono dalle parole che ancora mancano per parlare a modo delle relazioni.
    }
    {
        - cooking_with_first_char.second_theme.bookUpdate:
            Durante l'incontro in cucina, {charNameOne} ha parlato del suo desiderio di salvare il mondo. E delle sue difficoltà: non si sente brava a parlare di cose politiche, e La Rifugia è nata perché ha potuto vedere un problema concreto e decidere di fare qualcosa, mentre altre parole cariche la fanno sentire inadeguata. E crede che parte di questa inadeguatezza venga dalle dinamiche social e dal giudizio costante. Ritiene che questo tolga la possibilità di sbagliare, ma gli sbagli creano possibilità impreviste. Come il gorgonzola. E poi ha citato la sua amica Valeria, che dice che l'attivismo deve dare piacere, e che a {charNameOne} piace addormentarsi sapendo di aver portato qualcosa di buono nel mondo. E poi: <i>più gorgonzola, meno poliziott3.</i>
    }
    {
        - cooking_with_first_char.third_theme.bookUpdate:
            Durante l'incontro in cucina, {charNameOne} ha parlato del suo rapporto con la creatività. Ha detto che ci sono cose che sa pensare solo quando compone, e per questo è terapeutico. Ma che è preoccupata perché il lavoro la stanca così tanto che a volte non riesce a comporre nulla. E ha paura di non esistere più se dovesse smettere di creare. Creare per lei poi è come gettare un ponte: sia tra le persone che ha conosciuto, sia tra persone che non si conoscono. Trovare l'universale nel particolare, così da potersi ritrovare.
    }
    {
        - open_the_kitchen.bookUpdate:
            Aprendo la strada per la cucina, {charNameOne} ha detto che il cibo apre alle confidenze, e che si è ricordata tutte le belle chiacchierate fatte a tavola.

    }
    {
        - a_story_of_revenge.bookUpdate:
            Dopo aver letto <b>Luna vergine</b> di Aza, {charNameOne} ha raccontato di non avere un buon rapporto con la rabbia, ma di aver sentito il desiderio, leggendo il racconto, di morsicare anche lei il tizio, di tirare fuori gli artigli. E per la prima volta ha visto la rabbia non come qualcosa da evitare ma come un segnale, l'allarme che scatta perché è stato superato un confine invalicabile.
    }
    {
    - first_mentor_chit_chat.bookUpdate:
        Dopo che {charNameOne} ha detto a {mentorName} che la invidia perché la sua vita ha uno scopo chiaro, {mentorName} le ha detto che anche lei ha uno scopo, deve solo scoprirlo. A quel punto si sono messe a discutere sul valore della felicità: per {mentorName} è qualcosa da trovare nelle piccole cose, ma per {charNameOne} questa è una frase da persona privilegiata, che fa ciò che ama. Dopo l'intervento di {player_name}, {charNameOne} ha detto a {mentorName} che per lo meno deve imparare a prendersi i commenti di stima e goderseli.
    }
    {
        - frog_and_first_char_chit_chat.bookUpdate:
            Anche {charNameOne} ha perso la pazienza con Franco La Rana.
    }
    {
        - first_second_chit_chat.bookUpdate:
            {charNameOne} e {second_char_main_storylets.one.nameSecond:{charNameTwo}|il bimbo} si sono presentat3, discutendo di alieni e pisolini.
    }
    
    {
        - first_mentor_chit_chat.bookUpdate:
            Durante una conversazione con {mentorName}, {charNameOne} si è infastidita perché {mentorName} ha definito la felicità "non un luogo da raggiungere, ma qualcosa che si ha dentro", ma {charNameOne} crede sia un privilegio di chi fa il lavoro che ama. E teme che questo significhi che la felicità "te la ritrovi se ti fai andare bene quello che hai".
    }
    

    
    {
        - first_char_main_storylets.twelve.bookUpdate:
            {charNameOne} ha parlato di sua mamma, e del fatto che litigano perché la madre pensa che lei non sappia accontentarsi. Ma {charNameOne} in realtà non si sente all'altezza delle sue aspettative. Soffre perché prova invidia verso chi ha raggiunto dei traguardi, e a volte vorrebbe avere la loro vita. Per questo si sente una delusione.
    }
    
    {
        - first_char_main_storylets.eleven.bookUpdate:
            Una delle paure di {charNameOne} all'idea di andare a vivere in Islanda con Talco, è che possa diventare una "amica da ricorrenza" per le persone a cui vuol bene. Quel tipo di persona a cui tieni, ma che finisci per sentire una volta ogni tanto, giusto per le feste e i compleanni. E teme che diventare grandi significhi rimanere soli. E lei non vuole stare da sola.
    }
    
    {
        - first_char_main_storylets.ten.bookUpdate:
            {charNameOne} ha raccontato che l'amore non è come se lo aspettava. E soprattutto ora che le cose con Ennio si sono fatte solide, sembra un pane caldo, una cosa semplice. Lei ed Ennio passano molto tempo assieme, il sesso con lui è rassicurante. Lui ultimamente è più insofferente, sembra abbia bisogno di passare più tempo con lei. Ma {charNameOne} a volte si chiede se non stia rischiando di ritrovarsi su un treno fermo, senza sapere se sia fermo perché arrivato a destinazione, o perché non ripartirà più.
    }

    {
        - first_char_main_storylets.nine.bookUpdate:
            {charNameOne} ama scrivere comporre la notte, quando a casa tutt3 dormono. E sente la creatività come l'immergersi in un fiume, una "acqua antica" l'ha chiamata, che raccoglie tutte le storie del mondo. E quel posto, quell'acqua la rassicura, perché le dice che i problemi di tutti i giorni sono problemi che come persone abbiamo affrontato miliardi di volte, e siamo ancora qui. Questo le offre speranza.
    }

    {
        - first_char_main_storylets.eight.bookUpdate:
            {charNameOne} si trova molto bene con la sua famiglia, in particolare con suo padre, con cui può suonare e ubriacarsi. Tornare a vivere giù è una opzione, ma ha la sensazione di rischiare di viverla come un fallimento. E dice che teme di essere la persona che il contesto le permette di essere. Che le piace la persona che è ora, ma che non sa se le piacerebbe essere la persona che sarebbe se tornasse giù.
    }

    {
        - first_char_main_storylets.seven.bookUpdate:
            Per la prima volta {charNameOne} ha parlato del suo litigio con Talco. Si erano ripromess3 di non aver figli, di non aver ostacoli al loro rapporto. Ma poi Talco è rimastə incintə, e ha deciso di trasferirsi in Islanda con il compagno, Thomas. E ha invitato {charNameOne} con ləi. Ma {charNameOne} è scappata a casa, ha fatto sesso con Ennio e pianto tutta la notte. Ma comunque, mesi dopo, Talco le ha inviato una foto dellə figliə con l'invito di nuovo a vivere con loro.
    } 
    
    {
        - first_char_main_storylets.six.bookUpdate:
            {charNameOne} ha parlato della sua famiglia, quella d'adozione: le ragazze con cui vive. Hanno creato assieme un gruppo, La Rifugia, che praticamente è la sua casa dove ospitano persone che hanno bisogno di un tetto, fanno cose con associazioni migranti, proteste, raccolte fondi. E ha detto che l'arte può fare tanto per cambiare le cose. E che vorrebbe scrivere qualcosa così forte da spazzare tutta questa merda.
    }

    {
        - first_char_main_storylets.five.bookUpdate:
            {charNameOne} si è fatta delle domande su cosa sia casa, e sul suo rapporto con Ennio. Si chiede se Ennio, il fidanzato, possa essere il suo rifugio. Lo vede come un tipo ordinato, coi suoi ritmi un po' pedanti, e solido. Quando si è messa con lui, pensava che una persona così solida le avrebbe permesso di svolazzare dentro i suoi casini. Ora si chiede se lui non la stia ancorando a terra.
    } 

    {
        - first_char_main_storylets.four.bookUpdate:
            {charNameOne} ha raccontato delle dinamiche a lavoro, e di quando con le sue colleghe si è rifiutata si servire al ristorante un tizio di una compagnia petrolifera. E che ora stanno provando a creare un sindacato, anche se la situazione è incasinata perché hanno contratti di merda, ma sente il bisogno di fare qualcosa di grande.
    } 
    
    {
        - first_char_main_storylets.three.bookUpdate:
            {charNameOne} ha parlato di fiducia, e in particolare del rapporto con Talco, che lə ha permesso di uscire da un brutto film mentale per imparare a guardare il mondo in modo diverso, tipo stendendosi in piazza o facendo sentire le persone anziane, importanti e ascoltate.
    }
    
    {
        - first_char_main_storylets.two.bookUpdate:
            {charNameOne} sta iniziando a godersi il silenzio di questo luogo. Ha smesso di credere che sia una allucinazione, e si sta chiedendo se le coinquiline siano preoccupate. O se le colleghe siano nella merda per la sua assenza. E poi ha detto che vorrebbe comporre qualcosa, approfittando della situazione, perché sono settimane che riesce a creare nulla.
    }    
    
    {
        - first_char_main_storylets.one.bookUpdate:
            C'è questa ragazza, si chiama {charNameOne}. Ha iniziato la conversazione chiedendo a {player_name} dove fosse lə suə migliore amə, Talco. Poi ha accennato al suo ragazzo, Ennio, e a un risotto allucinogeno coi funghi. E quando è {tutorial_mentorTalkingChoiceRelationship: è arrivata {mentorName}|arrivato un fiore parlante} si è convinta che fosse un trip, e se ne è andata a cercare dell'acqua.
    }
    

-> rewriter_book_with_flow
