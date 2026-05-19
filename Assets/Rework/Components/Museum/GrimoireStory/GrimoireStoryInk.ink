/*
 * MUSEUM - GRIMOIRE STORY
*/

LIST listCharacters = PG

LIST Items = Item1

VAR contentsRoom1 = (PG, Item1)

VAR settings_gamerMode = true

LIST ink_possibileLevels = ink_empty, ink_low, ink_normal, ink_medium, ink_high
VAR firstChar_InkLevel = ink_empty
VAR secondChar_InkLevel = ink_empty
VAR thirdChar_InkLevel = ink_empty
VAR fourthChar_InkLevel = ink_empty
VAR fifthChar_InkLevel = ink_empty

VAR firstChar_relationshipIndicator = 0
VAR secondChar_relationshipIndicator = 0


VAR firstChar_aether        = 0.00
VAR firstChar_earth         = 0.00
VAR firstChar_air           = 0.00
VAR firstChar_water         = 0.00
VAR firstChar_fire          = 0.00
VAR firstChar_last_aether   = 0.00
VAR firstChar_last_earth    = 0.00
VAR firstChar_last_air      = 0.00
VAR firstChar_last_water    = 0.00
VAR firstChar_last_fire     = 0.00

VAR secondChar_aether        = 0.00
VAR secondChar_earth         = 0.00
VAR secondChar_air           = 0.00
VAR secondChar_water         = 0.00
VAR secondChar_fire          = 0.00
VAR secondChar_last_aether   = 0.00
VAR secondChar_last_earth    = 0.00
VAR secondChar_last_air      = 0.00
VAR secondChar_last_water    = 0.00
VAR secondChar_last_fire     = 0.00

/* ---------------------------------
                
LISTE COMBINATORIE DEI SIGILLI
                
----------------------------------*/

LIST allGlyphs = Fire, Air, Water, Earth, Aether

//Lista di tutti i possibili sigilli
    LIST glyph_allSigils = 
       
        FireAirWater, FireAirEarth, FireAirAether,
        FireWaterEarth, FireWaterAether, FireWaterAir,
        FireEarthWater, FireEarthAether, FireEarthAir,
        FireAetherWater, FireAetherEarth, FireAetherAir,
        
        AirFireEarth, AirFireAether, AirFireWater,
        AirWaterEarth, AirWaterAether, AirWaterFire,
        AirEarthAether, AirEarthWater, AirEarthFire,
        AirAetherEarth, AirAetherWater, AirAetherFire,
        
        WaterFireEarth, WaterFireAether, WaterFireAir, 
        WaterAirEarth, WaterAirAether, WaterAirFire,
        WaterEarthAether, WaterEarthAir, WaterEarthFire,
        WaterAetherEarth, WaterAetherAir, WaterAetherFire,
        
        EarthFireAether, EarthFireWater, EarthFireAir, 
        EarthAirAether, EarthAirWater, EarthAirFire,
        EarthWaterAether, EarthWaterAir, EarthWaterFire,
        EarthAetherWater, EarthAetherAir, EarthAetherFire,
        
        AetherFireEarth, AetherFireWater, AetherFireAir,
        AetherAirEarth, AetherAirWater, AetherAirFire,
        AetherWaterEarth, AetherWaterAir, AetherWaterFire,
        AetherEarthWater, AetherEarthAir, AetherEarthFire
        
