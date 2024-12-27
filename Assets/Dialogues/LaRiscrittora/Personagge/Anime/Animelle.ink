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
    -
-> main

=== animella_due
+ {are_two_entities_together(AnimellaDue, PG)} [AnimellaDue] 
    -> parlareConAnimella
= parlareConAnimella 

    + Storia animella due
    -
-> main

=== animella_tre
+ {are_two_entities_together(AnimellaTre, PG)} [AnimellaTre] 
    -> parlareConAnimella

= parlareConAnimella
    + Storia animella tre
    -
-> main