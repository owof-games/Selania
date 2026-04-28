//Questi storylets speciali non tornano sulle opzioni di dialogo, ma sul main        
    === open_the_nest
    ~ temp charNameTwo = translator(thirdChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    

    //Apertura del nido
    {charTag(ThirdCharacter, "neutral")}:       Dialogo in biblioteca.
        + [Scelta blu.]
             -> glyph_modifier_variation_management(ThirdCharacter, airC)->
    
        + [Scelta rossa.]
            -> glyph_modifier_variation_management(ThirdCharacter, fireC)->
     
        + [Scelta viola.]
            -> glyph_modifier_variation_management(ThirdCharacter, aetherC)->
    
        + [Scelta gialla.]
            -> glyph_modifier_variation_management(ThirdCharacter, earthC)->
            
        + [Scelta verde.]
            -> glyph_modifier_variation_management(ThirdCharacter, waterC)->
        -    
    {charTag(ThirdCharacter, "neutral")}:       Ci viene aperto il nido.
                                                E poi {charNameThree} se ne va.
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

        -> third_char_closing_storylet ->
        ~ opening_places()
        //Parte subito lo spiegozzo sui sigilli di Carla
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
            + \ {charTag(PG, "neutral")}:               Scelta acqua
                    -> glyph_modifier_variation_management(ThirdCharacter, waterC)->
                
                
            + \ {charTag(PG, "neutral")}:               Scelta spirito
                    -> glyph_modifier_variation_management(ThirdCharacter, aetherC)->
                
            
            + \ {charTag(PG, "neutral")}:               Scelta terra
                    -> glyph_modifier_variation_management(ThirdCharacter, earthC)->
                
            
            + \ {charTag(PG, "neutral")}:               Scelta aria
                    -> glyph_modifier_variation_management(ThirdCharacter, airC)->
                
            
            + \ {charTag(PG, "neutral")}:               Scelta fuoco
                    -> glyph_modifier_variation_management(ThirdCharacter, fireC)-> 
                
            -
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