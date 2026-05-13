=== tutorial_witchRelationship
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    

        {charTag(TheWitch, witch_state())}:                         <i>Quando vi siete conosciut3, {charNameFive} ha detto a {player_name} che le cose che dice alle persone sono un modo di vedere il mondo.
                                                                    <i>Apprezziamo gli sforzi di {charNameFive}, ma non siamo d'accordo con questo aspetto.
                                                                    <i>Quando {player_name} compie una scelta su cosa dire, non sta parlando del mondo che vede, ma di come lo vive.
                                                                    <i>E crediamo sia importante, perché una visione è qualcosa di contrattabile, ma ciò che si vive è, punto.
                                                                    <i>Esprimere sé in una relazione è più importante che concordare con l'altra persona.
                                                                    <i>Il lichene prospera perché i bisogni si sovrappongono, non perché l'alga è uguale al fungo.
                                                                    <i>Cosa ne pensa {player_name}?</i>

                + \ {charTag(PG, "neutral")}:                       Non sono sicur{player_pronouns has him:o|{player_pronouns has her:a|ə}}, ma forse {charNameFive} ha le migliori intenzioni.
                        -> glyph_choice_manager(true, waterC)->
                    {charTag(TheWitch, witch_state())}:             <i>{player_name} risplende nella sua empatia.
                                                                    <i>E il nostro intento non è creare attrito, ma porre una domanda.
                                                                    <i>Quando il maestro sferza l'alunno, può vedere educazione, può vedere punizione.
                                                                    <i>Ma ciò che vive è comunque violenza.</i>
                    
                + \ {charTag(PG, "neutral")}:                       Che le azioni contano più delle parole.
                        -> glyph_choice_manager(true, fireC)->
                    {charTag(TheWitch, witch_state())}:             <i>La falena plana per raggiungere la compagna.
                                                                    <i>Il pipistrello plana per mangiare la falena.
                                                                    <i>L'azione è la stessa.</i>
                                                                    <i>Stesso è il risultato?</i>
                    
                + \ {charTag(PG, "neutral")}:                       Con la sincerità e pazienza crescono le migliori relazioni.
                        -> glyph_choice_manager(true, earthC)->
                    {charTag(TheWitch, witch_state())}:             <i>Il giardiniere frettoloso uccide una rosa per raccoglierne il primo fiore.
                                                                    <i>{player_name} si gode la vista dell'intero roseto in fiore.
                    
                + \ {charTag(PG, "neutral")}:                       E come vede il mondo {witch_actualName}?
                        -> glyph_choice_manager(true, airC)->
                    {charTag(TheWitch, witch_state())}:             <i>Il cielo sotto di noi.
                                                                    <i>La terra sopra di noi.
                                                                    <i>Il tempo come sabbia.
                                                                    <i>E la voce di {player_name} come una traccia.
                    
                + \ {charTag(PG, "neutral")}:                       Siamo uman3, e la nostra crescita prospera nella contraddizione.
                        -> glyph_choice_manager(true, aetherC)->
                    {charTag(TheWitch, witch_state())}:             <i>Ricordo poco della vita umana, ma la natura stessa prospera nel tentativo, nell'errore.
                                                                    <i>E noi parliamo non del prosperare, ma del valore delle azioni di {player_name}.
                                                                    <i>L'azione richiede sempre responsabilità.
                                                                    <i>Il falco torna senza cibo.
                                                                    <i>I pulli periscono.</i>
                -
                                                                    <i>Il dialogo può essere un sacchetto per accumulare fiducia, o una finestra per far conoscere {player_name} all'altrə.
                                                                    <i>{player_name} cerca un sacchetto, o cerca una finestra?       
                                                                    <i>Vorremmo lasciare {player_name} con una informazione importante: ciò che accade durante la riscrittura ha regole diverse dal resto della conversazione.
                                                                    <i>{player_name} può immaginarla come una tempesta sulla spiaggia: quando sarà finita, la sabbia sarà la stessa, ma inaspettate le cose che rimangono sulla riva.</i>

        // Vecchio testo su questa parte
        // <i>Anche noi vogliamo aiutare {player_name}, e per questo condividiamo una cosa.
        // <i>{player_name} può seguire la voce di {charNameFive} e scegliere di studiare la persona che ha davanti come un uomo studia la vita attraverso un libro.
        // <i>Oppure {player_name} può decidere di essere sé {player_pronouns has him:stesso|{player_pronouns has her:stessa|stessə}}, anche se questo può creare attrito con l'altra persona.
        // <i>E scoprire che c'è chi ha bisogno di venir contraddettə.
        // <i>A volte l'attrito genera fastidio, o volte genera fuoco.
        // <i>A volte brucia il vecchio, permettendo al nuovo di crescere.
        // <i>Nessuna persona è uguale, nessuna persona vuole lo stesso trattamento.
        // <i>Ma funghi solleticano e distraggono le nostre rinascenti radici.

    -> witch_closing_storylet ->
    -> main

