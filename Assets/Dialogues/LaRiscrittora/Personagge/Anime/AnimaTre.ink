=== anima_tre
+ {are_two_entities_together(AnimaTre, PG)} [Parli con l'anima] 
    -> parlareConAnima

= parlareConAnima
{
    - not stitch_uno: -> stitch_uno
    - not stitch_due: -> stitch_due
    - not stitch_tre: -> stitch_tre
    - else: storie finite terza anima ->->
}

    = stitch_uno
        + Primo contenuto anima tre
    -> main
    
    = stitch_due
        + Secondo contenuto anima tre
    -> main
    
    = stitch_tre
        + Terzo contenuto anima tre
    -> main
