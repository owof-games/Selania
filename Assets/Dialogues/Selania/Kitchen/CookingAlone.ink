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

        Come ti sembra questo posto?
            + [Soffriggo dei cubetti di grano del rispetto.]
                ~ kitchen_recipeNoun = "Zuppa di grano"
     
               
            + [Impano delle striscioline di seitan malinconico.]
                ~ kitchen_recipeNoun = "Grigliata di seitan"

                
            + [Sgrano dei fagioli del conflitto.]
               ~ kitchen_recipeNoun = "Fagiolata"

        
            + [Sbollento delle cimette di broccolo della fiducia.]
                ~ kitchen_recipeNoun = "Cimetta di broccolo"

    
            + [Schiaccio degli spicchi di aglio del distacco.]
                ~ kitchen_recipeNoun = "Crema d'aglio"

            -    

        Cosa ne pensi del lavoro che stai facendo?
             + [Tosto del pepe dell'onestà.]
                ~ kitchen_recipeAdjective = "onesta"

               
            + [Spargo della curcuma divertente.]
                ~ kitchen_recipeAdjective = "allegra"

             
            + [Aggiungo del cumino empatico.]
               ~ kitchen_recipeAdjective = "empatica"

        
            + [Grattugio della cannella incondizionata.]
                ~ kitchen_recipeAdjective = "incondizionata"

    
            + [Sminuzzo dello zenzero leale.]
                ~ kitchen_recipeAdjective = "leale"
  
            -      
        Cosa pensi di {mentorName}?
            + [Verso una mestolata di brodo del terrore.]
                ~ kitchen_recipeComplement = "con brodo del terrore"
              
               
            + [Manteco della noce euforica.]
                ~ kitchen_recipeComplement = "con noce euforica"
   
            + [Condisco con semi dell'"io? no, no è possibile!".]
               ~ kitchen_recipeComplement = "con semi dell'<i>io? no, no è possibile!</i>"

        
            + [Incorporo una cucchiata di olio delle lusinghe.]
                ~ kitchen_recipeComplement = "con olio delle lusinghe"

    
            + [Sminuzzo una manciata di peperoncini arrapati.]
                ~ kitchen_recipeComplement = "con peperoncini arrapati"
             
            -
        E come stai in generale?
            + [Verso una mestolata di brodo del terrore.]
                ~ kitchen_recipePP = "esitante"
               
               
            + [Manteco della noce euforica.]
                ~ kitchen_recipePP = "esitante"
   
            + [Condisco con semi dell'"io? no, no è possibile!".]
               ~ kitchen_recipePP = "esitante"

        
            + [Incorporo una cucchiata di olio delle lusinghe.]
                ~ kitchen_recipePP = "esitante"

    
            + [Sminuzzo una manciata di peperoncini arrapati.]
                ~ kitchen_recipePP = "esitante"
             
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