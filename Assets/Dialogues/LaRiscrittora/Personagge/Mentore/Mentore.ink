=== mentore ===
+ {are_two_entities_together(Mentore, PG)} [Mentore]
    -> parlareColMentore


=== parlareColMentore
-> storylets_mentore ->
Cosa vuoi sapere {pronomi has maschili: amico mio|{pronomi has femminili: amica mia|amicə miə}}?
    - (top)
     + [Voglio conoscere meglio il mentore]
     + [Ho bisogno di un aiuto]
        -> supporto
     + [Abbandono la conversazione]
        -> main
     -
    -> top


=== supporto
    Come posso aiutarti?
    - (top)
        + {storiaUno == InCorso or storiaDue == InCorso or storiaTre == InCorso} [Potresti darmi un consiglio legato alla storia in corso?]
            -> consigli_storie
        + {tutorial} [Potresti ripetermi il tutorial]
            -> indicazioni
        + [Non mi sento più a mio agio col mio nome]
            -> il_mio_nome
        + [Non mi sento più a mio agio col mio pronome]
            -> assegnazione_genere
        + [Vorrei aggiornare i miei trigger warning]
            -> trigger_warning       
        + [Vorrei parlare d'altro]
            -> parlareColMentore
        -
    -> top   


