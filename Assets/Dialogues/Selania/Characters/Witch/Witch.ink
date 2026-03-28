=== the_witch
    + {are_two_entities_together(TheWitch, PG)} [TheWitch]
        -> witch_storylets_management







=== descriptions
    {   
        //Opinioni dopo la fine di due storie    
        - (firstChar_storyStatus == story_storyEnded) && (secondChar_storyStatus == story_storyEnded):
            -> three
        //Opinioni dopo la fine di una storia     
        - (firstChar_storyStatus == story_storyEnded) or (secondChar_storyStatus == story_storyEnded):
            -> two
        //Opinioni presenti da inizio gioco    
        - else:
            -> one
    }
    
    = one
    //Contenuti iniziali
        <i>{~Vecchie radici si ancorano nella memoria.|La corteccia tenace resiste alla dimenticanza.|Formiche inquiete cercano riparo nel vecchio legno.}#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            -> main
    
    = two
    //Opinioni dopo la fine di una storia  
        <i>{~Gambe chiedono di percorrere nuove strade.|Nuovi piedi si riempiono di vecchie domande.|Porcellini di terra rotolano tra dita distese.}#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            -> main

    = three
    //Opinioni dopo la fine di due storie 
        <i>{~L'aria saggia scalda il petto.|Un braccio steso in cerca di risposte.|Il tronco si torce inquieto.|L'erba si rinfresca ai piedi della nuova ombra.}#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            -> main

    = four
    
    -> main
    
