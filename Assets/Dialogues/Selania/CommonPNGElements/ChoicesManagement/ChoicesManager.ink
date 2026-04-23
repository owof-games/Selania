//Check se ridurre o meno il valore del sigillo
LIST glyph_decreaseSigilsStatus = decreaseYes, decreaseNo
LIST glyph_guestStarPossibileStatus= guestYes, guestNo
//Variabile per decidere se decrementare o meno il valore
VAR glyph_decreaseSigil = true
//Lista delle persone in scena in quel momento
VAR glyph_allPNGAffectedByChoice = ()
VAR glyph_actualGlyphChoice = ()
//Tracciamo anche la "main talker", che non deve generare reazioni.
VAR glyph_mainTalker = ()

//Per la parte di animazione o meno dell'effetto del sigillo invece


//Funzione di dispatch comune (sigillo attivo o meno)
=== glyph_modifier_variation_management(PNG, GlyphC)
{debug_nest: passo per glyph_modifier_variation_management. Il valore di PNG è {PNG}, il valore di GlyphCe è {GlyphC}. Lo stato della parola attiva è {glyph_actualActiveSigil}.}
/***********
Recap della logica.
    Ogni volta che chiamo una scelta:
    verifico chi è in scena (con glyph_talkersAndMainsChecker)
    verifico eventuali condizioni speciali (es: conversazioni con due personagge, o un mix di effetti dei sigilli, come Mentore e Chitarra)
    da lì avvio un loop che è gestito guardando la lista di glyph_allPNGAffectedByChoice e che verifica se ci sono o meno sigilli attivi, applicandone o meno gli effetti, e generando poi delle reazioni (tranne per la PNG che parlerà sicuramente dopo la scelta, tracciata in mainTalker).)
    poi se il sigillo è attivo vado a ridurne il valore, o lo spengo.
**********/

//Step zero: capire chi è in scena e se ci sono condizioni in cui ci sono più main talker
    -> glyph_talkersAndMainsChecker -> 

//E un remind della scelta fatta
    {GlyphC:
        -fireC:
            ~ glyph_actualGlyphChoice = fireC
    
        -earthC:
            ~ glyph_actualGlyphChoice = earthC
        
        -airC:
            ~ glyph_actualGlyphChoice = airC
        
        -waterC:
            ~ glyph_actualGlyphChoice = waterC
        
        -aetherC:
            ~ glyph_actualGlyphChoice = aetherC
    }
{debug_nest: dopo il check zero sul glifo, glyph_actualGlyphChoice è {glyph_actualGlyphChoice}.}



