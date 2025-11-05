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


=== recipe_name_creator ===
{kitchenDebug: passo per recipeNameCreator.}

~  tempRecipeName = "{recipeNoun} {recipeAdjective} {recipeComplement} {recipePP}"

{name} ha cucinato {tempRecipeName}. #speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
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


=== extra_ingredient_management(PNG)
{kitchenDebug: passo per extra_ingredient_management.}
//Qui gestiremo la parte di ingredienti che possiamo aggiungere, coi relativi effetti
    ~ temp charNameFive = translator(fifthCharacterState)
    {kitchenDebug: I doni trovati sono {findedGifts}.}
    Aggiungo....
    
/* ---------------------------------

            Coltivabili

 ----------------------------------*/
 //badReaction, mehReaction, goodReaction
    + {findedGifts has BaccaDellaAddolorata} [Una bacca della Addolorata.]
        ~ findedGifts -= BaccaDellaAddolorata
        ~ recipePP = "aggiungere descrizione participio passato"
            {
                - PNG == FirstCharacter:
                    ~ fourthIngredientReactionFirstCharacter = mehReaction
                    ~ fourthIngredientNameFirstCharacter = BaccaDellaAddolorata
                    {kitchenDebug: Ho modificato il valore di fourthIngredientReactionFirstCharacter in {fourthIngredientReactionFirstCharacter}.}
                    {kitchenDebug: Ho modificato il valore di fourthIngredientNameFirstCharacter in {fourthIngredientNameFirstCharacter}.}
                    
                - PNG == SecondCharacter:
                    ~ fourthIngredientReactionSecondCharacter = badReaction
                    ~ fourthIngredientNameSecondCharacter = BaccaDellaAddolorata
                    {kitchenDebug: Ho modificato il valore di fourthIngredientReactionSecondCharacter in {fourthIngredientReactionSecondCharacter}.}
                    {kitchenDebug: Ho modificato il valore di fourthIngredientNameSecondCharacter in {fourthIngredientNameSecondCharacter}.}
            }
            ->->
    
    + {findedGifts has BarbaDellInciampo} [Una spina di Barba dell'Inciampo.]
        ~ findedGifts -= BarbaDellInciampo
        ~ recipePP = "aggiungere descrizione participio passato"
            {
                - PNG == FirstCharacter:
                    ~ fourthIngredientReactionFirstCharacter = badReaction
                    ~ fourthIngredientNameFirstCharacter = BarbaDellInciampo
                    {kitchenDebug: Ho modificato il valore di fourthIngredientReactionFirstCharacter in {fourthIngredientReactionFirstCharacter}.}
                    {kitchenDebug: Ho modificato il valore di fourthIngredientNameFirstCharacter in {fourthIngredientNameFirstCharacter}.}
                    
                - PNG == SecondCharacter:
                    ~ fourthIngredientReactionSecondCharacter = badReaction
                    ~ fourthIngredientNameSecondCharacter = BarbaDellInciampo
                    {kitchenDebug: Ho modificato il valore di fourthIngredientReactionSecondCharacter in {fourthIngredientReactionSecondCharacter}.}
                    {kitchenDebug: Ho modificato il valore di fourthIngredientNameSecondCharacter in {fourthIngredientNameSecondCharacter}.}
            }
            ->->    
            
    + {findedGifts has BastoneDellOzioso} [Un nodo di Bastone dell'Ozioso.]
        ~ findedGifts -= BastoneDellOzioso
        ~ recipePP = "aggiungere descrizione participio passato"
            {
                - PNG == FirstCharacter:
                    ~ fourthIngredientReactionFirstCharacter = mehReaction
                    ~ fourthIngredientNameFirstCharacter = BastoneDellOzioso
                    {kitchenDebug: Ho modificato il valore di fourthIngredientReactionFirstCharacter in {fourthIngredientReactionFirstCharacter}.}
                    {kitchenDebug: Ho modificato il valore di fourthIngredientNameFirstCharacter in {fourthIngredientNameFirstCharacter}.}
                    
                - PNG == SecondCharacter:
                    ~ fourthIngredientReactionSecondCharacter = goodReaction
                    ~ fourthIngredientNameSecondCharacter = BastoneDellOzioso
                    {kitchenDebug: Ho modificato il valore di fourthIngredientReactionSecondCharacter in {fourthIngredientReactionSecondCharacter}.}
                    {kitchenDebug: Ho modificato il valore di fourthIngredientNameSecondCharacter in {fourthIngredientNameSecondCharacter}.}
            }
            ->->      
        
    + {findedGifts has BrinaDellImpossibile} [Un frammento di Brina dell'Impossibile.]
        ~ findedGifts -= BrinaDellImpossibile
        ~ recipePP = "aggiungere descrizione participio passato"
            {
                - PNG == FirstCharacter:
                    ~ fourthIngredientReactionFirstCharacter = badReaction
                    ~ fourthIngredientNameFirstCharacter = BrinaDellImpossibile
                    {kitchenDebug: Ho modificato il valore di fourthIngredientReactionFirstCharacter in {fourthIngredientReactionFirstCharacter}.}
                    {kitchenDebug: Ho modificato il valore di fourthIngredientNameFirstCharacter in {fourthIngredientNameFirstCharacter}.}
                    
                - PNG == SecondCharacter:
                    ~ fourthIngredientReactionSecondCharacter = goodReaction
                    ~ fourthIngredientNameSecondCharacter = BrinaDellImpossibile
                    {kitchenDebug: Ho modificato il valore di fourthIngredientReactionSecondCharacter in {fourthIngredientReactionSecondCharacter}.}
                    {kitchenDebug: Ho modificato il valore di fourthIngredientNameSecondCharacter in {fourthIngredientNameSecondCharacter}.}
            }        
            ->->
    
    + {findedGifts has CantoDelleCompagne} [Una goccia di Canto delle Compagne.]
        ~ findedGifts -= CantoDelleCompagne
        ~ recipePP = "aggiungere descrizione participio passato"
            {
                - PNG == FirstCharacter:
                    ~ fourthIngredientReactionFirstCharacter = goodReaction
                    ~ fourthIngredientNameFirstCharacter = CantoDelleCompagne
                    {kitchenDebug: Ho modificato il valore di fourthIngredientReactionFirstCharacter in {fourthIngredientReactionFirstCharacter}.}
                    {kitchenDebug: Ho modificato il valore di fourthIngredientNameFirstCharacter in {fourthIngredientNameFirstCharacter}.}
                    
                - PNG == SecondCharacter:
                    ~ fourthIngredientReactionSecondCharacter = badReaction
                    ~ fourthIngredientNameSecondCharacter = CantoDelleCompagne
                    {kitchenDebug: Ho modificato il valore di fourthIngredientReactionSecondCharacter in {fourthIngredientReactionSecondCharacter}.}
                    {kitchenDebug: Ho modificato il valore di fourthIngredientNameSecondCharacter in {fourthIngredientNameSecondCharacter}.}
            }        
            ->->
    
    + {findedGifts has CardoAspinato} [Un ciuffo di peli di Cardo Aspinato.]
        ~ findedGifts -= CardoAspinato
        ~ recipePP = "aggiungere descrizione participio passato"
            {
                - PNG == FirstCharacter:
                    ~ fourthIngredientReactionFirstCharacter = mehReaction
                    ~ fourthIngredientNameFirstCharacter = CardoAspinato
                    {kitchenDebug: Ho modificato il valore di fourthIngredientReactionFirstCharacter in {fourthIngredientReactionFirstCharacter}.}
                    {kitchenDebug: Ho modificato il valore di fourthIngredientNameFirstCharacter in {fourthIngredientNameFirstCharacter}.}
                    
                - PNG == SecondCharacter:
                    ~ fourthIngredientReactionSecondCharacter = mehReaction
                    ~ fourthIngredientNameSecondCharacter = CardoAspinato
                    {kitchenDebug: Ho modificato il valore di fourthIngredientReactionSecondCharacter in {fourthIngredientReactionSecondCharacter}.}
                    {kitchenDebug: Ho modificato il valore di fourthIngredientNameSecondCharacter in {fourthIngredientNameSecondCharacter}.}
            }        
            ->-> 
            
    + {findedGifts has EderaDelleAmanti} [Una foglia di Edera delle amanti.]
        ~ findedGifts -= EderaDelleAmanti
        ~ recipePP = "aggiungere descrizione participio passato"
            {
                - PNG == FirstCharacter:
                    ~ fourthIngredientReactionFirstCharacter = badReaction
                    ~ fourthIngredientNameFirstCharacter = EderaDelleAmanti
                    {kitchenDebug: Ho modificato il valore di fourthIngredientReactionFirstCharacter in {fourthIngredientReactionFirstCharacter}.}
                    {kitchenDebug: Ho modificato il valore di fourthIngredientNameFirstCharacter in {fourthIngredientNameFirstCharacter}.}
                    
                - PNG == SecondCharacter:
                    ~ fourthIngredientReactionSecondCharacter = badReaction
                    ~ fourthIngredientNameSecondCharacter = EderaDelleAmanti
                    {kitchenDebug: Ho modificato il valore di fourthIngredientReactionSecondCharacter in {fourthIngredientReactionSecondCharacter}.}
                    {kitchenDebug: Ho modificato il valore di fourthIngredientNameSecondCharacter in {fourthIngredientNameSecondCharacter}.}
            }        
            ->->
            
    + {findedGifts has ErbaLiccia} [Un ricordo di Erba Liccia.]
        ~ findedGifts -= ErbaLiccia
        ~ recipePP = "aggiungere descrizione participio passato"
            {
                - PNG == FirstCharacter:
                    ~ fourthIngredientReactionFirstCharacter = mehReaction
                    ~ fourthIngredientNameFirstCharacter = ErbaLiccia
                    {kitchenDebug: Ho modificato il valore di fourthIngredientReactionFirstCharacter in {fourthIngredientReactionFirstCharacter}.}
                    {kitchenDebug: Ho modificato il valore di fourthIngredientNameFirstCharacter in {fourthIngredientNameFirstCharacter}.}
                    
                - PNG == SecondCharacter:
                    ~ fourthIngredientReactionSecondCharacter = mehReaction
                    ~ fourthIngredientNameSecondCharacter = ErbaLiccia
                    {kitchenDebug: Ho modificato il valore di fourthIngredientReactionSecondCharacter in {fourthIngredientReactionSecondCharacter}.}
                    {kitchenDebug: Ho modificato il valore di fourthIngredientNameSecondCharacter in {fourthIngredientNameSecondCharacter}.}
            }        
            ->->
        
     + {findedGifts has FalsaPalude} [Un petalo di Falsa Palude.]
        ~ findedGifts -= FalsaPalude
        ~ recipePP = "aggiungere descrizione participio passato"
            {
                - PNG == FirstCharacter:
                    ~ fourthIngredientReactionFirstCharacter = badReaction
                    ~ fourthIngredientNameFirstCharacter = FalsaPalude
                    {kitchenDebug: Ho modificato il valore di fourthIngredientReactionFirstCharacter in {fourthIngredientReactionFirstCharacter}.}
                    {kitchenDebug: Ho modificato il valore di fourthIngredientNameFirstCharacter in {fourthIngredientNameFirstCharacter}.}
                    
                - PNG == SecondCharacter:
                    ~ fourthIngredientReactionSecondCharacter = badReaction
                    ~ fourthIngredientNameSecondCharacter = FalsaPalude
                    {kitchenDebug: Ho modificato il valore di fourthIngredientReactionSecondCharacter in {fourthIngredientReactionSecondCharacter}.}
                    {kitchenDebug: Ho modificato il valore di fourthIngredientNameSecondCharacter in {fourthIngredientNameSecondCharacter}.}
            }        
            ->->
        
      + {findedGifts has LanaNotturna} [Il calore della Lana Notturna.]
        ~ findedGifts -= LanaNotturna
        ~ recipePP = "aggiungere descrizione participio passato"
            {
                - PNG == FirstCharacter:
                    ~ fourthIngredientReactionFirstCharacter = goodReaction
                    ~ fourthIngredientNameFirstCharacter = LanaNotturna
                    {kitchenDebug: Ho modificato il valore di fourthIngredientReactionFirstCharacter in {fourthIngredientReactionFirstCharacter}.}
                    {kitchenDebug: Ho modificato il valore di fourthIngredientNameFirstCharacter in {fourthIngredientNameFirstCharacter}.}
                    
                - PNG == SecondCharacter:
                    ~ fourthIngredientReactionSecondCharacter = badReaction
                    ~ fourthIngredientNameSecondCharacter = LanaNotturna
                    {kitchenDebug: Ho modificato il valore di fourthIngredientReactionSecondCharacter in {fourthIngredientReactionSecondCharacter}.}
                    {kitchenDebug: Ho modificato il valore di fourthIngredientNameSecondCharacter in {fourthIngredientNameSecondCharacter}.}
            }        
            ->->
        
    + {findedGifts has LicheneDegliAbissi} [Una traccia dell'odore del Lichene degli Abissi.]
        ~ findedGifts -= LicheneDegliAbissi
        ~ recipePP = "aggiungere descrizione participio passato"
            {
                - PNG == FirstCharacter:
                    ~ fourthIngredientReactionFirstCharacter = badReaction
                    ~ fourthIngredientNameFirstCharacter = LicheneDegliAbissi
                    {kitchenDebug: Ho modificato il valore di fourthIngredientReactionFirstCharacter in {fourthIngredientReactionFirstCharacter}.}
                    {kitchenDebug: Ho modificato il valore di fourthIngredientNameFirstCharacter in {fourthIngredientNameFirstCharacter}.}
                    
                - PNG == SecondCharacter:
                    ~ fourthIngredientReactionSecondCharacter = badReaction
                    ~ fourthIngredientNameSecondCharacter = LicheneDegliAbissi
                    {kitchenDebug: Ho modificato il valore di fourthIngredientReactionSecondCharacter in {fourthIngredientReactionSecondCharacter}.}
                    {kitchenDebug: Ho modificato il valore di fourthIngredientNameSecondCharacter in {fourthIngredientNameSecondCharacter}.}
            }        
            ->->
    
    + {findedGifts has NonTiScordarDiTe} [L'impronta del Non Ti Scordar di Te.]
        ~ findedGifts -= NonTiScordarDiTe
        ~ recipePP = "aggiungere descrizione participio passato"
            {
                - PNG == FirstCharacter:
                    ~ fourthIngredientReactionFirstCharacter = goodReaction
                    ~ fourthIngredientNameFirstCharacter = NonTiScordarDiTe
                    {kitchenDebug: Ho modificato il valore di fourthIngredientReactionFirstCharacter in {fourthIngredientReactionFirstCharacter}.}
                    {kitchenDebug: Ho modificato il valore di fourthIngredientNameFirstCharacter in {fourthIngredientNameFirstCharacter}.}
                    
                - PNG == SecondCharacter:
                    ~ fourthIngredientReactionSecondCharacter = goodReaction
                    ~ fourthIngredientNameSecondCharacter = NonTiScordarDiTe
                    {kitchenDebug: Ho modificato il valore di fourthIngredientReactionSecondCharacter in {fourthIngredientReactionSecondCharacter}.}
                    {kitchenDebug: Ho modificato il valore di fourthIngredientNameSecondCharacter in {fourthIngredientNameSecondCharacter}.}
            }        
            ->->      
    
    + {findedGifts has Olobino} [Una cappello di Olobino.]
        ~ findedGifts -= Olobino
        ~ recipePP = "aggiungere descrizione participio passato"
            {
                - PNG == FirstCharacter:
                    ~ fourthIngredientReactionFirstCharacter = mehReaction
                    ~ fourthIngredientNameFirstCharacter = Olobino
                    {kitchenDebug: Ho modificato il valore di fourthIngredientReactionFirstCharacter in {fourthIngredientReactionFirstCharacter}.}
                    {kitchenDebug: Ho modificato il valore di fourthIngredientNameFirstCharacter in {fourthIngredientNameFirstCharacter}.}
                    
                - PNG == SecondCharacter:
                    ~ fourthIngredientReactionSecondCharacter = badReaction
                    ~ fourthIngredientNameSecondCharacter = Olobino
                    {kitchenDebug: Ho modificato il valore di fourthIngredientReactionSecondCharacter in {fourthIngredientReactionSecondCharacter}.}
                    {kitchenDebug: Ho modificato il valore di fourthIngredientNameSecondCharacter in {fourthIngredientNameSecondCharacter}.}
            }        
            ->->
        
    + {findedGifts has LaSpazzata} [Un rametto della Spezzata.]
        ~ findedGifts -= LaSpazzata
        ~ recipePP = "aggiungere descrizione participio passato"
            {
                - PNG == FirstCharacter:
                    ~ fourthIngredientReactionFirstCharacter = badReaction
                    ~ fourthIngredientNameFirstCharacter = LaSpazzata
                    {kitchenDebug: Ho modificato il valore di fourthIngredientReactionFirstCharacter in {fourthIngredientReactionFirstCharacter}.}
                    {kitchenDebug: Ho modificato il valore di fourthIngredientNameFirstCharacter in {fourthIngredientNameFirstCharacter}.}
                    
                - PNG == SecondCharacter:
                    ~ fourthIngredientReactionSecondCharacter = mehReaction
                    ~ fourthIngredientNameSecondCharacter = LaSpazzata
                    {kitchenDebug: Ho modificato il valore di fourthIngredientReactionSecondCharacter in {fourthIngredientReactionSecondCharacter}.}
                    {kitchenDebug: Ho modificato il valore di fourthIngredientNameSecondCharacter in {fourthIngredientNameSecondCharacter}.}
            }        
            ->->
//Doni insoliti
    + {findedGifts has universalIngredient} [L'ingrediente universale della Rana.]
        ~ findedGifts -= universalIngredient
        ~ recipePP = "aggiungere descrizione participio passato"
        
            {
                - PNG == FirstCharacter:
                    ~ fourthIngredientReactionFirstCharacter = badReaction
                    ~ fourthIngredientNameFirstCharacter = universalIngredient
                    {kitchenDebug: Ho modificato il valore di fourthIngredientReactionFirstCharacter in {fourthIngredientReactionFirstCharacter}.}
                    {kitchenDebug: Ho modificato il valore di fourthIngredientNameFirstCharacter in {fourthIngredientNameFirstCharacter}.}
                    
                - PNG == SecondCharacter:
                    ~ fourthIngredientReactionSecondCharacter = goodReaction
                    ~ fourthIngredientNameSecondCharacter = universalIngredient
                    {kitchenDebug: Ho modificato il valore di fourthIngredientReactionSecondCharacter in {fourthIngredientReactionSecondCharacter}.}
                    {kitchenDebug: Ho modificato il valore di fourthIngredientNameSecondCharacter in {fourthIngredientNameSecondCharacter}.}
            }  
        -> main

    //Se la lista è vuota
    + {findedGifts == ()} [Non ho nulla da aggiungere.]
        ~ recipePP = "distratta"
        ->->
    
    + [Ho cambiato idea.]
        ~ recipePP = "indecisa"
        ->->
    - 
->->



/* ---------------------------------

   Gestione colori durante la cucina e la riscrittura (reset e ripristino) 

 ----------------------------------*/


=== storage_colors(cookingCompanion)
{kitchenDebug or debug: storage_colors.}

    {
        - cookingCompanion == FirstCharacter:
            ~ storagePurple = firstPurple
                ~ firstPurple = 0
            ~ storageYellow = firstYellow
                ~ firstYellow = 0
            ~ storageBlue = firstBlue
                ~ firstBlue = 0
            ~ storageGreen = firstGreen
                ~ firstGreen = 0
            ~ storageRed = firstRed
                ~ firstRed = 0
    
        - cookingCompanion == SecondCharacter:
            ~ storagePurple = secondPurple
                ~ secondPurple = 0
            ~ storageYellow = secondYellow
                ~ secondYellow = 0
            ~ storageBlue = secondBlue
                ~ secondBlue = 0
            ~ storageGreen = secondGreen
                ~ secondGreen = 0
            ~ storageRed = secondRed
                ~ secondRed = 0
            ~ storageSecondStoryQuestCount = secondStoryQuestCount 
                ~ secondStoryQuestCount = 0
    }
->->


=== update_colors(cookingCompanion)
{kitchenDebug or debug: update_colors.}

    {
        - cookingCompanion == FirstCharacter:
            ~ firstPurple = firstPurple + storagePurple
                ~ storagePurple = 0
            ~ storageYellow = firstYellow + storageYellow
                ~ storageYellow = 0
            ~ storageBlue = firstBlue + storageBlue
                ~ storageBlue = 0
            ~ storageGreen = firstGreen + storageGreen
                ~ storageGreen = 0
            ~ storageRed = firstRed + storageRed
                ~ storageRed = 0
    
    - cookingCompanion == SecondCharacter:
            ~ secondPurple = secondPurple + storagePurple
                ~ storagePurple = 0
            ~ secondYellow = secondYellow + storageYellow
                ~ storageYellow = 0
            ~ secondBlue = secondBlue + storageBlue
                ~ storageBlue = 0
            ~ secondGreen = secondGreen + storageGreen
                ~ storageGreen = 0
            ~ secondRed = secondRed + storageRed
                ~ storageRed = 0
            //Non aggiungiamo le tre domande perché complica solo il conteggio finale
            ~ secondStoryQuestCount = storageSecondStoryQuestCount
                ~ storageSecondStoryQuestCount = 0        
    
    }
    
->->

