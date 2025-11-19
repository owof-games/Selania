//con questa logica traccio chi è l'effettivo ricettore del dono, così da presentare la linea di dialogo corretta

VAR gift_currentReceiver = ()


=== backpack_contents ===
+ {are_two_entities_together(Backpack, PG) && !debug_stochastic}[Backpack]
    ~ enableBigDialogue()
    {backpack_findedGifts != (): -> backpack ->|-> empty ->}
    ~ disableBigDialogue()
    -> main

    = backpack
        Hai con te {list_with_commas(backpack_findedGifts)}.
        ->->

    = empty
        Lo zainetto è vuoto.
        ->->


=== backpack_management ===
    {debug: I doni trovati sono {list_with_commas(backpack_findedGifts)}.}
    Dono...
    
/* ---------------------------------

            Coltivabili

 ----------------------------------*/
+ {backpack_findedGifts has BaccaDellaAddolorata} [Una bacca della Addolorata.]
    ~ backpack_findedGifts -= BaccaDellaAddolorata
    {
        - frog_recoveredCultivables hasnt BaccaDellaAddolorata:
        ~ frog_recoverableCultivables += BaccaDellaAddolorata
    }    

    {
        - gift_currentReceiver has FirstCharacter:
            
            -> object_value_for_PNG(BaccaDellaAddolorata, Backpack, FirstCharacter)
        
        - gift_currentReceiver has SecondCharacter:
                -> object_value_for_PNG(BaccaDellaAddolorata, Backpack, SecondCharacter)
    
    }
        -> main

