=== the_witch
    + {are_two_entities_together(TheWitch, PG)} [TheWitch]
        -> witch_storylets_management


=== descriptions
    {      
        //Commenti quando nessuna storia è finita 
        - LIST_COUNT(story_endedStories) == 0 :
            -> zero
        //Commenti dopo la fine di una storia    

        - LIST_COUNT(story_endedStories) > 0 :
            -> one
        
        //Commenti dopo la fine di due storie     
        - LIST_COUNT(story_endedStories) > 1:
            -> two
        
        //Commenti dopo la fine di tre storie    
        - LIST_COUNT(story_endedStories) > 2:
            -> three

        //Commenti dopo la fine di tre storie    
        - LIST_COUNT(story_endedStories) > 3:
            -> four

        //Commenti dopo la fine di tre storie    
        - else:
            -> five

    }


    = zero
        {charTag(TheWitch, witch_state())} <i>{~Nebbie sottili e ricordi pesanti|Formiche distanti su macchine arrugginite|Ritmi percussivi e voci silenti.}</i>
            -> main

    
    = one
        {charTag(TheWitch, witch_state())}<i>{~Vecchie radici si ancorano nella memoria.|La corteccia tenace resiste alla dimenticanza.|Porcellini di terra rotolano tra radici distese.}</i>
            -> main
    
    = two
        {charTag(TheWitch, witch_state())}<i>{~Il tronco chiede di percorrere nuove strade.|Pilastri reggono vecchie facciate.|Formiche inquiete cercano riparo nel vecchio legno.}</i>
            -> main

    = three
        {charTag(TheWitch, witch_state())}<i>{~L'aria saggia scalda le foglie.|Una chioma stesa in cerca di risposte.|L'erba si rinfresca ai piedi della nuova ombra.}</i>
            -> main

    = four
        {charTag(TheWitch, witch_state())}<i>{~L'aria saggia scalda il petto.|Un braccio steso in cerca di risposte.|Il tronco si torce inquieto.|L'erba si rinfresca ai piedi della nuova ombra.}</i>
            -> main

    = five
        {charTag(TheWitch, witch_state())}<i>{~L'aria saggia scalda il petto.|Un braccio steso in cerca di risposte.|Il tronco si torce inquieto.|L'erba si rinfresca ai piedi della nuova ombra.}</i>
            -> main

