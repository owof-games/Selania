=== mentore ===
+ {are_two_entities_together(Mentore, PG)} [{Parli col mentore|Interroghi il mentore}] -> parlareColMentore


=== parlareColMentore
-> storylets_mentore ->
Cosa vuoi sapere {pronomi has maschili: amico mio|{pronomi has femminili: amica mia|amicə miə}}?
    - (top)
     + Domande private al mentore
     + Avrei bisogno di un aiuto -> supporto
     + Abbandoni la conversazione -> andarsene
     -
    -> top


=== supporto
    Come posso aiutarti?
    - (top)
        + {storiaUno == InCorso or storiaDue == InCorso or storiaTre == InCorso} Chiedi un consiglio legato alla storia in corso -> consigli_storie
        + {tutorial} Chiedi di ripetere il tutorial -> indicazioni
        + Non mi sento più a mio agio col mio nome -> il_mio_nome
        + Non mi sento più a mio agio col mio pronome -> assegnazione_genere
        + Vorrei aggiornare i miei trigger warning -> trigger_warning       
        + Vorrei parlare d'altro -> parlareColMentore
        -
    -> top   




//Qui tratto il mentore come un luogo, così che possa uscire poi dalla conversazione
=== andarsene
~ temp my_location = entity_location(PG)
<- move_between_rooms(my_location)

-> DONE

