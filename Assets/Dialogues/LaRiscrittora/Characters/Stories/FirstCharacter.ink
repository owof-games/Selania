~ temp charNameUno = uppercaseTranslator(firstCharacterState)
TODO: a testi conclusi, cambia in modo randomico ordine delle risposte.
=== personaggia_uno ===
    //SPAZIO PER VERIFICARE SE STORIA IN CORSO O CONCLUSA
            //Chiacchiera normale
            + {are_two_entities_together(FirstCharacter, PG) && firstStory == Active}[FirstCharacter]
                -> talk_with_first_character
            
            //Chiacchiera a fine storia
            + {are_two_entities_together(FirstCharacter, PG) && firstStory == Ended} [FirstCharacter]
                -> personaggia_uno_storia_conclusa
            + ->
        
            -> DONE



=== talk_with_first_character
~ temp charNameUno = uppercaseTranslator(firstCharacterState)
            {//Se prima chiacchierata
                - not knowing_first_character.one:
                    -> knowing_first_character.one
            //Se prima chiacchierata fatta e passato abbastanza tempo dalla pausa prevista        
                - firstPauseTalking == 0:
                    -> intro_chat
            //Altre opzioni        
                - else:
                    ->first_character_opinions
            }

= intro_chat
~ temp charNameUno = uppercaseTranslator(firstCharacterState)
    {charNameUno}: {~ Ero sicura di aver visto una farfalla.|Non male questo posto, anche se casa mi manca.|Non son sicura di star capendo tutto di questo luogo.}
            + [Ti va di raccontarmi qualcosa di te?]
                -> knowing_first_character
                
                
            //Se non ho ancora fatto il dono e NON ho parlato col mentore e ho parlato abbastanza con lei
            + {firstStoryQuestCount > minStoryQuesTCount && not first_story_gift.ink_outcome && not gifts_and_ink && findedGifts != ()} [Ho trovato questa cosa e vorrei donartela.]
                    {charNameUno}: Sai, è gentile da parte tua, davvero.
                    {charNameUno}: Ma credo che tu non abbia ancora chiesto al mentore come queste cose funzionino.
                    {charNameUno}: Forse conviene che prima parli con lui.
                        -> main
            
            //Se non ho ancora fatto il dono e ho parlato con il mentore e ho parlato abbastanza con lei
            + {firstStoryQuestCount > minStoryQuesTCount && not first_story_gift.ink_outcome && gifts_and_ink && findedGifts != ()} [Ti vorrei donare questa cosa.]
                     ~ currentReceiver += FirstCharacter
                    -> first_story_gift
        
            //QUESTA OPZIONE C'è SOLO DOPO CHE HO FATTO IL DONO E NON HO ANCORA AVVIATO LA MAIN STORY
            + {first_story_gift.ink_outcome && not main_story_first_character} [Credo tu abbia un problema, e potrei aiutarti ad affrontarlo.]
                {
                    - not questions:
                    {uppercaseTranslator(firstCharacterState)}: Ti chiedo un ultimo sforzo, parla direttamente col mentore prima. Io non scappo.
                        -> main
                    - questions:
                        {uppercaseTranslator(firstCharacterState)}: Certo!
                        -> first_story_chech_trigger
                }        
    
            //SE ESCO DALLA MAIN STORY E VOGLIO TORNARCI CLICCO QUI. POI Lì DENTRO IN BASE AGLI STEP IN CUI SIAMO, MI MANDERà AL POSTO GIUSTO            
            + {first_story_gift.ink_outcome && main_story_first_character} [Riprendiamo quella storia?]
                -> main_story_first_character
            
            + [Lasci il dialogo.]
                -> main
            -
            -> talk_with_first_character
    
