=== discovered_things_updater ===
//Questo nodo mi permette di aggiornare sempre come prima cosa lo stato delle missioni autonome, e di eliminare le eventuali quest fatte di già senza dover tracciare le condizioni mille volte.
{frogDebug: passo da discovered_things_updater.}
{frogDebug: charOneGifts è uguale a {charOneGifts}.}
{frogDebug: charTwoGifts è uguale a {charTwoGifts}.}

        //Aggiornare lo stato delle cose che posso donare o meno alla PG
        {
            //Ho già fatto il dono (ed è il primo check)
            - firstGift != () && charOneGifts hasnt charOneCultivable:
                    ~ charOneGifts += charOneCultivable
    
            
            //Ho già cucinato (ed è il primo check). Traccio il nodo più vicino alla fine per prevenire problemi con eventuali crush del gioco
            - ending_cooking_with_first_char && charOneGifts hasnt charOneCooking:
                    ~ charOneGifts += charOneCooking
        
        }
        
        
        {
            //Ho già fatto il dono (ed è il primo check)
            - secondGift != () && charTwoGifts hasnt charTwoCultivable:
                    ~ charTwoGifts += charTwoCultivable
    
            
            //Ho già cucinato (ed è il primo check). Traccio il nodo più vicino alla fine per prevenire problemi con eventuali crush del gioco
            - ending_cooking_with_second_char && charTwoGifts hasnt charTwoCooking:
                    ~ charTwoGifts += charTwoCooking
        
        }
    //Ripeto con le altre png
    

-> welcoming_frog.top



