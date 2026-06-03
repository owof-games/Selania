=== franco_storyletsManagement
{debug_frog: passo da franco_storyletsManagement.}
//Da qui passano tutti i check narrativi per quando iniziamo a parlare con Franco
{
    //Storylets speciali
    - are_two_entities_together(PG, Franco) && special_mission_one_contents && entity_location(PG) == Pond && grimoire_franco hasnt grimFrancoSpecialMissionOneFeedback:
        -> franco_feedback_mission_one_closed

    - are_two_entities_together(PG, Franco) && achievements_fullLore ==  Discovered && grimoire_franco hasnt grimFrancoAllDocuments:
        -> franco_allDocuments

    //Commenti speciali
    //Regalo da raccogliere
    - frog_suspended_gift == true && frog_giftability == true:
                
        {charTag(Franco, "party")}:                       Ehi girino!
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
           - {charTag(Franco, "party")}:                        Girino, continua a divertirti con quei sassi!
           - {charTag(Franco, "neutral")}:                      Che fastidio la pioggia sulla testa.
           - {charTag(Franco, "question")}:                     Ma il faro è una cosa che accadra?
        }
        
        ->->                    

    //Commenti sulle commissioni in corso, NON concluse
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

    - are_two_entities_together(PG, Franco) && frog_currentMission == missionNine && frog_updatedMissions hasnt missionNine && entity_location(PG) == Pond:
        -> franco_missionNine_solicit

    - are_two_entities_together(PG, Franco) && frog_currentMission == missionTen && frog_updatedMissions hasnt missionTen && entity_location(PG) == Pond:
        -> franco_missionTen_solicit        



    //Commenti sulle commissioni in corso. Anche se ridondante, punto a far commentare PRIMA quelle commissionate da Franco, POI quelle concluse in autonomia.
    - are_two_entities_together(PG, Franco) && frog_updatedMissions has missionOne && frog_currentMission has missionOne && entity_location(PG) == Pond:
        -> franco_missionOne_closed

    - are_two_entities_together(PG, Franco) && frog_updatedMissions has missionTwo && frog_currentMission has missionTwo && entity_location(PG) == Pond:
        -> franco_missionTwo_closed

    - are_two_entities_together(PG, Franco) && frog_updatedMissions has missionThree && frog_currentMission has missionThree && entity_location(PG) == Pond:
        -> franco_missionThree_closed

    - are_two_entities_together(PG, Franco) && frog_updatedMissions has missionFour && frog_currentMission has missionFour && entity_location(PG) == Pond:
        -> franco_missionFour_closed

    - are_two_entities_together(PG, Franco) && frog_updatedMissions has missionFive && frog_currentMission has missionFive && entity_location(PG) == Pond:
        -> franco_missionFive_closed

    - are_two_entities_together(PG, Franco) && frog_updatedMissions has missionSix && frog_currentMission has missionSix && entity_location(PG) == Pond:
        -> franco_missionSix_closed

    - are_two_entities_together(PG, Franco) && frog_updatedMissions has missionSeven && frog_currentMission has missionSeven && entity_location(PG) == Pond:
        -> franco_missionSeven_closed

    - are_two_entities_together(PG, Franco) && frog_updatedMissions has missionEight && frog_currentMission has missionEight && entity_location(PG) == Pond:
        -> franco_missionEight_closed

    - are_two_entities_together(PG, Franco) && frog_updatedMissions has missionNine && frog_currentMission has missionNine && entity_location(PG) == Pond:
        -> franco_missionNine_closed

    - are_two_entities_together(PG, Franco) && frog_updatedMissions has missionTen && frog_currentMission has missionTen && entity_location(PG) == Pond:
        -> franco_missionTen_closed        




    //Chiuse in autonomia
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

    - are_two_entities_together(PG, Franco) && frog_updatedMissions has missionNine && entity_location(PG) == Pond:
        -> franco_missionNine_closed

    - are_two_entities_together(PG, Franco) && frog_updatedMissions has missionTen && entity_location(PG) == Pond:
        -> franco_missionTen_closed        

    

}

->->