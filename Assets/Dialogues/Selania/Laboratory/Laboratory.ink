=== laboratory ===
#background: {tag_background()}
//In quest'angolo possiamo assaporarci una bella tisana creata da noi, e vedere i quadri delle ame.

{debug: <i>La lista degli oggetti nella stanza è: {laboratoryContents}.}
<i>Ecco: è il momento di una bella tisana</i>#speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {fungus_state()}


    + [Inizio a preparare una tisana]
        ~ move_entity(LaboratoryRecap, BookPlace)
        {
            - laboratory == 1:
            ~ saturationVar ++
            ~ move_entity(teaKit, Bedroom)
        }


    -
    
-> main
