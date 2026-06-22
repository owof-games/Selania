=== open_the_kitchen
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    
    {charTag(FirstCharacter, "curious")}:                   Dopo che {charNameFive} mi ha detto che sei qui per aiutarci mi sono detta: come posso rendere la vita più facile a {player_name}?
    {charTag(FirstCharacter, "neutral")}:                   Alla fine ti stai ascoltando le mie seghe mentali da un bel po'.
                                                            E immagino che anche il piccoletto avrà i suoi casini da gestire.                                       
    {
        - are_two_entities_together(SecondCharacter, PG):
        {charTag(SecondCharacter, "angry")}:                Non sono piccoletto!
        {charTag(SecondCharacter, "neutral")}:              Sono il secondo meno alto della classe!   
    }
    {
        - thirdChar_storyStatus == story_storyStarted:
        {charTag(FirstCharacter, "annoyed")}:               Per non parlare di quell'altro.                                      
    } 
    {charTag(FirstCharacter, "neutral")}:                   E {charNameFive} mi sta simpatica, ma adora parlare di lavoro, non la cosa più riposante.
    {
        - are_two_entities_together(Mentor, PG):
        {charTag(FifthCharacter, "sorry")}:                 La mia vita è lavoro, non saprei di cos'altro parlare, {charNameOne}!      
    }
    {charTag(FirstCharacter, "curious")}:                   Poi ho trovato qualcosa di inaspettato dietro il pontile: una cucina abbandonata.
    {charTag(FirstCharacter, "annoyed")}:                   Mi sono messa a rovistare sperando di trovare qualcosa da bere.
    {charTag(FirstCharacter, "neutral")}:                   Ma mi è presa bene, e mi sono messa a pulire e sistemare il sistemabile.                                     
    {charTag(FirstCharacter, "affectionate")}:              E man mano mi sono ricordata delle belle chiacchiere che mi sono fatta a tavola.
                                                            Il cibo apre alle confidenze.
    {charTag(FirstCharacter, "neutral")}:                   E quindi, ecco un regalo per te, {player_name}: un posto dove cucinare in compagnia, per conoscerci meglio.
                                                            E visto che di solito siamo noi a decidere di cosa parlarti, ho già avvisato tutti che a questo giro sarai tu a decidere di cosa parlare.
    {charTag(FirstCharacter, "curious")}:                   Per cui: quando ti butta bene invita qualcunə di noi a cucinare, e vediamo che salta fuori.
                                                            Magari scopri anche qualcosa di utile per il tuo lavoro qui.
    {charTag(FirstCharacter, "affectionate")}:              Che ne dici?

    
    + \ {charTag(PG, "neutral")}:                           Come hai fatto ad entrare? Il pontile era rotto.
        -> glyph_choice_manager(false, airC)->
        {charTag(FirstCharacter, "neutral")}:               Ehm, mi sono fatta aiutare da Franco.
        {
            - are_two_entities_together(Franco, PG):
                {charTag(Franco, "party")}:                 Che sono io!
        }
        {charTag(FirstCharacter, "neutral")}:               Mi ha mostrato un passaggio sotto al pontile.
        {
            - player_accessiblePlaces has Dump:            
                                                            E dove trovare vecchie assi e qualche mobile dalle parti del pozzo.
            - else:
                                                            E dove trovare vecchie assi e qualche mobile vicino a un vecchio pozzo.
        }
        {
            - are_two_entities_together(Mentor, PG):
            {charTag(FifthCharacter, "neutral")}:           Mi sembra tutto molto pericoloso.
        }
        {charTag(FirstCharacter, "curious")}:               Non l'avrei mai detto, ma mi sono divertita tantissimo!


    + \ {charTag(PG, "neutral")}:                           Grande! Mai con le mani in mano!
        -> glyph_choice_manager(false, fireC)->
        {charTag(FirstCharacter, "annoyed")}:               Non esageriamo.
        {charTag(FirstCharacter, "affectionate")}:          Diciamo che ero motivata dalla fame.
        {charTag(FirstCharacter, "sad")}:                   E dalla nostalgia.

    + \ {charTag(PG, "neutral")}:                           Sentivo il bisogno di un posto dove creare qualcosa assieme.
            -> glyph_choice_manager(false, aetherC)->
        {charTag(FirstCharacter, "curious")}:               Me felice.
        {charTag(FirstCharacter, "neutral")}:               Temevo non avresti apprezzato.
                                                            Non vedo l'ora di cucinare assieme ora!

    + \ {charTag(PG, "neutral")}:                           Grazie: nessun luogo è bello se non c'è un po' di cibo!
        -> glyph_choice_manager(false, earthC)->

            {
                - are_two_entities_together(SecondCharacter, PG):
                {charTag(SecondCharacter, "energy")}:       Sii!
                                                            Caramelle!
                                                            Torte!
                                                            Festeggiamo il mio compleanno!
            }
            {charTag(FirstCharacter, "neutral")}:           Ah ah apprezzo l'entusiasmo.
                                                            Anche se non so perché ma a stare qui non ho tutta questa fame.
            {charTag(FirstCharacter, "affectionate")}:      Ma posso farti compagnia col vino!
        
    + \ {charTag(PG, "neutral")}:                           Cibo, chiacchiere e intimità: mi piace molto, grazie {charNameOne}.
        -> glyph_choice_manager(false, waterC)->
            {charTag(FirstCharacter, "affectionate")}:      Sono felice che ci capiamo {player_name}.
                                                            Ho davvero bisogno di sentire un po' di casa.
            {charTag(FirstCharacter, "neutral")}:           Cucinare assieme potrà aiutarmi.
    -    
    
    {charTag(FirstCharacter, "neutral")}:                   Comunque: quando vuoi cucinare con qualcuna di noi, basta che ce lo chiedi.
    {charTag(FirstCharacter, "annoyed")}:                   Ah: non ho trovato molta roba, scusa.

    {charTag(FirstCharacter, "neutral")}:                   Per cui credo abbia senso che tu ti faccia una cucinata soltanto con ognuna di noi.
                                                            Scusa.
    {charTag(FirstCharacter, "affectionate")}:              E non sono esattamente un falegname: le cose stanno in piedi con l'amore.
    {
        - are_two_entities_together(Franco, PG):
        {charTag(Franco, "neutral")}:                       Zio Gracco sa fare una lasagna di pulci d'acqua che è la morte.
        {charTag(Franco, "question")}:                      Delle pulci d'acqua, per lo più.     
    }
    
        -> first_char_closing_storylet ->
        ~ opening_places()
        ->->
        
