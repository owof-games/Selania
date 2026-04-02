//Questi storylets speciali non tornano sulle opzioni di dialogo, ma sul main        
    === open_the_nest
    ~ temp charNameTwo = translator(thirdChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    //Apertura del nido
    Dialogo in biblioteca.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental
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
    Ci viene aperto il nido.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental
    E poi {charNameThree} se ne va.
    E Luna ci dice che ci ha aggiunto tre sigilli random sul libro.

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
        -> opening_places ->
        //Parte subito lo spiegozzo sui sigilli di Carla
        {
            -  settings_gamerMode == true:
                ~ move_entity(Carla, Library)
                -> tutorial_carlaSigilsActivationStorylet
            - else:
                -> main

        }
        
        

=== third_read_story_library
~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(thirdChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    Racconto letto in biblioteca.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental
    A racconto scelto, cambia anche logica in Special Storylets
    Potrebbe aver senso il racconti di Maura, visto che lo percepirebbe come ostile (misandrico?)
    - 
    
        -> third_char_closing_storylet ->
        -> main


=== dog_third_char
~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(thirdChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
   
   Tre ha visto un cane.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental

    -> third_char_closing_storylet ->
    -> main        