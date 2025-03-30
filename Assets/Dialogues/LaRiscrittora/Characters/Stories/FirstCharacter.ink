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
                
            + (oneYellow) [Suona il tamburo e vedrai che il violino torna!]
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

            + (onePurple) [Tu sei sempre con ləi e ləi con te.]
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
                    
            + [Solo se sei tu a definirne il significato.]
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
                {firstRed > 1: {charNameOne}: Tu prendi tutto di pancia, vero? Saresti {pronouns has him: lo|{pronouns has her: la|lə}} bestie di Talco.}
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
        {are_two_entities_together(Mentor, PG): {welcome.your_name: {charNameFive}|???}: In effetti avrei un paio di informazioni utili da darti, nuova persona!}
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
        {charNameOne}: Forse devo fare pace col cervello e accettare che non è qui.
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
        {are_two_entities_together(Mentor, PG):{charNameFive}: Non hai idea di quanto lavoro ci sia da fare. Quindi sì, cammino MOLTO.}
        {charNameOne}: Ma troppe chiacchiere ora, troppe.
        {charNameOne}: Fammi chillare un attimo.
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
    
            + [Tutte le strade sono sbagliate se non sai dove andare.]
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
                    
            + [Il silenzio offre la vulnerabilità necessaria per raccontarsi.]
                {charNameOne}: Non ti sono sembrata già abbastanza needy, ama?
                {charNameOne}: E poi vorrei ricordarti che manco so perché mi chiamo così.
                {charNameOne}: No dai, tu cerchi di essere gentile, scusa.
                {charNameOne}: Ma non conosco bene le parole per "raccontarmi".
                {charNameOne}: L'unica cosa che so fare è suonare.
                    ~ firstGreen ++
                    
            + [Il giardino <b>è</b> musica, si tratta solo di ascoltare.]
                {charNameOne}: Tu sei un mood tutto tuo.
                {charNameOne}: Ma forse hai ragione, {name}.
                {charNameOne}: È che per ascoltare serve restare in silenzio.
                {charNameOne}: E a me viene solo da parlare a ruota e non pensare in questo momento.
                    ~ firstPurple ++
            -
        {charNameOne}: Idea!
        {charNameOne}: Forse la mentore è abbastanza vecchia da avere una radio?
        {are_two_entities_together(Mentor, PG):{charNameFive}: Non approfittare della mia gentilezza, ragazzina.}
        {are_two_entities_together(Mentor, PG): {charNameOne}: Dai, si fa per il meme!|{charNameOne}: Devo assolutamente chiederglielo.}
             ~ firstPauseTalking = firstCharPauseDurantion
            -> main 
            
    = five
    ~ temp charNameOne = uppercaseTranslator(firstCharacterState)
    ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    ~ firstStoryQuestCount ++
    
        {charNameOne}: Hai presente quel meme del tizio che sta a una festa in un angolo.
        {charNameOne}: E giudica tutti?
        {charNameOne}: Ecco: io sono quella che balla e ignora il basicone.
        {charNameOne}: Passo le giornate circondata dall3 am3, mi vivo la festa.
        {charNameOne}: In casa siamo in cinque, sei se conti la muffa.
        {charNameOne}: E poi tutt3 l3 ospiti.
        {charNameOne}: Ovviamente la meglio ama è Talco.
        {charNameOne}: Ti ho già detto che crea strumenti con qualsiasi cosa trova in giro?
        {are_two_entities_together(SecondCharacter, PG):{charNameTwo}: Mi piacerebbe conoscere Talco!}        
        {charNameOne}: L'estate facciamo le feste sul tetto, cantiamo e improvvisiamo.
        {charNameOne}: "E vento e sudore si portano via le preoccupazioni, non c’è nulla a cui pensare.
        {charNameOne}: Ti senti parte di tutto, privə di confini.
        {charNameOne}: Sei la musica, sei l’umidità nell’aria, sei la gola del vicino che si lamenta del casino."
        {charNameOne}: Sono parole scritte da Talco, le adoro.
        {charNameOne}: Qui è tutto così calmo, posso sentire i pensieri dei miei pensieri e questa roba mi cringia così tanto che non hai idea.
        
                + [Allora serve fare più rumore.]
                    {charNameOne}: Facciamo incazzare la mentore?
                    {charNameOne}: Quindi dovrei riprendere a stordirmi di cose?
                    {charNameOne}: Può essere un'idea.
                    {charNameOne}: Ma non so quanto sia utile per capire perché ho questo maledetto nome.
                        ~ firstRed ++
                        
                + [Il pensiero è specchio: rompilo per distinguere reale e riflesso.]
                    {charNameOne}: Ti shippo, ama, ma parla come mangi.
                    {charNameOne}: Però forse dovrei stendermi e meditare.
                    {charNameOne}: Lasciare che i pensieri si spengano uno per uno.
                    {charNameOne}: Talco lo fa.
                    {charNameOne}: Dice spesso che devo "ignorare la paura che ho all'idea di vedere le cose come stanno".
                    {charNameOne}: Facile, proprio.
                        ~ firstPurple ++
                
                + [La disciplina può aiutare a spegnere i pensieri.]
                    {charNameOne}: Ma l'alcool lo fa prima, e meglio.
                    {charNameOne}: E costa meno della terapia.
                        ~ firstBlue ++
                        
                + [Forse non è la festa, ma è il senso di unione che ti manca.]
                    {charNameOne}: Ma con chi, qui?
                    {charNameOne}: Scusa, non per triggerarti.
                    {charNameOne}: Sei una persona a modo, ma non siamo ancora bestie.
                    {charNameOne}: Men che meno la mentore.
                        ~ firstGreen ++
                        
                + [La serra ha un tetto! E io so sudare!]
                    {charNameOne}: Questo è un piano, ama!
                    {charNameOne}: Forse il vetro non ci reggerebbe a lungo ma che cambia?
                    {charNameOne}: E almeno una di quelle strane piante saprà cantare!
                        ~ firstYellow ++        
                -
        {charNameOne}: Fammi rilassare un po' ama.
        {charNameOne}: E magari riposa anche tu.
            ~ firstPauseTalking = firstCharPauseDurantion
            -> main
        
    = six
    ~ temp charNameOne = uppercaseTranslator(firstCharacterState)
    ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
        //Paura delle conseguenze della scelta.
        ~ firstStoryQuestCount ++
        
        {charNameOne}: Trigger warning: pesantezza, ama.
        {charNameOne}: Ma questo posto mi fa pensare a troppe cose.
        {charNameOne}: Conoscevo questo ragazzo, Jonah, un arpista e un genio.
        {charNameOne}: Per due anni ha fatto da spalla a un tizio di Beijing, una rockstar della musica classica.
        {charNameOne}: Ma poi non si sa perché ma Jonah sentiva la mancanza di casa ed è tornato per fare una carriera da solista.
        {charNameOne}: Le cose gli sono andate di merda.
        {charNameOne}: E man mano che gli studi gli sbattevano la porta in faccia, lui ha iniziato a perdere fiducia in sé e nella musica.
        {charNameOne}: Ora non so più dove sia, Jonah.
        {charNameOne}: Qualche compagna del Conservatorio giura di averlo visto mendicare.
        {charNameOne}: Nella chat dei lavoretti qualcuno dice che suona sotto pseudonimo per dei ricchi di merda.
        {charNameOne}: Una volta credo di averlo visto lavorare in un supermercato.
        {charNameOne}: Scusa, ama.
        {charNameOne}: Che pesantezza.
        {charNameOne}: Però sono qui che mi chiedo: cosa puoi fare quando sai fare bene solo una cosa ma il mondo non ti permette di farla?
        {charNameOne}: Accetti i compromessi o corri il rischio di morire di fame?
        {charNameOne}: O aspetti fino a quando non sia il mondo a decidere per te?
            
            + [Canta e balla. Domani è una cosa lontana.]
                {charNameOne}: Mi sembra di sentire Talco con queste frasi.
                {charNameOne}: Non che non aprezzi, ama.
                {charNameOne}: Ma per me è da molto ormai che è <i>domani</i>.
                {charNameOne}: Il conservatorio è finito da mesi, e io suono, ballo, ma non so ancora che cosa fare.
                    ~ firstYellow ++
                    
            + [È imperativo sopravvivere, troviamo sempre una soluzione.]
                {charNameOne}: "Imperativo" rimettilo nel vocabolario, ora.
                {charNameOne}: E voglio qualcosa di più che sopravvivere.
                {charNameOne}: Lo voglio per tutte le persone!
                ~ firstBlue ++
                    
            + [Restati fedele e non ci sarà compromesso ma cambiamento.]
                {charNameOne}: Ah, ci sta!
                {charNameOne}: E a quel punto ogni decisione sarebbe la <i>mia</i> decisione.
                    ~ firstPurple ++
            
            + [Dona la tua musica senza chiedere e tutto arriverà.]
                {charNameOne}: Forse in questo posto strano funziona così.
                {charNameOne}: Ma nel mondo reale tutto prende e non dà nulla.
                {charNameOne}: A parte l3 am3.
                {charNameOne}: O dici che devo darli a loro i miei doni?
                {charNameOne}: Mmm.
                {charNameOne}: Ci devo pensare.
                    ~ firstGreen ++
           
            + [Mezzo compromesso è già una completa sconfitta.]
                {charNameOne}: Top.
                {charNameOne}: Eppure Jonah ha perso del tutto, comunque.
                {charNameOne}: Con o senza compromessi.
                {charNameOne}: Questa è l'unica soluzione?
                    ~ firstRed ++       
            
            -
        {charNameOne}: A proposito di causa perse: vado a cercarmi uno spritz.
        {charNameOne}: Ho proprio bisogno di staccare.
            ~ firstPauseTalking = firstCharPauseDurantion
            -> main
        
    = seven
    ~ temp charNameOne = uppercaseTranslator(firstCharacterState)
    ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    //Razionalità
        ~ firstStoryQuestCount ++
        
        {charNameOne}: Stavo ripensando al prof Ghiberti.
        {charNameOne}: E prometto che non è un pippone a questo giro.
        {charNameOne}: Forse.
        {charNameOne}: Comunque: il Ghiberti vede tutta la musica come una cosa matematica.
        {charNameOne}: Non è una cosa nuova, ma di solito chi lo fa non rinuncia alla poesia.
        {charNameOne}: Per Ghiberti invece la musica e il mondo sono solo una combinazione di numeri.
        {charNameOne}: Una somma che dà sempre lo stesso risultato.
        {charNameOne}: Ma quanto sono basic quando dico queste cose?
        {charNameOne}: Tra l'altro una volta a vocina bassa ha giurato che il jazz è un errore.
        
            + [La prevedibilità <b>è</b> poetica. La cosa più rara al mondo.]
                {charNameOne}: Allora non sono una persona poetica.
                {charNameOne}: Se non c'è caos, imprevedibilità, mi annoio.
                    ~ firstBlue ++
                    
            + [Ognuna ha il suo modo di raggiungere la verità.]
                {charNameOne}: Ci sta.
                {charNameOne}: Ma non è troppo facile così?
                {charNameOne}: Non è togliersi la responsabilità verso le altre persone?
                    ~ firstPurple ++
                    
            + [È un errore non giocare, e il jazz è musica che gioca.]
                {charNameOne}: Top!
                {charNameOne}: Anche se sicuro che ora si è preso un infarto.
                {charNameOne}: Per me tutta la musica è gioco.
                {charNameOne}: Basta smetterla di sentirsi stocazzo e perdersi con band e pubblico.
                ~ firstYellow ++
                
            + [Sembrano le parole di una persona ferita.]
                {charNameOne}: Lo dice anche Talco.
                {charNameOne}: Metti che voglio pure aiutarlo con questa ferita, cosa dovrei fare?
                {charNameOne}: Rispettare la sua ossessione per le regole?
                {charNameOne}: O sorprenderlo con del caos creativo?
                ~ firstGreen ++
                
            + [Ha paura di accogliere la potenza del disordine.]
                {charNameOne}: Ci sta.
                {charNameOne}: Anche se poi credo che il disordine sia solo una questione di prospettiva.
                {charNameOne}: Alla lunga ci si abiuta e diventa difficile cambiare.
                {charNameOne}: Un po' come quel casino che è camera mia.
                    ~ firstRed ++
            -
             ~ firstPauseTalking = firstCharPauseDurantion
            -> main           
    = eight
    ~ temp charNameOne = uppercaseTranslator(firstCharacterState)
    ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    ~ firstStoryQuestCount ++
        
        {charNameOne}: Giuro che non shippo il Ghiberti, ma continuo a pensare a quello che ci siamo dette prima.
        {charNameOne}: E il Ghiberti sembra un uomo felice, sorride molto.
        {charNameOne}: Ma poi se lo guardi bene sembra il sorriso di un robot.
        {charNameOne}: O di uno che ha una Tesla.
        {charNameOne}: A me fa venire la caga quel sorriso, quel modo di fare.
        {charNameOne}: Tutti questi numerini e fattori tolgono l’esperienza, l’errore, il senso di comunità.
        {charNameOne}: Talco dice sempre che una comunità canta, ma per farlo deve sbagliare, essere imprevedibile.
        {charNameOne}: Che diavolo ci fai con una canzone fatta con la sola precisione?
        {charNameOne}: Tra ame sbagliamo sempre, e poi ci perdoniamo.
        {charNameOne}: Mentre il mondo del Ghiberti sembra come quella roba con l’AI, orecchiabile, prevedibile, dimenticabile.
        {charNameOne}: C'è una sola cosa che mi triggera le ovaie: tutte le cosine pratichine e calcolabili e precise.
        {charNameOne}: Sono roba morta.
        {are_two_entities_together(SecondCharacter, PG):{charNameTwo}: Essere adulti è orribile.}        
            
            + [Una comunità sboccia quando c'è affetto e fiducia.]
                {charNameOne}: Esatto!
                {charNameOne}: Una casa in campagna con l3 am3.
                {charNameOne}: Un giardino.
                {charNameOne}: Anna dice che è come fuggire dalle responsabilità.
                {charNameOne}: Ma non è che possiamo salvare il mondo, noi.
                    ~ firstGreen ++
                
            + [Una comunità non regge senza senso pratico.]
                {charNameOne}: Giuro ama che a volte mi triggeri tantissimo.
                {charNameOne}: Perché tutto è solo senso pratico per te?
                {charNameOne}: Non è comunità la roba che hai in mente, ma una roba come una fabbrica.
                {charNameOne}: E io non ci voglio vivere in una fabbrica.
                    ~ firstBlue ++
                    
            + [Una comunità resiste se segue un obiettivo superiore.]
                {charNameOne}: Mood totale.
                {charNameOne}: Una comunità unita per rendere il mondo più giusto.
                {charNameOne}: O trasformare qualcosa di terribile in un gioco.
                {charNameOne}: E farlo esplodere.
                    ~ firstPurple ++
        
            + [Ciò che ci tiene unite è il giocare.]
                {charNameOne}: Ah, ci sta!
                {charNameOne}: È  liberatorio ridere tutt3 assieme.
                {charNameOne}: Forse dovrei solo far ridere il Ghiberti, e magari quel sorrisino finto si rompe.
                {charNameOne}: Oppure mi schiatta sul posto.
                    ~ firstYellow ++
                    
            + [Ci si accresce nel dissenso e nella discussione.]
                {charNameOne}: Amo noi.
                {charNameOne}: Ma non è manco male sedersi assieme al sole e chillare, ogni tanto, no?
                    ~ firstRed ++
     
            -
        {charNameOne}: Comunque non sono di certo qui per il Ghiberti e le sue paranoie matematiche.
        {charNameOne}: Ma per capire perché sono in questo posto.
        {charNameOne}: Mi prendo un po' di tempo per me, {name}.
            ~ firstPauseTalking = firstCharPauseDurantion
            -> main
    
    = nine
    ~ temp charNameOne = uppercaseTranslator(firstCharacterState)
    ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
        //Voglia di fare qualcosa di utile, importante
        ~ firstStoryQuestCount ++
        
        {charNameOne}: Non lo dire alla mentore, ma mi ci sto abituando a stare qui.
        {charNameOne}: Anche se non sarebbe male avere almeno un pianoforte e del vinello.
        {charNameOne}: Però mi sembra che questo posto non cambia molto.
        {charNameOne}: Sembra il momento prima del temporale, quando l'aria frizza e sai che sta per arrivare ma non sai quanto sarà forte.
        {charNameOne}: E ti senti viva.
        {charNameOne}: Merda, faccio davvero schifo a parlare.
            
            + [È come una ninna nanna. Chissà cosa sognerai.]
                {charNameOne}: La cosa preferita di Talco sono i pigiama party.
                {charNameOne}: Chillare con l3 am3.
                {charNameOne}: "Un sogno condiviso, sognando sognare."
                    ~ firstGreen ++
                    
            + [Non tanto a parlare ma ad arrivare al punto.]
                {charNameOne}: Ama, mi ricordi perché continuo a raccontarti queste cose?
                {charNameOne}: Ah, sì, perché siamo solo noi.
                {charNameOne}: E la mentore.
                {charNameOne}: E la mia noia.
                    ~ firstBlue ++
                    
            + [Ogni temporale toglie a qualcuna e dà a qualcun altro.]
                {charNameOne}: Ah, ci sta!
                {charNameOne}: Come le piante nella serra.
                {charNameOne}: Che mi sembra crescono con la terra e le nostre paturnie.
                {charNameOne}: Per poi darci in cambio forme assurde e idee.
                    ~ firstPurple ++
                    
            + [O come il momento prima di una battaglia.]
                {charNameOne}: A te piace menare le mani, {name}?
                {charNameOne}: Ma non è roba mia, andare a fare battaglie.
                {charNameOne}: Tutte le cose di guerra mi fanno solo incazzare.
                {charNameOne}: Mi sembra solo un modo idiota per vedere chi ce l'ha più grosso.
                {charNameOne}: E manco tra la gente che poi muore.
                {charNameOne}: Cringe.
                    ~ firstRed ++
                    
            + [Qui l'aria sa di mare e zucchero filato!]
                {charNameOne}: Vero? Che è assurdo, perché non ho visto il mare da nessuna parte.
                {charNameOne}: Né dello zucchero filato.
                {charNameOne}: Ma ora ho fame.
                {charNameOne}: E voglia di farmi un giro sull'ottovolante.
                    ~ firstYellow ++         
    
            -
        {charNameOne}: Vabbè.
        {charNameOne}: Credo me ne starò qui ad aspettare questo finto temporale.
             ~ firstPauseTalking = firstCharPauseDurantion
            -> main   
    = ten
    ~ temp charNameOne = uppercaseTranslator(firstCharacterState)
    ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    ~ firstStoryQuestCount ++
        
        {charNameOne}: Comunque non è che penso solo a me stessa ama, giuro.
        {charNameOne}: L'anno scorso abbiamo occupato un parco per una settimana.
        {charNameOne}: Il comune voleva distruggere gli alberi, e volevamo fare qualcosa di decente per una buona volta.
        {are_two_entities_together(SecondCharacter, PG):{charNameTwo}: La prossima volta voglio aiutarvi!}
        {are_two_entities_together(SecondCharacter, PG):{charNameOne}: Sarai il primo a venire chiamato, promesso!}        
        {charNameOne}: La prima notte non abbiamo manco sentito il freddo da quanto eravamo prese bene.
        {charNameOne}: Però poi il mood si è spento.
        {charNameOne}: Diverse se ne sono andate, e chi è rimasta non aveva più la spinta. Zero.
        {charNameOne}: L'ultima sera c'è stato un momento di totale silenzio.
        {charNameOne}: Non si sentiva la pula, nessuna cantava, persino gli scoiattoli erano fermi.
        {charNameOne}: E a quel punto ho sentito il canto degli alberi.
        {charNameOne}: Giuro, ama!
        {charNameOne}: E quando ho iniziato a cantare con loro mi sono sentita viva.
        
            + [Forse gli alberi qui conoscono la storia della tua lotta.]
                {charNameOne}: Non è per flexare, ma sarebbe bello.
                {charNameOne}: Però allora gli chiedo anche come tornare a casa.
                {charNameOne}: Non so più quanto voglio restare quì.
                {charNameOne}: Senza offesa, ama.
                    ~ firstGreen ++
                
            + [Hai anche danzato con gli alberi?]
                {charNameOne}: Non avevo preso i funghetti, no.
                {charNameOne}: Ma avrei apprezzato molto, ama.
                {charNameOne}: Anzi no, forse non l'avrei fatto.
                {charNameOne}: Muovermi a volte mi sembra che rompa le cose.
                    ~ firstYellow ++
                    
            + [Sei tu che hai lottato per gli alberi, o loro per te?]
                {charNameOne}: Ti shippo totale.
                {charNameOne}: Talco direbbe che ci siamo aiutate a vicenda. E non solo.
                {charNameOne}: Che la separazione è solo una illusione, o roba del genere.
                {charNameOne}: Che una melodia non esiste senza tutte le sue note.
                    ~ firstPurple ++
            
            + [Gli alberi "cantano" per allarmare altri alberi.]
                {charNameOne}: Ama, tu sai uccidere il mood come poche persone al mondo.
                {charNameOne}: Quindi secondo te ero immersa in un coro di disperazione?
                {charNameOne}: Ora mi metto a urlare anche io.
                    ~ firstBlue ++
                
            + [Come ti sei sentita a combattere per qualcun altro?]
                {charNameOne}: Motivata.
                {charNameOne}: Motivata fino al cuore.
                {charNameOne}: L'avrai notato, faccio un po' cagare a spiegare le cose.
                {charNameOne}: Ma in quel momento sapevo che stavo facendo qualcosa che aveva un senso.
                {charNameOne}: Qualcosa di importante non solo per me.
                    ~ firstRed ++
            -    
        {charNameOne}: Comunque la storia poi è finita male, ovvio.
        {charNameOne}: I poliziotti ci hanno trascinate e bastonate e schedate.
        {charNameOne}: E soprattutto hanno tagliato gli alberi.
        {charNameOne}: E sono tornata a sentirmi inutile.
            ~ firstPauseTalking = firstCharPauseDurantion
            -> main
    
    = eleven
    ~ temp charNameOne = uppercaseTranslator(firstCharacterState)
    ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
        //Famiglia d'origine
        ~ firstStoryQuestCount ++
        
        {charNameOne}: Ti racconto una cosa idiota. La passione per la musica l'ho presa da mio papà.
        {charNameOne}: Lo stesso uomo che ora vorrebbe cercassi un "lavoro vero".
        {charNameOne}: Casa è piena di vecchi strumenti che nessuno tocca da anni.
        {charNameOne}: Sono del nonno paterno.
        {charNameOne}: Papà li tiene come se fossero delle reliquie.
        {charNameOne}: Da piccola ogni tanto mi lasciava sentire le vecchie registrazioni, di quando nonno suonava e cantava nelle balere.
        {charNameOne}: Nonno era un chad totale.
        {charNameOne}: A volte papà ballava con me e mamma.
        {charNameOne}: E rideva un sacco.
        {charNameOne}: Non il suo sport preferito.
        
            + [L'inferno è uno strumento che non può suonare.]
                {charNameOne}: Adoro.
                {charNameOne}: Non avrei saputo dirlo meglio.
                {charNameOne}: Ogni tanto li rubavo e suonavo in camera.
                {charNameOne}: Alcuni avevano un suono storto, forse per colpa delle tarme.
                {charNameOne}: Però ho sempre amato le cose un po' rotte perché hanno una storia tutta loro.
                    ~ firstPurple ++
                    
            + [E ora accresci l'albero della tua famiglia.]
                {charNameOne}: Più o meno.
                {charNameOne}: Per nonno la musica era fatta per unire, salvare il mondo forse.
                {charNameOne}: Quando ci viene da ballare e cantare ci passa la voglia di litigare, no?
                    ~ firstGreen ++
                    
            + [Credi che tuo padre si sia arreso?]
                {charNameOne}: Merda, ci vai giù piano {name}!
                {charNameOne}: Non ci crederai, ma no, secondo me no.
                {charNameOne}: Lui è davvero felice di ciò che fa.
                {charNameOne}: Il problema è che pensa che visto che le cose che fa lo fanno felice, allora tutti devono essere felici facendo le cose che fa.
                {charNameOne}: Non ci avevo pensato, ma ora ho capito da dove gli vengono certe idee politiche di merda.
                    ~ firstRed ++
                    
            + [Ti va di ballare con me?]
                {charNameOne}: Sì ama!
                {charNameOne}: Forse non ora però.
                {charNameOne}: Questa cosa della chitarra inizia a pesarmi.
                    ~ firstYellow ++
                    
            + [Esistono lavori veri e lavori non veri?]
                {charNameOne}: Sei tu la persona seria, no?
                {charNameOne}: Se la vedi come mio padre la risposta è <i>sì</i>.
                {charNameOne}: E non casualmente i lavori non veri sono tutti quelli che mi piacciono.
                    ~ firstBlue ++
            -
            
        {charNameOne}: Lasciamo un po' solo ora, {name}.
        {charNameOne}: Perché sto entrando in fase lamentosa e non ho voglia di cringiarti.
            ~ firstPauseTalking = firstCharPauseDurantion
            -> main
            
    = twelve
    ~ temp charNameOne = uppercaseTranslator(firstCharacterState)
    ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    ~ firstStoryQuestCount ++
    
        {charNameOne}: Comunque in merito a quello che ti dicevo prima, ama: non è che papà sia un mostro, sia chiaro.
        {charNameOne}: Mamma è più cinica di papà.
        {charNameOne}: Le sono grata, quello sicuro: è lei che ha convinto papà a farmi fare il conservatorio.
        {charNameOne}: Ma per farmi diventare una Lang Lang, Mitsuko Uchida, Alfred Brendel.
        {charNameOne}: Prestigio, onoreficienze e denaro.
        {charNameOne}: Lib totale lei, totale.
        {charNameOne}: Ma chi glielo dice che a ventitrè anni per queste cose sono già vecchia?
        {are_two_entities_together(SecondCharacter, PG):{charNameTwo}: Moooooolto vecchia!}        
        {charNameOne}: Se quello è l'obiettivo, ho proprio preso la strada sbagliata.
        
            + [Tua mamma vuole il tuo o il suo di bene?]
                {charNameOne}: A mia madre interessa solo il nome della famiglia.
                {charNameOne}: Come se poi fosse prestigioso.
                {charNameOne}: Un po' mi spiace perché mi rendo conto che lei ci tiene proprio a sembrare una di quelle fighe.
                {charNameOne}: Ed è l'unica a non accorgersi che può fare tutte le cose più assurde del mondo, ma tanto nessuno la considererà una al top.
                {charNameOne}: Povera.
                    ~ firstGreen ++
                    
            + [Loro hanno fatto concerti prima della maggiore età.]
                {charNameOne}: Grazie per avermelo ricordato.
                {charNameOne}: Ne avevo davvero bisogno.
                {charNameOne}: Ora dimmi che sono fallita e così posso appendere il piano al muro.
                {charNameOne}: E non dirmi che non si può appendere un pianoforte al muro o giuro che ti rompo i timpani urlando.
                    ~ firstBlue ++
                
            + [La strada sbagliata è quella con più insegnamenti.]
                {charNameOne}: {name}: non un nome ma un dispenser di aforismi.
                {charNameOne}: Però in qualche modo ha senso.
                {charNameOne}: Ma presto o tardi dovrò pure capire come mangiare, e a quel punto cosa me ne faccio di tutte le strade sbagliate del mondo?
                        ~ firstRed ++
                        
            + [Ma loro si divertono, quando suonano?]
                {charNameOne}: Tanto, ama.
                {charNameOne}: Prendi Uchida: quando suona è una gioia per gli occhi.
                {charNameOne}: Anche se forse non lo chiamerei proprio divertimento.
                {charNameOne}: Se ne va in un altro luogo, un mondo che non ho ancora trovato.
                {charNameOne}: Forse è questo qui?
                {charNameOne}: Sto suonando e sono così rincoglionita da non averlo realizzato?
                    ~ firstYellow ++
                    
            + [Cambiamo sempre, ma non diventiamo mai chi non siamo.]
                {charNameOne}: Un'altra frase così e mi crusho tantissimo per te.
                {charNameOne}: Ma prima vallo a dire a mia madre.
                {charNameOne}: Ama: mi fa male con queste cose ma non se ne rende nemmeno conto.
                {charNameOne}: È come se mi dicesse sempre che sono sbagliata.
                    ~ firstPurple ++
            -    
            
        {charNameOne}: E con questa, ho finito di sputtanare la mia famiglia.
         {charNameOne}: Vado a deprimermi da qualche parte.
            ~ firstPauseTalking = firstCharPauseDurantion
            -> main

  
        



 === first_story_gift ===
~ temp charNameOne = uppercaseTranslator(firstCharacterState)
<i> Stai per donare qualcosa a {charNameOne}.</i>
        + {findedGifts != ()} [Scelgo il dono.]
            ~ currentReceiver += FirstCharacter
            -> inventory_management
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
        {charNameOne}: Ho capito una cosa su di noi, ama.
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
        - firstPurple && firstYellow > firstBlue: {charNameOne}: Talco continua a mancarmi, ma con te mi sento come se fossimo parte da sempre della stessa band.
        <i>{charNameOne} vede {name} come una persona amica e fidata.</i>
        
        -firstPurple or firstYellow > firstBlue:{charNameOne}: Non sei mica male, sai? Mi sembra che cantiamo un po' la stessa canzone.
        
        <i>{charNameOne} si trova bene con {name}.</i>
        
        - firstPurple && firstYellow < firstBlue: {charNameOne}: Non è che ci capiamo molto noi due, sai? È come se io suonassi Chopin e tu la lambada. Una lambada noiosa.
        
        <i>{charNameOne} non si è sentita capita da {name}.</i>
        
        
        - else: {charNameOne}: Siamo un po' in modalità random, vero? A volte ci avviciniamo, a volte ciaone proprio, tutta una musica diversa.
        
        <i>{charNameOne} non riesce a capire che rapporto sta costruendo con {name}.</i>
        
        }
        
        {charNameOne}: Comunque: credo di aver capito perché il mio nome qui è {charNameOne}.
        {charNameOne}: Penso al Ghiberti.
        {charNameOne}: Penso all3 am3.
        {charNameOne}: Penso alla mia famiglia.
        {charNameOne}: Non so se l'hai visto, ma tutta questa roba mi fa pressione.
        {charNameOne}: Tutte le persone che conoscono mi stanno chiedendo di fare una scelta, di decidere che cosa fare da grande.
        {charNameOne}: Ma sinceramente, {name}?
        {charNameOne}: Mi cago addosso all'idea di fare una scelta.
        {charNameOne}: Perché una scelta chiude strade.
        {charNameOne}: Perché una scelta delude persone.
        {charNameOne}: Perché una scelta può portarti su strade sbagliate.
        {charNameOne}: E a quel punto, non si può più tornare indietro.
        {charNameOne}: E così l'unica cosa che rimane è rinunciare.
        {charNameOne}: Lasciare che le altre persone scelgano per te.
        {charNameOne}: O che lo faccia il mondo.
        {charNameOne}: Ecco perché mi chiamo {charNameOne}: perché rimango nel medio, nella cosa più ovvia e cringe.
        {charNameOne}: E lascio che le cose accadano.
            ~ growing ++
            
            + [Credo di sapere come aiutarti.]
                -> statement
            + [Capisco il tuo dolore, ma ho bisogno di riflettere un attimo.]
                -> main


    = statement
    ~ temp charNameOne = uppercaseTranslator(firstCharacterState)
        <i>A seguito del rapporto che {name} ha creato con {charNameOne} {firstPurple && firstYellow > firstBlue: l'inchiostro è aumentato di due unità|{firstPurple or firstYellow > firstBlue: l'inchiostro è aumentato di una unità|l'inchiostro non ha subito variazioni}}.</i>
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
        -   are_two_entities_together(Mentor, PG):{charNameFive}: Bene, è il momento che mi allontani.
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
        
        + [Ma hai deciso di costruire una famiglia con l3 tu3 am3.]
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
            {name}: Lə Talco che hai raccontato si arrabbierebbe di più se tu facessi una scelta per te pensando a ləi.
            
                    
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
    
            
        + [Ti preoccupi molto di loro, e poco di te.]
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
                
        + [Tradiamo la fiducia se rompiamo le regole a nostro vantaggio.]
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
        
        + [Tutt3 hanno immaginato sorti diverse per Jonah, ma nessuna fine.]
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
            
        
        + [A suo modo, la storia di Jonah è un successo.]
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
        {name} Questo posto ti ha assegnato un nome, e quel nome è Chitarra. Ma tu lo vedi come una rinuncia.

        + [Giocare è bello perché puoi sempre rinunciare a farlo.]
            {name}: Quando una roba la devi fare anche quando non vuoi, quello è il lavoro.
            {name}: Per questo fa schifo.
                {
	                - firstCharacterPossibleStates hasnt Violino:
		                ~ firstCharacterPossibleStates ++
	                    {debugChangeName: Aumento lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }            
         
        
        + [Quando Anna ha rinunciato all'ex, è rinata.]
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
    {charNameOne}: Mentre ti ascoltavo mi è nata una nuova canzone in testa.
    {charNameOne}: La canzone del mio nome.
        
        {
            - firstCharacterPossibleStates has Chitarra:
                {charNameOne}: Non vorrei deluderti, ma <b>resterà Chitarra</b>, perché l'unica cosa che posso fare è non fare nulla e lasciare che le cose accadano.
                {charNameOne}: Perdonami il cringe, ma non posso fare diversamente.
            
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
        
        ~ growing ++    
        
        {
        - firstCharacterSpecialEvent == true:
            -> secret_ending
        - else:
            -> exit
        }
    
    
    = secret_ending
    ~ temp charNameOne = uppercaseTranslator(firstCharacterState)
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    
        {charNameOne}: C'è una cosa che devo dirti ama.
        {charNameOne}: Riguarda {charNameFive}.
        {charNameOne}: Non voglio sembrare una snitch ma continuo a chiedermi: qual è il confine tra essere una brava persona ed essere una manipolatrice?
        {charNameOne}: A me non la conta giusta quella.
        {charNameOne}: Però tra un po' mi potrò levare di culo e non è più un mio problema.
        {charNameOne}: Ma se hai intenzione di restare qui a lungo, forse devi chiedertelo anche tu.
            ~ firstStory = Ended
            ~ movementsCounter = 0
            ~ PG_advace_management(firstStoryPG)
                -> main
            
    = exit
    ~ temp charNameOne = uppercaseTranslator(firstCharacterState)
        {charNameOne}: E ora resterò qui a romperti le gonadi ancora per un po', in attesa del prossimo treno.
            ~ firstStory = Ended
            ~ movementsCounter = 0
            ~ PG_advace_management(firstStoryPG)
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
        {charNameOne}: {~ Quanto mi prenderà per il culo Talco, quando lə racconterò tutta questa storia?|Comunque in questo posto dovreste mettere almeno un piano bar.|Se lo dico all3 am3 del conservatorio mi fanno il culo, ma vado pazza per le k-pop night.|Ma tu l'hai vista quella strana rana nello stagno?}
                ~ firstCharEndingDialogue ++
        -> main
        
        = goodbye
        ~ temp charNameOne = uppercaseTranslator(firstCharacterState)
        {charNameOne}: Ama: è il momento di tornare a casa.
        {firstCharacterPossibleStates hasnt Chitarra: {charNameOne}: Non ho idea di che cosa accadrà, sinceramente, ma almeno ora mi sento pronta.}
        {firstCharacterPossibleStates hasnt Chitarra: {charNameOne}: E non cringiare ma: grazie. Mi hai dato una mano enorme. Me lo ricorderò.}
        {firstCharacterPossibleStates has Chitarra: {charNameOne}: Vedremo cosa mi accadrà.}
            
            ~ move_entity(FirstCharacter, Safekeeping)
            //Abbiamo accesso alle note solo se è cambiata. Sennò lei se ne va abbastanza arresa da tutto.
            

            
        -> main




=== first_character_opinions
~ temp charNameOne = uppercaseTranslator(firstCharacterState) 
    //Le sue opinioni comunque ci fanno capire meglio il modo in cui vede il mondo e parte della sua vita fuori da qui.
    {charNameOne}: {~ Talco dice sempre che bisogna sporcarsi le mani per capire il mondo.|Se proprio devo restare qui, tiro su una band con le api. Sono troppo chaddone loro.|Comunque il Ghiberti ha una moglie che è stra in gamba. Forse a volte ci si deve compensare. E visto che Talco è svegliə, io allora sono l'idiota della cumpa.|Resti tra noi, ma il Conservatorio è un posto del cazzo. C'è una competitività che non c'entra nulla con la musica.|Mi scoccia litigare con mio padre, ma io e il suo modo di fare NON. ANDIAMO. D'ACCORDO. Zero, ama. Zero.}
        ~ firstPauseTalking = firstCharPauseDurantion
            -> main











