=== witch_storylets
    {    
    
        //Dono del libro
        - not foundLibro && not take_this_book:
            -> foundLibro
        
        //COmmento sul libro
        - witch_feedback.intro && not about_the_book:
            -> about_the_book
            
        //Spiegazione del nido
        - witch_feedback.intro && about_nest && not trully_about_nest:
            -> trully_about_nest
        
        - else:
            -> witch_feedback

    }



=== foundLibro
C'è un libro ai piedi del tronco, e porta il tuo nome.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}

    ~ move_entity(RewriterBook, Forest)
    ~ move_entity(WitchRecap, BookPlace)
    ~ move_entity(miniBook, Bedroom)
    ~ move_entity(nightTable, Bedroom)
    ~ player_somethingStrange ++
    -> main


=== about_the_book
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(mentor_ActualName)
Ehi {player_name}, qui ti spiego come aggiorno per te il libro della riscrittora!#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        
        + [Scelta verde.]
            -> color_variation_management(PG, greenC)->
            
        + [SCelta rossa.]
            -> color_variation_management(PG, redC)->
            
        + [Scelta blu.]
            -> color_variation_management(PG, blueC)->
     
        + [Scelta gialla.]
            -> color_variation_management(PG, yellowC)->
 
        + [Scelta viola.]
            -> color_variation_management(PG, purpleC)->
        -        
    -> main



=== trully_about_nest
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(mentor_ActualName)
        Dove ci viene detto a cosa serve il nido in modo sereno.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        E ci spiega che la manipolazione è un intento, non qualcosa di inerente all'oggetto, o al nido.
        
        + [Scelta verde.]
            -> color_variation_management(PG, greenC)->
            
        + [SCelta rossa.]
            -> color_variation_management(PG, redC)->
            
        + [Scelta blu.]
            -> color_variation_management(PG, blueC)->
     
        + [Scelta gialla.]
            -> color_variation_management(PG, yellowC)->
 
        + [Scelta viola.]
            -> color_variation_management(PG, purpleC)->
        -        
            -> main  




=== final ===
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(mentor_ActualName)
    Hai donato la Selanìa, il gioco è finito.
    Compare lo sfondo stellato.
    
        + [Scelta verde.]
            -> color_variation_management(PG, greenC)->
            
        + [SCelta rossa.]
            -> color_variation_management(PG, redC)->
            
        + [Scelta blu.]
            -> color_variation_management(PG, blueC)->
     
        + [Scelta gialla.]
            -> color_variation_management(PG, yellowC)->
 
        + [Scelta viola.]
            -> color_variation_management(PG, purpleC)->
        -        
    Cose.
    ~ move_entity(vase, Bedroom)
-> main