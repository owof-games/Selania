//Cognome/alias F - K

=== cecilia_formicola

<b>Getting warm</b> di Cecilia Formicola (she/her).
        //Se è la prima volta che leggo il libro, lo levo dalle storie non lette, lo sposto in quelle lette e lo levo dalle liste che lo contengono. Se ci arrivo in rilettura, non faccio nulla.
            {
                - library_unreadStories has CeciliaFormicola:
                    ~ library_unreadStories -= CeciliaFormicola
                    ~ library_readStories += CeciliaFormicola
                     -> refresh_book_lists ->
            }  
    -> DarkLibraryModeOn ->
    ~ enableBigDialogue()
    "I hate them."
    "Who doesn't, Alchemilla."
    "I can't stand them. I want to see them suffer, agonise, burn...."
    An overbearing tongue of fire rose to lap the pewter pot that simmered briskly, dangling over the bonfire.
    "If I could, Alchemilla" muttered Bergamot, "I would skewer them myself."
    The embers smouldered, glowing in dark red, for just an instant. Forsythia diligently stirred them. "Let go, girls" she urged them. "We need more fire.
    "Louts, bullies..."
    "Damn cowards" reproached Bergamot."
    "Dirty, filthy..."
    "Is it true they don't wash? Will someone explain to me why they don't wash?" wondered Mimosa. The fire crackled softly in reply.
    "Ridiculous, scoundrels..."
    "Alchemilla, don't hold back, please" said Forsythia, lifting the lid to check the contents of the pot. "We need much more fire."
    "All right!" blurted out Alchemilla. "Bastards! Ass"licking pieces of shit, lousy fascists...."
    "Men! " shouted Bergamot. "There is not one that won't let you down. Make me change my mind!". The flames rose brighter."
    "I can't stand collaborationists" exclaimed Mimosa firmly, frowning. "Gutless, spineless… headless! I hate them even more than fascists." Mimosa's seething anger revived the wooden logs which were almost extinguished and then began to burn again. Forsythia nodded approvingly.
    "But why do they still exist" sobbed Alchemilla. "We should have killed them all before."
    "We can still make up for it…" Bergamot reminded her.
    Mimosa sneered at the idea. "Forsythia, how much can we indulge in torture dreams?"
    "No need" answered Forsythia cheerfully, giving the pot a stir. "It's ready. Unless, of course, you still want to...."
    "No, thank you" replied Alchemilla huffing. "You know how hard it is for me to let the anger out."
    "You're a marvel when you do, though" Mimosa smiled at her. Alchemilla lowered her eyes, delighted.
    Bergamot stood up, approaching Forsythia to help her with the ladles. Mimosa hugged Alchemilla tightly, snapping a kiss on her cheek. The fire turned all red with emotion. Forsythia handed them all a steaming bowl and then joined them, sitting down to admire the fire as well, satisfied.
    "What have you prepared today?" Alchemilla asked her, still a bit excited.
    "Potato soup" answered Forsythia, taking a generous spoonful.
    "My favourite!" sighed Bergamot happily, also taking a seat around the fire.
    "I put a secret ingredient in it this time. Let's see if you can guess."
    "Mmm... what is it, sweet paprika?" asked Alchemilla, tasting.
    "No, I think it's berbere" said Mimosa.
    "Getting warm" answered Forsythia, giggling.
    The fire, which just before was roaring high and glowing, gently lapped at the wooden logs, warm and enveloping, illuminating them all with a sweet, enchanting golden light.

        + [Vorrei leggere ancora.]
        ~ disableBigDialogue()
           -> book_test_intro
        + [Me ne vado.]
        ~ disableBigDialogue()
            -> DarkLibraryModeOff ->
                     
            -> main

