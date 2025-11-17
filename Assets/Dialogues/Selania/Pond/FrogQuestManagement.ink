=== discovered_things_updater ===
//Questo nodo mi permette di aggiornare sempre come prima cosa lo stato delle missioni autonome, e di eliminare le eventuali quest fatte di già senza dover tracciare le condizioni mille volte.
{debug_frog: passo da discovered_things_updater.}
{debug_frog: frog_firstCharObtainedGifts è uguale a {frog_firstCharObtainedGifts}.}
{debug_frog: frog_secondCharObtainedGifts è uguale a {frog_secondCharObtainedGifts}.}

        //Aggiornare lo stato delle cose che posso donare o meno alla PG
        {
            //Ho già fatto il dono (ed è il primo check)
            - firstChar_giftedObject != () && frog_firstCharObtainedGifts hasnt charOneCultivable:
                    ~ frog_firstCharObtainedGifts += charOneCultivable
    
            
            //Ho già cucinato (ed è il primo check). Traccio il nodo più vicino alla fine per prevenire problemi con eventuali crush del gioco
            - ending_cooking_with_first_char && frog_firstCharObtainedGifts hasnt charOneCooking:
                    ~ frog_firstCharObtainedGifts += charOneCooking
        
        }
        
        
        {
            //Ho già fatto il dono (ed è il primo check)
            - secondChar_giftedObject != () && frog_secondCharObtainedGifts hasnt charTwoCultivable:
                    ~ frog_secondCharObtainedGifts += charTwoCultivable
    
            
            //Ho già cucinato (ed è il primo check). Traccio il nodo più vicino alla fine per prevenire problemi con eventuali crush del gioco
            - ending_cooking_with_second_char && frog_secondCharObtainedGifts hasnt charTwoCooking:
                    ~ frog_secondCharObtainedGifts += charTwoCooking
        
        }
    //Ripeto con le altre png
    

-> welcoming_frog.top



=== autonomy_mission_verify ===
//Verifico quante missioni autonome ha fatto la giocatrice.
{debug_frog: passo da autonomy_mission_verify.}
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)

    //Missione uno: utilizzo del libro della riscrittora.
        {
            - first_character_recap.check && second_character_recap.check && greenhouse_recap.check && frog_availableCommonMissions has missionOne:
                ~ frog_availableCommonMissions -= missionOne
                
                Stavo per chiederti di consultare in profondità il libro che ti è stato donato, ma ho visto che hai già fatto senza di me! Per cui: ecco il tuo dono!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    -> frog_about_who_questions
        }
        
    //Missione due: coltivare almeno tre piante in serra.
        {
            - LIST_COUNT(greenhouse_backupCultivable) < 12 && frog_availableCommonMissions has missionTwo:
                ~ frog_availableCommonMissions -= missionTwo
                
                Stavo per chiederti di coltivare almeno tre piante in serra, ma ho visto che hai già fatto senza di me! Per cui: ecco il tuo dono!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                -> frog_about_who_questions
        }
        
    //Missione tre: mindfulness
        {
            - mindfulness && frog_availableCommonMissions has missionThree:
                ~ frog_availableCommonMissions -= missionThree
                Stavo per chiederti di parlare di benessere con Mentore, ma ho visto che hai già fatto senza di me! Per cui: ecco il tuo dono!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                -> frog_about_who_questions                      
        }
        
    //Missione quattro: gossips 
        {
            - little_storylets && frog_availableCommonMissions has missionFour:
                ~ frog_availableCommonMissions -= missionFour
                Stavo per chiederti di raccontare a Mentore le stranezze che hai incontrato in questo luogo, ma ho visto che hai già fatto in autonomia!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                Per cui: ecco il tuo dono!
                -> frog_about_who_questions                        
        }
        
        
    //Missione cinque: chiacchiere tra PNG 
        {
            - first_second_chit_chat && frog_availableCommonMissions has missionFive:
                ~ frog_availableCommonMissions -= missionFive
                Stavo per dirti di provare a vedere cosa succede quando due persone sono vicine.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                E invece mi hai battuto, assistendo alla conversazione tra Chitarra e Riccio.
                Questa cosa accadrà altre volte, per cui: se vedi due personagge nello stesso luogo, prova a vedere se hanno qualcosa da dirsi.
                Nel mentre: ecco il tuo dono!
                -> frog_about_who_questions                        
        }
        
    //Missione sei: conoscere la strega
        {
            - talking_witch.intro && frog_availableCommonMissions has missionSix:
                ~ frog_availableCommonMissions -= missionSix
                Stavo per invitarti a parlare con l'albero della foresta, ma mi hai battuto sul tempo.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                Per cui: ecco il tuo dono!
                -> frog_about_who_questions                        
        }
        
    //Missione sette: leggere una lettera
        {
            - first_character_notes.check or second_character_notes.check && frog_availableCommonMissions has missionSeven:
                ~ frog_availableCommonMissions -= missionSeven
                Stavo per chiederti di leggere una delle lettere che hai ricevuto sulla bacheca, ma mi hai battuto sul tempo.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                Per cui: ecco il tuo dono!
                -> frog_about_who_questions                        
        }
        
    //Missione otto: leggere un libro della biblioteca
        {
            - library_readStories != () && frog_availableCommonMissions has missionEight:
                ~ frog_availableCommonMissions -= missionEight
                Stavo per chiederti di leggere una delle storie della biblioteca, ma mi hai battuto sul tempo.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                Per cui: ecco il tuo dono!
                -> frog_about_who_questions                        
        } 

        {
            - frog_availableCommonMissions == ():
                Non ho più missioni da offrirti, ma hai bisogno di me, per cui ti aiuterò!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    -> frog_about_who_questions 
                
            - else:
            
                -> missions_dispatcher
                
    
        }