//Raggruppamento dei sigilli per dominante (es: per gestione pagine libro)

    //Varianti a dominante Fire
    VAR glyph_fireAirSigils = (FireAirWater, FireAirEarth, FireAirAether)
    VAR glyph_fireWaterSigils = (FireWaterEarth, FireWaterAether, FireWaterAir)
    VAR glyph_fireEarthSigils = (FireEarthWater, FireEarthAether, FireEarthAir)
    VAR glyph_fireAetherSigils = (FireAetherWater, FireAetherEarth, FireAetherAir)
    
    //Varianti a dominante Air
    VAR glyph_airFireSigils = (AirFireEarth, AirFireAether, AirFireWater)
    VAR glyph_airWaterSigils = (AirWaterEarth, AirWaterAether, AirWaterFire)
    VAR glyph_airEarthSigils = (AirEarthAether, AirEarthWater, AirEarthFire)
    VAR glyph_airAetherSigils = (AirAetherEarth, AirAetherWater, AirAetherFire)
    
    //Varianti a dominate Water
    VAR glyph_WaterFireSigils = (WaterFireEarth, WaterFireAether, WaterFireAir)
    VAR glyph_WaterAirSigils = (WaterAirEarth, WaterAirAether, WaterAirFire)
    VAR glyph_WaterEarthSigils = (WaterEarthAether, WaterEarthAir, WaterEarthFire)
    VAR glyph_WaterAetherSigils = (WaterAetherEarth, WaterAetherAir, WaterAetherFire)
    
    //Varianti a dominante Earth
    VAR glyph_earthFireSigils = (EarthFireAether, EarthFireWater, EarthFireAir)
    VAR glyph_earthAirSigils =  (EarthAirAether, EarthAirWater, EarthAirFire)
    VAR glyph_earthWaterSigils = (EarthWaterAether, EarthWaterAir, EarthWaterFire)
    VAR glyph_earthAetherSigils = (EarthAetherWater, EarthAetherAir, EarthAetherFire)
    
    //Varianti a dominante Aether
    VAR glyph_aetherFireSigils = (AetherFireEarth, AetherFireWater, AetherFireAir)
    VAR glyph_aetherAirSigils = (AetherAirEarth, AetherAirWater, AetherAirFire)
    VAR glyph_aetherWaterSigils = (AetherWaterEarth, AetherWaterAir, AetherWaterFire)
    VAR glyph_aetherEarthSigils = (AetherEarthWater, AetherEarthAir, AetherEarthFire)

//Raggruppamento dei sigilli per posizione (es: FirstFire, SecondFire, ThirdFire)
    VAR glyph_firstFire = (FireAirWater, FireAirEarth, FireAirAether, FireWaterEarth, FireWaterAether, FireWaterAir, FireEarthWater, FireEarthAether, FireEarthAir, FireAetherWater, FireAetherEarth, FireAetherAir)
    VAR glyph_secondFire = (AirFireEarth, AirFireAether, AirFireWater, WaterFireEarth, WaterFireAether, WaterFireAir, EarthFireAether, EarthFireWater, EarthFireAir, AetherFireEarth, AetherFireWater, AetherFireAir )
    VAR glyph_thirdFire = (AirWaterFire, AirEarthFire, AirAetherFire, WaterAirFire, WaterEarthFire, WaterAetherFire, EarthAirFire, EarthWaterFire, EarthAetherFire, AetherAirFire, AetherWaterFire, AetherEarthFire)


    VAR glyph_firstWater = (WaterFireEarth, WaterFireAether, WaterFireAir, WaterAirEarth, WaterAirAether, WaterAirFire, WaterEarthAether, WaterEarthAir, WaterEarthFire, WaterAetherEarth, WaterAetherAir, WaterAetherFire)
    VAR glyph_secondWater = (FireWaterEarth, FireWaterAether, FireWaterAir, AirWaterEarth, AirWaterAether, AirWaterFire, EarthWaterAether, EarthWaterAir, EarthWaterFire, AetherWaterEarth, AetherWaterAir, AetherWaterFire)
    VAR glyph_thirdWater = (FireAirWater, FireEarthWater, FireAetherWater, AirFireWater, AirEarthWater, AirAetherWater, EarthFireWater, EarthAirWater, EarthAetherWater, AetherFireWater, AetherAirWater, AetherEarthWater)


    VAR glyph_firstEarth = (EarthFireAether, EarthFireWater, EarthFireAir, EarthAirAether, EarthAirWater, EarthAirFire, EarthWaterAether, EarthWaterAir, EarthWaterFire, EarthAetherWater, EarthAetherAir, EarthAetherFire)
    VAR glyph_secondEarth = (FireEarthWater, FireEarthAether, FireEarthAir, AirEarthAether, AirEarthWater, AirEarthFire, WaterEarthAether, WaterEarthAir, WaterEarthFire, AetherEarthWater, AetherEarthAir, AetherEarthFire)
    VAR glyph_thirdEarth = (FireAirEarth, FireWaterEarth, FireAetherEarth, AirFireEarth, AirWaterEarth, AirAetherEarth, WaterFireEarth, WaterAirEarth, WaterAetherEarth, AetherFireEarth, AetherAirEarth, AetherWaterEarth)


    VAR glyph_firstAir = (AirFireEarth, AirFireAether, AirFireWater, AirWaterEarth, AirWaterAether, AirWaterFire, AirEarthAether, AirEarthWater, AirEarthFire, AirAetherEarth, AirAetherWater, AirAetherFire)
    VAR glyph_secondAir = (FireAirWater, FireAirEarth, FireAirAether, WaterAirEarth, WaterAirAether, WaterAirFire, EarthAirAether, EarthAirWater, EarthAirFire, AetherAirEarth, AetherAirWater, AetherAirFire)
    VAR glyph_thirdAir = (FireWaterAir, FireAetherAir, FireEarthAir, WaterFireAir, WaterEarthAir, WaterAetherAir, EarthFireAir, EarthWaterAir, EarthAetherAir, AetherFireAir, AetherWaterAir, AetherEarthAir)


    VAR glyph_firstAether = (AetherFireEarth, AetherFireWater, AetherFireAir, AetherAirEarth, AetherAirWater, AetherAirFire, AetherWaterEarth, AetherWaterAir, AetherWaterFire, AetherEarthWater, AetherEarthAir, AetherEarthFire)
    VAR glyph_secondAether = (FireAetherWater, FireAetherEarth, FireAetherAir, AirAetherEarth, AirAetherWater, AirAetherFire, WaterAetherEarth, WaterAetherAir, WaterAetherFire, EarthAetherWater, EarthAetherAir, EarthAetherFire)
    VAR glyph_thirdAether = (FireAirAether, FireEarthAether, FireWaterAether, AirFireAether, AirWaterAether, AirEarthAether, WaterFireAether, WaterAirAether, WaterEarthAether, EarthFireAether, EarthAirAether, EarthWaterAether)


    VAR glyph_actualActiveSigil = (WaterEarthFire)
    VAR glyph_actualSigilUses = 1

