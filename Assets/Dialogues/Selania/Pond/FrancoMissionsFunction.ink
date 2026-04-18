=== function franco_missionsStateUpdater()
{debug_frog: passo da franco_missionsStateUpdater.}
//La logica qui è quella di avere un unico canale per vedere se le condizioni per una commissione sono state raggiunte o meno.
    {  
        //Prima commissione: leggere.
        - first_character_recap.check && second_character_recap.check && greenhouse_recap.check && frog_allMissionsCompleted hasnt missionOne:
            ~ frog_updatedMissions += missionOne
    }

    {
        //Seconda commissione: coltivare.
        - LIST_COUNT(greenhouse_findedCultivables) >= 3 && frog_allMissionsCompleted hasnt missionTwo:
            ~ frog_updatedMissions += missionTwo
    }

    {
        //Terza commissione: parlare di mindfulness con Mentore.
        - mindfulness && frog_allMissionsCompleted hasnt missionThree:
            ~ frog_updatedMissions += missionThree

    }

    {
        //Quarta commissione: parlare di cose strane con Mentore.
        - little_storylets && frog_allMissionsCompleted hasnt missionFour:
            ~ frog_updatedMissions += missionFour

    }

    {
        //Quinta commissione: assistere a una conversazione a due.
        - (grimoire_firstChar has grimFirstSecondChar) or (grimoire_firstChar has grimFirstThirdChar) or (grimoire_firstChar has grimFirstCharMentor) or (grimoire_secondChar has grimSecondCharMentorOne) or (grimoire_secondChar has grimSecondCharMentorPeace) or (grimoire_secondChar has grimSecondThirdChar) or (grimoire_thirdChar has grimThirdCharMentor) or (grimoire_fourthChar has grimFourthFifthChar) && frog_allMissionsCompleted hasnt missionFive:
            ~ frog_updatedMissions += missionFive

    }

    {
        //Sesta commissione: conoscere la strega.
        - grimoire_witch has grimWitchIntro && frog_allMissionsCompleted hasnt missionSix:
            ~ frog_updatedMissions += missionSix

    }

    {
        //Settima commissione: leggere una lettera.
        - (grimoire_firstChar has grimFirstCharLetterOne or grimoire_secondChar has grimSecondCharLetterOne or grimoire_thirdChar has grimThirdCharLetterOne) && frog_allMissionsCompleted hasnt missionSeven:
            ~ frog_updatedMissions += missionSeven

    }

    {
        //Ottava commissione: leggere un racconto.
        - library_readStories != () && frog_allMissionsCompleted hasnt missionEight:
            ~ frog_updatedMissions += missionEight

    }

    //Nona commissione: non si può generare in automatico

    {
       //Decima commissione: aggiungere un ingrediente extra in cucina.
        - (kitchen_firstCharExtraIngredient != () or kitchen_secondCharExtraIngredient != () or kitchen_thirdCharExtraIngredient!= () or kitchen_fourthCharExtraIngredient!=() or kitchen_fifthCharExtraIngredient != ()) && frog_allMissionsCompleted hasnt missionTen:
            ~ frog_updatedMissions += missionTen

    }

{debug_frog: dopo franco_missionsStateUpdater frog_updatedMissions contiene {frog_updatedMissions}.}

