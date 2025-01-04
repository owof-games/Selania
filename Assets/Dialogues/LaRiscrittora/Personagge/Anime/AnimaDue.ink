=== anima_due
+ {are_two_entities_together(AnimaDue, PG)} [AnimaDue] 
    -> parlareConAnima

= parlareConAnima
{
    - not stitch_uno:
    -> stitch_uno
    - not stitch_due:
    -> stitch_due
    - not stitch_tre:
    -> stitch_tre
    - else: storie finite seconda anima ->->
}

    = stitch_uno
        AnimaDue: Avrò una storia da raccontarti con il secondo prototipo, per ora sono qui perché <i>dev</i> deve capire se la frequenza di comparsa è sensata.
            + [Ok, alla prossima]
            -> main
  -> main
    
    = stitch_due
        + Secondo contenuto anima due
   -> main
    
    = stitch_tre
        +  Terzo contenuto anima due

    -> main