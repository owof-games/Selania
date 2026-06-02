//Questi storylets speciali non tornano sulle opzioni di dialogo, ma sul main        
    === pre_open_the_nest
        ~ temp charNameTwo = translator(thirdChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour= translator(fourthChar_ActualName)

            {//Blocco per reazioni e commenti legati al genere.
            - thirdChar_recordedPlayerPronoun == him:
            {charTag(ThirdCharacter, "jester")}:                    Boss!
                                                            
            - else:
            {charTag(ThirdCharacter, "jester")}:                    {player_name}!
            }
                                                                    Giuro che non lo faccio per farti dar di matto, ma ti chiedo di seguirmi ancora una volta.
        {charTag(ThirdCharacter, "neutral")}:                       Lì, dietro la vecchia barca.
                                                                    Questo vecio qui ti ha trovato qualcosa di 
        {charTag(ThirdCharacter, "jester")}:                        SPA-ZIA-LE!

        
        -> third_char_closing_storylet ->
        ~ opening_places()
        ~ move_entity(ThirdCharacter, Nest)

    ->->    

    
    === open_the_nest
    ~ temp charNameTwo = translator(thirdChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    

    {charTag(ThirdCharacter, "neutral")}:                           Non è che amo proprio proprio la pioggia.
                                                                    Ma.
                                                                    C'è qualcosa di rilassante in questo posto, sotto questa tenda, vero?
                                                                    Una volta da piccolo mio papà doveva venire a prendermi dopo un allenamento.
                                                                    Avevo più o meno l'età di {charNameTwo}.
                                                                    Ma pioveva così forte che ci ha messo una vita.
                                                                    Così mi sono messo sotto agli spalti, fermo, ad ascoltare la tempesta.
    {charTag(ThirdCharacter, "jester")}:                            Chissà quando sono diventato questo vecchio idiota, vero vecio?
    {charTag(ThirdCharacter, "neutral")}:                           Papà si è scusato tantissimo quando è arrivato.
    {charTag(ThirdCharacter, "bored")}:                             Tipico suo.
    {charTag(ThirdCharacter, "neutral")}:                           Ma io quelle ore me le ricordo come il momento più bello della mia vita.
                                                                    E quando ho visto quei sassi lì.
                                                                    Boh.
                                                                    Credo di averli già visti, forse proprio quel giorno.
                                                                    Sai cos'è una cosa bella del mio lavoro?
                                                                    Capire cosa dire alle persone quando stanno di merda.
                                                                    Dirgli la cosa giusta, così che ci arrivano a soli a trovare le risposte.
    {charTag(ThirdCharacter, "jester")}:                            Anche perché le mie sono tremende, vecio.
    {charTag(ThirdCharacter, "neutral")}:                           E quei sassi lì mi ricordano la stessa sensazione, di quando stai per aprire la bocca e sai già che effetto farai sulle persone.
                                                                    Non è male.
                                                                    Comunque non credo che nessuno verrà a romperti {thirdChar_recordedPlayerPronoun has him:i coglioni|{thirdChar_recordedPlayerPronoun has her:le ovaie|i genitali}} in questo postaccio.
    
    {
    - tutorial_ActivateTutorial == true:
    {charTag(ThirdCharacter, "jester")}:                            A parte Carla ovviamente!                                                                                                                                                                                                                                        
    }
    {charTag(ThirdCharacter, "neutral")}:                           Quindi ti faccio la domanda peggiore del mondo.
                                                                    Per me.
                                                                    Che idea ti sei fatt{thirdChar_recordedPlayerPronoun has him:o|{thirdChar_recordedPlayerPronoun has her:a|ə}} di me?

        + [Scelta aria] //Media
            -> glyph_choice_manager(false, airC)->
    
        + [Scelta fuoco]
            -> glyph_choice_manager(false, fireC)->
     
        + [Scelta spirito]//Negativa due (negativa come Non piace a lui, non che sia critica in assoluto)
            -> glyph_choice_manager(false, aetherC)->
    
        + [Scelta terra]
            -> glyph_choice_manager(false, earthC)->
            
        + [Scelta acqua] //Negativa uno
            -> glyph_choice_manager(false, waterC)->
        -    
    
    {charTag(ThirdCharacter, "neutral")}:                           Ti lascio al tuo nuovo giochino, {player_name}.
                                                                    Magari così c'hai un buon ricordo di me quando me ne vado.

        -> third_char_closing_storylet ->

    {charTag(TheWitch, "{witch_state()}")}:                         {player_name}.
                                                                    Questo posto è potente.
                                                                    E complesso.
                                                                    Una parte di noi vorrebbe dire a {player_name} di andarsene subito.
                                                                    Ma crediamo anche che l'esperienza sia la migliore maestra.
                                                                    Abbiamo quindi deciso di donare a {player_name} tre <b>sigilli</b>.
                                                                    Li troverà nel suo grimorio.
                                                                    Sperando che {player_name} ricordi che non tutto quello che possediamo va utilizzato.
                                                                    Se {player_name} vuole ancora parlarne con noi, ci trova come sempre alla discarica.       

        //Chiamiamo il primo, notifichiamo, ripetiamo  
        ~ png_random_sigils_opener ()
            {player_name} ha ricevuto {sigils_translator(nest_newSigilDiscovered)}.
            //Chiamo tre volte l'updater, così aggiorno l'informazione sul grimorio
            ~ glyph_grimoireTripleSigilsUpdater()
            ~ glyph_grimoireTripleSigilsUpdater()
            ~ glyph_grimoireTripleSigilsUpdater()
            //Poi aggiorno il sigillo principale
            ~ glyph_grimoireMainSigilsUpdater()
            //E poi svuoto il nuovo sigillo
            ~ nest_newSigilDiscovered = ()

        ~ png_random_sigils_opener ()
            {player_name} ha ricevuto {sigils_translator(nest_newSigilDiscovered)}.
            //Chiamo tre volte l'updater, così aggiorno l'informazione sul grimorio
            ~ glyph_grimoireTripleSigilsUpdater()
            ~ glyph_grimoireTripleSigilsUpdater()
            ~ glyph_grimoireTripleSigilsUpdater()
            //Poi aggiorno il sigillo principale
            ~ glyph_grimoireMainSigilsUpdater()
            //E poi svuoto il nuovo sigillo
            ~ nest_newSigilDiscovered = ()


        ~ png_random_sigils_opener ()
            {player_name} ha ricevuto {sigils_translator(nest_newSigilDiscovered)}.
            //Chiamo tre volte l'updater, così aggiorno l'informazione sul grimorio
            ~ glyph_grimoireTripleSigilsUpdater()
            ~ glyph_grimoireTripleSigilsUpdater()
            ~ glyph_grimoireTripleSigilsUpdater()
            //Poi aggiorno il sigillo principale
            ~ glyph_grimoireMainSigilsUpdater()
            //E poi svuoto il nuovo sigillo
            ~ nest_newSigilDiscovered = ()

        
        //Parte subito la spiegazione sui sigilli di Carla
        {
            -  settings_gamerMode == true:
                ~ move_entity(Carla, Library)
                -> tutorial_carlaSigilsActivationStorylet
            - else:
                ->->
        }
        
        

=== third_read_story_library
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    

    {charTag(ThirdCharacter, "neutral")}:       Racconto letto in biblioteca.
    A racconto scelto, cambia anche logica in Special Storylets
    Potrebbe aver senso il racconti di Maura, visto che lo percepirebbe come ostile (misandrico?)
    - 
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
            {
                    - are_two_entities_together(FirstCharacter, PG):
                    {
                    - grimoire_firstChar has grimFirstThirdChar:
                            {charTag(FirstCharacter, "annoyed")}:                   Commento infastidito di Chitarra.

                    - else:
                            {charTag(FirstCharacter, "neutral")}:                   Commento empatico di Chitarra.    
                    }
            }    
        -> third_char_closing_storylet ->
        ->->


=== dog_third_char
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    
   
   {charTag(ThirdCharacter, "neutral")}:       {charNameThree} ha visto un cane.

    -> third_char_closing_storylet ->
    ->->        