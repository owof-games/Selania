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
    

    //Apertura del nido
    {charTag(ThirdCharacter, "neutral")}:       Dialogo al nido.
        + [Scelta aria]
            -> glyph_choice_manager(false, airC)->
    
        + [Scelta fuoco]
            -> glyph_choice_manager(false, fireC)->
     
        + [Scelta spirito]
            -> glyph_choice_manager(false, aetherC)->
    
        + [Scelta terra]
            -> glyph_choice_manager(false, earthC)->
            
        + [Scelta acqua]
            -> glyph_choice_manager(false, waterC)->
        -    
    {charTag(ThirdCharacter, "neutral")}:           E poi {charNameThree} se ne va.

        -> third_char_closing_storylet ->

    E {witch_actualName} ci dice che ci ha aggiunto tre sigilli random sul libro.

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