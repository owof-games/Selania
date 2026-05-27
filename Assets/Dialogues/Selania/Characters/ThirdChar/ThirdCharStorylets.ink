=== third_char_main_storylets

= one
    //Non mettere cose TW qui
    //Obiettivo: Presentare l’elemento delle bugie. Vengono dette cose sconfessate poi nella terza storia.
    //Contenuto: Compleanno, giochi
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)

        //Commento diverso a seconda che sia il primo storylet con noi, o se invece ha assistito ad altri storylets.
        {
            - thirdChar_recordedPlayerPronoun != ():
            {charTag(PG, "neutral")}:                       Immagina: arrivo qui e la prima cosa che penso qual è?
                                                            "No, questo non proprio il frigo."

            - else:  
            {charTag(PG, "neutral")}:                       No, questo non è il frigo.   
        }
                                                            Volevo prendermi una kölsch, giusto per affrontare il caldo.
                                                            E invece eccomi qui.
                                                            Però per lo meno non si sente il miagolio del gatto dello Stracciamaroni.
                                                            O il puzzo dello Stracciamaroni.

        {
            - thirdChar_recordedPlayerPronoun == ():
            {charTag(ThirdCharacter, "neutral")}:           Ma partiamo con le presentazioni!
                -> name_choice.top2 ->
                -> gender ->
            ~ thirdChar_recordedPlayerPronoun += player_pronoun

            - else:
            {
                - player_pronoun == him:
                {charTag(PG, "neutral")}:                   Prima ti hanno chiamato {player_name}, e ho sentito che sei un ragazzo!
                                                            Te la posso dire una cosa?
                                                            Meno male.
                                                            MENO MALE!
                                                            Perché tra {charNameOne} e {charNameFive} mi serviva qualcuno con cui parlare di calcio e non solo di "cose emotive".

                - player_pronoun == her:
                {charTag(PG, "neutral")}:                   Prima ti hanno chiamato {player_name}, e ho sentito che sei un ragazza!
                                                            Sono sicuro che {charNameOne} e quella di {charNameFive} sei felice che ci sia qualcuno con cui non devi parlare della posta del cuore.
                                                            Non che ci sia qualcosa di male se ti piace!
                                                            Ma non è la mia roba.
                                                            Zero proprio!

                - player_pronoun == they:
                {charTag(PG, "neutral")}:                   Prima ti hanno chiamato {player_name}, e ho sentito che sei una persona non binaria.
                                                            Te lo dico già ora: supporto tantissimo.
                                                            Ma mi confondo coi nomi, figurati coi pronomi.
                                                            Però ci provo, guarda: <b>amicə</b>.
                                                            È come cercare di dire una <i>a</i> e venire bloccati da un colpo di tosse.
            }   
        }


        {charTag(PG, "neutral")}:                           Io sono {charNameThree}.
                                                            Cioè, non sono davvero {charNameThree}.
                                                            Ma prima {charNameTwo} mi ha detto: "Ehi, ma tu sembri un boccale di birra!"
                                                            E allora ho cercato il mio riflesso.
                                                            Un po' ci sono rimasto male: tutte quelle ore spese in palestra, e nessuno le vedrà!
                                                            Detto tra noi, le ore sono state due.
                                                            Tre se contiamo il tempo dell'iscrizione.
                                                            Però la mia pancetta da birra piace.
                                                            E ora sono una birra.
                                                            Ma birra o non birra, che si combina da queste parti?

            
            + \ {charTag(PG, "neutral")}:                   Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->
                
                
            + \ {charTag(PG, "neutral")}:                   Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                    -> glyph_choice_manager(false, aetherC)->
                
            
            + \ {charTag(PG, "neutral")}:                   Cosa ti renderà più stabile? da quali fondamenta parti?
                    -> glyph_choice_manager(false, earthC)->
                
            
            + \ {charTag(PG, "neutral")}:                   Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->
                
            
            + \ {charTag(PG, "neutral")}:                   Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)-> 
                    
                
        -    
        {charTag(ThirdCharacter, "neutral")}:               Quindi gira che ti rigira, sei solo te a sgobbare qui mentre noi ce la prendiamo comoda?
                                                            Che sfiga.

        {//Blocco per reazioni e commenti legati al genere.
            - thirdChar_recordedPlayerPronoun == him:
            {charTag(ThirdCharacter, "neutral")}:           Alla fine tocca sempre a noi uomini tirare avanti la baracca, vero?
                                                        

            - else:
            {charTag(ThirdCharacter, "neutral")}:           Questo sì che è un cambiamento!
                                                            Non averne a male, ma alla fine siamo sempre noi uomini a tirare avanti la baracca.
                                                            E invece vedi un po'.
        }                
                                                            Anche se Donatella è, era una che sgobbava tantissimo, per dire.

        {//Blocco per reazioni e commenti legati al genere.
            - thirdChar_recordedPlayerPronoun == him:
            {charTag(ThirdCharacter, "neutral")}:           Quella stronza della mia ex.
                                                        

            - else:
            {charTag(ThirdCharacter, "neutral")}:           La mia ex.
        }
                                                            Ma non sono qui per parlare di lei.
                                                            Non so proprio perché sono qui: non c'ho di sicuro le ansie di {charNameOne}.
                                                            E l'età delle elementari è passata da, boh, trent'anni?
                                                            Anche se ti giuro che non si vede quando non sempre un pezzo di vetro.
        {//Blocco per reazioni e commenti legati al genere.
            - thirdChar_recordedPlayerPronoun == him:
            {charTag(ThirdCharacter, "neutral")}:           Ma tra l'altro come piscio?
                                                            E vuol dire che sono nudo ora?
                                                            Dov'è finito?
                                                            Oh.

            - else:
            {charTag(ThirdCharacter, "neutral")}:           Ma come mangio poi?
                                                            E se mangio dove finisce quello che mangio?
                                                            Ma soprattutto, dove esce?!?
        }                                                    
                                                            Comunque butta bene che mi avete rapito nel giorno libero.
        {
            - are_two_entities_together(Mentor, PG):        
            {charTag(Mentor, "sad")}:                       Nessuno ti ha rapito. {charNameThree}!
                                                            Le persone arrivano qui perché ne hanno bisogno.
            {charTag(ThirdCharacter, "jester")}:            Si fa per dire, zia!
                                                            Anche se avrei preferito passare la giornata a sistemare il fantacalcio.
        }                                                    
                                                            Sono uno che si fa il culo a lavoro, {player_name}.
                                                            In teoria dovrei farmi dalle cinque all'una, ma finisce sempre che mi chiamano anche durante il giorno.
                                                            Colleghi, fornitori, i tizi della spazzatura.
                                                            Perché il mio capo è un coglione.
                                                            Ma c'ha i soldi, per cui: rispetto.
        {//Blocco per reazioni e commenti legati al genere.
        - thirdChar_recordedPlayerPronoun == him:
        {charTag(ThirdCharacter, "neutral")}:               E la sua tipa, oh amico mio.
                                                            Non hai idea di quanto sia bona.
                                                            Incapace, ma bona!
        }                                                      
                                                            Ma visto che invece tu c'hai i superpoteri e porti la gente in posti incasinati con la sola forza del pensiero, dimmi.
                                                            Che lavoro faccio?


            + \ {charTag(PG, "neutral")}:                   Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->
                
                
            + \ {charTag(PG, "neutral")}:                   Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                    -> glyph_choice_manager(false, aetherC)->
                
            
            + \ {charTag(PG, "neutral")}:                   Cosa ti renderà più stabile? da quali fondamenta parti?
                    -> glyph_choice_manager(false, earthC)->
                
            
            + \ {charTag(PG, "neutral")}:                   Dall'aspetto direi che sei un barista?
                    -> glyph_choice_manager(false, airC)->
            {charTag(ThirdCharacter, "neutral")}:           "Dall'aspetto?!?".
                                                            Così si giudicano le persone nel terzo millennio?
                                                            Dov'è {charNameOne} con le sue cose femministe a difendermi?
            {//Blocco per reazioni e commenti legati al genere.
            - thirdChar_recordedPlayerPronoun == him:
            {charTag(ThirdCharacter, "neutral")}:           Sei un coglione, amico!
                                                            Ma lo sono anche io, quindi top!

            - else:
            {charTag(ThirdCharacter, "neutral")}:           Ovviamente ti prendo in giro, non ti preoccupare.
        }  
            
            + \ {charTag(PG, "neutral")}:                   Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)-> 
                    
            -
        {charTag(ThirdCharacter, "jester")}:                Comunque lavoro in una birreria.
                                                            Anzi: LA birreria.
                                                            La migliore della zona.
                                                            Perché l'unica nel quartiere sfigatissimo in cui vivo.
                                                            Pura periferia.
                                                            Però non è così male, se ignori la distesa infinita di appartamenti.
                                                            I vecchi che dicono "Qui un tempo era tutta pianura!".
                                                            E i turisti che prendono un buco in affitto convinti di essere in centro.
                                                            E invece c'hanno a dividere la fermata del bus la sera con il Pino.
        {
            - are_two_entities_together(Franco, PG):
            {charTag(Franco, "party")}:                     Pino il girino?
            {charTag(ThirdCharacter, "jester")}:            Se Pino il girino è alto quasi due metri e ha un paio di pantaloncini che stanno su solo grazie allo sporco del padrone, sì, allora è Pino il girino.
        }                                                    
                                                            Ogni tanto qualcuno gli fa le foto, al Pino.
                                                            I turisti sono idioti.
                                                            Ma vai ad aiutare qualcuno di questi poveracci, mentre mi rilasso un attimo.
        -> third_char_closing_storylet ->
        -> options_third_character
   
    = two
    //Non mettere cose TW qui
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    

        {charTag(ThirdCharacter, "neutral")}:      Frase

        
            + \ {charTag(PG, "neutral")}:               Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->
                
                
            + \ {charTag(PG, "neutral")}:               Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                    -> glyph_choice_manager(false, aetherC)->
                
            
            + \ {charTag(PG, "neutral")}:               Cosa ti renderà più stabile? da quali fondamenta parti?
                    -> glyph_choice_manager(false, earthC)->
                
            
            + \ {charTag(PG, "neutral")}:               Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->
                
            
            + \ {charTag(PG, "neutral")}:               Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)-> 
                
            - 
            -> third_char_closing_storylet ->
            -> options_third_character

    = three
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    

        {charTag(ThirdCharacter, "neutral")}:      Frase

        
            + \ {charTag(PG, "neutral")}:               Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->
                
                
            + \ {charTag(PG, "neutral")}:               Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                    -> glyph_choice_manager(false, aetherC)->
                
            
            + \ {charTag(PG, "neutral")}:               Cosa ti renderà più stabile? da quali fondamenta parti?
                    -> glyph_choice_manager(false, earthC)->
                
            
            + \ {charTag(PG, "neutral")}:               Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->
                
            
            + \ {charTag(PG, "neutral")}:               Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)-> 
                
            - 
            -> third_char_closing_storylet ->
            -> options_third_character
            

    
    = four
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    
        
        {charTag(ThirdCharacter, "neutral")}:      Frase

        
            + \ {charTag(PG, "neutral")}:               Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->
                
                
            + \ {charTag(PG, "neutral")}:               Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                    -> glyph_choice_manager(false, aetherC)->
                
            
            + \ {charTag(PG, "neutral")}:               Cosa ti renderà più stabile? da quali fondamenta parti?
                    -> glyph_choice_manager(false, earthC)->
                
            
            + \ {charTag(PG, "neutral")}:               Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->
                
            
            + \ {charTag(PG, "neutral")}:               Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)-> 
                
            - 
            -> third_char_closing_storylet ->
            -> options_third_character

    = five
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    
        

        {charTag(ThirdCharacter, "neutral")}:      Frase

        
            + \ {charTag(PG, "neutral")}:               Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->
                
                
            + \ {charTag(PG, "neutral")}:               Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                    -> glyph_choice_manager(false, aetherC)->
                
            
            + \ {charTag(PG, "neutral")}:               Cosa ti renderà più stabile? da quali fondamenta parti?
                    -> glyph_choice_manager(false, earthC)->
                
            
            + \ {charTag(PG, "neutral")}:               Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->
                
            
            + \ {charTag(PG, "neutral")}:               Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)-> 
                
            - 
            -> third_char_closing_storylet ->
            -> options_third_character
    

    = six
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    

        {charTag(ThirdCharacter, "neutral")}:      Frase

        
            + \ {charTag(PG, "neutral")}:               Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->
                
                
            + \ {charTag(PG, "neutral")}:               Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                    -> glyph_choice_manager(false, aetherC)->
                
            
            + \ {charTag(PG, "neutral")}:               Cosa ti renderà più stabile? da quali fondamenta parti?
                    -> glyph_choice_manager(false, earthC)->
                
            
            + \ {charTag(PG, "neutral")}:               Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->
                
            
            + \ {charTag(PG, "neutral")}:               Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)-> 
                
            - 
            -> third_char_closing_storylet ->
            -> options_third_character
    


    ///Scelte legate alle lettere
    === third_char_letters_choices



    = one
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)
        

        + (air)\ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?

                
        + (earth)\ {charTag(PG, "neutral")}:         Cosa ti renderà più stabile? Da quali fondamenta parti?
                

        + (fire)\ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                

        + (water)\ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                

        + (aether)\ {charTag(PG, "neutral")}:        Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                
        -

        ->->

    = two
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)

        + (air)\ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?

                
        + (earth)\ {charTag(PG, "neutral")}:         Cosa ti renderà più stabile? Da quali fondamenta parti?
                

        + (fire)\ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                

        + (water)\ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                

        + (aether)\ {charTag(PG, "neutral")}:        Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                
        -
        ->->


    = three
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)

        + (air)\ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?

                
        + (earth)\ {charTag(PG, "neutral")}:         Cosa ti renderà più stabile? Da quali fondamenta parti?
                

        + (fire)\ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                

        + (water)\ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                

        + (aether)\ {charTag(PG, "neutral")}:        Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                
        -
        ->->


    = four
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)

        + (air)\ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?

                
        + (earth)\ {charTag(PG, "neutral")}:         Cosa ti renderà più stabile? Da quali fondamenta parti?
                

        + (fire)\ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                

        + (water)\ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                

        + (aether)\ {charTag(PG, "neutral")}:        Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                
        -
        ->->


    = five
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)

        + (air)\ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?

                
        + (earth)\ {charTag(PG, "neutral")}:         Cosa ti renderà più stabile? Da quali fondamenta parti?
                

        + (fire)\ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                

        + (water)\ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                

        + (aether)\ {charTag(PG, "neutral")}:        Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                
        -
        ->->

    = six
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)
        
        + (air)\ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?

                
        + (earth)\ {charTag(PG, "neutral")}:         Cosa ti renderà più stabile? Da quali fondamenta parti?
                

        + (fire)\ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                

        + (water)\ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                

        + (aether)\ {charTag(PG, "neutral")}:        Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                
        -
        ->->

    = seven
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)

        //Seconda riscrittura
        -> second_rewriting ->
        ->->