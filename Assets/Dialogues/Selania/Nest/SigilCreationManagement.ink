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


//Variabili per tracciare le scelte in fase di creazione
VAR firstChoice = ()
VAR secondChoice = ()
VAR thirdChoice = ()
VAR nest_newSigilDiscovered = ()

// === sigil_creation_management ===
//     //Per prima cosa passiamo dalla funzione di attivazione/disattivazione dei tasti glyph_activator_function 
//         -> glyph_activator_function ->
        
//     Prima scelta
//     {debug_nest: stato bottoni: nest_firstFireButton {nest_firstFireButton}, nest_firstEarthButton {nest_firstEarthButton}, nest_firstAirButton {nest_firstAirButton}, nest_firstWaterButton {nest_firstWaterButton}, nest_firstAetherButton {nest_firstAetherButton}}
//             + {are_two_entities_together(PG,fireGlyph) && nest_firstFireButton}[fireGlyph]
//                 ~ firstChoice = glyph_firstFire
            
//             + {are_two_entities_together(PG,earthGlyph) && nest_firstEarthButton}[earthGlyph]
//                 ~ firstChoice = glyph_firstEarth
            
//             + {are_two_entities_together(PG,airGlyph) && nest_firstAirButton}[airGlyph]
//                 ~ firstChoice = glyph_firstAir
            
//             + {are_two_entities_together(PG,waterGlyph) && nest_firstWaterButton}[waterGlyph]
//                 ~ firstChoice = glyph_firstWater
            
//             + {are_two_entities_together(PG,aetherGlyph) && nest_firstAetherButton}[aetherGlyph]
//                 ~ firstChoice = glyph_firstAether

//             -

//     Seconda scelta
//     {debug_nest: stato bottoni: nest_secondFireButton {nest_secondFireButton}, nest_secondEarthButton {nest_secondEarthButton}, nest_secondAirButton {nest_secondAirButton}, nest_secondWaterButton {nest_secondWaterButton}, nest_secondAetherButton {nest_secondAetherButton}}
//             + {are_two_entities_together(PG,fireGlyph) && nest_secondFireButton && (firstChoice ^ glyph_secondFire != ())}[fireGlyph]
//                 ~ secondChoice = glyph_secondFire
            
//             + {are_two_entities_together(PG,earthGlyph) && nest_secondEarthButton && (firstChoice ^ glyph_secondEarth != ())}[earthGlyph]
//                 ~ secondChoice = glyph_secondEarth
            
//             + {are_two_entities_together(PG,airGlyph) && nest_secondAirButton && (firstChoice ^ glyph_secondAir!= ())}[airGlyph]
//                 ~ secondChoice = glyph_secondAir
            
//             + {are_two_entities_together(PG,waterGlyph) && nest_secondWaterButton && (firstChoice ^ glyph_secondWater != ())}[waterGlyph]
//                 ~ secondChoice = glyph_secondWater
            
//             + {are_two_entities_together(PG,aetherGlyph) && nest_secondAetherButton && (firstChoice ^ glyph_secondAether != ())}[aetherGlyph]
//                 ~ secondChoice = glyph_secondAether
//             -    

//     Terza scelta
//     {debug_nest: stato bottoni: nest_thirdFireButton {nest_thirdFireButton}, nest_thirdEarthButton {nest_thirdEarthButton}, nest_thirdAirButton {nest_thirdAirButton}, nest_thirdWaterButton {nest_thirdWaterButton}, nest_thirdAetherButton {nest_thirdAetherButton}}
//             + {are_two_entities_together(PG,fireGlyph) && nest_thirdFireButton && (secondChoice ^ glyph_thirdFire != ())}[fireGlyph]
//                 ~ thirdChoice = glyph_thirdFire
            
//             + {are_two_entities_together(PG,earthGlyph) && nest_thirdEarthButton && (secondChoice ^ glyph_thirdEarth != ())}[earthGlyph]
//                 ~ thirdChoice = glyph_thirdEarth
            
//             + {are_two_entities_together(PG,airGlyph) && nest_thirdAirButton && (secondChoice ^ glyph_thirdAir != ())}[airGlyph]
//                 ~ thirdChoice = glyph_thirdAir
            
//             + {are_two_entities_together(PG,waterGlyph) && nest_thirdWaterButton && (secondChoice ^ glyph_thirdWater != ())}[waterGlyph]
//                 ~ thirdChoice = glyph_thirdWater
            
