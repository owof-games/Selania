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
            {debug_nest: nest_thirdWaterButton è {nest_thirdWaterButton}.}
    }

    {
        - glyph_thirdEarth != () && nest_foundedGlyphs has earthGlyph:
            ~ nest_thirdEarthButton = true
            {debug_nest: nest_thirdEarthButton è {nest_thirdEarthButton}.}
    }

    {
        - glyph_thirdAir != () && nest_foundedGlyphs has airGlyph:
            ~ nest_thirdAirButton = true
            {debug_nest: nest_thirdAirButton è {nest_thirdAirButton}.}
    }

    {
        - glyph_thirdAether != () && nest_foundedGlyphs has aetherGlyph:
            ~ nest_thirdAetherButton = true
            {debug_nest: nest_thirdAetherButton è {nest_thirdAetherButton}.}
    }

    -> second_level

    = second_level
    {debug_nest: passo per glyph_activator_function, second level.}
    //Qui non ci serve vedere se altro che se il tasto del terzo livello è attivo, e fare l'intersezione.
    
    //Fire
    {

        - nest_thirdFireButton == true && (glyph_thirdFire ^ glyph_secondWater != ()) && nest_foundedGlyphs has waterGlyph:
                ~ nest_secondWaterButton = true
            {debug_nest: glyph_thirdFire, nest_secondWaterButton è {nest_secondWaterButton}.}
                
    }
    {       
        - nest_thirdFireButton == true && (glyph_thirdFire ^ glyph_secondAir != ()) && nest_foundedGlyphs has airGlyph:
                ~ nest_secondAirButton = true
            {debug_nest: glyph_thirdFire, nest_secondAirButton è {nest_secondAirButton}.}
                
    }
    {
        - nest_thirdFireButton == true && (glyph_thirdFire ^ glyph_secondEarth != ()) && nest_foundedGlyphs has earthGlyph:
                ~ nest_secondEarthButton = true
            {debug_nest: glyph_thirdFire, nest_secondEarthButton è {nest_secondEarthButton}.}
                    
    }
    {
        - nest_thirdFireButton == true && (glyph_thirdFire ^ glyph_secondAether != ()) && nest_foundedGlyphs has aetherGlyph:
                ~ nest_secondAetherButton = true
            {debug_nest: glyph_thirdFire, nest_secondAetherButton è {nest_secondAetherButton}.}
                
    }
    
    //Air
    {  
        - nest_thirdAirButton == true && (glyph_thirdAir ^ glyph_secondWater != ()) && nest_foundedGlyphs has waterGlyph:
                ~ nest_secondWaterButton = true
            {debug_nest: glyph_thirdAir, nest_secondWaterButton è {nest_secondWaterButton}.}
                
    } 
    { 
        - nest_thirdAirButton == true && (glyph_thirdAir ^ glyph_secondFire != ()) && nest_foundedGlyphs has fireGlyph:
                ~ nest_secondFireButton = true
            {debug_nest: glyph_thirdAir,nest_secondFireButton è {nest_secondFireButton}.}
                
    } 
    { 
        - nest_thirdAirButton == true && (glyph_thirdAir ^ glyph_secondEarth != ()) && nest_foundedGlyphs has earthGlyph:
                ~ nest_secondEarthButton = true
            {debug_nest: glyph_thirdAir,nest_secondEarthButton è {nest_secondEarthButton}.}
                    
    } 
    {
        - nest_thirdAirButton == true && (glyph_thirdAir ^ glyph_secondAether != ()) && nest_foundedGlyphs has aetherGlyph:
                ~ nest_secondAetherButton = true
            {debug_nest: glyph_thirdAir, nest_secondAetherButton è {nest_secondAetherButton}.}
                
    }   
    

    //Water
    {
        - nest_thirdWaterButton == true && (glyph_thirdWater ^ glyph_secondAir != ()) && nest_foundedGlyphs has airGlyph:
                    ~ nest_secondAirButton = true
                {debug_nest: glyph_thirdWater, nest_secondAirButton è {nest_secondAirButton}.}
                        
    } 
    {
        - nest_thirdWaterButton == true && (glyph_thirdWater ^ glyph_secondFire != ()) && nest_foundedGlyphs has fireGlyph:
                    ~ nest_secondFireButton = true
                {debug_nest: glyph_thirdWater, nest_secondFireButton è {nest_secondFireButton}.}
    } 
    {                    

        - nest_thirdWaterButton == true && (glyph_thirdWater ^ glyph_secondEarth != ()) && nest_foundedGlyphs has earthGlyph:
                ~ nest_secondEarthButton = true
                {debug_nest: glyph_thirdWater, nest_secondEarthButton è {nest_secondEarthButton}.}    
                         
    } 
    {

        - nest_thirdWaterButton == true && (glyph_thirdWater ^ glyph_secondAether != ()) && nest_foundedGlyphs has aetherGlyph:
                ~ nest_secondAetherButton = true
                {debug_nest: glyph_thirdWater, nest_secondAetherButton è {nest_secondAetherButton}.}
                        
    }

    //Earth
    {
        - nest_thirdEarthButton == true && (glyph_thirdEarth ^ glyph_secondAir != ()) && nest_foundedGlyphs has airGlyph:
                ~ nest_secondAirButton = true
            {debug_nest: glyph_thirdEarth, nest_secondAirButton è {nest_secondAirButton}.}
                
    } 
    {
        - nest_thirdEarthButton == true && (glyph_thirdEarth ^ glyph_secondFire != ()) && nest_foundedGlyphs has fireGlyph:
                ~ nest_secondFireButton = true
            {debug_nest: glyph_thirdEarth,nest_secondFireButton è {nest_secondFireButton}.}
                
    } 
    {
        - nest_thirdEarthButton == true && (glyph_thirdEarth ^ glyph_secondWater != ()) && nest_foundedGlyphs has waterGlyph:
                ~ nest_secondWaterButton = true
            {debug_nest: glyph_thirdEarth,nest_secondWaterButton è {nest_secondWaterButton}.}
                    
    } 
    {
        - nest_thirdEarthButton == true && (glyph_thirdEarth ^ glyph_secondAether != ()) && nest_foundedGlyphs has aetherGlyph:
                ~ nest_secondAetherButton = true
            {debug_nest: glyph_thirdEarth,nest_secondAetherButton è {nest_secondAetherButton}.}
                
    }


    //Aether
    {
        - nest_thirdAetherButton == true && (glyph_thirdAether ^ glyph_secondAir != ()) && nest_foundedGlyphs has airGlyph:
                ~ nest_secondAirButton = true
            {debug_nest: glyph_thirdAether, nest_secondAirButton è {nest_secondAirButton}.}
                
    } 
    {
        - nest_thirdAetherButton == true && (glyph_thirdAether ^ glyph_secondFire != ()) && nest_foundedGlyphs has fireGlyph:
                ~ nest_secondFireButton = true
            {debug_nest: glyph_thirdAether, nest_secondFireButton è {nest_secondFireButton}.}
                
    } 
    {
        - nest_thirdAetherButton == true && (glyph_thirdAether ^ glyph_secondWater != ()) && nest_foundedGlyphs has waterGlyph:
                ~ nest_secondWaterButton = true
            {debug_nest: glyph_thirdAether, nest_secondWaterButton è {nest_secondWaterButton}.}
                    
    } 
    {
        - nest_thirdAetherButton == true && (glyph_thirdAether ^ glyph_secondEarth != ()) && nest_foundedGlyphs has earthGlyph:
                ~ nest_secondEarthButton = true
            {debug_nest: glyph_thirdAether, nest_secondEarthButton è {nest_secondEarthButton}.}
                
    }
    


    -> first_level

    = first_level
    {debug_nest: passo per glyph_activator_function, first level.}
    //E qui ci intersezioniamo con il secondo livello, e attiviamo i primi bottoni

    //Fire
    {
        - nest_secondFireButton == true && (glyph_secondFire ^ glyph_firstWater != ()) && nest_foundedGlyphs has waterGlyph:
                ~ nest_firstWaterButton = true
    } 
    {
        - nest_secondFireButton == true && (glyph_secondFire ^ glyph_firstAir != ()) && nest_foundedGlyphs has airGlyph:
                ~ nest_firstAirButton = true
    } 
    {
        - nest_secondFireButton == true && (glyph_secondFire ^ glyph_firstEarth != ()) && nest_foundedGlyphs has earthGlyph:
                    ~ nest_firstEarthButton = true
    } 
    {
        - nest_secondFireButton == true && (glyph_secondFire ^ glyph_firstAether != ()) && nest_foundedGlyphs has aetherGlyph:
                ~ nest_firstAetherButton = true

    }


    //Air
    {
        - nest_secondAirButton == true && (glyph_secondAir ^ glyph_firstWater != ()) && nest_foundedGlyphs has waterGlyph:
            ~ nest_firstWaterButton = true
    } 
    {
        - nest_secondAirButton == true && (glyph_secondAir ^ glyph_firstFire != ()) && nest_foundedGlyphs has fireGlyph:
                ~ nest_firstFireButton = true
    } 
    {
        - nest_secondAirButton == true && (glyph_secondAir ^ glyph_firstEarth != ()) && nest_foundedGlyphs has earthGlyph:
            ~ nest_firstEarthButton = true
    } 
    {
        - nest_secondAirButton == true && (glyph_secondAir ^ glyph_firstAether != ()) && nest_foundedGlyphs has aetherGlyph:
            ~ nest_firstAetherButton = true
    }


    //Water
    {
        - nest_secondWaterButton == true && (glyph_secondWater ^ glyph_firstAir != ()) && nest_foundedGlyphs has airGlyph:
                ~ nest_firstAirButton = true
    } 
    {
        - nest_secondWaterButton == true && (glyph_secondWater ^ glyph_firstFire != ()) && nest_foundedGlyphs has fireGlyph:
                ~ nest_firstFireButton = true
    } 
    {
        - nest_secondWaterButton == true && (glyph_secondWater ^ glyph_firstEarth != ()) && nest_foundedGlyphs has earthGlyph:
                    ~ nest_firstEarthButton = true
    } 
    {
        - nest_secondWaterButton == true && (glyph_secondWater ^ glyph_firstAether != ()) && nest_foundedGlyphs has aetherGlyph:
                ~ nest_firstAetherButton = true
    }


    //Earth
    {
        - nest_secondEarthButton == true && (glyph_secondEarth ^ glyph_firstAir != ()) && nest_foundedGlyphs has airGlyph:
                ~ nest_firstAirButton = true
    } 
    {
        - nest_secondEarthButton == true && (glyph_secondEarth ^ glyph_firstFire != ()) && nest_foundedGlyphs has fireGlyph:
                ~ nest_firstFireButton = true
    } 
    {
        - nest_secondEarthButton == true && (glyph_secondEarth ^ glyph_firstWater != ()) && nest_foundedGlyphs has waterGlyph:
                    ~ nest_firstWaterButton = true
    } 
    {
        - nest_secondEarthButton == true && (glyph_secondEarth ^ glyph_firstAether != ()) && nest_foundedGlyphs has aetherGlyph:
                ~ nest_firstAetherButton = true
    }
    

    //Aether
    {
        - nest_secondAetherButton == true && (glyph_secondAether ^ glyph_firstAir != ()) && nest_foundedGlyphs has airGlyph:
                ~ nest_firstAirButton = true

        - nest_secondAetherButton == true &&(glyph_secondAether ^ glyph_firstFire != ()) && nest_foundedGlyphs has fireGlyph:
                ~ nest_firstFireButton = true

        - nest_secondAetherButton == true &&(glyph_secondAether ^ glyph_firstWater != ()) && nest_foundedGlyphs has waterGlyph:
                    ~ nest_firstWaterButton = true

        - nest_secondAetherButton == true &&(glyph_secondAether ^ glyph_firstEarth != ()) && nest_foundedGlyphs has earthGlyph:
                ~ nest_firstEarthButton = true
    }
    
