=== discovered_things_updater ===
//Questo nodo mi permette di aggiornare sempre lo stato delle missioni autonome, e di eliminare le eventuali quest fatte di già senza dover tracciare le condizioni mille volte.
//Ci arrivo sempre prima di andare al dispatcher delle missioni.
{debug_frog: passo da discovered_things_updater.}
{debug_frog: frog_firstCharObtainedGifts è uguale a {frog_firstCharObtainedGifts}.}
{debug_frog: frog_secondCharObtainedGifts è uguale a {frog_secondCharObtainedGifts}.}

        //Aggiornare lo stato delle cose che posso donare o meno alla PG
        //Nota: per come è strutturata ora la cosa, è un check extra, perché in teoria la variazione dovrebbe avvenire già durante il dono
        
    //Ripeto con le altre png
    

->->


        {
            - frog_availableCommonMissions == ():
                Mmm.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                Non ho molto da chiederti ora.
                Ma come dice sempre zia Graaak: non è una scusa per lavarsene le zampette.
                Quindi, vediamo come ti posso aiutare!
                    -> frog_about_who_questions 
 
            
        }

->->











=== special_mission_pause_check
{debug_frog: passo da special_mission_pause_check.}    
{debug_frog: il valore di frog_pauseSpecialMission è {frog_pauseSpecialMission}.}    
    {
        - frog_pauseSpecialMission > 0:
            ~ frog_pauseSpecialMission --
        {debug_frog: il valore di frog_pauseSpecialMission è {frog_pauseSpecialMission}.}    
    }
->->