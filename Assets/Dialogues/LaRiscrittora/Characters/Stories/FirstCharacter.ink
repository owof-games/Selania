~ temp charNameOne = uppercaseTranslator(firstCharacterState)
=== first_character ===
    //SPAZIO PER VERIFICARE SE STORIA IN CORSO O CONCLUSA
            //Chiacchiera normale
            + {are_two_entities_together(FirstCharacter, PG) && firstStory == Active}[FirstCharacter]
                -> talk_with_first_character
            
            //Chiacchiera a fine storia
            + {are_two_entities_together(FirstCharacter, PG) && firstStory == Ended} [FirstCharacter]
                -> first_char_story_ended
            + ->
        
            -> DONE



=== talk_with_first_character
~ temp charNameOne = uppercaseTranslator(firstCharacterState)
-> common_storylets ->

            {//Se prima chiacchierata
                - not knowing_first_character.one:
                    -> knowing_first_character.one
            //Se prima chiacchierata fatta e passato abbastanza tempo dalla pausa prevista        
                - firstPauseTalking == 0:
                    -> hub
            //Altre opzioni        
                - else:
                    {charNameOne}: {~ Ho bisogno di tempo da sola.|Torna tra un po'.|Mi serve un po' di silenzio ora.}
                -> main    
            }
