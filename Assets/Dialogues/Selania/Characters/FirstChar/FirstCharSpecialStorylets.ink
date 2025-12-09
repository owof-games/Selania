=== take_this_book
//Se non abbiamo raccolto il libro della riscrittora autonomamente
    Ehi, {player_name}!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
    Prima ai piedi di quel vecchio tronco ho trovato questo libro.
    E ha il tuo nome.
    Hai unə ammiratorə segretə?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
        {
            - are_two_entities_together(SecondCharacter, PG):Bleah!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
        } 
    Comunque ho pensato fosse il caso di dartelo.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        
        ~ move_entity(WitchRecap, BookPlace)
        ~ move_entity(miniBook, Bedroom)
        ~ move_entity(nightTable, Bedroom)
        @animation:RewriterBook
        ~ player_somethingStrange ++
            
            {
                - contentsForest has PG:
                    ~ move_entity(RewriterBook, Forest)
                - contentsTrainStop has PG:
                    ~ move_entity(RewriterBook, TrainStop)
                - contentsPond has PG:
                    ~ move_entity(RewriterBook, Pond)        
            }
            
        -> main


=== open_the_kitchen
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
    Dopo che {mentorName} mi ha detto che sei qui per aiutarci mi sono detta: come posso rendere la vita più facile a {player_name}?
    Alla fine ti stai ascoltando le mie seghe mentali da un bel po’.
    E immagino che anche il piccoletto avrà i suoi casini da gestire.
        {
            - are_two_entities_together(SecondCharacter, PG):
            Commento Riccio.
                        
        }

    E {mentorName} mi sta simpatica, ma adora parlare di lavoro, non la cosa più riposante.
        {
            - are_two_entities_together(Mentor, PG):
                La mia vita è lavoro, non saprei di cos'altro parlare, {charNameTwo}!
                        
        }
        
    Poi ho trovato qualcosa di inaspettato dietro il pontile: una cucina abbandonata.
    Mi sono messa a sistemarla, principalmente sperando di trovare qualcosa da bere.
    E man mano mi sono ricordata delle belle chiacchiere che mi son fatta a tavola.
    Il cibo apre alle confidenze.
    E quindi, ecco il mio regalo per te, {player_name}: un posto dove cucinare in compagnia, per conoscerci meglio.
    E visto che di solito siamo noi a decidere di cosa parlarti, ho già avvisato {charNameTwo} che a questo giro sarai tu a decidere di cosa parlare.
    Per cui: quando ti butta bene invita qualcunə di noi a cucinare, e vediamo che salta fuori.
    Magari scopri anche qualcosa di utile per il tuo lavoro qui.
    Che ne dici?

        + [{mentorName} aveva detto di non andare nei posti chiusi.]
             -> color_variation_management(FirstCharacter, blueC)->
    
        + [Grande! Mai stare con le mani in mano!]
            -> color_variation_management(FirstCharacter, redC)->
     
        + [Scelta viola.]
                -> color_variation_management(FirstCharacter, purpleC)->
    
        + [Scelta gialla.]
            -> color_variation_management(FirstCharacter, yellowC)->
            
        + [Cibo, chiacchiere e intimità: mi piace molto, grazie {charNameOne}.]
            -> color_variation_management(FirstCharacter, greenC)->
        -    
    
    Comunque: quando vuoi cucinare con qualcuna di noi, basta che ce lo chiedi.
    Ah: non ho trovato molta roba, scusa.
    Per cui credo abbia senso che tu ti faccia una cucinata soltanto con ognuna di noi.
    Scusa.
    
        ~ firstChar_pauseTalking = firstChar_pauseDuration
        -> opening_places ->
        -> main
        
