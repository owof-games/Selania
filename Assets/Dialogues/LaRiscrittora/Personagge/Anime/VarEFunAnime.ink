LIST animelle = animellaUno, animellaDue, animellaTre
LIST anime = animaUno, animaDue, animaTre
VAR animelleIncontrate  = ()
VAR animelleDaIncontrare = (animellaUno, animellaDue, animellaTre)
VAR animeDaIncontrare = (animaUno, animaDue, animaTre)
//Conto da quanto tempo ho visto una delle anime principali
VAR ultimaVoltaVistaAnima = 0
//Tengo conto del numero di luoghi visitati dall'ultimo incontro con un'anima o animella
VAR counterLuoghi = 0


//Funzione per randomizzare la comparsa di ogni tipo di anima
=== comparsa_anime
//Anime e animelle devono comparire solo dopo l'inizio della prima storia.
{storiaUno == NonIniziata : ->->}
//Anime e animelle non possono comparire nel Labirinto.
{contenutoLabirinto has PG: ->->}
~ counterLuoghi ++
~ temp dice_roll = RANDOM(1, 6)
{debug: ultima volta vista Anima = {ultimaVoltaVistaAnima}}
{debug: luoghi attraversati = {counterLuoghi}}
{
    - counterLuoghi < 4: ->->
    - else:
        {debug: counterLuoghi > 3}
        {debug: valore dado = {dice_roll}}
        {
        - dice_roll > 3:
        {~ Qualcuno vuole raccontarti la sua storia.|Qualcuno ti aspetta.|C'è una storia per te}
            {
            - ultimaVoltaVistaAnima > 3:
                {debug: ultimaVoltaVistaAnima > 3}
                -> random_anime
            - else:
                {debug: ultimaVoltaVistaAnima < 4}
                ~ ultimaVoltaVistaAnima ++
            -> random_animelle
            }
        - else: ->->    
        }
}


//Se seleziono un'anima principale, viene randomizzata la comparsa di una di queste
=== random_anime
//Resetto il contatore legato alle anime principali
~ ultimaVoltaVistaAnima = 0
~ temp anima = LIST_RANDOM(animeDaIncontrare)
{debug: ho preso l'anima {anima}}
{anima:
    - animaUno: -> anima_uno
    - animaDue: -> anima_due
    - animaTre: -> anima_tre

}

-> DONE

//Se seleziono un'amimella, viene randomizzata la comparsa di una di queste e viene levata dalla lista delle animelle che possono comparire nella storia
=== random_animelle
~ temp animellina = LIST_RANDOM(animelleDaIncontrare)
{debug: ho preso l'animella {animellina}}
{animellina:
    - animellaUno:
        ~ animelleDaIncontrare -= animellina
        ~ animelleIncontrate += animellina
        {debug: La lista animelle contiene: {animelleDaIncontrare}}
        -> animella_uno
    - animellaDue:
        ~ animelleDaIncontrare -= animellina
        ~ animelleIncontrate += animellina
        {debug: La lista animelle contiene: {animelleDaIncontrare}}
        -> animella_due
    - animellaTre:
        ~ animelleDaIncontrare -= animellina
        ~ animelleIncontrate += animellina
        {debug: La lista animelle contiene: {animelleDaIncontrare}}
        -> animella_tre
    - else: non ho più animelle da estrarre ->->

}
-> main