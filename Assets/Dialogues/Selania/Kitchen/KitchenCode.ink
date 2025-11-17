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

//Storage temporaneo dei colori
    VAR storagePurple = 0
    VAR storageYellow = 0
    VAR storageBlue = 0
    VAR storageGreen = 0
    VAR storageRed = 0

//Storage temporaneo di altre informazioni
    VAR storageSecondStoryQuestCount = 0
    
//Reazioni possibili al quarto ingrediente
    //Nota: notReaction = non dato
    LIST fourthIngredientReactions = notReaction, badReaction, mehReaction, goodReaction

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
{kitchenDebug: passo per cooking_animations_on. Prima dell'intervento KitchenFire è in, {entity_location(KitchenFire)} mentre KitchenSmokeOneOne è in {entity_location(KitchenSmokeOne)}.}
    ~ move_entity(KitchenFire, Kitchen)
    ~ move_entity(KitchenSmokeOne, Kitchen)
    ~ move_entity(KitchenSmokeTwo, Kitchen)
    ~ move_entity(KitchenSmokeThree, Kitchen)
{kitchenDebug: Dopo l'intervento KitchenFire è in {entity_location(KitchenFire)}, mentre KitchenSmokeOne è in {entity_location(KitchenSmokeOne)}.}
->->


=== cooking_animations_off
{kitchenDebug: passo per cooking_animations_off. Prima dell'intervento KitchenFire è in, {entity_location(KitchenFire)} mentre KitchenSmokeOne è in {entity_location(KitchenSmokeOne)}.}
    ~ move_entity(KitchenFire, Safekeeping)
    ~ move_entity(KitchenSmokeOne, Safekeeping)
    ~ move_entity(KitchenSmokeTwo, Safekeeping)
    ~ move_entity(KitchenSmokeThree, Safekeeping)
    
{kitchenDebug: Dopo l'intervento KitchenFire è in {entity_location(KitchenFire)}, mentre KitchenSmokeOne è in {entity_location(KitchenSmokeOne)}.}    

->->



=== recipe_name_creator ===
{kitchenDebug: passo per recipeNameCreator.}

~  tempRecipeName = "{recipeNoun} {recipeAdjective} {recipeComplement} {recipePP}"

{player_name} ha cucinato {tempRecipeName}. #speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    -> recipe_name_storage ->


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
                ->-> 
        
        - fifthRecipe == "":
            ~ fifthRecipe = tempRecipeName 
                ->-> 
        
        - sixthRecipe == "":
            ~ sixthRecipe = tempRecipeName
                ->-> 
        
        - else:
            {kitchenDebug:ERROR: non ci sono ricette a disposizione per storare l'informazione.}
                ->->
    
    }

->->    


=== extra_ingredient_management(PNG)
{kitchenDebug: passo per extra_ingredient_management.}
//Qui gestiremo la parte di ingredienti che possiamo aggiungere, coi relativi effetti
    ~ enableNestDialogue()
    ~ temp charNameFive = translator(fifthChar_ActualName)
    {kitchenDebug: I doni trovati sono {findedGifts}.}
    Aggiungo....
    
/* ---------------------------------

            Coltivabili

 ----------------------------------*/
 //badReaction, mehReaction, goodReaction
        //Se la lista è vuota
    + {findedGifts == ()} [Non ho nulla da aggiungere.]
        ~ recipePP = "distratta"
    
    + [Ho cambiato idea.]
        ~ recipePP = "indecisa"
        
    + {findedGifts has BaccaDellaAddolorata} [Una bacca della Addolorata.]
        ~ findedGifts -= BaccaDellaAddolorata
        ~ recipePP = "aggiungere descrizione participio passato"
         {
        - recoveredCultivables hasnt BaccaDellaAddolorata:
        ~ recoverableCultivables += BaccaDellaAddolorata
    } 
            {
                - PNG == FirstCharacter:
                    ~ kitchen_firstCharExtraIngredientReaction = mehReaction
                    ~ kitchen_firstCharExtraIngredient = BaccaDellaAddolorata
                    {kitchenDebug: Ho modificato il valore di kitchen_firstCharExtraIngredientReaction in {kitchen_firstCharExtraIngredientReaction}.}
                    {kitchenDebug: Ho modificato il valore di kitchen_firstCharExtraIngredient in {kitchen_firstCharExtraIngredient}.}
                    
                - PNG == SecondCharacter:
                    ~ kitchen_secondCharExtraIngredientReaction = badReaction
                    ~ kitchen_secondCharExtraIngredient = BaccaDellaAddolorata
                    {kitchenDebug: Ho modificato il valore di kitchen_secondCharExtraIngredientReaction in {kitchen_secondCharExtraIngredientReaction}.}
                    {kitchenDebug: Ho modificato il valore di kitchen_secondCharExtraIngredient in {kitchen_secondCharExtraIngredient}.}
            }
    
    + {findedGifts has BarbaDellInciampo} [Una spina di Barba dell'Inciampo.]
        ~ findedGifts -= BarbaDellInciampo
        ~ recipePP = "aggiungere descrizione participio passato"
         {
        - recoveredCultivables hasnt BarbaDellInciampo:
        ~ recoverableCultivables += BarbaDellInciampo
    } 
            {
                - PNG == FirstCharacter:
                    ~ kitchen_firstCharExtraIngredientReaction = badReaction
                    ~ kitchen_firstCharExtraIngredient = BarbaDellInciampo
                    {kitchenDebug: Ho modificato il valore di kitchen_firstCharExtraIngredientReaction in {kitchen_firstCharExtraIngredientReaction}.}
                    {kitchenDebug: Ho modificato il valore di kitchen_firstCharExtraIngredient in {kitchen_firstCharExtraIngredient}.}
                    
                - PNG == SecondCharacter:
                    ~ kitchen_secondCharExtraIngredientReaction = badReaction
                    ~ kitchen_secondCharExtraIngredient = BarbaDellInciampo
                    {kitchenDebug: Ho modificato il valore di kitchen_secondCharExtraIngredientReaction in {kitchen_secondCharExtraIngredientReaction}.}
                    {kitchenDebug: Ho modificato il valore di kitchen_secondCharExtraIngredient in {kitchen_secondCharExtraIngredient}.}
            }
            
    + {findedGifts has BastoneDellOzioso} [Un nodo di Bastone dell'Ozioso.]
        ~ findedGifts -= BastoneDellOzioso
         {
        - recoveredCultivables hasnt BastoneDellOzioso:
        ~ recoverableCultivables += BastoneDellOzioso
    } 
        ~ recipePP = "aggiungere descrizione participio passato"
            {
                - PNG == FirstCharacter:
                    ~ kitchen_firstCharExtraIngredientReaction = mehReaction
                    ~ kitchen_firstCharExtraIngredient = BastoneDellOzioso
                    {kitchenDebug: Ho modificato il valore di kitchen_firstCharExtraIngredientReaction in {kitchen_firstCharExtraIngredientReaction}.}
                    {kitchenDebug: Ho modificato il valore di kitchen_firstCharExtraIngredient in {kitchen_firstCharExtraIngredient}.}
                    
                - PNG == SecondCharacter:
                    ~ kitchen_secondCharExtraIngredientReaction = goodReaction
                    ~ kitchen_secondCharExtraIngredient = BastoneDellOzioso
                    {kitchenDebug: Ho modificato il valore di kitchen_secondCharExtraIngredientReaction in {kitchen_secondCharExtraIngredientReaction}.}
                    {kitchenDebug: Ho modificato il valore di kitchen_secondCharExtraIngredient in {kitchen_secondCharExtraIngredient}.}
            }
        
    + {findedGifts has BrinaDellImpossibile} [Un frammento di Brina dell'Impossibile.]
        ~ findedGifts -= BrinaDellImpossibile
         {
        - recoveredCultivables hasnt BrinaDellImpossibile:
        ~ recoverableCultivables += BrinaDellImpossibile
    } 
        ~ recipePP = "aggiungere descrizione participio passato"
            {
                - PNG == FirstCharacter:
                    ~ kitchen_firstCharExtraIngredientReaction = badReaction
                    ~ kitchen_firstCharExtraIngredient = BrinaDellImpossibile
                    {kitchenDebug: Ho modificato il valore di kitchen_firstCharExtraIngredientReaction in {kitchen_firstCharExtraIngredientReaction}.}
                    {kitchenDebug: Ho modificato il valore di kitchen_firstCharExtraIngredient in {kitchen_firstCharExtraIngredient}.}
                    
                - PNG == SecondCharacter:
                    ~ kitchen_secondCharExtraIngredientReaction = goodReaction
                    ~ kitchen_secondCharExtraIngredient = BrinaDellImpossibile
                    {kitchenDebug: Ho modificato il valore di kitchen_secondCharExtraIngredientReaction in {kitchen_secondCharExtraIngredientReaction}.}
                    {kitchenDebug: Ho modificato il valore di kitchen_secondCharExtraIngredient in {kitchen_secondCharExtraIngredient}.}
            }        
    
    + {findedGifts has CantoDelleCompagne} [Una goccia di Canto delle Compagne.]
        ~ findedGifts -= CantoDelleCompagne
         {
        - recoveredCultivables hasnt CantoDelleCompagne:
        ~ recoverableCultivables += CantoDelleCompagne
    } 
        ~ recipePP = "aggiungere descrizione participio passato"
            {
                - PNG == FirstCharacter:
                    ~ kitchen_firstCharExtraIngredientReaction = goodReaction
                    ~ kitchen_firstCharExtraIngredient = CantoDelleCompagne
                    {kitchenDebug: Ho modificato il valore di kitchen_firstCharExtraIngredientReaction in {kitchen_firstCharExtraIngredientReaction}.}
                    {kitchenDebug: Ho modificato il valore di kitchen_firstCharExtraIngredient in {kitchen_firstCharExtraIngredient}.}
                    
                - PNG == SecondCharacter:
                    ~ kitchen_secondCharExtraIngredientReaction = badReaction
                    ~ kitchen_secondCharExtraIngredient = CantoDelleCompagne
                    {kitchenDebug: Ho modificato il valore di kitchen_secondCharExtraIngredientReaction in {kitchen_secondCharExtraIngredientReaction}.}
                    {kitchenDebug: Ho modificato il valore di kitchen_secondCharExtraIngredient in {kitchen_secondCharExtraIngredient}.}
            }        
    
    + {findedGifts has CardoAspinato} [Un ciuffo di peli di Cardo Aspinato.]
        ~ findedGifts -= CardoAspinato
         {
        - recoveredCultivables hasnt CardoAspinato:
        ~ recoverableCultivables += CardoAspinato
    } 
        ~ recipePP = "aggiungere descrizione participio passato"
            {
                - PNG == FirstCharacter:
                    ~ kitchen_firstCharExtraIngredientReaction = mehReaction
                    ~ kitchen_firstCharExtraIngredient = CardoAspinato
                    {kitchenDebug: Ho modificato il valore di kitchen_firstCharExtraIngredientReaction in {kitchen_firstCharExtraIngredientReaction}.}
                    {kitchenDebug: Ho modificato il valore di kitchen_firstCharExtraIngredient in {kitchen_firstCharExtraIngredient}.}
                    
                - PNG == SecondCharacter:
                    ~ kitchen_secondCharExtraIngredientReaction = mehReaction
                    ~ kitchen_secondCharExtraIngredient = CardoAspinato
                    {kitchenDebug: Ho modificato il valore di kitchen_secondCharExtraIngredientReaction in {kitchen_secondCharExtraIngredientReaction}.}
                    {kitchenDebug: Ho modificato il valore di kitchen_secondCharExtraIngredient in {kitchen_secondCharExtraIngredient}.}
            }        
            
    + {findedGifts has EderaDelleAmanti} [Una foglia di Edera delle amanti.]
        ~ findedGifts -= EderaDelleAmanti
        {
        - recoveredCultivables hasnt EderaDelleAmanti:
        ~ recoverableCultivables += EderaDelleAmanti
    } 
        ~ recipePP = "aggiungere descrizione participio passato"
            {
                - PNG == FirstCharacter:
                    ~ kitchen_firstCharExtraIngredientReaction = badReaction
                    ~ kitchen_firstCharExtraIngredient = EderaDelleAmanti
                    {kitchenDebug: Ho modificato il valore di kitchen_firstCharExtraIngredientReaction in {kitchen_firstCharExtraIngredientReaction}.}
                    {kitchenDebug: Ho modificato il valore di kitchen_firstCharExtraIngredient in {kitchen_firstCharExtraIngredient}.}
                    
                - PNG == SecondCharacter:
                    ~ kitchen_secondCharExtraIngredientReaction = badReaction
                    ~ kitchen_secondCharExtraIngredient = EderaDelleAmanti
                    {kitchenDebug: Ho modificato il valore di kitchen_secondCharExtraIngredientReaction in {kitchen_secondCharExtraIngredientReaction}.}
                    {kitchenDebug: Ho modificato il valore di kitchen_secondCharExtraIngredient in {kitchen_secondCharExtraIngredient}.}
            }        

    + {findedGifts has ErbaLiccia} [Un ricordo di Erba Liccia.]
        ~ findedGifts -= ErbaLiccia
         {
        - recoveredCultivables hasnt ErbaLiccia:
        ~ recoverableCultivables += ErbaLiccia
    } 
        ~ recipePP = "aggiungere descrizione participio passato"
            {
                - PNG == FirstCharacter:
                    ~ kitchen_firstCharExtraIngredientReaction = mehReaction
                    ~ kitchen_firstCharExtraIngredient = ErbaLiccia
                    {kitchenDebug: Ho modificato il valore di kitchen_firstCharExtraIngredientReaction in {kitchen_firstCharExtraIngredientReaction}.}
                    {kitchenDebug: Ho modificato il valore di kitchen_firstCharExtraIngredient in {kitchen_firstCharExtraIngredient}.}
                    
                - PNG == SecondCharacter:
                    ~ kitchen_secondCharExtraIngredientReaction = mehReaction
                    ~ kitchen_secondCharExtraIngredient = ErbaLiccia
                    {kitchenDebug: Ho modificato il valore di kitchen_secondCharExtraIngredientReaction in {kitchen_secondCharExtraIngredientReaction}.}
                    {kitchenDebug: Ho modificato il valore di kitchen_secondCharExtraIngredient in {kitchen_secondCharExtraIngredient}.}
            }        
        
     + {findedGifts has FalsaPalude} [Un petalo di Falsa Palude.]
        ~ findedGifts -= FalsaPalude
         {
        - recoveredCultivables hasnt FalsaPalude:
        ~ recoverableCultivables += FalsaPalude
    } 
        ~ recipePP = "aggiungere descrizione participio passato"
            {
                - PNG == FirstCharacter:
                    ~ kitchen_firstCharExtraIngredientReaction = badReaction
                    ~ kitchen_firstCharExtraIngredient = FalsaPalude
                    {kitchenDebug: Ho modificato il valore di kitchen_firstCharExtraIngredientReaction in {kitchen_firstCharExtraIngredientReaction}.}
                    {kitchenDebug: Ho modificato il valore di kitchen_firstCharExtraIngredient in {kitchen_firstCharExtraIngredient}.}
                    
                - PNG == SecondCharacter:
                    ~ kitchen_secondCharExtraIngredientReaction = badReaction
                    ~ kitchen_secondCharExtraIngredient = FalsaPalude
                    {kitchenDebug: Ho modificato il valore di kitchen_secondCharExtraIngredientReaction in {kitchen_secondCharExtraIngredientReaction}.}
                    {kitchenDebug: Ho modificato il valore di kitchen_secondCharExtraIngredient in {kitchen_secondCharExtraIngredient}.}
            }        
        
      + {findedGifts has LanaNotturna} [Il calore della Lana Notturna.]
        ~ findedGifts -= LanaNotturna
         {
        - recoveredCultivables hasnt LanaNotturna:
        ~ recoverableCultivables += LanaNotturna
    } 
        ~ recipePP = "aggiungere descrizione participio passato"
            {
                - PNG == FirstCharacter:
                    ~ kitchen_firstCharExtraIngredientReaction = goodReaction
                    ~ kitchen_firstCharExtraIngredient = LanaNotturna
                    {kitchenDebug: Ho modificato il valore di kitchen_firstCharExtraIngredientReaction in {kitchen_firstCharExtraIngredientReaction}.}
                    {kitchenDebug: Ho modificato il valore di kitchen_firstCharExtraIngredient in {kitchen_firstCharExtraIngredient}.}
                    
                - PNG == SecondCharacter:
                    ~ kitchen_secondCharExtraIngredientReaction = badReaction
                    ~ kitchen_secondCharExtraIngredient = LanaNotturna
                    {kitchenDebug: Ho modificato il valore di kitchen_secondCharExtraIngredientReaction in {kitchen_secondCharExtraIngredientReaction}.}
                    {kitchenDebug: Ho modificato il valore di kitchen_secondCharExtraIngredient in {kitchen_secondCharExtraIngredient}.}
            }        
        
    + {findedGifts has LicheneDegliAbissi} [Una traccia dell'odore del Lichene degli Abissi.]
        ~ findedGifts -= LicheneDegliAbissi
         {
        - recoveredCultivables hasnt LicheneDegliAbissi:
        ~ recoverableCultivables += LicheneDegliAbissi
    } 
        ~ recipePP = "aggiungere descrizione participio passato"
            {
                - PNG == FirstCharacter:
                    ~ kitchen_firstCharExtraIngredientReaction = badReaction
                    ~ kitchen_firstCharExtraIngredient = LicheneDegliAbissi
                    {kitchenDebug: Ho modificato il valore di kitchen_firstCharExtraIngredientReaction in {kitchen_firstCharExtraIngredientReaction}.}
                    {kitchenDebug: Ho modificato il valore di kitchen_firstCharExtraIngredient in {kitchen_firstCharExtraIngredient}.}
                    
                - PNG == SecondCharacter:
                    ~ kitchen_secondCharExtraIngredientReaction = goodReaction
                    ~ kitchen_secondCharExtraIngredient = LicheneDegliAbissi
                    {kitchenDebug: Ho modificato il valore di kitchen_secondCharExtraIngredientReaction in {kitchen_secondCharExtraIngredientReaction}.}
                    {kitchenDebug: Ho modificato il valore di kitchen_secondCharExtraIngredient in {kitchen_secondCharExtraIngredient}.}
            }        
    
    + {findedGifts has NonTiScordarDiTe} [L'impronta del Non Ti Scordar di Te.]
        ~ findedGifts -= NonTiScordarDiTe
         {
        - recoveredCultivables hasnt NonTiScordarDiTe:
        ~ recoverableCultivables += NonTiScordarDiTe
    } 
        ~ recipePP = "aggiungere descrizione participio passato"
            {
                - PNG == FirstCharacter:
                    ~ kitchen_firstCharExtraIngredientReaction = goodReaction
                    ~ kitchen_firstCharExtraIngredient = NonTiScordarDiTe
                    {kitchenDebug: Ho modificato il valore di kitchen_firstCharExtraIngredientReaction in {kitchen_firstCharExtraIngredientReaction}.}
                    {kitchenDebug: Ho modificato il valore di kitchen_firstCharExtraIngredient in {kitchen_firstCharExtraIngredient}.}
                    
                - PNG == SecondCharacter:
                    ~ kitchen_secondCharExtraIngredientReaction = mehReaction
                    ~ kitchen_secondCharExtraIngredient = NonTiScordarDiTe
                    {kitchenDebug: Ho modificato il valore di kitchen_secondCharExtraIngredientReaction in {kitchen_secondCharExtraIngredientReaction}.}
                    {kitchenDebug: Ho modificato il valore di kitchen_secondCharExtraIngredient in {kitchen_secondCharExtraIngredient}.}
            }        
    
    + {findedGifts has Olobino} [Una cappello di Olobino.]
        ~ findedGifts -= Olobino
         {
        - recoveredCultivables hasnt Olobino:
        ~ recoverableCultivables += Olobino
    } 
        ~ recipePP = "aggiungere descrizione participio passato"
            {
                - PNG == FirstCharacter:
                    ~ kitchen_firstCharExtraIngredientReaction = mehReaction
                    ~ kitchen_firstCharExtraIngredient = Olobino
                    {kitchenDebug: Ho modificato il valore di kitchen_firstCharExtraIngredientReaction in {kitchen_firstCharExtraIngredientReaction}.}
                    {kitchenDebug: Ho modificato il valore di kitchen_firstCharExtraIngredient in {kitchen_firstCharExtraIngredient}.}
                    
                - PNG == SecondCharacter:
                    ~ kitchen_secondCharExtraIngredientReaction = badReaction
                    ~ kitchen_secondCharExtraIngredient = Olobino
                    {kitchenDebug: Ho modificato il valore di kitchen_secondCharExtraIngredientReaction in {kitchen_secondCharExtraIngredientReaction}.}
                    {kitchenDebug: Ho modificato il valore di kitchen_secondCharExtraIngredient in {kitchen_secondCharExtraIngredient}.}
            }        
        
    + {findedGifts has LaSpazzata} [Un rametto della Spezzata.]
        ~ findedGifts -= LaSpazzata
         {
            - recoveredCultivables hasnt LaSpazzata:
                ~ recoverableCultivables += LaSpazzata
        } 
        ~ recipePP = "aggiungere descrizione participio passato"
            {
                - PNG == FirstCharacter:
                    ~ kitchen_firstCharExtraIngredientReaction = badReaction
                    ~ kitchen_firstCharExtraIngredient = LaSpazzata
                    {kitchenDebug: Ho modificato il valore di kitchen_firstCharExtraIngredientReaction in {kitchen_firstCharExtraIngredientReaction}.}
                    {kitchenDebug: Ho modificato il valore di kitchen_firstCharExtraIngredient in {kitchen_firstCharExtraIngredient}.}
                    
                - PNG == SecondCharacter:
                    ~ kitchen_secondCharExtraIngredientReaction = mehReaction
                    ~ kitchen_secondCharExtraIngredient = LaSpazzata
                    {kitchenDebug: Ho modificato il valore di kitchen_secondCharExtraIngredientReaction in {kitchen_secondCharExtraIngredientReaction}.}
                    {kitchenDebug: Ho modificato il valore di kitchen_secondCharExtraIngredient in {kitchen_secondCharExtraIngredient}.}
            }        
//Doni insoliti
    + {findedGifts has universalIngredient} [L'ingrediente universale della Rana.]
        ~ findedGifts -= universalIngredient
        ~ recipePP = "aggiungere descrizione participio passato"
        
            {
                - PNG == FirstCharacter:
                    ~ kitchen_firstCharExtraIngredientReaction = badReaction
                    ~ kitchen_firstCharExtraIngredient = universalIngredient
                    {kitchenDebug: Ho modificato il valore di kitchen_firstCharExtraIngredientReaction in {kitchen_firstCharExtraIngredientReaction}.}
                    {kitchenDebug: Ho modificato il valore di kitchen_firstCharExtraIngredient in {kitchen_firstCharExtraIngredient}.}
                    
                - PNG == SecondCharacter:
                    ~ kitchen_secondCharExtraIngredientReaction = goodReaction
                    ~ kitchen_secondCharExtraIngredient = universalIngredient
                    {kitchenDebug: Ho modificato il valore di kitchen_secondCharExtraIngredientReaction in {kitchen_secondCharExtraIngredientReaction}.}
                    {kitchenDebug: Ho modificato il valore di kitchen_secondCharExtraIngredient in {kitchen_secondCharExtraIngredient}.}
            }
    
    -
        ~ disableNestDialogue()    
        ->->




/* ---------------------------------

   Gestione colori durante la cucina e la riscrittura (reset e ripristino) 

 ----------------------------------*/


=== storage_colors(cookingCompanion)
{kitchenDebug or debug: storage_colors.}

    {
        - cookingCompanion == FirstCharacter:
            ~ storagePurple = firstChar_purple
                ~ firstChar_purple = 0
            ~ storageYellow = firstChar_yellow
                ~ firstChar_yellow = 0
            ~ storageBlue = firstChar_blue
                ~ firstChar_blue = 0
            ~ storageGreen = firstChar_green
                ~ firstChar_green = 0
            ~ storageRed = firstChar_red
                ~ firstChar_red = 0
    
        - cookingCompanion == SecondCharacter:
            ~ storagePurple = secondChar_purple
                ~ secondChar_purple = 0
            ~ storageYellow = secondChar_Yellow
                ~ secondChar_Yellow = 0
            ~ storageBlue = secondChar_Blue
                ~ secondChar_Blue = 0
            ~ storageGreen = secondChar_Green
                ~ secondChar_Green = 0
            ~ storageRed = secondChar_Red
                ~ secondChar_Red = 0
            ~ storageSecondStoryQuestCount = secondChar_storyletsForRewritingCount 
                ~ secondChar_storyletsForRewritingCount = 0
    }
->->


=== update_colors(cookingCompanion)
{kitchenDebug or debug: update_colors.}
{kitchenDebug: prima di aggiornare i valori, il valore di storagePurple è {storagePurple}, di storageYellow {storageYellow}, storageBlue è {storageBlue}, di storageGreen {storageGreen}, di storageRed {storageRed}. cookingCompanion è {cookingCompanion}.}
    {
        - cookingCompanion == FirstCharacter:
            ~ firstChar_purple = firstChar_purple + storagePurple
                ~ storagePurple = 0
            ~ firstChar_yellow = firstChar_yellow + storageYellow
                ~ storageYellow = 0
            ~ firstChar_blue = firstChar_blue + storageBlue
                ~ storageBlue = 0
            ~ firstChar_green = firstChar_green + storageGreen
                ~ storageGreen = 0
            ~ firstChar_red = firstChar_red + storageRed
                ~ storageRed = 0
    
    - cookingCompanion == SecondCharacter:
            ~ secondChar_purple = secondChar_purple + storagePurple
                ~ storagePurple = 0
            ~ secondChar_Yellow = secondChar_Yellow + storageYellow
                ~ storageYellow = 0
            ~ secondChar_Blue = secondChar_Blue + storageBlue
                ~ storageBlue = 0
            ~ secondChar_Green = secondChar_Green + storageGreen
                ~ storageGreen = 0
            ~ secondChar_Red = secondChar_Red + storageRed
                ~ storageRed = 0
            //Non aggiungiamo le tre domande perché complica solo il conteggio finale
            ~ secondChar_storyletsForRewritingCount = storageSecondStoryQuestCount
                ~ storageSecondStoryQuestCount = 0        
    
    }
    
//Ne approfitto per svuotare i nomi
//Svuoto i nomi
    ~ recipeNoun = ""
    ~ recipeAdjective = ""
    ~ recipeComplement = ""
    ~ recipePP = ""
    ~ tempRecipeName = ""


{kitchenDebug: dopo aver aggiornato i valori, il valore di storagePurple è {storagePurple}, di storageYellow {storageYellow}, storageBlue è {storageBlue}, di storageGreen {storageGreen}, di storageRed {storageRed}. cookingCompanion è {cookingCompanion}.} 
->->