=== a_story_of_revenge 
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    
    
    {charTag(FirstCharacter, "neutral")}:                   Ehi {player_name}.
    {charTag(FirstCharacter, "curious")}:                   Ho visto che anche tu hai letto <b>Luna vergine</b> di Aza.
    {charTag(FirstCharacter, "neutral")}:                   Non so come mai ma quella storia mi si è appiccicata in testa.
                                                            Non sono una capace di farsi giustizia da sola.
    {charTag(FirstCharacter, "sad")}:                       Sono troppo cagasotto, sicuro.
                                                            O forse, boh.
    {charTag(FirstCharacter, "annoyed")}:                   Non ho un buon rapporto con la rabbia.
                                                            Le poche volte che l'ho lasciata uscire mi sono vista chiamare isterica, nevrotica, mestruata.
    {
    - are_two_entities_together(ThirdCharacter, PG):
    {
    - thirdChar_firstCharRage == true or grimoire_thirdChar has grimFirstThirdChar:
    {charTag(ThirdCharacter, "jester")}:                    Se tratti tutti come tratti me non dovresti stupirti.

    - else:
    {charTag(ThirdCharacter, "neutral")}:                   Il mondo è difficile {charNameOne}, bisogna imparare a farsi crescere il pelo sullo stomaco e fregarsene.
    }
    }  

    {
        - are_two_entities_together(Mentor, PG):
        {charTag(FifthCharacter, "bored")}:                 È una storia che ho già sentito.    
    }
    {charTag(FirstCharacter, "neutral")}:                   Sembra che se sono arrabbiata allora sono in automatico nel torto.
    {charTag(FirstCharacter, "curious")}:                   Ma quando sono arrivata in fondo e ho capito che lei si stava trasformando in lupo mannaro, mi sono trovata a digrignare i denti.
                                                            Avevo voglia di morsicare quel tizio anche io.
                                                            Di tirare fuori gli artigli.
    {charTag(FirstCharacter, "neutral")}:                   E non so, forse è perché qui c'è tanto tempo per ascoltarsi.
                                                            Ma per la prima volta ho visto la rabbia non come una cosa da evitare.
                                                            Ma come una possibilità, ha senso?
    {charTag(FirstCharacter, "curious")}:                   Come un segnale.
                                                            L'allarme che scatta perché è stato superato un confine invalicabile.
    {charTag(FirstCharacter, "affectionate")}:              Forse vorrei essere mostruosa per una volta.
    {charTag(FirstCharacter, "annoyed")}:                   Anche solo per essere lasciata in pace.
    {charTag(FirstCharacter, "curious")}:                   Tu che ne pensi del racconto?
    

    
    + \ {charTag(PG, "neutral")}:                           Quella della protagonista è stata giustizia o vendetta?
            -> glyph_choice_manager(false, airC)->
    {charTag(FirstCharacter, "annoyed")}:                   C'è davvero tutta questa differenza?
                                                            Il più delle volte la <i>giustizia</i> è solo una vendetta contro i poveri.
                                                            E non solo.
    {charTag(FirstCharacter, "neutral")}:                   Io non so cosa ha scatenato la tipa del racconto.
                                                            Ma sono tante le situazioni in cui una donna non la vede la giustizia.
                                                            Per cui almeno è servita a farla stare meglio, credo.
        
    + \ {charTag(PG, "neutral")}:                           Lui è ricco, ho dato per assodato che si parlasse di lotta di classe.
            -> glyph_choice_manager(false, aetherC)->
    {charTag(FirstCharacter, "neutral")}:                   Quindi dici tipo che la rabbia è giustificata che per un progetto più grande?
                                                            Però se è ricco ma lei si vendica perché stronzo?
                                                            O magari è stronzo <i>anche</i> perché è ricco?
   
    + \ {charTag(PG, "neutral")}:                           Mi è sembrato un esperimento: "cosa succede se sono un mostro?".
            -> glyph_choice_manager(false, earthC)->
    {charTag(FirstCharacter, "curious")}:                   Non è male come esperimento, vero?
                                                            Mi piacerebbe farlo una volta.
    {charTag(FirstCharacter, "neutral")}:                   Credo mi farebbe sentire parti di me che non cago mai.
        
    + \ {charTag(PG, "neutral")}:                           Posso capirla. Ma non ha pensando ad Irene potrebbe aver generato altro dolore.
            -> glyph_choice_manager(false, waterC)->
    {charTag(FirstCharacter, "sad")}:                       Ed è una cosa che capisco, ma.
    {charTag(FirstCharacter, "neutral")}:                   Lui non si è posto questa domanda mi sa, qualsiasi cosa abbia fatto.
                                                            Perché la protagonista è palesemente strapissata.
    {charTag(FirstCharacter, "sad")}:                       E forse ferita.
    {charTag(FirstCharacter, "neutral")}:                   Cazzo, la rabbia che ci vuole per odiare uno per ventitré anni è enorme.
    {
    - are_two_entities_together(SecondCharacter, PG):
    {charTag(SecondCharacter, "energy")}:                   CAAzz...
    {charTag(FirstCharacter, "annoyed")}:                   Non ti ci provare!
    {
        - are_two_entities_together(Mentor, PG):
        {charTag(FifthCharacter, "bored")}:                 Se non sentisse certe parole, non le ripeterebbe, {charNameOne}.
    }
    }
    {charTag(FirstCharacter, "annoyed")}:                   Bisogna sempre ingoiare tutto per proteggere le altre persone?
        
    + \ {charTag(PG, "neutral")}:                           La sua non è vendetta, ma ribellione e autodifesa.
            -> glyph_choice_manager(false, fireC)->
    {charTag(FirstCharacter, "neutral")}:                   Non credo reggerebbe in un processo, ma mi suona.
                                                            A volte quando ti viene detto che non puoi arrabbiarti, ci metti molto per capire che sei arrabbiata.
                                                            Quindi è un po' come se avesse reagito con ventitré anni di ritardo a quello che Jacopo le ha fatto.
    -    
    
    {charTag(FirstCharacter, "neutral")}:                   Comunque mi sa che più tardi mi faccio un altro giro tra i racconti.
    {charTag(FirstCharacter, "curious")}:                   Erano mesi che non mi mettevo a leggere qualcosa per più di dieci minuti.
    {
        - are_two_entities_together(Franco, PG):
        {charTag(Franco, "neutral")}:                       Certo che voi parlate tantissimo.
                                                            Quasi quanto Tullio.  
    }
        -> first_char_closing_storylet ->
        ->->
    

