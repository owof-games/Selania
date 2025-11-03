=== welcoming_frog
{frogDebug: passo da welcoming_frog.}
    //Prima verifico se ci sono missioni attive e nel caso offro il reminder.
    -> closed_mission_verify ->
    //Altrimenti aggiorno la lista delle cose fatte in autonomia e poi procedo.
    -> discovered_things_updater ->


- (top)
Qui la rana ci saluta.
Arriviamo qui solo se non ci sono quest attive.


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
        {
            - LIST_COUNT(allCharTwoGifts - charTwoGifts) >0:
                Ho ancora qualcosa da donare.
                Vado alla gestione missione
            - else:
                Temo tu sappia già tutto su questo personaggio
        }
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
    
    + [Sorprendimi]
        ~  currentMissionAboutChar = specialDelivery
            //Per queste non passiamo mai dalla verifica dell'autonomia.
            -> missions_dispatcher ->
    -

3. A quest finita pesco da una lista di cose legate alla persona.
4. Per cui mi conviene tenere traccia su chi è stato manifestato l'interesse.
    


->->

//Questa funzione ci permette di levare gli elementi inutili perché scoperti autonomamente (es: ho già fatto un dono).
//Ed è questa la funzione che fa salire il contatore di autonomia.
=== discovered_things_updater ===
{frogDebug: passo da discovered_things_updater.}
{frogDebug: charOneGifts è uguale a {charOneGifts}.}
{frogDebug: charTwoGifts è uguale a {charTwoGifts}.}

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
    
    
    {
        //Ho già fatto il dono (ed è il primo check)
        - secondGift != () && charTwoGifts hasnt charTwoCultivable:
                ~ charTwoGifts += charTwoCultivable
                ~  autonomyMissionsTracker ++
        
        //Ho già cucinato (ed è il primo check). Traccio il nodo più vicino alla fine per prevenire problemi con eventuali crush del gioco
        - ending_cooking_with_second_char && charTwoGifts hasnt charTwoCooking:
                ~ charTwoGifts += charTwoCultivable
                ~  autonomyMissionsTracker ++        
    
    }
    //Ripeto con le altre png
    //E poi ci sono le cose autonome, tipo: ho già parlato di mindfulness con la mentore, per cui levo la missione associata (es: MissionOne) e aumento l'autonomyTracker

-> welcoming_frog.top


=== autonomy_mission_verify ===
//Verifico quante missioni autonome ha fatto la giocatrice.
{frogDebug: passo da autonomy_mission_verify.}


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
        
        - availableMissions == ():
            Non ho più missioni da offrirti, ma hai bisogno di me, per cui ti aiuterò!
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
{frogDebug: passo da missions_dispatcher.}
{frogDebug: currentMissionAboutChar == {currentMissionAboutChar}.}
//Alla fine le missioni sono scollegate dai doni, e sono letteralmente scritte secondo bisogno.
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameThree = translator(thirdCharacterState)
    ~ temp charNameFour = translator(fourthCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)

    {currentMissionAboutChar:
        - specialDelivery:
            -> specialTop
        - else:
            -> top
    
    }


        - (top)
        //Dato che no mi fa fare questa cosa direttamente nella variabile, provo così.
        ~ maxValueDice = (LIST_COUNT(allMissions))
        
        //Tiro il dado
        ~ diceFrog = RANDOM(1,maxValueDice)
        
        {diceFrog:
        
            - 1 && not mission_one:
                -> mission_one
            - 2 && not mission_two:
                -> mission_two
            - 3 && not mission_three:
                -> mission_three
            - 4 && not mission_four:
                -> mission_four
            - 5 && not mission_five:
                -> mission_five
            - 6 && not mission_six:
                -> mission_six
            - 7 && not mission_seven:
                -> mission_seven
            - else:
                {frogDebug: il valore di diceFrog è {diceFrog}, e la missione associata è già stata fatta. Ritiro il dado.}
                -> top
                
        }
    
    - (specialTop)
    ~ maxSpecialValueDice = (LIST_COUNT(availableSpecialMissions))
    ~ diceFrog = RANDOM(1,maxSpecialValueDice)
         
         {diceFrog:
        
            - 1 && not special_mission_one:
                -> special_mission_one
            - 2 && not special_mission_two:
                -> special_mission_two
            - else:
                {frogDebug: il valore di diceFrog è {diceFrog}, e la missione associata è già stata fatta. Ritiro il dado.}
                -> top
                
        }
    
->->



=== closed_mission_verify
{frogDebug: passo da closed_mission_verify.}
    {activeMissions:
        //Qui la logica da implementare sarà: se le condizione è stata risolta (es: nodo attraversato) allora svuoto activeMissions (~ activeMissions == ()) e tolgo la missione da availableMissions, e invio la giocatrice alla parte del dono, altrimenti ho un reminder che mi ricorda di fare la missione.
        - missionOne:
        - missionTwo:
        - missionThree:
        - missionFour:
        - missionFive:
        - missionSix:
        - missionSeven:
        - specialMissionOne:
        - specialMissionTwo:
        - else:
            //Vuol dire che non ci sono missioni attive e posso proporne di nuove, se la rana non risulterà stanca
                -> tired_frog 
    }
->->

=== tired_frog
{frogDebug: passo da tired_frog.}
 ~ temp dice = RANDOM(1,6)

{
    - dice == 6:
        ~ tiredFrog = maxTiredFrog
        -> top
    
    - else:
        -> discovered_things_updater
}
    
- (top)
Frasi random di una rana affaticata

-> main