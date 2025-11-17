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
    VAR kitchen_storagePurple = 0
    VAR kitchen_storageYellow = 0
    VAR kitchen_storageBlue = 0
    VAR kitchen_storageGreen = 0
    VAR kitchen_storageRed = 0


//Reazioni possibili al quarto ingrediente
    //Nota: notReaction = non dato
    LIST kitchen_extraIngredientPossibleReactions = notReaction, badReaction, mehReaction, goodReaction

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

{player_name} ha cucinato {kitchen_tempRecipeName}. #speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    -> recipe_name_storage ->


    ->->

//Lo chiamo da recipeNameCreator, non mi serve chiamarlo altrove
=== recipe_name_storage
{debug_kitchen: passo per recipe_name_storage.}

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
            {debug_kitchen:ERROR: non ci sono ricette a disposizione per storare l'informazione.}
                ->->
    
    }

->->    


=== extra_ingredient_management(PNG)
{debug_kitchen: passo per extra_ingredient_management.}
//Qui gestiremo la parte di ingredienti che possiamo aggiungere, coi relativi effetti
    ~ enableNestDialogue()
    ~ temp charNameFive = translator(fifthChar_ActualName)
    {debug_kitchen: I doni trovati sono {backpack_findedGifts}.}
    Aggiungo....
    