=== francesca_tosca_raimondi
<b>Trecentotrenta metri.</b> di Francesca Tosca Raimondi (she/her).


        Trigger warning: rabbia domestica.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
        
                + [Inizio la lettura.]
        //Se è la prima volta che leggo il libro, lo levo dalle storie non lette, lo sposto in quelle lette e lo levo dalle liste che lo contengono. Se ci arrivo in rilettura, non faccio nulla.
                    {
                        - library_unreadStories has FrancescaToscaRaimondi:
                            ~ library_unreadStories -= FrancescaToscaRaimondi
                            ~ library_readStories += FrancescaToscaRaimondi
                             -> refresh_book_lists ->
                    }  
                + {library_unreadStories has FrancescaToscaRaimondi}[Per ora non me la sento di affrontare questo tema.]
                        -> tempTW -> book_test_intro
                + {library_unreadStories has FrancescaToscaRaimondi}[Non presentarmi più questo racconto.]
                    ~ library_unreadStories -= FrancescaToscaRaimondi
                        -> refresh_book_lists -> book_test_intro
                -
            -> DarkLibraryModeOn ->
            ~ enableBigDialogue()
            
            
        Uno, due, tre, quattro.
        Quattro per trecentotrenta.
        A scuola non abbiamo ancora fatto le moltiplicazioni, ma Sara mi ha detto che è così
        che si capisce dove cadrà il fulmine durante un temporale. Dice che sono
        “prevedibili”. A me piacciono i lampi perché sembrano pesciolini luminosi tra le
        nuvole nere. Mi ricordano i fuochi d’artificio. Sembrano magie luminose che
        allontanano l’oscurità per qualche momento. Il rumore, però, mi fa ancora un po’
        paura. Arriva all’improvviso e fa tremare le finestre, non riesco a tapparmi le
        orecchie in tempo e anche se mi nascondo arriva dappertutto, mi rimbomba nella
        pancia e mi fa venire mal di testa. Non piango più solo perché ormai non mi fa poi
        così paura. I tuoni mi ricordano la mamma: un momento va tutto bene, il cielo è
        azzurro e il sole splende, quello dopo lei grida e mi afferra per le braccia e mi scuote
        e se me ne vado urla e anche se mi nascondo la sua voce mi trova. Di solito mi infilo
        nell’armadio, mi siedo tra i vestiti e aspetto che smetta.
        Uno, due, tre.
        Chissà quanto si è tuffato lontano il pesciolino di luce. Vorrei che anche la mamma
        fosse prevedibile: vorrei contare con gli occhi chiusi e sapere quando smetterà di
        piangere. Non so se piange perché è triste, ma i suoi occhi si infuocano e la sua voce
        si spezza. Ma la mamma non è sempre così; a volte mi bacia, mi coccola, mi dice che
        mi vuole bene. Non so a cosa credere, però...
        Papà mi dice che lei mi ama tanto, ma non c’è mai quando la mamma grida a quel
        modo.
        Uno, due.
        Bisognerebbe avere quella magia di luce. Sembra buona per combattere i tuoni che
        ruggiscono. Sara mi ha detto che i fulmini sono una “conseguenza” dei tuoni, ma
        non ho capito molto bene cosa significa, non so ancora cercare le parole sul
        dizionario. Forse la mamma sa il significato, anzi sono sicura che lo sa, è molto
        intelligente e legge tanti libri. Da qualche tempo a questa parte non me li legge più,
        dice che posso farlo da sola visto che a scuola ho imparato come si fa. La guardo
        mentre singhiozza sul divano, la luce ogni tanto va e viene.
        Uno.
        Il lampo è caduto vicinissimo su un albero nel cortile! Papà mi ha spiegato che
        quando una luce è molto forte si dice “abbagliante”. Ecco, era proprio abbagliante.
        Mi ha messo coraggio. Chissà, forse posso scacciare il buio della mamma e farla
        stare meglio. Spero solo non mi spinga per terra o, peggio, non mi guardi in silenzio
        senza parlarmi per giorni. Ma forse ho la magia della luce ora che l’ho vista così da
        vicino, quindi mi posso rialzare e posso provarci di nuovo, se succede.
        Abbraccio forte la mia mamma anche se lei non mi guarda. Non me lo dice mai con
        la voce ma è un po’ come se chiedesse aiuto quando fa così. Forse a volte mi chiede
        anche scusa senza dirlo. Mi accarezza la testa. Nessuno merita di stare da solo
        quando piange.


        + [Vorrei leggere ancora.]
            ~ disableBigDialogue()
           -> book_test_intro
        
        + [Me ne vado.]
            ~ disableBigDialogue()
            -> DarkLibraryModeOff ->
            -> main