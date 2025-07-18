=== nest ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
//Questo è il posto degli animaletti amici che fanno cose carine. Da pensare se creare una attività specifica (es: disegnare) o se fanno solo cose buffe. Potrei pensare a fale con caratteri diversi.
{
    - nest == 1:
    ~ move_entity(NestRecap, BookPlace)
}    

<i>Sei dalle falene</i>#speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: fungus_neutral
    
    + [Coccoli le falene]
    + [Mi guardo attorno]

    -
    
-> main