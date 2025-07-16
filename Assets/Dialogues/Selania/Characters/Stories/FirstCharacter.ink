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
    ~ temp charNameOne = translator(firstCharacterState)
        -> common_storylets ->
    
                {//Se prima chiacchierata
                    - not knowing_first_character.one:
                        -> knowing_first_character.one
                
                //Se prima chiacchierata fatta e passato abbastanza tempo dalla pausa prevista        
                    - firstPauseTalking == 0:
                        -> hub
                
                //Altre opzioni        
                    - else:
                         {~ Ho bisogno di tempo da sola.|Torna tra un po'.|Mi serve un po' di silenzio ora.} #speaker:{firstChar_tag()}
                        -> main    
                }
    = hub
    ~ temp charNameOne = translator(firstCharacterState)
    
         {~ Le farfalle qui giocano per ore!|No dai. Ma hai visto quanto sono carini gli scoiattoli?!|Con il rumore dell'acqua dello stagno ci posso fare una base niente male.} #speaker:{firstChar_tag()}
                + [Ti va di raccontarmi qualcosa di te?]
                    -> knowing_first_character
                    
                    
                //Se non ho ancora fatto il dono e NON ho parlato col mentore e ho parlato abbastanza con lei
                + {firstStoryQuestCount > minStoryQuesTCountFirstChar && not first_story_gift.ink_outcome && not gifts_and_ink && findedGifts != ()} [Ho trovato questa cosa e vorrei donartela.]
                         Non voglio snitchare, ma non hai ancora chiesto alla mentore a cosa servono. #speaker:{firstChar_tag()}
                         Se non parli con lei prima poi minimo ci rimane male.
                            -> main
                
                //Se non ho ancora fatto il dono e ho parlato con il mentore e ho parlato abbastanza con lei
                + {firstStoryQuestCount > minStoryQuesTCountFirstChar && not first_story_gift.ink_outcome && gifts_and_ink && findedGifts != ()} [Ti vorrei donare questa cosa.]
                        -> first_story_gift
            
                //QUESTA OPZIONE C'è SOLO DOPO CHE HO FATTO IL DONO E NON HO ANCORA AVVIATO LA MAIN STORY
                + {first_story_gift.ink_outcome && not main_story_first_character && not questions} [Vorrei aiutarti a guardare le cose in modo diverso.]
                        {translator(firstCharacterState)}: Ama, parla prima con la mentore così ti dice cosa fare e non le prende una sincope se facciamo casini. #speaker:{firstChar_tag()}
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
    ~ temp charNameOne = translator(firstCharacterState)
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
        ~ temp charNameOne = translator(firstCharacterState)
        ~ temp charNameFive = translator(fifthCharacterState)
        
        //Presentazione.
        ~ firstStoryQuestCount ++
        
        
        Hai visto passare qualcunə? #speaker:{firstChar_tag()} #portrait: chitarra_sad #ink:none
        Altə all’incirca una balla di fieno e che si muove come un violino.
        O almeno ləi si descriverebbe così.
        Lə adoro ma è sempre un po' edgy. #portrait: chitarra_neutral
        E comunque non posso essere arrivata qui da sola, vero? Qualsiasi cosa sia <i>qui</i>.
        Come lə trovo?
        
            + (oneBlue) [Dammi dettagli più concreti.]
                    ~ firstBlue ++
                Concreti? #speaker:{firstChar_tag()}
                Si muove. Respira. Mangia. Saltella. Canta.
                A volte tutte queste cose assieme.
                E ha molta fantasia.
                Sempre che tu sappia cosa sia.
                
            + (oneYellow) [Suona il tamburo e vedrai che il violino torna!]
                    ~ firstYellow ++
                A beh, ci sta! #speaker:{firstChar_tag()}
                Non ci avevo pensato!
                Ma il suo violino è più da pianoforte.
                Forse potrei cercare nella serra, e trovare qualcosa da suonare.
                
            + (oneRed) [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ firstRed ++
                Ha senso, ma Talco non è persona da azione. #speaker:{firstChar_tag()}
                Dice sempre che si trascina nello spazio come se fosse vento.
                E lascia alle sue spalle l'odore della primavera.
                Che è un modo carino per dire che è sempre piene di fango e terriccio.
                
            + (oneGreen) [Se ti senti sola, sono qui ad ascoltarti.]
                ~ firstGreen ++
                Grazie ama. #speaker:{firstChar_tag()}
                Ma è come chiedermi di fare un concerto con una persona sconosciuta.
                Non è che ci si piglia subito, no?

            + (onePurple) [Tu sei sempre con ləi e ləi con te.]
                ~ firstPurple ++
                Mmm, ok, credo? #speaker:{firstChar_tag()}
                Le parole mi vanno anche bene, ma chi ti conosce.
                No dai, non devo essere stronza.
                Però merda se mi manca.
            -
        
        Non faccio mai niente senza Talco. #speaker:{firstChar_tag()} #ink:one
        Talco è l'unica persona con cui posso permettermi di litigare.
        E l'unica che mi sopporta da quando ho finito il conservatorio.
        Ma non mi sono manco presentata: io sono {charNameOne}. #speaker:{firstChar_tag()}
        - (firstPresentation)
        No, io sono <b>{charNameOne}</b>. #speaker:{firstChar_tag()}
         Ehi! Non è questo il mio nome.
         <i>{charNameOne}</i>.
         Forse se provo a dirlo al contrario?
         Arratihc.
         Uh.
         Prova tu. Come ti chiami?
    	    + {name_choice} [Mi chiamo {name}.]
    	    + [Il mio nome è...]
    	        -> name_choice ->
    	    -
    	
    	 E i tuoi pronomi?
    	        -> gender ->
    	 {pronouns has her: Anche io uso i pronomi femminili!|Invece io uso i femminili.}
    	 Comunque questa cosa del nome è strana.
    	 Non so. #ink:two
    	 Non è male la chitarra.
    	 Ma per una del conservatorio è tipo rinunciare a tutto.
    	 Alle ambizioni.
    	 La chitarra è un po' un arrendersi, e dove vado se mi arrendo?
         {name}, secondo te il nome di una persona è importante?
    	    
            + [È uno strumento di controllo.]
                 Il nome è anche uno strumento d'amore.
                 Pensa a tutti i modi in cui qualcuno lo può gridare.
                 Sono sicura che te ne verranno in mente un paio molto piacevoli.
                    ~ firstRed ++
            
            + [Solo se possiamo continuamente cambiarlo.]
                 Adoro!
                 Passo le giornate a cambiare melodie, e non avevo mai pensato di cambiare il mio nome!
                 Cosa normie proprio ora che ci penso, viste tutt3 l3 am3 non binari3 con cui esco.
                 Mi merito di essere una chitarra!
                    ~ firstYellow ++
                    
            + [Solo se sei tu a definirne il significato.]
                 Ah, ci sta!
                 Tu sì che sai guardare al cuore delle cose!
                 Quindi: ora mi ritrovo con un nome nuovo.
                 E non so cosa significhi, cosa doverci fare.
                 Però posso farci quello che voglio, no?
                    ~ firstPurple ++
                    
            + [È un dono della tua famiglia che resterà sempre con te.]
                 A I U T O!
                 Non ci avevo mai pensato.
                 Ma non tutt3 ne sono felici.
                 E per alcune ame il nome è qualcosa che si sceglie.
                 Smollare quello vecchio è una liberazione.
                    ~ firstGreen ++
                    
            + [È utile, altrimenti come ci distinguiamo?]
                 Capiamoci: sei sempre così {pronouns has him: rigido|{pronouns has her: rigida|rigidə}}?
    	         La persona più divertente della festa, vero?
    	         Anche se immagino che una visione pratica abbia dei vantaggi.
    	         Per lo meno faresti felice mio padre.
    	         Madonna, che piagnona che sono.
                    ~ firstBlue ++         
            -

        Comunque ama: il tuo nome ti si addice benissimo. #ink:three
        Hai proprio una faccia da {name}.
        Ma forse la mia faccia è cambiata? Ti sembro una che può chiamarsi {charNameOne}?
        Una che ha rinunciato ad essere un pianoforte? Una viola?
        Certo {charNameOne} che sei basicona con queste domande.
       
            + [Quindi per cambiare faccia basta cambiarci il nome?]
                {firstYellow > 1:  Ama, tu e io faremo amicizia presto!}
                 Cavolo, passerei le giornate a essere chiunque!
                 E forse ora potrei essere Talco.
                 Dove sei, Talco?
                    ~ firstYellow ++
            
            + [No, la faccia è una cosa che hai anche se non hai un nome.]
                {firstBlue > 1:  {name}, sai che ogni tanto puoi scendere da ovviolandia, vero? }
                 Forse dovrei chiamarti Linea.
                 Anzi, Quadrato.
                 Perché neanche a volerlo sai rotolare lontano dalla superficie delle cose.
                    ~ firstBlue ++
               
            + [Rinunciare al superfluo ci avvicina alla natura delle cose.]
                {firstPurple > 1:  {name}, continua così e ci shippo tantissimo!}
                 Ho pensato subito che {charNameOne} avesse un valore negativo.
                 Dimenticandomi che in ogni brano il silenzio è parte fondamentale.
                 Grazie ama!
                    ~ firstPurple ++
            
            + [Cosa pensi direbbe Talco di questo nome?]
                {firstGreen > 1:  A te piace parlare di sentimenti e relazioni, vero?}
                 Questa è una domanda molto tenera.
                 Ma Talco mi blasterebbe, sicuro.
                 Mi direbbe che sono una frignona, e di andare a suonare qualcosa.
                 Talco è una persona che agisce, non resta ad aspettare.
                    ~ firstGreen ++
            
            + [A te va bene essere {charNameOne}? Perché non Lotta? Azione?]
                {firstRed > 1:  Tu prendi tutto di pancia, vero? Saresti {pronouns has him: lo|{pronouns has her: la|lə}} bestie di Talco.}
                 Mi merito {charNameOne} perché ultimamente ho proprio smollato tutto.
                 Però ama, parlare con te non è già una forma di azione?
                    ~ firstRed ++
            -
       
        Come mi dovrei chiamare secondo te?
    	<i>Qualsiasi cosa tu abbia pensato, non riesci a dirla.</i>  #speaker:{fungus_tag()}
    	    -
         Mmm.  #speaker:{firstChar_tag()}
         La tua bocca si muove ma non esce nulla.
         Interessante. #ink:four
         Forse quella tizia che gira quì può aiutarci a capire qualcosa?
        {are_two_entities_together(Mentor, PG): {welcome.your_name: {charNameFive}|???}: In effetti avrei un paio di informazioni utili da darti!} #speaker:{fifthChar_tag()}
         L’unica cosa certa è che ho bisogno di Talco.#speaker:{firstChar_tag()}
         Ci vediamo dopo, {name}.
             ~ firstPauseTalking = firstCharPauseDuration
            -> main
        
    = two
        ~ temp charNameOne = translator(firstCharacterState)
        ~ temp charNameFive = translator(fifthCharacterState)
        //Paura di deludere la famiglia scelta
        ~ firstStoryQuestCount ++
        
         Non riesco a trovare Talco. #speaker:{firstChar_tag()}
         Forse devo fare pace col cervello e accettare che non è qui.
         Ma non ricordo quando è stata l'ultima volta che sono andata in giro senza di ləi.
         Prima mi sono pure persa nel cercarlə.
         Ok, forse mi sono distratta cercando di raggiungere uno scoiattolo perché aveva la ghianda più bella che avessi mai visto.
         Volevo insegnargli a suonarla, e invece mi sono ritrovata tra gli alberi senza sapere dove andare.
         E c’erano otto sentieri diversi davanti a me.
         Otto!
         Otto sentieri per tre persone?
        
            + [O forse il sentiero è unico, ma ci sono otto te.]
                 Ah, ci sta!
                 In effetti mi sento divisa, frammentata.
                 In questo periodo della mia vita ci sono troppe spinte.
                 E non so dove andare.
                    ~ firstPurple ++
            
            + [Ok l'amicizia con Talco, ma devi essere indipendente.]
                 Ama, prenditi meno spazi, grazie.
                 Talco e io siamo due parti della stessa armonia, ma sappiamo essere indipendenti.
                 È che in momenti come questo so suonare solo se è con me.
                    ~ firstRed ++
            
            + [Esiste un numero definito di sentieri per persona?]
                 Non era quello il punto, ama.
                 Ma credo dipenda dal tempo a disposizione.
                 Alla fine puoi suonare qualsiasi strumento, se ne hai il tempo.
                 Ma quanti mesi servono per creare otto sentieri da sola?
                    ~ firstBlue ++
                    
            + [Vorresti suonare qualcosa per Talco?]
                 Adoro.
                 Ma magari non ora.
                 Forse prima devo capire perché ho questo nuovo nome, cosa farmene.
                    ~ firstGreen ++
            
            + [Non so molto di scoiattoli, ma le falene suonano i girasoli!]
                 Toppissimo!
                 Scoiattoli e falene sarebbero la migliore band possibile!
                 Tipo gli Stray Kids della natura.
                 E credo di aver visto una lumaca prima, potrebbe tenere il tempo!
                ~ firstYellow ++
    
            -    
        
         Che poi a pensarci bene, non è che saranno tutti i passi di quell'altra?
         Cammina così tanto, e per cosa poi?
        {are_two_entities_together(Mentor, PG):{charNameFive}: Non hai idea di quanto lavoro ci sia da fare. Quindi sì, cammino MOLTO.} #speaker:{fifthChar_tag()}
         Ma troppe chiacchiere ora, troppe.#speaker:{firstChar_tag()}
         Fammi chillare un attimo.
            ~ firstPauseTalking = firstCharPauseDuration
            -> main  
            
    = three
        ~ temp charNameOne = translator(firstCharacterState)
        ~ temp charNameFive = translator(fifthCharacterState)
        ~ firstStoryQuestCount ++
        
         Stavo pensando ad Anna.#speaker:{firstChar_tag()}
         Anna è una mia ama del conservatorio.
         Insiste perché mi proponga come assistente del Ghiberti.
         Dice che lui ha stima di me e questa è la mia GRANDE occasione.
         E non per flexare, ma so che me la caverei bene.
         Anna è così sicura di sè da quando ha lasciato l'ex tossico! Adoro.
         A volte Anna e Olga discutono perché Olga pensa che io con la classica sia buttata via.
         Dice che devo mettere su una band e invadere tutti i locali della città.
         Olga è sicura che Talco le dia ragione, ma Talco vuole che mi butti sui reality show.
         Dice che non importa vincere, importa fare casino così poi sui social se ne parla.
         Ha il suo senso.
         E poi Ennio, no Ennio no.
         Ennio dice che ho sbagliato strada.
        
            + [La risposta è sempre dove c'è casino: ascolta Talco!]
                 Voi due diventereste bestie in due secondo, cavolo.
                 E potrei portarvi sul palco e fare qualcosa di assurdo.
                 Tipo creare uno xilofono di papere!
                 Sarebbe toppissimo!
                    ~ firstYellow ++
            
            + [Anna ha ragione: bisogna essere pratiche nella vita.]
                 La praticità non è tutto.
                 Sennò avrei dovuto iscrivermi a economia.
                 E inventare nuove supercazzole per fregare il prossimo.
                 O far finta di predire il futuro scazzando più di Nostradamus.
                    ~ firstBlue ++        
    
            + [Tutte le strade sono sbagliate se non sai dove andare.]
                 Mi ricordi il nonno.
                 Ignorava i piccoli fastidi per concentrarsi sul grande insieme delle cose.
                 A me non viene benissimo questa cosa però.
                 Quanto son cringe.
                    ~ firstPurple ++
            
            + [E cosa vuole {charNameOne}?]
                 Ora?
                 Un letto caldo, una copertina.
                 E non doversi fare questa domanda.
                    ~ firstGreen ++
            
            + [Ascolta Olga e invadi il mondo!]
                 Tu sei un treno, {name}. Chi ti ferma?
                 Ma io sono più dell'idea di ricrearlo assieme questo maledetto mondo.
                 Ascoltarci a vicenda, entrare in armonia.
                 E ricostruire sulle macerie che ci circondano.
                 Ora datemi il Nobel per la pace, su!
                    ~ firstRed ++        
            
            -    
         Comunque sembra che tutt3 abbiano le idee chiare su cosa dovrei fare.
         E dato che nessunə amə ha la stessa opinione delle altre, finirò per deluderne qualcunə.
         Sono la mia famiglia, loro.
         E nessuna di queste scelte può accontentare tutt3.
         Che rottura di ovaie, {name}!
            ~ firstPauseTalking = firstCharPauseDuration
            -> main
        
    = four
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    //Silenzio
        ~ firstStoryQuestCount ++
        
         Questo posto è carino, ma il silenzio è pesante.#speaker:{firstChar_tag()}
         Non c'è nemmeno un accenno di musica, di ritmo.
         Come ci si sta in un posto del genere senza sbroccare?
        
            + [Studiandolo, cercando di capire come funziona.]
                 Dovrei vivisezionare una di quelle lumacone trovate dietro alla serra?
                 Testare gli arbusti della foresta?
                 Flexare a manetta e dire "Ora sono il dio di questo posto?!?"
                 Thank you, next!
                    ~ firstBlue ++
                    
            + [Più silenzio significa più spazio per fare rumore!]
                 AAAAAAAAAAAAAAAAAAAAAAAAAAAA!
                 Forse dovevo avvisarti.
                 Ma non funziona, ama.
                 È come quando fai le prove per un concerto in un'enorme sala vuota.
                 Mi fa sentire esposta, e idiota.
                    ~ firstYellow ++
                    
            + [Se corri veloce il ritmo lo crei da sola.]
                 O mi parte un polmone.
                 Non sono esattamente una gymbro, ama.
                 E poi serve qualcuno che suoni con te.
                 E qualcuno che canti.
                    ~ firstRed ++
                    
            + [Il silenzio offre la vulnerabilità necessaria per raccontarsi.]
                 Non ti sono sembrata già abbastanza needy, ama?
                 E poi vorrei ricordarti che manco so perché mi chiamo così.
                 No dai, tu cerchi di essere gentile, scusa.
                 Ma non conosco bene le parole per "raccontarmi".
                 L'unica cosa che so fare è suonare.
                    ~ firstGreen ++
                    
            + [Il giardino <b>è</b> musica, si tratta solo di ascoltare.]
                 Tu sei un mood tutto tuo.
                 Ma forse hai ragione, {name}.
                 È che per ascoltare serve restare in silenzio.
                 E a me viene solo da parlare a ruota e non pensare in questo momento.
                    ~ firstPurple ++
            -
         Idea!
         Forse la mentore è abbastanza vecchia da avere una radio?
        {are_two_entities_together(Mentor, PG):{charNameFive}: Non approfittare della mia gentilezza, ragazzina.}#speaker:{fifthChar_tag()}
        {are_two_entities_together(Mentor, PG):  Dai, si fa per il meme!| Devo assolutamente chiederglielo.}#speaker:{firstChar_tag()}
             ~ firstPauseTalking = firstCharPauseDuration
            -> main 
            
    = five
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    ~ firstStoryQuestCount ++
    
         Hai presente quel meme del tizio che sta a una festa in un angolo.#speaker:{firstChar_tag()}
         E giudica tutti?
         Ecco: io sono quella che balla e ignora il basicone.
         Passo le giornate circondata dall3 am3, mi vivo la festa.
         In casa siamo in cinque, sei se conti la muffa.
         E poi tutt3 l3 ospiti.
         Ovviamente la meglio ama è Talco.
         Ti ho già detto che crea strumenti con qualsiasi cosa trova in giro?
        {are_two_entities_together(SecondCharacter, PG):{charNameTwo}: Mi piacerebbe conoscere Talco!}#speaker:{secondChar_tag()}        
         L'estate facciamo le feste sul tetto, cantiamo e improvvisiamo.#speaker:{firstChar_tag()}
         "E vento e sudore si portano via le preoccupazioni, non c’è nulla a cui pensare."
         "Ti senti parte di tutto, privə di confini."
         "Sei la musica, sei l’umidità nell’aria, sei la gola del vicino che si lamenta del casino."
         Sono parole scritte da Talco, le adoro.
         Qui è tutto così calmo, posso sentire i pensieri dei miei pensieri e questa roba mi cringia così tanto che non hai idea.
        
                + [Allora serve fare più rumore.]
                     Facciamo incazzare la mentore?
                     Quindi dovrei riprendere a stordirmi di cose?
                     Può essere un'idea.
                     Ma non so quanto sia utile per capire perché ho questo maledetto nome.
                        ~ firstRed ++
                        
                + [Il pensiero è specchio: rompilo per distinguere reale e riflesso.]
                     Ti shippo, ama, ma parla come mangi.
                     Però forse dovrei stendermi e meditare.
                     Lasciare che i pensieri si spengano uno per uno.
                     Talco lo fa.
                     Dice spesso che devo "ignorare la paura che ho all'idea di vedere le cose come stanno".
                     Facile, proprio.
                        ~ firstPurple ++
                
                + [La disciplina può aiutare a spegnere i pensieri.]
                     Ma l'alcool lo fa prima, e meglio.
                     E costa meno della terapia.
                        ~ firstBlue ++
                        
                + [Forse non è la festa, ma è il senso di unione che ti manca.]
                     Ma con chi, qui?
                     Scusa, non per triggerarti.
                     Sei una persona a modo, ma non siamo ancora bestie.
                     Men che meno la mentore.
                        ~ firstGreen ++
                        
                + [La serra ha un tetto! E io so sudare!]
                     Questo è un piano, ama!
                     Forse il vetro non ci reggerebbe a lungo ma che cambia?
                     E almeno una di quelle strane piante saprà cantare!
                        ~ firstYellow ++        
                -
         Fammi rilassare un po' ama.
         E magari riposa anche tu.
            ~ firstPauseTalking = firstCharPauseDuration
            -> main
        
    = six
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
        //Paura delle conseguenze della scelta.
        ~ firstStoryQuestCount ++
        
         Trigger warning: pesantezza, ama.#speaker:{firstChar_tag()}
         Ma questo posto mi fa pensare a troppe cose.
         Conoscevo questo ragazzo, Jonah, un arpista e un genio.
         Per due anni ha fatto da spalla a un tizio di Beijing, una rockstar della musica classica.
         Ma poi non si sa perché ma Jonah sentiva la mancanza di casa ed è tornato per fare una carriera da solista.
         Le cose gli sono andate di merda.
         E man mano che gli studi gli sbattevano la porta in faccia, lui ha iniziato a perdere fiducia in sé e nella musica.
         Ora non so più dove sia, Jonah.
         Qualche compagna del Conservatorio giura di averlo visto mendicare.
         Nella chat dei lavoretti qualcuno dice che suona sotto pseudonimo per dei ricchi di merda.
         Una volta credo di averlo visto lavorare in un supermercato.
         Scusa, ama.
         Che pesantezza.
         Però sono qui che mi chiedo: cosa puoi fare quando sai fare bene solo una cosa ma il mondo non ti permette di farla?
         Accetti i compromessi o corri il rischio di morire di fame?
         O aspetti fino a quando non sia il mondo a decidere per te?
            
            + [Canta e balla. Domani è una cosa lontana.]
                 Mi sembra di sentire Talco con queste frasi.
                 Non che non aprezzi, ama.
                 Ma per me è da molto ormai che è <i>domani</i>.
                 Il conservatorio è finito da mesi, e io suono, ballo, ma non so ancora che cosa fare.
                    ~ firstYellow ++
                    
            + [È imperativo sopravvivere, troviamo sempre una soluzione.]
                 "Imperativo" rimettilo nel vocabolario, ora.
                 E voglio qualcosa di più che sopravvivere.
                 Lo voglio per tutte le persone!
                ~ firstBlue ++
                    
            + [Restati fedele e non ci sarà compromesso ma cambiamento.]
                 Ah, ci sta!
                 E a quel punto ogni decisione sarebbe la <i>mia</i> decisione.
                    ~ firstPurple ++
            
            + [Dona la tua musica senza chiedere e tutto arriverà.]
                 Forse in questo posto strano funziona così.
                 Ma nel mondo reale tutto prende e non dà nulla.
                 A parte l3 am3.
                 O dici che devo darli a loro i miei doni?
                 Mmm.
                 Ci devo pensare.
                    ~ firstGreen ++
           
            + [Mezzo compromesso è già una completa sconfitta.]
                 Top.
                 Eppure Jonah ha perso del tutto, comunque.
                 Con o senza compromessi.
                 Questa è l'unica soluzione?
                    ~ firstRed ++       
            
            -
         A proposito di cause perse: vado a cercarmi uno spritz.
         Ho proprio bisogno di staccare.
            ~ firstPauseTalking = firstCharPauseDuration
            -> main
        
    = seven
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    //Razionalità
        ~ firstStoryQuestCount ++
        
         Stavo ripensando al prof Ghiberti.#speaker:{firstChar_tag()}
         E prometto che non è un pippone a questo giro.
         Forse.
         Comunque: il Ghiberti vede tutta la musica come una cosa matematica.
         Non è una cosa nuova, ma di solito chi lo fa non rinuncia alla poesia.
         Per Ghiberti invece la musica e il mondo sono solo una combinazione di numeri.
         Una somma che dà sempre lo stesso risultato.
         Ma quanto sono basic quando dico queste cose?
         Tra l'altro una volta a vocina bassa ha giurato che il jazz è un errore.
        
            + [La prevedibilità <b>è</b> poetica. La cosa più rara al mondo.]
                 Allora non sono una persona poetica.
                 Se non c'è caos, imprevedibilità, mi annoio.
                    ~ firstBlue ++
                    
            + [Ognuna ha il suo modo di raggiungere la verità.]
                 Ci sta.
                 Ma non è troppo facile così?
                 Non è togliersi la responsabilità verso le altre persone?
                    ~ firstPurple ++
                    
            + [È un errore non giocare, e il jazz è musica che gioca.]
                 Top!
                 Anche se sicuro che ora si è preso un infarto.
                 Per me tutta la musica è gioco.
                 Basta smetterla di sentirsi stocazzo e perdersi con band e pubblico.
                ~ firstYellow ++
                
            + [Sembrano le parole di una persona ferita.]
                 Lo dice anche Talco.
                 Metti che voglio pure aiutarlo con questa ferita, cosa dovrei fare?
                 Rispettare la sua ossessione per le regole?
                 O sorprenderlo con del caos creativo?
                ~ firstGreen ++
                
            + [Ha paura di accogliere la potenza del disordine.]
                 Ci sta.
                 Anche se poi credo che il disordine sia solo una questione di prospettiva.
                 Alla lunga ci si abiuta e diventa difficile cambiare.
                 Un po' come quel casino che è camera mia.
                    ~ firstRed ++
            -
             ~ firstPauseTalking = firstCharPauseDuration
            -> main           
    = eight
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    ~ firstStoryQuestCount ++
        
         Giuro che non shippo il Ghiberti, ma continuo a pensare a quello che ci siamo dette prima.#speaker:{firstChar_tag()}
         E il Ghiberti sembra un uomo felice, sorride molto.
         Ma poi se lo guardi bene sembra il sorriso di un robot.
         O di uno che ha una Tesla.
         A me fa venire la caga quel sorriso, quel modo di fare.
         Tutti questi numerini e fattori tolgono l’esperienza, l’errore, il senso di comunità.
         Talco dice sempre che una comunità canta, ma per farlo deve sbagliare, essere imprevedibile.
         Che diavolo ci fai con una canzone fatta con la sola precisione?
         Tra ame sbagliamo sempre, e poi ci perdoniamo.
         Mentre il mondo del Ghiberti sembra come quella roba con l’AI, orecchiabile, prevedibile, dimenticabile.
         C'è una sola cosa che mi triggera le ovaie: tutte le cosine pratichine e calcolabili e precise.
         Sono roba morta.#speaker:{firstChar_tag()}
        {are_two_entities_together(SecondCharacter, PG):{charNameTwo}: Essere adulti è orribile.}  #speaker:{secondChar_tag()}     
            
            + [Una comunità sboccia quando c'è affetto e fiducia.]
                 Esatto!#speaker:{firstChar_tag()}
                 Una casa in campagna con l3 am3.
                 Un giardino.
                 Anna dice che è come fuggire dalle responsabilità.
                 Ma non è che possiamo salvare il mondo, noi.
                    ~ firstGreen ++
                
            + [Una comunità non regge senza senso pratico.]
                 Giuro ama che a volte mi triggeri tantissimo.#speaker:{firstChar_tag()}
                 Perché tutto è solo senso pratico per te?
                 Non è comunità la roba che hai in mente, ma una roba come una fabbrica.
                 E io non ci voglio vivere in una fabbrica.
                    ~ firstBlue ++
                    
            + [Una comunità resiste se segue un obiettivo superiore.]
                 Mood totale.#speaker:{firstChar_tag()}
                 Una comunità unita per rendere il mondo più giusto.
                 O trasformare qualcosa di terribile in un gioco.
                 E farlo esplodere.
                    ~ firstPurple ++
        
            + [Ciò che ci tiene unite è il giocare.]
                 Ah, ci sta!#speaker:{firstChar_tag()}
                 È  liberatorio ridere tutt3 assieme.
                 Forse dovrei solo far ridere il Ghiberti, e magari quel sorrisino finto si rompe.
                 Oppure mi schiatta sul posto.
                    ~ firstYellow ++
                    
            + [Ci si accresce nel dissenso e nella discussione.]
                 Amo noi.#speaker:{firstChar_tag()}
                 Ma non è manco male sedersi assieme al sole e chillare, ogni tanto, no?
                    ~ firstRed ++
     
            -
         Comunque non sono di certo qui per il Ghiberti e le sue paranoie matematiche.
         Ma per capire perché sono in questo posto.
         Mi prendo un po' di tempo per me, {name}.
            ~ firstPauseTalking = firstCharPauseDuration
            -> main
    
    = nine
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
        //Voglia di fare qualcosa di utile, importante
        ~ firstStoryQuestCount ++
        
         Non lo dire alla mentore, ma mi ci sto abituando a stare qui.#speaker:{firstChar_tag()}
         Anche se non sarebbe male avere almeno un pianoforte e del vinello.
         Però mi sembra che questo posto non cambia molto.
         Sembra il momento prima del temporale, quando l'aria frizza e sai che sta per arrivare ma non sai quanto sarà forte.
         E ti senti viva.
         Merda, faccio davvero schifo a parlare.
            
            + [È come una ninna nanna. Chissà cosa sognerai.]
                 La cosa preferita di Talco sono i pigiama party.
                 Chillare con l3 am3.
                 "Un sogno condiviso, sognando sognare."
                    ~ firstGreen ++
                    
            + [Non tanto a parlare ma ad arrivare al punto.]
                 Ama, mi ricordi perché continuo a raccontarti queste cose?
                 Ah, sì, perché siamo solo noi.
                 E la mentore.
                 E la mia noia.
                    ~ firstBlue ++
                    
            + [Ogni temporale toglie a qualcuna e dà a qualcun altro.]
                 Ah, ci sta!
                 Come le piante nella serra.
                 Che mi sembra crescono con la terra e le nostre paturnie.
                 Per poi darci in cambio forme assurde e idee.
                    ~ firstPurple ++
                    
            + [O come il momento prima di una battaglia.]
                 A te piace menare le mani, {name}?
                 Ma non è roba mia, andare a fare battaglie.
                 Tutte le cose di guerra mi fanno solo incazzare.
                 Mi sembra solo un modo idiota per vedere chi ce l'ha più grosso.
                 E manco tra la gente che poi muore.
                 Cringe.
                    ~ firstRed ++
                    
            + [Qui l'aria sa di mare e zucchero filato!]
                 Vero? Che è assurdo, perché non ho visto il mare da nessuna parte.
                 Né dello zucchero filato.
                 Ma ora ho fame.
                 E voglia di farmi un giro sull'ottovolante.
                    ~ firstYellow ++         
    
            -
         Vabbè.
         Credo me ne starò qui ad aspettare questo finto temporale.
             ~ firstPauseTalking = firstCharPauseDuration
            -> main   
    = ten
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    ~ firstStoryQuestCount ++
        
         Comunque non è che penso solo a me stessa ama, giuro.#speaker:{firstChar_tag()}
         L'anno scorso abbiamo occupato un parco per una settimana.
         Il comune voleva distruggere gli alberi, e volevamo fare qualcosa di decente per una buona volta.
        {are_two_entities_together(SecondCharacter, PG):{charNameTwo}: La prossima volta voglio aiutarvi!}#speaker:{secondChar_tag()}
        {are_two_entities_together(SecondCharacter, PG): Sarai il primo a venire chiamato, promesso!} #speaker:{firstChar_tag()}        
         La prima notte non abbiamo manco sentito il freddo da quanto eravamo prese bene.
         Però poi il mood si è spento.
         Diverse se ne sono andate, e chi è rimasta non aveva più la spinta. Zero.
         L'ultima sera c'è stato un momento di totale silenzio.
         Non si sentiva la pula, nessuna cantava, persino gli scoiattoli erano fermi.
         E a quel punto ho sentito il canto degli alberi.
         Giuro, ama!
         E quando ho iniziato a cantare con loro mi sono sentita viva.
        
            + [Forse gli alberi qui conoscono la storia della tua lotta.]
                 Non è per flexare, ma sarebbe bello.
                 Però allora gli chiedo anche come tornare a casa.
                 Non so più quanto voglio restare quì.
                 Senza offesa, ama.
                    ~ firstGreen ++
                
            + [Hai anche danzato con gli alberi?]
                 Non avevo preso i funghetti, no.
                 Ma avrei apprezzato molto, ama.
                 Anzi no, forse non l'avrei fatto.
                 Muovermi a volte mi sembra che rompa le cose.
                    ~ firstYellow ++
                    
            + [Sei tu che hai lottato per gli alberi, o loro per te?]
                 Ti shippo totale.
                 Talco direbbe che ci siamo aiutate a vicenda. E non solo.
                 Che la separazione è solo una illusione, o roba del genere.
                 Che una melodia non esiste senza tutte le sue note.
                    ~ firstPurple ++
            
            + [Gli alberi "cantano" per allarmare altri alberi.]
                 Ama, tu sai uccidere il mood come poche persone al mondo.
                 Quindi secondo te ero immersa in un coro di disperazione?
                 Ora mi metto a urlare anche io.
                    ~ firstBlue ++
                
            + [Come ti sei sentita a combattere per qualcun altro?]
                 Motivata.
                 Motivata fino al cuore.
                 L'avrai notato, faccio un po' cagare a spiegare le cose.
                 Ma in quel momento sapevo che stavo facendo qualcosa che aveva un senso.
                 Qualcosa di importante non solo per me.
                    ~ firstRed ++
            -    
         Comunque la storia poi è finita male, ovvio.
         I poliziotti ci hanno trascinate e bastonate e schedate.
         E soprattutto hanno tagliato gli alberi.
         E sono tornata a sentirmi inutile.
            ~ firstPauseTalking = firstCharPauseDuration
            -> main
    
    = eleven
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
        //Famiglia d'origine
        ~ firstStoryQuestCount ++
        
         Ti racconto una cosa idiota. La passione per la musica l'ho presa da mio papà.#speaker:{firstChar_tag()}
         Lo stesso uomo che ora vorrebbe cercassi un "lavoro vero".
         Casa è piena di vecchi strumenti che nessuno tocca da anni.
         Sono del nonno paterno.
         Papà li tiene come se fossero delle reliquie.
         Da piccola ogni tanto mi lasciava sentire le vecchie registrazioni, di quando nonno suonava e cantava nelle balere.
         Nonno era un chad totale.
         A volte papà ballava con me e mamma.
         E rideva un sacco.
         Non il suo sport preferito.
        
            + [L'inferno è uno strumento che non può suonare.]
                 Adoro.
                 Non avrei saputo dirlo meglio.
                 Ogni tanto li rubavo e suonavo in camera.
                 Alcuni avevano un suono storto, forse per colpa delle tarme.
                 Però ho sempre amato le cose un po' rotte perché hanno una storia tutta loro.
                    ~ firstPurple ++
                    
            + [E ora accresci l'albero della tua famiglia.]
                 Più o meno.
                 Per nonno la musica era fatta per unire, salvare il mondo forse.
                 Quando ci viene da ballare e cantare ci passa la voglia di litigare, no?
                    ~ firstGreen ++
                    
            + [Credi che tuo padre si sia arreso?]
                 Merda, ci vai giù piano {name}!
                 Non ci crederai, ma no, secondo me no.
                 Lui è davvero felice di ciò che fa.
                 Il problema è che pensa che visto che le cose che fa lo fanno felice, allora tutti devono essere felici facendo le cose che fa.
                 Non ci avevo pensato, ma ora ho capito da dove gli vengono certe idee politiche di merda.
                    ~ firstRed ++
                    
            + [Ti va di ballare con me?]
                 Sì ama!
                 Forse non ora però.
                 Questa cosa della chitarra inizia a pesarmi.
                    ~ firstYellow ++
                    
            + [Esistono lavori veri e lavori non veri?]
                 Sei tu la persona seria, no?
                 Se la vedi come mio padre la risposta è <i>sì</i>.
                 E non casualmente i lavori non veri sono tutti quelli che mi piacciono.
                    ~ firstBlue ++
            -
            
         Lasciamo un po' solo ora, {name}.
         Perché sto entrando in fase lamentosa e non ho voglia di cringiarti.
            ~ firstPauseTalking = firstCharPauseDuration
            -> main
            
    = twelve
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    ~ firstStoryQuestCount ++
    
         Comunque in merito a quello che ti dicevo prima, ama: non è che papà sia un mostro, sia chiaro.#speaker:{firstChar_tag()}
         Mamma è più cinica di papà.
         Le sono grata, quello sicuro: è lei che ha convinto papà a farmi fare il conservatorio.
         Ma per farmi diventare una Lang Lang, Mitsuko Uchida, Alfred Brendel.
         Prestigio, onoreficienze e denaro.
         Lib totale lei, totale.
         Ma chi glielo dice che a ventitrè anni per queste cose sono già vecchia?
        {are_two_entities_together(SecondCharacter, PG):{charNameTwo}: Moooooolto vecchia!}#speaker:{secondChar_tag()}       
         Se quello è l'obiettivo, ho proprio preso la strada sbagliata.#speaker:{firstChar_tag()}
        
            + [Tua mamma vuole il tuo o il suo di bene?]
                 A mia madre interessa solo il nome della famiglia.
                 Come se poi fosse prestigioso.
                 Un po' mi spiace perché mi rendo conto che lei ci tiene proprio a sembrare una di quelle fighe.
                 Ed è l'unica a non accorgersi che può fare tutte le cose più assurde del mondo, ma tanto nessuno la considererà una al top.
                 Povera.
                    ~ firstGreen ++
                    
            + [Loro hanno fatto concerti prima della maggiore età.]
                 Grazie per avermelo ricordato.
                 Ne avevo davvero bisogno.
                 Ora dimmi che sono fallita e così posso appendere il piano al muro.
                 E non dirmi che non si può appendere un pianoforte al muro o giuro che ti rompo i timpani urlando.
                    ~ firstBlue ++
                
            + [La strada sbagliata è quella con più insegnamenti.]
                 non un nome ma un dispenser di aforismi.
                 Però in qualche modo ha senso.
                 Ma presto o tardi dovrò pure capire come mangiare, e a quel punto cosa me ne faccio di tutte le strade sbagliate del mondo?
                        ~ firstRed ++
                        
            + [Ma loro si divertono, quando suonano?]
                 Tanto, ama.
                 Prendi Uchida: quando suona è una gioia per gli occhi.
                 Anche se forse non lo chiamerei proprio divertimento.
                 Se ne va in un altro luogo, un mondo che non ho ancora trovato.
                 Forse è questo qui?
                 Sto suonando e sono così rincoglionita da non averlo realizzato?
                    ~ firstYellow ++
                    
            + [Cambiamo sempre, ma non diventiamo mai chi non siamo.]
                 Un'altra frase così e mi crusho tantissimo per te.
                 Ma prima vallo a dire a mia madre.
                 Ama: mi fa male con queste cose ma non se ne rende nemmeno conto.
                 È come se mi dicesse sempre che sono sbagliata.
                    ~ firstPurple ++
            -    
            
         E con questa, ho finito di sputtanare la mia famiglia.
          Vado a deprimermi da qualche parte.
            ~ firstPauseTalking = firstCharPauseDuration
            -> main

  
        



 === first_story_gift ===
~ temp charNameOne = translator(firstCharacterState)
<i> Stai per donare qualcosa a {charNameOne}.</i> #speaker:{fungus_tag()}
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
      ~ temp charNameOne = translator(firstCharacterState)
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
~ temp charNameOne = translator(firstCharacterState)
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
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
         Ho capito una cosa su di noi, ama.#speaker:{firstChar_tag()}
        {
            -   are_two_entities_together(Mentor, PG):{charNameFive}: Sicuro è il caso che vi lasci il vostro spazio.#speaker:{fifthChar_tag()}
                    ~ change_entity_place(Mentor)
        }
        {
            -   are_two_entities_together(SecondCharacter, PG): {charNameTwo}, ci lasceresti da sole per poco?#speaker:{firstChar_tag()}
                    ~ change_entity_place(SecondCharacter)
        }        
        
            -> firstAffinityCalc ->
        {
        - firstPurple && firstYellow > firstBlue:  Talco continua a mancarmi, ma con te mi sento come se fossimo parte da sempre della stessa band.#speaker:{firstChar_tag()}
        
        <i>{charNameOne} vede {name} come una persona amica e fidata.</i> #speaker:{fungus_tag()}
        
        -firstPurple or firstYellow > firstBlue: Non sei mica male, sai? Mi sembra che cantiamo un po' la stessa canzone.#speaker:{firstChar_tag()}
        
        <i>{charNameOne} si trova bene con {name}.</i> #speaker:{fungus_tag()}
        
        - firstPurple && firstYellow < firstBlue:  Non è che ci capiamo molto noi due, sai? È come se io suonassi Chopin e tu la lambada. Una lambada noiosa.#speaker:{firstChar_tag()}
        
        <i>{charNameOne} non si è sentita capita da {name}.</i> #speaker:{fungus_tag()}
        
        
        - else:  Siamo un po' in modalità random, vero? A volte ci avviciniamo, a volte ciaone proprio, tutta una musica diversa.#speaker:{firstChar_tag()}
        
        <i>{charNameOne} non riesce a capire che rapporto sta costruendo con {name}.</i> #speaker:{fungus_tag()}
        
        }
        
         Comunque: credo di aver capito perché il mio nome qui è {charNameOne}.#speaker:{firstChar_tag()}
         Penso al Ghiberti.
         Penso all3 am3.
         Penso alla mia famiglia.
         Non so se l'hai visto, ma tutta questa roba mi fa pressione.
         Tutte le persone che conosco mi stanno chiedendo di fare una scelta, di decidere che cosa fare da grande.
         Ma sinceramente, {name}?
         Mi cago addosso all'idea di fare una scelta.
         Perché una scelta chiude strade.
         Perché una scelta delude persone.
         Perché una scelta può portarti su strade sbagliate.
         E a quel punto, non si può più tornare indietro.
         E così l'unica cosa che rimane è rinunciare.
         Lasciare che le altre persone scelgano per te.
         O che lo faccia il mondo.
         Ecco perché mi chiamo {charNameOne}: perché rimango nel medio, nella cosa più ovvia e cringe.
         E lascio che le cose accadano.
            ~ growing ++
            
            + [Credo di sapere come aiutarti.]
                -> statement
            + [Capisco il tuo dolore, ma ho bisogno di riflettere un attimo.]
                -> main


    = statement
    ~ temp charNameOne = translator(firstCharacterState)
        <i>A seguito del rapporto che {name} ha creato con {charNameOne} {firstPurple && firstYellow > firstBlue: l'inchiostro è aumentato di due unità|{firstPurple or firstYellow > firstBlue: l'inchiostro è aumentato di una unità|l'inchiostro non ha subito variazioni}}.</i>
        //Sopra ho già aggiornato il livello di inchiostro e quindi di affinità.
            ~ inkLevel(firstCharacterInkLevel)
        + [Voglio cominciare la riscrittura.]
            -> firstNaming ->
            -> one
        + [Preferisco prendermi del tempo.]
            -> main

    = one
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    {
        -   are_two_entities_together(Mentor, PG):{charNameFive}: Bene, è il momento che mi allontani.#speaker:{fifthChar_tag()}
                ~ change_entity_place(Mentor)
    }
    {
        -   are_two_entities_together(SecondCharacter, PG): {charNameTwo}, avremmo bisogno di privacy, puoi andare a fare due passi?#speaker:{firstChar_tag()}
                ~ change_entity_place(SecondCharacter)
    }
    
    Prima hai detto che hai il terrore di fare una scelta. #speaker:{PG_tag()}
        
        + [Qui hai accettato il tuo nuovo nome.]
            Accettare è una scelta.
            Cercare risposte è un'altra scelta ancora.
            E ammettere una propria paura, una scelta enorme.
                {
	                - firstCharacterPossibleStates hasnt Violino:
		                ~ firstCharacterPossibleStates ++
	                    {debugChangeName: Aumento lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }            
        
        + [Ma hai deciso di costruire una famiglia con l3 tu3 am3.]
            Hai aperto il tuo cuore, e loro ti amano.
            Si preoccupano per te, cercano di aiutarti a trovare la tua strada.
            E questo amore è frutto di infinite piccole scelte fatte ogni giorno.
        
        + [Dimenticando che per finire gli studi hai lottato per anni.]
            Che ogni esame che hai dato è stata una scelta.
            Che ogni lezione che hai seguito è stata una scelta.
            E presto o tardi, hai trovato la volontà di continuare.
            
        + [Ma hai più volte accettato il rischio di suonare sul tetto.]
            Hai accettato di essere festa in un mondo severo.
            Hai cercato il gioco quando tutto ti dice che devi lavorare.
            Hai accolto falene, scoiattoli e altri animali suonanti.
                {
	                - firstCharacterPossibleStates hasnt Violino:
		                ~ firstCharacterPossibleStates ++
	                    {debugChangeName: Aumento lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }
        + [Però da che sei qui hai esplorato tutto questo luogo.]
            Hai inseguito uno scoiattolo.
            Hai cercato Talco.
            Non ti sei fatta spaventare dalla novità.
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
    ~ temp charNameOne = translator(firstCharacterState)
    Temi che le persone a cui vuoi bene si sentano tradite dalla scelta che farai.

        + [Con Talco puoi litigare, eppure siete legatissim3.]
            Pensi davvero che ti accuserebbe di tradimento solo perché hai deciso di decidere per te stessa?
            Lə Talco che hai raccontato si arrabbierebbe di più se tu facessi una scelta per te pensando a ləi.
            
                    
        + [La paura di tradire è un'altra faccia dell'ego.]
            È la voglia di sembrare impeccabili.
            Infallibili.
            Inattaccabili.
            Ma amore e crescita prosperano nell'errore e nella vulnerabilità.
                {
	                - firstCharacterPossibleStates hasnt Violino:
		                ~ firstCharacterPossibleStates ++
	                    {debugChangeName: Aumento lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }
    
            
        + [Ti preoccupi molto di loro, e poco di te.]
            Non ti sei chiesta molto dove eri, ti sei messa solo a cercare Talco.
            Ti sei preoccupata per Jonah.
            Ma per te?
            
        + [Forse accadrà, ma non è un tuo problema.]
            Stai costruendo la tua vita, non la loro.
            Se la pensano diversamente, non è amicizia, e ti sei salvata da qualcosa di peggiore.
                {
                	- firstCharacterPossibleStates hasnt Chitarra:
    		            ~ firstCharacterPossibleStates --
    		           {debugChangeName: Diminuisco lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }
                
        + [Tradiamo la fiducia se rompiamo le regole a nostro vantaggio.]
            Hai deciso di giocare con loro e lasciar loro tutto il potere?
            O è una regola implicita, che non avete mai concordato ma che senti nell'aria?
            E a prescindere: abbiamo sempre il diritto di revocare un accordo, una regola.
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
    ~ temp charNameOne = translator(firstCharacterState)
    Vedi una scelta come una strada chiusa, qualcosa da cui non poter tornare indietro.

            
        + [Se non tiri nessun dado, non c'è storia da far avanzare.]
            Quando giochi non sempre le cose vanno come vuoi, ma comunque <i>vanno</i>.
            E fintanto che le cose hanno di dove andare, c'è tempo per cambiare.
            E a volte anche ritirare i dadi.
                {
	                - firstCharacterPossibleStates hasnt Violino:
		                ~ firstCharacterPossibleStates ++
	                    {debugChangeName: Aumento lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }
        
        + [Tutt3 hanno immaginato sorti diverse per Jonah, ma nessuna fine.]
            Ogni passo avanti prevede la possibilità di tornare indietro.
            A volte è più difficile, a volte meno, ma è sempre possibile.
                {
                	- firstCharacterPossibleStates hasnt Chitarra:
    		            ~ firstCharacterPossibleStates --
    		           {debugChangeName: Diminuisco lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }
                
        + [Eppure la prima cosa che hai visto qui sono otto sentieri.]
            Otto luoghi dove andare.
            E ogni sentiero ha una direzione in cui andare, e una da cui tornare.
            A volte l'erba può essere cresciuta.
            A volte l'acqua può averne cancellato un pezzo.
            Ma il sentiero è sempre lì, ad aspettare.
                {
	                - firstCharacterPossibleStates hasnt Violino:
		                ~ firstCharacterPossibleStates ++
	                    {debugChangeName: Aumento lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }
            
        
        + [A suo modo, la storia di Jonah è un successo.]
            Ha deciso che non gli stava più bene quello che aveva, e si è mosso per cambiarlo.
            E il leggere negativamente le cose che forse gli sono capitate raccontano nulla di Jonah e molto di chi le racconta.
            C'è orgoglio anche dietro una cassa del supermercato, non solo su palco.
                
        + [Ragioni come se fossi sola se dovessi cadere.]
            Pensi che Talco ti abbandonerebbe?
            Anna? Olga? Persino Ennio.
            I tuoi genitori.
            Anche se a volte i vostri cuori sono distanti, quando c'è un bisogno sappiamo sempre ritrovarci.            
        -
        {
        - firstCharacterInkLevel == Normal:
            -> ending
        - else: 
            -> four
        }
    
    = four
    ~ temp charNameOne = translator(firstCharacterState)
        {name} Questo posto ti ha assegnato un nome, e quel nome è Chitarra. Ma tu lo vedi come una rinuncia.

        + [Giocare è bello perché puoi sempre rinunciare a farlo.]
            Quando una roba la devi fare anche quando non vuoi, quello è il lavoro.
            Per questo fa schifo.
                {
	                - firstCharacterPossibleStates hasnt Violino:
		                ~ firstCharacterPossibleStates ++
	                    {debugChangeName: Aumento lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }            
         
        
        + [Quando Anna ha rinunciato all'ex, è rinata.]
            Rinunciare vuol dire anche prendersi cura di sé.
            Un atto d'amore quando qualcosa non ci fa più bene.
        
        + [Un infinito più piccolo resta comunque infinito.]
            Rinuncia a una cosa e sarai comunque tutto.
            Un nome è solo un nome.
            Una persona è un universo intero.
                {
	                - firstCharacterPossibleStates hasnt Violino:
		                ~ firstCharacterPossibleStates ++
	                    {debugChangeName: Aumento lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }    
            
        + [Rinunciando a cercare Talco ti sei tutelata.]
            Se una cosa non ha senso, non ha senso anche se continuiamo ad insistere nel farla.
                {
                	- firstCharacterPossibleStates hasnt Chitarra:
    		            ~ firstCharacterPossibleStates --
    		           {debugChangeName: Diminuisco lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }            
        
        + [C'è più coraggio nella rinuncia che nel compromesso.]
            Spesso è più costosa, ma la coerenza personale non ha prezzo.
            
        -
        
        -> ending

    = ending
    ~ temp charNameOne = translator(firstCharacterState)
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
        
     Grazie, {name}.#speaker:{firstChar_tag()}
     Mentre ti ascoltavo mi è nata una nuova canzone in testa.
     La canzone del mio nome.
        
        {
            - firstCharacterPossibleStates has Chitarra:
                 Non vorrei deluderti, ma <b>resterà Chitarra</b>, perché l'unica cosa che posso fare è non fare nulla e lasciare che le cose accadano.
                 Perdonami il cringe, ma non posso fare diversamente.
            
            - firstCharacterPossibleStates has Triangolo:
                 E il mio vero nome è <b>Triangolo</b>, perché pensavo di essere uno strumento, e invece ho solo fallito.
                    ~ firstCharacterState = ()
                    ~ firstCharacterState += Triangolo
            
            - firstCharacterPossibleStates has RagazzaOrchestra:
                 Mi chiamerò <b>Ragazza Orchestra</b>: nel non saper rinunciare sono diventata l'ornitorinco della musica.
                    ~ firstCharacterState = ()
                    ~ firstCharacterState += RagazzaOrchestra
            
            - firstCharacterPossibleStates has FlautoDolce:
                 Il mio nome è <b>Flauto Dolce</b>: perché semplice, elementare, ma apprezzata da chi ha buon cuore.
                    ~ firstCharacterState = ()
                    ~ firstCharacterState += FlautoDolce                
            
            - firstCharacterPossibleStates has Ocarina:
                 Mi chiamerò <b>Ocarina</b>: perché il suo suono è gioco e festa.
                    ~ firstCharacterState = ()
                    ~ firstCharacterState += Ocarina
            
            - firstCharacterPossibleStates has Violino:
                 Io sono <b>Violino</b>: perché anche se suono bene da sola, do il meglio di me stessa suonando con e per gli altri.
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
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    
        C'è una cosa che devo dirti ama.#speaker:{firstChar_tag()}
        Riguarda {charNameFive}.
        Non voglio sembrare una snitch ma continuo a chiedermi: qual è il confine tra essere una brava persona ed essere una manipolatrice?
        A me non la conta giusta quella.
        Però tra un po' mi potrò levare di culo e non è più un mio problema.
        Ma se hai intenzione di restare qui a lungo, forse devi chiedertelo anche tu.
            ~ firstStory = Ended
            ~ movementsCounter = 0
            ~ PG_advace_management(firstStoryPG)
                -> main
            
    = exit
    ~ temp charNameOne = translator(firstCharacterState)
        E ora resterò qui a romperti le gonadi ancora per un po', in attesa del prossimo treno.#speaker:{firstChar_tag()}
            ~ firstStory = Ended
            ~ movementsCounter = 0
            ~ PG_advace_management(firstStoryPG)
        -> main  
    
=== first_char_story_ended
~ temp charNameOne = translator(firstCharacterState)
//Con questa formula dopo un tot di scambi la personaggia se ne va salutandoci.
//In alcune situazioni questa cosa non c'è, in altre c'è solo se ho determinati status (es: socievole). In altri non c'è la possibilità che la personaggia se ne vada senza averci salutate (e quindi non c'è l'opzione in story_start)

    {
        - firstCharEndingDialogue < 4:
            -> top
        - else:
            -> goodbye
    }
    
        - (top)
        {~ Quanto mi prenderà per il culo Talco, quando lə racconterò tutta questa storia?|Comunque in questo posto dovreste mettere almeno un piano bar.|Se lo dico all3 am3 del conservatorio mi fanno il culo, ma vado pazza per le k-pop night.|Ma tu l'hai vista quella strana rana nello stagno?}#speaker:{firstChar_tag()}
                ~ firstCharEndingDialogue ++
        -> main
        
        = goodbye
        ~ temp charNameOne = translator(firstCharacterState)
        Ama: è il momento di tornare a casa.#speaker:{firstChar_tag()}
        {firstCharacterPossibleStates hasnt Chitarra: Non ho idea di che cosa accadrà, sinceramente, ma almeno ora mi sento pronta.}
        {firstCharacterPossibleStates hasnt Chitarra: E non cringiare ma: grazie. Mi hai dato una mano enorme. Me lo ricorderò.}
        {firstCharacterPossibleStates has Chitarra:Vedremo cosa mi accadrà.}
            
            ~ move_entity(FirstCharacter, Safekeeping)
            //Abbiamo accesso alle note solo se è cambiata. Sennò lei se ne va abbastanza arresa da tutto.
            

            
        -> main




=== first_character_opinions
~ temp charNameOne = translator(firstCharacterState) 
    //Le sue opinioni comunque ci fanno capire meglio il modo in cui vede il mondo e parte della sua vita fuori da qui.
    {~ Talco dice sempre che bisogna sporcarsi le mani per capire il mondo.|Se proprio devo restare qui, tiro su una band con le api. Sono troppo chaddone loro.|Comunque il Ghiberti ha una moglie che è stra in gamba. Forse a volte ci si deve compensare. E visto che Talco è svegliə, io allora sono l'idiota della cumpa.|Resti tra noi, ma il Conservatorio è un posto del cazzo. C'è una competitività che non c'entra nulla con la musica.|Mi scoccia litigare con mio padre, ma io e il suo modo di fare NON. ANDIAMO. D'ACCORDO. Zero, ama. Zero.}#speaker:{firstChar_tag()}
        ~ firstPauseTalking = firstCharPauseDuration
            -> main











