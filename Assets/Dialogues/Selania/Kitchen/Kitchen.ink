=== kitchen ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
//Qui Oven avrà solo una funzione di animazione, non serve che ci interagiamo

    {debug: <i>La lista degli oggetti nella stanza è: {kitchenContents}.}
    {debug: <i>La lista degli oggetti nel deposito è: {safekeepingContents}.}

    {kitchen == 1:La vecchia cucina non vede l'ora di riempirsi di profumi e chiacchiere.}#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}

    ~ arrivingFrom = Kitchen

            -> main







