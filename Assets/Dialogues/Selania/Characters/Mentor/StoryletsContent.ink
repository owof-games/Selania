/* ---------------------------------

       Storylets tutorial

 ----------------------------------*/

=== welcome ===
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameThree = translator(thirdCharacterState)
    ~ temp charNameFour= translator(fourthCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    
        Sapevo che sarebbe arrivata una nuova persona!#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_hurry
        Immagino tu abbia un milione di domande, vero?
        - (top)
            * (dove) [Dove sono?]
                 Questo luogo non ha un nome.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
                 Per me è <b>Il giardino</b>, ma vedrai anche tu che è anche molte molte altre cose.
                 E probabilmente prenderai a chiamarlo con un nome tutto tuo.
                 La cosa che posso dirti con certezza è che faccio di tutto per renderlo un posto sicuro.
                 Un posto dove prenderti cura di te.
                 Non male, no?#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_hurry
                 Soprattutto quando fuori da qui è difficile trovare un senso.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_sorry
                    -> top
            
            * (chiSei) [Chi sei?]
                La persona che tiene in piedi questo luogo!#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_hurry
                Ma tu puoi chiamarmi <b>{translator(fifthCharacterState)}</b>.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral 
                Così puoi ricordarti con facilità qual è il mio scopo.
                    -> top
            
            * (vado) [Come me ne vado da qui?]
                 Vuoi già andartene?#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_sad
                 Forse devo rivedere il mio benvenuto.
                 Forse sono stata troppo formale?#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_sorry
                 O dovrei essere più autorevole?#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_hurry
                 Ma non devo essere scortese ora.
                 Mi hai fatto una domanda, e vedrò di rispondere.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
                 A est della stazione troverai un sentiero che ti riporterà a casa.
                 E se deciderai di tornare, troverai tutto nello stato in cui l'hai lasciato.
                    -> top
                    
            * {vado} [Non ho più voglia di parlare.]
                 Lascia che ti rubi giusto un secondo!#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_hurry
                    -> your_name
                
            * {vado or chiSei or dove} [Ma perché sono qui?]
                 Ora tocca a me farti una domanda.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_hurry
                    -> your_name
                
            * -> your_name
    
    = your_name
        ~ temp charNameOne = translator(firstCharacterState)
        ~ temp charNameFive = translator(fifthCharacterState)
        
        Come ti devo chiamare?#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_hurry
        Puoi usare un nome qualsiasi: prendi questa occasione come un nuovo inizio.
            -> name_choice ->
        E quali sono i tuoi pronomi?#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
            -> gender ->
        Piacere di conoscerti, {name}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_hurry
        E {pronouns has him:benvenuto|{pronouns has her:benvenuta|benvenutə}}.
        Con me usa pure i pronomi femminili.
        {not chiSei: ???: Ah, che sbadata. Mi chiamo <b>{charNameFive}</b>.|E il mio obiettivo è farti stare bene.}#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
        - (selfName)
        Tra poco ti spiegherò anche il tuo lavoro, {name}.
        Ma prima: una cosa im-por-tant-tis-si-ma!#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_hurry
        In questo luogo avrai a che fare con persone e altre cose viventi con una propria storia.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
        E ogni storia ha le sue complessità.
        E questo si traduce con il rischio che tu possa incontrare tematiche per te faticose.
        Ma non preoccuparti: ogni luogo e ogni persona ha il suo modo di avvisarti, e di permetterti di scegliere cosa fare.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_hurry
        E se dovessi decidere di saltare qualcosa perché non è nelle tue corde, non ti perderai nulla di questa esperienza.
        Come dico sempre: sicuro è bello!
        E a proposito di sicurezza: non c'è nulla di più sicuro del riposo.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
        Non per me, ovviamente.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_hurry
        Se senti il bisogno di staccare, puoi tornare in camera, il posto da cui sei {pronouns has him:arrivato|{pronouns has her:arrivata|arrivatə}}e stenderti sul letto.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
        Al risveglio, troverai tutto come l'hai lasciato.
        Mannaggia a me, sto aprendo così tante parentesi che mi sono dimenticata di dirti cosa devi fare.
        Perché se sei qui, è per uno scopo, uno scopo davvero importante, {name}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_hurry
            
            {
                - not talk_with_first_character: 
                    Facciamo così: inizia parlando con la persona {entity_location(PG) == TrainStop:al nostro fianco.|che troverai alla <b>stazione del treno</b>.}#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
                    E poi torna da me.
                    @animation:RewriterBook
                    Io devo raccogliere le foglie dalla foresta.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_hurry
                        ~ firstPauseTalking = 0
                        ~ move_entity(FifthRecap, BookPlace)
                        ~ move_entity(RulesRecap, BookPlace)
                    -> main
                
                - talk_with_first_character:
                    Eh. Uh, wow {name}! Hai già fatto il primo compito ancora prima che te lo dicessi!#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_hurry
                    Sicuro sicuro mi riempirai di soddisfazioni!
                    Sono contenta che {charNameOne} ti abbia già raccontato qualcosa di sè!
                    @animation:RewriterBook
                    Cavolo, sei qui da pochissimo e già mi rendi orgogliosa di te!
                    Quindi: passiamo allo step successivo!
                        ~ move_entity(FifthRecap, BookPlace)
  
                        -> gifts_and_ink
    
            }

            
=== gifts_and_ink
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameThree = translator(thirdCharacterState)
    ~ temp charNameFour= translator(fourthCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
        
        In questo luogo ogni tanto compariranno delle persone nuove.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
        Sono persone rimaste bloccate in qualcosa: rimpianti, rimorsi, traumi.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_sad
        Ma per loro fortuna ci sarai qui tu, {name}, ad aiutarle!#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_hurry
        Il modo più semplice è ascoltarle.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
        Accogli le loro storie, cerca di capire quale sia la cosa giusta da dire per farle sentire comprese.
        Conquista la loro fiducia.

        {
            - knowing_first_character.one.oneYellow:
            Ad esempio: parlare con {charNameOne} dei violini e dei tamburi è stato un ottimo inizio!#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_hurry
            
            - knowing_first_character.one.oneRed:
            Ad esempio, suggerire di cercare Talco con l'olfatto per esempio è stata un'idea originale, ma non ho percepito {charNameOne} particolarmente entusiasta.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_sad
            
            - knowing_first_character.one.oneBlue:
            Ad esempio, avrai notato che un atteggiamento concreto con {charNameOne} non è un buon inizio, ma è colpa mia, è mio dovere darti le giuste indicazioni.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_sorry
            
            - knowing_first_character.one.oneGreen:
            Per esempio la tua proposta di ascoltare {charNameOne} è stata molto tenera, ma non sono sicura che sia molto nelle sue corde.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
            
            - knowing_first_character.one.onePurple:
            Ad esempio, dire a {charNameOne} che Talco sarà sempre con lei ti ha fatto partire col piede giusto. Sono orgogliosa di te!#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_hurry
        
        }
        
        Ma perché vogliamo la loro fiducia?#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
        Perché quando queste persone si saranno aperte con te, ti verrà offerta l'occasione di dare loro un </b>dono<b>.
        Il dono è una cosa che puoi fare una sola volta, ed è il tuo modo di dimostrare a una persona che l'hai capita.
        E per aver qualcosa da donare dovrai faticare, {name}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_hurry
        Ad esempio, coltivando qualcosa <b>alla serra</b>.
        Tutto chiaro fino a qui?#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral

            + [Matematico: ascolto, analizzo, scelgo il dono.]
                Esatto!#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_hurry
                Siamo sulla stessa lunghezza d'onda noi due!
                ~ fifthBlue ++
                    
            + [Come un gioco: comprendi il loop, dai il meglio di te.]
                Sono troppo vecchia per giocare, ma credo tu abbia centrato il punto.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
                ~ fifthYellow ++
                    
            + [Quindi devo lavorare senza ricevere mezzo soldo.]
                Non è un lavoro.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_bored
                E qui non c'è denaro.
                Ma è colpa mia, sto dando troppe cose per scontato.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_sad
                ~ fifthRed ++
                    
            + [Mi piace l'idea di creare una relazione con queste persone.]
                Un po' di distacco è utile, per non farti ferire.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_sorry
                Vediti più come {pronouns has him: un amico|{pronouns has her: un'amica|unə amicə}}, che aiuta una persona a vedersi in modo diverso.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
                ~ fifthGreen ++
                    
            + [La fiducia non si conquista, la fiducia è un dono.]
                Ho usato delle parole frettolose, scusa.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_sorry
                Ma sì: tu doni loro tempo e ascolto, e loro ti donano la propria fiducia.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
                ~ fifthPurple ++
            -
        
        E qui arriviamo alla parte pià importante di tutte: il dono è importante non solo per guadagnare fiducia.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
        Il giusto dono può anche aumentare la tua quantità di <b>inchiostro</b>.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_hurry
        Perché tu {pronouns has him:amico mio|{pronouns has her:amica mia|amicə miə}} sei <b>{pronouns has him:un riscrittore|{pronouns has her:una riscrittora|unə riscrittorə}}</b>!#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_hurry
        Aiuti queste persone bloccate a riscrivere la propria storia in modo diverso, a scegliersi un nuovo nome.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
        
            + [E tu hai bisogno di un nuovo nome?]
                Io?#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
                No!#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_bored
                Questo è stato, è e sarà sempre il mio nome.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
                    ~ fifthPurple ++
                    
            + [Con l'inchiostro ci posso disegnare?]
                Apprezzo la tua creatività, {name}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
                Ma tu sei {pronouns has him:un riscrittore|{pronouns has her:una riscrittora|unə riscrittorə}}, non {pronouns has him:un disegnatore|{pronouns has her:una disegnatrice|unə disegnatricə}}.
                    ~ fifthYellow ++
                    
            + [Solo le persone care ci fanno vedere in modo diverso.]
                A volte è più facile aprirsi a chi non si conosce.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
                E mentre noi riflettiamo sulle loro difficoltà, impariamo anche qualcosa su di noi.
                        ~ fifthGreen ++
                        
            + [Tipo gaslighting?]
                No no no assolutamente no.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_sad
                Cavolo, devo essere più chiara.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_sorry
                Ma se una persona si sente presa in giro, non si fiderà mai di te.
                        ~ fifthRed ++
            
            + [Un nome è un nome. Che se ne fanno di uno nuovo?]
                Un nome è come una magia.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
                Lo carichiamo di volta in volta di significato.
                E quando lo usiamo, ci dice chi siamo.
                A volte quella magia non va più bene, e dobbiamo cercare una nuova formula. Un nuovo nome.
                    ~ fifthBlue ++
            -
            
            Non voglio stordirti di informazioni, per cui ti lascio un po' di suspence, e ti spiegherò più avanti a cosa serve l'inchiostro, e cosa significhi essere {pronouns has him:un riscrittore|{pronouns has her:una riscrittora|unə riscrittorə}}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
            Ora devo trovare un modo per levare {entity_location(PG) == Forest:queste travi che bloccano il sentiero|le travi che bloccano il sentiero a ovest della foresta}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_hurry
            Questo posto morirebbe senza me.
            @animation:RewriterBook
            Quando avrai conquistato la fiducia di una persona e le avrai donato qualcosa, torna da me per le ultime istruzioni.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
                {
                - not cultivable_test: Uh, che sbadata! Ti servirà di sicuro qualcosa per raccogliere gli oggetti!
                    {
                        - forestContents has PG:
                            ~ move_entity(Inventory, Forest)
                        
                        - trainStopContents has PG:
                            ~ move_entity(Inventory, TrainStop)
                        
                        - pondContents has PG:
                            ~ move_entity(Inventory, Pond)                            
                    
                    }
                - else: Noto che hai già uno zainetto con te.
                }
            {not cultivable_test: Ecco, prendi!| Spero non sia qualcosa che hai trovato in giro: questo posto è delicato.}
                - (sbadata)
            
            ~ move_entity(RulesRecap, BookPlace)      
            ~ firstPauseTalking = 0
                -> main
             

    
=== questions
        ~ temp charNameOne = translator(firstCharacterState)
        ~ temp charNameTwo = translator(secondCharacterState)
        ~ temp charNameThree = translator(thirdCharacterState)
        ~ temp charNameFour= translator(fourthCharacterState)
        ~ temp charNameFive = translator(fifthCharacterState)

            Ed eccoci con l'ultima lezione: parliamo dell'inchiostro e della riscrittura.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
            Più sei in confidenza con la persona e più le hai dato un dono gradito, più avrai inchiostro a disposizione per aiutarla a riscrivere la sua storia.
            Tra mentori definiamo le azioni che l'inchiostro permette di compiere <b>riscritture</b>, un po' come quando riscriviamo un testo.
            E quello che ogni riscrittorə andrà a revisionare è il modo in cui la persona legge determinati temi della sua vita.
            Magari una persona si definisce così insicura da chiamarsi <i>Pasticcio</i>, ma lə riscrittorə ha colto nella sua storia che non c'è alcun pasticcio, ma il coraggio di buttarsi in situazioni scomode.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_hurry
            Oppure si definirà <i>La Temibile</i>, ma invece di far paura, ha solo il terrore di mostrare le sue vulnerabilità, e per questo si sente sola.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_sad
            Grazie all'inchiostro, lə riscrittorə aiuterà a riscrivere quella parte della vita della persona.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
            Ogni riscrittorə ha già in sé il potere di effettuare una riscrittura, a prescindere dal rapporto. Ma più inchiostro significa più possibilità di aiutare quella persona a vedersi in un modo nuovo.
            E potrà sempre chiudere una riscrittura con un <b>epilogo</b>: una dichiarazione che permetta alla persona di mettere un punto sul presente, e iniziare a guardare al futuro in modo diverso.
            Così persona e riscrittorə raggiungeranno il loro obiettivo: un nuovo nome, simbolo di un nuovo inizio.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_hurry
            
                + [Hai un consiglio da darmi Mentore?]
                    Ascolta a cuore aperto.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
                    Segui i miei consigli.
                    E non chiedere all'altra persona di diventare qualcosa che non è.
                        ~ fifthGreen ++
                        
                + [Ma non posso dirle: chiamati così e cosà, addio!?]
                    Un nuovo nome è una nuova esperienza.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
                    E l'esperienza viene dal percorso.
                    Se non c'è percorso, non c'è cambiamento.
                        ~ fifthRed ++
                
                + [{charNameOne}: non è una persona razionale. Può farcela?]
                    {name}, capisco la tua perplessità, ma con la giusta guida, ce la può fare.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
                    E assieme noi non possiamo di certo sbagliare!#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_hurry
                        ~ fifthBlue ++
                        
                + [Gli scoiattoli non hanno bisogno di riscriverla, invece?]
                    {name}, apprezzo la tua creatività, ma mantieni l'attenzione sull'obiettivo.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
                    E gli scoiattoli non si fanno queste domande.
                    Gli scoiattoli <i>sono</i>, e basta.
                        ~ fifthYellow ++
                        
                + [Non dovrei essere io a decidere il mio obiettivo?]
                    Il tuo obiettivo <i>qui</i>, perdonami.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
                    Non avendo altri luoghi in cui andare, mi dimentico che possono esserci sono altre vite, altri obiettivi da raggiungere.
                        ~ fifthPurple ++
                -
            Ricorda {name}: sei una guida, ma sta alla persona decidere alla fine chi è, e di cosa ha bisogno.
            Quando te la senti, affronta questo ultimo passaggio e poi torna da me.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
            
            ~ firstPauseTalking = 0
                -> main
        
        
    
   
=== little_storylets
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameThree = translator(thirdCharacterState)
    ~ temp charNameFour= translator(fourthCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    
    Vorrei raccontarti una cosa strana.#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #portrait:PG_neutral
        * (voices){growing_check}[C'è una voce che mi racconta cose.]
            Voce?#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)}  #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
            Sì.#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #portrait:PG_neutral
            Ad esempio mi descrive le piante della serra.
            O i luoghi in cui entro.
            Riscrivere la storie di altre persone richiede una forte empatia.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_sorry
            Sicuramente quella voce è il tuo modo di capire questo luogo.
            Un intuito latente che ora è più forte.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
            Meglio della stanchezza dell'essere mentore, fidati.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_hurry
                ~ somethingStrange --
                -> talk_with_mentor
                
        * (infoImpo){firstCharacterInkLevel has High} [Le personagge hanno informazioni importanti?]
            Dove l'hai sentita questa cosa, stellina?#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
            Quando stavo per fare le ultime domande a {charNameOne}, {voices:la|una} voce mi ha detto quanto inchiostro avevo e che avrei ricevuto una informazione importante.#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #portrait:PG_neutral
            {not voices:Per la voce sarà la stanchezza, questo lavoro è faticoso.|Come ti dicevo, vedrai che è solo la tua empatia che parla.}#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_sad
            Comunque ogni cosa qui è importante, {name}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
            Soprattutto se ti aiuta a raggiungere il tuo obiettivo.
                ~ somethingStrange --
                -> talk_with_mentor
        
        * (talkingWitch) {talking_witch.intro} [Prima ho parlato con le radici nella foresta.]
            E mi hanno chiesto come stavo dopo aver aiutato {charNameOne}.#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #portrait:PG_neutral
            {infoImpo or voices:Stellina, di nuovo con questa voce?|Senti le voci, stellina?}#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_sad
            Sono in questo posto da non so quanto e non ho mai parlato con tronchi o rami o radici.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
            L'unica cosa che ha voce sono le persone che arrivano per chiedere il nostro aiuto.
            Il tuo aiuto.
            Se senti ancora una volte delle voci, prenditi un po' di riposo.
                ~ somethingStrange --
                -> talk_with_mentor
        
        * (talkingFrog) {the_frog.frog} [C'è una rana blu parlante.]
            Una rana. E dove?#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_bored
            {are_entities_together_in(Mentor, PG, Pond):Qui nello stagno.|Allo stagno.}#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #portrait:PG_neutral
            Da che sono qui non ho mai visto rane parlanti, {name}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
            E nemmeno rane e basta.
            Forse è il caso che ti riposi un poco, davvero.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_sad
            Lascia fare a me il resto.
                ~ somethingStrange --
            -> talk_with_mentor
        
        * {foundLibro or take_this_book} [Ho trovato questo libro col mio nome.]
            E raccoglie informazioni su questo posto.#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #portrait:PG_neutral
            E dove l'hai trovato?#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)}  #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
            {foundLibro: Sotto quel vecchio tronco alla foresta.|Me l'ha dato {charNameOne}.}#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #portrait:PG_neutral
            Interessante.#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)}  #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
            Forse è scappato dalla biblioteca?
            Immagino sia comunque utile per il tuo lavoro.
            Spero solo non parli male di me!#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_sad
                -> talk_with_mentor
        
        + [Ripensadonci, non ho nulla di nuovo da dire.]
            -> talk_with_mentor
   
//Feedback//
=== first_character_feedback
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameThree = translator(thirdCharacterState)
    ~ temp charNameFour= translator(fourthCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    
        Hai concluso la tua prima riscrittura, {name}, grande!#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_hurry
        E quindi: è tempo di feedback!
            {
                - are_two_entities_together(FirstCharacter, PG): Mmm, sembra l'ora della pagella. Me ne vado.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB:{ink_tag_b(firstCharacterInkLevel)}  #inkC:{ink_tag_c(firstCharacterInkLevel)}  #inkD:{ink_tag_d(firstCharacterInkLevel)} #portrait:chitarra_annoyed
                        ~ change_entity_place(FirstCharacter)
            }
            {
                - are_two_entities_together(SecondCharacter, PG): Non mi piacciono i voti. Ciao ciao!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_angry
                        ~ change_entity_place(SecondCharacter)
            }            
        
        {
            - firstCharacterPossibleStates has Triangolo:
                Hai aiutato {charNameOne} a riscoprire il suo lato più pratico, razionale.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
                Non quello di cui aveva bisogno, temo.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_sad
                Ma per essere la tua prima riscrittura hai dato davvero il massimo.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_hurry
                Il resto, è colpa dei miei consigli imperfetti.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_sorry
                Spero mi concederai il tempo di migliorarmi.
                
            - firstCharacterPossibleStates has RagazzaOrchestra:
                {charNameOne} ora sa di possedere un'idole più attiva, e anche oppositiva se serve.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
                Forse avrei potuto guidarti meglio, non sono sicura che sia la natura più vicina al suo cuore.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_sorry
                Ma faremo meglio la prossima volta.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_hurry
                
            - firstCharacterPossibleStates has FlautoDolce:
                Grazie al tuo lavoro, {charNameOne} ha scoperto che gli affetti sono la cosa per lei fondamentale.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
                Forse qualcosa che sapeva già.
                Forse ora sta meglio, giusto?#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_sad
                Questo è il massimo che potevamo fare per lei, vero?
                
            - firstCharacterPossibleStates has Ocarina:
                {charNameOne} ha trovato nella giocosità uno sblocco, ed è pronta ad abbandonarsi alla sua creatività.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
                E chi sono io per giudicare cosa fa star bene un'altra persona?#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_sorry
                E indubbiamente sembra molto più felice di quando è arrivata.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
                
            - firstCharacterPossibleStates has Violino:
                {charNameOne} aveva bisogno di riconoscere che per lei la vita ha senso solo con uno scopo più grande, e grazie a te, ce l'ha fatta.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
                Abbiamo fatto un grande lavoro assieme, {name}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_hurry
                Non vedo l'ora di aiutare la prossima persona con te!
                
            - else: Non tutte le persone sono disposte a cambiare, ma questa non è una tua colpa.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_sad
                    La colpa è solo mia. Il mio compito è renderti {pronouns has him:pronto|{pronouns has her:pronta|prontə}} per ogni evenienza.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_sorry
                    A qualunque costo.
        }
        
        
        Non ti conosco ancora abbastanza, ma ci tengo a dirtelo: sentiti {pronouns has him:soddisfatto|{pronouns has her:soddisfatta|soddisfattə}}!#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_hurry
        Questo è un lavoro complesso, ma vedrai che col tempo sarà tutto più facile.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
        Comunque sia, direi che ti ho dato tutti gli strumenti per far sì che tu possa riscrivere storie in autonomia. 
        Ma se avrai bisogno di aiuto per i luoghi del giardino, o un po' di supporto personale, sono qui.
        O anche solo per due chiacchiere.
        A dopo.
                -> main
          
=== second_character_feedback
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameThree = translator(thirdCharacterState)
    ~ temp charNameFour= translator(fourthCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)   
    
   Hai finito il percorso con {charNameTwo}, {name}!#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)}  #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
   Ed entrambi mi avete stupita: non pensavo davvero che un bambino avrebbe avuto bisogno di questo luogo.
        {
        - are_two_entities_together(SecondCharacter, PG): Devi imparare tante cose sui bambini, tu. Vado a farmi due passi.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_angry
                ~ change_entity_place(SecondCharacter)
            Mi mancherà. Buffo, vero?#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
        
        
        }
    Eccoti il mio modesto pensiero. #speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
        {
            - are_two_entities_together(FirstCharacter, PG):Ecco che parte coi voti. E io volo via.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB:{ink_tag_b(firstCharacterInkLevel)}  #inkC:{ink_tag_c(firstCharacterInkLevel)}  #inkD:{ink_tag_d(firstCharacterInkLevel)} #portrait:chitarra_annoyed
                    ~ change_entity_place(FirstCharacter)
        }    
    
    {
            - secondCharacterPossibleStates has Riccio:
                Mi spiace che non si sia liberato delle sue paure.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_sad
                E di quell'atteggiamento violento e fastidioso.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_bored
                Forse avrei dovuto darti più aiuto.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_sorry
                O forse devi imparare meglio ad ascoltare gli altri?#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_sad

            - secondCharacterPossibleStates has Grizzly:
                A quanto pare il nostro bambino ha abbracciato il suo lato rabbioso.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
                E invece di combatterlo, l'ha fatto proprio.
                Personalmente, la rabbia non mi convince mai molto.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_sad
                Porta solo disordine e dolore.
                Ma immagino tu sappia quello che stai facendo, no?#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
    
            - secondCharacterPossibleStates has Lupo:
                La famiglia è qualcosa di importante, {name}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
                E sono contenta che {charNameTwo} abbia scoperto in sé la voglia di prendersene cura.
                E magari un giorno la sua nonna e suo fratello torneranno sotto il tetto dei genitori.
                Per me sarebbe un finale davvero felice.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_hurry

            - secondCharacterPossibleStates has Delfino:
                Sono perplessa: non pensavo l'avresti spinto ad abbracciare il suo lato più infantile.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
                Giocoso.
                So che il tuo lavoro è fare uscire queste persone dal blocco.
                Ma l'unica soluzione era quella di renderlo un giullare?#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_sad
                
            - secondCharacterPossibleStates has Capibara:
                A volte forse devo solo dirmi: non tutto il mondo può essere come vorrei.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_sad
                Il fatto che il nostro piccolo amico ora si senta un {charNameTwo} mi lascia perplessa.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
                Non sono mai stata una grande fan de "l'unione fa la forza".
                Ma forse tu hai visto qualcosa in quel bimbo che a me sfuggiva.
                E un giorno diventerà un uomo responsabile.
                Spero.
            
            - secondCharacterPossibleStates has Corvo:
                Non credo avresti potuto ottenere un esito migliore.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_hurry
                La sua curiosità, la sua intelligenza indirizzate verso qualcosa di concreto, utile.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
                Ce lo vedo a studiare nuovi modi per curare le persone.
                Per ridurre la fame nel mondo.
                O anche solo per inventare una variante di begonia che sia completamente nera.
                Ottimo lavoro, {name}!#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_hurry
        }
        
    Spero di cuore che tu sia felice di quello che stai facendo.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
    A prescindere dal risultato.
    E un giorno potrai fare questo lavoro da {pronouns has him:solo|{pronouns has her:sola|solə}}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_hurry
    E a quel punto forse anche io potrò un poco riposare.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_sad
            -> main
   
   === third_character_feedback
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameThree = translator(thirdCharacterState)
    ~ temp charNameFour= translator(fourthCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState) 
    
   third_character_feedback #speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)}  #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral 
    -> main
   
=== fourth_character_feedback
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameThree = translator(thirdCharacterState)
    ~ temp charNameFour= translator(fourthCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    
    fourth_character_feedback #speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)}  #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral 
        -> main
    
=== fifth_character_feedback
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameThree = translator(thirdCharacterState)
    ~ temp charNameFour= translator(fourthCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)    
    
    fifth_character_feedback#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)}  #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral 
        -> main
    
//Storylets di commentario
    === growing_witch_storylet
        ~ temp charNameOne = translator(firstCharacterState)
        ~ temp charNameTwo = translator(secondCharacterState)
        ~ temp charNameThree = translator(thirdCharacterState)
        ~ temp charNameFour= translator(fourthCharacterState)
        ~ temp charNameFive = translator(fifthCharacterState)
        
        Quella pianta mezza morta.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} 
        Da dove le avrà mai tirate fuori delle gambe?!
        Non pensavo che questo luogo mi avrebbe stupita.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_sad
        Da quando sei qui, {name}, sono cambiate molte cose.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
        Spero solo sia un segno positivo.
        Io provo a concimarla comunque, male non le farà.
        <i>Noi preferiamo crescere senza concime. Chiederemo alle formiche di forare il sacco.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait: {witch_state()}

            -> main
    
//Storylets sul secondo personaggio
    === that_little_liar_storylet
        ~ temp charNameOne = translator(firstCharacterState)
        ~ temp charNameTwo = translator(secondCharacterState)
        ~ temp charNameFive = translator(fifthCharacterState)
    
        {name}, sei {pronouns has him:riuscito|{pronouns has her:riuscita|riuscitə}} a rimandare quel bambino a casa?#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_bored
            {
                - are_two_entities_together(SecondCharacter, PG): A quanto vedo, no.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_sad
                    Vecchia strega!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_angry
            }
            ~ change_entity_place(SecondCharacter)
            
        Non è mai successo che qui arrivassero dei bambini.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} 
        E non mi fraintendere: non ce l'ho con lui. Ma non è un posto sicuro per lui.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
        E mi ha tirato un calcio!#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_bored
        
            {
                - knowing_second_character.not_talk:Lui dice che gli hai fatto male.#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #portrait:PG_neutral
                - else: L'ho solo fermato perché cercava di scappare.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_sorry
            } 

        Mi fa tenerezza, sai?#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)}  #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
        Mi sembra un riccio.
        Così carino, tenero.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_hurry
        Ma poi come ti avvicini ti fa male.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_sorry
        Mi spiace aver perso la pazienza con lui.
        Ma ci sono rimasta male per quel calcio.
        Io non ho tempo ora, ma sono sicura che troverai una soluzione.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
        Trova un modo per allontanarlo.
        Ma non metterci troppo, per favore.
        ~ secondPauseTalking = 0
            - (nameSecond)
            -> main
    
    === watering_can_storylet
        ~ temp charNameOne = translator(firstCharacterState)
        ~ temp charNameTwo = translator(secondCharacterState)
        ~ temp charNameFive = translator(fifthCharacterState)
        L'annaffiatoio!#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_bored
        L'annaffiatoio è scomparso dalla serra.
        E sono sicura, sicura che è stato quel bambino dispettoso!
            {
                - are_two_entities_together(SecondCharacter, PG): Dispettosa sarai tu, vecchia biscia!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_angry
                        ~ change_entity_place(SecondCharacter)
                        
                    Oh, dovrebbero lavarti la bocca col sapone! #speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)}  #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
            }

        Giuro che sto cercando di essere paziente, {name}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_sorry
        Ma senza l'annaffiatoio non si possono coltivare le piante della serra.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_sad
        Senza piante della serra non ci sono molti doni per le persone che ne hanno bisogno.
        E l'equilibrio delicato di questo posto verrà meno.
        Ti prego, digli di ridarcelo!#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_bored
        E caricalo di peso sul prossimo treno.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
        Questo posto è pericoloso per lui.
        Pericoloso.
            ~ secondPauseTalking = 0
                -> main

//Fine della demo
    === ending_demo
    ~ temp charNameFive = translator(fifthCharacterState)
    Sembra che la demo sia finita qui, {name}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_hurry
    Potrai girare ancora per gli spazi aperti.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
    Continuare a leggere le storie della <b>biblioteca</b>.
    E coltivare cosa rimane da coltivare nella <b>serra</b>.
    Ma non compariranno nuove persone bisognose.
    Ti chiedo un favore prima di salutarci, {name}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_sorry
    Salvati questo codice, e inseriscilo poi nel documento del testing.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
    O se non hai voglia di rispondere alle domande mandamelo attraverso Queerginia: faresti molto felice entrambe.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_bored
    Il codice è {playerPurple}{playerYellow}{playerBlue}{playerGreen}{playerRed}{playerFirstStory}{playerSecondStory}{firstCharacterState} {secondCharacterState}
    Grazie di cuore.
        -> talk_with_mentor