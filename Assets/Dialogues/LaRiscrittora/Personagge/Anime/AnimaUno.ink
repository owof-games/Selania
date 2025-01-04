=== anima_uno
+ {are_two_entities_together(AnimaUno, PG)} [AnimaUno] 
    -> parlareConAnima

= parlareConAnima
{
- alcolismo == false:
    {
    - debug: alcolismo attivo, salto storia, propongo altra
    -> random_anime
    }
}
//Se alcolismo attivo come trigger, salto la storia
{
    - not stitch_uno:
    -> stitch_uno
    - not stitch_due:
    -> stitch_due
    - not stitch_tre:
    -> stitch_tre
    - else: Sono finite le storie per la prima anima
        ->->
}

    = stitch_uno
        AnimaUno: Avrò una storia da raccontarti con il secondo prototipo, per ora sono qui perché <i>dev</i> deve capire se la frequenza di comparsa è sensata.
            + [Ok, alla prossima]
            -> main
    
    = stitch_due
        + Secondo contenuto anima uno 
        
    -> main
    = stitch_tre
        + Terzo contenuto anima uno
    ->main
 


