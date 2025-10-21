=== kitchen ===
#background: {tag_background()}
//In quest'angolo possiamo assaporarci una bella tisana creata da noi, e vedere i quadri delle ame.

{debug: La lista degli oggetti nella stanza è: {kitchenContents}.}
Ecco: è il momento di una bella tisana#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}


    + [<i>Inizio a preparare una tisana]
        @animation:RewriterBook
        ~ move_entity(KitchenRecap, BookPlace)
        {
            - kitchen == 1:
            ~ saturationVar ++
            ~ move_entity(teaKit, Bedroom)
        }


    -
    
-> main
