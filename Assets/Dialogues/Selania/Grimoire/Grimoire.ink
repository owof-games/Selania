=== grimoire
    @grimoire1 #franco:{strings_francoMissions()} #achievement:oneRewrite:{achievements_oneRewrite_actualValue}:{achievements_oneRewrite_maxValue} #achievement:threeRewrite:{achievements_threeRewrite_actualValue}:{achievements_threeRewrite_maxValue} #achievement:fiveRewrite:{achievements_fiveRewrite_actualValue}:{achievements_fiveRewrite_maxValue} #achievement:fullKitchen:{achievements_fullKitchen_actualValue}:{achievements_fullKitchen_maxValue} #achievement:onePerfectIngredient:{achievements_onePerfectIngredient_actualValue}:{achievements_onePerfectIngredient_maxValue} #achievement:fivePerfectIngredients:{achievements_fivePerfectIngredients_actualValue}:{achievements_fivePerfectIngredients_maxValue} #achievement:onePerfectGift:{achievements_onePerfectGift_actualValue}:{achievements_onePerfectGift_maxValue} #achievement:fivePerfectGifts:{achievements_fivePerfectGifts_actualValue}:{achievements_fivePerfectGifts_maxValue} #achievement:fullFranco:{achievements_fullFranco_actualValue}:{achievements_fullFranco_maxValue} #achievement:allSigils:{achievements_allSigils_actualValue}:{achievements_allSigils_maxValue} #achievement:allLetters:{achievements_allLetters_actualValue}:{achievements_allLetters_maxValue} #achievement:fullGreenhouse:{achievements_fullGreenhouse_actualValue}:{achievements_fullGreenhouse_maxValue} #achievement:goodListener:{achievements_goodListener_actualValue}:{achievements_goodListener_maxValue} #achievement:fullLore:{achievements_fullLore_actualValue}:{achievements_fullLore_maxValue} #achievement:goodReader:{achievements_goodReader_actualValue}:{achievements_goodReader_maxValue}

        //PNG Principali
        + {grimoire_firstChar != ()}[FirstCharacter]
            -> grimoire_firstCharacter

        + {grimoire_secondChar != ()}[SecondCharacter]
            -> grimoire_secondCharacter

        + {grimoire_thirdChar != ()}[ThirdCharacter]
            -> grimoire_thirdCharacter

        + {grimoire_fourthChar != ()}[FourthCharacter]
            -> grimoire_fourthCharacter

        + {grimoire_fifthChar != ()}[FifthCharacter]
            -> grimoire_fifthCharacter

        //PNG supporto
        + {grimoire_witch != ()}[Witch]
            -> grimoire_witchRecap

        + {grimoire_franco != ()}[Franco]
            -> grimoire_francoRecap

        //Guide
        + {greenhouse_findedCultivables != ()}[Greenhouse]
            -> grimoire_greenhouse

        + {glyph_discoveredSigils != ()}[Sigils]
            -> grimoire_sigils

        + [Rules]
            -> grimoire_rules

        + {grimoire_appendices != ()} [Appendices]
            -> grimoire_appendicesCollection
        -


-> grimoire

/*****************************************
        
            Secondi livelli

*****************************************/



