=== nest ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
//Questo è il posto degli animaletti amici che fanno cose carine. Da pensare se creare una attività specifica (es: disegnare) o se fanno solo cose buffe. Potrei pensare a fale con caratteri diversi.

// {debug: <i>La lista degli oggetti nella stanza è: {trainStopContents}.}




{nest == 1:Sei dalle falene.}#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}

        ~ move_entity(NestRecap, BookPlace)
        {
            - nest == 1:
            ~ saturationVar ++
        }

// ~ arrivingFrom = TrainStop

    
-> main