//Primo step: capiamo di chi si parla.
//
    {
        - PNG == FirstCharacter:
            //Per le reazioni aggiorno il current talker
            ~ glyph_currentTalker = FirstCharacter
            ~ glyph_mainTalker += FirstCharacter
            {debug_nest: dopo l'operazione il parlante attuale {glyph_currentTalker}, mentre glyph_mainTalker è {glyph_mainTalker}.}
                
        - PNG == SecondCharacter:
            //Per le reazioni aggiorno il current talker
            ~ glyph_currentTalker = SecondCharacter
            ~ glyph_mainTalker += SecondCharacter
            {debug_nest: dopo l'operazione il parlante attuale {glyph_currentTalker}, mentre glyph_mainTalker è {glyph_mainTalker}.}
                
        - PNG == ThirdCharacter:
            //Per le reazioni aggiorno il current talker
            ~ glyph_currentTalker = ThirdCharacter
            ~ glyph_mainTalker += ThirdCharacter
            {debug_nest: dopo l'operazione il parlante attuale {glyph_currentTalker}, mentre glyph_mainTalker è {glyph_mainTalker}.}
                
        - PNG == Mentor:
            //Per le reazioni aggiorno il current talker
            ~ glyph_currentTalker = Mentor
            ~ glyph_mainTalker += Mentor
            {debug_nest: dopo l'operazione il parlante attuale {glyph_currentTalker}, mentre glyph_mainTalker è {glyph_mainTalker}.}
    
        - PNG == PG:
        //Nel caso dellx PG, non attivo mai le parole magiche, per cui esco direttamente dalla funzione
            {GlyphC:
                -fireC:
                    ~ player_fire ++
            
                -earthC:
                    ~ player_earth ++
                
                -airC:
                    ~ player_air ++
                
                -waterC:
                    ~ player_water ++   
                
                -aetherC:
                    ~ player_aether ++
            }
            ->->
                
        - else: ERROR: sono in GlyphC_variation_management ma non trovo lx PNG indicatx
    }


    //
    //Secondo step: aggiorno le variabili che dipendono dall'argomento passato alla funzione
    //Situazione dei sigilli
    {
        //Se sigillo attivo, andiamo a formula ad hoc
        - glyph_actualActiveSigil != ():
            -> sigil_glyph_updater
            
        //Altrimenti aumentiamo di uno come sempre il valore per lx PNG
        - else:
            {glyph_actualGlyphChoice:
                -fireC:
                    ~ glyph_temporaryFire ++
        
                -earthC:
                    ~ glyph_temporaryEarth ++
                
                -airC:
                    ~ glyph_temporaryAir ++
                
                -waterC:
                    ~ glyph_temporaryWater ++   
                
                -aetherC:
                    ~ glyph_temporaryAether ++
            }
            {debug_nest: non è attivo alcun sigillo per cui mi aumento di uno i valori e basta. glyph_temporaryFire == {glyph_temporaryFire}, glyph_temporaryEarth == {glyph_temporaryEarth}, glyph_temporaryAir == {glyph_temporaryAir}, glyph_temporaryWater == {glyph_temporaryWater}, glyph_temporaryAether == {glyph_temporaryAether}.}
            //E poi aggiorniamo i dettagli, con una funzione comune ai glifi
                -> update_PNG_glyph_values
        
    }


    = sigil_glyph_updater
    //Terzo step: calcolo la variazione di GlyphC generata dal sigillo.
    {
        //Calcolo del primo livello
        - glyph_firstFire has glyph_actualActiveSigil:
               ~ glyph_temporaryFire ++
               ~ glyph_temporaryFire ++

        - glyph_firstEarth has glyph_actualActiveSigil:
               ~ glyph_temporaryEarth ++
               ~ glyph_temporaryEarth ++

        - glyph_firstAir has glyph_actualActiveSigil:
               ~ glyph_temporaryAir ++
               ~ glyph_temporaryAir ++

        - glyph_firstWater has glyph_actualActiveSigil:
               ~ glyph_temporaryWater ++
               ~ glyph_temporaryWater ++

        - glyph_firstAether has glyph_actualActiveSigil:
               ~ glyph_temporaryAether ++
               ~ glyph_temporaryAether ++              
    }

    {
        //Calcolo del secondo livello
        - glyph_secondFire has glyph_actualActiveSigil:
               ~ glyph_temporaryFire ++

        - glyph_secondEarth has glyph_actualActiveSigil:
               ~ glyph_temporaryEarth ++

        - glyph_secondAir has glyph_actualActiveSigil:
               ~ glyph_temporaryAir ++

        - glyph_secondWater has glyph_actualActiveSigil:
               ~ glyph_temporaryWater ++

        - glyph_secondAether has glyph_actualActiveSigil:
               ~ glyph_temporaryAether ++            
    }

    {
        //Calcolo del terzo livello
        - glyph_thirdFire has glyph_actualActiveSigil:
               ~ glyph_temporaryFire --
               ~ glyph_temporaryFire --

        - glyph_thirdEarth has glyph_actualActiveSigil:
               ~ glyph_temporaryEarth --
               ~ glyph_temporaryEarth --

        - glyph_thirdAir has glyph_actualActiveSigil:
               ~ glyph_temporaryAir --
               ~ glyph_temporaryAir --

        - glyph_thirdWater has glyph_actualActiveSigil:
               ~ glyph_temporaryWater --
               ~ glyph_temporaryWater --

        - glyph_thirdAether has glyph_actualActiveSigil:
               ~ glyph_temporaryAether --
               ~ glyph_temporaryAether --             
    }

    //E su chi l'ho utilizzato
    {
        - glyph_currentTalker == FirstCharacter:
            ~ firstChar_usedSigil ++
        
        - glyph_currentTalker == SecondCharacter:
            ~ secondChar_usedSigil ++
        
        - glyph_currentTalker == ThirdCharacter:
            ~ thirdChar_usedSigil ++
        
        - glyph_currentTalker == FourthCharacter:
            ~ fourthChar_usedSigil ++
        
        - glyph_currentTalker == FifthCharacter:
            ~ fifthChar_usedSigil ++
    }

    -> update_PNG_glyph_values

//Quarto step: aggiorno i valori dei glifi dell3 PNG e lo stato della relazione, a prescindere che il sigillo sia o meno attivo.
    = update_PNG_glyph_values
        {debug_nest: entro in update_PNG_glyph_values.}
        {debug_nest: prima dell'operazione il parlante attuale è {glyph_currentTalker}.}
        //Prima aggiorniamo i dati a seconda dei parlanti
        {
            - glyph_currentTalker == FirstCharacter:
                                //Levo la PNG dalla lista delle presenti
                                    ~ glyph_allPNGAffectedByChoice -= FirstCharacter
                                //Aggiorno il record dello stato precedente dei glifi
                                    ~ firstChar_last_aether = firstChar_aether
                                    ~ firstChar_last_earth = firstChar_earth
                                    ~ firstChar_last_air = firstChar_air
                                    ~ firstChar_last_water = firstChar_water
                                    ~ firstChar_last_fire = firstChar_fire

                                //E il contatore delle scelte prese
                                    ~ firstChar_totalChoices ++
                                //Aggiorno i corrispettivi valori lato rapporto PNG/PG (ovvero: non cambio il valore dei dati dellx PNG)
                                    {glyph_actualGlyphChoice:
                                        -fireC:
                                            ~ player_fire_first_char ++
                                        -earthC:
                                            ~ player_earth_first_char ++
                                        -airC:
                                            ~ player_air_first_char ++
                                        -waterC:
                                            ~ player_water_first_char ++   
                                        -aetherC:
                                            ~ player_aether_first_char ++
                                    }
                                //E a questo punto, aggiorno i valori della PNG
                                    ~ firstChar_fire += glyph_temporaryFire 
                                    ~ firstChar_earth += glyph_temporaryEarth
                                    ~ firstChar_air += glyph_temporaryAir
                                    ~ firstChar_water += glyph_temporaryWater
                                    ~ firstChar_aether += glyph_temporaryAether
                                //E calcolo la variazione della relazione    
                                    ~ firstChar_relationship_variation()
            
            - glyph_currentTalker == SecondCharacter:
                                //Levo il PNG dalla lista delle presenti
                                    ~ glyph_allPNGAffectedByChoice -= SecondCharacter
                                //Aggiorno il record dello stato precedente dei glifi
                                    ~ secondChar_last_aether = secondChar_aether
                                    ~ secondChar_last_earth = secondChar_earth
                                    ~ secondChar_last_air = secondChar_air
                                    ~ secondChar_last_water = secondChar_water
                                    ~ secondChar_last_fire = secondChar_fire
                                //E il contatore delle scelte prese
                                    ~ secondChar_totalChoices ++       

                                //Aggiorno i corrispettivi valori lato rapporto PNG/PG (ovvero: non cambio il valore dei dati dellx PNG)
                                {glyph_actualGlyphChoice:
                                    -fireC:
                                        ~ player_fire_second_char ++
                                        ~ secondChar_relationshipTrackingChoise = fireC
                                    -earthC:
                                        ~ player_earth_second_char ++
                                        ~ secondChar_relationshipTrackingChoise = earthC
                                    -airC:
                                        ~ player_air_second_char ++
                                        ~ secondChar_relationshipTrackingChoise = airC
                                    -waterC:
                                        ~ player_water_second_char ++ 
                                        ~ secondChar_relationshipTrackingChoise = waterC
                                    -aetherC:
                                        ~ player_aether_second_char ++
                                        ~ secondChar_relationshipTrackingChoise = aetherC
                                }
                                //E a questo punto, aggiorno i valori del PNG
                                ~ secondChar_fire += glyph_temporaryFire 
                                ~ secondChar_earth += glyph_temporaryEarth
                                ~ secondChar_air += glyph_temporaryAir
                                ~ secondChar_water += glyph_temporaryWater
                                ~ secondChar_aether += glyph_temporaryAether
                                //E lo stato della relazione
                                ~ secondChar_relationship_variation()

            - glyph_currentTalker == ThirdCharacter:
                                //Levo il PNG dalla lista delle presenti
                                ~ glyph_allPNGAffectedByChoice -= ThirdCharacter
                                //Aggiorno il record dello stato precedente dei glifi
                                ~ thirdChar_last_aether = thirdChar_aether
                                ~ thirdChar_last_earth = thirdChar_earth
                                ~ thirdChar_last_air = thirdChar_air
                                ~ thirdChar_last_water = thirdChar_water
                                ~ thirdChar_last_fire = thirdChar_fire
                                //E il contatore delle scelte prese
                                ~ thirdChar_totalChoices ++   

                                //Aggiorno i corrispettivi valori lato rapporto PNG/PG (ovvero: non cambio il valore dei dati dellx PNG)
                                {glyph_actualGlyphChoice:
                                        -fireC:
                                            ~ player_fire_third_char ++
                                        -earthC:
                                            ~ player_earth_third_char ++
                                        -airC:
                                            ~ player_air_third_char ++
                                        -waterC:
                                            ~ player_water_third_char ++   
                                        -aetherC:
                                            ~ player_aether_third_char ++
                                }  
                                //E a questo punto, aggiorno i valori del PNG
                                ~ thirdChar_fire += glyph_temporaryFire 
                                ~ thirdChar_earth += glyph_temporaryEarth
                                ~ thirdChar_air += glyph_temporaryAir
                                ~ thirdChar_water += glyph_temporaryWater
                                ~ thirdChar_aether += glyph_temporaryAether
                                //E lo stato della relazione
                                ~ thirdChar_relationship_variation()

            - glyph_currentTalker == Mentor:
                                //Non ho bisogno di aggiornare lo stato dei glifi, perché non vengono tracciati
                                //Levo la PNG dalla lista delle presenti
                                ~ glyph_allPNGAffectedByChoice -= Mentor
                                
                                //Aumento il contatore delle scelte prese
                                    ~ mentor_totalChoices ++   

                                //Aggiorno i corrispettivi valori lato rapporto PNG/PG (ovvero: non cambio il valore dei dati dellx PNG)
                                {glyph_actualGlyphChoice:
                                        -fireC:
                                            ~ player_fire_mentor ++
                                    
                                        -earthC:
                                            ~ player_earth_mentor ++
                                        
                                        -airC:
                                            ~ player_air_mentor ++
                                        
                                        -waterC:
                                            ~ player_water_mentor ++   
                                        
                                        -aetherC:
                                            ~ player_aether_mentor ++
                                }
                                //E a questo punto, aggiorno i valori del PNG
                                ~ mentor_fire += glyph_temporaryFire 
                                ~ mentor_earth += glyph_temporaryEarth
                                ~ mentor_air += glyph_temporaryAir
                                ~ mentor_water += glyph_temporaryWater
                                ~ mentor_aether += glyph_temporaryAether
                                //Per Mentore non mi serve un contatore del cambio di relazione
        }

    -> sigil_PNG_reactions

    = sigil_PNG_reactions
    {debug_nest: passo per sigil_PNG_reactions. Lo stato di glyph_currentTalker è {glyph_currentTalker}, lo stato di glyph_mainTalker è {glyph_mainTalker} e lo stato sigillo attivo è {glyph_actualActiveSigil}}
    //Qui invece abbiamo le reazioni dellx PNG
    {
        - glyph_currentTalker == FirstCharacter:
            -> FirstCharacter_reactions
        
        - glyph_currentTalker == SecondCharacter:
            -> SecondCharacter_reactions

        - glyph_currentTalker == ThirdCharacter:
            -> ThirdCharacter_reactions

        - glyph_currentTalker == FourthCharacter:
            -> FourthCharacter_reactions  

        - glyph_currentTalker == FifthCharacter:
            -> FifthCharacter_reactions  

        - glyph_currentTalker == Mentor && glyph_actualActiveSigil == () && glyph_mainTalker hasnt Mentor:
            -> Mentor_reactions              

        - else:
            {
                - glyph_allPNGAffectedByChoice != ():
                    -> glyph_thereAreOtherTalkers
                
                - else:
                    -> closing_function       
            }
             

    }

    //Reazione ai sigilli
            = FirstCharacter_reactions
            //Qui settiamo le reazioni ad hoc, a seconda delle variazioni 
            {firstChar_relationshipReaction:

                - neutral:
                    {shuffle:
                        - {charTag(FirstCharacter, "neutral")}:         Già.
                        - {charTag(FirstCharacter, "neutral")}:         Chiaro.
                        - {charTag(FirstCharacter, "neutral")}:         Mhm.
                    }

                - positive:
                    {shuffle:
                        - {charTag(FirstCharacter, "affectionate")}:     Woah!
                        - {charTag(FirstCharacter, "affectionate")}:     Totale!
                        - {charTag(FirstCharacter, "curious")}:          Adoro!
                        - {charTag(FirstCharacter, "curious")}:          Amo!
                    }

                - negative:
                    {shuffle:
                        - {charTag(FirstCharacter, "sad")}:             Bah.
                        - {charTag(FirstCharacter, "annoyed")}:         Vabbè.
                        - {charTag(FirstCharacter, "annoyed")}:         Meh...
                    }

            }

            {
                - glyph_actualActiveSigil != ():
                    @animation: ActiveSigil
            }

            
            -> glyph_thereAreOtherTalkers
            
            
            = SecondCharacter_reactions
            {secondChar_relationshipReaction:

                - neutral:
                    {shuffle:
                        - {charTag(SecondCharacter, "neutral")}:        Ok.
                        - {charTag(SecondCharacter, "neutral")}:        Certo.
                        - {charTag(SecondCharacter, "neutral")}:        Mhm.
                    }

                - positive:
                    {shuffle:
                        - {charTag(SecondCharacter, "emotional")}:          Uuuuh!
                        - {charTag(SecondCharacter, "emotional")}:          Oooh!
                        - {charTag(SecondCharacter, "energy")}:             Wow!
                        - {charTag(SecondCharacter, "energy")}:             Siii!
                    }

                - negative:
                    {shuffle:
                        - {charTag(SecondCharacter, "angry")}:              No?
                        - {charTag(SecondCharacter, "angry")}:              ???
                        - {charTag(SecondCharacter, "melanchonic")}:        Ah.
                        - {charTag(SecondCharacter, "melanchonic")}:        Uff.
                    }

            }

            {
                - glyph_actualActiveSigil != ():
                    @animation: ActiveSigil
            }
            -> glyph_thereAreOtherTalkers

            
            = ThirdCharacter_reactions
            {thirdChar_relationshipReaction:

                - neutral:
                    {shuffle:
                        - {charTag(ThirdCharacter, "neutral")}:        Ok.
                        - {charTag(ThirdCharacter, "neutral")}:        Certo.
                        - {charTag(ThirdCharacter, "neutral")}:        Mhm.
                    }

                - positive:
                    {shuffle:
                        - {charTag(ThirdCharacter, "neutral")}:          Uuuuh!
                        - {charTag(ThirdCharacter, "neutral")}:          Oooh!
                        - {charTag(ThirdCharacter, "neutral")}:          Wow!
                        - {charTag(ThirdCharacter, "neutral")}:          Siii!
                    }

                - negative:
                    {shuffle:
                        - {charTag(ThirdCharacter, "judgmental")}:         No?
                        - {charTag(ThirdCharacter, "judgmental")}:         ???
                        - {charTag(ThirdCharacter, "judgmental")}:         Ah.
                        - {charTag(ThirdCharacter, "judgmental")}:         Uff.
                    }


            }

            {
                - glyph_actualActiveSigil != ():
                    @animation: ActiveSigil
            }
            -> glyph_thereAreOtherTalkers

            = FourthCharacter_reactions
            {fourthChar_relationshipReaction:

                - neutral:
                    {shuffle:
                        - Reazione neutra al sigillo.
                        - Altra reazione neutra al sigillo.
                        - Un'altra ancora reazione neutra al sigillo.
                    }

                - positive:
                    {shuffle:
                        - Reazione positiva al sigillo.
                        - Altra reazione positiva al sigillo.
                        - Un'altra ancora reazione positiva al sigillo.
                    }

                - negative:
                    {shuffle:
                        - Reazione negativa al sigillo.
                        - Altra reazione negativa al sigillo.
                        - Un'altra ancora reazione negativa al sigillo.
                    }

            }

            {
                - glyph_actualActiveSigil != ():
                    @animation: ActiveSigil
            }
            -> glyph_thereAreOtherTalkers

            = FifthCharacter_reactions
            {fifthChar_relationshipReaction:

                - neutral:
                    {shuffle:
                        - Reazione neutra al sigillo.
                        - Altra reazione neutra al sigillo.
                        - Un'altra ancora reazione neutra al sigillo.
                    }

                - positive:
                    {shuffle:
                        - Reazione positiva al sigillo.
                        - Altra reazione positiva al sigillo.
                        - Un'altra ancora reazione positiva al sigillo.
                    }

                - negative:
                    {shuffle:
                        - Reazione negativa al sigillo.
                        - Altra reazione negativa al sigillo.
                        - Un'altra ancora reazione negativa al sigillo.
                    }

            }

            {
                - glyph_actualActiveSigil != ():
                    @animation: ActiveSigil
            }
            -> glyph_thereAreOtherTalkers


    = Mentor_reactions
            //Mentore ha sempre reazioni neutre, visto che non ha un contatore della relazione esplicitamente attivo.
                {shuffle:
                    - {charTag(Mentor, "neutral")}:         Sì sì.
                    - {charTag(Mentor, "neutral")}:         Ok.
                    - {charTag(Mentor, "neutral")}:         Eh.
                    - {charTag(Mentor, "neutral")}:         Mhm.
                    - {charTag(Mentor, "neutral")}:         Chiaro.
                    - {charTag(Mentor, "neutral")}:         Già.
                }
            -> glyph_thereAreOtherTalkers


    = glyph_thereAreOtherTalkers
    //Funzione per capire se rimane qualcuno con cui parlare o meno
    {debug_nest: passo per glyph_thereAreOtherTalkers}
        {
            - glyph_allPNGAffectedByChoice != ():
                {debug_nest: glyph_allPNGAffectedByChoice contiene {glyph_allPNGAffectedByChoice}, per cui faccio un check di un altro personaggix.}
                 ~ glyph_currentTalker = ()
                {debug_nest: Dopo il reset, il valore di glyph_currentTalker è {glyph_currentTalker}.}
                ~ temp newSpeaker = LIST_RANDOM(glyph_allPNGAffectedByChoice)
                {debug_nest: il valore di newSpeaker è {newSpeaker}.}
                ~ glyph_currentTalker += newSpeaker
                {debug_nest: glyph_currentTalker ora è {glyph_currentTalker}}
                // ~ glyph_allPNGAffectedByChoice -= newSpeaker
                // {debug_nest: tolto newSpeaker {newSpeaker} dalla lista glyph_allPNGAffectedByChoice, che ora contiene {glyph_allPNGAffectedByChoice}.}
                    -> update_PNG_glyph_values
           
           - else:
                {debug_nest: glyph_allPNGAffectedByChoice contiene {glyph_allPNGAffectedByChoice}, e in quanto vuota, vado a closing_function.}
                -> closing_function        
        }   

    ->->


    = closing_function
    {debug_nest: passo per closing_function.}
    //Azzeriamo i valori temporanei
        ~ glyph_currentTalker = ()
        ~ glyph_temporaryFire  = 0
        ~ glyph_temporaryEarth = 0
        ~ glyph_temporaryAir= 0
        ~ glyph_temporaryWater= 0
        ~ glyph_temporaryAether = 0
        ~ glyph_mainTalker = ()
        ~ glyph_actualGlyphChoice = ()
        
    {debug_nest: dopo l'operazione il parlante attuale {glyph_currentTalker}.}

    //Infine: se il valore di DecreaseS è su sì, diminuiamo il valore del sigillo, altrimenti no
    {
        - glyph_decreaseSigil == true && glyph_actualActiveSigil != ():
        {debug_nest: il valore di glyph_decreaseSigil è {glyph_decreaseSigil} e quindi vado a ridurre il contatore del sigillo.}
            -> update_sigil_value
        - else: 
            ->->   
    }


    = update_sigil_value
    //Qui aggiorniamo un po' di cose attorno al sigillo
    //Prima chiamo l'updater delle informazioni sul grimorio per il sigillo a tre
        ~ glyph_grimoireTripleSigilsUpdater()
        
    //Poi aumentiamo il valore di utilizzo
        ~ glyph_actualSigilUses ++
    
    //Se l'utilizzo è arrivato al massimo, a quel punto aggiungiamo il sigillo a quelli utilizzati e svuotiamo la variabile del sigillo attualmente attivo.
    {
        - glyph_actualSigilUses == glyph_maxSigilUses:
            {charTag(TheWitch, witch_state())}:   L'effetto di {glyph_actualActiveSigil} si è esaurito.
            //poi aggiorno le informazioni sul sigillo principale
            ~ glyph_grimoireMainSigilsUpdater()
            //sposto il sigillo su quelli utilizzati
            ~ glyph_usedSigils += glyph_actualActiveSigil
            //e svuoto il sigillo attivo
            ~ glyph_actualActiveSigil = ()
            
    }    
    //L'intersezione tra glyph_usedSigils e glyph_discoveredSigils indicherà la presenza di questo sigillo, che sarà quindi tracciato come utilizzato sul libro.

    ->->




//Funzioni per gestire la variazione della relazione, secondo le logiche dellx PNG, e che genera anche la reazione del ritratto MA NON DA FEEDBACK SUL RAPPORTO
=== function firstChar_relationship_variation()
//Prima cosa: calcolo la variazione complessiva 
        {debug_nest: passo per firstChar_relationship_variation. Il valore di firstChar_RelCalculator è {firstChar_RelCalculator}.}
            {glyph_temporaryAir:
                --2:
                    ~ firstChar_RelCalculator ++
                    ~ firstChar_RelCalculator ++
                - 1:
                    ~ firstChar_RelCalculator --
                - 2:
                    ~ firstChar_RelCalculator --
                    ~ firstChar_RelCalculator --
            } 
            {glyph_temporaryWater:
                - -2:
                    ~ firstChar_RelCalculator --
                    ~ firstChar_RelCalculator --
                - 1:
                    ~ firstChar_RelCalculator ++
                - 2:
                    ~ firstChar_RelCalculator ++
                    ~ firstChar_RelCalculator ++
            }   

            {glyph_temporaryAether:
                - -2:
                    ~ firstChar_RelCalculator --
                    ~ firstChar_RelCalculator --
                - 1:
                    ~ firstChar_RelCalculator ++
                - 2:
                    ~ firstChar_RelCalculator ++
                    ~ firstChar_RelCalculator ++
            }   
        {debug_nest: dopo i conti fatti, il valore di firstChar_RelCalculator è {firstChar_RelCalculator}.}

//Poi faccio il conto per verificare quale è stata la variazione di valore complessiva, e generare la relativa reazione.

            {
                - firstChar_RelCalculator > 0:
                    ~ firstChar_relationshipReaction = positive

                - firstChar_RelCalculator < 0:
                    ~ firstChar_relationshipReaction = negative

                - firstChar_RelCalculator == 0:
                    ~ firstChar_relationshipReaction = neutral
            }
    {debug_nest: dopo l'aggiornamento, il valore di firstChar_relationshipReaction è {firstChar_relationshipReaction}.} 
//Poi aggiungo il valore sia a firstChar_relationshipIndicatorAbsolute (per tracciamento) che a firstChar_relationshipIndicator
        ~ firstChar_relationshipIndicator += firstChar_RelCalculator    
        ~ firstChar_relationshipIndicatorAbsolute += firstChar_RelCalculator
//E svuoto firstChar_RelCalculator
        ~ firstChar_RelCalculator = ()  

        {debug_nest: dopo l'aggiornamento, il valore di firstChar_relationshipIndicator è {firstChar_relationshipIndicator}.} 
            
        ~ relationshipIndicator_Adjustments(FirstCharacter)


=== function secondChar_relationship_variation()
    //Step uno: calcolo qual è il colore dominante.
    {
        - (secondChar_aether > secondChar_water) && (secondChar_aether > secondChar_fire) && (secondChar_aether > secondChar_air) && (secondChar_aether > secondChar_earth):
                ~ secondChar_relationshipActualDominantGlyphValue = secondChar_aether
                ~ secondChar_relationshipActualDominantGlyph  = aetherC
    
        - (secondChar_water > secondChar_aether) && (secondChar_water > secondChar_fire) && (secondChar_water > secondChar_air) && (secondChar_water > secondChar_earth):
                ~ secondChar_relationshipActualDominantGlyphValue = secondChar_water
                ~ secondChar_relationshipActualDominantGlyph  = waterC
           	
        
        - (secondChar_fire > secondChar_water) && (secondChar_fire > secondChar_aether) && (secondChar_fire > secondChar_air) && (secondChar_fire > secondChar_earth):
                ~ secondChar_relationshipActualDominantGlyphValue = secondChar_fire
                ~ secondChar_relationshipActualDominantGlyph  = fireC
         
        
        - (secondChar_earth > secondChar_water) && (secondChar_earth > secondChar_aether) && (secondChar_earth > secondChar_air) && (secondChar_earth > secondChar_fire):
                ~ secondChar_relationshipActualDominantGlyphValue = secondChar_earth
                ~ secondChar_relationshipActualDominantGlyph  = earthC
          
        
        - (secondChar_air > secondChar_water) && (secondChar_air > secondChar_aether) && (secondChar_air > secondChar_earth) && (secondChar_air > secondChar_fire):
                ~ secondChar_relationshipActualDominantGlyphValue = secondChar_air
                ~ secondChar_relationshipActualDominantGlyph  = airC

        - else:
            //In caso di pareggio, per ora la soluzione è che comunque vada a registrare l'ultimo dominante e il suo valore come quello attuale. L'idea è che il pareggio debba essere per forza temporaneo: nessuna scelta genera un valore di incremento o decremento uguale per due glifi diversi, e quindi la volta successiva comunque riemergerà la "rottura" dell'equilibro.
            //questa cosa crea due problemi: se faccio all'inizio cinque scelte diverse, se vado avanti a due colori dominanti.
            ~ secondChar_relationshipLastDominantGlyphValue = secondChar_relationshipActualDominantGlyphValue
                    ~ secondChar_relationshipLastDominantGlyph = secondChar_relationshipActualDominantGlyph
            // {
            //     - secondChar_relationshipLastDominantGlyph == 1.00:
            //     //Risolto il problema dell'inizio, ma non quelli successivi
            //         {
            //             - secondChar_relationshipTrackingChoise == aetherC:
            //                 ~ secondChar_relationshipActualDominantGlyphValue = secondChar_aether
            //                 ~ secondChar_relationshipActualDominantGlyph  = aetherC
            //             - secondChar_relationshipTrackingChoise == waterC:
            //                  ~ secondChar_relationshipActualDominantGlyphValue = secondChar_water
            //                 ~ secondChar_relationshipActualDominantGlyph  = waterC
            //             - secondChar_relationshipTrackingChoise == fireC:
            //                 ~ secondChar_relationshipActualDominantGlyphValue = secondChar_fire
            //                 ~ secondChar_relationshipActualDominantGlyph  = fireC
            //             - secondChar_relationshipTrackingChoise == earthC:
            //                 ~ secondChar_relationshipActualDominantGlyphValue = secondChar_earth
            //                 ~ secondChar_relationshipActualDominantGlyph  = earthC
            //             - secondChar_relationshipTrackingChoise == airC:
            //                 ~ secondChar_relationshipActualDominantGlyphValue = secondChar_air
            //                 ~ secondChar_relationshipActualDominantGlyph  = airC
            //         }

            //     - else:
            //         ~ secondChar_relationshipLastDominantGlyphValue = secondChar_relationshipActualDominantGlyphValue
            //         ~ secondChar_relationshipLastDominantGlyph = secondChar_relationshipActualDominantGlyph
            // }
            
              
    }



//Step due: calcolo il risultato    
    {
        
        - secondChar_relationshipActualDominantGlyph == secondChar_relationshipLastDominantGlyph:
            {
                //Se non cambia glifo dominante ma aumenta il valore, cosa buona
                -secondChar_relationshipActualDominantGlyphValue >= secondChar_relationshipLastDominantGlyphValue:
                        ~ secondChar_RelCalculator ++
                
                //Se non cambia glifo dominante ma diminuisce il valore, cosa cattiva
                -secondChar_relationshipActualDominantGlyphValue < secondChar_relationshipLastDominantGlyphValue:
                        ~ secondChar_RelCalculator --        
            }
        
        //Eccezione con la prima scelta
        - secondChar_relationshipLastDominantGlyph == ():
            ~ secondChar_RelCalculator ++
        
        //Se cambia glifo dominante, cosa brutta    
        - secondChar_relationshipActualDominantGlyph != secondChar_relationshipLastDominantGlyph:
                ~ secondChar_RelCalculator --
        

        
        //Il resto è neutro        

    }

    //Aggiorno i valori di tracciamento
    ~ secondChar_relationshipLastDominantGlyphValue = secondChar_relationshipActualDominantGlyphValue
    ~ secondChar_relationshipLastDominantGlyph = secondChar_relationshipActualDominantGlyph

//Poi faccio il conto per verificare quale è stata la variazione di valore complessiva, e generare la relativa reazione.

            {
                - secondChar_RelCalculator > 0:
                    ~ secondChar_relationshipReaction = positive

                - secondChar_RelCalculator < 0:
                    ~ secondChar_relationshipReaction = negative

                - secondChar_RelCalculator == 0:
                    ~ secondChar_relationshipReaction = neutral
            }

//Poi aggiungo il valore sia a secondChar_relationshipIndicatorAbsolute (per tracciamento) che a secondChar_relationshipIndicator
        ~ secondChar_relationshipIndicator += secondChar_RelCalculator    
        ~ secondChar_relationshipIndicatorAbsolute += secondChar_RelCalculator
//E svuoto secondChar_RelCalculator
        ~ secondChar_RelCalculator = ()  

        {debug_nest: dopo l'aggiornamento, il valore di secondChar_relationshipReaction è {secondChar_relationshipReaction}.} 
            
        ~ relationshipIndicator_Adjustments(SecondCharacter)


=== function thirdChar_relationship_variation()
//Prima cosa: calcolo la variazione complessiva a seconda della logica della PNG
        {debug_nest: passo per firstChar_relationship_variation. Il valore di thirdChar_RelCalculator è {thirdChar_RelCalculator}.}

        {debug_nest: dopo i conti fatti, il valore di thirdChar_RelCalculator è {thirdChar_RelCalculator}.}

//Poi faccio il conto per verificare quale è stata la variazione di valore complessiva, e generare la relativa reazione.

            {
                - thirdChar_RelCalculator > 0:
                    ~ thirdChar_relationshipReaction = positive

                - thirdChar_RelCalculator < 0:
                    ~ thirdChar_relationshipReaction = negative

                - thirdChar_RelCalculator == 0:
                    ~ thirdChar_relationshipReaction = neutral
            }

//Poi aggiungo il valore sia a thirdChar_relationshipIndicatorAbsolute (per tracciamento) che a thirdChar_relationshipIndicator
        ~ thirdChar_relationshipIndicator += thirdChar_RelCalculator    
        ~ thirdChar_relationshipIndicatorAbsolute += thirdChar_RelCalculator
//E svuoto thirdChar_RelCalculator
        ~ thirdChar_RelCalculator = ()  

        {debug_nest: dopo l'aggiornamento, il valore di thirdChar_relationshipReaction è {thirdChar_relationshipReaction}.} 
            
        ~ relationshipIndicator_Adjustments(ThirdCharacter)



=== function fourthChar_relationship_variation()
//Prima cosa: calcolo la variazione complessiva a seconda della logica della PNG
        {debug_nest: passo per firstChar_relationship_variation. Il valore di fourthChar_RelCalculator è {fourthChar_RelCalculator}.}

        {debug_nest: dopo i conti fatti, il valore di fourthChar_RelCalculator è {fourthChar_RelCalculator}.}

//Poi faccio il conto per verificare quale è stata la variazione di valore complessiva, e generare la relativa reazione.

            {
                - fourthChar_RelCalculator > 0:
                    ~ fourthChar_relationshipReaction = positive

                - fourthChar_RelCalculator < 0:
                    ~ fourthChar_relationshipReaction = negative

                - fourthChar_RelCalculator == 0:
                    ~ fourthChar_relationshipReaction = neutral
            }

//Poi aggiungo il valore sia a fourthChar_relationshipIndicatorAbsolute (per tracciamento) che a fourthChar_relationshipIndicator
        ~ fourthChar_relationshipIndicator += fourthChar_RelCalculator    
        ~ fourthChar_relationshipIndicatorAbsolute += fourthChar_RelCalculator
//E svuoto fourthChar_RelCalculator
        ~ fourthChar_RelCalculator = ()  

        {debug_nest: dopo l'aggiornamento, il valore di fourthChar_relationshipReaction è {fourthChar_relationshipReaction}.} 
            
        ~ relationshipIndicator_Adjustments(FourthCharacter)

=== function fifthChar_relationship_variation()
//Prima cosa: calcolo la variazione complessiva a seconda della logica della PNG
        {debug_nest: passo per firstChar_relationship_variation. Il valore di fifthChar_RelCalculator è {fifthChar_RelCalculator}.}

        {debug_nest: dopo i conti fatti, il valore di fifthChar_RelCalculator è {fifthChar_RelCalculator}.}

//Poi faccio il conto per verificare quale è stata la variazione di valore complessiva, e generare la relativa reazione.

            {
                - fifthChar_RelCalculator > 0:
                    ~ fifthChar_relationshipReaction = positive

                - fifthChar_RelCalculator < 0:
                    ~ fifthChar_relationshipReaction = negative

                - fifthChar_RelCalculator == 0:
                    ~ fifthChar_relationshipReaction = neutral
            }

//Poi aggiungo il valore sia a fifthChar_relationshipIndicatorAbsolute (per tracciamento) che a fifthChar_relationshipIndicator
        ~ fifthChar_relationshipIndicator += fifthChar_RelCalculator    
        ~ fifthChar_relationshipIndicatorAbsolute += fifthChar_RelCalculator
//E svuoto fifthChar_RelCalculator
        ~ fifthChar_RelCalculator = ()  

        {debug_nest: dopo l'aggiornamento, il valore di fifthChar_relationshipReaction è {fifthChar_relationshipReaction}.} 
            
        ~ relationshipIndicator_Adjustments(FifthCharacter)

//Questa funzione ci permette al volo di evitare che i valori dell'indicatore sforino i limiti previsti
=== function relationshipIndicator_Adjustments(PNG)

{
    - PNG == FirstCharacter:
        {
            - firstChar_relationshipIndicator < relationship_indicator_minValue:
               ~ firstChar_relationshipIndicator =  relationship_indicator_minValue

            - firstChar_relationshipIndicator > relationship_indicator_maxValue:
               ~ firstChar_relationshipIndicator =  relationship_indicator_maxValue
        }
    - PNG == SecondCharacter:
        {
        - secondChar_relationshipIndicator < relationship_indicator_minValue:
            ~ secondChar_relationshipIndicator =  relationship_indicator_minValue

        - secondChar_relationshipIndicator > relationship_indicator_maxValue:
            ~ secondChar_relationshipIndicator =  relationship_indicator_maxValue
        }   
    - PNG == ThirdCharacter:
        {
            - thirdChar_relationshipIndicator < relationship_indicator_minValue:
               ~ thirdChar_relationshipIndicator =  relationship_indicator_minValue

            - thirdChar_relationshipIndicator > relationship_indicator_maxValue:
               ~ thirdChar_relationshipIndicator =  relationship_indicator_maxValue
        }

    - PNG == FourthCharacter:
        {
            - fourthChar_relationshipIndicator < relationship_indicator_minValue:
               ~ fourthChar_relationshipIndicator =  relationship_indicator_minValue

            - fourthChar_relationshipIndicator > relationship_indicator_maxValue:
               ~ fourthChar_relationshipIndicator =  relationship_indicator_maxValue
        }
        
    - PNG == FifthCharacter:
        {
            - fifthChar_relationshipIndicator < relationship_indicator_minValue:
               ~ fifthChar_relationshipIndicator =  relationship_indicator_minValue

            - fifthChar_relationshipIndicator > relationship_indicator_maxValue:
               ~ fifthChar_relationshipIndicator =  relationship_indicator_maxValue
        }
}


=== glyph_talkersAndMainsChecker
//Prima cosa: chi è in scena?
    {
        - are_two_entities_together(PG, FirstCharacter):
            ~ glyph_allPNGAffectedByChoice += FirstCharacter
    }
    {
        - are_two_entities_together(PG, SecondCharacter):
            ~ glyph_allPNGAffectedByChoice += SecondCharacter
    }
    {
        - are_two_entities_together(PG, ThirdCharacter):
            ~ glyph_allPNGAffectedByChoice += ThirdCharacter
    }
    {
        - are_two_entities_together(PG, FourthCharacter):
            ~ glyph_allPNGAffectedByChoice += FourthCharacter
    }
    {
        - are_two_entities_together(PG, FifthCharacter):
            ~ glyph_allPNGAffectedByChoice += FifthCharacter
    }
    {
        - are_two_entities_together(PG, Mentor):
            ~ glyph_allPNGAffectedByChoice += Mentor                    
    }

//Seconda cosa: quali sono le condizioni in cui possono esserci più main talker? Sono gli storylets comuni, dove la logica è: se ho visitato il nodo MA non ho ancora nella lista del grimorio l'oggetto che è legato a quel nodo di storylets, allora sono nel mezzo del dialogo, e quindi aggiungo a maintalker tutte le png previste.
{
    //Chiacchiere tra Riccio e Chitarra
        - first_second_chit_chat && grimoire_firstChar hasnt grimFirstSecondChar:
            {debug_nest: questa eccezione è valida: first_second_chit_chat && grimoire_firstChar hasnt grimFirstSecondChar. grimoire_firstChar {grimoire_firstChar}.} 
            ~ glyph_mainTalker += FirstCharacter
            ~ glyph_mainTalker += SecondCharacter

    //Chiacchiere tra Riccio e PNG3
        - third_second_chit_chat && grimoire_secondChar hasnt grimSecondThirdChar:
        {debug_nest: questa eccezione è valida: third_mentor_chit_chat && grimoire_thirdChar hasnt grimThirdCharMentor. grimoire_thirdChar {grimoire_thirdChar}.} 
            ~ glyph_mainTalker += SecondCharacter
            ~ glyph_mainTalker += ThirdCharacter     

    //Chiacchiere tra Chitarra e PNG3
        - third_first_chit_chat && grimoire_firstChar hasnt grimFirstThirdChar:
        {debug_nest: questa eccezione è valida: third_first_chit_chat && grimoire_firstChar hasnt grimFirstThirdChar. grimoire_firstChar {grimoire_firstChar}.} 
            ~ glyph_mainTalker += FirstCharacter
            ~ glyph_mainTalker += ThirdCharacter
        {debug_nest: le glyph_mainTalker sono {glyph_mainTalker}.}     

    //Mentore e Riccio parlano dopo il litigio. Parte fintanto che riccio non ha cucinato da solo.
        - about_violence_and_peace && grimoire_fifthChar hasnt grimSecondCharMentorPeace:
        {debug_nest: about_violence_and_peace && grimoire_fifthChar hasnt grimSecondCharMentorPeace. grimoire_fifthChar {grimoire_thirdChar}.} 
            ~ glyph_mainTalker += SecondCharacter
            ~ glyph_mainTalker += Mentor
    
    //Riccio ha cucinato, e vediamo la scena del dono
        - food_gift_second_char && grimoire_secondChar hasnt grimSecondCharKitchenAlone:
        {debug_nest: about_violence_and_peace && grimoire_fifthChar hasnt grimSecondCharMentorPeace. grimoire_fifthChar {grimoire_thirdChar}.} 
            ~ glyph_mainTalker += SecondCharacter
            ~ glyph_mainTalker += Mentor    
    
    //Chiacchiere tra Chitarra e Mentore
        - first_mentor_chit_chat && grimoire_firstChar hasnt grimFirstCharMentor:
        {debug_nest: questa eccezione è valida: first_mentor_chit_chat && grimoire_firstChar hasnt grimFirstCharMentor. grimoire_firstChar {grimoire_firstChar}.} 
            ~ glyph_mainTalker += FirstCharacter
            ~ glyph_mainTalker += Mentor
    
    
    //Chiacchiera tra PNG3 e Mentore
        - third_mentor_chit_chat && grimoire_thirdChar hasnt grimThirdCharMentor:
        {debug_nest: questa eccezione è valida: third_mentor_chit_chat && grimoire_thirdChar hasnt grimThirdCharMentor. grimoire_thirdChar {grimoire_thirdChar}.} 
            ~ glyph_mainTalker += ThirdCharacter
            ~ glyph_mainTalker += Mentor

    }

//Terzo: in cucina, con gli ingredienti, non vogliamo le reazioni delle PNG, perché commenteranno già in automatico, ma il codice attuale non le fermerebbe, perché non sono considertate main talk, per cui devo apportare una correzione.
{
    - glyph_mainTalker == (PG) && entity_location(PG) == Kitchen:
        ~ glyph_allPNGAffectedByChoice = ()
           {debug_nest: siamo in cucina e stiamo per mettere un ingrediente, per cui svuoto glyph_allPNGAffectedByChoice, il cui valore è {glyph_allPNGAffectedByChoice}.} 
}


//Quarto: verifichiamo se il sigillo è o meno da consumare.
    {
        //In teoria è un confronto di lista preciso, per cui se c'è mentore E un'altra persona, a quel punto la condizione non vale
        - glyph_allPNGAffectedByChoice == (Mentor):
            ~ glyph_decreaseSigil = false
        {debug_nest: glyph_allPNGAffectedByChoice == (Mentor), per cui blocco la decrescita del sigillo. glyph_allPNGAffectedByChoice == {glyph_allPNGAffectedByChoice}, glyph_decreaseSigil == {glyph_decreaseSigil}.}     

        - glyph_mainTalker == (PG):
            ~ glyph_decreaseSigil = false
            {debug_nest: glyph_mainTalker == (PG), per cui blocco la decrescita del sigillo. glyph_mainTalker == {glyph_mainTalker}, glyph_decreaseSigil == {glyph_decreaseSigil}.}   

        - else:
            {
                - glyph_actualActiveSigil != ():
                {debug_nest: glyph_actualActiveSigil != (), per cui poi riduco gli usi del sigillo. glyph_actualActiveSigil = {glyph_actualActiveSigil}.}  
                    ~ glyph_decreaseSigil = true

                - else:
                {debug_nest: glyph_actualActiveSigil è vuoto, per cui NON riduco gli usi del sigillo. glyph_actualActiveSigil = {glyph_actualActiveSigil}.}  
                    ~ glyph_decreaseSigil = false    
            }
    }

{debug_nest: dopo il check zero sui presenti, glyph_allPNGAffectedByChoice contiene {glyph_allPNGAffectedByChoice}, mentre glyph_mainTalker è {glyph_mainTalker}.}
->->