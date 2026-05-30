LIST listCharacters = Mentor, PG, FirstCharacter, SecondCharacter, ThirdCharacter, FourthCharacter, TheFrog, FifthCharacter, TheKitchenFrog

LIST ink_possibileLevels = ink_empty, ink_low, ink_normal, ink_medium, ink_high
VAR firstChar_InkLevel = ink_empty
VAR secondChar_InkLevel = ink_empty
VAR thirdChar_InkLevel = ink_empty
VAR fourthChar_InkLevel = ink_empty
VAR fifthChar_InkLevel = ink_empty

VAR firstChar_relationshipIndicator = 0
VAR secondChar_relationshipIndicator = 0

VAR contentsBedroom = (PG)

VAR knowChitarra = false

VAR settings_gamerMode = false



/***************************************************************************************************
****************************************************************************************************
 INIZIO SIGILLI
****************************************************************************************************
***************************************************************************************************/

/* ---------------------------------
                
LISTE COMBINATORIE DEI SIGILLI
                
----------------------------------*/

LIST allGlyphs = Fire, Air, Water, Earth, Aether

//Lista di tutti i sigilli principali
    LIST glyph_allMainSigils = 
        WaterEarth, WaterAir, WaterAether, WaterFire,
        AirWater, AirFire, AirAether, AirEarth,
        AetherWater, AetherFire, AetherEarth, AetherAir,
        EarthWater, EarthFire, EarthAether, EarthAir,
        FireAether, FireWater, FireAir, FireEarth


//Lista di tutti i possibili sigilli a tre
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
    VAR glyph_firstFire = (FireAirWater, FireAirEarth, FireAirAether, FireWaterAether, FireWaterAir, FireWaterEarth, FireEarthWater, FireEarthAether, FireEarthAir, FireAetherWater, FireAetherEarth, FireAetherAir)
    VAR glyph_secondFire = (AirFireEarth, AirFireAether, AirFireWater, WaterFireEarth, WaterFireAether, WaterFireAir, EarthFireAether, EarthFireWater, EarthFireAir, AetherFireEarth, AetherFireWater, AetherFireAir )
    VAR glyph_thirdFire = (AirWaterFire, AirEarthFire, AirAetherFire, WaterAirFire, WaterEarthFire, WaterAetherFire, EarthAirFire, EarthWaterFire, EarthAetherFire, AetherAirFire, AetherWaterFire, AetherEarthFire)


    VAR glyph_firstWater = (WaterFireEarth, WaterFireAether, WaterFireAir, WaterAirEarth, WaterAirAether, WaterAirFire, WaterEarthAether, WaterEarthAir, WaterEarthFire, WaterAetherEarth, WaterAetherAir, WaterAetherFire)
    VAR glyph_secondWater = ( FireWaterAether, FireWaterAir, FireWaterEarth, AirWaterEarth, AirWaterAether, AirWaterFire, EarthWaterAether, EarthWaterAir, EarthWaterFire, AetherWaterEarth, AetherWaterAir, AetherWaterFire)
    VAR glyph_thirdWater = (FireAirWater, FireEarthWater, FireAetherWater, AirFireWater, AirEarthWater, AirAetherWater, EarthFireWater, EarthAirWater, EarthAetherWater, AetherFireWater, AetherAirWater, AetherEarthWater)


    VAR glyph_firstEarth = (EarthFireAether, EarthFireWater, EarthFireAir, EarthAirAether, EarthAirWater, EarthAirFire, EarthWaterAether, EarthWaterAir, EarthWaterFire, EarthAetherWater, EarthAetherAir, EarthAetherFire)
    VAR glyph_secondEarth = (FireEarthWater, FireEarthAether, FireEarthAir, AirEarthAether, AirEarthWater, AirEarthFire, WaterEarthAether, WaterEarthAir, WaterEarthFire, AetherEarthWater, AetherEarthAir, AetherEarthFire)
    VAR glyph_thirdEarth = (FireAirEarth, FireAetherEarth, AirFireEarth, AirWaterEarth, AirAetherEarth, WaterFireEarth, WaterAirEarth, WaterAetherEarth, AetherFireEarth, AetherAirEarth, AetherWaterEarth, FireWaterEarth)


    VAR glyph_firstAir = (AirFireEarth, AirFireAether, AirFireWater, AirWaterEarth, AirWaterAether, AirWaterFire, AirEarthAether, AirEarthWater, AirEarthFire, AirAetherEarth, AirAetherWater, AirAetherFire)
    VAR glyph_secondAir = (FireAirWater, FireAirEarth, FireAirAether, WaterAirEarth, WaterAirAether, WaterAirFire, EarthAirAether, EarthAirWater, EarthAirFire, AetherAirEarth, AetherAirWater, AetherAirFire)
    VAR glyph_thirdAir = (FireWaterAir, FireAetherAir, FireEarthAir, WaterFireAir, WaterEarthAir, WaterAetherAir, EarthFireAir, EarthWaterAir, EarthAetherAir, AetherFireAir, AetherWaterAir, AetherEarthAir)


    VAR glyph_firstAether = (AetherFireEarth, AetherFireWater, AetherFireAir, AetherAirEarth, AetherAirWater, AetherAirFire, AetherWaterEarth, AetherWaterAir, AetherWaterFire, AetherEarthWater, AetherEarthAir, AetherEarthFire)
    VAR glyph_secondAether = (FireAetherWater, FireAetherEarth, FireAetherAir, AirAetherEarth, AirAetherWater, AirAetherFire, WaterAetherEarth, WaterAetherAir, WaterAetherFire, EarthAetherWater, EarthAetherAir, EarthAetherFire)
    VAR glyph_thirdAether = (FireAirAether, FireEarthAether, FireWaterAether, AirFireAether, AirWaterAether, AirEarthAether, WaterFireAether, WaterAirAether, WaterEarthAether, EarthFireAether, EarthAirAether, EarthWaterAether)