=== knowing_first_character
~ temp charNameUno = uppercaseTranslator(firstCharacterState)
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
            - else:
                -> first_character_opinions
        }

    = one
    ~ temp charNameUno = uppercaseTranslator(firstCharacterState)
        //Presentazione.
        ~ firstStoryQuestCount ++
        
        ???: Non è che hai visto passare di qui una persona?
        ???: Altə all’incirca una balla di fieno e che si muove come un violino, probabilmente presə a stordire di domanda quel tizio, il mentore.
        ???: Oh, non posso essere arrivata qui da sola, vero? Qualsiasi cosa sia <i>qui</i>.
        ???: Come lə trovo?
            + [Prova a darmi dei dettagli più concreti.]
                    ~ firstBlue ++
                ???: Concreti?
                ???: Si muove. Respira. Mangia. Saltella. Canta.
                ???: A volte tutte queste cose assieme.
                ???: E ha molta fantasia.
                ???: Ma non so se sia il tuo forte.
            + [Se è come un violino, magari ha bisogno di un tamburo per tornare.]
                    ~ firstYellow ++
                ???: Non ci avevo pensato!
                ???: Ma il suo violino è più da pianoforte.
                ???: Forse potrei cercare nella serra, e trovare qualcosa da suonare.
                ???: Mi piace comunque il tuo modo di pensare!
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ firstRed ++
                ???: Ha senso, ma Talco non è persona da azione.
                ???: Si muove nello spazio come se fosse vento.
                ???: E lascia alle sue spalle l'odore della primavera.
            + [Se ti senti sola, puoi parlare con me, mi farebbe piacere.]
                ~ firstGreen ++
                ???: È una cosa molto gentile, davvero.
                ???: Ma è come chiedermi di fare un concerto con una persona sconosciuta.
                ???: Ci vuole tempo per mostrare la mia anima.
            + [Se è qualcunə a cui vuoi bene, è sempre con te.]
                ~ firstPurple ++
                ???: Grazie.
                ???: Avevo bisogno di queste parole.
                ???: Ora lə sento più vicinə, anche se ho comunque bisogno di un suo abbraccio.
                ???: Cavolo.
            -
        ???: Talco, dimmi che sei qui anche tu, ti prego, non so capire il mondo senza di te.
        ???: Ma che rinco che sono, non mi sono manco presentata: io sono {charNameUno}.
        {charNameUno}: No, io sono {charNameUno}.
        {charNameUno}: Ehi! Non è questo il mio nome.
        {charNameUno}: <i>{charNameUno}</i>.
        {charNameUno}: Forse se provo a dirlo al contrario?
        {charNameUno}: Aicnunir.
        {charNameUno}: Uh.
        {charNameUno}: Prova tu. Come ti chiami?
    	    + {name_choice} [Mi chiamo {name}.]
    	    + [Il mio nome è...]
    	        -> name_choice ->
    	    -
    	{charNameUno}: E con che pronomi vuoi che ti chiami?
    	        -> gender ->
        {charNameUno}: {name}, secondo te il nome di una persona è qualcosa di importante?
    	    + [È utile, altrimenti come ci chiamiamo?]
    	        {charNameUno}: Tu devi essere la persona più divertente della festa, vero?
    	        {charNameUno}: Anche se immagino che una visione pratica abbia dei vantaggi.
    	        {charNameUno}: O per lo meno, faresti felice mio padre.
                    ~ firstBlue ++
            + [Solo se può continuamente cambiare.]
                {charNameUno}: Ah ah ah!
                {charNameUno}: Adoro.
                {charNameUno}: Passo le giornate a cambiare melodie, e non avevo mai pensato di cambiare il mio nome!
                    ~ firstYellow ++
            + [È uno strumento di controllo.]
                {charNameUno}: O uno strumento d'amore.
                {charNameUno}: Pensa a tutti i modi in cui qualcuno lo può gridare.
                    ~ firstRed ++
            + [È un dono della tua famiglia, un ricordo che resta con te.]
                {charNameUno}: Non ci avevo mai pensato.
                {charNameUno}: Non per tutt3 è un piacere, questa cosa.
                {charNameUno}: E per alcune persone il nome è qualcosa che si sceglie.
                {charNameUno}: Una liberazione.
                    ~ firstGreen ++
            + [Solo se sei tu a definirne il significato e non altri.]
                {charNameUno}: Tu si che sai guardare al cuore delle cose!
                {charNameUno}: Eppure ora mi ritrovo con un nome nuovo.
                {charNameUno}: E non so cosa significhi, cosa doverci fare.
                    ~ firstPurple ++
            -
       {charNameUno}: Comunque sì, ti si addice benissimo, hai proprio una faccia da {name}.
       {charNameUno}: Ma forse la mia faccia è cambiata? Ti sembro una {charNameUno}?
            + [No, la faccia è una cosa che hai anche se non avessi un nome.]
                {firstBlue > 1: {charNameUno}: {name}, sai che ogni tanto puoi scendere da ovviolandia, vero? }
                {charNameUno}: Forse dovrei chiamarti Linea.
                {charNameUno}: Anzi, Quadrato.
                {charNameUno}: Perché neanche a volerlo sai rotolare troppo lontano dalla superficie delle cose.
                    ~ firstBlue ++
            + [Quindi possiamo cambiarci la faccia solo cambiando di nome?]
                {firstYellow > 1: {charNameUno}: {name}, tu e io faremo amicizia presto!}
                {charNameUno}: Cavolo, passerei le giornate a essere chiunque!
                {charNameUno}: E forse ora potrei essere Talco.
                {charNameUno}: Dove sei, Talco?
                    ~ firstYellow ++
            + [A te va bene essere {charNameUno}? Perché non essere Lotta? Azione?]
                {firstRed > 1: {charNameUno}: Ho l'impressione che tu prenda tutto di pancia, vero?}
                {charNameUno}: {charNameUno} non è il mio vero nome, ma non trovo più il mio.
                {charNameUno}: E poi, parlare con te non è già una forma di azione?
                    ~ firstRed ++
            + [Talco cosa direbbe di questo nome?]
                {firstGreen > 1: {charNameUno}: Ancora non ci conosciamo, ma ho l'impressione che tu sappia parlare molto col cuore.}
                {charNameUno}: Questa è una domanda molto tenera.
                {charNameUno}: Ma la risposta lo sarebbe meno.
                {charNameUno}: Talco è una persona che agisce, non resta ad aspettare.
                    ~ firstGreen ++
            + [Rinunciare al superfluo può avvicinarci alla natura delle cose.]
                {firstPurple > 1: {charNameUno}: Le tue parole mi aiutano a sentire un po' meno la solitudine di questo luogo.}
                {charNameUno}: Ho pensato subito che {charNameUno} avesse un valore negativo.
                {charNameUno}: Dimenticandomi che in ogni brano il silenzio è parte fondamentale.
                {charNameUno}: Grazie, {name}. La tua saggezza è illuminante.
                    ~ firstPurple ++
            -
       {charNameUno}: Come mi dovrei chiamare secondo te?
    	    + Scelta non possibile (variazione se abbiamo o meno parlato col mentore)
    	-
        {charNameUno}: Interessante.
        {charNameUno}: Forse quel mentore può aiutarci a capire qualcosa?
        {charNameUno}: O forse va bene così.
        {charNameUno}: Forse mi serve questa confusione. Forse sto suonando da troppo tempo la solita canzone, ma non è più la mia.
        {charNameUno}: Forse devo trovare nuove note, o un nuovo strumento.
        {charNameUno}: O forse questo luogo ha bisogno della mia musica?
        {charNameUno}: L’unica cosa certa è che ho bisogno di Talco.
        {charNameUno}: Tu l’hai visto?
        {charNameUno}: No, non dirmelo, sono sicura che lə troverò nel bosco.
        {charNameUno}: A dopo!
             ~ firstPauseTalking = firstCharPauseDurantion
            -> main
        
    = two
    ~ temp charNameUno = uppercaseTranslator(firstCharacterState)
        //Paura di deludere la famiglia scelta
        ~ firstStoryQuestCount ++
        
        {charNameUno}: Alla fine, niente Talco.
        {charNameUno}: Non ricordo quando è stata l'ultima volta che sono andata da qualche parte senza di ləi.
        {charNameUno}: Prima mi sono persa nel cercarlə.
        {charNameUno}: Ok, forse mi sono distratta nel cercar di  raggiungere uno scoiattolo perché aveva la ghianda più bella che avessi mai visto.
        {charNameUno}: Volevo insegnargli a suonarla, e invece mi sono ritrovata tra gli alberi senza sapere dove andare e c’era otto sentieri diversi davanti a me.
        {charNameUno}: Otto!
        {charNameUno}: Ma poi come fanno ad esserci otto sentieri in un posto dove ci siamo solo noi?
            + [Esiste un numero definito di sentieri per persona?]
                {charNameUno}: Credo dipenda dal tempo a disposizione.
                {charNameUno}: Un po' come puoi suonare qualsiasi strumento, se hai del tempo.
                {charNameUno}: Ma quanto tempo serve per otto sentieri, da sola?
                    ~ firstBlue ++
            + [Opzione che aumenta il giallo]
                ~ firstYellow ++
            + [Opzione che aumenta il rosso]
                ~ firstRed ++
            + [Opzione che aumenta il verde]
                ~ firstGreen ++
            + [Opzione che aumenta il viola]
                ~ firstPurple ++
            -    
        {charNameUno}: Sarà tutta roba del mentore?
        {charNameUno}: Cammina così tanto, e per cosa poi?
        {charNameUno}: Oh.
        {charNameUno}: Oh.
        {charNameUno}: Sto iniziando a ragionare come Anna.
        {charNameUno}: Anna è una delle mie amiche del conservatorio, è un anno più giovane di me e ora spinge perché mi proponga come assistente di Ghiberti.
        {charNameUno}: Dice che lui ha stima di me e questa è la mia occasione.
        {charNameUno}: Anna e Olga discutono spesso su questa cosa, perché Olga pensa che con la classica io sia sprecata, che devo mettere su una band e invadere tutti i locali della città.
        {charNameUno}: A volte Olga pensa che Talco la veda come lei, ma in realtà Talco è dell’idea che debba puntare sui reality show: dice che non importa vincere, importa farmi vedere, e magari fare qualcosa di casinoso così poi sui social se ne parla.
        {charNameUno}: E poi Ennio, no Ennio no.
        {charNameUno}: Ennio dice che ho sbagliato strada.
            + [Anna ha ragione: bisogna essere pratiche nella vita.]
                {charNameUno}: La praticità non è tutto.
                {charNameUno}: A questo punto dovevo iscrivermi ad economia.
                {charNameUno}: E inventare nuove supercazzole per fregare il prossimo.
                    ~ firstBlue ++
            + [Opzione che aumenta il giallo]
                ~ firstYellow ++
            + [Opzione che aumenta il rosso]
                ~ firstRed ++
            + [Opzione che aumenta il verde]
                ~ firstGreen ++
            + [Tutte le strade sono sbagliate, se non sai dove stai andando.]
                ~ firstPurple ++
            -    
        {charNameUno}: Oh, tutti hanno una loro opinione su cosa dovrei fare.
        {charNameUno}: Tutt3 loro sembra abbiano preso una strada precisa e definita, non ho idea di come facciano.
        {charNameUno}: Ma la cosa che mi preoccupa di più è che possa deluderle.
        {charNameUno}: Sono la mia famiglia, loro.
        {charNameUno}: E nessuna di queste scelte può accontentare tutt3.
            ~ firstPauseTalking = firstCharPauseDurantion
            -> talk_with_first_character
        
    = three
    ~ temp charNameUno = uppercaseTranslator(firstCharacterState)
    //Silenzio
        ~ firstStoryQuestCount ++
        
        {charNameUno}: Questo posto è carino, ma il silenzio è faticoso.
        {charNameUno}: Come si può stare in un posto che non ha nemmeno un accenno di musica, di ritmo?
            + [Studiandolo, cercando di capire come funziona.]
                {charNameUno}: Dovrei vivisezionare una di quelle lumacone trovate dietro alla serra?
                {charNameUno}: Testare gli arbusti della foresta?
                {charNameUno}: No, scusa, non è quello che hai detto.
                {charNameUno}: Ma studiare crea una divisione tra studiato e studiante, e a me questa cosa sta sul culo.
                ~ firstBlue ++
            + [Opzione che aumenta il giallo]
                ~ firstYellow ++
            + [Opzione che aumenta il rosso]
                ~ firstRed ++
            + [Opzione che aumenta il verde]
                ~ firstGreen ++
            + [Il giardino tutto è musica, si tratta solo di ascoltare.]
                ~ firstPurple ++
            -
        {charNameUno}: Sono abituata a essere circondata da gente tutto il giorno, sai?
        {charNameUno}: A vivere nella festa.
        {charNameUno}: Sto in una casa con altre cinque persone, un posto pieno di muffa e corridoi e camere con collegamenti assurdi, ma tutto questo non pesa perché c’è sempre festa, c’è sempre qualcosa di giocoso da fare.
        {charNameUno}: Talco crea strumenti con qualsiasi cosa trovi in giro.
        {charNameUno}: D’estate quando scende il caldo saliamo sul tetto e iniziamo a cantare e improvvisare e a quel punto vento e sudore si portano via le preoccupazioni e non c’è nulla a cui pensare.
        {charNameUno}: E allora arriva la sensazione, quel sentirti parte di tutto, priva di confini.
        {charNameUno}: Sei la musica, sei l’umidità nell’aria, sei la gola del vicino che si lamenta del casino.
        {charNameUno}: Ma qui, qui è tutto così calmo, posso sentire i pensieri dei miei pensieri e rimango intrappolata dentro a me stessa.
                + [La disciplina può aiutare a spegnere i pensieri.]
                    {charNameUno}: Anche l'alcool se è per quello.
                    {charNameUno}: Ma non reggo bene nessuna delle due cose.
                    ~ firstBlue ++
                + [Opzione che aumenta il giallo]
                    ~ firstYellow ++
                + [Opzione che aumenta il rosso]
                    ~ firstRed ++
                + [Opzione che aumenta il verde]
                    ~ firstGreen ++
                + [Opzione che aumenta il viola]
                    ~ firstPurple ++
                -
            ~ firstPauseTalking = firstCharPauseDurantion
            -> talk_with_first_character
        
    = four
    ~ temp charNameUno = uppercaseTranslator(firstCharacterState)
        //Paura delle conseguenze della scelta.
        ~ firstStoryQuestCount ++
        
        {charNameUno}: Conoscevo questo ragazzo, Jonah.
        {charNameUno}: Un genio, per me un genio.
        {charNameUno}: Ti prendeva in mano un’arpa e trasformava il suo suono in qualsiasi cosa.
        {charNameUno}: Per due anni ha fatto da spalla a un tizio di Beijing, una specie di rockstar della musica classica in Cina, ma poi Jonah ha iniziato a sentire la mancanza dell’Europa ed è tornato cercando di fare una carriera da solista.
        {charNameUno}: Però man mano che le porte si chiudevano, si chiudeva anche la sua sicurezza, e il suo amore per la musica.
        {charNameUno}: Ora non so più dove sia, Jonah.
        {charNameUno}: Qualche compagna di corso giura di averlo visto mendicare, qualche altro che suona sotto pseudonimo alle feste di odiosi ricconi.
        {charNameUno}: Una volta ho creduto di averlo visto lavorare in un supermercato.
        {charNameUno}: Cosa puoi fare quando sai fare bene solo una cosa ma il mondo non ti permette di farla?
        {charNameUno}: Scendi a compromessi, o accetti il rischio di morire di fame?
        {charNameUno}: O aspetti fino a quando non sia il mondo a decidere per te?
            + [Siamo votat3 alla sopravvivenza, una soluzione si trova.]
                {charNameUno}: Vorrei però qualcosa di meglio di sopravvivere, no?
                {charNameUno}: Banale, ma vorrei permettermi il lusso di vivere.
                ~ firstBlue ++
            + [Opzione che aumenta il giallo]
                ~ firstYellow ++
            + [Opzione che aumenta il rosso]
                ~ firstRed ++
            + [Opzione che aumenta il verde]
                ~ firstGreen ++
            + [Opzione che aumenta il viola]
                ~ firstPurple ++
            -    
            ~ firstPauseTalking = firstCharPauseDurantion
            -> talk_with_first_character
        
    = five
    ~ temp charNameUno = uppercaseTranslator(firstCharacterState)
    //Razionalità
        ~ firstStoryQuestCount ++
        
        {charNameUno}: Stavo ripensando al prof Ghiberti.
        {charNameUno}: Te ne ho già parlato? Non ricordo.
        {charNameUno}: Lui vede tutta la musica come una cosa matematica.
        {charNameUno}: Non è una cosa strana, ci sono pianisti che trattano il piano come se fosse un abaco, ma senza rinunciare alla poesia.
        {charNameUno}: Per Ghiberti invece tutto va ridotto a una specie di lista di elementi primitivi che possono essere combinati solo in un determinato modo per ottenere soluzioni prevedibili.
        {charNameUno}: Una volta a vocina bassa ha detto che il jazz è un errore.
            + [La prevedibilità <b>è</b> poetica. La cosa più rara al mondo.]
                {charNameUno}: Allora non sono una persona poetica.
                {charNameUno}: Perché se so dove qualcosa andrà a parare, quella cosa mi sembra priva di vita.
                {charNameUno}: E la poesia è qualcosa che porta vita.
                    ~ firstBlue ++
            + [Opzione che aumenta il giallo]
                ~ firstYellow ++
            + [Opzione che aumenta il rosso]
                ~ firstRed ++
            + [Opzione che aumenta il verde]
                ~ firstGreen ++
            + [Opzione che aumenta il viola]
                ~ firstPurple ++
            - 
        {charNameUno}: Sembra un uomo felice, sorride molto, eppure a volte mi sembra il sorriso che avrebbe una macchina per fare bulloni o una pressa.
        {charNameUno}: Un sorriso che dice “Così è, così si fa, c’è davvero altro da pensare?”.
        {charNameUno}: A me spaventa un sacco quel sorriso, quel modo di fare.
        {charNameUno}: Tutti questi numerini e fattori tolgono l’esperienza, l’errore, il senso di comunità.
        {charNameUno}: Una comunità canta, ma per farlo deve sbagliare, essere imprevedibile.
        {charNameUno}: Che diavolo ci fai con una canzone fatta con la sola precisione?
        {charNameUno}: È come quella roba con l’AI, orecchiabile, prevedibile, dimenticabile.
        {charNameUno}: Odio poche cose, ma questa su tutte: odio tutte le cosine pratiche e calcolabili, sono una rinuncia alla vita.
            + [Una comunità non regge a lungo senza un po' di senso pratico.]
                {charNameUno}: Ma quando tutto è solo senso pratico?
                {charNameUno}: A quel punto comunque la comunità è destinata a morire.
                    ~ firstBlue ++
            + [Opzione che aumenta il giallo]
                ~ firstYellow ++
            + [Opzione che aumenta il rosso]
                ~ firstRed ++
            + [Opzione che aumenta il verde]
                ~ firstGreen ++
            + [Opzione che aumenta il viola]
                ~ firstPurple ++
            -    
            ~ firstPauseTalking = firstCharPauseDurantion
            -> talk_with_first_character
    
    = six
    ~ temp charNameUno = uppercaseTranslator(firstCharacterState)
        //Voglia di fare qualcosa di utile, importante
        ~ firstStoryQuestCount ++
        {charNameUno}: Sai, mi sto abituando a questo luogo.
        {charNameUno}: Anche se non sembra cambiare mai niente.
        {charNameUno}: Ma non è un blocco brutto.
        {charNameUno}: Sembra più il momento prima del temporale, quando sai che sta per succedere qualcosa.
        {charNameUno}: E non sai nemmeno cosa aspettarti.
        {charNameUno}: E allora annusi l'aria, e ti senti viva.
        {charNameUno}: Merda, faccio davvero schifo a parlare.
            + [Non tanto a parlare, quanto ad arrivare al punto.]
                {charNameUno}: Mi ricordi perché continuo a raccontarti queste cose?
                {charNameUno}: Ah, sì, perché siamo solo noi.
                {charNameUno}: E il mentore.
                ~ firstBlue ++
            + [Opzione che aumenta il giallo]
                ~ firstYellow ++
            + [Opzione che aumenta il rosso]
                ~ firstRed ++
            + [Opzione che aumenta il verde]
                ~ firstGreen ++
            + [Opzione che aumenta il viola]
                ~ firstPurple ++
            -
        {charNameUno}: Comunque, continua a tornarmi in mente un ricordo.
        {charNameUno}: L'anno scorso abbiamo occupato questo parco per una settimana.
        {charNameUno}: Il comune voleva distruggere gli alberi, e volevamo fare qualcosa di utile, sai.
        {charNameUno}: E il primo giorno è stato tutto adrenalina.
        {charNameUno}: La prima notte il freddo non l'abbiamo sentito da come eravamo prese dalla gioia.
        {charNameUno}: Man mano però l'euforia è andata scemando.
        {charNameUno}: Alcune persone se ne sono andate, altre sono rimaste ma erano arrese.
        {charNameUno}: L'ultima sera c'è stato un momento di puro silenzio.
        {charNameUno}: Non i nostri strumenti, non le nostre voci.
        {charNameUno}: Non il muoversi della polizia, il megafono degli assessori.
        {charNameUno}: E a quel punto ho sentito il canto degli alberi.
        {charNameUno}: E quando ho iniziato a cantare con loro mi sono sentita viva.
            + [Gli alberi "cantano" per mettere in allarme altri alberi.]
                {charNameUno}: Quindi ero immersa in un coro di disperazione?
                {charNameUno}: Forse mi sento viva solo nel dolore?
                ~ firstBlue ++
            + [Opzione che aumenta il giallo]
                ~ firstYellow ++
            + [Opzione che aumenta il rosso]
                ~ firstRed ++
            + [Opzione che aumenta il verde]
                ~ firstGreen ++
            + [Opzione che aumenta il viola]
                ~ firstPurple ++
            -    
    
        {charNameUno}: Alla fine comunque ci hanno trascinati via, bastonati e tutto il resto.
        {charNameUno}: Hanno tagliato gli alberi.
        {charNameUno}: E la mia voce non ha portato alcun cambiamento.
            ~ firstPauseTalking = firstCharPauseDurantion
            -> talk_with_first_character
    
    = seven
    ~ temp charNameUno = uppercaseTranslator(firstCharacterState)
        //Famiglia d'origine
        ~ firstStoryQuestCount ++
        {charNameUno}: Vuoi sapere una cosa buffa? La passione per la musica l'ho presa da mio papà.
        {charNameUno}: Lo stesso uomo che ora vorrebbe cercassi un "lavoro vero".
        {charNameUno}: Casa è piena di vecchi strumenti pieni di polvere.
        {charNameUno}: Sono del nonno che non ho mai conosciuto.
        {charNameUno}: Papà li tiene come se fossero delle reliquie.
        {charNameUno}: Ma ogni tanto ci permetteva di sentire le vecchie registrazioni, di quando nonno suonava e cantava nelle balere.
        {charNameUno}: E allora ci mettevamo a ballare con lui e mamma.
        {charNameUno}: E in questi ricordi c'è sempre un raggio di sole caldo che gli illumina il sorriso.
            + [Questo ricordo ti è di aiuto, ora?]
            {charNameUno}: Un po'.
            {charNameUno}: Mi ricorda che c'è stato un momento in cui tutto andava bene.
                ~ firstBlue ++
            + [Opzione che aumenta il giallo]
                ~ firstYellow ++
            + [Opzione che aumenta il rosso]
                ~ firstRed ++
            + [Opzione che aumenta il verde]
                ~ firstGreen ++
            + [Opzione che aumenta il viola]
                ~ firstPurple ++
            -
        {charNameUno}: Per certi versi, mamma è più cinica di papà.
        {charNameUno}: È grazie a lei se papà ha ceduto e mi sono iscritta al conservatorio.
        {charNameUno}: Ma per lei l'obiettivo è che mi trasformi in Lang Lang, Mitsuko Uchida, Alfred Brendel.
        {charNameUno}: Prestigio, onoreficienze e denaro.
        {charNameUno}: Chi glielo dice che a ventitrè anni per queste cose sono già vecchia?
        {charNameUno}: Con queste premesse, la mia strada è totalmente sbagliata.
            + [Tutt3 e tre hanno fatto concerti prima della maggiore età.]
                {charNameUno}: Esattamente.
                {charNameUno}: Per cui direi che sono fallita e posso appendere il piano al muro.
                {charNameUno}: E non dire che non è una cosa fattibile o urlo.
                ~ firstBlue ++
            + [Opzione che aumenta il giallo]
                ~ firstYellow ++
            + [Opzione che aumenta il rosso]
                ~ firstRed ++
            + [Opzione che aumenta il verde]
                ~ firstGreen ++
            + [Opzione che aumenta il viola]
                ~ firstPurple ++
            -    
            ~ firstPauseTalking = firstCharPauseDurantion
            -> talk_with_first_character

  
        
=== first_character_opinions
~ temp charNameUno = uppercaseTranslator(firstCharacterState) 
    ~ firstStoryQuestCount ++
    //Le sue opinioni comunque ci fanno capire meglio il modo in cui vede il mondo e parte della sua vita fuori da qui.
    {charNameUno}: {~ Bisogna sporcarsi le mani. Nelle cose. Non c’è contatto con le vita se le mani sono sempre pulite.|Le dita devono sapere di terra, come quando da bambina non avevi paura di cadere. Che cosa c’è di vivo se sono sempre pulite?|Secondo te potrei insegnare alle api a creare un quartetto? Con quelle codine sarebbero perfette con la viola. O forse qualcosa da suonare con le ali, che vibri. Potrebbero muoversi nella cassa di una chitarra e fare i loro suonini.|Durante le lezioni il prof Ghiberti aveva l’abitudine di tirarsi il colletto del maglioncino. Li aveva tutti rovinati, se li tirava così tanto che a volte ti chiedevi se gli mancava l’aria.|Al Conservatorio ci sono troppe cose che non c’entrano con la musica. C’è competitività, c’è senso di fretta, di perfezione. Però mi manca, sai? Tutto quello che sta tra una lezione e l’altra, tutto quel parlare di musica mi faceva sentire viva.|Quando ho solo la mia chitarrina, è come se uscisse un’altra me. Non conta più l’insieme ma il momento, la singola nota è come un tratto di pennello, e improvvisare diventa come dipingere. Non so improvvisare col pianoforte, ci sono troppe cose. Però con la chitarra posso fare qualunque cosa.|Litigo spesso con mio padre. È un brav’uomo, molto pratico. Si preoccupa per me perché nel suo mondo tutto fatto di numeri e linee uscire dalla via principale significa morire. E forse ha ragione ma per me è morire anche restare in quelle cose. Schiacciata tra quelle regole.}
            -> main


 === first_story_gift ===
~ temp charNameUno = uppercaseTranslator(firstCharacterState)
        + {findedGifts != ()} [Offro un dono.]
            -> gestione_inventario -> ink_outcome 
        + {findedGifts == ()} <i> Il tuo inventario è vuoto.</i>
            ->main
        
    
        = ink_outcome    
            <i>Dopo il tuo dono {inkTranslator(firstCharacterInkLevel)}.
                 ~ inkActions(firstCharacterInkLevel)
                 -> talk_with_first_character
            //queste opzioni poi non saranno scelte dirette, ma risultati delle scelte fatte durante il gioco

    === first_story_chech_trigger
      ~ temp charNameUno = uppercaseTranslator(firstCharacterState)
        {
        - loneliness == false:
            -> loneliness_trigger
        - else:
            -> main_story_first_character
    
        }
        
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
~ temp charNameUno = uppercaseTranslator(firstCharacterState)
//Così se decido di uscire dalla conversazione, posso riprendere da dove eravamo rimaste.
    {
        - not confession:
            -> confession
        - not statement:
            -> statement
        - else:
            -> one
    }
    = confession
    ~ temp charNameUno = uppercaseTranslator(firstCharacterState)
        {charNameUno}: Ho realizzato una cosa, una cosa su noi due.
        -> firstAffinityCalc ->
        {firstPurple && firstYellow > firstBlue: {charNameUno}: Sento ancora la mancanza di Talco, ma con te mi sento come se fossimo parte da sempre della stessa band.}
        {firstPurple or firstYellow > firstBlue:{charNameUno}: Ci sono momenti in cui cantiamo all'unisono, ed è bello. Mi sento ascoltata.}
        {firstPurple &&  firstYellow < firstBlue: {charNameUno}: Facciamo parte di due cori diversi, vero? Non credo tu abbia preso una sola delle mie note.}
        {not (firstPurple && firstYellow > firstBlue) && not (firstPurple or firstYellow > firstBlue) && not (firstPurple &&  firstYellow < firstBlue): {charNameUno}: A volte siamo sullo stesso brano, altre no. E non ho ancora capito chi tra noi stia ignorando l'altra parte.}
        {charNameUno}: Comunque: credo di aver capito perché il mio nome qui è {charNameUno}.
        {charNameUno}: Penso al Ghiberti.
        {charNameUno}: Penso ai miei amici.
        {charNameUno}: Penso alla mia famiglia.
        {charNameUno}: E vivo tutto come una pressione.
        {charNameUno}: Una spinta da parte loro a fare qualcosa, cambiare qualcosa.
        {charNameUno}: Ma sinceramente, {name}?
        {charNameUno}: Ho il terrore di dover fare una scelta.
        {charNameUno}: Perché una scelta chiude strade.
        {charNameUno}: Perché una scelta delude persone.
        {charNameUno}: Perché una scelta può portarti su strade sbagliate.
        {charNameUno}: E a quel punto, non si può più tornare.
        {charNameUno}: E così l'unica cosa che rimane è rinunciare.
        {charNameUno}: Lasciare che le altre persone scelgano per te.
        {charNameUno}: O che lo faccia il mondo.
            
            + [{charNameUno}, credo di sapere come aiutarti.]
                -> statement
            + [{charNameUno}, capisco il tuo dolore, ho bisogno giusto di riflettere un attimo.]
                -> main


    = statement
    ~ temp charNameUno = uppercaseTranslator(firstCharacterState)
        Abbiamo lo stato dell'inchiostro complessivo
        ~ inkActions(firstCharacterInkLevel)
        Qui dichiaro sostanzialmente su cosa voglio concentrarmi.
        Non porta un'effettiva variazione di qualcosa, è utile solo per la giocatrice per capire su quali direzioni può andare.
        O forse è qualcosa che dichiara la personaggia.
        -> one
    
    = one
    ~ temp charNameUno = uppercaseTranslator(firstCharacterState)
        Qui abbiamo la prima affermazione vera e propria, che spingerà verso uno degli stati possibili. è l'unica che c'è a prescindere dal livello di inchiostro.
            + Esploro un tema
                Ottengo risposte
                 + + E magari faccio altre domande.
                 + + E altre ancora
                    Con altre risposte
            + O un altro
                E aumenta il suo valore
            + O un altro
                E aumenta il suo valore
            -
        {
        - firstCharacterInkLevel == Empty:
            -> ending
        - else: 
            -> two
        }        
        
    = two
    ~ temp charNameUno = uppercaseTranslator(firstCharacterState)
        Secondo giro
        {
        - firstCharacterInkLevel == Low:
            -> ending
        - else: 
            -> three
        }
        
    = three
    ~ temp charNameUno = uppercaseTranslator(firstCharacterState)
        Terzo giro
        {
        - firstCharacterInkLevel == Normal:
            -> ending
        - else: 
            -> four
        }
    
    = four
    ~ temp charNameUno = uppercaseTranslator(firstCharacterState)
        Quarto e ultimo giro giro
        
        -> ending
    /* ---------------------------------

   Qui avrò una funzione che mi manda sugli step utili in base a dove ho abbandonato l'ultima conversazione. Es
   {
   - not step_uno:
        -> step_uno
   - not step_due:
        -> step_due
        etc
   }
    
    E quindi poi avrò.
    = step_uno
        Affronto la storia
    = step_due
        Interventi
        etc
 ----------------------------------*/
 = ending
 ~ temp charNameUno = uppercaseTranslator(firstCharacterState)
    Qui a seconda di com'è andata prima la situazione, la personaggia può darsi un nuovo nome o mantenere lo stesso. E poi, se firstCharacterSpecialEvent == true, darci anche una info sulla mentore.
        ~ firstStory = Ended
        //Resetto il counter degli spostamenti. In questo modo da qui posso iniziare a tener traccia dello spostamento della personaggia. Alcune potrebbero anche salutarci e bona.
        ~ movementsCounter = 0
    -> main
        


=== personaggia_uno_storia_conclusa
~ temp charNameUno = uppercaseTranslator(firstCharacterState)
//Con questa formula dopo un tot di scambi la personaggia se ne va salutandoci.
//In alcune situazioni questa cosa non c'è, in altre c'è solo se ho determinati status (es: socievole). In altri non c'è la possibilità che la personaggia se ne vada senza averci salutate (e quindi non c'è l'opzione in story_start)

    {
        - firstCharEndingDialogue < 10:
            -> top
        - else:
            -> goodbye
    }
    
        - (top)
            + opzione
                ~ firstCharEndingDialogue ++
                    -> personaggia_uno_storia_conclusa
            + opzione
                ~ firstCharEndingDialogue ++
                    -> personaggia_uno_storia_conclusa
            + opzione
                ~ firstCharEndingDialogue ++
                    -> personaggia_uno_storia_conclusa
            + esci dalla conversazione
                -> main
            -
        -> main
        
        = goodbye
        ~ temp charNameUno = uppercaseTranslator(firstCharacterState)
        Ciao ciao
            ~ move_entity(FirstCharacter, Safekeeping)
            ~ move_entity(FirstCharacterNotes, BusStop)
        -> main
















