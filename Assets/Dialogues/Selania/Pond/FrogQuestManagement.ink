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
                    -> frog_about_who_questions
        }
        
    //Missione due: coltivare almeno tre piante in serra.
        {
            - LIST_COUNT(backupCultivable) < 12 && availableMissions has missionTwo:
                ~ availableMissions -= missionTwo
                
                Stavo per chiederti di coltivare almeno tre piante in serra, ma ho visto che hai già fatto senza di me! Per cui: ecco il tuo dono!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                -> frog_about_who_questions
        }
        
    //Missione tre: mindfulness
        {
            - mindfulness && availableMissions has missionThree:
                ~ availableMissions -= missionThree
                Stavo per chiederti di parlare di benessere con Mentore, ma ho visto che hai già fatto senza di me! Per cui: ecco il tuo dono!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                -> frog_about_who_questions                      
        }
        
    //Missione quattro: gossips 
        {
            - little_storylets && availableMissions has missionFour:
                ~ availableMissions -= missionFour
                Stavo per chiederti di raccontare a Mentore le stranezze che hai incontrato in questo luogo, ma ho visto che hai già fatto in autonomia!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                Per cui: ecco il tuo dono!
                -> frog_about_who_questions                        
        }
        
        
    //Missione cinque: chiacchiere tra PNG 
        {
            - first_second_chit_chat && availableMissions has missionFive:
                ~ availableMissions -= missionFive
                Stavo per dirti di provare a vedere cosa succede quando due persone sono vicine.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                E invece mi hai battuto, assistendo alla conversazione tra Chitarra e Riccio.
                Questa cosa accadrà altre volte, per cui: se vedi due personagge nello stesso luogo, prova a vedere se hanno qualcosa da dirsi.
                Nel mentre: ecco il tuo dono!
                -> frog_about_who_questions                        
        }
        
    //Missione sei: conoscere la strega
        {
            - talking_witch.intro && availableMissions has missionSix:
                ~ availableMissions -= missionSix
                Stavo per invitarti a parlare con l'albero della foresta, ma mi hai battuto sul tempo.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                Per cui: ecco il tuo dono!
                -> frog_about_who_questions                        
        }
        
    //Missione sette: leggere una lettera
        {
            - first_character_notes.check or second_character_notes.check && availableMissions has missionSeven:
                ~ availableMissions -= missionSeven
                Stavo per chiederti di leggere una delle lettere che hai ricevuto sulla bacheca, ma mi hai battuto sul tempo.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                Per cui: ecco il tuo dono!
                -> frog_about_who_questions                        
        }
        
    //Missione otto: leggere un libro della biblioteca
        {
            - readStories != () && availableMissions has missionEight:
                ~ availableMissions -= missionEight
                Stavo per chiederti di leggere una delle storie della biblioteca, ma mi hai battuto sul tempo.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                Per cui: ecco il tuo dono!
                -> frog_about_who_questions                        
        } 

        {
            - availableMissions == ():
                Non ho più missioni da offrirti, ma hai bisogno di me, per cui ti aiuterò!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    -> frog_about_who_questions 
                
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
            - 5 && availableMissions has missionFive && (firstStory == StoryStarted) && (secondStory == StoryStarted):
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
    
->->



=== closed_mission_verify
{frogDebug: passo da closed_mission_verify. Il valore di activeMissions è {activeMissions}.}
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
                            -> frog_about_who_questions
                
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
                            -> frog_about_who_questions
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
                            -> frog_about_who_questions
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
                            -> frog_about_who_questions
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
                            -> frog_about_who_questions
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
                            -> frog_about_who_questions
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
                            -> frog_about_who_questions
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
                            -> frog_about_who_questions
                - else:
                    Ricorda {name}: leggi una delle storie della biblioteca.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    E poi torna da me.
                        -> main  
            }
    
        //Le missioni speciali risolvono il dono direttamente, senza andare a frog_about_who_questions
        - specialMissionOne:
            {
                - special_mission_one_dialogue:
                    Hai assistito alla discussione tra Riccio e Mentore, {name}.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    {
                        - special_mission_one_dialogue.not_intervention:
                            E hai deciso di non intervenire.
                        
                        - special_mission_one_dialogue.pro_mentor:
                            E scelto Wicked: dillo a Fabio!
                        
                        - special_mission_one_dialogue.pro_riccio:
                            E scelto Attack of Titan, lovvo.
                        
                        - special_mission_one_dialogue.disagree:
                            E hai optato per The Lady: tu si che capisci il mondo.
                        
                        - special_mission_one_dialogue.paracula:
                            E hai proposto Attack of The Wicked: discutibile.
                    }
                L'armonia è importante.
                Per questo ti dono una nota, che troverai al Nido.
                    ~ move_entity(purpleShell, Nest)
                    ~ availableSpecialMissions -= specialMissionOne
                    ~ activeMissions = ()
                    ~ currentMissionAboutChar = ()
                    //Metto in pausa le missioni speciali
                    ~ pauseSpecialMission = pauseSpecialMissionMax
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
                    
                    @animation:Inventory
                    
                    ~ findedGifts += universalIngredient
                    ~ availableSpecialMissions -= specialMissionTwo
                    ~ activeMissions = ()
                    ~ currentMissionAboutChar = ()
                    //Metto in pausa le missioni speciali
                    ~ pauseSpecialMission = pauseSpecialMissionMax
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
    - tiredFrog != 0:
        -> top
        
    - dice == 5:
        ~ tiredFrog = maxTiredFrog
            -> top
    
    - else:
        -> discovered_things_updater
              
}
    