=== dog_first_char
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    
    
    {charTag(FirstCharacter, "affectionate")}:              C'è un cane!
    {charTag(FirstCharacter, "neutral")}:                   Non so perché dovrebbe essere la cosa che più mi stupisce di questo posto.
    {
    - contentsTrainStop has PG:
    {
    - contentsTrainStop has DoggoNoLetters:
    {charTag(FirstCharacter, "affectionate")}:              Hai visto com'è carina? 
                                                            Lì vicino alla panchina!
    - else:
    {charTag(FirstCharacter, "affectionate")}:              Hai visto com'è carina? 
                                                            Era lì, vicino alla panchina! 
    }
    - else:
    {charTag(FirstCharacter, "affectionate")}:              Era alla stazione dei treni, con degli occhioni enormi.    
    }
    {charTag(FirstCharacter, "affectionate")}:              Adorabile.
                                                            Mi sono seduta a terra, e lei è venuta a leccarmi tutta la faccia.
    {charTag(FirstCharacter, "sad")}:                       Non ho avuto il coraggio di muovermi.
    {charTag(FirstCharacter, "affectionate")}:              Si è accoccolata un poco, e poi si è messa a fare toeletta.
    {charTag(FirstCharacter, "neutral")}:                   La adoro.
    {
    - are_two_entities_together(Franco, PG):
    {charTag(Franco, "neutral")}:                           Promemoria.
    {charTag(Franco, "question")}:                          Chiedere a Euforbo cosa significa toeletta.
                                                            E se i cani sanno cucinare cose milanesi.
    }
    
        -> first_char_closing_storylet ->
        ->->



