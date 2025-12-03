=== cooking_alone ====

    Quindi {player_name}, sei {player_pronouns has him:pronto|{player_pronouns has her:pronta|prontə}} per questa piccola missione di cucina?#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_kitchen
        
        + [Ci sto!]
            -> cooking_with_frog
    
        
        + [Ci penso un attimo.]
            -> main






=== cooking_with_frog
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    ~ temp piatto = kitchen_tempRecipeName

        -> cooking_animations_on ->

    Ci viene detto che dobbiamo preparare qualcosa per i pesci della palude, per ringraziarli per lo spazio che ci hanno offerto.
    E perché non raccontarmi un poco come sta andando questa tua esperienza?

        Come ti stai approcciando a questo posto?
            + [Setaccio della polenta analitica.]
                ~ kitchen_recipeNoun = "Polenta"
     
               
            + [Riscaldo l'acqua per della zuppetta empatica.]
                ~ kitchen_recipeNoun = "Zuppetta"

                
            + [Impasto una focaccia decisa.]
               ~ kitchen_recipeNoun = "Focaccia"

        
            + [Preparo una panzanella caotica.]
                ~ kitchen_recipeNoun = "Panzanella"

    
            + [Friggo della spirituale cicerchiata.]
                ~ kitchen_recipeNoun = "Cicerchiata"

            -    

        E sei {player_pronouns has him:soddisfatto|{player_pronouns has her:soddisfatta|soddisfattə}} del lavoro che stai facendo?
            
            + [Aggiungo con decisione della assafetida.]
                ~ kitchen_recipeAdjective = "decisa"

               
            + [Spargo con insicurezza del sommacco.]
                ~ kitchen_recipeAdjective = "insicura"

             
            + [Spolvero con disperazione della curcuma.]
               ~ kitchen_recipeAdjective = "disperata"

        
            + [Incorporo con arroganza del cajun.]
                ~ kitchen_recipeAdjective = "arrogante"

    
            + [Macino con mediocrità del pepe rosa.]
                ~ kitchen_recipeAdjective = "mediocre"
  
            -      
        E cosa ne pensi di {mentorName}?
            //Decoro
            + [Decoro con della granella di affetto.]
                ~ kitchen_recipeComplement = "con granella di affetto"
              
            + [Abbellisco con delle gocce di cioccolato e sospetto.]
                ~ kitchen_recipeComplement = "con gocce di cioccolato e sospetto"
   
            + [Guarnisco con un battuto di caramello e indifferenza.]
               ~ kitchen_recipeComplement = "con battuto di caramello e indifferenza"

            + [Addobbo con strisce di pastella e gratitudine.]
                ~ kitchen_recipeComplement = "con strisce di pastella e gratitudine"

            + [Rifinisco con semi di zucca e fastidio.]
                ~ kitchen_recipeComplement = "con semi di zucca e fastidio"
             
            -
        E come stai in generale?
        
            + [Mi verso un bicchiere di succo gioioso.]
                ~ kitchen_recipePP = "e contorno di gioia"
               
            + [Mi preparo una tazza di tisana rilassata.]
                ~ kitchen_recipePP = "e contorno di rilassatezza"
   
            + [Mi riempio una tazzina di caffè frenetico.]
               ~ kitchen_recipePP = "e contorno di frenesia"

            + [Mi offro un goccio dil distillato di curiosità.]
                ~ kitchen_recipePP = "e contorno di curiosità"
    
            + [Prendo un bicchiere di acqua annoiata.]
                ~ kitchen_recipePP = "e contorno di noia"
             
            -
        Bene, direi che il nostro piatto è pronto!
            -> recipe_name_creator ->
            -> recipe_name_storage(PG) ->
        Pesciolini: abbiamo un  {piatto}.
        Ed è tutto per voi.
        Credo proprio che apprezzeranno.
        Ma a dirla tutta: sono delle fogne, mangerebbero qualsiasi cosa.
        Grazie per la chiacchierata {player_name}.
        E tieni questo per il disturbo.
        è un ingrediente universale.
        Qualcosa che piacerà a tutte le personagge.
        Mettilo come quarto ingrediente, e la persona sarà presa benissimo.
        E ti dirà qualcosa di importante su di sé.
        E sì: ne ho solo uno, per cui usalo con sale in zucca.

        @animation:Backpack
                    
        ~ backpack_findedGifts += universalIngredient
        ~ frog_currentMission = ()
        ~ frog_aboutGiftRequest = ()
        //Metto in pausa le missioni speciali
        ~ frog_pauseSpecialMission = frog_pauseSpecialMissionMax
        //Rimetto a posto i vari assets
        ~ move_entity(TheKitchenFrog, Safekeeping)
        ~ move_entity(TheFrog, Kitchen)

-> cooking_animations_off ->
-> main