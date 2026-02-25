=== mentor_character ===
~ temp mentorName = translator(mentor_ActualName)
        + {are_two_entities_together(Mentor, PG)}[Mentor]
            //Variabile che mi traccia quando ho parlato con Mentore l'ultima volta, così da bloccare la sua insistenza a cercare di parlarmi.
                ~ mentor_lastTimeTalking = 0
            -> mentor_check_dialogue