// grimoire open/close

VAR grimoire_isEnabled = false


-> start

=== start
Questo è un dialogo.
Abilito il grimorio.
~ grimoire_isEnabled = true
Il grimorio è abilitato.
~ firstChar_aether        = 5
~ firstChar_earth         = -2
~ firstChar_air           = 5
~ firstChar_water         = 9
~ firstChar_fire          = -9
~ firstChar_last_aether   = 5
~ firstChar_last_earth    = -2
~ firstChar_last_air      = 7
~ firstChar_last_water    = 9
~ firstChar_last_fire     = -9
Ho impostato aether=5, earth=-2, air=da 5 a 7, water=9, fire=-9 per Chitarra.
~ firstChar_aether        = -5
~ firstChar_earth         = 2
~ firstChar_air           = -5
~ firstChar_water         = -9
~ firstChar_fire          = 9
~ firstChar_last_aether   = -5
~ firstChar_last_earth    = 2
~ firstChar_last_air      = -7
~ firstChar_last_water    = -9
~ firstChar_last_fire     = 9
Ho invertito tutto di segno tutto per Chitarra.
Questa è la seconda riga.
E ora apro la scelta delle piante.
-> grimoire_greenhouse_in_dialogue ->
-> start

=== grimoire

    @grimoire1 #franco:Ho voglia di patatine #achievement:FirstAchievementRM:3:5 #achievement:SecondAchievementRM:0:5 #achievement:ThirdAchievementRM:5:5
    + [Greenhouse]
        -> grimoire_greenhouse
    + [Sigils]
        -> grimoire_sigils
    + [FirstCharacter]
        -> grimoire_first_character
    + [SecondCharacter]
        -> grimoire_second_character
    + [Franco]
        -> grimoire_franco
    + [Rules]
        -> grimoire_rules
    + [Appendix]
        -> grimoire_appendix
    -

    -> grimoire


