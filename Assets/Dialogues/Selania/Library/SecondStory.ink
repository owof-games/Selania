//Cognome/alias F - K

=== cecilia_formicola

<b>Fuochino</b> di Cecilia Formicola (she/her). Instagram: @ceciliaformicola
        //Se è la prima volta che leggo il libro, lo levo dalle storie non lette, lo sposto in quelle lette e lo levo dalle liste che lo contengono. Se ci arrivo in rilettura, non faccio nulla.
            {
                - library_unreadStories has CeciliaFormicola:
                    ~ library_unreadStories -= CeciliaFormicola
                    ~ library_readStories += CeciliaFormicola
                     -> refresh_book_lists ->
            }  
    
    
    
    "Io li odio." "Chi non li odia, Alchemilla." "Non li sopporto. Vorrei vederli soffrire, agonizzare, bruciare…" Una prepotente lingua di fuoco si alzò a lambire la pentola di peltro che sobbolliva vivacemente, penzolando sul falò. "Se potessi, Alchemilla" borbottò Bergamotto "li infilzerei allo spiedo io stessa. Le braci si arroventarono, illuminandosi di un rosso cupissimo, per un solo istante. Forsizia le rimestò diligentemente. "Lasciatevi andare, ragazze" le esortò. "Ci serve più fuoco." "Villani, prepotenti…"  "Maledetti vigliacchi" rimbrottò Bergamotto. "Sudici, lerci…"

    "È vero che non si lavano? Qualcuna mi spiega perché non si lavano?" si domandò Mimosa. Il fuoco crepitò sommessamente in risposta. "Ridicoli, farabutti…" "Alchemilla, non ti trattenere, ti prego" disse Forsizia, alzando il coperchio per controllare il contenuto della pentola. "Ci serve tanto più fuoco." "E va bene!" sbottò Alchemilla. "Bastardi! Pezzi di merda leccaculo, schifosi fascisti…" "Uomini!" gridò Bergamotto. "Non ne esiste uno che non ti deluda. Fatemi pure cambiare idea!". Le fiamme si innalzarono più vivaci.
    
    "Io non sopporto i collaborazionisti" esclamò Mimosa con decisione, aggrottando la fronte. "Senza coraggio, senza spina dorsale, senza… senza testa!. Li odio persino più dei fascisti." La rabbia ribollente di Mimosa ravvivò i ciocchi di legno quasi spenti, che ripresero a bruciare. Forsizia annuiva con approvazione. "Ma perché esistono ancora" singhiozzò Alchemilla. "Avremmo dovuto ucciderli tutti prima." "Possiamo ancora rimediare…" le ricordò Bergamotto.
    
    Mimosa sogghignò all'idea. "Forsizia, quanto possiamo lasciarci andare ai sogni di tortura?" "Non serve" rispose Forsizia allegramente, dando una mescolata nel pentolone. "È pronto. A meno che, ovviamente, non vogliate comunque…" "No, grazie" rispose Alchemilla sbuffando. "Sai quanto mi è difficile far uscire la rabbia." "Sei una meraviglia quando ci riesci, però" le sorrise Mimosa. Alchemilla abbassò gli occhi, deliziata. Bergamotto si alzò, avvicinandosi a Forsizia per aiutarla con le mestolate. 
    
    
    Mimosa abbracciò stretta Alchemilla, schioccandole un bacio sulla guancia. Il fuoco diventò tutto rosso dall'emozione.  Forsizia passò a tutte una ciotola fumante e infine le raggiunse, sedendosi anche lei ad ammirare il fuoco, soddisfatta. "Che hai preparato oggi?" le chiese Alchemilla, ancora un po' su di giri. "Zuppa di patate" rispose Forsizia, prendendo un'abbondante cucchiaiata.  "La mia preferita!" sospirò felice Bergamotto, prendendo posto anche lei intorno al fuoco.
    
    "Ci ho messo un ingrediente segreto stavolta. Vediamo se indovinate." "Mmm… cos'è, paprika dolce?" chiese Alchemilla, assaggiando. "No, secondo me è berberè" disse Mimosa. "Fuochino" rispose Forsizia, ridacchiando. Il fuoco, che poco prima ruggiva alto e incandescente, ora lambiva dolcemente i ciocchi di legno, caldo e avvolgente, illuminando tutte di una dolce, incantevole luce dorata.

    //Check per achievement racconti
    -> achievements_onGame_statusUpdate_RM ->

        +  \ {charTag(PG, "neutral")}:       <i>Vorrei leggere ancora.
            
           -> book_test_intro
        +  \ {charTag(PG, "neutral")}:       <i>Me ne vado.
            
            -> DarkLibraryModeOff ->
                     
            -> main