=== autonomy_mission_verify ===
//Verifico quante missioni autonome ha fatto la giocatrice.
{frogDebug: passo da autonomy_mission_verify.}
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameThree = translator(thirdCharacterState)
    ~ temp charNameFour= translator(fourthCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)

    //Missione uno: utilizzo del libro della riscrittora.
        {
            - first_character_recap.check && second_character_recap.check && greenhouse_recap.check && availableMissions has missionOne:
                ~ availableMissions -= missionOne
                
                Stavo per chiederti di consultare in profondità il libro che ti è stato donato, ma ho visto che hai già fatto senza di me! Per cui: ecco il tuo dono!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    -> frog_gift_dispatcher
        }
        
    //Missione due: coltivare almeno tre piante in serra.
        {
            - LIST_COUNT(backupCultivable) < 12 && availableMissions has missionTwo:
                ~ availableMissions -= missionTwo
                
                Stavo per chiederti di coltivare almeno tre piante in serra, ma ho visto che hai già fatto senza di me! Per cui: ecco il tuo dono!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                -> frog_gift_dispatcher
        }
        
    //Missione tre: mindfulness
        {
            - mindfulness && availableMissions has missionThree:
                ~ availableMissions -= missionThree
                Stavo per chiederti di parlare di benessere con Mentore, ma ho visto che hai già fatto senza di me! Per cui: ecco il tuo dono!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                -> frog_gift_dispatcher                      
        }
        
    //Missione quattro: gossips 
        {
            - little_storylets && availableMissions has missionFour:
                ~ availableMissions -= missionFour
                Stavo per chiederti di raccontare a Mentore le stranezze che hai incontrato in questo luogo, ma ho visto che hai già fatto in autonomia!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                Per cui: ecco il tuo dono!
                -> frog_gift_dispatcher                        
        }
        
        
    //Missione cinque: chiacchiere tra PNG 
        {
            - first_second_chit_chat && availableMissions has missionFive:
                ~ availableMissions -= missionFive
                Stavo per dirti di provare a vedere cosa succede quando due persone sono vicine.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                E invece mi hai battuto, assistendo alla conversazione tra Chitarra e Riccio.
                Questa cosa accadrà altre volte, per cui: se vedi due personagge nello stesso luogo, prova a vedere se hanno qualcosa da dirsi.
                Nel mentre: ecco il tuo dono!
                -> frog_gift_dispatcher                        
        }
        
    //Missione sei: conoscere la strega
        {
            - talking_witch.intro && availableMissions has missionSix:
                ~ availableMissions -= missionSix
                Stavo per invitarti a parlare con l'albero della foresta, ma mi hai battuto sul tempo.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                Per cui: ecco il tuo dono!
                -> frog_gift_dispatcher                        
        }
        
    //Missione sette: leggere una lettera
        {
            - first_character_notes.check or second_character_notes.check && availableMissions has missionSeven:
                ~ availableMissions -= missionSeven
                Stavo per chiederti di leggere una delle lettere che hai ricevuto sulla bacheca, ma mi hai battuto sul tempo.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                Per cui: ecco il tuo dono!
                -> frog_gift_dispatcher                        
        }
        
    //Missione otto: leggere un libro della biblioteca
        {
            - readStories != () && availableMissions has missionEight:
                ~ availableMissions -= missionEight
                Stavo per chiederti di leggere una delle storie della biblioteca, ma mi hai battuto sul tempo.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                Per cui: ecco il tuo dono!
                -> frog_gift_dispatcher                        
        } 

        {
            - availableMissions == ():
                Non ho più missioni da offrirti, ma hai bisogno di me, per cui ti aiuterò!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    -> frog_gift_dispatcher  
                
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

    {
        - currentMissionAboutChar has specialDelivery:
            -> specialTop
        - else:
            -> top
    
    }


        - (top)
        //Dato che no mi fa fare questa cosa direttamente nella variabile, provo così.
        //~ maxValueDice = LIST_COUNT(allMissions)
        
        //Tiro il dado
        ~ diceFrog = RANDOM(1,8)
        
        {diceFrog:
        
            - 1 && availableMissions has missionOne:
                -> mission_one
            - 2 && availableMissions has missionTwo:
                -> mission_two
            - 3 && availableMissions has missionThree:
                -> mission_three
            - 4 && availableMissions has missionFour:
                -> mission_four
            - 5 && availableMissions has missionFive:
                -> mission_five
            - 6 && availableMissions has missionSix && ((firstStory == StoryEnded) or (secondStory == StoryEnded) or (thirdStory == StoryEnded)):
                -> mission_six
            - 7 && availableMissions has missionSeven && (trainStopContents has FirstCharacterNotes) or (trainStopContents has SecondCharacterNotes):
                -> mission_seven
            - 8 && playerAccessiblePlaces has Library:
                -> mission_eight
            - else:
                {frogDebug: il valore di diceFrog è {diceFrog}, e la missione associata è già stata fatta. Ritiro il dado.}
                -> top
                
        }
    
    - (specialTop)
    //~ maxSpecialValueDice = (LIST_COUNT(availableSpecialMissions))
    ~ diceFrog = RANDOM(1,2)
         
         {diceFrog:
        
            - 1 && availableSpecialMissions has specialMissionOne && playerAccessiblePlaces has Nest:
                -> special_mission_one
            - 2 && availableSpecialMissions has specialMissionTwo && playerAccessiblePlaces has Kitchen:
                -> special_mission_two
            - else:
                {frogDebug: il valore di diceFrog è {diceFrog}, e la missione associata è già stata fatta. Ritiro il dado.}
                -> specialTop
                
        }
    
->->


=== closed_mission_verify
{frogDebug: passo da closed_mission_verify.}
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameThree = translator(thirdCharacterState)
    ~ temp charNameFour= translator(fourthCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    
    {activeMissions:
        //Qui la logica da implementare sarà: se le condizione è stata risolta (es: nodo attraversato) allora svuoto activeMissions (~ activeMissions = ()) e tolgo la missione da availableMissions, e invio la giocatrice alla parte del dono, altrimenti ho un reminder che mi ricorda di fare la missione.
        - missionOne:
            {
                - first_character_recap.check && second_character_recap.check && greenhouse_recap.check:
                    Hai letto le pagine del libro, grande {name}!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Direi che la missione è conclusa, e quindi possiamo parlare del tuo dono.
                        ~ activeMissions = ()
                        ~ availableMissions -= missionOne
                            -> frog_gift_dispatcher
                
                - else:
                    Ricorda {name}: leggere è importante!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Torna da me quando avrai esplorato il tuo libro.
                        -> main
            
            }
            
        - missionTwo:
            {
                - LIST_COUNT(backupCultivable) < 12:
                    La serra sta crescendo grazie a te, {name}!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Direi che la missione è conclusa, e quindi possiamo parlare del tuo dono.
                        ~ availableMissions -= missionTwo
                        ~ activeMissions = ()
                            -> frog_gift_dispatcher
                - else:
                    Ricorda {name}: la serra ha bisogno di te.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Torna da me quando avrai almeno tre piante fiorite.
                        -> main            
            }
            
        - missionThree:
            {
                - mindfulness:
                    Grazie per aver parlato con Mentore, {name}!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Son sicuro che si sente più utile ora.
                    Direi che la missione è conclusa, e quindi possiamo parlare del tuo dono.
                        ~ availableMissions -= missionThree
                        ~ activeMissions = ()
                            -> frog_gift_dispatcher
                - else:
                    Ricorda {name}: Mentore vuole condividere con te i suoi consigli per farti sentire meglio.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Torna da me quando le avrai parlato del tuo benessere.
                        -> main  
            }
            
        - missionFour:
            {
                - little_storylets:
                    Grazie per aver condiviso le cose che hai scoperto con Mentore, {name}!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Direi che la missione è conclusa, e quindi possiamo parlare del tuo dono.
                        ~ availableMissions -= missionFour
                        ~ activeMissions = ()
                            -> frog_gift_dispatcher
                - else:
                    Ricorda {name}: Mentore ci tiene a sentire le cose che hai scoperto su questo luogo.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Torna da me quando avrai condiviso con lei qualcosa di insolito.
                        -> main  
            }        
        
        - missionFive:
            {
                - first_second_chit_chat:
                    Hai ascoltato la conversazione tra Chitarra e Riccio, e ne sono felice {name}!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Anche se è difficile come posizione per unx Riscrittora: spesso una scelta in queste condizioni può far felice una persona, e scontentare l'altra.
                    Questa cosa accadrà altre volte, per cui: se vedi due personagge nello stesso luogo, prova a vedere se hanno qualcosa da dirsi.
                    
                    Direi che la missione è conclusa, e quindi possiamo parlare del tuo dono.
                        ~ availableMissions -= missionFive
                        ~ activeMissions = ()
                            -> frog_gift_dispatcher
                - else:
                    Ricorda {name}: prova a parlare con Riccio e Chitarra quando sono assieme.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Torna da me quando avrai sentito cosa hanno da dirsi.
                        -> main  
            }         
        
        - missionSix:
            {
                - talking_witch.intro:
                    Hai parlato con l'albero, {name}!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    E non sta a me chiederti cosa vi siete dett3, ma spero tu possa aver trovato un'alleata in questo percorso.
                    
                    Direi che la missione è conclusa, e quindi possiamo parlare del tuo dono.
                        ~ availableMissions -= missionSix
                        ~ activeMissions = ()
                            -> frog_gift_dispatcher
                - else:
                    Ricorda {name}: prova a parlare con l'albero della foresta.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    E poi torna da me.
                        -> main  
            } 
        
        - missionSeven:
            {
                - first_character_notes.check or second_character_notes.check:
                    Hai letto la lettera che ti è stata inviata, {name}!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Ricordati di darci un'occhiata ogni tanto, così da sapere come avanza la storia delle persone che hai aiutato.
                    
                    Direi che la missione è conclusa, e quindi possiamo parlare del tuo dono.
                        ~ availableMissions -= missionSeven
                        ~ activeMissions = ()
                            -> frog_gift_dispatcher
                - else:
                    Ricorda {name}: leggi la lettera che hai ricevuto alla fermata del treno.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    E poi torna da me.
                        -> main  
            }
        
        - missionEight:
            {
                - readStories != ():
                    Hai letto una della storie della biblioteca, {name}!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    La biblioteca è un posto di riposo, ma non solo.
                    Anche alle persone che popolano questo posto piace leggere.
                    E a volte, se avete avuto una lettura in comune, potresti scoprire qualcosa di più su di loro.
                    
                    Direi che la missione è conclusa, e quindi possiamo parlare del tuo dono.
                        ~ availableMissions -= missionEight
                        ~ activeMissions = ()
                            -> frog_gift_dispatcher
                - else:
                    Ricorda {name}: leggi una delle storie della biblioteca.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    E poi torna da me.
                        -> main  
            }
        
        - specialMissionOne:
            {
                - special_mission_one_dialogue:
                    Hai assistito alla discussione tra Riccio e Mentore, {name}.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    {
                        - special_mission_one_dialogue.not_intervention:
                            E hai deciso di non intervenire.
                        
                        - special_mission_one_dialogue.pro_mentor:
                            E hai deciso di appoggiare Mentore.
                        
                        - special_mission_one_dialogue.pro_riccio:
                            E hai deciso di appoggiare Riccio.
                        
                        - special_mission_one_dialogue.disagree:
                            E hai detto qualcosa contro entrMbi.
                        
                        - special_mission_one_dialogue.paracula:
                            E hai detto qualcosa a favore di entrambi.
                    }
                L'armonia è importante.
                Per questo ti dono una nota, che troverai al Nido.
                    ~ move_entity(purpleShell, Nest)
                    ~ availableSpecialMissions -= specialMissionOne
                    ~ activeMissions = ()
                    -> main
                    
                - else:
                Ricorda {name}: ascolta la discussione tra Mentore e Riccio.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    E poi torna da me.
                    -> main
            }
            
        - specialMissionTwo:
            {
                - cooking_alone :
                    Hai cucinato in autonomia, {name}.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Per questo ti dono una ingrediente universale, che potrai utilizzare per cucinare con le altre persone, e apprezzeranno sempre.
                    
                    ~ findedGifts += universalIngredient
                    ~ availableSpecialMissions -= specialMissionTwo
                    ~ activeMissions = ()
                    -> main
                    
                - else:
                Ricorda {name}: ascolta la discussione tra Mentore e Riccio.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    E poi torna da me.
                    -> main
            }
            
        
        - else:
            //Vuol dire che non ci sono missioni attive e posso proporne di nuove, se la rana non risulterà stanca
            {
                //Ma voglio evitare questa cosa per la prima missione.
                - !missions_dispatcher:
                    -> discovered_things_updater
                    
                - else:
                    -> tired_frog 
            }
    }
->->

=== tired_frog
{frogDebug: passo da tired_frog.}
 ~ temp dice = RANDOM(1,5)
 
{
    - dice == 5:
        ~ tiredFrog = maxTiredFrog
            -> top
    
    - else:
        -> discovered_things_updater
}
    
- (top)
Frasi random di una rana affaticata#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral

-> main


=== cultivable_recovery
{frogDebug: passo da cultivable_recovery.}
Vorrei recuperare...

    + {growthBaccaDellaAddolorata == stepThree && findedGifts hasnt BaccaDellaAddolorata} [{ingredientTranslator(BaccaDellaAddolorata)}]
            ~  currentMissionAboutChar = missionObjects
            ~  searchedCultivableRecovery = BaccaDellaAddolorata
            -> autonomy_mission_verify
            
    + {growthBarbaDellInciampo == stepThree && findedGifts hasnt BarbaDellInciampo} [{ingredientTranslator(BarbaDellInciampo)}]
            ~  currentMissionAboutChar = missionObjects
            ~  searchedCultivableRecovery = BarbaDellInciampo
            -> autonomy_mission_verify
            
    + {growthBastoneDellOzioso == stepThree && findedGifts hasnt BastoneDellOzioso}[{ingredientTranslator(BastoneDellOzioso)}]
            ~  currentMissionAboutChar = missionObjects
            ~  searchedCultivableRecovery = BastoneDellOzioso
            -> autonomy_mission_verify
            
    + {growthBrinaDellImpossibile == stepThree && findedGifts hasnt BrinaDellImpossibile}[{ingredientTranslator(BrinaDellImpossibile)}]
            ~  currentMissionAboutChar = missionObjects
            ~  searchedCultivableRecovery = BrinaDellImpossibile
            -> autonomy_mission_verify
            
    + {growthCantoDelleCompagne == stepThree && findedGifts hasnt CantoDelleCompagne} [{ingredientTranslator(CantoDelleCompagne)}]
            ~  currentMissionAboutChar = missionObjects
            ~  searchedCultivableRecovery = CantoDelleCompagne
            -> autonomy_mission_verify
            
    + {growthCardoAspinato == stepThree && findedGifts hasnt CardoAspinato} [{ingredientTranslator(CardoAspinato)}]
            ~  currentMissionAboutChar = missionObjects
            ~  searchedCultivableRecovery = CardoAspinato
            -> autonomy_mission_verify
            
    + {growthEderaDelleAmanti == stepThree && findedGifts hasnt EderaDelleAmanti} [{ingredientTranslator(EderaDelleAmanti)}]
            ~  currentMissionAboutChar = missionObjects
            ~  searchedCultivableRecovery = EderaDelleAmanti
            -> autonomy_mission_verify
            
    + {growthErbaLiccia == stepThree && findedGifts hasnt ErbaLiccia} [{ingredientTranslator(ErbaLiccia)}]
            ~  currentMissionAboutChar = missionObjects
            ~  searchedCultivableRecovery = BaccaDellaAddolorata
            -> autonomy_mission_verify
            
    + {growthFalsaPalude == stepThree && findedGifts hasnt FalsaPalude} [{ingredientTranslator(FalsaPalude)}]
            ~  currentMissionAboutChar = missionObjects
            ~  searchedCultivableRecovery = FalsaPalude
            -> autonomy_mission_verify
            
    + {growthLanaNotturna == stepThree && findedGifts hasnt LanaNotturna} [{ingredientTranslator(LanaNotturna)}]
            ~  currentMissionAboutChar = missionObjects
            ~  searchedCultivableRecovery = LanaNotturna
            -> autonomy_mission_verify
            
    + {growthLicheneDegliAbissi == stepThree && findedGifts hasnt LicheneDegliAbissi} [{ingredientTranslator(LicheneDegliAbissi)}]
            ~  currentMissionAboutChar = missionObjects
            ~  searchedCultivableRecovery = LicheneDegliAbissi
            -> autonomy_mission_verify
            
    + {growthNonTiScordarDiTe == stepThree && findedGifts hasnt NonTiScordarDiTe} [{ingredientTranslator(NonTiScordarDiTe)}]
            ~  currentMissionAboutChar = missionObjects
            ~  searchedCultivableRecovery = NonTiScordarDiTe
            -> autonomy_mission_verify
            
    + {growthOlobino == stepThree && findedGifts hasnt Olobino} [{ingredientTranslator(Olobino)}]
            ~  currentMissionAboutChar = missionObjects
            ~  searchedCultivableRecovery = Olobino
            -> autonomy_mission_verify
            
    + {growthLaSpazzata == stepThree && findedGifts hasnt LaSpazzata} [{ingredientTranslator(LaSpazzata)}]
            ~  currentMissionAboutChar = missionObjects
            ~  searchedCultivableRecovery = LaSpazzata
            -> autonomy_mission_verify
            
    
    + [Ho cambiato idea.]
        -> welcoming_frog.top
    
           
