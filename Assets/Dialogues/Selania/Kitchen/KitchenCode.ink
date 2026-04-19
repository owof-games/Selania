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
    //O che vengano in cucina se c'è qualcunx
    VAR kitchen_kitchenOccupied = false

//Variabile per tracciare con chi stiamo cucinando
    VAR kitchen_actualChef = ()
    VAR kitchen_actualChefPronouns = ()

//Tracciamento della quantità di cucinate che ho fatto, utilizzato per la storia orizzontale
    VAR kitchen_allChefs = ()    
    
//Reazioni possibili al quarto ingrediente
    //Nota: notReaction = non dato
    LIST kitchen_extraIngredientPossibleReactions = notReaction, badReaction, mehReaction, goodReaction


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

    {charTag(TheWitch, witch_state())}:   <i>La cucina si riempie del profumo di <b>{kitchen_tempRecipeName}</b>.</i>
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



=== function extra_ingredient_name(Ingredient)
{Ingredient:

    - BaccaDellaAddolorata:
        ~ kitchen_recipePP = "e distillato del primo passo"

    - BarbaDellInciampo:
        ~ kitchen_recipePP = "ed essenza della responsabilità"

    - BastoneDellOzioso:
        ~ kitchen_recipePP = "e aroma di ozio"  

    - BrinaDellImpossibile:
        ~ kitchen_recipePP = "e traccie di ferita"  

    - CantoDelleCompagne:
        ~ kitchen_recipePP = "e profumo di rabbia"

    - CardoAspinato:
        ~ kitchen_recipePP = "e copertura di vulnerabilità"

    - EderaDelleAmanti:
        ~ kitchen_recipePP = "e glassa di piacere"

    - ErbaLiccia:
        ~ kitchen_recipePP = "e doratura di rinuncia" 

    - FalsaPalude:
        ~ kitchen_recipePP = "e ripieno di collaborazione"

    - LanaNotturna:
        ~ kitchen_recipePP = "e polvere di cambiamento"

    - LicheneDegliAbissi:
        ~ kitchen_recipePP = "e panatura di relazione tossica"

    - NonTiScordarDiTe:
        ~ kitchen_recipePP = "e crosticina dell'eredità"

    - Olobino:
        ~ kitchen_recipePP = "e marinatura spirituale"

    - LaSpazzata:
        ~ kitchen_recipePP = "e farcitura di comunicazione" 

    - universalIngredient:
        ~ kitchen_recipePP = "e gratinatura del bel ricordo"

    //Se non ho compiuto scelte
    - else:
        ~ kitchen_recipePP = "esitante"    
        

}


/* ---------------------------------

   Gestione colori durante la cucina e la riscrittura (reset e ripristino) 

 ----------------------------------*/


=== storage_glyphs(cookingCompanion)
{debug_kitchen or debug: storage_glyphs.}

    {
        - cookingCompanion == FirstCharacter:
            Visto che è un momento di pausa, facciamo come se non ci fossimo mai conosciut3, senza gioie né rancori passati. #speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
            Solo per ora ovviamente.

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
            Cominciamo. E farò finta di non sapere cosa penso di te, così è più facile per tutti e due. #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
            Non per sempre, solo adesso che cuciniamo.
                
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


=== update_glyphs(cookingCompanion)
{debug_kitchen or debug: update_glyphs.}
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

=== kitchen_moon_feedback ===

//Assegnazione parlante
{
    - are_two_entities_together(FirstCharacter,PG):
        ~ kitchen_actualChef = translator(firstChar_ActualName)
        ~ kitchen_actualChefPronouns = her

    - are_two_entities_together(SecondCharacter,PG):
        ~ kitchen_actualChef = translator(secondChar_ActualName)
        ~ kitchen_actualChefPronouns = him

    - are_two_entities_together(ThirdCharacter,PG):
        ~ kitchen_actualChef = translator(thirdChar_ActualName)
        ~ kitchen_actualChefPronouns = him

    - are_two_entities_together(Franco,PG):
        ~ kitchen_actualChef = Franco
        ~ kitchen_actualChefPronouns = him
}


{
//Il feedback per il primo ingrediente inserito da sole c'è alla prima volta che si cucina.
	- not first_time_ingredient:
		-> first_time_ingredient
//Poi posso sfruttare il tracciamento delle reazioni.
	- (kitchen_firstCharExtraIngredientReaction == goodReaction or kitchen_secondCharExtraIngredientReaction == goodReaction or kitchen_thirdCharExtraIngredientReaction == goodReaction) && not first_time_good_reaction:
		-> first_time_good_reaction
	
	- (kitchen_firstCharExtraIngredientReaction == mehReaction or kitchen_secondCharExtraIngredientReaction == mehReaction or kitchen_thirdCharExtraIngredientReaction == mehReaction)&& not first_time_meh_reaction:
		-> first_time_meh_reaction

	- (kitchen_firstCharExtraIngredientReaction == badReaction or kitchen_secondCharExtraIngredientReaction == badReaction or kitchen_thirdCharExtraIngredientReaction == badReaction) && not first_time_bad_reaction:
		-> first_time_bad_reaction

    - else:
        ->->    
}        

    = first_time_ingredient


            {charTag(TheWitch, witch_state())}:   <i>{player_name} prova a parlare, ma le parole rimangono bloccate in gola. Ma gli ingredienti possono parlare per {player_pronouns has him:lui|{player_pronouns has her:lei|ləi}}.</i>
        
        ->->

    = first_time_good_reaction
            {charTag(TheWitch, witch_state())}:   <i>{player_name} ha aggiunto un ingrediente adorato da {kitchen_actualChef}, e quindi riceverà un consiglio su come gestire le conversazioni con {kitchen_actualChefPronouns == him:lui|lei}.</i>
        
        ->->


    = first_time_meh_reaction


            {charTag(TheWitch, witch_state())}:   <i>{player_name} ha aggiunto un ingrediente abbastanza apprezzato da {kitchen_actualChef}, e quindi riceverà un consiglio fumoso su cosa fare parlando con {kitchen_actualChefPronouns == him:lui|lei}.</i>
        
        ->->

    = first_time_bad_reaction
            {charTag(TheWitch, witch_state())}:   <i>{player_name} ha aggiunto un ingrediente detestato da {kitchen_actualChef}, e quindi non riceverà alcun consiglio su come gestire le conversazioni con {kitchen_actualChefPronouns == him:lui|lei}.</i>
        
        
        ->->