=== francesca_tosca_raimondi
<b>Trecentotrenta metri.</b> di Francesca Tosca Raimondi (she/her). Trigger warning: rabbia domestica.
        
            +  \ {charTag(PG, "neutral")}:       <i>Inizio la lettura.
            //Se è la prima volta che leggo il libro, lo levo dalle storie non lette, lo sposto in quelle lette e lo levo dalle liste che lo contengono. Se ci arrivo in rilettura, non faccio nulla.
                    {
                        - library_unreadStories has FrancescaToscaRaimondi:
                            ~ library_unreadStories -= FrancescaToscaRaimondi
                            ~ library_readStories += FrancescaToscaRaimondi
                             -> refresh_book_lists ->
                    }  
                +  {library_unreadStories has FrancescaToscaRaimondi}\ {charTag(PG, "neutral")}:       <i>Per ora non me la sento di affrontare questo tema.
                        -> tempTW -> book_test_intro
                + {library_unreadStories has FrancescaToscaRaimondi} \ {charTag(PG, "neutral")}:       <i>Non voglio più incontrare questa storia.
                    ~ library_unreadStories -= FrancescaToscaRaimondi
                        -> refresh_book_lists -> book_test_intro
                -
            
            
            
            
        Uno, due, tre, quattro. Quattro per trecentotrenta. A scuola non abbiamo ancora fatto le moltiplicazioni, ma Sara mi ha detto che è così che si capisce dove cadrà il fulmine durante un temporale.  Dice che sono "prevedibili". A me piacciono i lampi perché sembrano pesciolini luminosi tra le nuvole nere.  Mi ricordano i fuochi d'artificio.

        Sembrano magie luminose che allontanano l'oscurità per qualche momento.  Il rumore, però, mi fa ancora un po' paura. Arriva all'improvviso e fa tremare le finestre, non riesco a tapparmi le orecchie in tempo e anche se mi nascondo arriva dappertutto, mi rimbomba nella pancia e mi fa venire mal di testa. Non piango più solo perché ormai non mi fa poi così paura.
        
        I tuoni mi ricordano la mamma: un momento va tutto bene, il cielo è azzurro e il sole splende, quello dopo lei grida e mi afferra per le braccia e mi scuote e se <i>Me ne vado urla e anche se mi nascondo la sua voce mi trova. Di solito mi infilo nell'armadio, mi siedo tra i vestiti e aspetto che smetta. Uno, due, tre.  Chissà quanto si è tuffato lontano il pesciolino di luce. Vorrei che anche la mamma fosse prevedibile: vorrei contare con gli occhi chiusi e sapere quando smetterà di piangere.
        
        Non so se piange perché è triste, ma i suoi occhi si infuocano e la sua voce si spezza. Ma la mamma non è sempre così; a volte mi bacia, mi coccola, mi dice che mi vuole bene. Non so a cosa credere, però... Papà mi dice che lei mi ama tanto, ma non c'è mai quando la mamma grida a quel modo. Uno, due. Bisognerebbe avere quella magia di luce. Sembra buona per combattere i tuoni che ruggiscono
        
        Sara mi ha detto che i fulmini sono una "conseguenza" dei tuoni, ma non ho capito molto bene cosa significa, non so ancora cercare le parole sul dizionario. Forse la mamma sa il significato, anzi sono sicura che lo sa, è molto intelligente e legge tanti libri. Da qualche tempo a questa parte non me li legge più, dice che posso farlo da sola visto che a scuola ho imparato come si fa.
        
        La guardo mentre singhiozza sul divano, la luce ogni tanto va e viene. Uno. Il lampo è caduto vicinissimo su un albero nel cortile! Papà mi ha spiegato che quando una luce è molto forte si dice "abbagliante". Ecco, era proprio abbagliante. Mi ha messo coraggio. Chissà, forse posso scacciare il buio della mamma e farla stare meglio. Spero solo non mi spinga per terra o, peggio, non mi guardi in silenzio senza parlarmi per giorni.
        
        Ma forse ho la magia della luce ora che l'ho vista così da vicino, quindi mi posso rialzare e posso provarci di nuovo, se succede. Abbraccio forte la mia mamma anche se lei non mi guarda.  Non me lo dice mai con la voce ma è un po' come se chiedesse aiuto quando fa così.  Forse a volte mi chiede anche scusa senza dirlo. Mi accarezza la testa.  Nessuno merita di stare da solo quando piange.

        //Check per achievement racconti
        -> achievements_onGame_statusUpdate_RM ->

        +  \ {charTag(PG, "neutral")}:       <i>Vorrei leggere ancora.
            
           -> book_test_intro
        
        +  \ {charTag(PG, "neutral")}:       <i>Me ne vado.
            
            -> DarkLibraryModeOff ->
            -> main
            
            
