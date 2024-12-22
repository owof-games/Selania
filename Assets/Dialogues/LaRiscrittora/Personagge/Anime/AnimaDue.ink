=== anima_due
+ {are_two_entities_together(AnimaDue, PG)} [Parli con l'anima] 
    -> parlareConAnima

= parlareConAnima
{
    - not stitch_uno: -> stitch_uno
    - not stitch_due: -> stitch_due
    - not stitch_tre: -> stitch_tre
    - else: storie finite seconda anima ->->
}

    = stitch_uno
        + Primo contenuto anima due
  -> main
    
    = stitch_due
        + Secondo contenuto anima due
   -> main
    
    = stitch_tre
        +  Terzo contenuto anima due

    -> main