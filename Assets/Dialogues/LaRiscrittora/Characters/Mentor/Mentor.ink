=== mentore ===
+ {are_two_entities_together(Mentor, PG)} [Mentor]
    -> parlareColMentore


=== parlareColMentore
-> storylets_mentore ->
    Mentor: Cosa vuoi sapere {pronouns has him: amico mio|{pronouns has her: amica mia|amicə miə}}?
    - (top)
        //+ [Voglio conoscere meglio il mentore]
        + [Qualcosa non mi è chiaro.]
            -> supporto
        + [Abbandono la conversazione.]
            -> main
        -
    -> top


=== supporto
    Mentor: Come posso aiutarti?
    - (top)
        //+ {storiaUno == InCorso or storiaDue == InCorso or storiaTre == InCorso} [Potresti darmi un consiglio legato alla storia in corso?]
        //    -> consigli_storie
        + [Mi ripeteresti cosa devo fare?]
            -> compito
        + [Mi diresti a cosa servono i vari luoghi?]
            -> tutorial
        + [Vorrei cambiare il mio name.]
            -> il_mio_nome ->
        + [Vorrei cambiare i miei pronomi.]
            -> assegnazione_genere ->
        + [Vorrei aggiornare la lista dei miei temi delicati.]
            -> trigger_warning       
        + [Vorrei parlare d'altro.]
            -> parlareColMentore
        -
    -> top   


