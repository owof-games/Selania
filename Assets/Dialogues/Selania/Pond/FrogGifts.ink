=== frog_gift_dispatcher ===
//Qui è dove distribuiamo i doni a seconda della situazione
{currentMissionAboutChar:
    - missionCharOne:
        -> char_one_gifts
    - missionCharTwo:
        -> char_two_gifts
    //- missionCharThree:
    //- missionCharFour:
    //- missionCharFive:
    - missionObjects:
        -> mission_objects
    - specialDelivery:
        -> special_delivery
}


//Doni generici
    
    = char_one_gifts
    //Chitarra
        + {firstGift == ()} Coltivabile adatto:
            Se non lo hai già: viene messo in priorità di crescita in serra#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
            Se lo hai già e non lo hai usato: ti viene data una dritta#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
            Se lo hai già e lo hai usato altrove: te ne viene dato un altro (ma solo uno per gioco)
            
        + {!ending_cooking_with_first_char} Suggerimento per ultimo ingrediente:#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
            Se non lo hai già: viene messo in priorità di crescita in serra
            Se lo hai già e non lo hai usato: ti viene data una dritta
            Se lo hai già e lo hai usato altrove: te ne viene dato un altro (ma solo uno per gioco)
            
        + {playerAccessiblePlaces has Nest} Parola magica adatta#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
            A prescindere: ti viene suggerito un secondo o terzo colore (mai il primo). Cambia il testo in base a se non la hai già, se lo hai già e non lo hai usato, se lo hai già e lo hai usato altrove: te ne viene dato un altro (ma solo uno per gioco).
        
        + Conversazioni speciali es: storylet che avviene se due png sono vicine, o un racconto da leggere per poterne parlare con una PNG (Ti viene consigliato di continuare ad esplorare un certo tipo di tema.). Non sono mai info dirette.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
        -   
        -> closed_exchange
    
    
    = char_two_gifts
    //Riccio
        + {secondGift == ()} Coltivabile adatto:
            Se non lo hai già: viene messo in priorità di crescita in serra#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
            Se lo hai già e non lo hai usato: ti viene data una dritta
            Se lo hai già e lo hai usato altrove: te ne viene dato un altro (ma solo uno per gioco)
            
        + {!ending_cooking_with_second_char} Suggerimento per ultimo ingrediente:
            Se non lo hai già: viene messo in priorità di crescita in serra#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
            Se lo hai già e non lo hai usato: ti viene data una dritta
            Se lo hai già e lo hai usato altrove: te ne viene dato un altro (ma solo uno per gioco)
            
        + {playerAccessiblePlaces has Nest} Parola magica adatta
            A prescindere: ti viene suggerito un secondo o terzo colore (mai il primo). Cambia il testo in base a se non la hai già, se lo hai già e non lo hai usato, se lo hai già e lo hai usato altrove: te ne viene dato un altro (ma solo uno per gioco).#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
        
        + Conversazioni speciali es: storylet che avviene se due png sono vicine, o un racconto da leggere per poterne parlare con una PNG (Ti viene consigliato di continuare ad esplorare un certo tipo di tema.). Non sono mai info dirette.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
            
        - 
        -> closed_exchange
    
    = mission_objects
    //Oggetti

    -> closed_exchange
    
    = special_delivery
//Cose speciali
        + Ingrediente universale: uno solo per gioco.
        + Nota viola: una sola per gioco MA se la usi come ingrediente o dono la puoi recuperare? questa si apre con la missione in cui si cucina da sola.
        + Parola scartata: posso aiutarti a recuperare una parola che hai scartato durante il gioco, ma in cambio dovrai donarne un'altra: da qui parte la quest ad hoc.
        + Vuoi conoscere qualcosa di più su questo posto? Qualcosa che mentore e le altre entità non sanno? Possiamo ricevere info sulle varie aree, sull'albero, sulla camera. Cose serie.
        -
    -> closed_exchange


=== closed_exchange
Salutino della rana

     @animation:RewriterBook
-> closed_exchange