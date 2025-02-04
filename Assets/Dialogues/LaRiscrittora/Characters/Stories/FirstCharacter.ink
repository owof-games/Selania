=== personaggia_uno ===
~ temp charNameUno = uppercaseTranslator(firstCharacterState)
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
    //Presentazione.
    ~ temp charNameUno = uppercaseTranslator(firstCharacterState)
    ~ firstStoryQuestCount ++
    
    ???: Non è che hai visto passare di qui una persona?
    ???: Altə all’incirca come una balla di fieno e che si muove come un violino, probabilmente presə a stordire di domanda quel tizio, il mentore.
    ???: Oh, non posso essere arrivata qui da sola, vero? Ma che poi, cos’è qui?
        + [Opzione che aumenta il blu]
            ~ firstBlue ++
            Reazione leggermente infastidita
        + [Opzione che aumenta il giallo]
            ~ firstYellow ++
            Reazione positiva
        + [Opzione che aumenta il rosso]
            ~ firstRed ++
            Reazione neutra
        + [Opzione che aumenta il verde]
            ~ firstGreen ++
            Reazione neutra
        + [Opzione che aumenta il viola]
            ~ firstPurple ++
            Reazione positiva
        -
    ???: Talco, dimmi che sei qui anche tu, ti prego, non so capire il mondo senza di te.
    ???: Ma che rinco che sono, non mi sono manco presentata: io sono {charNameUno}.
    {charNameUno}: No, io sono {charNameUno}.
    {charNameUno}: Ehi! Non è questo il mio nome.
    {charNameUno}: <i>{charNameUno}</i>.
    {charNameUno}: Forse se provo a dirlo al contrario? Nome contrario.
    {charNameUno}: Uh. Uh.
    {charNameUno}: Prova tu. Come ti chiami?
	    + {name_choice} [Mi chiamo {name}.]
	    + [Il mio nome è...]
	        -> name_choice ->
	    -
	{not gender}: E con che pronomi vuoi che ti chiami?
	    {not gender: -> gender -> }
    {charNameUno}: Credi che il tuo nome sia importante?
	    + [Opzione che aumenta il blu]
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
   {charNameUno}: Comunque sì, ti si addice benissimo, hai proprio una faccia da {name}.
   {charNameUno}: Forse la mia faccia è cambiata? Ti sembro una {charNameUno}?
        + [Opzione che aumenta il blu]
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
    {charNameUno}: No, non dirmelo.
    {charNameUno}: So che non può essere qui, ma non voglio ancora accettare questa solitudine.
    {charNameUno}: Mi prendo un po’ di tempo per me {name}, a dopo.
         ~ firstPauseTalking = firstCharPauseDurantion
        -> main
        
    = two
    //Paura di deludere la famiglia scelta
    ~ temp charNameUno = uppercaseTranslator(firstCharacterState)
    ~ firstStoryQuestCount ++
    
    {charNameUno}: Alla fine, niente Talco.
    {charNameUno}: Non ricordo quando è stata l'ultima volta che sono andata da qualche parte senza di ləi.
    {charNameUno}: Prima mi sono persa nel cercarlə.
    {charNameUno}: Ok, forse mi sono distratta nel cercar di  raggiungere uno scoiattolo perché aveva la ghianda più bella che avessi mai visto e volevo insegnargli a suonarla, e a una certa mi sono ritrovata tra gli alberi senza sapere dove andare e c’era otto sentieri diversi davanti a me.
    {charNameUno}: Otto!
    {charNameUno}: Ma poi come fanno ad esserci otto sentieri in un posto dove ci siamo solo noi?
        + [Opzione che aumenta il blu]
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
    {charNameUno}: Anna e Olga discutono spesso su questa cosa, perché Olga pensa che con la classica sia sprecata, che devo mettere su una band e invadere tutti i locali della città.
    {charNameUno}: A volte Olga pensa che Talco la veda come lei, ma in realtà Talco è dell’idea che debba puntare sui reality show: dice che non importa vincere, importa farmi vedere, e magari fare qualcosa di casinoso così poi sui social se ne parla.
    {charNameUno}: E poi Ennio, no Ennio no.
        + [Opzione che aumenta il blu]
            ~ firstBlue ++
            Posso mettere delle variazioni per cui a seconda di quale sia lo stato di un colore o l'altro (tanto è tutto lineare questo blocco) posso avere reazioni diverse.
        + [Opzione che aumenta il giallo]
            ~ firstYellow ++
        + [Opzione che aumenta il rosso]
            ~ firstRed ++
        + [Opzione che aumenta il verde]
            ~ firstGreen ++
        + [Opzione che aumenta il viola]
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
    //Silenzio
    ~ temp charNameUno = uppercaseTranslator(firstCharacterState)
    ~ firstStoryQuestCount ++
    
    {charNameUno}: Questo posto è carino, ma il silenzio è faticoso.
    {charNameUno}: Come si può stare in un posto che non ha nemmeno un accenno di musica, di ritmo?
        + [Opzione che aumenta il blu]
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
    {charNameUno}: Sono abituata a stare tra gente diversa, sai?
    {charNameUno}: A vivere nella festa.
    {charNameUno}: Vivo in una casa con altre cinque persone, un posto pieno di muffa e corridoi e camere con collegamenti assurdi, ma tutto questo non pesa perché c’è sempre festa, c’è sempre qualcosa di giocoso da fare.
    {charNameUno}: Talco crea strumenti con qualsiasi cosa trovi in giro.
    {charNameUno}: D’estate quando scende il caldo saliamo sul tetto e iniziamo a cantare e improvvisare e a quel punto vento e sudore si portano via le preoccupazioni e non c’è nulla a cui pensare.
    {charNameUno}: E allora arriva la sensazione, quel sentirti parte di tutto, priva di confini.
    {charNameUno}: Sei la musica, sei l’umidità nell’aria, sei la lingua del vicino che si lamenta del casino.
    {charNameUno}: Ma qui, qui è tutto così calmo, posso sentire i pensieri dei miei pensieri e rimango intrappolata dentro a me stessa.
            + [Opzione che aumenta il blu]
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
    //Paura delle conseguenze della scelta.
    ~ temp charNameUno = uppercaseTranslator(firstCharacterState)
    ~ firstStoryQuestCount ++
    
    {charNameUno}: Conoscevo questo ragazzo, Jonah.
    {charNameUno}: Un genio, per me un genio.
    {charNameUno}: Ti prendeva in mano un’arpa e trasformava il suo suono in qualsiasi cosa.
    {charNameUno}: Per due anni ha fatto da spalla a un tizio di Beijing, una specie di rockstar della musica classica in Cina, ma poi Jonah ha iniziato a sentire la mancanza dell’Europa e ha cercato di fare una carriera da solista.
    {charNameUno}: Però, man mano che le porte si chiudevano, si chiudeva anche la sua sicurezza, e il suo amore per la musica.
    {charNameUno}: Ora non so più dove sia, Jonah.
    {charNameUno}: Qualche compagna di corso giura di averlo visto mendicare, qualche altro che suona sotto pseudonimo alle feste di odiosi ricconi.
    {charNameUno}: Una volta ho creduto di averlo visto lavorare in un supermercato.
    {charNameUno}: Cosa puoi fare quando sai fare bene solo una cosa ma il mondo non ti permette di farla?
    {charNameUno}: Scendi a compromessi, o accetti il rischio di morire di fame?
    {charNameUno}: O aspetti fino a quando non sia il mondo a decidere per te?
        + [Opzione che aumenta il blu]
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
    //Razionalità
    ~ temp charNameUno = uppercaseTranslator(firstCharacterState)
    ~ firstStoryQuestCount ++
    
    {charNameUno}: Stavo ripensando al prof Ghiberti.
    {charNameUno}: Te ne ho già parlato? Non ricordo.
    {charNameUno}: Lui vede tutta la musica come una cosa matematica.
    {charNameUno}: Non è una cosa strana, ci sono pianisti che trattano il piano come se fosse un abaco, ma senza rinunciare alla poesia.
    {charNameUno}: Per Ghiberti invece tutto va ridotto a una specie di lista di elementi primitivi che possono essere combinati solo in un determinato modo per ottenere soluzioni prevedibili.
    {charNameUno}: Una volta a vocina bassa ha detto che il jazz è un errore.
        + [Opzione che aumenta il blu]
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
    {charNameUno}: A me spaventa un sacco quel sorriso, quel modo di fare. Tutti questi numerini e fattori tolgono l’esperienza, l’errore, il senso di comunità. Una comunità canta, ma per farlo deve sbagliare, essere imprevedibile.
    {charNameUno}: Che diavolo ci fai con una canzone fatta con la sola precisione?
    {charNameUno}: È come quella roba con l’AI, orecchiabile, prevedibile, dimenticabile.
    {charNameUno}: Odio poche cose, ma questa su tutte: odio tutte le cosine pratiche e calcolabili sono una rinuncia alla vita.
        + [Opzione che aumenta il blu]
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
    ~ firstStoryQuestCount ++
        + [Opzione che aumenta il blu]
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
    
    = seven
    ~ temp charNameUno = uppercaseTranslator(firstCharacterState)
    ~ firstStoryQuestCount ++
        + [Opzione che aumenta il blu]
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
    {~ Bisogna sporcarsi le mani. Nelle cose. Non c’è contatto con le vita se le mani sono sempre pulite.|Le dita devono sapere di terra, come quando da bambina non avevi paura di cadere. Che cosa c’è di vivo se sono sempre pulite?|Secondo te potrei insegnare alle api a creare un quartetto? Con quelle codine sarebbero perfette con la viola. O forse qualcosa da suonare con le ali, che vibri. Potrebbero muoversi nella cassa di una chitarra e fare i loro suonini.|Durante le lezioni il prof Ghiberti aveva l’abitudine di tirarsi il colletto del maglioncino. Li aveva tutti rovinati, se li tirava così tanto che a volte ti chiedevi se gli mancava l’aria.|Al Conservatorio ci sono troppe cose che non c’entrano con la musica. C’è competitività, c’è senso di fretta, di perfezione. Però mi manca, sai? Tutto quello che sta tra una lezione e l’altra, tutto quel parlare di musica mi faceva sentire viva.|Quando ho solo la mia chitarrina, è come se uscisse un’altra me. Non conta più l’insieme ma il momento, la singola nota è come un tratto di pennello, e improvvisare diventa come dipingere. Non so improvvisare col pianoforte, ci sono troppe cose. Però con la chitarra posso fare qualunque cosa.|Litigo spesso con mio padre. È un brav’uomo, molto pratico. Si preoccupa per me perché nel suo mondo tutto fatto di numeri e linee uscire dalla via principale significa morire. E forse ha ragione ma per me è morire anche restare in quelle cose. Schiacciata tra quelle regole.}

            -> main


 === first_story_gift ===
 ~ temp charNameUno = uppercaseTranslator(firstCharacterState)
 
        + {findedGifts != ()} Offro un dono. 
            -> gestione_inventario -> ink_outcome 
        + {findedGifts == ()} <i> Il tuo inventario è vuoto </i>
            ->main
        
    
        = ink_outcome    
            Dopo il tuo dono {inkTranslator(firstCharacterInkLevel)}.
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
    {charNameUno}: Dice qualcosa.
        -> firstAffinityCalc ->
        {firstPurple && firstYellow > firstBlue: {charNameUno}: Commento positivissimo.}
        {firstPurple or firstYellow > firstBlue:{charNameUno}: Commento medio.}
        {firstPurple &&  firstYellow < firstBlue: {charNameUno}: Commento meh.}
        {not (firstPurple && firstYellow > firstBlue) && not (firstPurple or firstYellow > firstBlue) && not (firstPurple &&  firstYellow < firstBlue): {charNameUno}: Commento base.}
    Abbiamo lo stato dell'inchiostro complessivo
        ~ inkActions(firstCharacterInkLevel)
        -> statement

    = statement
        Qui dichiaro sostanzialmente su cosa voglio concentrarmi.
        Non porta un'effettiva variazione di qualcosa, è utile solo per la giocatrice per capire su quali direzioni può andare.
        O forse è qualcosa che dichiara la personaggia.
        -> one
    
    = one
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
        Secondo giro
        {
        - firstCharacterInkLevel == Low:
            -> ending
        - else: 
            -> three
        }
        
    = three
        Terzo giro
        {
        - firstCharacterInkLevel == Normal:
            -> ending
        - else: 
            -> four
        }
    
    = four
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
    Ciao ciao
        ~ move_entity(FirstCharacter, Safekeeping)
        ~ move_entity(FirstCharacterNotes, BusStop)
    -> main
