=== kayleig
<b>Volevo che mia madre fosse forte</b> di Kayleig (she/her).

        {
            - library_unreadStories has Kayleig:
                ~ library_unreadStories -= Kayleig
                ~ library_readStories += Kayleig
                 -> refresh_book_lists ->
        }  
            
        
        
        
    Volevo che mia madre fosse forte. La vedevo sprofondare in un matrimonio infelice, in una vita senza orizzonti. La vedevo arrendersi, lei che era sempre stata per me un esempio di determinazione, rigore e autodisciplina. Lo vivevo come un tradimento, e mi arrabbiavo con lei per la persona che non riusciva a essere.  Dietro la rabbia c'è sempre una ferita aperta, un dolore che urla per essere visto. Proprio perché le volevo bene, non riuscivo ad accettare che diventasse l'ombra della persona che era stata, della persona che ammiravo.
    
    
    Volevo che lei fosse lì per me, a darmi quel senso di sicurezza e stabilità che mi mancava. Volevo che lei si prendesse cura di me, e invece ero io a dovermi prendere cura di lei, senza sapere come aiutarla. Volevo vederla rialzarsi e continuare a lottare. Volevo vederla ricominciare, trovare un senso per andare avanti. Dietro ogni litigio, una piccola me gridava disperatamente: "Perché non riesci a essere la persona di cui ho bisogno?" Avevo giurato a me stessa che non sarei stata come lei. Che avrei costruito qualcosa con la mia vita, che avrei spezzato il cerchio.
    
    Credo che tutte noi donne in qualche modo siamo figlie del dolore delle nostre madri e del silenzio dei nostri padri. Degli abbracci che ci sono mancati e dei "sono fiero di te" mai pronunciati. Degli sguardi di disapprovazione e delle porte sbattute.  Solo dopo aver litigato riuscivamo a parlare. Sembrava che riuscisse ad ascoltarmi solo quando la rabbia si era dissolta nelle urla e nelle lacrime, solo quando le ferite erano state messe a nudo. Allora vedevo il suo dolore, la vedevo davvero per la persona ferita ma non spezzata che era, e non riuscivo a provare rabbia verso di lei.
    
    Nonostante tutto, stava cercando di non andare in pezzi. Nonostante tutto, non si è mai arresa.  Litigando abbiamo costruito un terreno comune, abbiamo imparato a dare voce al nostro dolore. Siamo passate attraverso la rabbia per ritrovarci. Abbiamo imparato ad abbracciarci piangendo, a dirci "ti voglio bene".  Oggi so quanto la mia rabbia fosse parte di ciò che la feriva, e so che la mia rabbia non era giusta.
    
    Non sono stata in grado di accoglierla quando era più fragile. Spero che abbia sempre saputo che le volevo bene, anche quando c'era questa rabbia fra di noi. Ho imparato che tutti dobbiamo fare i conti con le nostre ferite se non vogliamo che infliggano dolore anche agli altri.  Oggi, quella rabbia non è più con me. È un ricordo sbiadito, che non riesco ad afferrare: se n'è andata, non mi appartiene più.
    
    Non sono più quell'adolescente piena di rabbia. Ho sempre pensato che quella rabbia mi rendesse forte, che fosse come un'armatura che mi avrebbe resa inscalfibile. Ora che non riesco più a ritrovarla, mi domando se non fosse ,forse solo, forse anche, un peso, un peso che mi ero abituata a portare ma senza il quale sono più leggera. Più fragile, ma più leggera.         

    //Check per achievement racconti
    -> achievements_onGame_statusUpdate_RM ->        
    
        +  \ {charTag(PG, "neutral")}:       <i>Vorrei leggere ancora.
                
           -> book_test_intro
        
        +  \ {charTag(PG, "neutral")}:       <i>Me ne vado.
                
            -> DarkLibraryModeOff ->
            -> main
            