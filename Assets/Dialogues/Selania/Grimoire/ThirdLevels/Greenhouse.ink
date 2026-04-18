=== grimoire_greenhouse_thirdLevel (leftPlant, rightPlant)
- (top)

    @grimoireGreenhousePages#leftPageTitle:{plantsNameTranslator(leftPlant)}#leftPageStatus:{grimoire_pageStatus(leftPlant)}#leftPagePlant:{leftPlant}#rightPageTitle:{plantsNameTranslator(rightPlant)}#rightPageStatus:{grimoire_pageStatus(rightPlant)}#rightPagePlant:{rightPlant}

    //Descrizione generale pagina sinistra
    {grimoire_plantsDescription(leftPlant)}#leftPageDescription

    //Sottotitoli
    //Utilizzo in cucina
    {grimoire_pageSubtitle(leftPlant, FirstCharacter, Kitchen)}#leftPageSubtitle
    {grimoire_pageSubtitle(leftPlant, SecondCharacter, Kitchen)}#leftPageSubtitle
    {grimoire_pageSubtitle(leftPlant, ThirdCharacter, Kitchen)}#leftPageSubtitle
    {grimoire_pageSubtitle(leftPlant, FourthCharacter, Kitchen)}#leftPageSubtitle
    {grimoire_pageSubtitle(leftPlant, FifthCharacter, Kitchen)}#leftPageSubtitle
    //Dono
    {grimoire_pageSubtitle(leftPlant, FirstCharacter, Backpack)}#leftPageSubtitle
    {grimoire_pageGiftDescription(leftPlant, FirstCharacter)}#leftPageDescription
    {grimoire_pageSubtitle(leftPlant, SecondCharacter, Backpack)}#leftPageSubtitle
    {grimoire_pageGiftDescription(leftPlant, SecondCharacter)}#leftPageDescription
    {grimoire_pageSubtitle(leftPlant, ThirdCharacter, Backpack)}#leftPageSubtitle
    {grimoire_pageGiftDescription(leftPlant, ThirdCharacter)}#leftPageDescription
    {grimoire_pageSubtitle(leftPlant, FourthCharacter, Backpack)}#leftPageSubtitle
    {grimoire_pageGiftDescription(leftPlant, FourthCharacter)}#leftPageDescription
    {grimoire_pageSubtitle(leftPlant, FifthCharacter, Backpack)}#leftPageSubtitle
    {grimoire_pageGiftDescription(leftPlant, FifthCharacter)}#leftPageDescription
    //Recupero Franco
    {grimoire_pageSubtitle(leftPlant, Franco, Backpack)}#leftPageSubtitle

    //Descrizione generale pagina destra
    {grimoire_plantsDescription(rightPlant)}#rightPageDescription

    //Sottotitoli
    //Utilizzo in cucina
    {grimoire_pageSubtitle(rightPlant, FirstCharacter, Kitchen)}#rightPageSubtitle
    {grimoire_pageSubtitle(rightPlant, SecondCharacter, Kitchen)}#rightPageSubtitle
    {grimoire_pageSubtitle(rightPlant, ThirdCharacter, Kitchen)}#rightPageSubtitle
    {grimoire_pageSubtitle(rightPlant, FourthCharacter, Kitchen)}#rightPageSubtitle
    {grimoire_pageSubtitle(rightPlant, FifthCharacter, Kitchen)}#rightPageSubtitle
    //Dono
    {grimoire_pageSubtitle(rightPlant, FirstCharacter, Backpack)}#rightPageSubtitle
    {grimoire_pageGiftDescription(rightPlant, FirstCharacter)}#rightPageDescription
    {grimoire_pageSubtitle(rightPlant, SecondCharacter, Backpack)}#rightPageSubtitle
    {grimoire_pageGiftDescription(rightPlant, SecondCharacter)}#rightPageDescription
    {grimoire_pageSubtitle(rightPlant, ThirdCharacter, Backpack)}#rightPageSubtitle
    {grimoire_pageGiftDescription(rightPlant, ThirdCharacter)}#rightPageDescription
    {grimoire_pageSubtitle(rightPlant, FourthCharacter, Backpack)}#rightPageSubtitle
    {grimoire_pageGiftDescription(rightPlant, FourthCharacter)}#rightPageDescription
    {grimoire_pageSubtitle(rightPlant, FifthCharacter, Backpack)}#rightPageSubtitle
    {grimoire_pageGiftDescription(rightPlant, FifthCharacter)}#rightPageDescription
    //Recupero Franco
    {grimoire_pageSubtitle(rightPlant, Franco, Backpack)}#rightPageSubtitle



    //Tasti precedenti
    + {leftPlant == BastoneDellOzioso} [{plantsNameTranslator(BarbaDellInciampo)}#bookmark:previous]
        -> grimoire_greenhouse_thirdLevel (BaccaDellaAddolorata, BarbaDellInciampo)
    
    + {leftPlant == CantoDelleCompagne} [{plantsNameTranslator(BrinaDellImpossibile)}#bookmark:previous]
        -> grimoire_greenhouse_thirdLevel (BastoneDellOzioso, BrinaDellImpossibile)
    
    + {leftPlant == EderaDelleAmanti} [{plantsNameTranslator(CardoAspinato)}#bookmark:previous]
        -> grimoire_greenhouse_thirdLevel (CantoDelleCompagne, CardoAspinato)
    
    + {leftPlant == FalsaPalude} [{plantsNameTranslator(ErbaLiccia)}#bookmark:previous]
        -> grimoire_greenhouse_thirdLevel (EderaDelleAmanti, ErbaLiccia)
    
    + {leftPlant == LicheneDegliAbissi} [{plantsNameTranslator(LanaNotturna)}#bookmark:previous]
        -> grimoire_greenhouse_thirdLevel (FalsaPalude, LanaNotturna)

    + {leftPlant == Olobino} [{plantsNameTranslator(NonTiScordarDiTe)}#bookmark:previous]
        -> grimoire_greenhouse_thirdLevel (LicheneDegliAbissi, NonTiScordarDiTe)

    + {leftPlant == universalIngredient} [{plantsNameTranslator(LaSpazzata)}#bookmark:previous]
        -> grimoire_greenhouse_thirdLevel (Olobino, LaSpazzata)
    


    //Tasti seguenti
    + {leftPlant == BaccaDellaAddolorata} [{plantsNameTranslator(BastoneDellOzioso)}#bookmark:next]
        -> grimoire_greenhouse_thirdLevel (BastoneDellOzioso, BrinaDellImpossibile)
    
    + {leftPlant == BastoneDellOzioso} [{plantsNameTranslator(CantoDelleCompagne)}#bookmark:next]
        -> grimoire_greenhouse_thirdLevel (CantoDelleCompagne, CardoAspinato)
    
    + {leftPlant == CantoDelleCompagne} [{plantsNameTranslator(EderaDelleAmanti)}#bookmark:next]
       -> grimoire_greenhouse_thirdLevel (EderaDelleAmanti, ErbaLiccia)
    
    + {leftPlant == EderaDelleAmanti} [{plantsNameTranslator(FalsaPalude)}#bookmark:next]
        -> grimoire_greenhouse_thirdLevel (FalsaPalude, LanaNotturna)
    
    + {leftPlant == FalsaPalude} [{plantsNameTranslator(LicheneDegliAbissi)}#bookmark:next]
        -> grimoire_greenhouse_thirdLevel (LicheneDegliAbissi, NonTiScordarDiTe)
    
    + {leftPlant == LicheneDegliAbissi} [{plantsNameTranslator(Olobino)}#bookmark:next]
        -> grimoire_greenhouse_thirdLevel (Olobino, LaSpazzata)

    + {leftPlant == Olobino} [{plantsNameTranslator(universalIngredient)}#bookmark:next]
        -> grimoire_greenhouse_thirdLevel (universalIngredient, Hidden)


    + [Index #bookmark:index]
        -> grimoire
    + [Piante #bookmark:secondLevel]
        -> grimoire_greenhouse
    - 
        -> top    


=== grimoire_greenhouse_thirdLevel_gifts_and_ingredients (leftPlant, rightPlant)
- (top)

    @grimoireGreenhousePages#leftPageTitle:{plantsNameTranslator(leftPlant)}#leftPageStatus:{grimoire_pageStatus(leftPlant)}#leftPagePlant:{leftPlant}#rightPageTitle:{plantsNameTranslator(rightPlant)}#rightPageStatus:{grimoire_pageStatus(rightPlant)}#rightPagePlant:{rightPlant}

    //Descrizione generale pagina sinistra
    {grimoire_plantsDescription(leftPlant)}#leftPageDescription

    //Sottotitoli
    //Utilizzo in cucina
    {grimoire_pageSubtitle(leftPlant, FirstCharacter, Kitchen)}#leftPageSubtitle
    {grimoire_pageSubtitle(leftPlant, SecondCharacter, Kitchen)}#leftPageSubtitle
    {grimoire_pageSubtitle(leftPlant, ThirdCharacter, Kitchen)}#leftPageSubtitle
    {grimoire_pageSubtitle(leftPlant, FourthCharacter, Kitchen)}#leftPageSubtitle
    {grimoire_pageSubtitle(leftPlant, FifthCharacter, Kitchen)}#leftPageSubtitle
    //Dono
    {grimoire_pageSubtitle(leftPlant, FirstCharacter, Backpack)}#leftPageSubtitle
    {grimoire_pageGiftDescription(leftPlant, FirstCharacter)}#leftPageDescription
    {grimoire_pageSubtitle(leftPlant, SecondCharacter, Backpack)}#leftPageSubtitle
    {grimoire_pageGiftDescription(leftPlant, SecondCharacter)}#leftPageDescription
    {grimoire_pageSubtitle(leftPlant, ThirdCharacter, Backpack)}#leftPageSubtitle
    {grimoire_pageGiftDescription(leftPlant, ThirdCharacter)}#leftPageDescription
    {grimoire_pageSubtitle(leftPlant, FourthCharacter, Backpack)}#leftPageSubtitle
    {grimoire_pageGiftDescription(leftPlant, FourthCharacter)}#leftPageDescription
    {grimoire_pageSubtitle(leftPlant, FifthCharacter, Backpack)}#leftPageSubtitle
    {grimoire_pageGiftDescription(leftPlant, FifthCharacter)}#leftPageDescription
    //Recupero Franco
    {grimoire_pageSubtitle(leftPlant, Franco, Backpack)}#leftPageSubtitle

        + {backpack_findedGifts has leftPlant}[{plantsNameTranslator(leftPlant)} #page:{grimoire_statusGiftablePlants(leftPlant, left)}]
            ~ grimoire_chosenPlant = leftPlant
            ~ backpack_findedGifts -= leftPlant
            @grimoireClose
        
        ->->


    //Descrizione generale pagina destra
    {grimoire_plantsDescription(rightPlant)}#rightPageDescription

    //Sottotitoli
    //Utilizzo in cucina
    {grimoire_pageSubtitle(rightPlant, FirstCharacter, Kitchen)}#rightPageSubtitle
    {grimoire_pageSubtitle(rightPlant, SecondCharacter, Kitchen)}#rightPageSubtitle
    {grimoire_pageSubtitle(rightPlant, ThirdCharacter, Kitchen)}#rightPageSubtitle
    {grimoire_pageSubtitle(rightPlant, FourthCharacter, Kitchen)}#rightPageSubtitle
    {grimoire_pageSubtitle(rightPlant, FifthCharacter, Kitchen)}#rightPageSubtitle
    //Dono
    {grimoire_pageSubtitle(rightPlant, FirstCharacter, Backpack)}#rightPageSubtitle
    {grimoire_pageGiftDescription(rightPlant, FirstCharacter)}#rightPageDescription
    {grimoire_pageSubtitle(rightPlant, SecondCharacter, Backpack)}#rightPageSubtitle
    {grimoire_pageGiftDescription(rightPlant, SecondCharacter)}#rightPageDescription
    {grimoire_pageSubtitle(rightPlant, ThirdCharacter, Backpack)}#rightPageSubtitle
    {grimoire_pageGiftDescription(rightPlant, ThirdCharacter)}#rightPageDescription
    {grimoire_pageSubtitle(rightPlant, FourthCharacter, Backpack)}#rightPageSubtitle
    {grimoire_pageGiftDescription(rightPlant, FourthCharacter)}#rightPageDescription
    {grimoire_pageSubtitle(rightPlant, FifthCharacter, Backpack)}#rightPageSubtitle
    {grimoire_pageGiftDescription(rightPlant, FifthCharacter)}#rightPageDescription
    //Recupero Franco
    {grimoire_pageSubtitle(rightPlant, Franco, Backpack)}#rightPageSubtitle

        + {backpack_findedGifts has rightPlant}[{plantsNameTranslator(rightPlant)} #page:{grimoire_statusGiftablePlants(rightPlant, right)}]
            ~ grimoire_chosenPlant = rightPlant
            ~ backpack_findedGifts -= rightPlant
            @grimoireClose
        
        ->->

    //Tasti precedenti
    + {leftPlant == BastoneDellOzioso} [{plantsNameTranslator(BarbaDellInciampo)}#bookmark:previous]
        -> grimoire_greenhouse_thirdLevel_gifts_and_ingredients (BaccaDellaAddolorata, BarbaDellInciampo)
    
    + {leftPlant == CantoDelleCompagne} [{plantsNameTranslator(BrinaDellImpossibile)}#bookmark:previous]
        -> grimoire_greenhouse_thirdLevel_gifts_and_ingredients (BastoneDellOzioso, BrinaDellImpossibile)
    
    + {leftPlant == EderaDelleAmanti} [{plantsNameTranslator(CardoAspinato)}#bookmark:previous]
        -> grimoire_greenhouse_thirdLevel_gifts_and_ingredients (CantoDelleCompagne, CardoAspinato)
    
    + {leftPlant == FalsaPalude} [{plantsNameTranslator(ErbaLiccia)}#bookmark:previous]
        -> grimoire_greenhouse_thirdLevel_gifts_and_ingredients (EderaDelleAmanti, ErbaLiccia)
    
    + {leftPlant == LicheneDegliAbissi} [{plantsNameTranslator(LanaNotturna)}#bookmark:previous]
        -> grimoire_greenhouse_thirdLevel_gifts_and_ingredients (FalsaPalude, LanaNotturna)

    + {leftPlant == Olobino} [{plantsNameTranslator(NonTiScordarDiTe)}#bookmark:previous]
        -> grimoire_greenhouse_thirdLevel_gifts_and_ingredients (LicheneDegliAbissi, NonTiScordarDiTe)

    + {leftPlant == universalIngredient} [{plantsNameTranslator(LaSpazzata)}#bookmark:previous]
        -> grimoire_greenhouse_thirdLevel_gifts_and_ingredients (Olobino, LaSpazzata)
    


    //Tasti seguenti
    + {leftPlant == BaccaDellaAddolorata} [{plantsNameTranslator(BastoneDellOzioso)}#bookmark:next]
        -> grimoire_greenhouse_thirdLevel_gifts_and_ingredients (BastoneDellOzioso, BrinaDellImpossibile)
    
    + {leftPlant == BastoneDellOzioso} [{plantsNameTranslator(CantoDelleCompagne)}#bookmark:next]
        -> grimoire_greenhouse_thirdLevel_gifts_and_ingredients (CantoDelleCompagne, CardoAspinato)
    
    + {leftPlant == CantoDelleCompagne} [{plantsNameTranslator(EderaDelleAmanti)}#bookmark:next]
       -> grimoire_greenhouse_thirdLevel_gifts_and_ingredients (EderaDelleAmanti, ErbaLiccia)
    
    + {leftPlant == EderaDelleAmanti} [{plantsNameTranslator(FalsaPalude)}#bookmark:next]
        -> grimoire_greenhouse_thirdLevel_gifts_and_ingredients (FalsaPalude, LanaNotturna)
    
    + {leftPlant == FalsaPalude} [{plantsNameTranslator(LicheneDegliAbissi)}#bookmark:next]
        -> grimoire_greenhouse_thirdLevel_gifts_and_ingredients (LicheneDegliAbissi, NonTiScordarDiTe)
    
    + {leftPlant == LicheneDegliAbissi} [{plantsNameTranslator(Olobino)}#bookmark:next]
        -> grimoire_greenhouse_thirdLevel_gifts_and_ingredients (Olobino, LaSpazzata)

    + {leftPlant == Olobino} [{plantsNameTranslator(universalIngredient)}#bookmark:next]
        -> grimoire_greenhouse_thirdLevel_gifts_and_ingredients (universalIngredient, Hidden)



    + [Piante #bookmark:secondLevel]
        -> grimoire_greenhouse_gifts_and_ingredient
    
    + [Close #bookmark:close]
        @grimoireClose
        ->->    
    - 
        -> top    
