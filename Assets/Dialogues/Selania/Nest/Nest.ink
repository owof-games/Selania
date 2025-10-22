=== nest ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
//Qui Oven avrà solo una funzione di animazione, non serve che ci interagiamo

    {debug: <i>La lista degli oggetti nella stanza è: {nestContents}.}
    {debug: <i>La lista degli oggetti nel deposito è: {safekeepingContents}.}

    {nest == 1:Frase sul nido.}#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}

    ~ arrivingFrom = Nest

            -> main
