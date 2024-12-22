TODO: vedere con Mattia come mai dopo la randomizzazione ottengo errore
=== animella_uno
+ {are_two_entities_together(AnimellaUno, PG)} [Parli con una animella] 
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
+ {are_two_entities_together(AnimellaDue, PG)} [Parli con una animella] 
    -> parlareConAnimella
= parlareConAnimella 

    + Storia animella due
    -
-> main

=== animella_tre
+ {are_two_entities_together(AnimellaTre, PG)} [Parli con una animella] 
    -> parlareConAnimella

= parlareConAnimella
    + Storia animella tre
    -
-> main