+ {backpack_findedGifts has BarbaDellInciampo} [Una spina di Barba dell'Inciampo.]
    ~ backpack_findedGifts -= BarbaDellInciampo
    {
        - frog_recoveredCultivables hasnt BarbaDellInciampo:
        ~ frog_recoverableCultivables += BarbaDellInciampo
    } 
    {
        - gift_currentReceiver has FirstCharacter:
            -> object_value_for_PNG(BarbaDellInciampo, Backpack, FirstCharacter)
        
        
        - gift_currentReceiver has SecondCharacter:
                -> object_value_for_PNG(BarbaDellInciampo, Backpack, SecondCharacter)
        
    }        
    -> main    
        
+ {backpack_findedGifts has BastoneDellOzioso} [Un nodo di Bastone dell'Ozioso.]
    ~ backpack_findedGifts -= BastoneDellOzioso
    {
        - frog_recoveredCultivables hasnt BastoneDellOzioso:
        ~ frog_recoverableCultivables += BastoneDellOzioso
    } 
    {
        - gift_currentReceiver has FirstCharacter:
                -> object_value_for_PNG(BastoneDellOzioso, Backpack, FirstCharacter)
        
        - gift_currentReceiver has SecondCharacter:
                -> object_value_for_PNG(BastoneDellOzioso, Backpack, SecondCharacter)
        
    }
        -> main        
    
+ {backpack_findedGifts has BrinaDellImpossibile} [Un frammento di Brina dell'Impossibile.]
    ~ backpack_findedGifts -= BrinaDellImpossibile
    {
        - frog_recoveredCultivables hasnt BrinaDellImpossibile:
        ~ frog_recoverableCultivables += BrinaDellImpossibile
    } 

    {
        - gift_currentReceiver has FirstCharacter:
                -> object_value_for_PNG(BrinaDellImpossibile, Backpack, FirstCharacter)
    
        - gift_currentReceiver has SecondCharacter:
                -> object_value_for_PNG(BrinaDellImpossibile, Backpack, SecondCharacter)

    }
        -> main

+ {backpack_findedGifts has CantoDelleCompagne} [Una goccia di Canto delle Compagne.]
    ~ backpack_findedGifts -= CantoDelleCompagne
    {
        - frog_recoveredCultivables hasnt CantoDelleCompagne:
        ~ frog_recoverableCultivables += CantoDelleCompagne
    } 

    {
    - gift_currentReceiver has FirstCharacter:
                -> object_value_for_PNG(CantoDelleCompagne, Backpack, FirstCharacter)



    - gift_currentReceiver has SecondCharacter:
                -> object_value_for_PNG(CantoDelleCompagne, Backpack, SecondCharacter)

    }
        -> main

+ {backpack_findedGifts has CardoAspinato} [Un ciuffo di peli di Cardo Aspinato.]
    ~ backpack_findedGifts -= CardoAspinato
    {
        - frog_recoveredCultivables hasnt CardoAspinato:
        ~ frog_recoverableCultivables += CardoAspinato
    } 

    {
    - gift_currentReceiver has FirstCharacter:
        -> object_value_for_PNG(CardoAspinato, Backpack, FirstCharacter)


    - gift_currentReceiver has SecondCharacter:
            -> object_value_for_PNG(CardoAspinato, Backpack, SecondCharacter)
        
    }
        -> main   
        
+ {backpack_findedGifts has EderaDelleAmanti} [Una foglia di Edera delle amanti.]
    ~ backpack_findedGifts -= EderaDelleAmanti
    {
        - frog_recoveredCultivables hasnt EderaDelleAmanti:
        ~ frog_recoverableCultivables += EderaDelleAmanti
    } 
    {
        - gift_currentReceiver has FirstCharacter:
                -> object_value_for_PNG(EderaDelleAmanti, Backpack, FirstCharacter)
        
        
        - gift_currentReceiver has SecondCharacter:
                -> object_value_for_PNG(EderaDelleAmanti, Backpack, SecondCharacter)
        
    }
        -> main   
        
+ {backpack_findedGifts has ErbaLiccia} [Un ricordo di Erba Liccia.]
        ~ backpack_findedGifts -= ErbaLiccia
        {
        - frog_recoveredCultivables hasnt ErbaLiccia:
        ~ frog_recoverableCultivables += ErbaLiccia
    } 
    {
        - gift_currentReceiver has FirstCharacter:
                -> object_value_for_PNG(ErbaLiccia, Backpack, FirstCharacter)
        
        - gift_currentReceiver has SecondCharacter:
                    -> object_value_for_PNG(ErbaLiccia, Backpack, SecondCharacter)
        
    }
    
 + {backpack_findedGifts has FalsaPalude} [Un petalo di Falsa Palude.]
    ~ backpack_findedGifts -= FalsaPalude
    {
        - frog_recoveredCultivables hasnt FalsaPalude:
        ~ frog_recoverableCultivables += FalsaPalude
    } 
    {
        - gift_currentReceiver has FirstCharacter:
                -> object_value_for_PNG(FalsaPalude, Backpack, FirstCharacter)
        
        
        - gift_currentReceiver has SecondCharacter:
                -> object_value_for_PNG(FalsaPalude, Backpack, SecondCharacter)
        
    }
    
  + {backpack_findedGifts has LanaNotturna} [Il calore della Lana Notturna.]
        ~ backpack_findedGifts -= LanaNotturna
        {
        - frog_recoveredCultivables hasnt LanaNotturna:
        ~ frog_recoverableCultivables += LanaNotturna
    } 
    {
        - gift_currentReceiver has FirstCharacter:
                -> object_value_for_PNG(LanaNotturna, Backpack, FirstCharacter)
        
        - gift_currentReceiver has SecondCharacter:
                -> object_value_for_PNG(LanaNotturna, Backpack, SecondCharacter)
        
    }       
    
    -> main 
    
+ {backpack_findedGifts has LicheneDegliAbissi} [Una traccia dell'odore del Lichene degli Abissi.]
    ~ backpack_findedGifts -= LicheneDegliAbissi
    {
        - frog_recoveredCultivables hasnt LicheneDegliAbissi:
        ~ frog_recoverableCultivables += LicheneDegliAbissi
    } 

    {
    - gift_currentReceiver has FirstCharacter:
            -> object_value_for_PNG(LicheneDegliAbissi, Backpack, FirstCharacter)
    

    - gift_currentReceiver has SecondCharacter:
            -> object_value_for_PNG(LicheneDegliAbissi, Backpack, SecondCharacter)
    
    }
        -> main

+ {backpack_findedGifts has NonTiScordarDiTe} [L'impronta del Non Ti Scordar di Te.]
    ~ backpack_findedGifts -= NonTiScordarDiTe
    {
        - frog_recoveredCultivables hasnt NonTiScordarDiTe:
        ~ frog_recoverableCultivables += NonTiScordarDiTe
    } 

    {
    - gift_currentReceiver has FirstCharacter:
            -> object_value_for_PNG(NonTiScordarDiTe, Backpack, FirstCharacter)


    - gift_currentReceiver has SecondCharacter:
                 -> object_value_for_PNG(NonTiScordarDiTe, Backpack, SecondCharacter)
        
    }
        -> main        

+ {backpack_findedGifts has Olobino} [Una cappello di Olobino.]
    ~ backpack_findedGifts -= Olobino
    {
        - frog_recoveredCultivables hasnt Olobino:
        ~ frog_recoverableCultivables += Olobino
    } 
    {
        - gift_currentReceiver has FirstCharacter:
                -> object_value_for_PNG(Olobino, Backpack, FirstCharacter)
        
        
        - gift_currentReceiver has SecondCharacter:
                -> object_value_for_PNG(Olobino, Backpack, SecondCharacter)
        
    }
    -> main
    
+ {backpack_findedGifts has LaSpazzata} [Un rametto della Spezzata.]
    ~ backpack_findedGifts -= LaSpazzata
    {
        - frog_recoveredCultivables hasnt LaSpazzata:
        ~ frog_recoverableCultivables += LaSpazzata
    } 
    
    {
        - gift_currentReceiver has FirstCharacter:
                -> object_value_for_PNG(LaSpazzata, Backpack, FirstCharacter)
    
        - gift_currentReceiver has SecondCharacter:
                -> object_value_for_PNG(LaSpazzata, Backpack, SecondCharacter)
    
    }
        -> main

//Doni insoliti
+ {backpack_findedGifts has universalIngredient} [L'ingrediente universale della Rana.]
    ~ backpack_findedGifts -= universalIngredient
    
    {
        - gift_currentReceiver has FirstCharacter:
                -> object_value_for_PNG(universalIngredient, Backpack, FirstCharacter)
    
        - gift_currentReceiver has SecondCharacter:
                -> object_value_for_PNG(universalIngredient, Backpack, SecondCharacter)
    
    }
        -> main
        
        
    //Se la lista è vuota
    + {backpack_findedGifts == ()} [Non ho nulla da donare.]
        -> main
    
    + [Ho bisogno di ragionarci ancora un poco.]
        ~ gift_currentReceiver = ()
        -> main
            
    + ->
    - 
    -> main
