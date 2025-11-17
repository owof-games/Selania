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
    {debug_kitchen: I doni trovati sono {findedGifts}.}
    Aggiungo....
    
/* ---------------------------------

            Coltivabili

 ----------------------------------*/
 //badReaction, mehReaction, goodReaction
        //Se la lista è vuota
    + {findedGifts == ()} [Non ho nulla da aggiungere.]
        ~ kitchen_recipePP = "distratta"
    
    + [Ho cambiato idea.]
        ~ kitchen_recipePP = "indecisa"
        
    + {findedGifts has BaccaDellaAddolorata} [Una bacca della Addolorata.]
        ~ findedGifts -= BaccaDellaAddolorata
        ~ kitchen_recipePP = "aggiungere descrizione participio passato"
         {
        - recoveredCultivables hasnt BaccaDellaAddolorata:
        ~ recoverableCultivables += BaccaDellaAddolorata
    } 
            {
                - PNG == FirstCharacter:
                    ~ kitchen_firstCharExtraIngredientReaction = mehReaction
                    ~ kitchen_firstCharExtraIngredient = BaccaDellaAddolorata
                    {debug_kitchen: Ho modificato il valore di kitchen_firstCharExtraIngredientReaction in {kitchen_firstCharExtraIngredientReaction}.}
                    {debug_kitchen: Ho modificato il valore di kitchen_firstCharExtraIngredient in {kitchen_firstCharExtraIngredient}.}
                    
                - PNG == SecondCharacter:
                    ~ kitchen_secondCharExtraIngredientReaction = badReaction
                    ~ kitchen_secondCharExtraIngredient = BaccaDellaAddolorata
                    {debug_kitchen: Ho modificato il valore di kitchen_secondCharExtraIngredientReaction in {kitchen_secondCharExtraIngredientReaction}.}
                    {debug_kitchen: Ho modificato il valore di kitchen_secondCharExtraIngredient in {kitchen_secondCharExtraIngredient}.}
            }
    
    + {findedGifts has BarbaDellInciampo} [Una spina di Barba dell'Inciampo.]
        ~ findedGifts -= BarbaDellInciampo
        ~ kitchen_recipePP = "aggiungere descrizione participio passato"
         {
        - recoveredCultivables hasnt BarbaDellInciampo:
        ~ recoverableCultivables += BarbaDellInciampo
    } 
            {
                - PNG == FirstCharacter:
                    ~ kitchen_firstCharExtraIngredientReaction = badReaction
                    ~ kitchen_firstCharExtraIngredient = BarbaDellInciampo
                    {debug_kitchen: Ho modificato il valore di kitchen_firstCharExtraIngredientReaction in {kitchen_firstCharExtraIngredientReaction}.}
                    {debug_kitchen: Ho modificato il valore di kitchen_firstCharExtraIngredient in {kitchen_firstCharExtraIngredient}.}
                    
                - PNG == SecondCharacter:
                    ~ kitchen_secondCharExtraIngredientReaction = badReaction
                    ~ kitchen_secondCharExtraIngredient = BarbaDellInciampo
                    {debug_kitchen: Ho modificato il valore di kitchen_secondCharExtraIngredientReaction in {kitchen_secondCharExtraIngredientReaction}.}
                    {debug_kitchen: Ho modificato il valore di kitchen_secondCharExtraIngredient in {kitchen_secondCharExtraIngredient}.}
            }
            
    + {findedGifts has BastoneDellOzioso} [Un nodo di Bastone dell'Ozioso.]
        ~ findedGifts -= BastoneDellOzioso
         {
        - recoveredCultivables hasnt BastoneDellOzioso:
        ~ recoverableCultivables += BastoneDellOzioso
    } 
        ~ kitchen_recipePP = "aggiungere descrizione participio passato"
            {
                - PNG == FirstCharacter:
                    ~ kitchen_firstCharExtraIngredientReaction = mehReaction
                    ~ kitchen_firstCharExtraIngredient = BastoneDellOzioso
                    {debug_kitchen: Ho modificato il valore di kitchen_firstCharExtraIngredientReaction in {kitchen_firstCharExtraIngredientReaction}.}
                    {debug_kitchen: Ho modificato il valore di kitchen_firstCharExtraIngredient in {kitchen_firstCharExtraIngredient}.}
                    
                - PNG == SecondCharacter:
                    ~ kitchen_secondCharExtraIngredientReaction = goodReaction
                    ~ kitchen_secondCharExtraIngredient = BastoneDellOzioso
                    {debug_kitchen: Ho modificato il valore di kitchen_secondCharExtraIngredientReaction in {kitchen_secondCharExtraIngredientReaction}.}
                    {debug_kitchen: Ho modificato il valore di kitchen_secondCharExtraIngredient in {kitchen_secondCharExtraIngredient}.}
            }
        
    + {findedGifts has BrinaDellImpossibile} [Un frammento di Brina dell'Impossibile.]
        ~ findedGifts -= BrinaDellImpossibile
         {
        - recoveredCultivables hasnt BrinaDellImpossibile:
        ~ recoverableCultivables += BrinaDellImpossibile
    } 
        ~ kitchen_recipePP = "aggiungere descrizione participio passato"
            {
                - PNG == FirstCharacter:
                    ~ kitchen_firstCharExtraIngredientReaction = badReaction
                    ~ kitchen_firstCharExtraIngredient = BrinaDellImpossibile
                    {debug_kitchen: Ho modificato il valore di kitchen_firstCharExtraIngredientReaction in {kitchen_firstCharExtraIngredientReaction}.}
                    {debug_kitchen: Ho modificato il valore di kitchen_firstCharExtraIngredient in {kitchen_firstCharExtraIngredient}.}
                    
                - PNG == SecondCharacter:
                    ~ kitchen_secondCharExtraIngredientReaction = goodReaction
                    ~ kitchen_secondCharExtraIngredient = BrinaDellImpossibile
                    {debug_kitchen: Ho modificato il valore di kitchen_secondCharExtraIngredientReaction in {kitchen_secondCharExtraIngredientReaction}.}
                    {debug_kitchen: Ho modificato il valore di kitchen_secondCharExtraIngredient in {kitchen_secondCharExtraIngredient}.}
            }        
    
    + {findedGifts has CantoDelleCompagne} [Una goccia di Canto delle Compagne.]
        ~ findedGifts -= CantoDelleCompagne
         {
        - recoveredCultivables hasnt CantoDelleCompagne:
        ~ recoverableCultivables += CantoDelleCompagne
    } 
        ~ kitchen_recipePP = "aggiungere descrizione participio passato"
            {
                - PNG == FirstCharacter:
                    ~ kitchen_firstCharExtraIngredientReaction = goodReaction
                    ~ kitchen_firstCharExtraIngredient = CantoDelleCompagne
                    {debug_kitchen: Ho modificato il valore di kitchen_firstCharExtraIngredientReaction in {kitchen_firstCharExtraIngredientReaction}.}
                    {debug_kitchen: Ho modificato il valore di kitchen_firstCharExtraIngredient in {kitchen_firstCharExtraIngredient}.}
                    
                - PNG == SecondCharacter:
                    ~ kitchen_secondCharExtraIngredientReaction = badReaction
                    ~ kitchen_secondCharExtraIngredient = CantoDelleCompagne
                    {debug_kitchen: Ho modificato il valore di kitchen_secondCharExtraIngredientReaction in {kitchen_secondCharExtraIngredientReaction}.}
                    {debug_kitchen: Ho modificato il valore di kitchen_secondCharExtraIngredient in {kitchen_secondCharExtraIngredient}.}
            }        
    
    + {findedGifts has CardoAspinato} [Un ciuffo di peli di Cardo Aspinato.]
        ~ findedGifts -= CardoAspinato
         {
        - recoveredCultivables hasnt CardoAspinato:
        ~ recoverableCultivables += CardoAspinato
    } 
        ~ kitchen_recipePP = "aggiungere descrizione participio passato"
            {
                - PNG == FirstCharacter:
                    ~ kitchen_firstCharExtraIngredientReaction = mehReaction
                    ~ kitchen_firstCharExtraIngredient = CardoAspinato
                    {debug_kitchen: Ho modificato il valore di kitchen_firstCharExtraIngredientReaction in {kitchen_firstCharExtraIngredientReaction}.}
                    {debug_kitchen: Ho modificato il valore di kitchen_firstCharExtraIngredient in {kitchen_firstCharExtraIngredient}.}
                    
                - PNG == SecondCharacter:
                    ~ kitchen_secondCharExtraIngredientReaction = mehReaction
                    ~ kitchen_secondCharExtraIngredient = CardoAspinato
                    {debug_kitchen: Ho modificato il valore di kitchen_secondCharExtraIngredientReaction in {kitchen_secondCharExtraIngredientReaction}.}
                    {debug_kitchen: Ho modificato il valore di kitchen_secondCharExtraIngredient in {kitchen_secondCharExtraIngredient}.}
            }        
            
    + {findedGifts has EderaDelleAmanti} [Una foglia di Edera delle amanti.]
        ~ findedGifts -= EderaDelleAmanti
        {
        - recoveredCultivables hasnt EderaDelleAmanti:
        ~ recoverableCultivables += EderaDelleAmanti
    } 
        ~ kitchen_recipePP = "aggiungere descrizione participio passato"
            {
                - PNG == FirstCharacter:
                    ~ kitchen_firstCharExtraIngredientReaction = badReaction
                    ~ kitchen_firstCharExtraIngredient = EderaDelleAmanti
                    {debug_kitchen: Ho modificato il valore di kitchen_firstCharExtraIngredientReaction in {kitchen_firstCharExtraIngredientReaction}.}
                    {debug_kitchen: Ho modificato il valore di kitchen_firstCharExtraIngredient in {kitchen_firstCharExtraIngredient}.}
                    
                - PNG == SecondCharacter:
                    ~ kitchen_secondCharExtraIngredientReaction = badReaction
                    ~ kitchen_secondCharExtraIngredient = EderaDelleAmanti
                    {debug_kitchen: Ho modificato il valore di kitchen_secondCharExtraIngredientReaction in {kitchen_secondCharExtraIngredientReaction}.}
                    {debug_kitchen: Ho modificato il valore di kitchen_secondCharExtraIngredient in {kitchen_secondCharExtraIngredient}.}
            }        

    + {findedGifts has ErbaLiccia} [Un ricordo di Erba Liccia.]
        ~ findedGifts -= ErbaLiccia
         {
        - recoveredCultivables hasnt ErbaLiccia:
        ~ recoverableCultivables += ErbaLiccia
    } 
        ~ kitchen_recipePP = "aggiungere descrizione participio passato"
            {
                - PNG == FirstCharacter:
                    ~ kitchen_firstCharExtraIngredientReaction = mehReaction
                    ~ kitchen_firstCharExtraIngredient = ErbaLiccia
                    {debug_kitchen: Ho modificato il valore di kitchen_firstCharExtraIngredientReaction in {kitchen_firstCharExtraIngredientReaction}.}
                    {debug_kitchen: Ho modificato il valore di kitchen_firstCharExtraIngredient in {kitchen_firstCharExtraIngredient}.}
                    
                - PNG == SecondCharacter:
                    ~ kitchen_secondCharExtraIngredientReaction = mehReaction
                    ~ kitchen_secondCharExtraIngredient = ErbaLiccia
                    {debug_kitchen: Ho modificato il valore di kitchen_secondCharExtraIngredientReaction in {kitchen_secondCharExtraIngredientReaction}.}
                    {debug_kitchen: Ho modificato il valore di kitchen_secondCharExtraIngredient in {kitchen_secondCharExtraIngredient}.}
            }        
        
     + {findedGifts has FalsaPalude} [Un petalo di Falsa Palude.]
        ~ findedGifts -= FalsaPalude
         {
        - recoveredCultivables hasnt FalsaPalude:
        ~ recoverableCultivables += FalsaPalude
    } 
        ~ kitchen_recipePP = "aggiungere descrizione participio passato"
            {
                - PNG == FirstCharacter:
                    ~ kitchen_firstCharExtraIngredientReaction = badReaction
                    ~ kitchen_firstCharExtraIngredient = FalsaPalude
                    {debug_kitchen: Ho modificato il valore di kitchen_firstCharExtraIngredientReaction in {kitchen_firstCharExtraIngredientReaction}.}
                    {debug_kitchen: Ho modificato il valore di kitchen_firstCharExtraIngredient in {kitchen_firstCharExtraIngredient}.}
                    
                - PNG == SecondCharacter:
                    ~ kitchen_secondCharExtraIngredientReaction = badReaction
                    ~ kitchen_secondCharExtraIngredient = FalsaPalude
                    {debug_kitchen: Ho modificato il valore di kitchen_secondCharExtraIngredientReaction in {kitchen_secondCharExtraIngredientReaction}.}
                    {debug_kitchen: Ho modificato il valore di kitchen_secondCharExtraIngredient in {kitchen_secondCharExtraIngredient}.}
            }        
        
      + {findedGifts has LanaNotturna} [Il calore della Lana Notturna.]
        ~ findedGifts -= LanaNotturna
         {
        - recoveredCultivables hasnt LanaNotturna:
        ~ recoverableCultivables += LanaNotturna
    } 
        ~ kitchen_recipePP = "aggiungere descrizione participio passato"
            {
                - PNG == FirstCharacter:
                    ~ kitchen_firstCharExtraIngredientReaction = goodReaction
                    ~ kitchen_firstCharExtraIngredient = LanaNotturna
                    {debug_kitchen: Ho modificato il valore di kitchen_firstCharExtraIngredientReaction in {kitchen_firstCharExtraIngredientReaction}.}
                    {debug_kitchen: Ho modificato il valore di kitchen_firstCharExtraIngredient in {kitchen_firstCharExtraIngredient}.}
                    
                - PNG == SecondCharacter:
                    ~ kitchen_secondCharExtraIngredientReaction = badReaction
                    ~ kitchen_secondCharExtraIngredient = LanaNotturna
                    {debug_kitchen: Ho modificato il valore di kitchen_secondCharExtraIngredientReaction in {kitchen_secondCharExtraIngredientReaction}.}
                    {debug_kitchen: Ho modificato il valore di kitchen_secondCharExtraIngredient in {kitchen_secondCharExtraIngredient}.}
            }        
        
    + {findedGifts has LicheneDegliAbissi} [Una traccia dell'odore del Lichene degli Abissi.]
        ~ findedGifts -= LicheneDegliAbissi
         {
        - recoveredCultivables hasnt LicheneDegliAbissi:
        ~ recoverableCultivables += LicheneDegliAbissi
    } 
        ~ kitchen_recipePP = "aggiungere descrizione participio passato"
            {
                - PNG == FirstCharacter:
                    ~ kitchen_firstCharExtraIngredientReaction = badReaction
                    ~ kitchen_firstCharExtraIngredient = LicheneDegliAbissi
                    {debug_kitchen: Ho modificato il valore di kitchen_firstCharExtraIngredientReaction in {kitchen_firstCharExtraIngredientReaction}.}
                    {debug_kitchen: Ho modificato il valore di kitchen_firstCharExtraIngredient in {kitchen_firstCharExtraIngredient}.}
                    
                - PNG == SecondCharacter:
                    ~ kitchen_secondCharExtraIngredientReaction = goodReaction
                    ~ kitchen_secondCharExtraIngredient = LicheneDegliAbissi
                    {debug_kitchen: Ho modificato il valore di kitchen_secondCharExtraIngredientReaction in {kitchen_secondCharExtraIngredientReaction}.}
                    {debug_kitchen: Ho modificato il valore di kitchen_secondCharExtraIngredient in {kitchen_secondCharExtraIngredient}.}
            }        
    
    + {findedGifts has NonTiScordarDiTe} [L'impronta del Non Ti Scordar di Te.]
        ~ findedGifts -= NonTiScordarDiTe
         {
        - recoveredCultivables hasnt NonTiScordarDiTe:
        ~ recoverableCultivables += NonTiScordarDiTe
    } 
        ~ kitchen_recipePP = "aggiungere descrizione participio passato"
            {
                - PNG == FirstCharacter:
                    ~ kitchen_firstCharExtraIngredientReaction = goodReaction
                    ~ kitchen_firstCharExtraIngredient = NonTiScordarDiTe
                    {debug_kitchen: Ho modificato il valore di kitchen_firstCharExtraIngredientReaction in {kitchen_firstCharExtraIngredientReaction}.}
                    {debug_kitchen: Ho modificato il valore di kitchen_firstCharExtraIngredient in {kitchen_firstCharExtraIngredient}.}
                    
                - PNG == SecondCharacter:
                    ~ kitchen_secondCharExtraIngredientReaction = mehReaction
                    ~ kitchen_secondCharExtraIngredient = NonTiScordarDiTe
                    {debug_kitchen: Ho modificato il valore di kitchen_secondCharExtraIngredientReaction in {kitchen_secondCharExtraIngredientReaction}.}
                    {debug_kitchen: Ho modificato il valore di kitchen_secondCharExtraIngredient in {kitchen_secondCharExtraIngredient}.}
            }        
    
    + {findedGifts has Olobino} [Una cappello di Olobino.]
        ~ findedGifts -= Olobino
         {
        - recoveredCultivables hasnt Olobino:
        ~ recoverableCultivables += Olobino
    } 
        ~ kitchen_recipePP = "aggiungere descrizione participio passato"
            {
                - PNG == FirstCharacter:
                    ~ kitchen_firstCharExtraIngredientReaction = mehReaction
                    ~ kitchen_firstCharExtraIngredient = Olobino
                    {debug_kitchen: Ho modificato il valore di kitchen_firstCharExtraIngredientReaction in {kitchen_firstCharExtraIngredientReaction}.}
                    {debug_kitchen: Ho modificato il valore di kitchen_firstCharExtraIngredient in {kitchen_firstCharExtraIngredient}.}
                    
                - PNG == SecondCharacter:
                    ~ kitchen_secondCharExtraIngredientReaction = badReaction
                    ~ kitchen_secondCharExtraIngredient = Olobino
                    {debug_kitchen: Ho modificato il valore di kitchen_secondCharExtraIngredientReaction in {kitchen_secondCharExtraIngredientReaction}.}
                    {debug_kitchen: Ho modificato il valore di kitchen_secondCharExtraIngredient in {kitchen_secondCharExtraIngredient}.}
            }        
        
    + {findedGifts has LaSpazzata} [Un rametto della Spezzata.]
        ~ findedGifts -= LaSpazzata
         {
            - recoveredCultivables hasnt LaSpazzata:
                ~ recoverableCultivables += LaSpazzata
        } 
        ~ kitchen_recipePP = "aggiungere descrizione participio passato"
            {
                - PNG == FirstCharacter:
                    ~ kitchen_firstCharExtraIngredientReaction = badReaction
                    ~ kitchen_firstCharExtraIngredient = LaSpazzata
                    {debug_kitchen: Ho modificato il valore di kitchen_firstCharExtraIngredientReaction in {kitchen_firstCharExtraIngredientReaction}.}
                    {debug_kitchen: Ho modificato il valore di kitchen_firstCharExtraIngredient in {kitchen_firstCharExtraIngredient}.}
                    
                - PNG == SecondCharacter:
                    ~ kitchen_secondCharExtraIngredientReaction = mehReaction
                    ~ kitchen_secondCharExtraIngredient = LaSpazzata
                    {debug_kitchen: Ho modificato il valore di kitchen_secondCharExtraIngredientReaction in {kitchen_secondCharExtraIngredientReaction}.}
                    {debug_kitchen: Ho modificato il valore di kitchen_secondCharExtraIngredient in {kitchen_secondCharExtraIngredient}.}
            }        
//Doni insoliti
    + {findedGifts has universalIngredient} [L'ingrediente universale della Rana.]
        ~ findedGifts -= universalIngredient
        ~ kitchen_recipePP = "aggiungere descrizione participio passato"
        
            {
                - PNG == FirstCharacter:
                    ~ kitchen_firstCharExtraIngredientReaction = badReaction
                    ~ kitchen_firstCharExtraIngredient = universalIngredient
                    {debug_kitchen: Ho modificato il valore di kitchen_firstCharExtraIngredientReaction in {kitchen_firstCharExtraIngredientReaction}.}
                    {debug_kitchen: Ho modificato il valore di kitchen_firstCharExtraIngredient in {kitchen_firstCharExtraIngredient}.}
                    
                - PNG == SecondCharacter:
                    ~ kitchen_secondCharExtraIngredientReaction = goodReaction
                    ~ kitchen_secondCharExtraIngredient = universalIngredient
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