=== tutorial_witchSigils
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    

    {charTag(TheWitch, witch_state())}:                             <i>Il Nido è accessibile, il nostro cuore brucia.
                                                                    <i>I Sigilli sono instabili, l'instabilità è forza.
                                                                    <i>La quercia fruttifica e il cinghiale si accresce. 
                                                                    <i>Il cinghiale perisce e la quercia fiorisce.
                                                                    <i>La natura dei Sigilli sembra complessa, ma è semplice.
                                                                    <i>La natura delle relazioni sembra semplice, ma è complessa.
                                                                    <i>Quando {player_name} usa i Sigilli, cambia la percezione di ciò che dice, ma la scelta rimane.
                                                                    <i>Ed ecco il nostro ammonimento per {player_name}.
                                                                    <i>Il bimbo piange, il padre lo soccorre.
                                                                    <i>Il gatto osserva, e imita il pianto.
                                                                    <i>{player_name} conosce il confine tra sostegno e manipolazione?</i>

            + \ {charTag(PG, "neutral")}:                           Solo il tempo conosce le risposte.
                    -> glyph_choice_manager(true, earthC)->
                {charTag(TheWitch, witch_state())}:                 <i>Il tempo porta le risposte che vogliamo vedere.
                                                                    <i>E se {player_name} non sa leggere il futuro, su cosa basa le scelte del suo presente?</i>

            + \ {charTag(PG, "neutral")}:                           Basta chiedersi "questa cosa farà bene all'altrə?".
                    -> glyph_choice_manager(true, waterC)->
                {charTag(TheWitch, witch_state())}:                 <i>Il Ministro scatena la guerra per il bene del paese.
                                                                    <i>In migliaia muoiono al fronte.</i>
                
            + \ {charTag(PG, "neutral")}:                           Ci sono parti di me che mi rimangono ignote.
                    -> glyph_choice_manager(true, aetherC)->
                {charTag(TheWitch, witch_state())}:                 <i>La pianta si accresce con lentezza in molteplici direzioni.
                                                                    <i>Il lusso di non rispondere delle proprie azioni.</i>

            + \ {charTag(PG, "neutral")}:                           Quello che conta è che la mia volontà è forte.
                    -> glyph_choice_manager(true, fireC)->
                {charTag(TheWitch, witch_state())}:                 <i>La roccia inamovibile scivola di millimetro in millimetro verso l'abisso.</i>
                
            + \ {charTag(PG, "neutral")}:                           La risposta non è nell'intenzione?
                    -> glyph_choice_manager(true, airC)->
                {charTag(TheWitch, witch_state())}:                 <i>Con forte intenzione Icaro volò verso il sole.
                                                                    <i>E con altrettanto stupore trovò la morte.</i>
                
            -
                                                                    <i>Non è nella nostra natura il proibire.
                                                                    <i>Ma se {player_name} vuole conoscere la natura dei sigilli, {player_pronouns has him:gli|{player_pronouns has her:le|lə}} consigliamo per prima cosa di comprendere la logica dei glifi.
                                                                    <i>Perché ogni glifo, come ogni scelta, è una strada.
                                                                    <i>Un vicolo di curiosità e conoscenza.
                                                                    <i>Un sentiero di azione e passione.
                                                                    <i>Un cammino di praticità e radicamento.
                                                                    <i>Un viottolo di affetto e cura.
                                                                    <i>Una calle di saggezza e spiritualità.
                                                                    <i>E se la strada si dovesse fare buia, {player_name} sappia che il nostro sguardo vigila sempre su di {player_pronouns has him:lui|{player_pronouns has her:lei|ləi}}.</i>

    -> witch_closing_storylet ->
    -> main


=== about_the_book
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    

                        {
                            - grimoire_first_character_conversation && grimoire_second_character_conversation && grimoire_greenhouse_thirdLevel:
                            {charTag(TheWitch, witch_state())}:     <i>{player_name} cerca spesso risposte tra le pagine del libro.
                            
                            - else:
                            {charTag(TheWitch, witch_state())}:     <i>{player_name} cerca di rado risposte tra le pagine del libro.
                        }

                                                                    <i>Un libro è ricordo condiviso.
                                                                    <i>Una magia che pronuncia sé stessa.
                                                                    <i>Per questo le pagine si popolano man mano che {player_name} vive.
                                                                    <i>A volte il libro usa la nostra voce.
                                                                    <i>A volte ritrova altri nomi e parole.
                                                                    <i>In una canzone collettiva che guida {player_name} alla comprensione.</i>

            -> witch_closing_storylet ->
            -> main

