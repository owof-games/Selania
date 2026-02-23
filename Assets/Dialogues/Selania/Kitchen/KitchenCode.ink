//Tracciamento nome ricette
    VAR kitchen_firstRecipe = ""
    VAR kitchen_secondRecipe = ""
    VAR kitchen_thirdRecipe = ""
    VAR kitchen_fourthRecipe = ""
    VAR kitchen_fifthRecipe = ""
    VAR kitchen_sixthRecipe = ""

//Tracciamento elementi che compongono il nome delle ricette
    VAR kitchen_recipeNoun = ""
    VAR kitchen_recipeAdjective = ""
    VAR kitchen_recipeComplement = ""
    //PP come Past Participle
    VAR kitchen_recipePP = ""
    VAR kitchen_tempRecipeName = ""

//Storage temporaneo dei colori
    VAR kitchen_storageAether = 0
    VAR kitchen_storageEarth = 0
    VAR kitchen_storageAir = 0
    VAR kitchen_storageWater = 0
    VAR kitchen_storageFire = 0

//Variabile per evitare che le personagge cucinino una di fila all'altra
    VAR kitchen_cookingAloneCoolDown = 0
    VAR kitchen_cookingAloneCoolDownMAX = 2
    
//Reazioni possibili al quarto ingrediente
    //Nota: notReaction = non dato
    LIST kitchen_extraIngredientPossibleReactions = notReaction, badReaction, mehReaction, goodReaction

=== check_kitchen_recap
    
    //Disabilitato per ora perché non c'è un recap sul libro
    // @animation:RewriterBook

    // {
    //     - BookPlace hasnt KitchenRecap:
        
    //         ~ move_entity(KitchenRecap, BookPlace)
    //             {
    //                 - kitchen == 1:
    //                 ~ saturationVar ++
    //                 ~ move_entity(kitchenOpened, Bedroom)
    //             }
    // }
        // {
    //     - contentsBedroom hasnt kitchenOpened:
        
    //         ~ move_entity(kitchenOpened, Bedroom)
    
    //                 ~ saturationVar ++
 
    // }

->->

