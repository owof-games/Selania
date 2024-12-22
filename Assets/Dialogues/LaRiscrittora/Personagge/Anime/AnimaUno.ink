=== anima_uno
+ {are_two_entities_together(AnimaUno, PG)} [Parli con l'anima] 
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
    - not stitch_uno: -> stitch_uno
    - not stitch_due: -> stitch_due
    - not stitch_tre: -> stitch_tre
    - else: Sono finite le storie per la prima anima ->->
}

    = stitch_uno
        + Primo contenuto anima uno
    -> main
    
    = stitch_due
        + Secondo contenuto anima uno 
        
    -> main
    = stitch_tre
        + Terzo contenuto anima uno
    ->main
 


