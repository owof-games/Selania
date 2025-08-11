=== nest ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
//Questo è il posto degli animaletti amici che fanno cose carine. Da pensare se creare una attività specifica (es: disegnare) o se fanno solo cose buffe. Potrei pensare a fale con caratteri diversi.


<i>Sei dalle falene</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
    
    + [Coccoli le falene]
    + [Mi guardo attorno]
        ~ move_entity(NestRecap, BookPlace)
        {
            - nest == 1:
            ~ saturationVar ++
        }


    -
    
-> main