=== franco_missionsDispatcher
{debug_frog: passo da franco_missionsDispatcher.}
//Primo step: verifico se ci sono commissioni da togliere dalla lista perché non sono state raggiunte le condizioni per attivarle.

    //Commissione sei richiede invito strega a parlarle
    {
        - frog_allMissionsCompleted hasnt missionSix && player_accessiblePlaces has Dump:
            {debug_frog: ci sono le condizioni per abilitare missionSix.}
            ~ frog_availableCommonMissions += missionSix

        - else:
            ~ frog_availableCommonMissions -= missionSix
            {debug_frog: NON ci sono le condizioni per abilitare missionSix.}    
    }


    //Commissione sette richiede la presenza di Ursula alla stazione
    {
        - frog_allMissionsCompleted hasnt missionSeven && (contentsTrainStop has DoggoFirstLetters) or (contentsTrainStop has DoggoSecondLetters) or (contentsTrainStop has DoggoThirdLetters):
        {debug_frog: ci sono le condizioni per abilitare missionSeven.}
            ~ frog_availableCommonMissions += missionSeven

        - else:
            ~ frog_availableCommonMissions -= missionSeven
            {debug_frog: NON ci sono le condizioni per abilitare missionSeven.}      
    }

    //Commissione otto richiede che la biblioteca sia aperta
    {
        - frog_allMissionsCompleted hasnt missionEight && player_accessiblePlaces has Library:
            ~ frog_availableCommonMissions += missionEight
            {debug_frog: ci sono le condizioni per abilitare missionEight.}

        - else:
            ~ frog_availableCommonMissions -= missionEight 
            {debug_frog: NON ci sono le condizioni per abilitare missionEight.} 
    }

    //Commissione nove richiede che almeno una riscrittura sia stata conclusa, così che ci sia il ritratto in camera
    {
        - frog_allMissionsCompleted hasnt missionNine && story_endedStories != ():
                ~ frog_availableCommonMissions += missionNine
            {debug_frog: ci sono le condizioni per abilitare missionNine.}

        - else:
            ~ frog_availableCommonMissions -= missionNine
            {debug_frog: NON ci sono le condizioni per abilitare missionNine.}  
    }

    //Commissione dieci richiede che la cucina sia aperta
    //Dato che devo essere sicura di darla quando c'è la possibilità di chiuderla in tempi decenti, per evitare di assegnarla nel primo atto (3 png da riscrivere) quando hanno già concluso il loro percorso in cucina, faccio due calcoli separati.
    {
        - frog_allMissionsCompleted hasnt missionTen && player_accessiblePlaces has Kitchen:
            {

                //Check per parte Chitarra, Riccio e Boccale   
                - LIST_COUNT(story_endedStories) <= 3 && (grimoire_firstChar hasnt grimFirstCharKitchenEnded or grimoire_secondChar hasnt grimSecondCharKitchenEnded or grimoire_thirdChar hasnt grimThirdCharKitchenEnded):
                        ~ frog_availableCommonMissions += missionTen
                    {debug_frog: ci sono le condizioni per abilitare missionTen.}

                //Check per parte Nonna e Mentore
                - LIST_COUNT(story_endedStories) > 3 &&  (grimoire_fourthChar hasnt grimFourthCharKitchenEnded or grimoire_fifthChar hasnt grimFifthCharKitchenEnded):
                        ~ frog_availableCommonMissions += missionTen
                    {debug_frog: ci sono le condizioni per abilitare missionTen.}
            
            }

        - else:
            ~ frog_availableCommonMissions -= missionTen
            {debug_frog: NON ci sono le condizioni per abilitare missionTen.}  
    }

    //Commissione speciale uno richiede l'apertura del nido e che sia stato creato almeno un sigillo. Strega all'inizio ce ne dona tre, per cui il conto è >3.
    {
        - (frog_allMissionsCompleted hasnt specialMissionOne) && (player_accessiblePlaces has Nest) && (glyph_discoveredSigils != ()):
            ~ frog_availableSpecialMissions += specialMissionOne
            {debug_frog: ci sono le condizioni per abilitare specialMissionOne.}

        - else:
            ~ frog_availableSpecialMissions -= specialMissionOne
            {debug_frog: NON ci sono le condizioni per abilitare specialMissionOne.}
             
    }

    //Commissione speciale due richiede l'apertura della cucina e che sia vuota.
    {
        - frog_allMissionsCompleted hasnt specialMissionTwo && player_accessiblePlaces has Kitchen && kitchen_kitchenOccupied == false:
            ~ frog_availableSpecialMissions += specialMissionTwo
            {debug_frog: ci sono le condizioni per abilitare specialMissionTwo.}

        - else:
            ~ frog_availableSpecialMissions -= specialMissionTwo
            {debug_frog: NON ci sono le condizioni per abilitare specialMissionTwo.}  
    }


{debug_frog: dopo tutti i check, le commissioni disponibili sono per frog_availableSpecialMissions {frog_availableSpecialMissions} e per frog_availableCommonMissions {frog_availableCommonMissions}. frog_pauseSpecialMission è {frog_pauseSpecialMission}.}

//Secondo step, assegno una commissione a caso, passando prima da quelle prioritarie, e poi dalle altre.
    ~ temp newMission = ()
    {
        - frog_availableSpecialMissions != () && frog_pauseSpecialMission <= 0:
            ~ newMission = LIST_MIN(frog_availableSpecialMissions)
            ~ frog_currentMission += newMission
            ~ frog_availableSpecialMissions -= newMission

        - frog_availableCommonMissions != ():
            ~ newMission = LIST_RANDOM(frog_availableCommonMissions)
            ~ frog_currentMission += newMission
            ~ frog_availableCommonMissions -= newMission

        - else:
            {
                - LIST_COUNT(frog_allMissionsCompleted) < LIST_COUNT(frog_allAvailableMissions):
                    {charTag(Franco, "{portrait_Franco()}")}:           Girino!
                    {shuffle:
                                                                    -   Per ora non ho commissioni da offrirti, ma non ti preoccupare, qualcosa poi me lo invento! Torna più tardi.
                                                                    -   Sono in attesa della carpa che mi porta le commissioni, torna più tardi!
                                                                    -   Sembra che per ora tutto vada bene, ma se torni più tardi magari ho nuove cose da farti fare!
                    }
                    
        
                        -> main

                - else:
                    {charTag(Franco, "{portrait_Franco()}")}:       Girino!
                                                                    Ma sai che hai fatto tuuuuuuutte le commissioni che potevo offrirti?
                                                                    Però possiamo rilassarci assieme!
                        -> main

            }    

    }

//Terzo step: faccio il dispatch effettivo delle commissioni.
    {newMission:
        
        - missionOne:
            -> mission_one

        - missionTwo:
            -> mission_two

        - missionThree:
            -> mission_three

        - missionFour:
            -> mission_four

        - missionFive:
            -> mission_five

        - missionSix:
            -> mission_six

        - missionSeven:
            -> mission_seven

        - missionEight:
            -> mission_eight

        - missionNine:
            -> mission_nine

        - missionTen:
            -> mission_ten        

        - specialMissionOne:
            -> special_mission_one

        - specialMissionTwo:
            -> special_mission_two
    }

->->  
