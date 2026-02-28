//Variabili per l'attivazione/disattivazione dei sigilli
VAR nest_firstFireButton = false
VAR nest_secondFireButton = false
VAR nest_thirdFireButton = false

VAR nest_firstEarthButton = false
VAR nest_secondEarthButton = false
VAR nest_thirdEarthButton = false

VAR nest_firstAirButton = false
VAR nest_secondAirButton = false
VAR nest_thirdAirButton = false

VAR nest_firstWaterButton = false
VAR nest_secondWaterButton = false
VAR nest_thirdWaterButton = false

VAR nest_firstAetherButton = false
VAR nest_secondAetherButton = false
VAR nest_thirdAetherButton = false



=== sigil_creation_management ===
    //Per prima cosa passiamo dalla funzione di attivazione/disattivazione dei tasti glyph_activator_function 
        -> glyph_activator_function ->

        ~ temp firstChoice = ()
        ~ temp secondChoice = ()
        ~ temp thirdChoice = ()
        
    Prima scelta    
            + {nest_firstFireButton}[fireGlyph]
                ~ firstChoice = glyph_firstFire
            
            + {nest_firstEarthButton}[earthGlyph]
                ~ firstChoice = glyph_firstEarth
            
            + {nest_firstAirButton}[airGlyph]
                ~ firstChoice = glyph_firstAir
            
            + {nest_firstWaterButton}[waterGlyph]
                ~ firstChoice = glyph_firstWater
            
            + {nest_firstAetherButton}[aetherGlyph]
                ~ firstChoice = glyph_firstAether

            -

    Seconda scelta
            + {nest_secondFireButton && (firstChoice ^ glyph_secondFire != ())}[fireGlyph]
                ~ secondChoice = glyph_secondFire
            
            + {nest_secondEarthButton && (firstChoice ^ glyph_secondEarth != ())}[earthGlyph]
                ~ secondChoice = glyph_secondEarth
            
            + {nest_secondAirButton && (firstChoice ^ glyph_secondAir!= ())}[airGlyph]
                ~ secondChoice = glyph_secondAir
            
            + {nest_secondWaterButton && (firstChoice ^ glyph_secondWater != ())}[waterGlyph]
                ~ secondChoice = glyph_secondWater
            
            + {nest_secondAetherButton && (firstChoice ^ glyph_secondAether != ())}[aetherGlyph]
                ~ secondChoice = glyph_secondAether
            -    

    Terza scelta
            + {nest_thirdFireButton && (secondChoice ^ glyph_thirdFire != ())}[fireGlyph]
                ~ thirdChoice = glyph_thirdFire
            
            + {nest_thirdEarthButton && (secondChoice ^ glyph_thirdEarth != ())}[earthGlyph]
                ~ thirdChoice = glyph_thirdEarth
            
            + {nest_thirdAirButton && (secondChoice ^ glyph_thirdAir != ())}[airGlyph]
                ~ thirdChoice = glyph_thirdAir
            
            + {nest_thirdWaterButton && (secondChoice ^ glyph_thirdWater != ())}[waterGlyph]
                ~ thirdChoice = glyph_thirdWater
            
            + {nest_thirdAetherButton && (secondChoice ^ glyph_thirdAether != ())}[aetherGlyph]
                ~ thirdChoice = glyph_thirdAether
            -  

    //Fatte le scelte, andiamo a vedere cosa abbiamo generato
-> sigil_founder_function



