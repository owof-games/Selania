=== animella_uno
+ {are_two_entities_together(AnimellaUno, PG)} [AnimellaUno] 
    -> parlareConAnimella

= parlareConAnimella
    {
    - alcolismo == false:
        {
        - debug: alcolismo attivo, salto storia, propongo altra
        -> random_animelle
        }
    }
    //Se alcolismo attivo come trigger, salto la storia
    + Storia animella uno
        //A conversazione finita con l'animella, torna nella casetta.
        ~ move_entity(AnimellaUno, CasettaAnime)
    -
-> main

=== animella_due
+ {are_two_entities_together(AnimellaDue, PG)} [AnimellaDue] 
    -> parlareConAnimella
= parlareConAnimella 

    + Storia animella due
            ~ move_entity(AnimellaDue, CasettaAnime)
    -
-> main

=== animella_tre
+ {are_two_entities_together(AnimellaTre, PG)} [AnimellaTre] 
    -> parlareConAnimella

= parlareConAnimella
    + Storia animella tre
                ~ move_entity(AnimellaTre, CasettaAnime)
    -
-> main