/* ---------------------------------
                
GESTIONE DELLO STATO DEI SIGILLI
                
----------------------------------*/
//Lista dei sigilli scoperti. Questa sarà anche la lista che renderà o meno visibili i sigilli sul libro. Se l'intersezione con used sarà vuota, il sigillo sarà attivabile, altrimenti sarà indicato come consumato.
    VAR glyph_discoveredSigils = ()

//Lista dei sigilli utilizzati.
    VAR glyph_usedSigils = ()

//Tracciamento del sigillo attualmente attivo
    VAR glyph_actualActiveSigil = ()
    VAR glyph_maxSigilUses = 3
    VAR glyph_actualSigilUses= 0


//Tracciamento delle scelte fatte durante la composizione
    LIST glyph_keysColor = fireKey, airKey, WaterKey, earthKey, aetherKey
    VAR glyph_firstKeyColor = ()
    VAR glyph_secondKeyColor = ()
    VAR glyph_thirdKeyColor = ()


/* ---------------------------------
                
GESTIONE DELL'USO DEI SIGILLI
                
----------------------------------*/
//Lista dei possibili stati dei glifi
LIST glyph_talkingVariations = fireC, earthC, airC, waterC, aetherC


//Persona a cui stiamo parlando quando compiamo la scelta
    VAR glyph_currentTalker = ()

//Creazione di parametri generici per semplificarmi la vita legati ai colori che poi verranno riportati sullx PNG    
    VAR glyph_temporaryFire  = 0.00
    VAR glyph_temporaryEarth = 0.00
    VAR glyph_temporaryAir= 0.00
    VAR glyph_temporaryWater= 0.00
    VAR glyph_temporaryAether = 0.00

//Contatore d'uso della parola    
    VAR glyph_temporaryWordUsageCounter = 0


/***************************************************************************************************
****************************************************************************************************
 FINE SIGILLI
****************************************************************************************************
***************************************************************************************************/




-> main

= main

@interact

~ knowChitarra = false
~ firstChar_InkLevel = ink_empty

{charTag(FirstCharacter, "affectionate")}:  Qui non c'è sigillo attivo
~ glyph_discoveredSigils += WaterAirAether
~ glyph_actualActiveSigil += WaterAirAether
~ glyph_actualSigilUses = glyph_maxSigilUses
{charTag(FirstCharacter, "affectionate")}:  Qui c'è sigillo attivo
@sigilInfluence
~ glyph_actualSigilUses--
{charTag(FirstCharacter, "affectionate")}:  Il sigillo è stato usato