- (top)
    Sono affaticato, {name}. #speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
    Torna più tardi.
    E ricordati di riposare anche tu.

-> main


=== cultivable_recovery
{frogDebug: passo da cultivable_recovery.}
Vorrei recuperare...#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral

    + {recoverableCultivables has BaccaDellaAddolorata} [{ingredientTranslator(BaccaDellaAddolorata)}]
            ~  currentMissionAboutChar = missionObjects
            ~  searchedCultivableRecovery = BaccaDellaAddolorata
            ~  recoveredCultivables += BaccaDellaAddolorata
            -> frog_gift_dispatcher
            
    + {recoverableCultivables has BarbaDellInciampo} [{ingredientTranslator(BarbaDellInciampo)}]
            ~  currentMissionAboutChar = missionObjects
            ~  searchedCultivableRecovery = BarbaDellInciampo
            ~  recoveredCultivables += BarbaDellInciampo
            -> frog_gift_dispatcher
            
    + {recoverableCultivables has BastoneDellOzioso}[{ingredientTranslator(BastoneDellOzioso)}]
            ~  currentMissionAboutChar = missionObjects
            ~  searchedCultivableRecovery = BastoneDellOzioso
            ~  recoveredCultivables += BastoneDellOzioso
            -> frog_gift_dispatcher
            
    + {recoverableCultivables has BrinaDellImpossibile}[{ingredientTranslator(BrinaDellImpossibile)}]
            ~  currentMissionAboutChar = missionObjects
            ~  searchedCultivableRecovery = BrinaDellImpossibile
            ~  recoveredCultivables += BrinaDellImpossibile
            -> frog_gift_dispatcher
            
    + {recoverableCultivables has CantoDelleCompagne} [{ingredientTranslator(CantoDelleCompagne)}]
            ~  currentMissionAboutChar = missionObjects
            ~  searchedCultivableRecovery = CantoDelleCompagne
            ~  recoveredCultivables += CantoDelleCompagne
            -> frog_gift_dispatcher
            
    + {recoverableCultivables has CardoAspinato} [{ingredientTranslator(CardoAspinato)}]
            ~  currentMissionAboutChar = missionObjects
            ~  searchedCultivableRecovery = CardoAspinato
            ~  recoveredCultivables += CardoAspinato
            -> frog_gift_dispatcher
            
    + {recoverableCultivables has EderaDelleAmanti} [{ingredientTranslator(EderaDelleAmanti)}]
            ~  currentMissionAboutChar = missionObjects
            ~  searchedCultivableRecovery = EderaDelleAmanti
            ~  recoveredCultivables += EderaDelleAmanti
            -> frog_gift_dispatcher
            
    + {recoverableCultivables has ErbaLiccia} [{ingredientTranslator(ErbaLiccia)}]
            ~  currentMissionAboutChar = missionObjects
            ~  searchedCultivableRecovery = BaccaDellaAddolorata
            ~  recoveredCultivables += BaccaDellaAddolorata
            -> frog_gift_dispatcher
            
    + {recoverableCultivables has FalsaPalude} [{ingredientTranslator(FalsaPalude)}]
            ~  currentMissionAboutChar = missionObjects
            ~  searchedCultivableRecovery = FalsaPalude
            ~  recoveredCultivables += FalsaPalude
            -> frog_gift_dispatcher
            
    + {recoverableCultivables has LanaNotturna} [{ingredientTranslator(LanaNotturna)}]
            ~  currentMissionAboutChar = missionObjects
            ~  searchedCultivableRecovery = LanaNotturna
            ~  recoveredCultivables += LanaNotturna
            -> frog_gift_dispatcher
            
    + {recoverableCultivables has LicheneDegliAbissi} [{ingredientTranslator(LicheneDegliAbissi)}]
            ~  currentMissionAboutChar = missionObjects
            ~  searchedCultivableRecovery = LicheneDegliAbissi
            ~  recoveredCultivables += LicheneDegliAbissi
            -> frog_gift_dispatcher
            
    + {recoverableCultivables has NonTiScordarDiTe} [{ingredientTranslator(NonTiScordarDiTe)}]
            ~  currentMissionAboutChar = missionObjects
            ~  searchedCultivableRecovery = NonTiScordarDiTe
            ~  recoveredCultivables += NonTiScordarDiTe
            -> frog_gift_dispatcher
            
    + {recoverableCultivables has Olobino} [{ingredientTranslator(Olobino)}]
            ~  currentMissionAboutChar = missionObjects
            ~  searchedCultivableRecovery = Olobino
            ~  recoveredCultivables += Olobino
            -> frog_gift_dispatcher
            
    + {recoverableCultivables has LaSpazzata} [{ingredientTranslator(LaSpazzata)}]
            ~  currentMissionAboutChar = missionObjects
            ~  searchedCultivableRecovery = LaSpazzata
            ~  recoveredCultivables += LaSpazzata
            -> frog_gift_dispatcher
            
    
    + [Ho cambiato idea.]
        -> frog_about_who_questions
    
           



