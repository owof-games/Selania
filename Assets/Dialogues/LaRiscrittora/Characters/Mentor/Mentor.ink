=== mentor ===
+ {are_two_entities_together(Mentor, PG)} [Mentor]
    -> speaking_with_mentor


=== speaking_with_mentor
-> mentor_storylets ->
    Mentore: Cosa vuoi sapere {pronouns has him: amico mio|{pronouns has her: amica mia|amicə miə}}?
    - (top)
        //+ [Voglio conoscere meglio il mentore]
        + [Qualcosa non mi è chiaro.]
            -> support
        + [Abbandono la conversazione.]
            -> main
        -
    -> top


=== support
    Mentore: Come posso aiutarti?
    - (top)
        //+ {storiaUno == InCorso or storiaDue == InCorso or storiaTre == InCorso} [Potresti darmi un consiglio legato alla storia in corso?]
        //    -> consigli_storie
        + [Mi ripeteresti cosa devo fare?]
            -> to_do
        + [Mi diresti a cosa servono i vari luoghi?]
            -> tutorial
        + [Vorrei cambiare il mio name.]
            -> name_choice ->
        + [Vorrei cambiare i miei pronomi.]
            -> gender ->
        + [Vorrei aggiornare la lista dei miei temi delicati.]
            -> trigger_warning       
        + [Vorrei parlare d'altro.]
            -> speaking_with_mentor
        -
    -> top   