{charTag(FirstCharacter, "affectionate")}:  Qui parla Chitarra, ma non sai ancora il nome.
                                            Continuo a parlare, non sono serviti tag e mantengo lo stesso personaggio, immagine, ecc.
                                            Ora ci sono quindici scelte:
    + \ {charTag(FirstCharacter, "affectionate")}: Prima scelta
    + \ {charTag(FirstCharacter, "affectionate")}: Seconda scelta
    + \ {charTag(FirstCharacter, "affectionate")}: Terza scelta
    + \ {charTag(FirstCharacter, "affectionate")}: Quarta scelta
    + \ {charTag(FirstCharacter, "affectionate")}: Quinta scelta
    + \ {charTag(FirstCharacter, "affectionate")}: Sesta scelta
    + \ {charTag(FirstCharacter, "affectionate")}: Settima scelta
    + \ {charTag(FirstCharacter, "affectionate")}: Ottava scelta
    + \ {charTag(FirstCharacter, "affectionate")}: Nona scelta
    + \ {charTag(FirstCharacter, "affectionate")}: Decima scelta
    + \ {charTag(FirstCharacter, "affectionate")}: Undicesima scelta
    + \ {charTag(FirstCharacter, "affectionate")}: Dodicesima scelta
    + \ {charTag(FirstCharacter, "affectionate")}: Tredicesima scelta
    + \ {charTag(FirstCharacter, "affectionate")}: Quattordicesima scelta
    + \ {charTag(FirstCharacter, "affectionate")}: Quindicesima scelta
    + \ {charTag(FirstCharacter, "affectionate")}: Sedicesima scelta
    -
                                            @sprite:museum1
                                            Subito sopra c'è lo sprite 'museum1'
                                            @sprite:museum2
                                            Subito sopra c'è lo sprite 'museum2'
~ knowChitarra = true
{charTag(FirstCharacter, "affectionate")}:  Qui sono sempre io, ma ora sai il mio nome.
{charTag(Mentor, "hurry")}:                 Questa è una scritta davvero molto lunga, e che ci metterà parecchio tempo per essere completata. È un'ottima occasione per verificare cosa succede in questi casi, visto che bisogna saltare alla fine del testo. Ora ripeterò un paio di volte tutto questo in modo da avere un testo ancora più lungo. Quindi. Dicevamo. Questa è una scritta davvero molto lunga, e che ci metterà parecchio tempo per essere completata. È un'ottima occasione per verificare cosa succede in questi casi, visto che bisogna saltare alla fine del testo. Ora ripeterò un paio di volte tutto questo in modo da avere un testo ancora più lungo. Quindi. Dicevamo. Questa è una scritta davvero molto lunga, e che ci metterà parecchio tempo per essere completata. È un'ottima occasione per verificare cosa succede in questi casi, visto che bisogna saltare alla fine del testo. Ora ripeterò un paio di volte tutto questo in modo da avere un testo ancora più lungo. Quindi. Dicevamo.
~ firstChar_InkLevel = ink_normal
{charTag(FirstCharacter, "affectionate")}:  Qui torna a parlare Chitarra, ma ora ha dell'inchiostro.
{charTag(Mentor, "hurry")}:                 Qua invece parla Mentore.
                                            E ora c'è una scelta.
~ temp index = 0
+ \ {charTag(PG, "neutral")}: Scelta 1
    ~ index = 1
+ \ {charTag(PG, "neutral")}: Scelta 2
    ~ index = 2
+ \ {charTag(PG, "neutral")}: Scelta 3
    ~ index = 3
-
{charTag(FirstCharacter, "affectionate")}:  Hai fatto la scelta {index}!


-> main




=== function charTag(character, mood)
// questa variabile invece è il nome realmente mostrato nell'interfaccia ("???" appena conosci la personaggia, "Chitarra" quando la conosci, ecc ecc)
~ temp actualCharacterName = charName(character)
~ temp prefix = ""
{character:
    - FirstCharacter:
        ~ prefix = "Chitarra_"
    - Mentor:
        ~ prefix = "Mentore_"
}
~ return "{character}, {actualCharacterName}, {prefix}{mood}"

=== function charName(character)
{character:
    - PG:
        ~ return "Marta"
    - FirstCharacter:
        {knowChitarra:
            ~ return "Chitarra"
        - else:
            ~ return "???"
        }
    - Mentor:
        ~ return "Mentore"
    - else:
        ~ return "<unknown {character}>"
}