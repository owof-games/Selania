=== mentore ===
+ {are_two_entities_together(Mentore, PG)} [Mentore]
    -> parlareColMentore


=== parlareColMentore
-> storylets_mentore ->
    Mentore: Cosa vuoi sapere {pronomi has maschili: amico mio|{pronomi has femminili: amica mia|amicə miə}}?
    - (top)
        //+ [Voglio conoscere meglio il mentore]
        + [Qualcosa non mi è chiaro.]
            -> supporto
        + [Abbandono la conversazione.]
            -> main
        -
    -> top


=== supporto
    Mentore: Come posso aiutarti?
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