=== cooking_animations_on
{debug_kitchen: passo per cooking_animations_on. Prima dell'intervento KitchenFire è in, {entity_location(KitchenFire)} mentre KitchenSmokeOneOne è in {entity_location(KitchenSmokeOne)}.}
    ~ move_entity(KitchenFire, Kitchen)
    ~ move_entity(KitchenSmokeOne, Kitchen)
    ~ move_entity(KitchenSmokeTwo, Kitchen)
    ~ move_entity(KitchenSmokeThree, Kitchen)
{debug_kitchen: Dopo l'intervento KitchenFire è in {entity_location(KitchenFire)}, mentre KitchenSmokeOne è in {entity_location(KitchenSmokeOne)}.}
->->


=== cooking_animations_off
{debug_kitchen: passo per cooking_animations_off. Prima dell'intervento KitchenFire è in, {entity_location(KitchenFire)} mentre KitchenSmokeOne è in {entity_location(KitchenSmokeOne)}.}
    ~ move_entity(KitchenFire, Safekeeping)
    ~ move_entity(KitchenSmokeOne, Safekeeping)
    ~ move_entity(KitchenSmokeTwo, Safekeeping)
    ~ move_entity(KitchenSmokeThree, Safekeeping)
    
{debug_kitchen: Dopo l'intervento KitchenFire è in {entity_location(KitchenFire)}, mentre KitchenSmokeOne è in {entity_location(KitchenSmokeOne)}.}    

->->



=== recipe_name_creator ===
{debug_kitchen: passo per recipeNameCreator.}

~  kitchen_tempRecipeName = "{kitchen_recipeNoun} {kitchen_recipeAdjective} {kitchen_recipeComplement} {kitchen_recipePP}"

    <i>La cucina si riempie del profumo di <b>{kitchen_tempRecipeName}</b>. #speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        ->->

//Lo chiamo da recipeNameCreator, non mi serve chiamarlo altrove
=== recipe_name_storage(Character)
{debug_kitchen: passo per recipe_name_storage.}
    {Character:
        - FirstCharacter:
            ~ kitchen_firstCharRecipe = kitchen_tempRecipeName
        
        - SecondCharacter:
            ~ kitchen_secondCharRecipe = kitchen_tempRecipeName
        
        - ThirdCharacter:
            ~ kitchen_thirdCharRecipe = kitchen_tempRecipeName
        
        - FourthCharacter:
            ~ kitchen_fourthCharRecipe = kitchen_tempRecipeName

        - FifthCharacter:
            ~ kitchen_fifthCharRecipe = kitchen_tempRecipeName

        - PG:
            ~ kitchen_PGCharRecipe = kitchen_tempRecipeName     
                
    }


    {
        - kitchen_firstRecipe == "":
            {debug_kitchen: il valore di kitchen_firstRecipe è {kitchen_firstRecipe} e quindi lo aggiorno.}
            
                ~ kitchen_firstRecipe = kitchen_tempRecipeName
            {debug_kitchen: il valore di kitchen_firstRecipe ora è {kitchen_firstRecipe}.}

                ->->
        - kitchen_secondRecipe == "":
            {debug_kitchen: il valore di kitchen_firstRecipe è {kitchen_firstRecipe} e quindi non lo aggiorno.}
            {debug_kitchen: il valore di kitchen_secondRecipe è {kitchen_secondRecipe} e quindi lo aggiorno.}
            
                ~ kitchen_secondRecipe = kitchen_tempRecipeName
            {debug_kitchen: il valore di kitchen_secondRecipe ora è {kitchen_secondRecipe}.}
            
                ->->
        
        - kitchen_thirdRecipe == "":
            {debug_kitchen: il valore di kitchen_firstRecipe è {kitchen_firstRecipe} e quindi non lo aggiorno.}
            {debug_kitchen: il valore di kitchen_secondRecipe è {kitchen_secondRecipe} e quindi non lo aggiorno.}
            {debug_kitchen: il valore di kitchen_thirdRecipe è {kitchen_thirdRecipe} è quindi non lo aggiorno.}
            
                ~ kitchen_thirdRecipe = kitchen_tempRecipeName
            {debug_kitchen: il valore di kitchen_thirdRecipe ora è {kitchen_thirdRecipe}.}
            
                ->-> 
        
        - kitchen_fourthRecipe == "":
            ~ kitchen_fourthRecipe = kitchen_tempRecipeName
                ->-> 
        
        - kitchen_fifthRecipe == "":
            ~ kitchen_fifthRecipe = kitchen_tempRecipeName 
                ->-> 
        
        - kitchen_sixthRecipe == "":
            ~ kitchen_sixthRecipe = kitchen_tempRecipeName
                ->-> 
        
        - else:
            {debug_kitchen:ERROR: non ci sono ricette a disposizione per salvare l'informazione.}
                ->->
    
    }

->->    


=== extra_ingredient_management(PNG)
{debug_kitchen: passo per extra_ingredient_management.}
//Qui gestiremo la parte di ingredienti che possiamo aggiungere, coi relativi effetti
    ~ enableNestDialogue()
    
    {debug_kitchen: I doni trovati sono {backpack_findedGifts}.}
    Aggiungo...
    
/* ---------------------------------

            Coltivabili

 ----------------------------------*/
 //badReaction, mehReaction, goodReaction
        //Se la lista è vuota
    + {backpack_findedGifts == ()} [<i>Non ho nulla da aggiungere.]
    
    + [<i>Ho cambiato idea.]
        ~ kitchen_recipePP = "esitante"
        
    + {backpack_findedGifts has BaccaDellaAddolorata} [<i>Una bacca della Addolorata.]
        ~ backpack_findedGifts -= BaccaDellaAddolorata
        ~ kitchen_recipePP = "e distillato del primo passo"
         {
        - frog_recoveredCultivables hasnt BaccaDellaAddolorata:
        ~ frog_recoverableCultivables += BaccaDellaAddolorata
        } 
            {
                - PNG == FirstCharacter:
                    -> object_value_for_PNG(BaccaDellaAddolorata, Kitchen, FirstCharacter) ->

                    {debug_kitchen: Ho modificato il valore di kitchen_firstCharExtraIngredientReaction in {kitchen_firstCharExtraIngredientReaction}.}
                    {debug_kitchen: Ho modificato il valore di kitchen_firstCharExtraIngredient in {kitchen_firstCharExtraIngredient}.}
                    
                - PNG == SecondCharacter:
                    -> object_value_for_PNG(BaccaDellaAddolorata, Kitchen, SecondCharacter) ->
                    {debug_kitchen: Ho modificato il valore di kitchen_secondCharExtraIngredientReaction in {kitchen_secondCharExtraIngredientReaction}.}
                    {debug_kitchen: Ho modificato il valore di kitchen_secondCharExtraIngredient in {kitchen_secondCharExtraIngredient}.}
            }
    
    + {backpack_findedGifts has BarbaDellInciampo} <i>[Una spina di Barba dell'Inciampo.]
        ~ backpack_findedGifts -= BarbaDellInciampo
        ~ kitchen_recipePP = "ed essenza della responsabilità"
         {
        - frog_recoveredCultivables hasnt BarbaDellInciampo:
        ~ frog_recoverableCultivables += BarbaDellInciampo
    } 
            {
                - PNG == FirstCharacter:
                    -> object_value_for_PNG(BarbaDellInciampo, Kitchen, FirstCharacter) ->

                    {debug_kitchen: Ho modificato il valore di kitchen_firstCharExtraIngredientReaction in {kitchen_firstCharExtraIngredientReaction}.}
                    {debug_kitchen: Ho modificato il valore di kitchen_firstCharExtraIngredient in {kitchen_firstCharExtraIngredient}.}
                    
                - PNG == SecondCharacter:
                    -> object_value_for_PNG(BarbaDellInciampo, Kitchen, SecondCharacter) ->
                    {debug_kitchen: Ho modificato il valore di kitchen_secondCharExtraIngredientReaction in {kitchen_secondCharExtraIngredientReaction}.}
                    {debug_kitchen: Ho modificato il valore di kitchen_secondCharExtraIngredient in {kitchen_secondCharExtraIngredient}.}
            }
            
    + {backpack_findedGifts has BastoneDellOzioso} [<i>Un nodo di Bastone dell'Ozioso.]
        ~ backpack_findedGifts -= BastoneDellOzioso
         {
        - frog_recoveredCultivables hasnt BastoneDellOzioso:
        ~ frog_recoverableCultivables += BastoneDellOzioso
        } 
        ~ kitchen_recipePP = "e aroma di ozio"
            {
                - PNG == FirstCharacter:
                    -> object_value_for_PNG(BastoneDellOzioso, Kitchen, FirstCharacter) ->

                    {debug_kitchen: Ho modificato il valore di kitchen_firstCharExtraIngredientReaction in {kitchen_firstCharExtraIngredientReaction}.}
                    {debug_kitchen: Ho modificato il valore di kitchen_firstCharExtraIngredient in {kitchen_firstCharExtraIngredient}.}
                    
                - PNG == SecondCharacter:
                    -> object_value_for_PNG(BastoneDellOzioso, Kitchen, SecondCharacter) ->
                    {debug_kitchen: Ho modificato il valore di kitchen_secondCharExtraIngredientReaction in {kitchen_secondCharExtraIngredientReaction}.}
                    {debug_kitchen: Ho modificato il valore di kitchen_secondCharExtraIngredient in {kitchen_secondCharExtraIngredient}.}
            }
        
    + {backpack_findedGifts has BrinaDellImpossibile} [<i>Un frammento di Brina dell'Impossibile.]
        ~ backpack_findedGifts -= BrinaDellImpossibile
         {
        - frog_recoveredCultivables hasnt BrinaDellImpossibile:
        ~ frog_recoverableCultivables += BrinaDellImpossibile
    } 
        ~ kitchen_recipePP = "e aroma di trauma"
            {
                - PNG == FirstCharacter:
                    -> object_value_for_PNG(BrinaDellImpossibile, Kitchen, FirstCharacter) ->

                    {debug_kitchen: Ho modificato il valore di kitchen_firstCharExtraIngredientReaction in {kitchen_firstCharExtraIngredientReaction}.}
                    {debug_kitchen: Ho modificato il valore di kitchen_firstCharExtraIngredient in {kitchen_firstCharExtraIngredient}.}
                    
                - PNG == SecondCharacter:
                    -> object_value_for_PNG(BrinaDellImpossibile, Kitchen, SecondCharacter) ->

                    {debug_kitchen: Ho modificato il valore di kitchen_secondCharExtraIngredientReaction in {kitchen_secondCharExtraIngredientReaction}.}
                    {debug_kitchen: Ho modificato il valore di kitchen_secondCharExtraIngredient in {kitchen_secondCharExtraIngredient}.}
            }        
    
    + {backpack_findedGifts has CantoDelleCompagne} [<i>Una goccia di Canto delle Compagne.]
        ~ backpack_findedGifts -= CantoDelleCompagne
         {
        - frog_recoveredCultivables hasnt CantoDelleCompagne:
        ~ frog_recoverableCultivables += CantoDelleCompagne
    } 
        ~ kitchen_recipePP = "e profumo di rabbia"
            {
                - PNG == FirstCharacter:
                    -> object_value_for_PNG(CantoDelleCompagne, Kitchen, FirstCharacter) ->
                    {debug_kitchen: Ho modificato il valore di kitchen_firstCharExtraIngredientReaction in {kitchen_firstCharExtraIngredientReaction}.}
                    {debug_kitchen: Ho modificato il valore di kitchen_firstCharExtraIngredient in {kitchen_firstCharExtraIngredient}.}
                    
                - PNG == SecondCharacter:
                    -> object_value_for_PNG(CantoDelleCompagne, Kitchen, SecondCharacter) ->
                    {debug_kitchen: Ho modificato il valore di kitchen_secondCharExtraIngredientReaction in {kitchen_secondCharExtraIngredientReaction}.}
                    {debug_kitchen: Ho modificato il valore di kitchen_secondCharExtraIngredient in {kitchen_secondCharExtraIngredient}.}
            }        
    
    + {backpack_findedGifts has CardoAspinato} [<i>Un ciuffo di peli di Cardo Aspinato.]
        ~ backpack_findedGifts -= CardoAspinato
         {
        - frog_recoveredCultivables hasnt CardoAspinato:
        ~ frog_recoverableCultivables += CardoAspinato
    } 
        ~ kitchen_recipePP = "e copertura di vulnerabilità"
            {
                - PNG == FirstCharacter:
                    -> object_value_for_PNG(CardoAspinato, Kitchen, FirstCharacter) ->
                    {debug_kitchen: Ho modificato il valore di kitchen_firstCharExtraIngredientReaction in {kitchen_firstCharExtraIngredientReaction}.}
                    {debug_kitchen: Ho modificato il valore di kitchen_firstCharExtraIngredient in {kitchen_firstCharExtraIngredient}.}
                    
                - PNG == SecondCharacter:
                    -> object_value_for_PNG(CardoAspinato, Kitchen, SecondCharacter) ->
                    {debug_kitchen: Ho modificato il valore di kitchen_secondCharExtraIngredientReaction in {kitchen_secondCharExtraIngredientReaction}.}
                    {debug_kitchen: Ho modificato il valore di kitchen_secondCharExtraIngredient in {kitchen_secondCharExtraIngredient}.}
            }        
            
    + {backpack_findedGifts has EderaDelleAmanti} [<i>Una foglia di Edera delle amanti.]
        ~ backpack_findedGifts -= EderaDelleAmanti
        {
        - frog_recoveredCultivables hasnt EderaDelleAmanti:
        ~ frog_recoverableCultivables += EderaDelleAmanti
    } 
        ~ kitchen_recipePP = "e glassa di piacere"
            {
                - PNG == FirstCharacter:
                    -> object_value_for_PNG(EderaDelleAmanti, Kitchen, FirstCharacter) ->
                    {debug_kitchen: Ho modificato il valore di kitchen_firstCharExtraIngredientReaction in {kitchen_firstCharExtraIngredientReaction}.}
                    {debug_kitchen: Ho modificato il valore di kitchen_firstCharExtraIngredient in {kitchen_firstCharExtraIngredient}.}
                    
                - PNG == SecondCharacter:
                    -> object_value_for_PNG(EderaDelleAmanti, Kitchen, SecondCharacter) ->
                    {debug_kitchen: Ho modificato il valore di kitchen_secondCharExtraIngredientReaction in {kitchen_secondCharExtraIngredientReaction}.}
                    {debug_kitchen: Ho modificato il valore di kitchen_secondCharExtraIngredient in {kitchen_secondCharExtraIngredient}.}
            }        

    + {backpack_findedGifts has ErbaLiccia} [<i>Un ricordo di Erba Liccia.]
        ~ backpack_findedGifts -= ErbaLiccia
         {
        - frog_recoveredCultivables hasnt ErbaLiccia:
        ~ frog_recoverableCultivables += ErbaLiccia
    } 
        ~ kitchen_recipePP = "e doratura di rinuncia"
            {
                - PNG == FirstCharacter:
                    -> object_value_for_PNG(ErbaLiccia, Kitchen, FirstCharacter) ->
                    {debug_kitchen: Ho modificato il valore di kitchen_firstCharExtraIngredientReaction in {kitchen_firstCharExtraIngredientReaction}.}
                    {debug_kitchen: Ho modificato il valore di kitchen_firstCharExtraIngredient in {kitchen_firstCharExtraIngredient}.}
                    
                - PNG == SecondCharacter:
                   -> object_value_for_PNG(ErbaLiccia, Kitchen, SecondCharacter) ->
                    {debug_kitchen: Ho modificato il valore di kitchen_secondCharExtraIngredientReaction in {kitchen_secondCharExtraIngredientReaction}.}
                    {debug_kitchen: Ho modificato il valore di kitchen_secondCharExtraIngredient in {kitchen_secondCharExtraIngredient}.}
            }        
        
     + {backpack_findedGifts has FalsaPalude} [<i>Un petalo di Falsa Palude.]
        ~ backpack_findedGifts -= FalsaPalude
         {
        - frog_recoveredCultivables hasnt FalsaPalude:
        ~ frog_recoverableCultivables += FalsaPalude
    } 
        ~ kitchen_recipePP = "e ripieno di collaborazione"
            {
                - PNG == FirstCharacter:
                    -> object_value_for_PNG(FalsaPalude, Kitchen, FirstCharacter) ->
                    {debug_kitchen: Ho modificato il valore di kitchen_firstCharExtraIngredientReaction in {kitchen_firstCharExtraIngredientReaction}.}
                    {debug_kitchen: Ho modificato il valore di kitchen_firstCharExtraIngredient in {kitchen_firstCharExtraIngredient}.}
                    
                - PNG == SecondCharacter:
                    -> object_value_for_PNG(FalsaPalude, Kitchen, SecondCharacter) ->
                    {debug_kitchen: Ho modificato il valore di kitchen_secondCharExtraIngredientReaction in {kitchen_secondCharExtraIngredientReaction}.}
                    {debug_kitchen: Ho modificato il valore di kitchen_secondCharExtraIngredient in {kitchen_secondCharExtraIngredient}.}
            }        
        
      + {backpack_findedGifts has LanaNotturna} [<i>Il calore della Lana Notturna.]
        ~ backpack_findedGifts -= LanaNotturna
         {
        - frog_recoveredCultivables hasnt LanaNotturna:
        ~ frog_recoverableCultivables += LanaNotturna
    } 
        ~ kitchen_recipePP = "e polvere di cambiamento"
            {
                - PNG == FirstCharacter:
                    -> object_value_for_PNG(LanaNotturna, Kitchen, FirstCharacter) ->
                    {debug_kitchen: Ho modificato il valore di kitchen_firstCharExtraIngredientReaction in {kitchen_firstCharExtraIngredientReaction}.}
                    {debug_kitchen: Ho modificato il valore di kitchen_firstCharExtraIngredient in {kitchen_firstCharExtraIngredient}.}
                    
                - PNG == SecondCharacter:
                    -> object_value_for_PNG(LicheneDegliAbissi, Kitchen, SecondCharacter) ->
                    {debug_kitchen: Ho modificato il valore di kitchen_secondCharExtraIngredientReaction in {kitchen_secondCharExtraIngredientReaction}.}
                    {debug_kitchen: Ho modificato il valore di kitchen_secondCharExtraIngredient in {kitchen_secondCharExtraIngredient}.}
            }        
        
    + {backpack_findedGifts has LicheneDegliAbissi} [<i>Una traccia dell'odore del Lichene degli Abissi.]
        ~ backpack_findedGifts -= LicheneDegliAbissi
         {
        - frog_recoveredCultivables hasnt LicheneDegliAbissi:
        ~ frog_recoverableCultivables += LicheneDegliAbissi
    } 
        ~ kitchen_recipePP = "e panatura di relazione tossica"
            {
                - PNG == FirstCharacter:
                    -> object_value_for_PNG(LicheneDegliAbissi, Kitchen, FirstCharacter) ->
                    {debug_kitchen: Ho modificato il valore di kitchen_firstCharExtraIngredientReaction in {kitchen_firstCharExtraIngredientReaction}.}
                    {debug_kitchen: Ho modificato il valore di kitchen_firstCharExtraIngredient in {kitchen_firstCharExtraIngredient}.}
                    
                - PNG == SecondCharacter:
                    -> object_value_for_PNG(LicheneDegliAbissi, Kitchen, SecondCharacter) ->
                    {debug_kitchen: Ho modificato il valore di kitchen_secondCharExtraIngredientReaction in {kitchen_secondCharExtraIngredientReaction}.}
                    {debug_kitchen: Ho modificato il valore di kitchen_secondCharExtraIngredient in {kitchen_secondCharExtraIngredient}.}
            }        
    
    + {backpack_findedGifts has NonTiScordarDiTe} [<i>L'impronta del Non Ti Scordar di Te.]
        ~ backpack_findedGifts -= NonTiScordarDiTe
         {
        - frog_recoveredCultivables hasnt NonTiScordarDiTe:
        ~ frog_recoverableCultivables += NonTiScordarDiTe
    } 
        ~ kitchen_recipePP = "e crosticina dell'eredità"
            {
                - PNG == FirstCharacter:
                    -> object_value_for_PNG(NonTiScordarDiTe, Kitchen, FirstCharacter) ->
                    {debug_kitchen: Ho modificato il valore di kitchen_firstCharExtraIngredientReaction in {kitchen_firstCharExtraIngredientReaction}.}
                    {debug_kitchen: Ho modificato il valore di kitchen_firstCharExtraIngredient in {kitchen_firstCharExtraIngredient}.}
                    
                - PNG == SecondCharacter:
                    -> object_value_for_PNG(NonTiScordarDiTe, Kitchen, SecondCharacter) ->
                    {debug_kitchen: Ho modificato il valore di kitchen_secondCharExtraIngredientReaction in {kitchen_secondCharExtraIngredientReaction}.}
                    {debug_kitchen: Ho modificato il valore di kitchen_secondCharExtraIngredient in {kitchen_secondCharExtraIngredient}.}
            }        
    
    + {backpack_findedGifts has Olobino} [<i>Una cappello di Olobino.]
        ~ backpack_findedGifts -= Olobino
         {
        - frog_recoveredCultivables hasnt Olobino:
        ~ frog_recoverableCultivables += Olobino
    } 
        ~ kitchen_recipePP = "e marinatura spirituale"
            {
                - PNG == FirstCharacter:
                    -> object_value_for_PNG(Olobino, Kitchen, FirstCharacter) ->
                    {debug_kitchen: Ho modificato il valore di kitchen_firstCharExtraIngredientReaction in {kitchen_firstCharExtraIngredientReaction}.}
                    {debug_kitchen: Ho modificato il valore di kitchen_firstCharExtraIngredient in {kitchen_firstCharExtraIngredient}.}
                    
                - PNG == SecondCharacter:
                    -> object_value_for_PNG(Olobino, Kitchen, SecondCharacter) ->
                    {debug_kitchen: Ho modificato il valore di kitchen_secondCharExtraIngredientReaction in {kitchen_secondCharExtraIngredientReaction}.}
                    {debug_kitchen: Ho modificato il valore di kitchen_secondCharExtraIngredient in {kitchen_secondCharExtraIngredient}.}
            }        
        
    + {backpack_findedGifts has LaSpazzata} [<i>Un rametto della Spezzata.]
        ~ backpack_findedGifts -= LaSpazzata
         {
            - frog_recoveredCultivables hasnt LaSpazzata:
                ~ frog_recoverableCultivables += LaSpazzata
        } 
        ~ kitchen_recipePP = "e farcitura di comunicazione"
            {
                - PNG == FirstCharacter:
                    -> object_value_for_PNG(LaSpazzata, Kitchen, FirstCharacter) ->
                    {debug_kitchen: Ho modificato il valore di kitchen_firstCharExtraIngredientReaction in {kitchen_firstCharExtraIngredientReaction}.}
                    {debug_kitchen: Ho modificato il valore di kitchen_firstCharExtraIngredient in {kitchen_firstCharExtraIngredient}.}
                    
                - PNG == SecondCharacter:
                    -> object_value_for_PNG(LaSpazzata, Kitchen, SecondCharacter) ->
                    {debug_kitchen: Ho modificato il valore di kitchen_secondCharExtraIngredientReaction in {kitchen_secondCharExtraIngredientReaction}.}
                    {debug_kitchen: Ho modificato il valore di kitchen_secondCharExtraIngredient in {kitchen_secondCharExtraIngredient}.}
            }        
//Doni insoliti
    + {backpack_findedGifts has universalIngredient} [<i>L'ingrediente universale della Rana.]
        ~ backpack_findedGifts -= universalIngredient
        ~ kitchen_recipePP = "e gratinatura goduriosa"
        
            {
                - PNG == FirstCharacter:
                    -> object_value_for_PNG(universalIngredient, Kitchen, FirstCharacter) ->

                    {debug_kitchen: Ho modificato il valore di kitchen_firstCharExtraIngredientReaction in {kitchen_firstCharExtraIngredientReaction}.}
                    {debug_kitchen: Ho modificato il valore di kitchen_firstCharExtraIngredient in {kitchen_firstCharExtraIngredient}.}
                    
                - PNG == SecondCharacter:
                   -> object_value_for_PNG(universalIngredient, Kitchen, SecondCharacter) ->

                    {debug_kitchen: Ho modificato il valore di kitchen_secondCharExtraIngredientReaction in {kitchen_secondCharExtraIngredientReaction}.}
                    {debug_kitchen: Ho modificato il valore di kitchen_secondCharExtraIngredient in {kitchen_secondCharExtraIngredient}.}
            }
    
    -
        ~ disableNestDialogue()    
        ->->




/* ---------------------------------

   Gestione colori durante la cucina e la riscrittura (reset e ripristino) 

 ----------------------------------*/


=== storage_colors(cookingCompanion)
{debug_kitchen or debug: storage_colors.}

    {
        - cookingCompanion == FirstCharacter:
            ~ kitchen_storageAether = firstChar_aether
                ~ firstChar_aether = 0
            ~ kitchen_storageEarth = firstChar_earth
                ~ firstChar_earth = 0
            ~ kitchen_storageAir = firstChar_air
                ~ firstChar_air = 0
            ~ kitchen_storageWater = firstChar_water
                ~ firstChar_water = 0
            ~ kitchen_storageFire = firstChar_fire
                ~ firstChar_fire= 0
    
        - cookingCompanion == SecondCharacter:
            ~ kitchen_storageAether = secondChar_aether
                ~ secondChar_aether = 0
            ~ kitchen_storageEarth = secondChar_earth
                ~ secondChar_earth = 0
            ~ kitchen_storageAir = secondChar_air
                ~ secondChar_air = 0
            ~ kitchen_storageWater = secondChar_water
                ~ secondChar_water = 0
            ~ kitchen_storageFire = secondChar_fire
                ~ secondChar_fire = 0
    }
->->


=== update_colors(cookingCompanion)
{debug_kitchen or debug: update_colors.}
{debug_kitchen: prima di aggiornare i valori, il valore di kitchen_storageAether è {kitchen_storageAether}, di kitchen_storageEarth {kitchen_storageEarth}, kitchen_storageAir è {kitchen_storageAir}, di kitchen_storageWater {kitchen_storageWater}, di kitchen_storageFire {kitchen_storageFire}. cookingCompanion è {cookingCompanion}.}
    {
        - cookingCompanion == FirstCharacter:
            ~ firstChar_aether = firstChar_aether + kitchen_storageAether
                ~ kitchen_storageAether = 0
            ~ firstChar_earth = firstChar_earth + kitchen_storageEarth
                ~ kitchen_storageEarth = 0
            ~ firstChar_air = firstChar_air + kitchen_storageAir
                ~ kitchen_storageAir = 0
            ~ firstChar_water = firstChar_water + kitchen_storageWater
                ~ kitchen_storageWater = 0
            ~ firstChar_fire= firstChar_fire+ kitchen_storageFire
                ~ kitchen_storageFire = 0
    
    - cookingCompanion == SecondCharacter:
            ~ secondChar_aether = secondChar_aether + kitchen_storageAether
                ~ kitchen_storageAether = 0
            ~ secondChar_earth = secondChar_earth + kitchen_storageEarth
                ~ kitchen_storageEarth = 0
            ~ secondChar_air = secondChar_air + kitchen_storageAir
                ~ kitchen_storageAir = 0
            ~ secondChar_water = secondChar_water + kitchen_storageWater
                ~ kitchen_storageWater = 0
            ~ secondChar_fire = secondChar_fire + kitchen_storageFire
                ~ kitchen_storageFire = 0
 
    
    }
    
//Ne approfitto per svuotare i nomi
//Svuoto i nomi
    ~ kitchen_recipeNoun = ""
    ~ kitchen_recipeAdjective = ""
    ~ kitchen_recipeComplement = ""
    ~ kitchen_recipePP = ""
    ~ kitchen_tempRecipeName = ""


{debug_kitchen: dopo aver aggiornato i valori, il valore di kitchen_storageAether è {kitchen_storageAether}, di kitchen_storageEarth {kitchen_storageEarth}, kitchen_storageAir è {kitchen_storageAir}, di kitchen_storageWater {kitchen_storageWater}, di kitchen_storageFire {kitchen_storageFire}. cookingCompanion è {cookingCompanion}.} 
->->

