//Tracciamento nome ricette
    VAR firstRecipe = ""
    VAR secondRecipe = ""
    VAR thirdRecipe = ""
    VAR fourthRecipe = ""
    VAR fifthRecipe = ""
    VAR sixthRecipe = ""

//Tracciamento elementi che compongono il nome delle ricette
    VAR recipeNoun = ""
    VAR recipeAdjective = ""
    VAR recipeComplement = ""
    //PP come Past Participle
    VAR recipePP = ""
    VAR tempRecipeName = ""



=== check_kitchen_recap
    
    @animation:RewriterBook

    {
        - BookPlace hasnt KitchenRecap:
        
            ~ move_entity(KitchenRecap, BookPlace)
                {
                    - kitchen == 1:
                    ~ saturationVar ++
                    ~ move_entity(teaKit, Bedroom)
                }
    }

->->


=== recipe_name_creator ===
{kitchenDebug: passo per recipeNameCreator.}

~  tempRecipeName = "{recipeNoun} {recipeAdjective} {recipeComplement} {recipePP}"

{name} ha cucinato {tempRecipeName}. #speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
    -> recipe_name_storage ->

//Svuoto i nomi
    ~ recipeNoun = ""
    ~ recipeAdjective = ""
    ~ recipeComplement = ""
    ~ recipePP = ""
    ~ tempRecipeName = ""

    ->->

//Lo chiamo da recipeNameCreator, non mi serve chiamarlo altrove
=== recipe_name_storage
{kitchenDebug: passo per recipe_name_storage.}

    {
        - firstRecipe == "":
            {kitchenDebug: il valore di firstRecipe è {firstRecipe} e quindi lo aggiorno.}
            ~ firstRecipe = tempRecipeName
            {kitchenDebug: il valore di firstRecipe ora è {firstRecipe}.}
                ->->
        - secondRecipe == "":
            {kitchenDebug: il valore di firstRecipe è {firstRecipe} e quindi non lo aggiorno.}
            {kitchenDebug: il valore di secondRecipe è {secondRecipe} e quindi lo aggiorno.}
            ~ secondRecipe = tempRecipeName
            {kitchenDebug: il valore di secondRecipe ora è {secondRecipe}.}
                ->->
        
        - thirdRecipe == "":
            {kitchenDebug: il valore di firstRecipe è {firstRecipe} e quindi non lo aggiorno.}
            {kitchenDebug: il valore di secondRecipe è {secondRecipe} e quindi non lo aggiorno.}
            {kitchenDebug: il valore di thirdRecipe è {thirdRecipe} è quindi non lo aggiorno.}
                ~ thirdRecipe = tempRecipeName
            {kitchenDebug: il valore di thirdRecipe ora è {thirdRecipe}.}
                ->-> 
        
        - fourthRecipe == "":
            ~ fourthRecipe = tempRecipeName
            
        - fifthRecipe == "":
            ~ fifthRecipe = tempRecipeName 
        
        - sixthRecipe == "":
            ~ sixthRecipe = tempRecipeName
        
        
        - else:
            {kitchenDebug:ERROR: non ci sono ricette a disposizione per storare l'informazione.}
                ->->
    
    }

->->    


=== extra_ingredient_management
//Qui gestiremo la parte di ingredienti che possiamo aggiungere, coi relativi effetti




->->