//             + {are_two_entities_together(PG,aetherGlyph) && nest_thirdAetherButton && (secondChoice ^ glyph_thirdAether != ())}[aetherGlyph]
//                 ~ thirdChoice = glyph_thirdAether
//             -  

//     //Fatte le scelte, andiamo a vedere cosa abbiamo generato
// -> sigil_founder_function



=== glyph_activator_function ===
{debug_nest: passo per glyph_activator_function.}
    
    -> third_level

    = third_level
    {debug_nest: passo per glyph_activator_function, third level.}
    //Primo step: attivazione/disattivazione glifi di terzo livello.
    {
        - glyph_thirdFire != () && nest_foundedGlyphs has fireGlyph:
            ~ nest_thirdFireButton = true
            {debug_nest: nest_thirdFireButton è {nest_thirdFireButton}.}
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
    {debug_nest: passo per glyph_activator_function, second level.}
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
    {debug_nest: passo per glyph_activator_function, first level.}
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
{debug_nest: passo per sigil_founder_function. Il valore di firstChoice è {firstChoice}, di secondChoice è {secondChoice}, di thirdChoice è {thirdChoice}.}
    //Primo step: capire quale è il sigillo generato.
    

    //Il sigillo è l'intersezione delle tre scelte precedenti.
    ~ nest_newSigilDiscovered = firstChoice ^ secondChoice ^ thirdChoice

    //A questo punto vanno aggiornate tutte le liste. Partiamo da quella in incremento.
    ~  glyph_discoveredSigils += nest_newSigilDiscovered

    //E poi da quelle in svuotamento.
    ~ glyph_discoverableSigils -= nest_newSigilDiscovered

        //Pulizia fuoco
        {
            - glyph_firstFire has nest_newSigilDiscovered:
                ~ glyph_firstFire -= nest_newSigilDiscovered
        }

        {
            - glyph_secondFire has nest_newSigilDiscovered:
                ~ glyph_secondFire -= nest_newSigilDiscovered
        }

        {
            - glyph_thirdFire has nest_newSigilDiscovered:
                ~ glyph_thirdFire -= nest_newSigilDiscovered
        }

        //Pulizia acqua
        {
            - glyph_firstWater has nest_newSigilDiscovered:
                ~ glyph_firstWater -= nest_newSigilDiscovered
        }

        {
            - glyph_secondWater has nest_newSigilDiscovered:
                ~ glyph_secondWater -= nest_newSigilDiscovered
        }

        {
            - glyph_thirdWater has nest_newSigilDiscovered:
                ~ glyph_thirdWater -= nest_newSigilDiscovered
        }

        //Pulizia terra
        {
            - glyph_firstEarth has nest_newSigilDiscovered:
                ~ glyph_firstEarth -= nest_newSigilDiscovered
        }

        {
            - glyph_secondEarth has nest_newSigilDiscovered:
                ~ glyph_secondEarth -= nest_newSigilDiscovered
        }

        {
            - glyph_thirdEarth has nest_newSigilDiscovered:
                ~ glyph_thirdEarth -= nest_newSigilDiscovered
        }


        //Pulizia aria
        {
            - glyph_firstAir has nest_newSigilDiscovered:
                ~ glyph_firstAir -= nest_newSigilDiscovered
        }

        {
            - glyph_secondAir has nest_newSigilDiscovered:
                ~ glyph_secondAir -= nest_newSigilDiscovered
        }

        {
            - glyph_thirdAir has nest_newSigilDiscovered:
                ~ glyph_thirdAir -= nest_newSigilDiscovered
        }


        //Pulizia spirito
        {
            - glyph_firstAether has nest_newSigilDiscovered:
                ~ glyph_firstAether -= nest_newSigilDiscovered
        }

        {
            - glyph_secondAether has nest_newSigilDiscovered:
                ~ glyph_secondAether -= nest_newSigilDiscovered
        }

        {
            - glyph_thirdAether has nest_newSigilDiscovered:
                ~ glyph_thirdAether -= nest_newSigilDiscovered
        }

        //E poi svuotiamo le variabili
            ~ firstChoice = ()
            ~ secondChoice = ()
            ~ thirdChoice = ()


//E vado a notificare la scoperta alla giocatrice
-> notification_system