=== witch_frog_mission_notifier
//Questa è la notifica della "strega" se chiudiamo una missione
{frogDebug: passo da witch_frog_mission_notifier.}
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameThree = translator(thirdCharacterState)
    ~ temp charNameFour= translator(fourthCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    
    {
        - witchNotification == false:
            {
                - activeMissions has missionOne:
                    {
                        - first_character_recap.check && second_character_recap.check && greenhouse_recap.check:
                            -> notification
                        
                        - else:
                            ->->
                    }
                    
                - activeMissions has missionTwo:
                    {
                        - LIST_COUNT(backupCultivable) < 12:
                            -> notification
                        
                        - else:
                            ->->    
                    }
                    
                - activeMissions has missionThree && mindfulness:
                    -> notification
                       
                - activeMissions has missionFour && little_storylets:
                    -> notification       
        
                - activeMissions has missionFive && first_second_chit_chat:
                    -> notification 
               
                
                - activeMissions has missionSix && talking_witch.intro:
                    -> notification
            
                - activeMissions has missionSeven:
                    {
                        - first_character_notes.check or second_character_notes.check:
                            -> notification
                        
                        - else:
                            ->->    
                    }
                
                - activeMissions has missionEight && readStories != ():
                    -> notification
                    
                - activeMissions has specialMissionOne && special_mission_one_dialogue:
                    -> notification
                    
                - activeMissions has specialMissionTwo && cooking_alone :
                    -> notification
                    
                - else:
                    ->->
            }
        
        - else:
            ->->    
}



= notification
Le condizioni per la missione data dalla rana sono state raggiunte.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState #portrait: {witch_state()}
        ~ witchNotification = true
-> main

=== special_mission_pause_check
{frogDebug: passo da special_mission_pause_check.}    
{frogDebug: il valore di pauseSpecialMission è {pauseSpecialMission}.}    
    {
        - pauseSpecialMission > 0:
            ~ pauseSpecialMission --
        {frogDebug: il valore di pauseSpecialMission è {pauseSpecialMission}.}    
    }
->->