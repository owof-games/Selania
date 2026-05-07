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
    //e del valore della relazione
    VAR kitchen_storageRelationshipIndicatore = 0

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


=== function cooking_animations_on()
{debug_kitchen: passo per cooking_animations_on. Prima dell'intervento KitchenFire è in, {entity_location(KitchenFire)}.}
    ~ move_entity(KitchenFire, Kitchen)

{debug_kitchen: Dopo l'intervento KitchenFire è in {entity_location(KitchenFire)}.}



=== function cooking_animations_off()
{debug_kitchen: passo per cooking_animations_off. Prima dell'intervento KitchenFire è in, {entity_location(KitchenFire)}.}
    ~ move_entity(KitchenFire, Safekeeping)
 
{debug_kitchen: Dopo l'intervento KitchenFire è in {entity_location(KitchenFire)}.}    





=== function recipe_name_creator()
{debug_kitchen: passo per recipeNameCreator.}

~  kitchen_tempRecipeName = "{kitchen_recipeNoun} della {kitchen_recipeAdjective} con {kitchen_recipeComplement} {kitchen_recipePP}"

    {charTag(TheWitch, witch_state())}:   <i>La cucina si riempie del profumo di <b>{kitchen_tempRecipeName}</b>.</i>
  
//Lo chiamo da recipeNameCreator, non mi serve chiamarlo altrove
=== function recipe_name_storage(Character)
{debug_kitchen: passo per recipe_name_storage.}
    {Character:
        - FirstCharacter:
            ~ kitchen_firstCharRecipe = kitchen_tempRecipeName
            ~ kitchen_firstCharRecipeNoun = kitchen_recipeNoun
            ~ kitchen_firstCharRecipeAdjective = kitchen_recipeAdjective
            ~ kitchen_firstCharRecipeComplement = kitchen_recipeComplement
        
        - SecondCharacter:
            ~ kitchen_secondCharRecipe = kitchen_tempRecipeName
            ~ kitchen_secondCharRecipeNoun = kitchen_recipeNoun
            ~ kitchen_secondCharRecipeAdjective = kitchen_recipeAdjective
            ~ kitchen_secondCharRecipeComplement = kitchen_recipeComplement
        
        - ThirdCharacter:
            ~ kitchen_thirdCharRecipe = kitchen_tempRecipeName
            ~ kitchen_thirdCharRecipeNoun = kitchen_recipeNoun
            ~ kitchen_thirdCharRecipeAdjective = kitchen_recipeAdjective
            ~ kitchen_thirdCharRecipeComplement = kitchen_recipeComplement
        
        - FourthCharacter:
            ~ kitchen_fourthCharRecipe = kitchen_tempRecipeName
            ~ kitchen_fourthCharRecipeNoun = kitchen_recipeNoun
            ~ kitchen_fourthCharRecipeAdjective = kitchen_recipeAdjective
            ~ kitchen_fourthCharRecipeComplement = kitchen_recipeComplement

        - FifthCharacter:
            ~ kitchen_fifthCharRecipe = kitchen_tempRecipeName
            ~ kitchen_fifthCharRecipeNoun = kitchen_recipeNoun
            ~ kitchen_fifthCharRecipeAdjective = kitchen_recipeAdjective
            ~ kitchen_fifthCharRecipeComplement = kitchen_recipeComplement

        - PG:
            ~ kitchen_PGRecipe = kitchen_tempRecipeName
            ~ kitchen_PGRecipeNoun = kitchen_recipeNoun
            ~ kitchen_PGRecipeAdjective = kitchen_recipeAdjective
            ~ kitchen_PGRecipeComplement = kitchen_recipeComplement 
                
    }


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

   Gestione glifi durante la cucina e la riscrittura (reset e ripristino) 

 ----------------------------------*/


=== function storage_glyphs(cookingCompanion)
{debug_kitchen or debug: storage_glyphs.}

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
                ~ kitchen_storageRelationshipIndicatore = firstChar_relationshipIndicator
                    ~ firstChar_relationshipIndicator = 0
    
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
                ~ kitchen_storageRelationshipIndicatore = secondChar_relationshipIndicator
                    ~ secondChar_relationshipIndicator = 0    
        
        - cookingCompanion == ThirdCharacter:
                
                ~ kitchen_storageAether = thirdChar_aether
                    ~ thirdChar_aether = 0
                ~ kitchen_storageEarth = thirdChar_earth
                    ~ thirdChar_earth = 0
                ~ kitchen_storageAir = thirdChar_air
                    ~ thirdChar_air = 0
                ~ kitchen_storageWater = thirdChar_water
                    ~ thirdChar_water = 0
                ~ kitchen_storageFire = thirdChar_fire
                    ~ thirdChar_fire = 0
                ~ kitchen_storageRelationshipIndicatore = thirdChar_relationshipIndicator
                    ~ thirdChar_relationshipIndicator = 0 

        - cookingCompanion == FourthCharacter:
                
                ~ kitchen_storageAether = fourthChar_aether
                    ~ fourthChar_aether = 0
                ~ kitchen_storageEarth = fourthChar_earth
                    ~ fourthChar_earth = 0
                ~ kitchen_storageAir = fourthChar_air
                    ~ fourthChar_air = 0
                ~ kitchen_storageWater = fourthChar_water
                    ~ fourthChar_water = 0
                ~ kitchen_storageFire = fourthChar_fire
                    ~ fourthChar_fire = 0
                ~ kitchen_storageRelationshipIndicatore = fourthChar_relationshipIndicator
                    ~ fourthChar_relationshipIndicator = 0 

        - cookingCompanion == FifthCharacter:

                ~ kitchen_storageAether = fifthChar_aether
                    ~ fifthChar_aether = 0
                ~ kitchen_storageEarth = fifthChar_earth
                    ~ fifthChar_earth = 0
                ~ kitchen_storageAir = fifthChar_air
                    ~ fifthChar_air = 0
                ~ kitchen_storageWater = fifthChar_water
                    ~ fifthChar_water = 0
                ~ kitchen_storageFire = fifthChar_fire
                    ~ fifthChar_fire = 0
                ~ kitchen_storageRelationshipIndicatore = fifthChar_relationshipIndicator
                    ~ fifthChar_relationshipIndicator = 0                    
    
    }
    


=== function update_glyphs(cookingCompanion)
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
            ~ firstChar_fire= firstChar_fire + kitchen_storageFire
                ~ kitchen_storageFire = 0
            ~ firstChar_relationshipIndicator = firstChar_relationshipIndicator + kitchen_storageRelationshipIndicatore 
                ~ kitchen_storageRelationshipIndicatore = 0
    
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
            ~ secondChar_relationshipIndicator = secondChar_relationshipIndicator + kitchen_storageRelationshipIndicatore 
                ~ kitchen_storageRelationshipIndicatore = 0

    - cookingCompanion == ThirdCharacter:
            ~ thirdChar_aether = thirdChar_aether + kitchen_storageAether
                ~ kitchen_storageAether = 0
            ~ thirdChar_earth = thirdChar_earth + kitchen_storageEarth
                ~ kitchen_storageEarth = 0
            ~ thirdChar_air = thirdChar_air + kitchen_storageAir
                ~ kitchen_storageAir = 0
            ~ thirdChar_water = thirdChar_water + kitchen_storageWater
                ~ kitchen_storageWater = 0
            ~ thirdChar_fire = thirdChar_fire + kitchen_storageFire
                ~ kitchen_storageFire = 0
            ~ thirdChar_relationshipIndicator = thirdChar_relationshipIndicator + kitchen_storageRelationshipIndicatore 
                ~ kitchen_storageRelationshipIndicatore = 0               

    - cookingCompanion == FourthCharacter:
            ~ fourthChar_aether = fourthChar_aether + kitchen_storageAether
                ~ kitchen_storageAether = 0
            ~ fourthChar_earth = fourthChar_earth + kitchen_storageEarth
                ~ kitchen_storageEarth = 0
            ~ fourthChar_air = fourthChar_air + kitchen_storageAir
                ~ kitchen_storageAir = 0
            ~ fourthChar_water = fourthChar_water + kitchen_storageWater
                ~ kitchen_storageWater = 0
            ~ fourthChar_fire = fourthChar_fire + kitchen_storageFire
                ~ kitchen_storageFire = 0
            ~ fourthChar_relationshipIndicator = fourthChar_relationshipIndicator + kitchen_storageRelationshipIndicatore 
                ~ kitchen_storageRelationshipIndicatore = 0
    
    - cookingCompanion == FifthCharacter:
            ~ fifthChar_aether = fifthChar_aether + kitchen_storageAether
                ~ kitchen_storageAether = 0
            ~ fifthChar_earth = fifthChar_earth + kitchen_storageEarth
                ~ kitchen_storageEarth = 0
            ~ fifthChar_air = fifthChar_air + kitchen_storageAir
                ~ kitchen_storageAir = 0
            ~ fifthChar_water = fifthChar_water + kitchen_storageWater
                ~ kitchen_storageWater = 0
            ~ fifthChar_fire = fifthChar_fire + kitchen_storageFire
                ~ kitchen_storageFire = 0
            ~ fifthChar_relationshipIndicator = fifthChar_relationshipIndicator + kitchen_storageRelationshipIndicatore 
                ~ kitchen_storageRelationshipIndicatore = 0
    
    }
    
//Ne approfitto per svuotare i nomi
//Svuoto i nomi
    ~ kitchen_recipeNoun = ""
    ~ kitchen_recipeAdjective = ""
    ~ kitchen_recipeComplement = ""
    ~ kitchen_recipePP = ""
    ~ kitchen_tempRecipeName = ""


{debug_kitchen: dopo aver aggiornato i valori, il valore di kitchen_storageAether è {kitchen_storageAether}, di kitchen_storageEarth {kitchen_storageEarth}, kitchen_storageAir è {kitchen_storageAir}, di kitchen_storageWater {kitchen_storageWater}, di kitchen_storageFire {kitchen_storageFire}. cookingCompanion è {cookingCompanion}.} 


=== kitchen_moon_feedback ===
//Assegnazione parlante
{
    - are_two_entities_together(FirstCharacter,PG) && entity_location(PG) == Kitchen:
        ~ kitchen_actualChef = translator(firstChar_ActualName)
        ~ kitchen_actualChefPronouns = her

    - are_two_entities_together(SecondCharacter,PG) && entity_location(PG) == Kitchen:
        ~ kitchen_actualChef = translator(secondChar_ActualName)
        ~ kitchen_actualChefPronouns = him

    - are_two_entities_together(ThirdCharacter,PG) && entity_location(PG) == Kitchen:
        ~ kitchen_actualChef = translator(thirdChar_ActualName)
        ~ kitchen_actualChefPronouns = him

    - are_two_entities_together(Franco,PG) && entity_location(PG) == Kitchen:
        ~ kitchen_actualChef = Franco
        ~ kitchen_actualChefPronouns = him
}


{
//Il commento sul reset del rapporto c'è solo la prima volta.
    - not reset_indicator:
        -> reset_indicator
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

    = reset_indicator

            {charTag(TheWitch, witch_state())}:     <i>La cucina è un momento di ristoro, e per questo, temporaneamente, la relazione tra {kitchen_actualChef} e {player_name} riparte da zero.</i>
                                                    <i>Quando {kitchen_actualChef} uscirà dalla cucina, si ricorderà sia di com'era la reazione prima dell'ingresso, sia delle cose dette qui.
        ->->

    = first_time_ingredient

            {charTag(TheWitch, witch_state())}:     <i>{player_name} prova a parlare, ma le parole rimangono bloccate in gola. Ma gli ingredienti possono parlare per {player_pronouns has him:lui|{player_pronouns has her:lei|ləi}}.</i>
        
        ->->

    = first_time_good_reaction

            {charTag(TheWitch, witch_state())}:     <i>{player_name} ha aggiunto un ingrediente adorato da {kitchen_actualChef}, e quindi riceverà un consiglio su come gestire le conversazioni con {kitchen_actualChefPronouns == him:lui|lei}.</i>
        
        ->->

    = first_time_meh_reaction

            {charTag(TheWitch, witch_state())}:     <i>{player_name} ha aggiunto un ingrediente abbastanza apprezzato da {kitchen_actualChef}, e quindi riceverà un consiglio fumoso su cosa fare parlando con {kitchen_actualChefPronouns == him:lui|lei}.</i>
        
        ->->

    = first_time_bad_reaction

            {charTag(TheWitch, witch_state())}:     <i>{player_name} ha aggiunto un ingrediente detestato da {kitchen_actualChef}, e quindi non riceverà alcun consiglio su come gestire le conversazioni con {kitchen_actualChefPronouns == him:lui|lei}.</i>
        
        ->->

