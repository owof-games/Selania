=== function franco_missionsStateUpdater()
{debug_frog: passo da franco_missionsStateUpdater.}
//La logica qui è quella di avere un unico canale per vedere se le condizioni per una missione sono state raggiunte o meno.
    {  
        //Prima missione: leggere.
        - first_character_recap.check && second_character_recap.check && greenhouse_recap.check && frog_allMissionsCompleted hasnt missionOne:
            ~ frog_updatedMissions += missionOne
    }

    {
        //Seconda missione: coltivare.
        - LIST_COUNT(greenhouse_findedCultivables) == 3 && frog_allMissionsCompleted hasnt missionTwo:
            ~ frog_updatedMissions += missionTwo
    }

    {
        //Terza missione: parlare di mindfulness con Mentore.
        - mindfulness && frog_allMissionsCompleted hasnt missionThree:
            ~ frog_updatedMissions += missionThree

    }

    {
        //Quarta missione: parlare di cose strane con Mentore.
        - little_storylets && frog_allMissionsCompleted hasnt missionFour:
            ~ frog_updatedMissions += missionFour

    }

    {
        //Quinta missione: assistere a una conversazione a due.
        - (grimoire_firstChar has grimFirstSecondChar) or (grimoire_firstChar has grimFirstThirdChar) or (grimoire_firstChar has grimFirstCharMentor) or (grimoire_secondChar has grimSecondCharMentorOne) or (grimoire_secondChar has grimSecondCharMentorPeace) or (grimoire_secondChar has grimSecondThirdChar) or (grimoire_thirdChar has grimThirdCharMentor) or (grimoire_fourthChar has grimFourthFifthChar) && frog_allMissionsCompleted hasnt missionFive:
            ~ frog_updatedMissions += missionFive

    }

    {
        //Sesta missione: conoscere la strega.
        - grimoire_witch has grimWitchIntro && frog_allMissionsCompleted hasnt missionSix:
            ~ frog_updatedMissions += missionSix

    }

    {
        //Settima missione: leggere una lettera.
        - (grimoire_firstChar has grimFirstCharLetterOne or grimoire_secondChar has grimSecondCharLetterOne or grimoire_thirdChar has grimThirdCharLetterOne) && frog_allMissionsCompleted hasnt missionSeven:
            ~ frog_updatedMissions += missionSeven

    }

    {
        //Ottava missione: leggere un racconto.
        - library_readStories != () && frog_allMissionsCompleted hasnt missionEight:
            ~ frog_updatedMissions += missionEight

    }

{debug_frog: dopo franco_missionsStateUpdater frog_updatedMissions contiene {frog_updatedMissions}.}

=== franco_missionsDispatcher
{debug_frog: passo da franco_missionsDispatcher.}
//Primo step: verifico se ci sono missioni da togliere dalla lista perché non sono state raggiunte le condizioni per attivarle.

    //Missione sei richiede invito strega a parlarle
    {
        - frog_allMissionsCompleted hasnt missionSix && player_accessiblePlaces has Dump:
            ~ frog_availableCommonMissions += missionSix

        - else:
            ~ frog_availableCommonMissions -= missionSix        
    }


    //Missione sette richiede la presenza di Ursula alla stazione
    {
        - frog_allMissionsCompleted hasnt missionSeven && (contentsTrainStop has DoggoFirstLetters) or (contentsTrainStop has DoggoSecondLetters) or (contentsTrainStop has DoggoThirdLetters):
            ~ frog_availableCommonMissions += missionSeven

        - else:
            ~ frog_availableCommonMissions -= missionSeven        
    }

    //Missione otto richiede che la biblioteca sia aperta
    {
        - frog_allMissionsCompleted hasnt missionEight && player_accessiblePlaces has Library:
            ~ frog_availableCommonMissions += missionEight

        - else:
            ~ frog_availableCommonMissions -= missionEight        
    }

    //Missione speciale uno richiede l'apertura del nido e che sia stato creato almeno un sigillo. Strega all'inizio ce ne dona tre, per cui il conto è >3.
    {
        - frog_allMissionsCompleted hasnt specialMissionOne && player_accessiblePlaces has Nest && LIST_COUNT(glyph_discoveredSigils) > 3:
            ~ frog_availableSpecialMissions += specialMissionOne

        - else:
            ~ frog_availableSpecialMissions -= specialMissionOne        
    }

    //Missione speciale due richiede l'apertura della cucina e che sia vuota.
    {
        - frog_allMissionsCompleted hasnt specialMissionTwo && player_accessiblePlaces has Kitchen:
            ~ frog_availableSpecialMissions += specialMissionTwo

        - else:
            ~ frog_availableSpecialMissions -= specialMissionTwo        
    }


//Secondo step, assegno una missione a caso, passando prima da quelle prioritarie, e poi dalle altre.
    ~ temp newMission = ()
    {
        - frog_availableSpecialMissions != () && frog_pauseSpecialMission == 0:
            ~ newMission = LIST_RANDOM(frog_availableSpecialMissions)
            ~ frog_currentMission += newMission
            ~ frog_availableSpecialMissions -= newMission

        - frog_availableCommonMissions != ():
            ~ newMission = LIST_RANDOM(frog_availableCommonMissions)
            ~ frog_currentMission += newMission
            ~ frog_availableCommonMissions -= newMission

        - else:
            {
                - LIST_COUNT(frog_allMissionsCompleted) < LIST_COUNT(frog_allAvailableMissions):
                    Girino! #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Per ora non ho missioni da offrirti, ma non ti preoccupare, qualcosa poi me lo invento!
                    Torna più tardi.
                    E fatti anche tu un pisolino!
                        -> main

                - else:
                    Girino! #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Ma sai che hai fatto tuuuuuuutto quello che posso offrirti?
                    Però possiamo rilassarci assieme!
                        -> main

            }    

    }

//Terzo step: faccio il dispatch effettivo delle missioni.
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

        - specialMissionOne:
            -> special_mission_one

        - specialMissionTwo:
            -> special_mission_two
    }

->->  