= hub
~ temp charNameOne = uppercaseTranslator(firstCharacterState)

    {charNameOne}: {~ Le farfalle qui giocano per ore. Adoro!|No dai. Ma hai visto quanto sono carini gli scoiattoli?!|Con il rumore dell'acqua dello stagno ci posso fare una base niente male.}
            + [Ti va di raccontarmi qualcosa di te?]
                -> knowing_first_character
                
                
            //Se non ho ancora fatto il dono e NON ho parlato col mentore e ho parlato abbastanza con lei
            + {firstStoryQuestCount > minStoryQuesTCountFirstChar && not first_story_gift.ink_outcome && not gifts_and_ink && findedGifts != ()} [Ho trovato questa cosa e vorrei donartela.]
                    {charNameOne}: Non voglio snitcahre, ma non hai ancora chiesto alla mentore a cosa servono.
                    {charNameOne}: Se non parli con lei prima poi minimo ci rimane male.
                        -> main
            
            //Se non ho ancora fatto il dono e ho parlato con il mentore e ho parlato abbastanza con lei
            + {firstStoryQuestCount > minStoryQuesTCountFirstChar && not first_story_gift.ink_outcome && gifts_and_ink && findedGifts != ()} [Ti vorrei donare questa cosa.]
                    -> first_story_gift
        
            //QUESTA OPZIONE C'è SOLO DOPO CHE HO FATTO IL DONO E NON HO ANCORA AVVIATO LA MAIN STORY
            + {first_story_gift.ink_outcome && not main_story_first_character && not questions} [Vorrei aiutarti a guardare le cose in modo diverso.]
                    {uppercaseTranslator(firstCharacterState)}: Ama, parla prima con la mentore così ti dice cosa fare e non le prende una sincope se facciamo casini.
                            -> main
                            
            + {first_story_gift.ink_outcome && not main_story_first_character &&  questions} [Ti va di riscrivere la tua storia con me?]
                    -> first_story_chech_trigger
    
            //SE ESCO DALLA MAIN STORY E VOGLIO TORNARCI CLICCO QUI. POI Lì DENTRO IN BASE AGLI STEP IN CUI SIAMO, MI MANDERà AL POSTO GIUSTO            
            + {first_story_gift.ink_outcome && main_story_first_character} [Riprendiamo quella storia?]
                -> main_story_first_character
            
            + [Lascio il dialogo.]
                -> main
            -
                -> talk_with_first_character
    
=== knowing_first_character
~ temp charNameOne = uppercaseTranslator(firstCharacterState)
    //Qui man mano faccio avanzare i temi toccati dalla personaggia
        {
            - not one:
                -> one
            - not two:
                -> two
            - not three:
                -> three
            - not four:
                -> four
            - not five:
                -> five
            - not six:
                -> six
            - not seven:
                -> seven
            - not eight:
                -> eight
            - not nine:
                -> nine
            - not ten:
                -> ten
            - not eleven:
                -> eleven
            - not twelve:
                -> twelve
            - else:
                -> first_character_opinions
        }

    = one
    ~ temp charNameOne = uppercaseTranslator(firstCharacterState)
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
        //Presentazione.
        ~ firstStoryQuestCount ++
        
        
        ???: Hai visto passare qualcunə?
        ???: Altə all’incirca una balla di fieno e che si muove come un violino.
        ???: O almeno ləi si descriverebbe così.
        ???: Lə adoro ma è sempre un po' edgy.
        ???: E comunque non posso essere arrivata qui da sola, vero? Qualsiasi cosa sia <i>qui</i>.
        ???: Come lə trovo?
        
            + (oneBlue) [Dammi dettagli più concreti.]
                    ~ firstBlue ++
                ???: Concreti?
                ???: Si muove. Respira. Mangia. Saltella. Canta.
                ???: A volte tutte queste cose assieme.
                ???: E ha molta fantasia.
                ???: Sempre che tu sappia cosa sia.
                
            + (oneYellow) [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ firstYellow ++
                ???: A beh, ci sta!
                ???: Ci sta!
                ???: Non ci avevo pensato!
                ???: Ma il suo violino è più da pianoforte.
                ???: Forse potrei cercare nella serra, e trovare qualcosa da suonare.
                
            + (oneRed) [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ firstRed ++
                ???: Ha senso, ma Talco non è persona da azione.
                ???: Dice sempre che si trascina nello spazio come se fosse vento.
                ???: E lascia alle sue spalle l'odore della primavera.
                ???: Che è un modo carino per dire che è sempre piene di fango e terriccio.
                
            + (oneGreen) [Se ti senti sola, sono qui ad ascoltarti.]
                ~ firstGreen ++
                ???: Grazie ama.
                ???: Ma è come chiedermi di fare un concerto con una persona sconosciuta.
                ???: Non è che ci si piglia subito, no?

            + (onePurple) [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ firstPurple ++
                ???: Mmm, ok, credo?
                ???: Le parole mi vanno anche bene, ma chi ti conosce.
                ???: No dai, non devo essere stronza.
                ???: Però merda se mi manca.
            -
        ???: Non faccio mai niente senza Talco.
        ???: Quanto sono needy?
        ???: Ma Talco è l'unica persona con cui posso permettermi di litigare.
        ???: E l'unica che mi sopporta da quando ho finito il conservatorio.
        ???: Ma che normie che sono, non mi sono manco presentata: io sono {charNameOne}.
        ???: No, io sono <b>{charNameOne}</b>.
        {charNameOne}: Ehi! Non è questo il mio nome.
        {charNameOne}: <i>{charNameOne}</i>.
        {charNameOne}: Forse se provo a dirlo al contrario?
        {charNameOne}: Arratihc.
        {charNameOne}: Uh.
        {charNameOne}: Prova tu. Come ti chiami?
    	    + {name_choice} [Mi chiamo {name}.]
    	    + [Il mio nome è...]
    	        -> name_choice ->
    	    -
    	{charNameOne}: E i tuoi pronomi?
    	        -> gender ->
    	{charNameOne}: Top! Io uso i femminili.
    	{charNameOne}: Comunque questa cosa del nome è cringe.
    	{charNameOne}: Non so.
    	{charNameOne}: Non è male la chitarra.
    	{charNameOne}: Ma per una del conservatorio è tipo rinunciare a tutto.
    	{charNameOne}: Alle ambizioni.
    	{charNameOne}: La chitarra è un po' un arrendersi, e dove vado se mi arrendo?
        {charNameOne}: {name}, secondo te il nome di una persona è importante?
    	    
            + [È uno strumento di controllo.]
                {charNameOne}: Questa è una cosa basata.
                {charNameOne}: Il nome è anche uno strumento d'amore.
                {charNameOne}: Pensa a tutti i modi in cui qualcuno lo può gridare.
                {charNameOne}: Sono sicura che te ne verranno in mente un paio molto piacevoli.
                    ~ firstRed ++
            
            + [Solo se possiamo continuamente cambiarlo.]
                {charNameOne}: Adoro!
                {charNameOne}: Passo le giornate a cambiare melodie, e non avevo mai pensato di cambiare il mio nome!
                {charNameOne}: Cosa normie proprio ora che ci penso, viste tutt3 l3 am3 non binari3 con cui esco.
                {charNameOne}: Mi merito di essere una chitarra!
                    ~ firstYellow ++
                    
            + [Solo se sei tu a definirne il significato e non altri.]
                {charNameOne}: Ah, ci sta!
                {charNameOne}: Tu sì che sai guardare al cuore delle cose!
                {charNameOne}: Quindi: ora mi ritrovo con un nome nuovo.
                {charNameOne}: E non so cosa significhi, cosa doverci fare.
                {charNameOne}: Però posso farci quello che voglio, no?
                    ~ firstPurple ++
                    
            + [È un dono della tua famiglia che resterà sempre con te.]
                {charNameOne}: A I U T O!
                {charNameOne}: Non ci avevo mai pensato.
                {charNameOne}: Ma non tutt3 ne sono felici.
                {charNameOne}: E per alcune ame il nome è qualcosa che si sceglie.
                {charNameOne}: Smollare quello vecchio è una liberazione.
                    ~ firstGreen ++
                    
            + [È utile, altrimenti come ci distinguiamo?]
                {charNameOne}: Capiamoci: sei sempre così {pronouns has him: rigido|{pronouns has her: rigida|rigidə}}?
    	        {charNameOne}: La persona più divertente della festa, vero?
    	        {charNameOne}: Anche se immagino che una visione pratica abbia dei vantaggi.
    	        {charNameOne}: Per lo meno faresti felice mio padre.
    	        {charNameOne}: Madonna, che piagnona che sono.
                    ~ firstBlue ++         
            -

       {charNameOne}: Comunque ama: il tuo nome ti si addice benissimo.
       {charNameOne}: Hai proprio una faccia da {name}.
       {charNameOne}: Ma forse la mia faccia è cambiata? Ti sembro una che può chiamarsi {charNameOne}?
       {charNameOne}: Una che ha rinunciato ad essere un pianoforte? Una viola?
       {charNameOne}: Certo {charNameOne} che sei basicona con queste domande.
       
            + [Quindi per cambiare faccia basta cambiarci il nome?]
                {firstYellow > 1: {charNameOne}: Ama, tu e io faremo amicizia presto!}
                {charNameOne}: Cavolo, passerei le giornate a essere chiunque!
                {charNameOne}: E forse ora potrei essere Talco.
                {charNameOne}: Dove sei, Talco?
                    ~ firstYellow ++
            
            + [No, la faccia è una cosa che hai anche se non hai un nome.]
                {firstBlue > 1: {charNameOne}: {name}, sai che ogni tanto puoi scendere da ovviolandia, vero? }
                {charNameOne}: Forse dovrei chiamarti Linea.
                {charNameOne}: Anzi, Quadrato.
                {charNameOne}: Perché neanche a volerlo sai rotolare lontano dalla superficie delle cose.
                    ~ firstBlue ++
               
            + [Rinunciare al superfluo ci avvicina alla natura delle cose.]
                {firstPurple > 1: {charNameOne}: {name}, continua così e ci shippo tantissimo!}
                {charNameOne}: Ho pensato subito che {charNameOne} avesse un valore negativo.
                {charNameOne}: Dimenticandomi che in ogni brano il silenzio è parte fondamentale.
                {charNameOne}: Grazie ama!
                    ~ firstPurple ++
            
            + [Cosa pensi direbbe Talco di questo nome?]
                {firstGreen > 1: {charNameOne}: A te piace parlare di sentimenti e relazioni, vero?}
                {charNameOne}: Questa è una domanda molto tenera.
                {charNameOne}: Ma Talco mi blasterebbe, sicuro.
                {charNameOne}: Mi direbbe che sono una frignona, e di andare a suonare qualcosa.
                {charNameOne}: Talco è una persona che agisce, non resta ad aspettare.
                    ~ firstGreen ++
            
            + [A te va bene essere {charNameOne}? Perché non Lotta? Azione?]
                {firstRed > 1: {charNameOne}: Tu prendi tutto di pancia, vero? Saresti {pronouns has him: lo|{pronouns has her: la|lə}}} bestie di Talco.
                {charNameOne}: Mi merito {charNameOne} perché ultimamente ho proprio smollato tutto.
                {charNameOne}: Però ama, parlare con te non è già una forma di azione?
                    ~ firstRed ++
            -
       {charNameOne}: Come mi dovrei chiamare secondo te?
    	    + [<i>Qualsiasi cosa tu abbia pensato, non riesci a dirla.</i>]
    	    -
        {charNameOne}: Mmm.
        {charNameOne}: La tua bocca si muove ma non esce nulla.
        {charNameOne}: Interessante.
        {charNameOne}: Forse quella tizia che gira quì può aiutarci a capire qualcosa?
        {are_two_entities_together(Mentor, PG): ???: In effetti avrei un paio di informazioni utili da darti, nuova persona!}
        {charNameOne}: L’unica cosa certa è che ho bisogno di Talco.
        {charNameOne}: Ci vediamo dopo, ama.
             ~ firstPauseTalking = firstCharPauseDurantion
            -> main
        
    = two
    ~ temp charNameOne = uppercaseTranslator(firstCharacterState)
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
        //Paura di deludere la famiglia scelta
        ~ firstStoryQuestCount ++
        
        {charNameOne}: Non riesco a trovare Talco.
        {charNameOne}: Forse devo fare pace col cervello è accettare che non è qui.
        {charNameOne}: Ma non ricordo quando è stata l'ultima volta che sono andata in giro senza di ləi.
        {charNameOne}: Prima mi sono pure persa nel cercarlə.
        {charNameOne}: Ok, forse mi sono distratta cercando di raggiungere uno scoiattolo perché aveva la ghianda più bella che avessi mai visto.
        {charNameOne}: Volevo insegnargli a suonarla, e invece mi sono ritrovata tra gli alberi senza sapere dove andare.
        {charNameOne}: E c’erano otto sentieri diversi davanti a me.
        {charNameOne}: Otto!
        {charNameOne}: Otto sentieri per tre persone?
        
            + [O forse il sentiero è unico, ma ci sono otto te.]
                {charNameOne}: Ah, ci sta!
                {charNameOne}: In effetti mi sento divisa, frammentata.
                {charNameOne}: In questo periodo della mia vita ci sono troppe spinte.
                {charNameOne}: E non so dove andare.
                    ~ firstPurple ++
            
            + [Ok l'amicizia con Talco, ma devi essere indipendente.]
                {charNameOne}: Ama, prenditi meno spazi, grazie.
                {charNameOne}: Talco e io siamo due parti della stessa armonia, ma sappiamo essere indipendenti.
                {charNameOne}: È  che in momenti come questo so suonare solo se è con me.
                    ~ firstRed ++
            
            + [Esiste un numero definito di sentieri per persona?]
                {charNameOne}: Non era quello il punto, ama.
                {charNameOne}: Ma credo dipenda dal tempo a disposizione.
                {charNameOne}: Alla fine puoi suonare qualsiasi strumento, se ne hai il tempo.
                {charNameOne}: Ma quanti mesi servono per creare otto sentieri da sola?
                    ~ firstBlue ++
                    
            + [Vorresti suonare qualcosa per Talco?]
                {charNameOne}: Adoro.
                {charNameOne}: Ma magari non ora.
                {charNameOne}: Forse prima devo capire perché ho questo nuovo nome, cosa farmene.
                    ~ firstGreen ++
            
            + [Non so molto di scoiattoli, ma le falene suonano i girasoli!]
                {charNameOne}: Toppissimo!
                {charNameOne}: Scoiattoli e falene sarebbero la migliore band possibile!
                {charNameOne}: Tipo gli Stray Kids della natura.
                {charNameOne}: E credo di aver visto una lumaca prima, potrebbe tenere il tempo!
                ~ firstYellow ++
    
            -    
        {charNameOne}: Che poi a pensarci bene, non è che saranno tutti i passi di quell'altra?
        {charNameOne}: Cammina così tanto, e per cosa poi?
        {charNameOne}: Ma troppe chiacchiere ora, troppe.
        {charNameOne}: Fammi chillare un attimo, a dopo!
             ~ firstPauseTalking = firstCharPauseDurantion
            -> main  
            
    = three
    ~ temp charNameOne = uppercaseTranslator(firstCharacterState)
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    ~ firstStoryQuestCount ++
        
        {charNameOne}: Stavo pensando ad Anna.
        {charNameOne}: Anna è una mia bestie del conservatorio.
        {charNameOne}: Insiste perché mi proponga come assistente del Ghiberti.
        {charNameOne}: Dice che lui ha stima di me e questa è la mia GRANDE occasione.
        {charNameOne}: E non per flexare, ma so che me la caverei bene.
        {charNameOne}: Anna è così sicura di sè da quando ha lasciato l'ex redpillato! Adoro.
        {charNameOne}: A volte Anna e Olga discutono perché Olga pensa che io con la classica sia buttata via.
        {charNameOne}: Dice che devo mettere su una band e invadere tutti i locali della città.
        {charNameOne}: Olga è sicura che Talco le dia ragione, ma Talco vuole che mi butti sui reality show.
        {charNameOne}: Dice che non importa vincere, importa fare casino così poi sui social se ne parla.
        {charNameOne}: Che è una cosa un po' normie, ma ha il suo senso.
        {charNameOne}: E poi Ennio, no Ennio no.
        {charNameOne}: Ennio dice che ho sbagliato strada.
        
            
            + [La risposta è sempre dove c'è casino: ascolta Talco!]
                {charNameOne}: Voi due diventereste bestie in due secondo, cavolo.
                {charNameOne}: E potrei portarvi sul palco e fare qualcosa di assurdo.
                {charNameOne}: Tipo creare uno xilofono di papere!
                {charNameOne}: Sarebbe toppissimo!
                    ~ firstYellow ++
            
            + [Anna ha ragione: bisogna essere pratiche nella vita.]
                {charNameOne}: La praticità non è tutto.
                {charNameOne}: Sennò avrei dovuto iscrivermi a economia.
                {charNameOne}: E inventare nuove supercazzole per fregare il prossimo.
                {charNameOne}: O far finta di predire il futuro scazzando più di Nostradamus.
                    ~ firstBlue ++        
    
            + [Tutte le strade sono sbagliate se non sai dove stai andando.]
                {charNameOne}: Mi ricordi il nonno.
                {charNameOne}: Ignorava i piccoli fastidi per concentrarsi sul grande insieme delle cose.
                {charNameOne}: A me non viene benissimo questa cosa però.
                {charNameOne}: Quanto son cringe.
                    ~ firstPurple ++
            
            + [E cosa vuole {charNameOne}?]
                {charNameOne}: Ora?
                {charNameOne}: Un letto caldo, una copertina.
                {charNameOne}: Chillare.
                {charNameOne}: E non doversi fare questa domanda.
                    ~ firstGreen ++
            
            + [Ascolta Olga e invadi il mondo!]
                {charNameOne}: Tu sei un treno, {name}. Chi ti ferma?
                {charNameOne}: Ma io sono più dell'idea di ricrearlo assieme questo maledetto mondo.
                {charNameOne}: Ascoltarci a vicenda, entrare in armonia.
                {charNameOne}: E ricostruire sulle macerie che ci circondano.
                {charNameOne}: Ora datemi il Nobel per la pace, su!
                    ~ firstRed ++        
                    

            -    
        {charNameOne}: Comunque sembra che tutt3 abbiano le idee chiare su cosa dovrei fare.
        {charNameOne}: E dato che nessunə amə ha la stessa opinione delle altre, finirò per deluderne qualcunə.
        {charNameOne}: Sono la mia famiglia, loro.
        {charNameOne}: E nessuna di queste scelte può accontentare tutt3.
        {charNameOne}: Che rottura di ovaie, {name}!
            ~ firstPauseTalking = firstCharPauseDurantion
            -> main
        
    = four
    ~ temp charNameOne = uppercaseTranslator(firstCharacterState)
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    //Silenzio
        ~ firstStoryQuestCount ++
        
        {charNameOne}: Questo posto è carino, ma il silenzio è pesante.
        {charNameOne}: Non c'è nemmeno un accenno di musica, di ritmo.
        {charNameOne}: Come ci si sta in un posto del genere senza sbroccare?
        
            + [Studiandolo, cercando di capire come funziona.]
                {charNameOne}: Dovrei vivisezionare una di quelle lumacone trovate dietro alla serra?
                {charNameOne}: Testare gli arbusti della foresta?
                {charNameOne}: Flexare a manetta e dire "Ora sono il dio di questo posto?!?"
                {charNameOne}: Thank you, next!
                    ~ firstBlue ++
                    
            + [Più silenzio significa più spazio per fare rumore!]
                {charNameOne}: AAAAAAAAAAAAAAAAAAAAAAAAAAAA!
                {charNameOne}: Forse dovevo avvisarti.
                {charNameOne}: Ma non funziona, ama.
                {charNameOne}: È come quando fai le prove per un concerto in un'enorme sala vuota.
                {charNameOne}: Mi fa sentire esposta, e idiota.
                    ~ firstYellow ++
                    
            + [Se corri veloce il ritmo lo crei da sola.]
                {charNameOne}: O mi parte un polmone.
                {charNameOne}: Non sono esattamente una gymbro, ama.
                {charNameOne}: E poi serve qualcuno che suoni con te.
                {charNameOne}: E qualcuno che canti.
                    ~ firstRed ++
                    
            + [Il silenzio ti offre la vulnerabilità necessaria per raccontarti.]
                {charNameOne}: Non ti sono sembrata già abbastanza needy, ama?
                {charNameOne}: E poi vorrei ricordarti che manco so perché mi chiamo così.
                {charNameOne}: No dai, tu cerchi di essere gentile, scusa.
                {charNameOne}: Ma non conosco bene le parole per "raccontarmi".
                {charNameOne}: L'unica cosa che so fare è suonare.
                    ~ firstGreen ++
                    
            + [Il giardino tutto è musica, si tratta solo di ascoltare.]
                {charNameOne}: Tu sei un mood tutto tuo.
                {charNameOne}: Ma forse hai ragione, {name}.
                {charNameOne}: È che per ascoltare serve restare in silenzio.
                {charNameOne}: E a me viene solo da parlare a ruota e non pensare in questo momento.
                    ~ firstPurple ++
            -
        {charNameOne}: Idea!
        {charNameOne}: Forse la mentore è abbastanza vecchia da avere una radio?
        {charNameOne}: Devo assolutamente chiederglielo.
             ~ firstPauseTalking = firstCharPauseDurantion
            -> main 
            
    = five
    ~ temp charNameOne = uppercaseTranslator(firstCharacterState)
    ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    ~ firstStoryQuestCount ++
    
        {charNameOne}: Sono abituata a essere circondata da gente tutto il giorno.
        {charNameOne}: A vivere nella festa.
        {charNameOne}: Sto in una casa con altre cinque persone, un posto pieno di muffa e corridoi e armadi e c’è sempre una festa da fare.
        {charNameOne}: Talco crea strumenti con qualsiasi cosa trova in giro.
        {are_two_entities_together(SecondCharacter, PG):{charNameTwo}: Mi piacerebbe conoscere Talco!}        
        {charNameOne}: Le sere d'estate saliamo sul tetto a cantare e improvvisare.
        {charNameOne}: E vento e sudore si portano via le preoccupazioni e non c’è nulla a cui pensare.
        {charNameOne}: A quel punto arriva la sensazione, quel sentirti parte di tutto, priva di confini.
        {charNameOne}: Sei la musica, sei l’umidità nell’aria, sei la gola del vicino che si lamenta del casino.
        {charNameOne}: Ma qui, qui è tutto così calmo, posso sentire i pensieri dei miei pensieri e rimango intrappolata dentro a me stessa.
                + [Allora serve fare più rumore.]
                    {charNameOne}: Riprendere a stordirmi di cose?
                    {charNameOne}: Può essere un'idea.
                    {charNameOne}: Ma se sono qui, con questo nome, forse non è la vera soluzione.
                        ~ firstRed ++
                        
                + [Il pensiero è specchio: rompilo per distinguere reale e riflesso.]
                    {charNameOne}: Forse dovrei stendermi e meditare.
                    {charNameOne}: Lasciare che si spengano uno per uno.
                    {charNameOne}: Ignorare la paura che ho all'idea di vedere le cose come stanno.
                        ~ firstPurple ++
                
                + [La disciplina può aiutare a spegnere i pensieri.]
                    {charNameOne}: Anche l'alcool se è per quello.
                    {charNameOne}: Ma non reggo bene nessuna delle due cose.
                        ~ firstBlue ++
                        
                + [Forse non è la festa, ma è il senso di unione che ti manca.]
                    {charNameOne}: Ma con chi, qui?
                    {charNameOne}: Scusa, non per offenderti.
                    {charNameOne}: Sei una persona molto dolce, ma non sei <i>loro</i>.
                        ~ firstGreen ++
                        
                + [La serra ha un tetto! E io so sudare!]
                    {charNameOne}: Questo è un piano, in effetti.
                    {charNameOne}: Forse il vetro non ci reggerebbe a lungo.
                    {charNameOne}: Ma secondo me quelle piante sanno cantare.
                        ~ firstYellow ++        
                
                -
            ~ firstPauseTalking = firstCharPauseDurantion
            -> main
        
    = six
    ~ temp charNameOne = uppercaseTranslator(firstCharacterState)
    ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
        //Paura delle conseguenze della scelta.
        ~ firstStoryQuestCount ++
        
        {charNameOne}: Conoscevo questo ragazzo, Jonah, un arpista e un genio.
        {charNameOne}: Per due anni ha fatto da spalla a un tizio di Beijing, una rockstar della musica classica.
        {charNameOne}: Ma poi Jonah ha iniziato a sentire la mancanza dell’Europa ed è tornato cercando di fare una carriera da solista.
        {charNameOne}: Però man mano che le porte si chiudevano, si chiudeva anche la sua sicurezza e il suo amore per la musica.
        {charNameOne}: Ora non so più dove sia, Jonah.
        {charNameOne}: Qualche compagna di corso giura di averlo visto mendicare, qualche altro che suona sotto pseudonimo alle feste di odiosi ricconi.
        {charNameOne}: Una volta ho creduto di averlo visto lavorare in un supermercato.
        {charNameOne}: Cosa puoi fare quando sai fare bene solo una cosa ma il mondo non ti permette di farla?
        {charNameOne}: Scendi a compromessi, o accetti il rischio di morire di fame?
        {charNameOne}: O aspetti fino a quando non sia il mondo a decidere per te?
            
            + [Canta e balla. Domani è una cosa lontana.]
                {charNameOne}: Mi sembra di sentire Talco, con queste frasi.
                {charNameOne}: Ma per me è da molto ormai che è <i>domani</i>.
                {charNameOne}: Il conservatorio è finito da mesi, e io suono, ballo, ma non so ancora che cosa fare.
                    ~ firstYellow ++
                    
            + [È imperativo sopravvivere, troviamo sempre una soluzione.]
                {charNameOne}: Grazie ma voglio qualcosa di più che sopravvivere.
                {charNameOne}: Banale, ma vorrei permettermi il lusso di vivere.
                ~ firstBlue ++
                    
            + [Restati fedele e non ci sarà compromesso ma cambiamento.]
                {charNameOne}: E a quel punto ogni decisione sarebbe la <i>mia</i> decisione.
                    ~ firstPurple ++
            
            + [Dona la tua musica senza chiedere e qualcosa arriverà.]
                {charNameOne}: Forse in questa foresta, in questo giardino.
                {charNameOne}: Ma da dove vengo, tutto prende e non dà nulla.
                {charNameOne}: A parte le persone a cui voglio bene.
                {charNameOne}: Forse dovrei donare loro quello che so fare?
                    ~ firstGreen ++
           
            + [Mezzo compromesso è già una completa sconfitta.]
                {charNameOne}: Eppure Jonah ha perso del tutto, comunque.
                {charNameOne}: Con o senza compromessi.
                {charNameOne}: Questa è l'unica soluzione?
                    ~ firstRed ++       
            
            -    
            ~ firstPauseTalking = firstCharPauseDurantion
            -> main
        
    = seven
    ~ temp charNameOne = uppercaseTranslator(firstCharacterState)
    ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    //Razionalità
        ~ firstStoryQuestCount ++
        
        {charNameOne}: Stavo ripensando al prof Ghiberti.
        {charNameOne}: Lui vede tutta la musica come una cosa matematica.
        {charNameOne}: Ci sono pianisti che trattano il piano come fosse un abaco, ma senza rinunciare alla poesia.
        {charNameOne}: Per Ghiberti invece il mondo è una lista di elementi primitivi che possono essere combinati solo in un determinato modo per ottenere soluzioni prevedibili.
        {charNameOne}: Una volta a vocina bassa ha detto che il jazz è un errore.
            + [La prevedibilità <b>è</b> poetica. La cosa più rara al mondo.]
                {charNameOne}: Allora non sono una persona poetica.
                {charNameOne}: Perché se so dove qualcosa andrà a parare, quella cosa mi sembra priva di vita.
                {charNameOne}: E la poesia è qualcosa che porta vita.
                    ~ firstBlue ++
                    
            + [Ognuna ha il suo modo di raggiungere la verità.]
                {charNameOne}: Di solito concorderei.
                {charNameOne}: Ma non è troppo facile così?
                {charNameOne}: Non è togliersi la responsabilità verso le altre persone?
                    ~ firstPurple ++
                    
            + [È un errore smettere di giocare, e il jazz è musica che gioca.]
                {charNameOne}: Credo che tu gli abbia appena regalato un crepacuore.
                {charNameOne}: Tutta la musica è gioco, se sai rinunciare all'ego e perderti con band e pubblico.
                ~ firstYellow ++
                
            + [Sembrano le parole di una persona ferita.]
                {charNameOne}: Lo dice anche Talco.
                {charNameOne}: E a quel punto, come curare la sua ferita?
                {charNameOne}: Rispettando la sua ossessione per le regole?
                {charNameOne}: O regalandogli un po' di caos?
                ~ firstGreen ++
                
            + [Ha paura di accogliere la potenza del disordine.]
                {charNameOne}: Già, è una possibilità.
                {charNameOne}: Anche se poi credo che il disordine sia solo una questione di prospettiva.
                {charNameOne}: Alla lunga ci si abiuta anche a quello, e a quel punto diventa difficile comunque cambiare.
                    ~ firstRed ++
            -
            
             ~ firstPauseTalking = firstCharPauseDurantion
            -> main           
    = eight
    ~ temp charNameOne = uppercaseTranslator(firstCharacterState)
    ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    ~ firstStoryQuestCount ++
    
        {charNameOne}: Ghiberti sembra un uomo felice, sorride molto.
        {charNameOne}: Eppure a volte mi sembra il sorriso che avrebbe una macchina per fare bulloni o una pressa.
        {charNameOne}: A me spaventa un sacco quel sorriso, quel modo di fare.
        {charNameOne}: Tutti questi numerini e fattori tolgono l’esperienza, l’errore, il senso di comunità.
        {charNameOne}: Una comunità canta, ma per farlo deve sbagliare, essere imprevedibile.
        {charNameOne}: Che diavolo ci fai con una canzone fatta con la sola precisione?
        {charNameOne}: È come quella roba con l’AI, orecchiabile, prevedibile, dimenticabile.
        {charNameOne}: Odio poche cose, ma questa su tutte: odio tutte le cosine pratiche e calcolabili, sono una rinuncia alla vita.
        {charNameOne}: Come sta in piedi una comunità, così?
        {are_two_entities_together(SecondCharacter, PG):{charNameTwo}: Certo che voi grandi dite tantissime parole strane.}        
            
            + [Una comunità sboccia da sè quando c'è affetto e fiducia.]
                {charNameOne}: Una casa in campagna con le persone amate.
                {charNameOne}: Un giardino.
                {charNameOne}: Una fuga, senza mai chiamarla fuga.
                    ~ firstGreen ++
                
            + [Una comunità non regge a lungo senza senso pratico.]
                {charNameOne}: Ma quando tutto è solo senso pratico?
                {charNameOne}: A quel punto comunque la comunità è destinata a morire.
                    ~ firstBlue ++
                    
            + [Una comunità resiste solo seguendo un obiettivo superiore.]
                {charNameOne}: Come rendere il mondo più giusto.
                {charNameOne}: O trasformare qualcosa di terribile in un gioco.
                    ~ firstPurple ++
        
            + [Ciò che ci tiene unite è il giocare.]
                {charNameOne}: In effetti è liberatorio ridere assieme di qualcosa.
                {charNameOne}: Ma mi chiedo sempre se non stiamo ridendo di qualcuno, senza rendercene conto.
                    ~ firstYellow ++
                    
            + [Ci si accresce nel dissenso e nella discussione.]
                {charNameOne}: Vero.
                {charNameOne}: Anche se a volte è bello anche sedersi assieme al sole, e riposare.
                    ~ firstRed ++
     
            -    
            ~ firstPauseTalking = firstCharPauseDurantion
            -> main
    
    = nine
    ~ temp charNameOne = uppercaseTranslator(firstCharacterState)
    ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
        //Voglia di fare qualcosa di utile, importante
        ~ firstStoryQuestCount ++
        
        {charNameOne}: Sai, mi sto abituando a questo luogo.
        {charNameOne}: Anche se non sembra cambiare mai niente.
        {charNameOne}: Ma non è un blocco brutto.
        {charNameOne}: Sembra più il momento prima del temporale, quando sai che sta per succedere qualcosa, ma non sai cosa.
        {charNameOne}: Annusi l'aria e ti senti viva.
        {charNameOne}: Merda, faccio davvero schifo a parlare.
            
            + [È una ninna nanna. E l'imprevedibile è ciò che sognerai.]
                {charNameOne}: Un pigiama party.
                {charNameOne}: Un momento tra persone care.
                {charNameOne}: Un sogno condiviso, sognando sognare.
                    ~ firstGreen ++
                    
            + [Non tanto a parlare, quanto ad arrivare al punto.]
                {charNameOne}: Mi ricordi perché continuo a raccontarti queste cose?
                {charNameOne}: Ah, sì, perché siamo solo noi.
                {charNameOne}: E la mentore.
                    ~ firstBlue ++
            + [Ogni temporale toglie a qualcuna e dà a qualcun altro.]
                {charNameOne}: Come le piante nella serra.
                {charNameOne}: Per crescere prendono da terra, da ciò che manco vedo.
                {charNameOne}: E ci danno in cambio odori e idee.
                    ~ firstPurple ++
                    
            + [O come il momento prima di una battaglia.]
                {charNameOne}: Non è qualcosa che conosco.
                {charNameOne}: Ma forse a volte dovrei provare.
                {charNameOne}: Dare un volto all'avversario, e lottare.
                {charNameOne}: Sarei ancora me stessa, dopo?
                    ~ firstRed ++
                    
            + [Qui l'aria sa di mare e zucchero filato!]
                {charNameOne}: Vero? Che è assurdo, perché non ho visto il mare da nessuna parte.
                {charNameOne}: Né dello zucchero filato se è per quello.
                    ~ firstYellow ++         
    
            -
        {charNameOne}: Credo resterò ad aspettare questo temporale.
        
             ~ firstPauseTalking = firstCharPauseDurantion
            -> main   
    = ten
    ~ temp charNameOne = uppercaseTranslator(firstCharacterState)
    ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    ~ firstStoryQuestCount ++
    
        {charNameOne}: L'anno scorso abbiamo occupato questo parco per una settimana.
        {charNameOne}: Il comune voleva distruggere gli alberi, e volevamo fare qualcosa di utile, sai.
        {are_two_entities_together(SecondCharacter, PG):{charNameTwo}: La prossima volta voglio aiutarvi!}
        {are_two_entities_together(SecondCharacter, PG):{charNameOne}: Sarai il primo a venire chiamato, promesso!}        
        {charNameOne}: La prima notte il freddo non l'abbiamo sentito da come eravamo prese dalla gioia.
        {charNameOne}: Però man mano l'euforia è andata scemando.
        {charNameOne}: Alcune persone se ne sono andate, altre sono restate ma senza spinta.
        {charNameOne}: L'ultima sera c'è stato un momento di puro silenzio.
        {charNameOne}: Non i nostri strumenti, non le nostre voci.
        {charNameOne}: Non il muoversi della polizia, il megafono degli assessori.
        {charNameOne}: E a quel punto ho sentito il canto degli alberi.
        {charNameOne}: E quando ho iniziato a cantare con loro mi sono sentita viva.
        
            + [Credo che gli alberi qui conoscano la storia della tua lotta.]
                {charNameOne}: Sarebbe bello.
                {charNameOne}: Ma allora chiederei loro la strada verso casa.
                {charNameOne}: Non so più quanto ancora voglia restare quì.
                    ~ firstGreen ++
                
            + [Hai anche danzato con gli alberi?]
                {charNameOne}: No, non ci avevo pensato sul momento.
                {charNameOne}: Sentivo il bisogno di qualcosa di più intimo.
                {charNameOne}: Muovermi a volte mi sembra che rompa le cose.
                    ~ firstYellow ++
                    
            + [Sei tu che hai lottato per gli alberi, o gli alberi hanno lottato per te?]
                {charNameOne}: L'una ha aiutato gli altri e viceversa.
                {charNameOne}: Solo nell'illusione di essere separate, uno fa per l'altra.
                {charNameOne}: Non c'è melodia se le note non si perdono in essa.
                    ~ firstPurple ++
            
            + [Gli alberi "cantano" per mettere in allarme altri alberi.]
                {charNameOne}: Quindi ero immersa in un coro di disperazione?
                {charNameOne}: Forse mi sento viva solo nel dolore?
                    ~ firstBlue ++
                
            + [Come ti sei sentita a combattere per qualcun altro?]
                {charNameOne}: Motivata.
                {charNameOne}: Motivata fino al cuore.
                {charNameOne}: Non so difendere molto bene me e le mie posizioni.
                {charNameOne}: Ma quella settimana, per una volta, ho capito che stavo facendo qualcosa di sensato.
                    ~ firstRed ++
            -    
    
        {charNameOne}: Alla fine comunque ci hanno trascinati via, bastonati e tutto il resto.
        {charNameOne}: Hanno tagliato gli alberi.
        {charNameOne}: E la mia voce non ha portato alcun cambiamento.
            ~ firstPauseTalking = firstCharPauseDurantion
            -> main
    
    = eleven
    ~ temp charNameOne = uppercaseTranslator(firstCharacterState)
    ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
        //Famiglia d'origine
        ~ firstStoryQuestCount ++
        
        {charNameOne}: Vuoi sapere una cosa buffa? La passione per la musica l'ho presa da mio papà.
        {charNameOne}: Lo stesso uomo che ora vorrebbe cercassi un "lavoro vero".
        {charNameOne}: Casa è piena di vecchi strumenti pieni di polvere.
        {charNameOne}: Sono del nonno paterno.
        {charNameOne}: Papà li tiene come se fossero delle reliquie.
        {charNameOne}: Ma ogni tanto mi permetteva di sentire le vecchie registrazioni, di quando nonno suonava e cantava nelle balere.
        {charNameOne}: E allora ci mettevamo a ballare con lui e mamma.
        {charNameOne}: E in questi ricordi c'è sempre un raggio di sole caldo che gli illumina il sorriso.
        
            + [C'è poco di divino in uno strumento condannato a non suonare.]
                {charNameOne}: Per questo ogni tanto li rubavo e suonavo in camera.
                {charNameOne}: Alcuni avevano un suono storto, forse per colpa delle tarme.
                {charNameOne}: Eppure erano quelli con più storie da raccontare.
                    ~ firstPurple ++
                    
            + [E ora accresci l'albero della tua famiglia.]
                {charNameOne}: In un certo senso.
                {charNameOne}: Per nonno la musica era occasione di unione.
                {charNameOne}: La festa un momento per appianare le divergenze.
                {charNameOne}: E questa è una cosa che posso capire.
                    ~ firstGreen ++
            + [Credi che tuo padre si sia arreso?]
                {charNameOne}: Merda, ci vai giù piano {name}!
                {charNameOne}: No, non credo comunque.
                {charNameOne}: Lui è davvero felice di ciò che fa.
                {charNameOne}: Il problema è che non contempla per le altre persone modi diversi di essere altrettanto felici.
                    ~ firstRed ++
                    
            + [Ti va di ballare con me?]
                {charNameOne}: Sì, ma non ora.
                {charNameOne}: Appena avrò risolto questa cosa del nome, con piacere.
                    ~ firstYellow ++
                    
            + [Esistono lavori veri e lavori non veri?]
                {charNameOne}: Bella domanda.
                {charNameOne}: Ma tendenzialmente per mio padre la risposta è <i>sì</i>.
                {charNameOne}: E non sono veri i lavori che riguardano le mie passioni.
                    ~ firstBlue ++
            -
            
        {charNameOne}: Forse con l'approccio giusto, posso convincere papà ad ascoltare di nuovo le vecchie registazioni di nonno.
        
            ~ firstPauseTalking = firstCharPauseDurantion
            -> main
            
    = twelve
    ~ temp charNameOne = uppercaseTranslator(firstCharacterState)
    ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    ~ firstStoryQuestCount ++
    
        {charNameOne}: A pensarci, per certi versi, mamma è più cinica di papà.
        {charNameOne}: È grazie a lei se papà ha ceduto e mi sono iscritta al conservatorio.
        {charNameOne}: Ma per lei l'obiettivo è che mi trasformi in Lang Lang, Mitsuko Uchida, Alfred Brendel.
        {charNameOne}: Prestigio, onoreficienze e denaro.
        {charNameOne}: Chi glielo dice che a ventitrè anni per queste cose sono già vecchia?
        {are_two_entities_together(SecondCharacter, PG):{charNameTwo}: Moooooolto vecchia!}        
        {charNameOne}: Con queste premesse la mia strada è totalmente sbagliata.
        
            + [Secondo te tua mamma vuole il tuo o il suo di bene?]
                {charNameOne}: Forse quello del nome della famiglia.
                {charNameOne}: Come se poi fosse prestigioso.
                {charNameOne}: Mamma ha poche radici, e allora continua a guardare al futuro.
                    ~ firstGreen ++
                    
            + [Tutt3 e tre hanno fatto concerti prima della maggiore età.]
                {charNameOne}: Esattamente.
                {charNameOne}: Per cui direi che sono fallita e posso appendere il piano al muro.
                {charNameOne}: E non dire che non è una cosa fattibile o urlo.
                    ~ firstBlue ++
                
            + [La strada sbagliata è sempre quella con più insegnamenti.]
                {charNameOne}: Vero, credo.
                {charNameOne}: Ma presto o tardi dovrò pure capire come mangiare, e a quel punto cosa me ne faccio di quegli insegnamenti?
                        ~ firstRed ++
                        
            + [Ma loro si divertono, quando suonano?]
                {charNameOne}: Credo di sì. Uchida è una gioia per gli occhi.
                {charNameOne}: Anche se forse non lo chiamerei divertimento.
                {charNameOne}: Va in un altro luogo, un posto speciale che non ho ancora trovato.
                    ~ firstYellow ++
                    
            + [Cambiamo sempre, ma non possiamo diventare qualcun altro.]
                {charNameOne}: Dillo a lei.
                {charNameOne}: Forse è la cosa più difficile di questo periodo.
                {charNameOne}: Non se ne rende conto, ma è come se mi dicesse sempre che sono sbagliata.
                    ~ firstPurple ++
            -    
            ~ firstPauseTalking = firstCharPauseDurantion
            -> main

  
        



 === first_story_gift ===
~ temp charNameOne = uppercaseTranslator(firstCharacterState)
<i> Stai per donare qualcosa a {charNameOne}.</i>
        + {findedGifts != ()} [Scelgo il dono.]
            ~ currentReceiver += FirstCharacter
            -> inventory_management -> ink_outcome 
        + {findedGifts == ()} <i> Il tuo inventario è vuoto.</i>
            ->main
        
    
        = ink_outcome    
            <i>Dopo il tuo dono {inkTranslator(firstCharacterInkLevel)}.
                 -> talk_with_first_character
            //queste opzioni poi non saranno scelte dirette, ma risultati delle scelte fatte durante il gioco

    === first_story_chech_trigger
      ~ temp charNameOne = uppercaseTranslator(firstCharacterState)
      //In questa storia non ci sono trigger, lascio la struttura perché non si sa mai.
      
        //{
        //- loneliness == false:
        //    -> loneliness_trigger
        //- else:
        //    -> main_story_first_character
        //}
            -> main_story_first_character
        
        = loneliness_trigger
        Info
            * [Voglio comunque approfondire la storia di questa personaggia.]
                -> main_story_first_character
            * [Salto.]
            //FUTURA SOLUZIONE A QUESTA SITUAZIONE
                -> main
        -
        -> END

=== main_story_first_character
~ temp charNameOne = uppercaseTranslator(firstCharacterState)
//Così se decido di uscire dalla conversazione, posso riprendere da dove eravamo rimaste.
    {
        - not confession:
            -> confession
        - not one:
            -> statement
        - else:
            -> one
    }
    = confession
    //Per il feedback, temi legati al rapporto, all'amicizia
    ~ temp charNameOne = uppercaseTranslator(firstCharacterState)
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
        {charNameOne}: Ho realizzato una cosa, una cosa su noi due.
        {
            -   are_two_entities_together(Mentor, PG):{charNameFive}: Sicuro è il caso che vi lasci il vostro spazio.
                    ~ change_entity_place(Mentor)
        }
        {
            -   are_two_entities_together(SecondCharacter, PG):{charNameOne}: {charNameTwo}, ci lasceresti da sole per poco?
                    ~ change_entity_place(SecondCharacter)
        }        
        
            -> firstAffinityCalc ->
        {
        - firstPurple && firstYellow > firstBlue: {charNameOne}: Sento ancora la mancanza di Talco, ma con te mi sento come se fossimo parte da sempre della stessa band.
        <i>{charNameOne} vede {name} come una persona amica e fidata.</i>
        
        -firstPurple or firstYellow > firstBlue:{charNameOne}: Ci sono momenti in cui cantiamo all'unisono, ed è bello. Mi sento ascoltata.
        
        <i>{charNameOne} si trova bene con {name}.</i>
        
        - firstPurple && firstYellow < firstBlue: {charNameOne}: Facciamo parte di due cori diversi, vero? Non credo tu abbia preso una sola delle mie note.
        
        <i>{charNameOne} non si è sentita capita da {name}.</i>
        
        
        - else: {charNameOne}: A volte siamo sullo stesso brano, altre no. E non ho ancora capito chi tra noi stia ignorando l'altra parte.
        
        <i>{charNameOne} non riesce a capire che rapporto sta costruendo con {name}.</i>
        
        }
        {charNameOne}: E credo di aver capito perché il mio nome qui è {charNameOne}.
        {charNameOne}: Penso al Ghiberti.
        {charNameOne}: Penso ai miei amici.
        {charNameOne}: Penso alla mia famiglia.
        {charNameOne}: E vivo tutto come una pressione.
        {charNameOne}: Una spinta da parte loro a fare qualcosa, cambiare qualcosa.
        {charNameOne}: Ma sinceramente, {name}?
        {charNameOne}: Ho il terrore di dover fare una scelta.
        {charNameOne}: Perché una scelta chiude strade.
        {charNameOne}: Perché una scelta delude persone.
        {charNameOne}: Perché una scelta può portarti su strade sbagliate.
        {charNameOne}: E a quel punto, non si può più tornare.
        {charNameOne}: E così l'unica cosa che rimane è rinunciare.
        {charNameOne}: Lasciare che le altre persone scelgano per te.
        {charNameOne}: O che lo faccia il mondo.
            
            + [Credo di sapere come aiutarti.]
                -> statement
            + [Capisco il tuo dolore, ma ho bisogno di riflettere un attimo.]
                -> main


    = statement
    ~ temp charNameOne = uppercaseTranslator(firstCharacterState)
        <i>A seguito del rapporto che {name} ha creato con {charNameOne} {firstPurple && firstYellow > firstBlue: l'inchiostro è aumentato di due unità.|{firstPurple or firstYellow > firstBlue: l'inchiostro è aumentato di una unità|l'inchiostro non ha subito variazioni}}.</i>
        //Sopra ho già aggiornato il livello di inchiostro e quindi di affinità.
            ~ inkLevel(firstCharacterInkLevel)
        + [Voglio cominciare la riscrittura.]
            -> firstNaming ->
            -> one
        + [Preferisco prendermi del tempo.]
            -> main

    = one
    ~ temp charNameOne = uppercaseTranslator(firstCharacterState)
    ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    {
        -   are_two_entities_together(Mentor, PG):{charNameFive}: Vi lascio, a dopo.
                ~ change_entity_place(Mentor)
    }
    {
        -   are_two_entities_together(SecondCharacter, PG):{charNameOne}: {charNameTwo}, avremmo bisogno di privacy, puoi andare a fare due passi?
                ~ change_entity_place(SecondCharacter)
    }      
    {name}: Prima hai detto che hai il terrore di fare una scelta.
        
        + [Qui hai accettato il tuo nuovo nome.]
            {name}: Accettare è una scelta.
            {name}: Cercare risposte è un'altra scelta ancora.
            {name}: E ammettere una propria paura, una scelta enorme.
                {
	                - firstCharacterPossibleStates hasnt Violino:
		                ~ firstCharacterPossibleStates ++
	                    {debugChangeName: Aumento lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }            
        
        + [Eppure hai deciso di costruire una famiglia con l3 tu3 amic3.]
            {name}: Hai aperto il tuo cuore, e loro ti amano.
            {name}: Si preoccupano per te, cercano di aiutarti a trovare la tua strada.
            {name}: E questo amore è frutto di infinite piccole scelte fatte ogni giorno.
        
        + [Dimenticando che per finire gli studi hai lottato per anni.]
            {name}: Che ogni esame che hai dato è stata una scelta.
            {name}: Che ogni lezione che hai seguito è stata una scelta.
            {name}: E presto o tardi, hai trovato la volontà di continuare.
            
        + [Ma hai più volte accettato il rischio di suonare sul tetto.]
            {name}: Hai accettato di essere festa in un mondo severo.
            {name}: Hai cercato il gioco quando tutto ti dice che devi lavorare.
            {name}: Hai accolto falene, scoiattoli e altri animali suonanti.
                {
	                - firstCharacterPossibleStates hasnt Violino:
		                ~ firstCharacterPossibleStates ++
	                    {debugChangeName: Aumento lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }
        + [Però da che sei qui hai esplorato tutto questo luogo.]
            {name}: Hai inseguito uno scoiattolo.
            {name}: Hai cercato Talco.
            {name}: Non ti sei fatta spaventare dalla novità.
                {
                	- firstCharacterPossibleStates hasnt Chitarra:
    		            ~ firstCharacterPossibleStates --
    		           {debugChangeName: Diminuisco lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }
            
        -
 
        {
        - firstCharacterInkLevel == Empty:
            -> ending
        - else: 
            -> two
        }        
        
    = two
    ~ temp charNameOne = uppercaseTranslator(firstCharacterState)
    {name}: Temi che le persone a cui vuoi bene si sentano tradite dalla scelta che farai.

        + [Con Talco puoi litigare, eppure siete legatissim3.]
            {name}: Pensi davvero che ti accuserebbe di tradimento solo perché hai deciso di decidere per te stessa?
            {name}: Il Talco che hai raccontato si arrabbierebbe di più se tu facessi una scelta per te pensando a ləi.
            
                    
        + [La paura di tradire è un'altra faccia dell'ego.]
            {name}: È la voglia di sembrare impeccabili.
            {name}: Infallibili.
            {name}: Inattaccabili.
            {name}: Ma amore e crescita prosperano nell'errore e nella vulnerabilità.
                {
	                - firstCharacterPossibleStates hasnt Violino:
		                ~ firstCharacterPossibleStates ++
	                    {debugChangeName: Aumento lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }
    
            
        + [Il tuo cuore si preoccupa molto di loro, e poco di te.]
            {name}: Non ti sei chiesta molto dove eri, ti sei messa solo a cercare Talco.
            {name}: Ti sei preoccupata per Jonah.
            {name}: Ma per te?
            
        + [Forse accadrà, ma non è un tuo problema.]
            {name}: Stai costruendo la tua vita, non la loro.
            {name}: Se la pensano diversamente, non è amicizia, e ti sei salvata da qualcosa di peggiore.
                {
                	- firstCharacterPossibleStates hasnt Chitarra:
    		            ~ firstCharacterPossibleStates --
    		           {debugChangeName: Diminuisco lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }
                
        + [Tradiamo la fiducia rompendo le regole a nostro vantaggio.]
            {name}: Hai deciso di giocare con loro e lasciar loro tutto il potere?
            {name}: O è una regola implicita, che non avete mai concordato ma che senti nell'aria?
            {name}: E a prescindere: abbiamo sempre il diritto di revocare un accordo, una regola.
                {
	                - firstCharacterPossibleStates hasnt Violino:
		                ~ firstCharacterPossibleStates ++
	                    {debugChangeName: Aumento lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }
                    
        -
        {
        - firstCharacterInkLevel == Low:
            -> ending
        - else: 
            -> three
        }
        
    = three
    ~ temp charNameOne = uppercaseTranslator(firstCharacterState)
    {name}: Vedi una scelta come una strada chiusa, qualcosa da cui non poter tornare indietro.

            
        + [Se non tiri nessun dado, non c'è storia da far avanzare.]
            {name}: Quando giochi non sempre le cose vanno come vuoi, ma comunque <i>vanno</i>.
            {name}: E fintanto che le cose hanno di dove andare, c'è tempo per cambiare.
            {name}: E a volte anche ritirare i dadi.
                {
	                - firstCharacterPossibleStates hasnt Violino:
		                ~ firstCharacterPossibleStates ++
	                    {debugChangeName: Aumento lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }
        
        + [Ma ogni persona ha immaginato sorti diverse per Jonah, ma nessuna fine.]
            {name}: Ogni passo avanti prevede la possibilità di tornare indietro.
            {name}: A volte è più difficile, a volte meno, ma è sempre possibile.
                {
                	- firstCharacterPossibleStates hasnt Chitarra:
    		            ~ firstCharacterPossibleStates --
    		           {debugChangeName: Diminuisco lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }
                
        + [Eppure la prima cosa che hai visto qui sono otto sentieri.]
            {name}: Otto luoghi dove andare.
            {name}: E ogni sentiero ha una direzione in cui andare, e una da cui tornare.
            {name}: A volte l'erba può essere cresciuta.
            {name}: A volte l'acqua può averne cancellato un pezzo.
            {name}: Ma il sentiero è sempre lì, ad aspettare.
                {
	                - firstCharacterPossibleStates hasnt Violino:
		                ~ firstCharacterPossibleStates ++
	                    {debugChangeName: Aumento lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }
            
        
        + [La storia di Jonah è un successo.]
            {name}: Ha deciso che non gli stava più bene quello che aveva, e si è mosso per cambiarlo.
            {name}: E il leggere negativamente le cose che forse gli sono capitate raccontano nulla di Jonah e molto di chi le racconta.
            {name}: C'è orgoglio anche dietro una cassa del supermercato, non solo su palco.
                
        + [Ragioni come se fossi sola se dovessi cadere.]
            {name}: Pensi che Talco ti abbandonerebbe?
            {name}: Anna? Olga? Persino Ennio.
            {name}: I tuoi genitori.
            {name}: Anche se a volte i vostri cuori sono distanti, quando c'è un bisogno sappiamo sempre ritrovarci.            
        -
        {
        - firstCharacterInkLevel == Normal:
            -> ending
        - else: 
            -> four
        }
    
    = four
    ~ temp charNameOne = uppercaseTranslator(firstCharacterState)
        {name} Questo posto ti ha assegnato un nome, e quel nome è Chitarra, e tu lo vedi come una rinuncia.

        + [Giocare è bello perché puoi sempre rinunciare a farlo.]
            {name}: Quando una roba la devi fare anche quando non vuoi, quello è il lavoro.
            {name}: Per questo fa schifo.
                {
	                - firstCharacterPossibleStates hasnt Violino:
		                ~ firstCharacterPossibleStates ++
	                    {debugChangeName: Aumento lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }            
         
        
        + [Quando Anna ha rinunciato all'ex, ha scoperto la sicurezza.]
            {name}: Rinunciare vuol dire anche prendersi cura di sé.
            {name}: Un atto d'amore quando qualcosa non ci fa più bene.
        
        + [Un infinito più piccolo resta comunque infinito.]
            {name}: Rinuncia a una cosa e sarai comunque tutto.
            {name}: Un nome è solo un nome.
            {name}: Una persona è un universo intero.
                {
	                - firstCharacterPossibleStates hasnt Violino:
		                ~ firstCharacterPossibleStates ++
	                    {debugChangeName: Aumento lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }    
            
        + [Rinunciando a cercare Talco ti sei tutelata.]
            {name}: Se una cosa non ha senso, non ha senso anche se continuiamo ad insistere nel farla.
                {
                	- firstCharacterPossibleStates hasnt Chitarra:
    		            ~ firstCharacterPossibleStates --
    		           {debugChangeName: Diminuisco lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }            
        
        + [C'è più coraggio nella rinuncia che nel compromesso.]
            {name}: Spesso è più costosa, ma la coerenza personale non ha prezzo.
            
        -
        
        -> ending

    = ending
    ~ temp charNameOne = uppercaseTranslator(firstCharacterState)
     Per questo ti dico:
        + {firstRed > 0} [Prendi una strada e se non ti piace cambiala!]
        
        + {firstPurple > 0} [Dai alla tua vita uno scopo più grande.]
                {
	                - firstCharacterPossibleStates hasnt Violino:
		                ~ firstCharacterPossibleStates ++
	                    {debugChangeName: Aumento lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }           
        
        + {firstYellow > 0} [Ogni gioco richiede una pausa, e tu hai bisogno di ascoltarti.]
                                {
	                - firstCharacterPossibleStates hasnt Violino:
		                ~ firstCharacterPossibleStates ++
	                    {debugChangeName: Aumento lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }   
        + {firstGreen > 0} [Non deluderai i tuoi amici: loro saranno sempre con te.]
                
        + {firstBlue > 0} [Questa non è la tua strada. Succede. Ora puoi cambiare.]
                {
                	- firstCharacterPossibleStates hasnt Chitarra:
    		            ~ firstCharacterPossibleStates --
    		           {debugChangeName: Diminuisco lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }           
                
        
                
        -     
        
    {charNameOne}: Grazie, {name}.
    {charNameOne}: Mentre parlavi mi è nata una nuova canzone in testa.
    {charNameOne}: Qualcosa di fresco, di pronto a cambiare.
    {charNameOne}: La canzone del mio vero nome.
        
        {
            - firstCharacterPossibleStates has Chitarra:
                {charNameOne}: Che <b>resterà Chitarra</b>, perché l'unica cosa che posso fare, è far sì che altr3 scelgano per me.
            
            - firstCharacterPossibleStates has Triangolo:
                {charNameOne}: E il mio vero nome è <b>Triangolo</b>, perché pensavo di essere uno strumento, e invece ho solo fallito.
                    ~ firstCharacterState = ()
                    ~ firstCharacterState += Triangolo
            
            - firstCharacterPossibleStates has RagazzaOrchestra:
                {charNameOne}: Mi chiamerò <b>Ragazza Orchestra</b>: nel non saper rinunciare sono diventata l'ornitorinco della musica.
                    ~ firstCharacterState = ()
                    ~ firstCharacterState += RagazzaOrchestra
            
            - firstCharacterPossibleStates has FlautoDolce:
                {charNameOne}: Il mio nome è <b>Flauto Dolce</b>: perché semplice, elementare, ma apprezzata da chi ha buon cuore.
                    ~ firstCharacterState = ()
                    ~ firstCharacterState += FlautoDolce                
            
            - firstCharacterPossibleStates has Ocarina:
                {charNameOne}: Mi chiamerò <b>Ocarina</b>: perché il suo suono è gioco e festa.
                    ~ firstCharacterState = ()
                    ~ firstCharacterState += Ocarina
            
            - firstCharacterPossibleStates has Violino:
                {charNameOne}: Io sono <b>Violino</b>: perché anche se suono bene da sola, do il meglio di me stessa suonando con e per gli altri.
                    ~ firstCharacterState = ()
                    ~ firstCharacterState += Violino
        }
        
            
        
        {
        - firstCharacterSpecialEvent == true:
            -> secret_ending
        - else:
            -> exit
        }
    
    
    = secret_ending
    ~ temp charNameOne = uppercaseTranslator(firstCharacterState)
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    
        {charNameOne}: C'è una cosa che vorrei dirti, {name}.
        {charNameOne}: Riguarda {charNameFive}.
        {charNameOne}: Qual è il confine tra essere una brava persona ed essere una manipolatrice?
        {charNameOne}: Me lo sto chiedendo da quando sono arrivata.
        {charNameOne}: E se hai intenzione di restare qui a lungo, forse devi chiedertelo anche tu.
            ~ firstStory = Ended
            ~ movementsCounter = 0
            ~ PG_advace_management(firstStory)
                -> main
            
    = exit
    ~ temp charNameOne = uppercaseTranslator(firstCharacterState)
        {charNameOne}: Credo rimarrò ancora in giro per un poco, in attesa del prossimo treno.
            ~ firstStory = Ended
            ~ movementsCounter = 0
            ~ PG_advace_management(firstStory)
        -> main  
    
=== first_char_story_ended
~ temp charNameOne = uppercaseTranslator(firstCharacterState)
//Con questa formula dopo un tot di scambi la personaggia se ne va salutandoci.
//In alcune situazioni questa cosa non c'è, in altre c'è solo se ho determinati status (es: socievole). In altri non c'è la possibilità che la personaggia se ne vada senza averci salutate (e quindi non c'è l'opzione in story_start)

    {
        - firstCharEndingDialogue < 4:
            -> top
        - else:
            -> goodbye
    }
    
        - (top)
        {charNameOne}: {~ Mi chiedo se le cose sarebbero andate diversamente, se Talco fosse arrivatə qui con me.|Sono sicura di aver visto un'altra persona alla stazione, ma quando ho cercato di raggiungerla è scomparsa.|Ogni tanto te la prendi una pausa da questo posto, vero?|Sapevi che a volte c'è una rana nello stagno che circonda la serra?}
                ~ firstCharEndingDialogue ++
        -> main
        
        = goodbye
        ~ temp charNameOne = uppercaseTranslator(firstCharacterState)
        {charNameOne}: {name}, per me è arrivato il momento di tornare a casa.
        {firstCharacterPossibleStates hasnt Chitarra: {charNameOne}: Non so di preciso cosa mi accadrà ora, ma in un certo senso so che sono più pronta.}
        {firstCharacterPossibleStates hasnt Chitarra: {charNameOne}: Grazie per quello che hai fatto, davvero.}
        {firstCharacterPossibleStates has Chitarra: {charNameOne}: Vedremo cosa mi accadrà.}
            
            ~ move_entity(FirstCharacter, Safekeeping)
            //Abbiamo accesso alle note solo se è cambiata. Sennò lei se ne va abbastanza arresa da tutto.
            {
                - firstCharacterPossibleStates hasnt Chitarra:
                    ~ move_entity(FirstCharacterNotes, BusStop)
            }    
            
        -> main




=== first_character_opinions
~ temp charNameOne = uppercaseTranslator(firstCharacterState) 
    //Le sue opinioni comunque ci fanno capire meglio il modo in cui vede il mondo e parte della sua vita fuori da qui.
    {charNameOne}: {~ Bisogna sporcarsi le mani. Nelle cose. Non c’è contatto con le vita se le mani sono sempre pulite.|Le dita devono sapere di terra, come quando da bambina non avevi paura di cadere. Che cosa c’è di vivo se sono sempre pulite?|Secondo te potrei insegnare alle api a creare un quartetto? Con quelle codine sarebbero perfette con la viola. O forse qualcosa da suonare con le ali, che vibri. Potrebbero muoversi nella cassa di una chitarra e fare i loro suonini.|Durante le lezioni il prof Ghiberti aveva l’abitudine di tirarsi il colletto del maglioncino. Li aveva tutti rovinati, se li tirava così tanto che a volte ti chiedevi se gli mancava l’aria.|Al Conservatorio ci sono troppe cose che non c’entrano con la musica. C’è competitività, c’è senso di fretta, di perfezione. Però mi manca, sai? Tutto quello che sta tra una lezione e l’altra, tutto quel parlare di musica mi faceva sentire viva.|Quando ho solo la mia chitarrina, è come se uscisse un’altra me. Non conta più l’insieme ma il momento, la singola nota è come un tratto di pennello, e improvvisare diventa come dipingere. Non so improvvisare col pianoforte, ci sono troppe aspettative.|Litigo spesso con mio padre. È un brav’uomo, molto pratico. Si preoccupa per me perché nel suo mondo tutto fatto di numeri e linee uscire dalla via principale significa morire. E forse ha ragione ma per me è morire anche restare in quelle cose. Schiacciata tra quelle regole.}
        ~ firstPauseTalking = firstCharPauseDurantion
            -> main