=== first_char_second_char_departure_comment  
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)

    {charTag(FirstCharacter, "sad")}:                           Quindi il bimbetto se ne è andato.
    {charTag(FirstCharacter, "neutral")}:                       Chi l'avrebbe detto che mi sarebbe dispiaciuto.
                                                                Ma è davvero una forza della natura.
                                                                Spero che tornando a casa riesca a gestire meglio le cose con la sua famiglia.
    {charTag(FirstCharacter, "annoyed")}:                       Anche se non dovrebbe essere qualcosa in carico a qualcuno di così piccolo.
    {

    - secondChar_ActualName has Grizzly:
    {charTag(FirstCharacter, "neutral")}:                       Ha abbracciato il suo lato violento.
                                                                Un po' mi preoccupa.
                                                                Ma spero sappia utilizzare quella rabbia per qualcosa di costruttivo.
    
    - secondChar_ActualName has Lupo:
    {charTag(FirstCharacter, "neutral")}:                       E questa svolta da lupo.
                                                                Mmm.
    {charTag(FirstCharacter, "neutral")}:                       Ho paura che possa farsi del male.
        
    - secondChar_ActualName has Delfino:
    {charTag(FirstCharacter, "neutral")}:                       L'approccio più chiassoso mi ha quasi sorpresa.
    {charTag(FirstCharacter, "affectionate")}:                  Ma con la fantasia che ha sono sicura che sentiremo parlare ancora di lui.

                
    - secondChar_ActualName has Capibara:
    {charTag(FirstCharacter, "neutral")}:                       Non mi aspettavo la svolta socievole.
                                                                Spero sia una cosa che riesca a gestire.

            
    - secondChar_ActualName has Corvo:
    {charTag(FirstCharacter, "affectionate")}:                  Sono contenta comunque che abbia abbracciato il lato di sé più curioso e intelligente.
                                                                Col cervello che ha farà qualcosa di magico, ne sono certa!
    {charTag(FirstCharacter, "neutral")}:                       O darà fuoco per sbaglio a qualcosa di molto grande.    

}
                                                                  
        
        -> first_char_closing_storylet ->
        ->->

=== first_char_third_char_departure_comment
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)

{charTag(FirstCharacter, "neutral")}:                       Bel comportamento di merda quello di {charNameThree}.
{charTag(FirstCharacter, "sad")}:                           Spero solo non ti abbia fatto molto male, {player_name}.
                                                            E come disse Bonaccorti: "Non c'è nessuna risposta, nessuna spiegazione altro che è una truffa".
{charTag(FirstCharacter, "annoyed")}:                       E quell'uomo è stata una grossa truffa.                                                                 


        -> first_char_closing_storylet ->
        ->->