=== glyph_activator_function ===

    = third_level
    //Primo step: attivazione/disattivazione glifi di terzo livello.
    {
        - glyph_thirdFire != () && nest_foundedGlyphs has fireGlyph:
            ~ nest_thirdFireButton = true
    }

    {
        - glyph_thirdWater != () && nest_foundedGlyphs has waterGlyph:
            ~ nest_thirdWaterButton = true
    }

    {
        - glyph_thirdEarth != () && nest_foundedGlyphs has earthGlyph:
            ~ nest_thirdEarthButton = true
    }

    {
        - glyph_thirdAir != () && nest_foundedGlyphs has airGlyph:
            ~ nest_thirdAirButton = true
    }

    {
        - glyph_thirdAether != () && nest_foundedGlyphs has aetherGlyph:
            ~ nest_thirdAetherButton = true
    }

    -> second_level

    = second_level
    //Qui non ci serve vedere se altro che se il tasto del terzo livello è attivo, e fare l'intersezione.
    {
        - nest_thirdFireButton == true:
            {
                - (glyph_thirdFire ^ glyph_secondWater != ()) && nest_foundedGlyphs has waterGlyph:
                        ~ nest_secondWaterButton = true

                - (glyph_thirdFire ^ glyph_secondAir != ()) && nest_foundedGlyphs has airGlyph:
                        ~ nest_secondAirButton = true

                - (glyph_thirdFire ^ glyph_secondEarth != ()) && nest_foundedGlyphs has earthGlyph:
                         ~ nest_secondEarthButton = true

                - (glyph_thirdFire ^ glyph_secondAether != ()) && nest_foundedGlyphs has aetherGlyph:
                        ~ nest_secondAetherButton = true
            }
    
    }


    {
        - nest_thirdAirButton == true:
            {
                - (glyph_thirdAir ^ glyph_secondWater != ()) && nest_foundedGlyphs has waterGlyph:
                        ~ nest_secondWaterButton = true

                - (glyph_thirdAir ^ glyph_secondFire != ()) && nest_foundedGlyphs has fireGlyph:
                        ~ nest_secondFireButton = true

                - (glyph_thirdAir ^ glyph_secondEarth != ()) && nest_foundedGlyphs has earthGlyph:
                         ~ nest_secondEarthButton = true

                - (glyph_thirdAir ^ glyph_secondAether != ()) && nest_foundedGlyphs has aetherGlyph:
                        ~ nest_secondAetherButton = true
            }
    
    }

    {
        - nest_thirdWaterButton == true:
            {
                - (glyph_thirdWater ^ glyph_secondAir != ()) && nest_foundedGlyphs has airGlyph:
                        ~ nest_secondAirButton = true

                - (glyph_thirdWater ^ glyph_secondFire != ()) && nest_foundedGlyphs has fireGlyph:
                        ~ nest_secondFireButton = true

                - (glyph_thirdWater ^ glyph_secondEarth != ()) && nest_foundedGlyphs has earthGlyph:
                         ~ nest_secondEarthButton = true

                - (glyph_thirdWater ^ glyph_secondAether != ()) && nest_foundedGlyphs has aetherGlyph:
                        ~ nest_secondAetherButton = true
            }
    
    }

    {
        - nest_thirdEarthButton == true:
            {
                - (glyph_thirdEarth ^ glyph_secondAir != ()) && nest_foundedGlyphs has airGlyph:
                        ~ nest_secondAirButton = true

                - (glyph_thirdEarth ^ glyph_secondFire != ()) && nest_foundedGlyphs has fireGlyph:
                        ~ nest_secondFireButton = true

                - (glyph_thirdEarth ^ glyph_secondWater != ()) && nest_foundedGlyphs has waterGlyph:
                         ~ nest_secondWaterButton = true

                - (glyph_thirdEarth ^ glyph_secondAether != ()) && nest_foundedGlyphs has aetherGlyph:
                        ~ nest_secondAetherButton = true
            }
    
    }

    {
        - nest_thirdAetherButton == true:
            {
                - (glyph_thirdAether ^ glyph_secondAir != ()) && nest_foundedGlyphs has airGlyph:
                        ~ nest_secondAirButton = true

                - (glyph_thirdAether ^ glyph_secondFire != ()) && nest_foundedGlyphs has fireGlyph:
                        ~ nest_secondFireButton = true

                - (glyph_thirdAether ^ glyph_secondWater != ()) && nest_foundedGlyphs has waterGlyph:
                         ~ nest_secondWaterButton = true

                - (glyph_thirdAether ^ glyph_secondEarth != ()) && nest_foundedGlyphs has earthGlyph:
                        ~ nest_secondEarthButton = true
            }
    
    }

    -> first_level

    = first_level
    //E qui ci intersezioniamo con il secondo livello, e attiviamo i primi bottoni
    {
        - nest_secondFireButton == true:
            {
                - (glyph_secondFire ^ glyph_firstWater != ()) && nest_foundedGlyphs has waterGlyph:
                        ~ nest_firstWaterButton = true

                - (glyph_secondFire ^ glyph_firstAir != ()) && nest_foundedGlyphs has airGlyph:
                        ~ nest_firstAirButton = true

                - (glyph_secondFire ^ glyph_firstEarth != ()) && nest_foundedGlyphs has earthGlyph:
                         ~ nest_firstEarthButton = true

                - (glyph_secondFire ^ glyph_firstAether != ()) && nest_foundedGlyphs has aetherGlyph:
                        ~ nest_firstAetherButton = true
            }
    
    }


    {
        - nest_secondAirButton == true:
            {
                - (glyph_secondAir ^ glyph_firstWater != ()) && nest_foundedGlyphs has waterGlyph:
                        ~ nest_firstWaterButton = true

                - (glyph_secondAir ^ glyph_firstFire != ()) && nest_foundedGlyphs has fireGlyph:
                        ~ nest_firstFireButton = true

                - (glyph_secondAir ^ glyph_firstEarth != ()) && nest_foundedGlyphs has earthGlyph:
                         ~ nest_firstEarthButton = true

                - (glyph_secondAir ^ glyph_firstAether != ()) && nest_foundedGlyphs has aetherGlyph:
                        ~ nest_firstAetherButton = true
            }
    
    }

    {
        - nest_secondWaterButton == true:
            {
                - (glyph_secondWater ^ glyph_firstAir != ()) && nest_foundedGlyphs has airGlyph:
                        ~ nest_firstAirButton = true

                - (glyph_secondWater ^ glyph_firstFire != ()) && nest_foundedGlyphs has fireGlyph:
                        ~ nest_firstFireButton = true

                - (glyph_secondWater ^ glyph_firstEarth != ()) && nest_foundedGlyphs has earthGlyph:
                         ~ nest_firstEarthButton = true

                - (glyph_secondWater ^ glyph_firstAether != ()) && nest_foundedGlyphs has aetherGlyph:
                        ~ nest_firstAetherButton = true
            }
    
    }

    {
        - nest_secondEarthButton == true:
            {
                - (glyph_secondEarth ^ glyph_firstAir != ()) && nest_foundedGlyphs has airGlyph:
                        ~ nest_firstAirButton = true

                - (glyph_secondEarth ^ glyph_firstFire != ()) && nest_foundedGlyphs has fireGlyph:
                        ~ nest_firstFireButton = true

                - (glyph_secondEarth ^ glyph_firstWater != ()) && nest_foundedGlyphs has waterGlyph:
                         ~ nest_firstWaterButton = true

                - (glyph_secondEarth ^ glyph_firstAether != ()) && nest_foundedGlyphs has aetherGlyph:
                        ~ nest_firstAetherButton = true
            }
    
    }

    {
        - nest_secondAetherButton == true:
            {
                - (glyph_secondAether ^ glyph_firstAir != ()) && nest_foundedGlyphs has airGlyph:
                        ~ nest_firstAirButton = true

                - (glyph_secondAether ^ glyph_firstFire != ()) && nest_foundedGlyphs has fireGlyph:
                        ~ nest_firstFireButton = true

                - (glyph_secondAether ^ glyph_firstWater != ()) && nest_foundedGlyphs has waterGlyph:
                         ~ nest_firstWaterButton = true

                - (glyph_secondAether ^ glyph_firstEarth != ()) && nest_foundedGlyphs has earthGlyph:
                        ~ nest_firstEarthButton = true
            }
    
    }

->->



=== sigil_founder_function ===



->->