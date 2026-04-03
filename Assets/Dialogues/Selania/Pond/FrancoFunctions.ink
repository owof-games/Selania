=== function franco_missionsStateUpdater()
//La logica qui è quella di avere un unico canale per vedere se le condizioni per una missione sono state raggiunte o meno.
//A quel punto aggiungo la missione nella lista frog_updatedMissions

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
        - grimoire_firstChar has grimFirstSecondChar && frog_allMissionsCompleted hasnt missionFive:
            ~ frog_updatedMissions += missionFive

    }

    {
        //Sesta missione: conoscere la strega.
        - grimoire_witch has grimWitchIntro:&& frog_allMissionsCompleted hasnt missionSix:
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

















->->