=== grimoire_greenhouse
    @grimoireGreenhouse
    + {RANDOM(1, 6) <= 3} [BaccaDellaAddolorata #status:{RANDOM(1,6) <= 3:owned|missing}]
        -> grimoire_greenhouse_third
    + {RANDOM(1, 6) <= 3} [BarbaDellInciampo #status:{RANDOM(1,6) <= 3:owned|missing}]
        -> grimoire_greenhouse_third
    + {RANDOM(1, 6) <= 3} [BastoneDellOzioso #status:{RANDOM(1,6) <= 3:owned|missing}]
        -> grimoire_greenhouse_third
    + {RANDOM(1, 6) <= 3} [BrinaDellImpossibile #status:{RANDOM(1,6) <= 3:owned|missing}]
        -> grimoire_greenhouse_third
    + {RANDOM(1, 6) <= 3} [CantoDelleCompagne #status:{RANDOM(1,6) <= 3:owned|missing}]
        -> grimoire_greenhouse_third
    + {RANDOM(1, 6) <= 3} [CardoAspinato #status:{RANDOM(1,6) <= 3:owned|missing}]
        -> grimoire_greenhouse_third
    + {RANDOM(1, 6) <= 3} [EderaDelleAmanti #status:{RANDOM(1,6) <= 3:owned|missing}]
        -> grimoire_greenhouse_third
    + {RANDOM(1, 6) <= 3} [ErbaLiccia #status:{RANDOM(1,6) <= 3:owned|missing}]
        -> grimoire_greenhouse_third
    + {RANDOM(1, 6) <= 3} [FalsaPalude #status:{RANDOM(1,6) <= 3:owned|missing}]
        -> grimoire_greenhouse_third
    + {RANDOM(1, 6) <= 3} [LanaNotturna #status:{RANDOM(1,6) <= 3:owned|missing}]
        -> grimoire_greenhouse_third
    + {RANDOM(1, 6) <= 3} [LicheneDegliAbissi #status:{RANDOM(1,6) <= 3:owned|missing}]
        -> grimoire_greenhouse_third
    + {RANDOM(1, 6) <= 3} [NonTiScordarDiTe #status:{RANDOM(1,6) <= 3:owned|missing}]
        -> grimoire_greenhouse_third
    + {RANDOM(1, 6) <= 3} [Olobino #status:{RANDOM(1,6) <= 3:owned|missing}]
        -> grimoire_greenhouse_third
    + {RANDOM(1, 6) <= 3} [Spazzata #status:{RANDOM(1,6) <= 3:owned|missing}]
        -> grimoire_greenhouse_third
    + [Index #bookmark:index]
        -> grimoire


=== grimoire_greenhouse_third
    @grimoireGreenhousePages #leftPageTitle:Lana Notturna #leftPageStatus:locked #leftPagePlant:LanaNotturna #rightPageTitle:Bacca dell'Addolorata #rightPageStatus:owned #rightPagePlant:BaccaDellaAddolorata
    Lorem ipsum. #leftPageDescription
    Altro Lorem. #leftPageDescription
    Donata a Chitarra #leftPageSubtitle
    Non ha espresso particolare entusiasmo. #leftPageDescription
    Descrizione a destra #rightPageDescription
    Aggiunta cucinando con Riccio #rightPageSubtitle
    Recuperata da Franco #rightPageSubtitle
    + [Index #bookmark:index]
        -> grimoire
    + [Piante #bookmark:secondLevel]
        -> grimoire_greenhouse
    + [Pianta1 #bookmark:previous]
        -> grimoire_greenhouse_third_alt
    + [Pianta2 #bookmark:next]
        -> grimoire_greenhouse_third_alt


=== grimoire_greenhouse_third_alt
    @grimoireGreenhousePages #leftPageTitle:Lana Notturna #leftPageStatus:consumed #leftPagePlant:LanaNotturna #rightPageTitle:Bacca dell'Addolorata #rightPageStatus:hidden #rightPagePlant:BaccaDellaAddolorata
    Lorem ipsum. #leftPageDescription
    Altro Lorem. #leftPageDescription
    Donata a Chitarra #leftPageSubtitle
    Non ha espresso particolare entusiasmo. #leftPageDescription
    Descrizione a destra #rightPageDescription
    Aggiunta cucinando con Riccio #rightPageSubtitle
    Recuperata da Franco #rightPageSubtitle
    + [Index #bookmark:index]
        -> grimoire
    + [Piante #bookmark:secondLevel]
        -> grimoire_greenhouse
    + [Pianta1 #bookmark:previous]
        -> grimoire_greenhouse_third
    + [Pianta2 #bookmark:next]
        -> grimoire_greenhouse_third

=== grimoire_greenhouse_in_dialogue
    @grimoireGreenhouse
    + {RANDOM(1, 6) <= 3} [BaccaDellaAddolorata #status:{RANDOM(1,6) <= 3:owned|missing}]
        -> grimoire_greenhouse_third_in_dialogue
    + {RANDOM(1, 6) <= 3} [BarbaDellInciampo #status:{RANDOM(1,6) <= 3:owned|missing}]
        -> grimoire_greenhouse_third_in_dialogue
    + {RANDOM(1, 6) <= 3} [BastoneDellOzioso #status:{RANDOM(1,6) <= 3:owned|missing}]
        -> grimoire_greenhouse_third_in_dialogue
    + {RANDOM(1, 6) <= 3} [BrinaDellImpossibile #status:{RANDOM(1,6) <= 3:owned|missing}]
        -> grimoire_greenhouse_third_in_dialogue
    + {RANDOM(1, 6) <= 3} [CantoDelleCompagne #status:{RANDOM(1,6) <= 3:owned|missing}]
        -> grimoire_greenhouse_third_in_dialogue
    + {RANDOM(1, 6) <= 3} [CardoAspinato #status:{RANDOM(1,6) <= 3:owned|missing}]
        -> grimoire_greenhouse_third_in_dialogue
    + {RANDOM(1, 6) <= 3} [EderaDelleAmanti #status:{RANDOM(1,6) <= 3:owned|missing}]
        -> grimoire_greenhouse_third_in_dialogue
    + {RANDOM(1, 6) <= 3} [ErbaLiccia #status:{RANDOM(1,6) <= 3:owned|missing}]
        -> grimoire_greenhouse_third_in_dialogue
    + {RANDOM(1, 6) <= 3} [FalsaPalude #status:{RANDOM(1,6) <= 3:owned|missing}]
        -> grimoire_greenhouse_third_in_dialogue
    + {RANDOM(1, 6) <= 3} [LanaNotturna #status:{RANDOM(1,6) <= 3:owned|missing}]
        -> grimoire_greenhouse_third_in_dialogue
    + {RANDOM(1, 6) <= 3} [LicheneDegliAbissi #status:{RANDOM(1,6) <= 3:owned|missing}]
        -> grimoire_greenhouse_third_in_dialogue
    + {RANDOM(1, 6) <= 3} [NonTiScordarDiTe #status:{RANDOM(1,6) <= 3:owned|missing}]
        -> grimoire_greenhouse_third_in_dialogue
    + {RANDOM(1, 6) <= 3} [Olobino #status:{RANDOM(1,6) <= 3:owned|missing}]
        -> grimoire_greenhouse_third_in_dialogue
    + {RANDOM(1, 6) <= 3} [Spazzata #status:{RANDOM(1,6) <= 3:owned|missing}]
        -> grimoire_greenhouse_third_in_dialogue
    + [Close #bookmark:close]
        @grimoireClose
        -> start


=== grimoire_greenhouse_third_in_dialogue
    @grimoireGreenhousePages #leftPageTitle:Lana Notturna #leftPageStatus:locked #leftPagePlant:LanaNotturna #rightPageTitle:Bacca dell'Addolorata #rightPageStatus:owned #rightPagePlant:BaccaDellaAddolorata
    Lorem ipsum. #leftPageDescription
    Altro Lorem. #leftPageDescription
    Donata a Chitarra #leftPageSubtitle
    Non ha espresso particolare entusiasmo. #leftPageDescription
    Descrizione a destra #rightPageDescription
    Aggiunta cucinando con Riccio #rightPageSubtitle
    Recuperata da Franco #rightPageSubtitle
    + [BaccaDellaAddolorata #page:right]
        @grimoireClose
        Hai scelto Bacca dell'addolorata!
        -> start
    + [Piante #bookmark:secondLevel]
        -> grimoire_greenhouse_in_dialogue
    + [Pianta1 #bookmark:previous]
        -> grimoire_greenhouse_third_alt_in_dialogue
    + [Pianta2 #bookmark:next]
        -> grimoire_greenhouse_third_alt_in_dialogue
    + [Close #bookmark:close]
        @grimoireClose
        -> start


=== grimoire_greenhouse_third_alt_in_dialogue
    @grimoireGreenhousePages #leftPageTitle:Lana Notturna #leftPageStatus:consumed #leftPagePlant:LanaNotturna #rightPageTitle:Bacca dell'Addolorata #rightPageStatus:hidden #rightPagePlant:BaccaDellaAddolorata
    Lorem ipsum. #leftPageDescription
    Altro Lorem. #leftPageDescription
    Donata a Chitarra #leftPageSubtitle
    Non ha espresso particolare entusiasmo. #leftPageDescription
    Descrizione a destra #rightPageDescription
    Aggiunta cucinando con Riccio #rightPageSubtitle
    Recuperata da Franco #rightPageSubtitle
    + [Piante #bookmark:secondLevel]
        -> grimoire_greenhouse_in_dialogue
    + [Pianta1 #bookmark:previous]
        -> grimoire_greenhouse_third_in_dialogue
    + [Pianta2 #bookmark:next]
        -> grimoire_greenhouse_third_in_dialogue
    + [Close #bookmark:close]
        @grimoireClose
        -> start


=== grimoire_sigils
    @grimoireSigils
    + {RANDOM(1, 6) <= 3} [{Fire}{Air} #enabled:{hasSigilStartingWith(glyph_fireAirSigils)}]
        -> grimoire_sigils_third
    + {RANDOM(1, 6) <= 3} [{Fire}{Water} #enabled:{hasSigilStartingWith(glyph_fireWaterSigils)}]
        -> grimoire_sigils_third
    + {RANDOM(1, 6) <= 3} [{Fire}{Earth} #enabled:{hasSigilStartingWith(glyph_fireEarthSigils)}]
        -> grimoire_sigils_third
    + {RANDOM(1, 6) <= 3} [{Fire}{Aether} #enabled:{hasSigilStartingWith(glyph_fireAetherSigils)}]
        -> grimoire_sigils_third
    + {RANDOM(1, 6) <= 3} [{Air}{Fire} #enabled:{hasSigilStartingWith(glyph_airFireSigils)}]
        -> grimoire_sigils_third
    + {RANDOM(1, 6) <= 3} [{Air}{Water} #enabled:{hasSigilStartingWith(glyph_airWaterSigils)}]
        -> grimoire_sigils_third
    + {RANDOM(1, 6) <= 3} [{Air}{Earth} #enabled:{hasSigilStartingWith(glyph_airEarthSigils)}]
        -> grimoire_sigils_third
    + {RANDOM(1, 6) <= 3} [{Air}{Aether} #enabled:{hasSigilStartingWith(glyph_airAetherSigils)}]
        -> grimoire_sigils_third
    + {RANDOM(1, 6) <= 3} [{Water}{Fire} #enabled:{hasSigilStartingWith(glyph_WaterFireSigils)}]
        -> grimoire_sigils_third
    + {RANDOM(1, 6) <= 3} [{Water}{Air} #enabled:{hasSigilStartingWith(glyph_WaterAirSigils)}]
        -> grimoire_sigils_third
    + [{Water}{Earth} #enabled:{hasSigilStartingWith(glyph_WaterEarthSigils)}]
        -> grimoire_sigils_third
    + {RANDOM(1, 6) <= 3} [{Water}{Aether} #enabled:{hasSigilStartingWith(glyph_WaterAetherSigils)}]
        -> grimoire_sigils_third
    + {RANDOM(1, 6) <= 3} [{Earth}{Fire} #enabled:{hasSigilStartingWith(glyph_earthFireSigils)}]
        -> grimoire_sigils_third
    + {RANDOM(1, 6) <= 3} [{Earth}{Air} #enabled:{hasSigilStartingWith(glyph_earthAirSigils)}]
        -> grimoire_sigils_third
    + {RANDOM(1, 6) <= 3} [{Earth}{Water} #enabled:{hasSigilStartingWith(glyph_earthWaterSigils)}]
        -> grimoire_sigils_third
    + {RANDOM(1, 6) <= 3} [{Earth}{Aether} #enabled:{hasSigilStartingWith(glyph_earthAetherSigils)}]
        -> grimoire_sigils_third
    + {RANDOM(1, 6) <= 3} [{Aether}{Fire} #enabled:{hasSigilStartingWith(glyph_aetherFireSigils)}]
        -> grimoire_sigils_third
    + {RANDOM(1, 6) <= 3} [{Aether}{Air} #enabled:{hasSigilStartingWith(glyph_aetherAirSigils)}]
        -> grimoire_sigils_third
    + {RANDOM(1, 6) <= 3} [{Aether}{Water} #enabled:{hasSigilStartingWith(glyph_aetherWaterSigils)}]
        -> grimoire_sigils_third
    + {RANDOM(1, 6) <= 3} [{Aether}{Earth} #enabled:{hasSigilStartingWith(glyph_aetherEarthSigils)}]
        -> grimoire_sigils_third
    + [Index #bookmark:index]
        -> grimoire
    -
    -> grimoire_sigils

=== grimoire_sigils_third
    @grimoireSigilPages #leftPageTitle:Pontile #leftPageDescription:descrizione #leftPageGlyph1:Air #leftPageGlyph2:Water #rightPageTitle:Destra #rightPageDescription:altra descrizione #rightPageGlyph1:Air #rightPageGlyph2:Fire
    + {false} [Lockato #position:left1 #glyph3:Aether #firstLine: #secondLine:seconda #thirdLine:]
    + [Strappo #position:left2 #glyph3:Fire #firstLine: #secondLine:seconda #thirdLine:]
    + [Strappooo #position:left3 #glyph3:Earth #firstLine:prima #secondLine: #thirdLine:terza #status:default]
    + [Boh #position:right1 #glyph3:Water #firstLine:prima #secondLine:seconda #thirdLine:terza #status:unclickable]
    + [Altro #position:right2 #glyph3:Earth #firstLine: #secondLine: #thirdLine: #status:selected]
    + [Altro #position:right3 #glyph3:Aether #firstLine: #secondLine: #thirdLine: #status:consumed]
    + [Index #bookmark:index]
        -> grimoire
    + [Sigilli #bookmark:secondLevel]
        -> grimoire_sigils
    + [Vaso #bookmark:previous]
        -> grimoire_sigils_third
    + [Increspatura #bookmark:next]
        -> grimoire_sigils_third
    -
    -> grimoire_sigils_third

=== function hasSigilStartingWith(sigils)
{sigils has glyph_actualActiveSigil:
    ~ return "true"
- else:
    ~ return "false"
}


=== grimoire_first_character

    @grimoireCharacter #character:FirstCharacter #characterName:Chitarra #characterDescription:Una ragazza in cerca della sua melodia
    Regalale qualcosa che le ricordi il nonno.
    In cucina aggiungi qualcosa che parli di riposo.
    Leggi una storia di ribellione.
    + [Conversation]
        -> grimoire_first_character_conversation
    + [Present]
        -> grimoire_first_character
    + [Kitchen]
        -> grimoire_first_character
    + [Index #bookmark:index]
        -> grimoire

=== grimoire_first_character_conversation

    @grimoireText #style:character #icon:Chitarra #title:Chitarra #description:Una ragazza in cerca della sua melodia
    CHITARRA FIRST WITCH
    When shall we three meet again?
    In thunder, lightning, or in rain?
    SECOND WITCH 
    When the hurly-burly's done,
    When the battle's lost and won.
    THIRD WITCH 
    That will be ere the set of sun.
    FIRST WITCH 
    Where the place?
    SECOND WITCH  Upon the heath.
    THIRD WITCH 
    There to meet with Macbeth.
    FIRST WITCH  I come, Graymalkin.
    SECOND WITCH  Paddock calls.
    THIRD WITCH  Anon.
    ALL 
    Fair is foul, and foul is fair;
    Hover through the fog and filthy air.
    They exit.
    
    
    
    Scene 2
    Alarum within. Enter King Duncan, Malcolm,
    Donalbain, Lennox, with Attendants, meeting a bleeding
    Captain.
    
    DUNCAN 
    What bloody man is that? He can report,
    As seemeth by his plight, of the revolt
    The newest state.
    MALCOLM  This is the sergeant
    Who, like a good and hardy soldier, fought
    'Gainst my captivity.—Hail, brave friend!
    Say to the King the knowledge of the broil
    As thou didst leave it.
    CAPTAIN  Doubtful it stood,
    As two spent swimmers that do cling together
    And choke their art. The merciless Macdonwald
    (Worthy to be a rebel, for to that
    The multiplying villainies of nature
    Do swarm upon him) from the Western Isles
    Of kerns and gallowglasses is supplied;
    And Fortune, on his damnèd quarrel smiling,
    Showed like a rebel's whore. But all's too weak;
    For brave Macbeth (well he deserves that name),
    Disdaining Fortune, with his brandished steel,
    Which smoked with bloody execution,
    Like Valor's minion, carved out his passage
    Till he faced the slave;
    Which ne'er shook hands, nor bade farewell to him,
    Till he unseamed him from the nave to th' chops,
    And fixed his head upon our battlements.
    DUNCAN 
    O valiant cousin, worthy gentleman!
    CAPTAIN 
    As whence the sun 'gins his reflection
    Shipwracking storms and direful thunders break,
    So from that spring whence comfort seemed to
    come
    Discomfort swells. Mark, King of Scotland, mark:
    No sooner justice had, with valor armed,
    Compelled these skipping kerns to trust their heels,
    But the Norweyan lord, surveying vantage,
    With furbished arms and new supplies of men,
    Began a fresh assault.
    + [Index #bookmark:index]
        -> grimoire
    + [Chitarra #bookmark:secondLevel]
        -> grimoire_first_character
    + [precedente #bookmark:previous]
        @grimoireTextPrevious
        -> grimoire_first_character_conversation
    + [prossima #bookmark:next]
        @grimoireTextNext
        -> grimoire_first_character_conversation

=== grimoire_second_character

    @grimoireCharacter #character:SecondCharacter #characterName:Riccio #characterDescription:Aculei per difendersi dal mondo
    Portagli qualcosa legato agli animali.
    Cucina con lui qualcosa di bizzarro.
    Leggi una storia sulla rabbia.
    + [Conversation]
        -> grimoire_second_character_conversation
    + [Rewrite]
        -> grimoire_second_character
    + [Letters]
        -> grimoire_second_character
    + [Index #bookmark:index]
        -> grimoire

=== grimoire_second_character_conversation

    @grimoireText #style:character #icon:riccio #title:Riccio #description:Aculei per difendersi dal mondo
    RICCIO FIRST WITCH 
    When shall we three meet again?
    In thunder, lightning, or in rain?
    SECOND WITCH 
    When the hurly-burly's done,
    When the battle's lost and won.
    THIRD WITCH 
    That will be ere the set of sun.
    FIRST WITCH 
    Where the place?
    SECOND WITCH  Upon the heath.
    THIRD WITCH 
    There to meet with Macbeth.
    FIRST WITCH  I come, Graymalkin.
    SECOND WITCH  Paddock calls.
    THIRD WITCH  Anon.
    ALL 
    Fair is foul, and foul is fair;
    Hover through the fog and filthy air.
    They exit.
    
    
    
    Scene 2
    Alarum within. Enter King Duncan, Malcolm,
    Donalbain, Lennox, with Attendants, meeting a bleeding
    Captain.
    
    DUNCAN 
    What bloody man is that? He can report,
    As seemeth by his plight, of the revolt
    The newest state.
    MALCOLM  This is the sergeant
    Who, like a good and hardy soldier, fought
    'Gainst my captivity.—Hail, brave friend!
    Say to the King the knowledge of the broil
    As thou didst leave it.
    CAPTAIN  Doubtful it stood,
    As two spent swimmers that do cling together
    And choke their art. The merciless Macdonwald
    (Worthy to be a rebel, for to that
    The multiplying villainies of nature
    Do swarm upon him) from the Western Isles
    Of kerns and gallowglasses is supplied;
    And Fortune, on his damnèd quarrel smiling,
    Showed like a rebel's whore. But all's too weak;
    For brave Macbeth (well he deserves that name),
    Disdaining Fortune, with his brandished steel,
    Which smoked with bloody execution,
    Like Valor's minion, carved out his passage
    Till he faced the slave;
    Which ne'er shook hands, nor bade farewell to him,
    Till he unseamed him from the nave to th' chops,
    And fixed his head upon our battlements.
    DUNCAN 
    O valiant cousin, worthy gentleman!
    CAPTAIN 
    As whence the sun 'gins his reflection
    Shipwracking storms and direful thunders break,
    So from that spring whence comfort seemed to
    come
    Discomfort swells. Mark, King of Scotland, mark:
    No sooner justice had, with valor armed,
    Compelled these skipping kerns to trust their heels,
    But the Norweyan lord, surveying vantage,
    With furbished arms and new supplies of men,
    Began a fresh assault.
    + [Index #bookmark:index]
        -> grimoire
    + [Riccio #bookmark:secondLevel]
        -> grimoire_second_character
    + [precedente #bookmark:previous]
        @grimoireTextPrevious
        -> grimoire_second_character_conversation
    + [prossima #bookmark:next]
        @grimoireTextNext
        -> grimoire_second_character_conversation


=== grimoire_franco

    @grimoireFranco #favour:Favore richiesto. #recipeTitle:Titolo della ricetta #recipeDescription:Descrizione della ricetta
    Inizio della ricetta.
    Continuo della ricetta.
    La ricetta va ancora avanti.
    + [Index #bookmark:index]
        -> grimoire


=== grimoire_rules
    @grimoireRules
    Parla con le persone che incontri.
    _
    Impara a conoscerle.
    _
    Compi delle scelte.
    _
    Se ti va, fai loro doni.
    _
    Fate cose assieme.
    _
    E quando saranno pronte, decidi se continuare a conoscerle, o aiutarle a rileggere il loro passato.
    _
    A scegliere un nuovo nome.
    + [Index #bookmark:index]
        -> grimoire

=== grimoire_appendix
    @grimoireAppendix
    + [Conversation]
        -> grimoire_appendix
    + [Present]
        -> grimoire_appendix
    + [Kitchen]
        -> grimoire_appendix
    + [Rewrite]
        -> grimoire_appendix
    + [Nest]
        -> grimoire_appendix
    + [Letters]
        -> grimoire_appendix
    + [Index #bookmark:index]
        -> grimoire