->->




=== missions_dispatcher ===
{debug_frog: passo da missions_dispatcher.}
{debug_frog: frog_aboutGiftRequest == {frog_aboutGiftRequest}.}
//Alla fine le missioni sono scollegate dai doni, e sono letteralmente scritte secondo bisogno.
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)


        - (top)
        //Dato che no mi fa fare questa cosa direttamente nella variabile, provo così.
        //~ frog_maxValueRandomMissionDice = LIST_COUNT(frog_allMissions)
        
        //Tiro il dado
        ~ frog_randomMissionDice = RANDOM(1,8)
        
        {frog_randomMissionDice:
        
            - 1 && frog_availableCommonMissions has missionOne:
                -> mission_one
            - 2 && frog_availableCommonMissions has missionTwo:
                -> mission_two
            - 3 && frog_availableCommonMissions has missionThree:
                -> mission_three
            - 4 && frog_availableCommonMissions has missionFour:
                -> mission_four
            - 5 && frog_availableCommonMissions has missionFive && (firstChar_storyStatus == story_storyStarted) && (secondChar_storyStatus == story_storyStarted):
                -> mission_five
            - 6 && frog_availableCommonMissions has missionSix && ((firstChar_storyStatus == story_storyEnded) or (secondChar_storyStatus == story_storyEnded) or (thirdChar_storyStatus == story_storyEnded)):
                -> mission_six
            - 7 && frog_availableCommonMissions has missionSeven && (trainStopContents has FirstCharacterNotes) or (trainStopContents has SecondCharacterNotes):
                -> mission_seven
            - 8 && player_accessiblePlaces has Library:
                -> mission_eight
            - else:
                {debug_frog: il valore di frog_randomMissionDice è {frog_randomMissionDice}, e la missione associata è già stata fatta. Ritiro il dado.}
                -> top
                
        }
    
->->



