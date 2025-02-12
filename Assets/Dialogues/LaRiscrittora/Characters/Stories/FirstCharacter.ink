~ temp charNameUno = uppercaseTranslator(firstCharacterState)
=== personaggia_uno ===
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
~ temp charNameUno = uppercaseTranslator(firstCharacterState)
            {//Se prima chiacchierata
                - not knowing_first_character.one:
                    -> knowing_first_character.one
            //Se prima chiacchierata fatta e passato abbastanza tempo dalla pausa prevista        
                - firstPauseTalking == 0:
                    -> intro_chat
            //Altre opzioni        
                - else:
                    {charNameUno}: {~ Ho bisogno di tempo per me.|Ti spiace tornare tra un po'?|Credo di aver bisogno di silenzio, torna più tardi.}
                -> main    
            }

= intro_chat
~ temp charNameUno = uppercaseTranslator(firstCharacterState)
    {charNameUno}: {~ Ero sicura di aver visto una farfalla.|Non male questo posto, anche se casa mi manca.|Non son sicura di star capendo tutto di questo luogo.}
            + [Ti va di raccontarmi qualcosa di te?]
                -> knowing_first_character
                
                
            //Se non ho ancora fatto il dono e NON ho parlato col mentore e ho parlato abbastanza con lei
            + {firstStoryQuestCount > minStoryQuesTCount && not first_story_gift.ink_outcome && not gifts_and_ink && findedGifts != ()} [Ho trovato questa cosa e vorrei donartela.]
                    {charNameUno}: È gentile da parte tua.
                    {charNameUno}: Ma non hai ancora chiesto al mentore a cosa servono.
                    {charNameUno}: Forse conviene che prima parli con lui.
                        -> main
            
            //Se non ho ancora fatto il dono e ho parlato con il mentore e ho parlato abbastanza con lei
            + {firstStoryQuestCount > minStoryQuesTCount && not first_story_gift.ink_outcome && gifts_and_ink && findedGifts != ()} [Ti vorrei donare questa cosa.]
                    -> first_story_gift
        
            //QUESTA OPZIONE C'è SOLO DOPO CHE HO FATTO IL DONO E NON HO ANCORA AVVIATO LA MAIN STORY
            + {first_story_gift.ink_outcome && not main_story_first_character && not questions} [Vorrei aiutarti a guardare le cose in modo diverso.]
                    {uppercaseTranslator(firstCharacterState)}: Non credo che il mentore ti abbia spiegato come si fa questa cosa. Vai da lui prima.
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
    ~ temp charNameUno = uppercaseTranslator(firstCharacterState)
        //Presentazione.
        ~ firstStoryQuestCount ++
        
        ???: Non è che hai visto passare di qui una persona?
        ???: Altə all’incirca una balla di fieno e che si muove come un violino, probabilmente presə a stordire di domande quel tizio, il mentore.
        ???: Non posso essere arrivata qui da sola, vero? Qualsiasi cosa sia <i>qui</i>.
        ???: Come lə trovo?
            + [Dammi dettagli più concreti.]
                    ~ firstBlue ++
                ???: Concreti?
                ???: Si muove. Respira. Mangia. Saltella. Canta.
                ???: A volte tutte queste cose assieme.
                ???: E ha molta fantasia.
                ???: Sempre che tu sappia cosa sia.
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ firstYellow ++
                ???: Non ci avevo pensato!
                ???: Ma il suo violino è più da pianoforte.
                ???: Forse potrei cercare nella serra, e trovare qualcosa da suonare.
                ???: Mi piace comunque il tuo modo di pensare!
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ firstRed ++
                ???: Ha senso, ma Talco non è persona da azione.
                ???: Si trascina nello spazio come se fosse vento.
                ???: E lascia alle sue spalle l'odore della primavera.
                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ firstGreen ++
                ???: È una cosa molto gentile, davvero.
                ???: Ma è come chiedermi di fare un concerto con una persona sconosciuta.
                ???: Ci vuole tempo per capire come armonizzare.
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ firstPurple ++
                ???: Grazie.
                ???: Avevo bisogno di queste parole.
                ???: Ora lə sento più vicinə, anche se ho comunque bisogno di un suo abbraccio.
            -
        ???: Talco, dimmi che sei qui anche tu, ti prego, non so capire il mondo senza di te.
        ???: Sei l'unica persona con cui posso permettermi di litigare.
        ???: E l'unica che mi sopporta da quando ho finito il conservatorio.
        ???: Ma che rinco che sono, non mi sono manco presentata: io sono {charNameUno}.
        {charNameUno}: No, io sono <b>{charNameUno}</b>.
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
    	{charNameUno}: Grandioso, io uso i femminili.      
        {charNameUno}: Ma {name}, secondo te il nome di una persona è qualcosa di importante?
    	    
            + [È uno strumento di controllo.]
                {charNameUno}: O uno strumento d'amore.
                {charNameUno}: Pensa a tutti i modi in cui qualcuno lo può gridare.
                    ~ firstRed ++
            
            + [Solo se possiamo continuamente cambiarlo.]
                {charNameUno}: Ah ah ah!
                {charNameUno}: Adoro.
                {charNameUno}: Passo le giornate a cambiare melodie, e non avevo mai pensato di cambiare il mio nome!
                    ~ firstYellow ++
                    
            + [Solo se sei tu a definirne il significato e non altri.]
                {charNameUno}: Tu sì che sai guardare al cuore delle cose!
                {charNameUno}: Eppure ora mi ritrovo con un nome nuovo.
                {charNameUno}: E non so cosa significhi, cosa doverci fare.
                    ~ firstPurple ++
                    
            + [È un dono della tua famiglia che resterà sempre con te.]
                {charNameUno}: Non ci avevo mai pensato.
                {charNameUno}: Ma non tutt3 ne sono felici.
                {charNameUno}: E per alcune persone il nome è qualcosa che si sceglie.
                {charNameUno}: Una liberazione.
                    ~ firstGreen ++
                    
            + [È utile, altrimenti come ci distinguiamo?]
    	        {charNameUno}: Tu devi essere la persona più divertente della festa, vero?
    	        {charNameUno}: Anche se immagino che una visione pratica abbia dei vantaggi.
    	        {charNameUno}: Per lo meno faresti felice mio padre.
                    ~ firstBlue ++         
            -
            
       {charNameUno}: Comunque sì, ti si addice benissimo, hai proprio una faccia da {name}.
       {charNameUno}: Ma forse la mia faccia è cambiata? Ti sembro una che può chiamarsi {charNameUno}?
            + [Quindi per cambiare faccia basta cambiarci il nome?]
                {firstYellow > 1: {charNameUno}: {name}, tu e io faremo amicizia presto!}
                {charNameUno}: Cavolo, passerei le giornate a essere chiunque!
                {charNameUno}: E forse ora potrei essere Talco.
                {charNameUno}: Dove sei, Talco?
                    ~ firstYellow ++
            
            + [No, la faccia è una cosa che hai anche se non hai un nome.]
                {firstBlue > 1: {charNameUno}: {name}, sai che ogni tanto puoi scendere da ovviolandia, vero? }
                {charNameUno}: Forse dovrei chiamarti Linea.
                {charNameUno}: Anzi, Quadrato.
                {charNameUno}: Perché neanche a volerlo sai rotolare troppo lontano dalla superficie delle cose.
                    ~ firstBlue ++
               
            + [Rinunciare al superfluo ci avvicina alla natura delle cose.]
                {firstPurple > 1: {charNameUno}: Le tue parole mi fanno sentire meno sola.}
                {charNameUno}: Ho pensato subito che {charNameUno} avesse un valore negativo.
                {charNameUno}: Dimenticandomi che in ogni brano il silenzio è parte fondamentale.
                {charNameUno}: Grazie, {name}. La tua saggezza è illuminante.
                    ~ firstPurple ++
            
            + [Cosa pensi direbbe Talco di questo nome?]
                {firstGreen > 1: {charNameUno}: Ancora non ci conosciamo, ma ho l'impressione che tu sappia parlare molto col cuore.}
                {charNameUno}: Questa è una domanda molto tenera.
                {charNameUno}: Ma la risposta lo sarebbe meno.
                {charNameUno}: Talco è una persona che agisce, non resta ad aspettare.
                    ~ firstGreen ++
            
            + [A te va bene essere {charNameUno}? Perché non Lotta? Azione?]
                {firstRed > 1: {charNameUno}: Ho l'impressione che tu prenda tutto di pancia, vero?}
                {charNameUno}: {charNameUno} non è il mio vero nome, ma non trovo più il mio.
                {charNameUno}: E poi, parlare con te non è già una forma di azione?
                    ~ firstRed ++
            -
       {charNameUno}: Come mi dovrei chiamare secondo te?
    	    + {gifts_and_ink}[Secondo il mentore è qualcosa che capiremo col tempo, assieme.]
    	    + [<i>Qualsiasi cosa tu abbia pensato, non riesci a dirla.</i>]
    	-
        {charNameUno}: Interessante.
        {charNameUno}: Forse quel mentore può aiutarci a capire qualcosa?
        {charNameUno}: O forse va bene così.
        {charNameUno}: Forse mi serve questa confusione.
        {charNameUno}: Forse sto suonando da troppo tempo la solita canzone, ma non è più la mia.
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
        
        {charNameUno}: Alla fine niente Talco.
        {charNameUno}: Non ricordo quando è stata l'ultima volta che sono andata da qualche parte senza di ləi.
        {charNameUno}: Prima mi sono persa nel cercarlə.
        {charNameUno}: Ok, forse mi sono distratta cercando di raggiungere uno scoiattolo perché aveva la ghianda più bella che avessi mai visto.
        {charNameUno}: Volevo insegnargli a suonarla, e invece mi sono ritrovata tra gli alberi senza sapere dove andare.
        {charNameUno}: E c’erano otto sentieri diversi davanti a me.
        {charNameUno}: Otto!
        {charNameUno}: Ma poi come fanno ad esserci otto sentieri in un posto dove ci siamo solo noi?
            + [O forse il sentiero è unico, ma ci sono otto te.]
                {charNameUno}: In effetti mi sento divisa, frammentata.
                {charNameUno}: In questo periodo della mia vita ci sono troppe spinte.
                {charNameUno}: E non so dove andare.
                    ~ firstPurple ++
            
            + [Ok l'amicizia con Talco, ma devi essere indipendente.]
                {charNameUno}: Talco e io siamo due parti della stessa armonia.
                {charNameUno}: Sappiamo essere indipendenti.
                {charNameUno}: Ma in momenti come questo, so suonare solo se è con me.
                    ~ firstRed ++
            
            + [Esiste un numero definito di sentieri per persona?]
                {charNameUno}: Credo dipenda dal tempo a disposizione.
                {charNameUno}: Un po' come puoi suonare qualsiasi strumento, se hai del tempo.
                {charNameUno}: Ma quanto tempo serve per creare otto sentieri da sola?
                    ~ firstBlue ++
                    
            + [Vorresti suonare qualcosa per Talco?]
                {charNameUno}: Sarebbe carino, sì.
                {charNameUno}: Ma forse prima devo capire perché ho questo nuovo nome, cosa farmene.
                    ~ firstGreen ++
            
            + [Non so molto di scoiattoli, ma le falene suonano i girasoli!]
                {charNameUno}: Cavoli! Scoiattoli e falene, sarebbe la miglior band possibile!
                {charNameUno}: E credo di aver visto una lumaca prima, potrebbe tenere il tempo!
                ~ firstYellow ++
    
            -    
        {charNameUno}: Non è che saranno tutti i passi del mentore?
        {charNameUno}: Cammina così tanto, e per cosa poi?
        {charNameUno}: Uh, forse devo imitarlo.
        {charNameUno}: Credo farò due passi.
             ~ firstPauseTalking = firstCharPauseDurantion
            -> main  
            
    = three
    ~ temp charNameUno = uppercaseTranslator(firstCharacterState)
    ~ firstStoryQuestCount ++
    
        {charNameUno}: Stavo pensando ad Anna.
        {charNameUno}: Anna è una delle mie amiche del conservatorio.
        {charNameUno}: Ha un anno meno di me e ora vuole che mi proponga come assistente del Ghiberti.
        {charNameUno}: Dice che lui ha stima di me e questa è la mia occasione.
        {charNameUno}: Anna è così sicura di sè da quando ha lasciato l'ex molesto.
        {charNameUno}: Anna e Olga discutono spesso perché Olga pensa che con la classica io sia sprecata.
        {charNameUno}: Che devo mettere su una band e invadere tutti i locali della città.
        {charNameUno}: Olga crede che Talco la veda come lei, ma in realtà Talco vuole che punti sui reality show.
        {charNameUno}: Dice che non importa vincere, importa fare casino così poi sui social se ne parla.
        {charNameUno}: E poi Ennio, no Ennio no.
        {charNameUno}: Ennio dice che ho sbagliato strada.
        
            
            + [La risposta è sempre dove c'è casino: ascolta Talco!]
                {charNameUno}: Voi due andreste d'accordo tantissimo, cavolo.
                {charNameUno}: Potrei portarvi sul palco e fare qualcosa di assurdo.
                {charNameUno}: Tipo suonare con una papera in testa!
                    ~ firstYellow ++
            
            + [Anna ha ragione: bisogna essere pratiche nella vita.]
                {charNameUno}: La praticità non è tutto.
                {charNameUno}: A questo punto dovevo iscrivermi ad economia.
                {charNameUno}: E inventare nuove supercazzole per fregare il prossimo.
                    ~ firstBlue ++        
    
            + [Tutte le strade sono sbagliate se non sai dove stai andando.]
                {charNameUno}: Mi ricordi il nonno.
                {charNameUno}: Ignorava i piccoli fastidi per concentrarsi sul grande insieme delle cose.
                    ~ firstPurple ++
            
            + [E cosa vuole {charNameUno}?]
                {charNameUno}: Ora?
                {charNameUno}: Un letto caldo, una copertina.
                {charNameUno}: E non doversi porre questa domanda.
                    ~ firstGreen ++
            
            + [Ascolta Olga e invadi il mondo!]
                {charNameUno}: Sono più dell'idea di ricrearlo assieme.
                {charNameUno}: Ascoltarci a vicenda, entrare in armonia.
                {charNameUno}: E ricostruire sulle macerie che ci circondano.
                    ~ firstRed ++        
                    

            -    
        {charNameUno}: Oh, tutti hanno una loro opinione su cosa dovrei fare.
        {charNameUno}: Tutt3 loro sembra abbiano preso una strada precisa e definita, non ho idea di come facciano.
        {charNameUno}: Ma la cosa che mi preoccupa di più è che possa deluderle.
        {charNameUno}: Sono la mia famiglia, loro.
        {charNameUno}: E nessuna di queste scelte può accontentare tutt3.
            ~ firstPauseTalking = firstCharPauseDurantion
            -> main
        
    = four
    ~ temp charNameUno = uppercaseTranslator(firstCharacterState)
    //Silenzio
        ~ firstStoryQuestCount ++
        
        {charNameUno}: Questo posto è carino, ma il silenzio è faticoso.
        {charNameUno}: Come si può stare in un posto che non ha nemmeno un accenno di musica, di ritmo?
            + [Studiandolo, cercando di capire come funziona.]
                {charNameUno}: Dovrei vivisezionare una di quelle lumacone trovate dietro alla serra?
                {charNameUno}: Testare gli arbusti della foresta?
                {charNameUno}: No, scusa, non è quello che hai detto.
                {charNameUno}: Ma studiare crea una divisione tra studiato e studiante, odio questa cosa.
                    ~ firstBlue ++
                    
            + [Più silenzio significa più spazio per fare rumore!]
                {charNameUno}: Hai ragione, però mi sento un po' sciocca.
                {charNameUno}: Un po' come quando fai le prove per un concerto in un'enorme sala vuota.
                {charNameUno}: Non che mi sia mai capitato, ma immagino ci si senta così.
                {charNameUno}: Esposte, spaesate.
                {charNameUno}: Ridicole.
                    ~ firstYellow ++
                    
            + [Se corri veloce il ritmo lo crei da sola.]
                {charNameUno}: Ma poi serve qualcuno che suoni con te.
                {charNameUno}: E una voce che dia un senso a quel ritmo.
                    ~ firstRed ++
                    
            + [Il silenzio ti offre la vulnerabilità necessaria per raccontarti.]
                {charNameUno}: Ma non conosco bene le parole.
                {charNameUno}: L'unica cosa che so fare è suonare.
                    ~ firstGreen ++
                    
            + [Il giardino tutto è musica, si tratta solo di ascoltare.]
                {charNameUno}: Hai ragione, {name}.
                {charNameUno}: Ma per ascoltare serve restare in silenzio.
                {charNameUno}: E la mia testa ora è piena di domande.
                    ~ firstPurple ++
            -
        {charNameUno}: Forse il mentore è abbastanza vecchio da avere una radio?
             ~ firstPauseTalking = firstCharPauseDurantion
            -> main 
            
    = five
    ~ temp charNameUno = uppercaseTranslator(firstCharacterState)
    ~ firstStoryQuestCount ++
    
        {charNameUno}: Sono abituata a essere circondata da gente tutto il giorno.
        {charNameUno}: A vivere nella festa.
        {charNameUno}: Sto in una casa con altre cinque persone, un posto pieno di muffa e corridoi e armadi e c’è sempre una festa da fare.
        {charNameUno}: Talco crea strumenti con qualsiasi cosa trova in giro.
        {charNameUno}: Le sere d'estate saliamo sul tetto a cantare e improvvisare.
        {charNameUno}: E vento e sudore si portano via le preoccupazioni e non c’è nulla a cui pensare.
        {charNameUno}: A quel punto arriva la sensazione, quel sentirti parte di tutto, priva di confini.
        {charNameUno}: Sei la musica, sei l’umidità nell’aria, sei la gola del vicino che si lamenta del casino.
        {charNameUno}: Ma qui, qui è tutto così calmo, posso sentire i pensieri dei miei pensieri e rimango intrappolata dentro a me stessa.
                + [Allora serve fare più rumore.]
                    {charNameUno}: Riprendere a stordirmi di cose?
                    {charNameUno}: Può essere un'idea.
                    {charNameUno}: Ma se sono qui, con questo nome, forse non è la vera soluzione.
                        ~ firstRed ++
                        
                + [Il pensiero è specchio: rompilo per distinguere reale e riflesso.]
                    {charNameUno}: Forse dovrei stendermi e meditare.
                    {charNameUno}: Lasciare che si spengano uno per uno.
                    {charNameUno}: Ignorare la paura che ho all'idea di vedere le cose come stanno.
                        ~ firstPurple ++
                
                + [La disciplina può aiutare a spegnere i pensieri.]
                    {charNameUno}: Anche l'alcool se è per quello.
                    {charNameUno}: Ma non reggo bene nessuna delle due cose.
                        ~ firstBlue ++
                        
                + [Forse non è la festa, ma è il senso di unione che ti manca.]
                    {charNameUno}: Ma con chi, qui?
                    {charNameUno}: Scusa, non per offenderti.
                    {charNameUno}: Sei una persona molto dolce, ma non sei <i>loro</i>.
                        ~ firstGreen ++
                        
                + [La serra ha un tetto! E io so sudare!]
                    {charNameUno}: Questo è un piano, in effetti.
                    {charNameUno}: Forse il vetro non ci reggerebbe a lungo.
                    {charNameUno}: Ma secondo me quelle piante sanno cantare.
                        ~ firstYellow ++        
                
                -
            ~ firstPauseTalking = firstCharPauseDurantion
            -> main
        
    = six
    ~ temp charNameUno = uppercaseTranslator(firstCharacterState)
        //Paura delle conseguenze della scelta.
        ~ firstStoryQuestCount ++
        
        {charNameUno}: Conoscevo questo ragazzo, Jonah, un arpista e un genio.
        {charNameUno}: Per due anni ha fatto da spalla a un tizio di Beijing, una rockstar della musica classica.
        {charNameUno}: Ma poi Jonah ha iniziato a sentire la mancanza dell’Europa ed è tornato cercando di fare una carriera da solista.
        {charNameUno}: Però man mano che le porte si chiudevano, si chiudeva anche la sua sicurezza e il suo amore per la musica.
        {charNameUno}: Ora non so più dove sia, Jonah.
        {charNameUno}: Qualche compagna di corso giura di averlo visto mendicare, qualche altro che suona sotto pseudonimo alle feste di odiosi ricconi.
        {charNameUno}: Una volta ho creduto di averlo visto lavorare in un supermercato.
        {charNameUno}: Cosa puoi fare quando sai fare bene solo una cosa ma il mondo non ti permette di farla?
        {charNameUno}: Scendi a compromessi, o accetti il rischio di morire di fame?
        {charNameUno}: O aspetti fino a quando non sia il mondo a decidere per te?
            
            + [Canta e balla. Domani è una cosa lontana.]
                {charNameUno}: Mi sembra di sentire Talco, con queste frasi.
                {charNameUno}: Ma per me è da molto ormai che è <i>domani</i>.
                {charNameUno}: Il conservatorio è finito da mesi, e io suono, ballo, ma non so ancora che cosa fare.
                    ~ firstYellow ++
                    
            + [È imperativo sopravvivere, troviamo sempre una soluzione.]
                {charNameUno}: Grazie ma voglio qualcosa di più che sopravvivere.
                {charNameUno}: Banale, ma vorrei permettermi il lusso di vivere.
                ~ firstBlue ++
                    
            + [Restati fedele e non ci sarà compromesso ma cambiamento.]
                {charNameUno}: E a quel punto ogni decisione sarebbe la <i>mia</i> decisione.
                    ~ firstPurple ++
            
            + [Dona la tua musica senza chiedere e qualcosa arriverà.]
                {charNameUno}: Forse in questa foresta, in questo giardino.
                {charNameUno}: Ma da dove vengo, tutto prende e non dà nulla.
                {charNameUno}: A parte le persone a cui voglio bene.
                {charNameUno}: Forse dovrei donare loro quello che so fare?
                    ~ firstGreen ++
           
            + [Mezzo compromesso è già una completa sconfitta.]
                {charNameUno}: Eppure Jonah ha perso del tutto, comunque.
                {charNameUno}: Con o senza compromessi.
                {charNameUno}: Questa è l'unica soluzione?
                    ~ firstRed ++       
            
            -    
            ~ firstPauseTalking = firstCharPauseDurantion
            -> main
        
    = seven
    ~ temp charNameUno = uppercaseTranslator(firstCharacterState)
    //Razionalità
        ~ firstStoryQuestCount ++
        
        {charNameUno}: Stavo ripensando al prof Ghiberti.
        {charNameUno}: Lui vede tutta la musica come una cosa matematica.
        {charNameUno}: Ci sono pianisti che trattano il piano come fosse un abaco, ma senza rinunciare alla poesia.
        {charNameUno}: Per Ghiberti invece il mondo è una lista di elementi primitivi che possono essere combinati solo in un determinato modo per ottenere soluzioni prevedibili.
        {charNameUno}: Una volta a vocina bassa ha detto che il jazz è un errore.
            + [La prevedibilità <b>è</b> poetica. La cosa più rara al mondo.]
                {charNameUno}: Allora non sono una persona poetica.
                {charNameUno}: Perché se so dove qualcosa andrà a parare, quella cosa mi sembra priva di vita.
                {charNameUno}: E la poesia è qualcosa che porta vita.
                    ~ firstBlue ++
                    
            + [Ognuna ha il suo modo di raggiungere la verità.]
                {charNameUno}: Di solito concorderei.
                {charNameUno}: Ma non è troppo facile così?
                {charNameUno}: Non è togliersi la responsabilità verso le altre persone?
                    ~ firstPurple ++
                    
            + [È un errore smettere di giocare, e il jazz è musica che gioca.]
                {charNameUno}: Credo che tu gli abbia appena regalato un crepacuore.
                {charNameUno}: Tutta la musica è gioco, se sai rinunciare all'ego e perderti con band e pubblico.
                ~ firstYellow ++
                
            + [Sembrano le parole di una persona ferita.]
                {charNameUno}: Lo dice anche Talco.
                {charNameUno}: E a quel punto, come curare la sua ferita?
                {charNameUno}: Rispettando la sua ossessione per le regole?
                {charNameUno}: O regalandogli un po' di caos?
                ~ firstGreen ++
                
            + [Ha paura di accogliere la potenza del disordine.]
                {charNameUno}: Già, è una possibilità.
                {charNameUno}: Anche se poi credo che il disordine sia solo una questione di prospettiva.
                {charNameUno}: Alla lunga ci si abiuta anche a quello, e a quel punto diventa difficile comunque cambiare.
                    ~ firstRed ++
            -
            
             ~ firstPauseTalking = firstCharPauseDurantion
            -> main           
    = eight
    ~ temp charNameUno = uppercaseTranslator(firstCharacterState)
    ~ firstStoryQuestCount ++
    
        {charNameUno}: Ghiberti sembra un uomo felice, sorride molto.
        {charNameUno}: Eppure a volte mi sembra il sorriso che avrebbe una macchina per fare bulloni o una pressa.
        {charNameUno}: A me spaventa un sacco quel sorriso, quel modo di fare.
        {charNameUno}: Tutti questi numerini e fattori tolgono l’esperienza, l’errore, il senso di comunità.
        {charNameUno}: Una comunità canta, ma per farlo deve sbagliare, essere imprevedibile.
        {charNameUno}: Che diavolo ci fai con una canzone fatta con la sola precisione?
        {charNameUno}: È come quella roba con l’AI, orecchiabile, prevedibile, dimenticabile.
        {charNameUno}: Odio poche cose, ma questa su tutte: odio tutte le cosine pratiche e calcolabili, sono una rinuncia alla vita.
        {charNameUno}: Come sta in piedi una comunità, così?
            
            + [Una comunità sboccia da sè quando c'è affetto e fiducia.]
                {charNameUno}: Una casa in campagna con le persone amate.
                {charNameUno}: Un giardino.
                {charNameUno}: Una fuga, senza mai chiamarla fuga.
                    ~ firstGreen ++
                
            + [Una comunità non regge a lungo senza senso pratico.]
                {charNameUno}: Ma quando tutto è solo senso pratico?
                {charNameUno}: A quel punto comunque la comunità è destinata a morire.
                    ~ firstBlue ++
                    
            + [Una comunità resiste solo seguendo un obiettivo superiore.]
                {charNameUno}: Come rendere il mondo più giusto.
                {charNameUno}: O trasformare qualcosa di terribile in un gioco.
                    ~ firstPurple ++
        
            + [Ciò che ci tiene unite è il giocare.]
                {charNameUno}: In effetti è liberatorio ridere assieme di qualcosa.
                {charNameUno}: Ma mi chiedo sempre se non stiamo ridendo di qualcuno, senza rendercene conto.
                    ~ firstYellow ++
                    
            + [Ci si accresce nel dissenso e nella discussione.]
                {charNameUno}: Vero.
                {charNameUno}: Anche se a volte è bello anche sedersi assieme al sole, e riposare.
                    ~ firstRed ++
     
            -    
            ~ firstPauseTalking = firstCharPauseDurantion
            -> main
    
    = nine
    ~ temp charNameUno = uppercaseTranslator(firstCharacterState)
        //Voglia di fare qualcosa di utile, importante
        ~ firstStoryQuestCount ++
        
        {charNameUno}: Sai, mi sto abituando a questo luogo.
        {charNameUno}: Anche se non sembra cambiare mai niente.
        {charNameUno}: Ma non è un blocco brutto.
        {charNameUno}: Sembra più il momento prima del temporale, quando sai che sta per succedere qualcosa, ma non sai cosa.
        {charNameUno}: Annusi l'aria e ti senti viva.
        {charNameUno}: Merda, faccio davvero schifo a parlare.
            
            + [È una ninna nanna. E l'imprevedibile è ciò che sognerai.]
                {charNameUno}: Un pigiama party.
                {charNameUno}: Un momento tra persone care.
                {charNameUno}: Un sogno condiviso, sognando sognare.
                    ~ firstGreen ++
                    
            + [Non tanto a parlare, quanto ad arrivare al punto.]
                {charNameUno}: Mi ricordi perché continuo a raccontarti queste cose?
                {charNameUno}: Ah, sì, perché siamo solo noi.
                {charNameUno}: E il mentore.
                    ~ firstBlue ++
            + [Ogni temporale toglie a qualcuna e dà a qualcun altro.]
                {charNameUno}: Come le piante nella serra.
                {charNameUno}: Per crescere prendono da terra, da ciò che manco vedo.
                {charNameUno}: E ci danno in cambio odori e idee.
                    ~ firstPurple ++
                    
            + [O come il momento prima di una battaglia.]
                {charNameUno}: Non è qualcosa che conosco.
                {charNameUno}: Ma forse a volte dovrei provare.
                {charNameUno}: Dare un volto all'avversario, e lottare.
                {charNameUno}: Sarei ancora me stessa, dopo?
                    ~ firstRed ++
                    
            + [Qui l'aria sa di mare e zucchero filato!]
                {charNameUno}: Vero? Che è assurdo, perché non ho visto il mare da nessuna parte.
                {charNameUno}: Né dello zucchero filato se è per quello.
                    ~ firstYellow ++         
    
            -
        {charNameUno}: Credo resterò ad aspettare questo temporale.
        
             ~ firstPauseTalking = firstCharPauseDurantion
            -> main   
    = ten
    ~ temp charNameUno = uppercaseTranslator(firstCharacterState)
    ~ firstStoryQuestCount ++
    
        {charNameUno}: L'anno scorso abbiamo occupato questo parco per una settimana.
        {charNameUno}: Il comune voleva distruggere gli alberi, e volevamo fare qualcosa di utile, sai.
        {charNameUno}: La prima notte il freddo non l'abbiamo sentito da come eravamo prese dalla gioia.
        {charNameUno}: Però man mano l'euforia è andata scemando.
        {charNameUno}: Alcune persone se ne sono andate, altre sono restate ma senza spinta.
        {charNameUno}: L'ultima sera c'è stato un momento di puro silenzio.
        {charNameUno}: Non i nostri strumenti, non le nostre voci.
        {charNameUno}: Non il muoversi della polizia, il megafono degli assessori.
        {charNameUno}: E a quel punto ho sentito il canto degli alberi.
        {charNameUno}: E quando ho iniziato a cantare con loro mi sono sentita viva.
        
            + [Credo che gli alberi qui conoscano la storia della tua lotta.]
                {charNameUno}: Sarebbe bello.
                {charNameUno}: Ma allora chiederei loro la strada verso casa.
                {charNameUno}: Non so più quanto ancora voglia restare quì.
                    ~ firstGreen ++
                
            + [Hai anche danzato con gli alberi?]
                {charNameUno}: No, non ci avevo pensato sul momento.
                {charNameUno}: Sentivo il bisogno di qualcosa di più intimo.
                {charNameUno}: Muovermi a volte mi sembra che rompa le cose.
                    ~ firstYellow ++
                    
            + [Sei tu che hai lottato per gli alberi, o gli alberi hanno lottato per te?]
                {charNameUno}: L'una ha aiutato gli altri e viceversa.
                {charNameUno}: Solo nell'illusione di essere separate, uno fa per l'altra.
                {charNameUno}: Non c'è melodia se le note non si perdono in essa.
                    ~ firstPurple ++
            
            + [Gli alberi "cantano" per mettere in allarme altri alberi.]
                {charNameUno}: Quindi ero immersa in un coro di disperazione?
                {charNameUno}: Forse mi sento viva solo nel dolore?
                    ~ firstBlue ++
                
            + [Come ti sei sentita a combattere per qualcun altro?]
                {charNameUno}: Motivata.
                {charNameUno}: Motivata fino al cuore.
                {charNameUno}: Non so difendere molto bene me e le mie posizioni.
                {charNameUno}: Ma quella settimana, per una volta, ho capito che stavo facendo qualcosa di sensato.
                    ~ firstRed ++
            -    
    
        {charNameUno}: Alla fine comunque ci hanno trascinati via, bastonati e tutto il resto.
        {charNameUno}: Hanno tagliato gli alberi.
        {charNameUno}: E la mia voce non ha portato alcun cambiamento.
            ~ firstPauseTalking = firstCharPauseDurantion
            -> main
    
    = eleven
    ~ temp charNameUno = uppercaseTranslator(firstCharacterState)
        //Famiglia d'origine
        ~ firstStoryQuestCount ++
        
        {charNameUno}: Vuoi sapere una cosa buffa? La passione per la musica l'ho presa da mio papà.
        {charNameUno}: Lo stesso uomo che ora vorrebbe cercassi un "lavoro vero".
        {charNameUno}: Casa è piena di vecchi strumenti pieni di polvere.
        {charNameUno}: Sono del nonno paterno.
        {charNameUno}: Papà li tiene come se fossero delle reliquie.
        {charNameUno}: Ma ogni tanto mi permetteva di sentire le vecchie registrazioni, di quando nonno suonava e cantava nelle balere.
        {charNameUno}: E allora ci mettevamo a ballare con lui e mamma.
        {charNameUno}: E in questi ricordi c'è sempre un raggio di sole caldo che gli illumina il sorriso.
        
            + [C'è poco di divino in uno strumento condannato a non suonare.]
                {charNameUno}: Per questo ogni tanto li rubavo e suonavo in camera.
                {charNameUno}: Alcuni avevano un suono storto, forse per colpa delle tarme.
                {charNameUno}: Eppure erano quelli con più storie da raccontare.
                    ~ firstPurple ++
                    
            + [E ora accresci l'albero della tua famiglia.]
                {charNameUno}: In un certo senso.
                {charNameUno}: Per nonno la musica era occasione di unione.
                {charNameUno}: La festa un momento per appianare le divergenze.
                {charNameUno}: E questa è una cosa che posso capire.
                    ~ firstGreen ++
            + [Credi che tuo padre si sia arreso?]
                {charNameUno}: Merda, ci vai giù piano {name}!
                {charNameUno}: No, non credo comunque.
                {charNameUno}: Lui è davvero felice di ciò che fa.
                {charNameUno}: Il problema è che non contempla per le altre persone modi diversi di essere altrettanto felici.
                    ~ firstRed ++
                    
            + [Ti va di ballare con me?]
                {charNameUno}: Sì, ma non ora.
                {charNameUno}: Appena avrò risolto questa cosa del nome, con piacere.
                    ~ firstYellow ++
                    
            + [Esistono lavori veri e lavori non veri?]
                {charNameUno}: Bella domanda.
                {charNameUno}: Ma tendenzialmente per mio padre la risposta è <i>sì</i>.
                {charNameUno}: E non sono veri i lavori che riguardano le mie passioni.
                    ~ firstBlue ++
            -
            
        {charNameUno}: Forse con l'approccio giusto, posso convincere papà ad ascoltare di nuovo le vecchie registazioni di nonno.
        
            ~ firstPauseTalking = firstCharPauseDurantion
            -> main
            
    = twelve
    ~ temp charNameUno = uppercaseTranslator(firstCharacterState)
    ~ firstStoryQuestCount ++
    
        {charNameUno}: A pensarci, per certi versi, mamma è più cinica di papà.
        {charNameUno}: È grazie a lei se papà ha ceduto e mi sono iscritta al conservatorio.
        {charNameUno}: Ma per lei l'obiettivo è che mi trasformi in Lang Lang, Mitsuko Uchida, Alfred Brendel.
        {charNameUno}: Prestigio, onoreficienze e denaro.
        {charNameUno}: Chi glielo dice che a ventitrè anni per queste cose sono già vecchia?
        {charNameUno}: Con queste premesse la mia strada è totalmente sbagliata.
        
            + [Secondo te tua mamma vuole il tuo o il suo di bene?]
                {charNameUno}: Forse quello del nome della famiglia.
                {charNameUno}: Come se poi fosse prestigioso.
                {charNameUno}: Mamma ha poche radici, e allora continua a guardare al futuro.
                    ~ firstGreen ++
                    
            + [Tutt3 e tre hanno fatto concerti prima della maggiore età.]
                {charNameUno}: Esattamente.
                {charNameUno}: Per cui direi che sono fallita e posso appendere il piano al muro.
                {charNameUno}: E non dire che non è una cosa fattibile o urlo.
                    ~ firstBlue ++
                
            + [La strada sbagliata è sempre quella con più insegnamenti.]
                {charNameUno}: Vero, credo.
                {charNameUno}: Ma presto o tardi dovrò pure capire come mangiare, e a quel punto cosa me ne faccio di quegli insegnamenti?
                        ~ firstRed ++
                        
            + [Ma loro si divertono, quando suonano?]
                {charNameUno}: Credo di sì. Uchida è una gioia per gli occhi.
                {charNameUno}: Anche se forse non lo chiamerei divertimento.
                {charNameUno}: Va in un altro luogo, un posto speciale che non ho ancora trovato.
                    ~ firstYellow ++
                    
            + [Cambiamo sempre, ma non possiamo diventare qualcun altro.]
                {charNameUno}: Dillo a lei.
                {charNameUno}: Forse è la cosa più difficile di questo periodo.
                {charNameUno}: Non se ne rende conto, ma è come se mi dicesse sempre che sono sbagliata.
                    ~ firstPurple ++
            -    
            ~ firstPauseTalking = firstCharPauseDurantion
            -> main

  
        
=== first_character_opinions
~ temp charNameUno = uppercaseTranslator(firstCharacterState) 
    //Le sue opinioni comunque ci fanno capire meglio il modo in cui vede il mondo e parte della sua vita fuori da qui.
    {charNameUno}: {~ Bisogna sporcarsi le mani. Nelle cose. Non c’è contatto con le vita se le mani sono sempre pulite.|Le dita devono sapere di terra, come quando da bambina non avevi paura di cadere. Che cosa c’è di vivo se sono sempre pulite?|Secondo te potrei insegnare alle api a creare un quartetto? Con quelle codine sarebbero perfette con la viola. O forse qualcosa da suonare con le ali, che vibri. Potrebbero muoversi nella cassa di una chitarra e fare i loro suonini.|Durante le lezioni il prof Ghiberti aveva l’abitudine di tirarsi il colletto del maglioncino. Li aveva tutti rovinati, se li tirava così tanto che a volte ti chiedevi se gli mancava l’aria.|Al Conservatorio ci sono troppe cose che non c’entrano con la musica. C’è competitività, c’è senso di fretta, di perfezione. Però mi manca, sai? Tutto quello che sta tra una lezione e l’altra, tutto quel parlare di musica mi faceva sentire viva.|Quando ho solo la mia chitarrina, è come se uscisse un’altra me. Non conta più l’insieme ma il momento, la singola nota è come un tratto di pennello, e improvvisare diventa come dipingere. Non so improvvisare col pianoforte, ci sono troppe aspettative.|Litigo spesso con mio padre. È un brav’uomo, molto pratico. Si preoccupa per me perché nel suo mondo tutto fatto di numeri e linee uscire dalla via principale significa morire. E forse ha ragione ma per me è morire anche restare in quelle cose. Schiacciata tra quelle regole.}
            -> main


 === first_story_gift ===
~ temp charNameUno = uppercaseTranslator(firstCharacterState)
<i> Stai per donare qualcosa a {charNameUno}.</i>
        + {findedGifts != ()} [Scelgo il dono.]
            ~ currentReceiver += FirstCharacter
            -> gestione_inventario -> ink_outcome 
        + {findedGifts == ()} <i> Il tuo inventario è vuoto.</i>
            ->main
        
    
        = ink_outcome    
            <i>Dopo il tuo dono {inkTranslator(firstCharacterInkLevel)}.
                 -> talk_with_first_character
            //queste opzioni poi non saranno scelte dirette, ma risultati delle scelte fatte durante il gioco

    === first_story_chech_trigger
      ~ temp charNameUno = uppercaseTranslator(firstCharacterState)
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
~ temp charNameUno = uppercaseTranslator(firstCharacterState)
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
    ~ temp charNameUno = uppercaseTranslator(firstCharacterState)
        {charNameUno}: Ho realizzato una cosa, una cosa su noi due.
            -> firstAffinityCalc ->
        {firstPurple && firstYellow > firstBlue: {charNameUno}: Sento ancora la mancanza di Talco, ma con te mi sento come se fossimo parte da sempre della stessa band.}
        {firstPurple or firstYellow > firstBlue:{charNameUno}: Ci sono momenti in cui cantiamo all'unisono, ed è bello. Mi sento ascoltata.}
        {firstPurple &&  firstYellow < firstBlue: {charNameUno}: Facciamo parte di due cori diversi, vero? Non credo tu abbia preso una sola delle mie note.}
        {not (firstPurple && firstYellow > firstBlue) && not (firstPurple or firstYellow > firstBlue) && not (firstPurple &&  firstYellow < firstBlue): {charNameUno}: A volte siamo sullo stesso brano, altre no. E non ho ancora capito chi tra noi stia ignorando l'altra parte.}
        {charNameUno}: E credo di aver capito perché il mio nome qui è {charNameUno}.
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
            
            + [Credo di sapere come aiutarti.]
                -> statement
            + [Capisco il tuo dolore, ma ho bisogno di riflettere un attimo.]
                -> main


    = statement
    ~ temp charNameUno = uppercaseTranslator(firstCharacterState)
        <i>A seguito del rapporto che hai creato con {charNameUno}, questo è l'inchiostro che hai a disposizione per aiutarla riscrivere la sua storia.</i>
        //Sopra ho già aggiornato il livello di inchiostro e quindi di affinità.
            ~ inkLevel(firstCharacterInkLevel)
        + [Voglio cominciare la riscrittura.]
            -> firstNaming -> 
            -> one
        + [Preferisco prendermi del tempo.]
            -> main

    TODO: per questi quattro punti mettere un po' di cenni anche alle altre tre "storie"
    = one
    ~ temp charNameUno = uppercaseTranslator(firstCharacterState)
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
                	- firstCharacterPossibleStates hasnt Rinuncia:
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
    ~ temp charNameUno = uppercaseTranslator(firstCharacterState)
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
                	- firstCharacterPossibleStates hasnt Rinuncia:
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
    ~ temp charNameUno = uppercaseTranslator(firstCharacterState)
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
        
        + [Ma ogni persona ha immaginato sorti diverse per Jonah.]
            {name}: E nessuna di queste è una fine.
                {
                	- firstCharacterPossibleStates hasnt Rinuncia:
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
    ~ temp charNameUno = uppercaseTranslator(firstCharacterState)
        {name} Questo posto ti ha assegnato un nome, e quel nome è Rinuncia.

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
                	- firstCharacterPossibleStates hasnt Rinuncia:
    		            ~ firstCharacterPossibleStates --
    		           {debugChangeName: Diminuisco lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }            
        
        + [C'è più coraggio nella rinuncia che nel compromesso.]
            {name}: Spesso è più costosa, ma la coerenza personale non ha prezzo.
            
        -
        
        -> ending

    = ending
    ~ temp charNameUno = uppercaseTranslator(firstCharacterState)
     Per questo ti dico...
        + {firstRed > 0} [Prendi una strada e se non ti piace cambiala!]
        
        + {firstPurple > 0} [Dai alla tua vita uno scopo più grande.]
        
        + {firstYellow > 0} [Ogni gioco richiede una pausa, e tu hai bisogno di ascoltarti.]
                
        + {firstGreen > 0} [Non deluderai i tuoi amici: loro saranno sempre con te.]
                
        + {firstBlue > 0} [Questa non è la tua strada. Succede. Ora puoi cambiare.]
                
        
                
        -     
        
    {charNameUno}: Grazie, {name}.
    {charNameUno}: Mentre parlavi mi è nata una nuova canzone in testa.
    {charNameUno}: Qualcosa di fresco, di pronto a cambiare.
    {charNameUno}: La canzone del mio vero nome.
        
        {
            - firstCharacterPossibleStates has Rinuncia:
                {charNameUno}: Che <b>resterà Rinuncia</b>, perché l'unica cosa che posso fare, è far sì che altr3 scelgano per me.
            
            - firstCharacterPossibleStates has Triangolo:
                {charNameUno}: E il mio vero nome è <b>Triangolo</b>, perché pensavo di essere uno strumento, e invece ho solo fallito.
                    ~ firstCharacterState = ()
                    ~ firstCharacterState += Triangolo
            
            - firstCharacterPossibleStates has RagazzaOrchestra:
                {charNameUno}: Mi chiamerò <b>Ragazza Orchestra</b>: nel non saper rinunciare sono diventata l'ornitorinco della musica.
                    ~ firstCharacterState = ()
                    ~ firstCharacterState += RagazzaOrchestra
            
            - firstCharacterPossibleStates has FlautoDolce:
                {charNameUno}: Il mio nome è <b>Flauto Dolce</b>: perché semplice, elementare, ma apprezzata da chi ha buon cuore.
                    ~ firstCharacterState = ()
                    ~ firstCharacterState += FlautoDolce                
            
            - firstCharacterPossibleStates has Ocarina:
                {charNameUno}: Mi chiamerò <b>Ocarina</b>: perché il suo suono è gioco e festa.
                    ~ firstCharacterState = ()
                    ~ firstCharacterState += Ocarina
            
            - firstCharacterPossibleStates has Violino:
                {charNameUno}: Io sono <b>Violino</b>: perché anche se suono bene da sola, do il meglio di me stessa suonando con e per gli altri.
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
    ~ temp charNameUno = uppercaseTranslator(firstCharacterState)
        {charNameUno}: C'è una cosa che vorrei dirti, {name}.
        {charNameUno}: Riguarda Il mentore.
        {charNameUno}: Qual è il confine tra essere un bravo ragazzo ed essere un manipolatore?
        {charNameUno}: Me lo sto chiedendo da quando sono arrivata.
        {charNameUno}: E se hai intenzione di restare qui a lungo, forse devi chiedertelo anche tu.
            ~ firstStory = Ended
            ~ movementsCounter = 0
            ~ PG_advace_management(firstStory)
                -> main
            
    = exit
    ~ temp charNameUno = uppercaseTranslator(firstCharacterState)
        {charNameUno}: Credo rimarrò ancora in giro per un poco, in attesa del prossimo bus.
            ~ firstStory = Ended
            ~ movementsCounter = 0
            ~ PG_advace_management(firstStory)
        -> main  
    
=== first_char_story_ended
~ temp charNameUno = uppercaseTranslator(firstCharacterState)
//Con questa formula dopo un tot di scambi la personaggia se ne va salutandoci.
//In alcune situazioni questa cosa non c'è, in altre c'è solo se ho determinati status (es: socievole). In altri non c'è la possibilità che la personaggia se ne vada senza averci salutate (e quindi non c'è l'opzione in story_start)

    {
        - firstCharEndingDialogue < 4:
            -> top
        - else:
            -> goodbye
    }
    
        - (top)
        {charNameUno}: {~ Mi chiedo se le cose sarebbero andate diversamente, se Talco fosse arrivatə qui con me.|Sono sicura di aver visto un'altra persona alla fermata del bus, ma quando ho cercato di raggiungerla è scomparsa.|Ogni tanto te la prendi una pausa da questo posto, vero?|Sapevi che a volte c'è una rana nello stagno che circonda la serra?}
                ~ firstCharEndingDialogue ++
        -> main
        
        = goodbye
        ~ temp charNameUno = uppercaseTranslator(firstCharacterState)
        {charNameUno}: {name}, per me è arrivato il momento di tornare a casa.
        {firstCharacterPossibleStates hasnt Rinuncia: {charNameUno}: Non so di preciso cosa mi accadrà ora, ma in un certo senso so che sono più pronta.}
        {firstCharacterPossibleStates hasnt Rinuncia: {charNameUno}: Grazie per quello che hai fatto, davvero.}
        {firstCharacterPossibleStates has Rinuncia: {charNameUno}: Vedremo cosa mi accadrà.}
            ~ move_entity(FirstCharacter, Safekeeping)
            //Abbiamo accesso alle note solo se è cambiata. Sennò lei se ne va abbastanza arresa da tutto.
            {
                - firstCharacterPossibleStates hasnt Rinuncia:
                    ~ move_entity(FirstCharacterNotes, BusStop)
            }    
            
        -> main
















