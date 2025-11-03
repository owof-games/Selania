//Liste di gestione
LIST missionAboutChar = missionCharOne, missionCharTwo, missionCharThree, missionCharFour, missionCharFive, missionObjects
LIST allMissions = chordMission, mindfulnessMission
LIST allCharOneGifts = charOneCultivable, charOneCooking, charOneEmotionalWord, charOneLibrary

VAR currentMissionAboutChar = ()

//Devo poi tracciare la quantità di cose che rana mi può dare su una persona, e che sono per lo più legate a nodi, perché sono il dono giusto, le scelte giuste da dire, al max una formula utile per parlare con quella persona.
VAR charOneGifts = ()

//E il tracciamento dell'autonomia
VAR autonomyMissionsGifter = 3
VAR autonomyMissionsTracker = 0

=== welcoming_frog
{frogDebug: passo da welcoming_frog.}
    -> discovered_things_updater ->

Qui la rana ci saluta
        {
        
            - questActive != ():
            Se ci sono quest attive, ci rimanda al reminder
                -> quest_remind
        }
Se non ci sono quest attive, ci chiede che cosa ci serva.


    + {firstStory == StoryStarted} [Chitarra]
        ~  currentMissionAboutChar = missionCharOne
        {
            - LIST_COUNT(allCharOneGifts - charOneGifts) >0:
                Ho ancora qualcosa da donare.
                Vado alla gestione missione
            - else:
                Temo tu sappia già tutto su questo personaggio
        }
            -> autonomy_mission_verify
        
    + {secondStory == StoryStarted} [Riccio]
        ~  currentMissionAboutChar = missionCharTwo
            -> autonomy_mission_verify
        
    + {thirdStory == StoryStarted} [PNG 3]
        ~  currentMissionAboutChar = missionCharThree
            -> autonomy_mission_verify
        
    + {fourthStory == StoryStarted} [PNG 4]
        ~  currentMissionAboutChar = missionCharFour
            -> autonomy_mission_verify
        
    + {fifthStory == StoryStarted} [PNG 5 (non come mentore)]
        ~  currentMissionAboutChar = missionCharFive
            -> autonomy_mission_verify
        
    + [Oggetti]
         ~  currentMissionAboutChar = missionObjects
            -> autonomy_mission_verify
    -

3. A quest finita pesco da una lista di cose legate alla persona.
4. Per cui mi conviene tenere traccia su chi è stato manifestato l'interesse.
    


->->

//Questa funzione ci permette di levare gli elementi inutili perché scoperti autonomamente (es: ho già fatto un dono).
//Ed è questa la funzione che fa salire il contatore di autonomia.
=== discovered_things_updater ===
{frogDebug: passo da discovered_things_updater.}
{frogDebug: charOneGifts è uguale a {charOneGifts}.}

    {
        //Ho già fatto il dono (ed è il primo check)
        - firstGift != () && charOneGifts hasnt charOneCultivable:
                ~ charOneGifts += charOneCultivable
                ~  autonomyMissionsTracker ++
        
        //Ho già cucinato (ed è il primo check). Traccio il nodo più vicino alla fine per prevenire problemi con eventuali crush del gioco
        - ending_cooking_with_first_char && charOneGifts hasnt charOneCooking:
                ~ charOneGifts += charOneCultivable
                ~  autonomyMissionsTracker ++        
    
    }
    //Ripeto con le altre png


->->


=== autonomy_mission_verify ===
//Verifico quante missioni autonome ha fatto la giocatrice.
{frogDebug: charOneGifts è uguale a {charOneGifts}.}

    {
        - autonomyMissionsTracker >= autonomyMissionsGifter:
            Woah, stai facendo un sacco di cose in autonomia!
            Per cui ti aiuto senza chiederti di fare cose.
            {
                - missionCharOne:
                - missionCharTwo:
                - missionCharThree:
                - missionCharFour:
                - missionCharFive:
                - missionObjects:
            }
            
        - else:
            -> missions_dispatcher
    }

->->



=== missions_dispatcher ===







->->