{debug_nest: stato bottoni: nest_firstFireButton {nest_firstFireButton}, nest_firstEarthButton {nest_firstEarthButton}, nest_firstAirButton {nest_firstAirButton}, nest_firstWaterButton {nest_firstWaterButton}, nest_firstAetherButton {nest_firstAetherButton}}    

->->



=== sigil_founder_function ===
{debug_nest: passo per sigil_founder_function. Il valore di firstChoice è {firstChoice}, di secondChoice è {secondChoice}, di thirdChoice è {thirdChoice}.}
    //Primo step: capire quale è il sigillo generato.
    

    //Il sigillo è l'intersezione delle tre scelte precedenti.
    ~ nest_newSigilDiscovered = firstChoice ^ secondChoice ^ thirdChoice
    {debug_nest: nest_newSigilDiscovered è {nest_newSigilDiscovered}.}

    //A questo punto vanno aggiornate tutte le liste. Partiamo da quella in incremento.
    {debug_nest: prima dell'aggiornamento, glyph_discoveredSigils contiene {glyph_discoveredSigils}.}
    ~  glyph_discoveredSigils += nest_newSigilDiscovered
    {debug_nest: dopo l'aggiornamento, glyph_discoveredSigils contiene {glyph_discoveredSigils}.}

    //E poi da quelle in svuotamento.
    {debug_nest: prima dell'aggiornamento, glyph_discoverableSigils contiene {glyph_discoverableSigils}.}
        ~ glyph_discoverableSigils -= nest_newSigilDiscovered
    {debug_nest: dopo l'aggiornamento, glyph_discoverableSigils contiene {glyph_discoverableSigils}.}

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
            {debug_nest: prima dell'aggiornamento, glyph_firstWater contiene {glyph_firstWater}.}
                ~ glyph_firstWater -= nest_newSigilDiscovered
            {debug_nest: dopo l'aggiornamento, glyph_firstWater contiene {glyph_firstWater}.}    
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
            {debug_nest: prima dell'aggiornamento, glyph_secondAir contiene {glyph_secondAir}.}
                ~ glyph_secondAir -= nest_newSigilDiscovered
            {debug_nest: dopo  l'aggiornamento, glyph_secondAir contiene {glyph_secondAir}.}    
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
            {debug_nest: prima dell'aggiornamento, glyph_thirdAether contiene {glyph_thirdAether}.}
                ~ glyph_thirdAether -= nest_newSigilDiscovered
            {debug_nest: dopo l'aggiornamento, glyph_thirdAether contiene {glyph_thirdAether}.}    
        }

        //E poi svuotiamo le variabili
            ~ firstChoice = ()
            ~ secondChoice = ()
            ~ thirdChoice = ()
        {debug_nest: Prima di uscire svuoto i valori di firstChoice è {firstChoice}, di secondChoice è {secondChoice}, di thirdChoice è {thirdChoice}.}    

    //Aggiorno lo stato dei glifi interagibili
    -> glyph_activator_function ->
    
    //E vado a notificare la scoperta alla giocatrice
    -> notification_system