=== grimoire_firstCharacter

    + [Index #bookmark:index]
        -> grimoire
        -
        -> grimoire_firstCharacter


=== grimoire_secondCharacter

    + [Index #bookmark:index]
        -> grimoire
        -
        -> grimoire_secondCharacter



=== grimoire_thirdCharacter

    + [Index #bookmark:index]
        -> grimoire
        -
        -> grimoire_thirdCharacter



=== grimoire_fourthCharacter

    + [Index #bookmark:index]
        -> grimoire
        -
        -> grimoire_fourthCharacter



=== grimoire_fifthCharacter

    + [Index #bookmark:index]
        -> grimoire
        -
        -> grimoire_fifthCharacter



=== grimoire_witchRecap

    + [Index #bookmark:index]
        -> grimoire
        -
        -> grimoire_witchRecap



=== grimoire_francoRecap

    + [Index #bookmark:index]
        -> grimoire
        -
        -> grimoire_francoRecap


=== grimoire_greenhouse
    @grimoireGreenhouse

    + {greenhouse_findedCultivables has BaccaDellaAddolorata} [BaccaDellaAddolorata #status:{grimoire_statusPlants(BaccaDellaAddolorata)}]

    + {greenhouse_findedCultivables has BarbaDellInciampo} [BarbaDellInciampo #status:{grimoire_statusPlants(BarbaDellInciampo)}]

    + {greenhouse_findedCultivables has BastoneDellOzioso} [BastoneDellOzioso #status:{grimoire_statusPlants(BastoneDellOzioso)}]

    + {greenhouse_findedCultivables has BrinaDellImpossibile} [BrinaDellImpossibile #status:{grimoire_statusPlants(BrinaDellImpossibile)}]

    + {greenhouse_findedCultivables has CantoDelleCompagne} [CantoDelleCompagne #status:{grimoire_statusPlants(CantoDelleCompagne)}]

    + {greenhouse_findedCultivables has CardoAspinato} [CardoAspinato #status:{grimoire_statusPlants(CardoAspinato)}]

    + {greenhouse_findedCultivables has EderaDelleAmanti} [EderaDelleAmanti #status:{grimoire_statusPlants(EderaDelleAmanti)}]

    + {greenhouse_findedCultivables has ErbaLiccia} [ErbaLiccia #status:{grimoire_statusPlants(ErbaLiccia)}]

    + {greenhouse_findedCultivables has FalsaPalude} [FalsaPalude #status:{grimoire_statusPlants(FalsaPalude)}]

    + {greenhouse_findedCultivables has LanaNotturna} [LanaNotturna #status:{grimoire_statusPlants(LanaNotturna)}]

    + {greenhouse_findedCultivables has LicheneDegliAbissi} [LicheneDegliAbissi #status:{grimoire_statusPlants(LicheneDegliAbissi)}]

    + {greenhouse_findedCultivables has NonTiScordarDiTe} [NonTiScordarDiTe #status:{grimoire_statusPlants(NonTiScordarDiTe)}]

    + {greenhouse_findedCultivables has Olobino} [Olobino #status:{grimoire_statusPlants(Olobino)}]

    + {greenhouse_findedCultivables has LaSpazzata} [LaSpazzata #status:{grimoire_statusPlants(LaSpazzata)}]

    + [Index #bookmark:index]
    -> grimoire
    -
    -> grimoire_greenhouse



=== grimoire_sigils
    @grimoireSigils

    //Sigilli a dominante fuoco
    + {glyph_fireAirSigils ^ glyph_discoveredSigils != ()}[{Fire}{Air} #enabled:grimoire_statusSigils(glyph_fireAirSigils)]
        
    + {glyph_fireWaterSigils ^ glyph_discoveredSigils != ()}[{Fire}{Water} #enabled:grimoire_statusSigils(glyph_fireWaterSigils)]
        
    + {glyph_fireEarthSigils ^ glyph_discoveredSigils != ()}[{Fire}{Earth} #enabled:grimoire_statusSigils(glyph_fireEarthSigils)]
        
    + {glyph_fireAetherSigils ^ glyph_discoveredSigils != ()}[{Fire}{Aether} #enabled:grimoire_statusSigils(glyph_fireAetherSigils)]

    //Sigilli a dominante aria    
    + {glyph_airFireSigils ^ glyph_discoveredSigils != ()}[{Air}{Fire} #enabled:grimoire_statusSigils(glyph_airFireSigils)]
        
    + {glyph_airWaterSigils ^ glyph_discoveredSigils != ()}[{Air}{Water} #enabled:grimoire_statusSigils(glyph_airWaterSigils)]
        
    + {glyph_airEarthSigils ^ glyph_discoveredSigils != ()}[{Air}{Earth} #enabled:grimoire_statusSigils(glyph_airEarthSigils)]
        
    + {glyph_airAetherSigils ^ glyph_discoveredSigils != ()}[{Air}{Aether} #enabled:grimoire_statusSigils(glyph_airAetherSigils)]

    //Sigilli a dominante acqua    
    + {glyph_WaterFireSigils ^ glyph_discoveredSigils != ()}[{Water}{Fire} #enabled:grimoire_statusSigils(glyph_WaterFireSigils)]
        
    + {glyph_WaterAirSigils ^ glyph_discoveredSigils != ()}[{Water}{Air} #enabled:grimoire_statusSigils(glyph_WaterAirSigils)]
        
    + {glyph_WaterEarthSigils ^ glyph_discoveredSigils != ()}[{Water}{Earth} #enabled:grimoire_statusSigils(glyph_WaterEarthSigils)]
        
    + {glyph_WaterAetherSigils ^ glyph_discoveredSigils != ()}[{Water}{Aether} #enabled:grimoire_statusSigils(glyph_WaterAetherSigils)]

    //Sigilli a dominante terra    
    + {glyph_earthFireSigils ^ glyph_discoveredSigils != ()}[{Earth}{Fire} #enabled:grimoire_statusSigils(glyph_earthFireSigils)]
        
    + {glyph_earthAirSigils ^ glyph_discoveredSigils != ()}[{Earth}{Air} #enabled:grimoire_statusSigils(glyph_earthAirSigils)]
        
    + {glyph_earthWaterSigils ^ glyph_discoveredSigils != ()}[{Earth}{Water} #enabled:grimoire_statusSigils(glyph_earthWaterSigils)]
        
    + {glyph_earthAetherSigils ^ glyph_discoveredSigils != ()}[{Earth}{Aether} #enabled:grimoire_statusSigils(glyph_earthAetherSigils)]

    //Sigilli a dominante spirito    
    + {glyph_aetherFireSigils ^ glyph_discoveredSigils != ()}[{Aether}{Fire} #enabled:grimoire_statusSigils(glyph_aetherFireSigils)]
        
    + {glyph_aetherAirSigils ^ glyph_discoveredSigils != ()}[{Aether}{Air} #enabled:grimoire_statusSigils(glyph_aetherAirSigils)]
        
    + {glyph_aetherWaterSigils ^ glyph_discoveredSigils != ()}[{Aether}{Water} #enabled:grimoire_statusSigils(glyph_aetherWaterSigils)]
        
    + {glyph_aetherEarthSigils ^ glyph_discoveredSigils != ()}[{Aether}{Earth} #enabled:grimoire_statusSigils(glyph_aetherEarthSigils)]
        
    + [Index #bookmark:index]
    -> grimoire
    -
    -> grimoire_sigils





=== grimoire_appendicesCollection

+ [Index #bookmark:index]
    -> grimoire
    -
    -> grimoire_appendicesCollection








// === altraPaginaGrimorio
// @comandGrimoirioSigilliSecondoLivello
// + [AirWater]
//   -> grimoireSigilThirdLevel(Air, Water, Air, Earth)

// === grimoireSigilThirdLevel(leftGlyph1, leftGlyph2, rightGlyph1, rightGlyph2)

// ~ temp leftSigilName = getTwoComponentsSigilName("{leftGlyph1}{leftGlyph2}")
// ~ temp rightSigilName = getTwoComponentsSigilName(rightGlyph1, rightGlyph2)

// @grimoireSigilPages #leftPageTitle:{leftSigilName} #leftPageDescription:descrizione #leftPageGlyph1:Air #leftPageGlyph2:Water #rightPageTitle:{rightSigilName} #rightPageDescription: #rightPageGlyph1:Air #rightPageGlyph2:Fire
// + [Strappo #position:left2 #glyph3:Fire #firstLine: #secondLine:seconda #thirdLine:]
// + [Index #bookmark:index]
//  -> grimoire
// + [Sigilli #bookmark:secondLevel]
//  -> grimoire_sigils
// + [Vaso #bookmark:previous]
//  
// + [Increspatura #bookmark:next]
//  
