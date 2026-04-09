=== franco_storyletsManagement
{debug_frog: passo da franco_storyletsManagement.}
//Da qui passano tutti i check narrativi per quando iniziamo a parlare con Franco
{
    //Storylets speciali
    //Prima presentazione
    - are_two_entities_together(PG, Franco) && grimoire_franco hasnt grimFrancoFirst:
        -> franco_intro
    
    - are_two_entities_together(PG, Franco) && special_mission_one_contents && entity_location(PG) == Pond && grimoire_franco hasnt grimFrancoMissionOneFeedback:
        -> franco_feedback_mission_one_closed

    - are_two_entities_together(PG, Franco) && achievements_fullLore ==  Discovered && grimoire_franco hasnt grimFrancoAllDocuments:
        -> franco_allDocuments

    //Commenti speciali
    //Regalo da raccogliere
    - frog_suspended_gift == true:
                
        Ehi girino!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
        {shuffle:
            - Hai ancora quel dono di prima da prendere!
            - Devo ancora darti quel dono!
            - Te lo ricordi che c'ho qui una cosa per te, vero?
            - Franco La Rana ha qui qualcosa che è tuo!
            - Ricordati che se ti serve c'ho qui il tuo dono!
        }
            
        -> franco_giftsManagement

    //Mentre siamo al nido
    - are_two_entities_together(PG, Franco) && entity_location(PG) == Nest && frog_currentMission has specialMissionOne: 
        
        {shuffle stopping:
           - Girino, continua a divertirti con quei sassi!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
           - Che fastidio la pioggia sulla testa. #speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
           - Son qui che aspetto.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
        }
        
        ->->                    

    //Commenti sulle missioni in corso, NON concluse
    - are_two_entities_together(PG, Franco) && frog_currentMission == missionOne && frog_updatedMissions hasnt missionOne && entity_location(PG) == Pond:
        -> franco_missionOne_solicit

    - are_two_entities_together(PG, Franco) && frog_currentMission == missionTwo && frog_updatedMissions hasnt missionTwo && entity_location(PG) == Pond:
        -> franco_missionTwo_solicit

    - are_two_entities_together(PG, Franco) && frog_currentMission == missionThree && frog_updatedMissions hasnt missionThree && entity_location(PG) == Pond:
        -> franco_missionThree_solicit

    - are_two_entities_together(PG, Franco) && frog_currentMission == missionFour && frog_updatedMissions hasnt missionFour && entity_location(PG) == Pond:
        -> franco_missionFour_solicit

    - are_two_entities_together(PG, Franco) && frog_currentMission == missionFive && frog_updatedMissions hasnt missionFive && entity_location(PG) == Pond:
        -> franco_missionFive_solicit

    - are_two_entities_together(PG, Franco) && frog_currentMission == missionSix && frog_updatedMissions hasnt missionSix && entity_location(PG) == Pond:
        -> franco_missionSix_solicit

    - are_two_entities_together(PG, Franco) && frog_currentMission == missionSeven && frog_updatedMissions hasnt missionSeven && entity_location(PG) == Pond:
        -> franco_missionSeven_solicit

    - are_two_entities_together(PG, Franco) && frog_currentMission == missionEight && frog_updatedMissions hasnt missionEight && entity_location(PG) == Pond:
        -> franco_missionEight_solicit

    //Commenti sulle missioni in corso, CONCLUSE su richiesta di franco o in autonomia
    - are_two_entities_together(PG, Franco) && frog_updatedMissions has missionOne && entity_location(PG) == Pond:
        -> franco_missionOne_closed

    - are_two_entities_together(PG, Franco) && frog_updatedMissions has missionTwo && entity_location(PG) == Pond:
        -> franco_missionTwo_closed

    - are_two_entities_together(PG, Franco) && frog_updatedMissions has missionThree && entity_location(PG) == Pond:
        -> franco_missionThree_closed

    - are_two_entities_together(PG, Franco) && frog_updatedMissions has missionFour && entity_location(PG) == Pond:
        -> franco_missionFour_closed

    - are_two_entities_together(PG, Franco) && frog_updatedMissions has missionFive && entity_location(PG) == Pond:
        -> franco_missionFive_closed

    - are_two_entities_together(PG, Franco) && frog_updatedMissions has missionSix && entity_location(PG) == Pond:
        -> franco_missionSix_closed

    - are_two_entities_together(PG, Franco) && frog_updatedMissions has missionSeven && entity_location(PG) == Pond:
        -> franco_missionSeven_closed

    - are_two_entities_together(PG, Franco) && frog_updatedMissions has missionEight && entity_location(PG) == Pond:
        -> franco_missionEight_closed

}

-> welcoming_frog.top