=== closed_mission_verify
{debug_frog: passo da closed_mission_verify. Il valore di frog_currentMission è {frog_currentMission}.}
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    
    {frog_currentMission:
        //Qui la logica da implementare sarà: se le condizione è stata risolta (es: nodo attraversato) allora svuoto frog_currentMission (~ frog_currentMission = ()) e tolgo la missione da frog_availableCommonMissions, e invio la giocatrice alla parte del dono, altrimenti ho un reminder che mi ricorda di fare la missione.
        - missionOne:
            {
                - first_character_recap.check && second_character_recap.check && greenhouse_recap.check:
                    Hai letto le pagine del libro, grande {player_name}!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Direi che la missione è conclusa, e quindi possiamo parlare del tuo dono.
                        ~ frog_currentMission = ()
                        ~ frog_availableCommonMissions -= missionOne
                            -> frog_about_who_questions
                
                - else:
                    Ricorda {player_name}: leggere è importante!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Torna da me quando avrai esplorato il tuo libro.
                        -> main
            
            }
            
        - missionTwo:
            {
                - LIST_COUNT(greenhouse_backupCultivable) < 12:
                    La serra sta crescendo grazie a te, {player_name}!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Direi che la missione è conclusa, e quindi possiamo parlare del tuo dono.
                        ~ frog_availableCommonMissions -= missionTwo
                        ~ frog_currentMission = ()
                            -> frog_about_who_questions
                - else:
                    Ricorda {player_name}: la serra ha bisogno di te.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Torna da me quando avrai almeno tre piante fiorite.
                        -> main            
            }
            
        - missionThree:
            {
                - mindfulness:
                    Grazie per aver parlato con Mentore, {player_name}!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Son sicuro che si sente più utile ora.
                    Direi che la missione è conclusa, e quindi possiamo parlare del tuo dono.
                        ~ frog_availableCommonMissions -= missionThree
                        ~ frog_currentMission = ()
                            -> frog_about_who_questions
                - else:
                    Ricorda {player_name}: Mentore vuole condividere con te i suoi consigli per farti sentire meglio.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Torna da me quando le avrai parlato del tuo benessere.
                        -> main  
            }
            
        - missionFour:
            {
                - little_storylets:
                    Grazie per aver condiviso le cose che hai scoperto con Mentore, {player_name}!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Direi che la missione è conclusa, e quindi possiamo parlare del tuo dono.
                        ~ frog_availableCommonMissions -= missionFour
                        ~ frog_currentMission = ()
                            -> frog_about_who_questions
                - else:
                    Ricorda {player_name}: Mentore ci tiene a sentire le cose che hai scoperto su questo luogo.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Torna da me quando avrai condiviso con lei qualcosa di insolito.
                        -> main  
            }        
        
        - missionFive:
            {
                - first_second_chit_chat:
                    Hai ascoltato la conversazione tra Chitarra e Riccio, e ne sono felice {player_name}!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Anche se è difficile come posizione per unx Riscrittora: spesso una scelta in queste condizioni può far felice una persona, e scontentare l'altra.
                    Questa cosa accadrà altre volte, per cui: se vedi due personagge nello stesso luogo, prova a vedere se hanno qualcosa da dirsi.
                    
                    Direi che la missione è conclusa, e quindi possiamo parlare del tuo dono.
                        ~ frog_availableCommonMissions -= missionFive
                        ~ frog_currentMission = ()
                            -> frog_about_who_questions
                - else:
                    Ricorda {player_name}: prova a parlare con Riccio e Chitarra quando sono assieme.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Torna da me quando avrai sentito cosa hanno da dirsi.
                        -> main  
            }         
        
        - missionSix:
            {
                - talking_witch.intro:
                    Hai parlato con l'albero, {player_name}!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    E non sta a me chiederti cosa vi siete dett3, ma spero tu possa aver trovato un'alleata in questo percorso.
                    
                    Direi che la missione è conclusa, e quindi possiamo parlare del tuo dono.
                        ~ frog_availableCommonMissions -= missionSix
                        ~ frog_currentMission = ()
                            -> frog_about_who_questions
                - else:
                    Ricorda {player_name}: prova a parlare con l'albero della foresta.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    E poi torna da me.
                        -> main  
            } 
        
        - missionSeven:
            {
                - first_character_notes.check or second_character_notes.check:
                    Hai letto la lettera che ti è stata inviata, {player_name}!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Ricordati di darci un'occhiata ogni tanto, così da sapere come avanza la storia delle persone che hai aiutato.
                    
                    Direi che la missione è conclusa, e quindi possiamo parlare del tuo dono.
                        ~ frog_availableCommonMissions -= missionSeven
                        ~ frog_currentMission = ()
                            -> frog_about_who_questions
                - else:
                    Ricorda {player_name}: leggi la lettera che hai ricevuto alla fermata del treno.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    E poi torna da me.
                        -> main  
            }
        
        - missionEight:
            {
                - library_readStories != ():
                    Hai letto una della storie della biblioteca, {player_name}!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    La biblioteca è un posto di riposo, ma non solo.
                    Anche alle persone che popolano questo posto piace leggere.
                    E a volte, se avete avuto una lettura in comune, potresti scoprire qualcosa di più su di loro.
                    
                    Direi che la missione è conclusa, e quindi possiamo parlare del tuo dono.
                        ~ frog_availableCommonMissions -= missionEight
                        ~ frog_currentMission = ()
                            -> frog_about_who_questions
                - else:
                    Ricorda {player_name}: leggi una delle storie della biblioteca.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    E poi torna da me.
                        -> main  
            }
    
        //Le missioni speciali risolvono il dono direttamente, senza andare a frog_about_who_questions
        - specialMissionOne:
            {
                - special_mission_one_dialogue:
                    Hai assistito alla discussione tra Riccio e Mentore, {player_name}.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
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
                    ~ frog_availableSpecialMissions -= specialMissionOne
                    ~ frog_currentMission = ()
                    ~ frog_aboutGiftRequest = ()
                    //Metto in pausa le missioni speciali
                    ~ frog_pauseSpecialMission = frog_pauseSpecialMissionMax
                    -> main
                    
                - else:
                Ricorda {player_name}: ascolta la discussione tra Mentore e Riccio.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    E poi torna da me.
                    -> main
            }
            
        - specialMissionTwo:
            {
                - cooking_alone :
                    Hai cucinato in autonomia, {player_name}.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Per questo ti dono una ingrediente universale, che potrai utilizzare per cucinare con le altre persone, e apprezzeranno sempre.
                    
                    @animation:Backpack
                    
                    ~ backpack_findedGifts += universalIngredient
                    ~ frog_availableSpecialMissions -= specialMissionTwo
                    ~ frog_currentMission = ()
                    ~ frog_aboutGiftRequest = ()
                    //Metto in pausa le missioni speciali
                    ~ frog_pauseSpecialMission = frog_pauseSpecialMissionMax
                    -> main
                    
                - else:
                Ricorda {player_name}: ascolta la discussione tra Mentore e Riccio.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
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
{debug_frog: passo da tired_frog.}
 ~ temp dice = RANDOM(1,5)
 
{
    - frog_tiredValue != 0:
        -> top
        
    - dice == 5:
        ~ frog_tiredValue = frog_maxTiredValue
            -> top
    
    - else:
        -> discovered_things_updater
              
}
    
- (top)
    Sono affaticato, {player_name}. #speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
    Torna più tardi.
    E ricordati di riposare anche tu.

-> main


=== cultivable_recovery
{debug_frog: passo da cultivable_recovery.}
Vorrei recuperare...#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral

    + {frog_recoverableCultivables has BaccaDellaAddolorata} [{ingredientTranslator(BaccaDellaAddolorata)}]
            ~  frog_aboutGiftRequest = missionObjects
            ~  frog_cultivableRequested = BaccaDellaAddolorata
            ~  frog_recoveredCultivables += BaccaDellaAddolorata
            -> frog_gift_dispatcher
            
    + {frog_recoverableCultivables has BarbaDellInciampo} [{ingredientTranslator(BarbaDellInciampo)}]
            ~  frog_aboutGiftRequest = missionObjects
            ~  frog_cultivableRequested = BarbaDellInciampo
            ~  frog_recoveredCultivables += BarbaDellInciampo
            -> frog_gift_dispatcher
            
    + {frog_recoverableCultivables has BastoneDellOzioso}[{ingredientTranslator(BastoneDellOzioso)}]
            ~  frog_aboutGiftRequest = missionObjects
            ~  frog_cultivableRequested = BastoneDellOzioso
            ~  frog_recoveredCultivables += BastoneDellOzioso
            -> frog_gift_dispatcher
            
    + {frog_recoverableCultivables has BrinaDellImpossibile}[{ingredientTranslator(BrinaDellImpossibile)}]
            ~  frog_aboutGiftRequest = missionObjects
            ~  frog_cultivableRequested = BrinaDellImpossibile
            ~  frog_recoveredCultivables += BrinaDellImpossibile
            -> frog_gift_dispatcher
            
    + {frog_recoverableCultivables has CantoDelleCompagne} [{ingredientTranslator(CantoDelleCompagne)}]
            ~  frog_aboutGiftRequest = missionObjects
            ~  frog_cultivableRequested = CantoDelleCompagne
            ~  frog_recoveredCultivables += CantoDelleCompagne
            -> frog_gift_dispatcher
            
    + {frog_recoverableCultivables has CardoAspinato} [{ingredientTranslator(CardoAspinato)}]
            ~  frog_aboutGiftRequest = missionObjects
            ~  frog_cultivableRequested = CardoAspinato
            ~  frog_recoveredCultivables += CardoAspinato
            -> frog_gift_dispatcher
            
    + {frog_recoverableCultivables has EderaDelleAmanti} [{ingredientTranslator(EderaDelleAmanti)}]
            ~  frog_aboutGiftRequest = missionObjects
            ~  frog_cultivableRequested = EderaDelleAmanti
            ~  frog_recoveredCultivables += EderaDelleAmanti
            -> frog_gift_dispatcher
            
    + {frog_recoverableCultivables has ErbaLiccia} [{ingredientTranslator(ErbaLiccia)}]
            ~  frog_aboutGiftRequest = missionObjects
            ~  frog_cultivableRequested = BaccaDellaAddolorata
            ~  frog_recoveredCultivables += BaccaDellaAddolorata
            -> frog_gift_dispatcher
            
    + {frog_recoverableCultivables has FalsaPalude} [{ingredientTranslator(FalsaPalude)}]
            ~  frog_aboutGiftRequest = missionObjects
            ~  frog_cultivableRequested = FalsaPalude
            ~  frog_recoveredCultivables += FalsaPalude
            -> frog_gift_dispatcher
            
    + {frog_recoverableCultivables has LanaNotturna} [{ingredientTranslator(LanaNotturna)}]
            ~  frog_aboutGiftRequest = missionObjects
            ~  frog_cultivableRequested = LanaNotturna
            ~  frog_recoveredCultivables += LanaNotturna
            -> frog_gift_dispatcher
            
    + {frog_recoverableCultivables has LicheneDegliAbissi} [{ingredientTranslator(LicheneDegliAbissi)}]
            ~  frog_aboutGiftRequest = missionObjects
            ~  frog_cultivableRequested = LicheneDegliAbissi
            ~  frog_recoveredCultivables += LicheneDegliAbissi
            -> frog_gift_dispatcher
            
    + {frog_recoverableCultivables has NonTiScordarDiTe} [{ingredientTranslator(NonTiScordarDiTe)}]
            ~  frog_aboutGiftRequest = missionObjects
            ~  frog_cultivableRequested = NonTiScordarDiTe
            ~  frog_recoveredCultivables += NonTiScordarDiTe
            -> frog_gift_dispatcher
            
    + {frog_recoverableCultivables has Olobino} [{ingredientTranslator(Olobino)}]
            ~  frog_aboutGiftRequest = missionObjects
            ~  frog_cultivableRequested = Olobino
            ~  frog_recoveredCultivables += Olobino
            -> frog_gift_dispatcher
            
    + {frog_recoverableCultivables has LaSpazzata} [{ingredientTranslator(LaSpazzata)}]
            ~  frog_aboutGiftRequest = missionObjects
            ~  frog_cultivableRequested = LaSpazzata
            ~  frog_recoveredCultivables += LaSpazzata
            -> frog_gift_dispatcher
            
    
    + [Ho cambiato idea.]
        -> frog_about_who_questions
    
           



=== witch_frog_mission_notifier
//Questa è la notifica della "strega" se chiudiamo una missione
{debug_frog: passo da witch_frog_mission_notifier.}
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    
    {
        - frog_witch_notification == false:
            {
                - frog_currentMission has missionOne:
                    {
                        - first_character_recap.check && second_character_recap.check && greenhouse_recap.check:
                            -> notification
                        
                        - else:
                            ->->
                    }
                    
                - frog_currentMission has missionTwo:
                    {
                        - LIST_COUNT(greenhouse_backupCultivable) < 12:
                            -> notification
                        
                        - else:
                            ->->    
                    }
                    
                - frog_currentMission has missionThree && mindfulness:
                    -> notification
                       
                - frog_currentMission has missionFour && little_storylets:
                    -> notification       
        
                - frog_currentMission has missionFive && first_second_chit_chat:
                    -> notification 
               
                
                - frog_currentMission has missionSix && talking_witch.intro:
                    -> notification
            
                - frog_currentMission has missionSeven:
                    {
                        - first_character_notes.check or second_character_notes.check:
                            -> notification
                        
                        - else:
                            ->->    
                    }
                
                - frog_currentMission has missionEight && library_readStories != ():
                    -> notification
                    
                - frog_currentMission has specialMissionOne && special_mission_one_dialogue:
                    -> notification
                    
                - frog_currentMission has specialMissionTwo && cooking_alone :
                    -> notification
                    
                - else:
                    ->->
            }
        
        - else:
            ->->    
}



= notification
Le condizioni per la missione data dalla rana sono state raggiunte.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState #portrait: {witch_state()}
        ~ frog_witch_notification = true
-> main

=== special_mission_pause_check
{debug_frog: passo da special_mission_pause_check.}    
{debug_frog: il valore di frog_pauseSpecialMission è {frog_pauseSpecialMission}.}    
    {
        - frog_pauseSpecialMission > 0:
            ~ frog_pauseSpecialMission --
        {debug_frog: il valore di frog_pauseSpecialMission è {frog_pauseSpecialMission}.}    
    }
->->