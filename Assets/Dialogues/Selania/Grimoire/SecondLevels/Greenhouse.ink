=== grimoire_greenhouse
    @grimoireGreenhouse

    + {greenhouse_findedCultivables has BaccaDellaAddolorata} [BaccaDellaAddolorata #status:{grimoire_statusPlants(BaccaDellaAddolorata)}]
        -> grimoire_greenhouse_thirdLevel (BaccaDellaAddolorata, BarbaDellInciampo)

    + {greenhouse_findedCultivables has BarbaDellInciampo} [BarbaDellInciampo #status:{grimoire_statusPlants(BarbaDellInciampo)}]
        -> grimoire_greenhouse_thirdLevel (BaccaDellaAddolorata, BarbaDellInciampo)

    + {greenhouse_findedCultivables has BastoneDellOzioso} [BastoneDellOzioso #status:{grimoire_statusPlants(BastoneDellOzioso)}]
        -> grimoire_greenhouse_thirdLevel (BastoneDellOzioso, BrinaDellImpossibile)

    + {greenhouse_findedCultivables has BrinaDellImpossibile} [BrinaDellImpossibile #status:{grimoire_statusPlants(BrinaDellImpossibile)}]
        -> grimoire_greenhouse_thirdLevel (BastoneDellOzioso, BrinaDellImpossibile)

    + {greenhouse_findedCultivables has CantoDelleCompagne} [CantoDelleCompagne #status:{grimoire_statusPlants(CantoDelleCompagne)}]
        -> grimoire_greenhouse_thirdLevel (CantoDelleCompagne, CardoAspinato)

    + {greenhouse_findedCultivables has CardoAspinato} [CardoAspinato #status:{grimoire_statusPlants(CardoAspinato)}]
        -> grimoire_greenhouse_thirdLevel (CantoDelleCompagne, CardoAspinato)

    + {greenhouse_findedCultivables has EderaDelleAmanti} [EderaDelleAmanti #status:{grimoire_statusPlants(EderaDelleAmanti)}]
        -> grimoire_greenhouse_thirdLevel (EderaDelleAmanti, ErbaLiccia)

    + {greenhouse_findedCultivables has ErbaLiccia} [ErbaLiccia #status:{grimoire_statusPlants(ErbaLiccia)}]
        -> grimoire_greenhouse_thirdLevel (EderaDelleAmanti, ErbaLiccia)

    + {greenhouse_findedCultivables has FalsaPalude} [FalsaPalude #status:{grimoire_statusPlants(FalsaPalude)}]
        -> grimoire_greenhouse_thirdLevel (FalsaPalude, LanaNotturna)

    + {greenhouse_findedCultivables has LanaNotturna} [LanaNotturna #status:{grimoire_statusPlants(LanaNotturna)}]
        -> grimoire_greenhouse_thirdLevel (FalsaPalude, LanaNotturna)

    + {greenhouse_findedCultivables has LicheneDegliAbissi} [LicheneDegliAbissi #status:{grimoire_statusPlants(LicheneDegliAbissi)}]
        -> grimoire_greenhouse_thirdLevel (LicheneDegliAbissi, NonTiScordarDiTe)

    + {greenhouse_findedCultivables has NonTiScordarDiTe} [NonTiScordarDiTe #status:{grimoire_statusPlants(NonTiScordarDiTe)}]
        -> grimoire_greenhouse_thirdLevel (LicheneDegliAbissi, NonTiScordarDiTe)

    + {greenhouse_findedCultivables has Olobino} [Olobino #status:{grimoire_statusPlants(Olobino)}]
        -> grimoire_greenhouse_thirdLevel (Olobino, Spazzata)

    + {greenhouse_findedCultivables has Spazzata} [Spazzata #status:{grimoire_statusPlants(Spazzata)}]
        -> grimoire_greenhouse_thirdLevel (Olobino, Spazzata)

    + {greenhouse_findedCultivables has universalIngredient} [universalIngredient #status:{grimoire_statusPlants(universalIngredient)}]
        -> grimoire_greenhouse_thirdLevel (universalIngredient, Hidden)

    + [Index #bookmark:index]
    -> grimoire
    -
    -> grimoire_greenhouse



//Logica per quando aggiungo ingredienti in cucina o faccio un dono
=== grimoire_greenhouse_gifts_and_ingredient
    @grimoireGreenhouse

    //Prima di tutto per sicurezza svuoto la variabile legata alle scelte
    ~ grimoire_chosenPlant = ()

    + {greenhouse_findedCultivables has BaccaDellaAddolorata} [BaccaDellaAddolorata #status:{grimoire_statusPlants(BaccaDellaAddolorata)}]
        -> grimoire_greenhouse_thirdLevel_gifts_and_ingredients (BaccaDellaAddolorata, BarbaDellInciampo)

    + {greenhouse_findedCultivables has BarbaDellInciampo} [BarbaDellInciampo #status:{grimoire_statusPlants(BarbaDellInciampo)}]
        -> grimoire_greenhouse_thirdLevel_gifts_and_ingredients (BaccaDellaAddolorata, BarbaDellInciampo)

    + {greenhouse_findedCultivables has BastoneDellOzioso} [BastoneDellOzioso #status:{grimoire_statusPlants(BastoneDellOzioso)}]
        -> grimoire_greenhouse_thirdLevel_gifts_and_ingredients (BastoneDellOzioso, BrinaDellImpossibile)

    + {greenhouse_findedCultivables has BrinaDellImpossibile} [BrinaDellImpossibile #status:{grimoire_statusPlants(BrinaDellImpossibile)}]
        -> grimoire_greenhouse_thirdLevel_gifts_and_ingredients (BastoneDellOzioso, BrinaDellImpossibile)

    + {greenhouse_findedCultivables has CantoDelleCompagne} [CantoDelleCompagne #status:{grimoire_statusPlants(CantoDelleCompagne)}]
        -> grimoire_greenhouse_thirdLevel_gifts_and_ingredients (CantoDelleCompagne, CardoAspinato)

    + {greenhouse_findedCultivables has CardoAspinato} [CardoAspinato #status:{grimoire_statusPlants(CardoAspinato)}]
        -> grimoire_greenhouse_thirdLevel_gifts_and_ingredients (CantoDelleCompagne, CardoAspinato)

    + {greenhouse_findedCultivables has EderaDelleAmanti} [EderaDelleAmanti #status:{grimoire_statusPlants(EderaDelleAmanti)}]
        -> grimoire_greenhouse_thirdLevel_gifts_and_ingredients (EderaDelleAmanti, ErbaLiccia)

    + {greenhouse_findedCultivables has ErbaLiccia} [ErbaLiccia #status:{grimoire_statusPlants(ErbaLiccia)}]
        -> grimoire_greenhouse_thirdLevel_gifts_and_ingredients (EderaDelleAmanti, ErbaLiccia)

    + {greenhouse_findedCultivables has FalsaPalude} [FalsaPalude #status:{grimoire_statusPlants(FalsaPalude)}]
        -> grimoire_greenhouse_thirdLevel_gifts_and_ingredients (FalsaPalude, LanaNotturna)

    + {greenhouse_findedCultivables has LanaNotturna} [LanaNotturna #status:{grimoire_statusPlants(LanaNotturna)}]
        -> grimoire_greenhouse_thirdLevel_gifts_and_ingredients (FalsaPalude, LanaNotturna)

    + {greenhouse_findedCultivables has LicheneDegliAbissi} [LicheneDegliAbissi #status:{grimoire_statusPlants(LicheneDegliAbissi)}]
        -> grimoire_greenhouse_thirdLevel_gifts_and_ingredients (LicheneDegliAbissi, NonTiScordarDiTe)

    + {greenhouse_findedCultivables has NonTiScordarDiTe} [NonTiScordarDiTe #status:{grimoire_statusPlants(NonTiScordarDiTe)}]
        -> grimoire_greenhouse_thirdLevel_gifts_and_ingredients (LicheneDegliAbissi, NonTiScordarDiTe)

    + {greenhouse_findedCultivables has Olobino} [Olobino #status:{grimoire_statusPlants(Olobino)}]
        -> grimoire_greenhouse_thirdLevel_gifts_and_ingredients (Olobino, Spazzata)

    + {greenhouse_findedCultivables has Spazzata} [Spazzata #status:{grimoire_statusPlants(Spazzata)}]
        -> grimoire_greenhouse_thirdLevel_gifts_and_ingredients (Olobino, Spazzata)

    + {greenhouse_findedCultivables has universalIngredient} [universalIngredient #status:{grimoire_statusPlants(universalIngredient)}]
        -> grimoire_greenhouse_thirdLevel_gifts_and_ingredients (universalIngredient, Hidden)

    + [Close #bookmark:close]
        @grimoireClose
        ->->
    -
    -> grimoire_greenhouse_gifts_and_ingredient