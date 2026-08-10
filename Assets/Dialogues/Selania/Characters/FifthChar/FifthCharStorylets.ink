=== fifth_char_main_storylets

= one
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
            //Aggiungiamo a lista list_currentActors
            ~ list_currentActors += FifthCharacter
    
        {charTag(FifthCharacter, "quiet")}:             Dissi che i fiori li avrei comprati io.
                                                        Luba aveva già il suo daffare, e poi era la mattinata era ancora fresca, e la luce così dorata.
        {charTag(FifthCharacter, "silly")}:             Dal ritorno dopo il ricovero mi sono trasformata in una lucertolina, {player_name}, sempre alla ricerca di un po' di sole.
        {charTag(FifthCharacter, "quiet")}:             Elia mi aveva lasciato in carico il piccolo Vittorio, che se ne stava nel passeggino, il tablet in mano.
                                                        Ho deciso di levarglielo, di fargli godere le vie del paese, gli alberi, i cani, i saluti delle persone.
                                                        Ora che siamo arrivati dalla fiorista mi aveva già stordita di capricci e domande, per poi crollare in un sonno agitato.
                                                        Quando entriamo, Liliana mi abbraccia e mi chiede di Riccardo, della Generalessa, di Elia, di mia cognata.
        {charTag(FifthCharacter, "silly")}:             Poi mi fa vedere i fiori che ha ordinato per la festa.
        {charTag(FifthCharacter, "quiet")}:             È una donna piccina Liliana, ma quando inizia a parlare di fiori riempie tutta la stanza.
                                                        E così le camelie lasciano il posto agli iris e dagli iris si passa alle giunchiglie e ai fiori di pomodoro perché "l'agreste è tornato di moda, signora dall'Orto" e sono così presa dagli odori che quando afferra un mazzo di crisantemi le dico che è una scelta così nefasta e non mi accorgo che non siamo più sole, che c'è la giovane Lucrezia, e mi faccio tutta rossa.
        {charTag(FifthCharacter, "down")}:              "Signora dall'Orto", mi sorride ed è sempre così gentile e distante da quando ha perso il marito ma in quel momento mi sento solo in colpa perché sono tre settimane che non rispondo alle sue chiamate.
        {charTag(FifthCharacter, "quiet")}:             Quando Liliana si allontana per impacchettarle i crisantemi, Lucrezia sussurra: "Gli esiti dei test sono pronti, signora. Può passare in studio per parlarne col dottore".
        {charTag(FifthCharacter, "down")}:              Farfuglio un "Passerò domani, promesso", e le dico di portare le mie scuse al dottor Boscospento, ma l'organizzazione della festa mi ha distratta.
        {charTag(FifthCharacter, "quiet")}:             Lei sorride di nuovo, e anche se la pelle è candida e i capelli biondi e gli occhi chiari, sembra tutto così scuro attorno a lei.
                                                        Si mette a giocherellare con un bocciolo di rose.
                                                        "Amare rende soli", dice.
                                                        Non so se a sé stessa, se a me, se al fantasma del marito.
                                                        Cerco qualcosa di intelligente da dire ma da fuori arriva il suono insistente di un clacson, e quando finalmente sto per risponderle che non è vero, che amare ci rende vivi, Lucrezia e Liliana sono già sulla soglia del negozio.
                                                        Sta passando una macchina, una di quelle tutte nere e serie, con la polizia davanti e dietro.
        {charTag(FifthCharacter, "angry")}:             Liliana dice che è il vescovo, che si è deciso a portare via "Quel tipaccio di don Pietro".
        {charTag(FifthCharacter, "quiet")}:             Lucrezia risponde che il vescovo non ha la scorta, che deve essere qualche politico, forse qualcuno di grosso della regione.
                                                        Mi chiede se è qualcuno che verrà alla festa, ma continuo solo a pensare a quello che ha detto: "Amare rende soli".
                                                        Pago Liliana, prendo i fiori, e mi avvio per il resto delle commissioni, le sue parole sugli occhi, sulle mani, in fondo alla gola.
                                                        Quando torno a casa e appoggio i fiori sul tavolo del salotto vengo investita da una Luba infuriata che mi chiede come mai non avessi risposto al telefono e mentre cerco nella borsa compare Elia con in braccio il piccolo Vittorio.
                                                        "Però i tuoi maledetti fiori non li hai dimenticati".
        {charTag(FifthCharacter, "scared")}:            {player_name}: capisci?
                                                        Ho dimenticato mio nipote dalla fiorista.
                                                        Per due ore.
        {charTag(FifthCharacter, "down")}:              Gesù sa cosa pensa di me quella donna ora.
            
            + \ {charTag(PG, "neutral")}:               Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->
                
            + \ {charTag(PG, "neutral")}:               Cosa ti renderà più stabile? Da quali fondamenta parti?
                    -> glyph_choice_manager(false, earthC)->
                    
            + \ {charTag(PG, "neutral")}:               Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)->
                
            + \ {charTag(PG, "neutral")}:               Cosa senti/hai sentito davvero ("davvero" è importante, è un andare in fondo alle emozioni)? //Liliana ti ha chiesto cose su tutti, tranne che su di te.
                    -> glyph_choice_manager(false, waterC)->
                    
            + \ {charTag(PG, "neutral")}:               Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                    -> glyph_choice_manager(false, aetherC)->
                
        -    
        {charTag(FifthCharacter, "quiet")}:             Quando {charNameTwo} è arrivato qui, continuavo a pensare a quello che ho combinato con Vittorio.
                                                        A cosa sarebbe successo se mi fossi distratta di nuovo in un posto così grande, così strano.
                                                        E la rabbia ha preso il sopravvento.
        
        -> fifth_char_closing_storylet ->
        -> options_fifth_character
   
    = two
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
            //Aggiungiamo a lista list_currentActors
            ~ list_currentActors += FifthCharacter
    

        {charTag(FifthCharacter, "quiet")}:             

        
            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->

            + \ {charTag(PG, "neutral")}:         Cosa ti renderà più stabile? Da quali fondamenta parti?
                    -> glyph_choice_manager(false, earthC)->
                    
            + \ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)->

            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero ("davvero" è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->

            + \ {charTag(PG, "neutral")}:         Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                -> glyph_choice_manager(false, aetherC)->
            - 
            -> fifth_char_closing_storylet ->
            -> options_fifth_character

    = three
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
            //Aggiungiamo a lista list_currentActors
            ~ list_currentActors += FifthCharacter
    

        {charTag(FifthCharacter, "quiet")}:       Frase
  

            
            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->

            + \ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)->

            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero ("davvero" è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->    
                          
            + \ {charTag(PG, "neutral")}:         Cosa ti renderà più stabile? Da quali fondamenta parti?
                    -> glyph_choice_manager(false, earthC)->
                    
            + \ {charTag(PG, "neutral")}:         Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                    -> glyph_choice_manager(false, aetherC)->
            -
            
            -> fifth_char_closing_storylet ->
            -> options_fifth_character
            

    
    = four
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
            //Aggiungiamo a lista list_currentActors
            ~ list_currentActors += FifthCharacter
    
        
        {charTag(FifthCharacter, "quiet")}:       Frase
            
            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->
                    
            + \ {charTag(PG, "neutral")}:         Cosa ti renderà più stabile? Da quali fondamenta parti?
                    -> glyph_choice_manager(false, earthC)->
                    
            + \ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)->

            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero ("davvero" è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->

            + \ {charTag(PG, "neutral")}:         Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                    -> glyph_choice_manager(false, aetherC)->
            -
        
        -> fifth_char_closing_storylet ->
        -> options_fifth_character

    = five
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
            //Aggiungiamo a lista list_currentActors
            ~ list_currentActors += FifthCharacter
    
        

        {charTag(FifthCharacter, "quiet")}:       Frase
        
            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->

            + \ {charTag(PG, "neutral")}:         Cosa ti renderà più stabile? Da quali fondamenta parti?
                    -> glyph_choice_manager(false, earthC)->
                    
            + \ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)->
        
            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero ("davvero" è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->
                
            + \ {charTag(PG, "neutral")}:         Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                    -> glyph_choice_manager(false, aetherC)->
            -

            -> fifth_char_closing_storylet ->
            -> options_fifth_character
    

    = six
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
            //Aggiungiamo a lista list_currentActors
            ~ list_currentActors += FifthCharacter
    

        {charTag(FifthCharacter, "quiet")}:       Frase
       
            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->
                    
            + \ {charTag(PG, "neutral")}:         Cosa ti renderà più stabile? Da quali fondamenta parti?
                    -> glyph_choice_manager(false, earthC)->

                    
            + \ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                    -> glyph_choice_manager(false, fireC)->

            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero ("davvero" è importante, è un andare in fondo alle emozioni)?
                    -> glyph_choice_manager(false, waterC)->

            + \ {charTag(PG, "neutral")}:        Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                    -> glyph_choice_manager(false, aetherC)->
        - 

        -> fifth_char_closing_storylet ->            
        -> options_fifth_character
    