=== a_story_of_revenge 
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
    Ehi {player_name}.
    Ho visto che anche tu hai letto <b>Luna vergine</b> di Aza.
    Non so come mai ma quella storia mi si è appiccicata in testa.
    Non sono una da vendetta.
    Sono troppo cagasotto, sicuro.
    O forse, boh.
    Non ho un buon rapporto con la rabbia.
    Le poche volte che l'ho lasciata uscire mi sono vista chiamare isterica, nevrotica, mestruata.
        {
            - are_two_entities_together(Mentor, PG):
                Uh, è una storia che ho già sentito.          
        }
    Sembra che se sono arrabbiata allora sono in automatico nel torto.
    Ma quando sono arrivata in fondo e ho capito che lei si stava trasformando in lupo mannaro, mi sono trovata a digrignare i denti.
    Avevo voglia di morsicare quel tizio anche io.
    Di tirare fuori gli artigli.
    E non so, forse è perché qui c'è tanto tempo per ascoltarsi.
    Ma per la prima volta ho visto la rabbia non come una cosa da evitare.
    Ma come una possibilità, ha senso?
    Come un segnale.
    L'allarme che scatta perché è stato superato un confine invalicabile.
    Forse vorrei essere mostruosa per una volta.
    Anche solo per essere lasciata in pace.
    Tu che ne pensi della rabbia della tipa del racconto?
    
    //Risposte.    
    
        + [La vendetta non è giustizia. A cosa è servita?]
                -> color_variation_management(FirstCharacter, blueC)->
            Ma nemmeno la giustizia è giustizia, {player_name}.
            E non so cosa ha scatenato la tipa del racconto.
            Ma sono tante le situazioni in cui una donna non la vede la giustizia.
            Per cui almeno è servita a farla stare meglio, credo.
            
        + [Lui è ricco, ho pensato parlasse di lotta di classe.]
                -> color_variation_management(FirstCharacter, purpleC)->
            Quindi dici tipo che la rabbia è giustificata che per un progetto più grande?
            Però se è ricco ma lei si vendica perché stronzo?
            O magari è stronzo <i>anche</i> perché è ricco?
            
        + [Mi è sembrato un gioco: "cosa succede se sono un mostro?".]
                -> color_variation_management(FirstCharacter, yellowC)->
            Non è male come gioco, vero?
            Mi piacerebbe farlo una volta.
            Credo mi farebbe sentire parti di me che non cago mai.
            
        + [Posso capirla, ma non ha pensato a Irene, generando altro dolore.]
                -> color_variation_management(FirstCharacter, greenC)->
            Ed è una cosa che capisco, ma.
            Lui non si è posto questa domanda mi sa, qualsiasi cosa abbia fatto.
            Perché la protagonista è palesemente strapissata.
            E forse ferita.
            Cazzo, la rabbia che ci vuole per odiare uno per ventitré anni è enorme.
            Bisogna sempre ingoiare tutto per proteggere le altre persone?
            
        + [La sua non è vendetta, ma ribellione e autodifesa.]
                -> color_variation_management(FirstCharacter, redC)->
            Non credo reggerebbe in un processo, ma mi suona.
            A volte quando ti viene detto che non puoi arrabbiarti, ci metti molto per capire che sei arrabbiata.
            Quindi è un po' come se avesse reagito con ventitré anni di ritardo a quello che Jacopo le ha fatto.
        -    
    
    Comunque mi sa che più tardi mi faccio un altro giro tra i racconti.
    Erano mesi che non mi mettevo a leggere qualcosa.
        ~ firstChar_pauseTalking = firstChar_pauseDuration

        -> main
    

=== dog_first_char
    C'è un cane!
    Non so perché dovrebbe essere la cosa che più mi stupisce di questo posto.
    {
        - contentsTrainStop has PG:
            {
                - contentsTrainStop has DoggoNoNotes:
                    Hai visto com'è carina? 
                    Lì, sotto il tabellone?
                
                - else:
                    Hai visto com'è carina? 
                    Era lì, sotto il tabellone?    
            }
        - else:
            Era alla stazione dei treni, con degli occhioni enormi.    
    }
    Adorabile.
    Mi sono seduta a terra, e lei è venuta a leccarmi tutta la faccia.
    Non ho avuto il coraggio di muovermi.
    Si è accoccolata un poco, e poi si è messa a fare toeletta.
    La adoro.

-> main