/* ---------------------------------

            Coltivabili

 ----------------------------------*/
 //badReaction, mehReaction, goodReaction
        //Se la lista è vuota
    + {backpack_findedGifts == ()} [Non ho nulla da aggiungere.]
        ~ kitchen_recipePP = "distratta"
    
    + [Ho cambiato idea.]
        ~ kitchen_recipePP = "indecisa"
        
    + {backpack_findedGifts has BaccaDellaAddolorata} [Una bacca della Addolorata.]
        ~ backpack_findedGifts -= BaccaDellaAddolorata
        ~ kitchen_recipePP = "aggiungere descrizione participio passato"
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
    
    + {backpack_findedGifts has BarbaDellInciampo} [Una spina di Barba dell'Inciampo.]
        ~ backpack_findedGifts -= BarbaDellInciampo
        ~ kitchen_recipePP = "aggiungere descrizione participio passato"
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
            
    + {backpack_findedGifts has BastoneDellOzioso} [Un nodo di Bastone dell'Ozioso.]
        ~ backpack_findedGifts -= BastoneDellOzioso
         {
        - frog_recoveredCultivables hasnt BastoneDellOzioso:
        ~ frog_recoverableCultivables += BastoneDellOzioso
        } 
        ~ kitchen_recipePP = "aggiungere descrizione participio passato"
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
        
    + {backpack_findedGifts has BrinaDellImpossibile} [Un frammento di Brina dell'Impossibile.]
        ~ backpack_findedGifts -= BrinaDellImpossibile
         {
        - frog_recoveredCultivables hasnt BrinaDellImpossibile:
        ~ frog_recoverableCultivables += BrinaDellImpossibile
    } 
        ~ kitchen_recipePP = "aggiungere descrizione participio passato"
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
    
    + {backpack_findedGifts has CantoDelleCompagne} [Una goccia di Canto delle Compagne.]
        ~ backpack_findedGifts -= CantoDelleCompagne
         {
        - frog_recoveredCultivables hasnt CantoDelleCompagne:
        ~ frog_recoverableCultivables += CantoDelleCompagne
    } 
        ~ kitchen_recipePP = "aggiungere descrizione participio passato"
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
    
    + {backpack_findedGifts has CardoAspinato} [Un ciuffo di peli di Cardo Aspinato.]
        ~ backpack_findedGifts -= CardoAspinato
         {
        - frog_recoveredCultivables hasnt CardoAspinato:
        ~ frog_recoverableCultivables += CardoAspinato
    } 
        ~ kitchen_recipePP = "aggiungere descrizione participio passato"
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
            
    + {backpack_findedGifts has EderaDelleAmanti} [Una foglia di Edera delle amanti.]
        ~ backpack_findedGifts -= EderaDelleAmanti
        {
        - frog_recoveredCultivables hasnt EderaDelleAmanti:
        ~ frog_recoverableCultivables += EderaDelleAmanti
    } 
        ~ kitchen_recipePP = "aggiungere descrizione participio passato"
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

    + {backpack_findedGifts has ErbaLiccia} [Un ricordo di Erba Liccia.]
        ~ backpack_findedGifts -= ErbaLiccia
         {
        - frog_recoveredCultivables hasnt ErbaLiccia:
        ~ frog_recoverableCultivables += ErbaLiccia
    } 
        ~ kitchen_recipePP = "aggiungere descrizione participio passato"
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
        
     + {backpack_findedGifts has FalsaPalude} [Un petalo di Falsa Palude.]
        ~ backpack_findedGifts -= FalsaPalude
         {
        - frog_recoveredCultivables hasnt FalsaPalude:
        ~ frog_recoverableCultivables += FalsaPalude
    } 
        ~ kitchen_recipePP = "aggiungere descrizione participio passato"
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
        
      + {backpack_findedGifts has LanaNotturna} [Il calore della Lana Notturna.]
        ~ backpack_findedGifts -= LanaNotturna
         {
        - frog_recoveredCultivables hasnt LanaNotturna:
        ~ frog_recoverableCultivables += LanaNotturna
    } 
        ~ kitchen_recipePP = "aggiungere descrizione participio passato"
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
        
    + {backpack_findedGifts has LicheneDegliAbissi} [Una traccia dell'odore del Lichene degli Abissi.]
        ~ backpack_findedGifts -= LicheneDegliAbissi
         {
        - frog_recoveredCultivables hasnt LicheneDegliAbissi:
        ~ frog_recoverableCultivables += LicheneDegliAbissi
    } 
        ~ kitchen_recipePP = "aggiungere descrizione participio passato"
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
    
    + {backpack_findedGifts has NonTiScordarDiTe} [L'impronta del Non Ti Scordar di Te.]
        ~ backpack_findedGifts -= NonTiScordarDiTe
         {
        - frog_recoveredCultivables hasnt NonTiScordarDiTe:
        ~ frog_recoverableCultivables += NonTiScordarDiTe
    } 
        ~ kitchen_recipePP = "aggiungere descrizione participio passato"
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
    
    + {backpack_findedGifts has Olobino} [Una cappello di Olobino.]
        ~ backpack_findedGifts -= Olobino
         {
        - frog_recoveredCultivables hasnt Olobino:
        ~ frog_recoverableCultivables += Olobino
    } 
        ~ kitchen_recipePP = "aggiungere descrizione participio passato"
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
        
    + {backpack_findedGifts has LaSpazzata} [Un rametto della Spezzata.]
        ~ backpack_findedGifts -= LaSpazzata
         {
            - frog_recoveredCultivables hasnt LaSpazzata:
                ~ frog_recoverableCultivables += LaSpazzata
        } 
        ~ kitchen_recipePP = "aggiungere descrizione participio passato"
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
    + {backpack_findedGifts has universalIngredient} [L'ingrediente universale della Rana.]
        ~ backpack_findedGifts -= universalIngredient
        ~ kitchen_recipePP = "aggiungere descrizione participio passato"
        
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
            ~ kitchen_storagePurple = firstChar_purple
                ~ firstChar_purple = 0
            ~ kitchen_storageYellow = firstChar_yellow
                ~ firstChar_yellow = 0
            ~ kitchen_storageBlue = firstChar_blue
                ~ firstChar_blue = 0
            ~ kitchen_storageGreen = firstChar_green
                ~ firstChar_green = 0
            ~ kitchen_storageRed = firstChar_red
                ~ firstChar_red = 0
    
        - cookingCompanion == SecondCharacter:
            ~ kitchen_storagePurple = secondChar_purple
                ~ secondChar_purple = 0
            ~ kitchen_storageYellow = secondChar_Yellow
                ~ secondChar_Yellow = 0
            ~ kitchen_storageBlue = secondChar_Blue
                ~ secondChar_Blue = 0
            ~ kitchen_storageGreen = secondChar_Green
                ~ secondChar_Green = 0
            ~ kitchen_storageRed = secondChar_Red
                ~ secondChar_Red = 0
    }
->->


=== update_colors(cookingCompanion)
{debug_kitchen or debug: update_colors.}
{debug_kitchen: prima di aggiornare i valori, il valore di kitchen_storagePurple è {kitchen_storagePurple}, di kitchen_storageYellow {kitchen_storageYellow}, kitchen_storageBlue è {kitchen_storageBlue}, di kitchen_storageGreen {kitchen_storageGreen}, di kitchen_storageRed {kitchen_storageRed}. cookingCompanion è {cookingCompanion}.}
    {
        - cookingCompanion == FirstCharacter:
            ~ firstChar_purple = firstChar_purple + kitchen_storagePurple
                ~ kitchen_storagePurple = 0
            ~ firstChar_yellow = firstChar_yellow + kitchen_storageYellow
                ~ kitchen_storageYellow = 0
            ~ firstChar_blue = firstChar_blue + kitchen_storageBlue
                ~ kitchen_storageBlue = 0
            ~ firstChar_green = firstChar_green + kitchen_storageGreen
                ~ kitchen_storageGreen = 0
            ~ firstChar_red = firstChar_red + kitchen_storageRed
                ~ kitchen_storageRed = 0
    
    - cookingCompanion == SecondCharacter:
            ~ secondChar_purple = secondChar_purple + kitchen_storagePurple
                ~ kitchen_storagePurple = 0
            ~ secondChar_Yellow = secondChar_Yellow + kitchen_storageYellow
                ~ kitchen_storageYellow = 0
            ~ secondChar_Blue = secondChar_Blue + kitchen_storageBlue
                ~ kitchen_storageBlue = 0
            ~ secondChar_Green = secondChar_Green + kitchen_storageGreen
                ~ kitchen_storageGreen = 0
            ~ secondChar_Red = secondChar_Red + kitchen_storageRed
                ~ kitchen_storageRed = 0
 
    
    }
    
//Ne approfitto per svuotare i nomi
//Svuoto i nomi
    ~ kitchen_recipeNoun = ""
    ~ kitchen_recipeAdjective = ""
    ~ kitchen_recipeComplement = ""
    ~ kitchen_recipePP = ""
    ~ kitchen_tempRecipeName = ""


{debug_kitchen: dopo aver aggiornato i valori, il valore di kitchen_storagePurple è {kitchen_storagePurple}, di kitchen_storageYellow {kitchen_storageYellow}, kitchen_storageBlue è {kitchen_storageBlue}, di kitchen_storageGreen {kitchen_storageGreen}, di kitchen_storageRed {kitchen_storageRed}. cookingCompanion è {cookingCompanion}.} 
->->

