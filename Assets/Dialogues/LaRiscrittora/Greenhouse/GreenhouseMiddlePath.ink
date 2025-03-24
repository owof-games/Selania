=== greenhouse_middle_path ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
{greenhouse_middle_path== 1: <i>Questo è un luogo di passaggio</i>|<i>{~Il cammino è ricco dell'odore dei funghi|Il cammino è luce|Lontana, la serra si rinfresca all'ombra dei monti|Lo stagno brulica di vita}</i>}.
    + [Mi guardo attorno.]
    -
    
-> main


=== the_frog
~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
+ {are_two_entities_together(TheFrog, PG) && (not are_two_entities_together(Mentor, PG))} [TheFrog]
    <i>Una rana bluastra ti osserva incuriosita.</i>
        La Rana Parlante: Cra Cra
        La Rana Parlante: Cra
        La Rana Parlante: Cra?
            * * (frog) [{charNameTwo} dice che hai un regalo per me.]
            <i>La rana si silenza per un istante.</i>
            La Rana Parlante: Cra?
            La Rana Parlante: Cra Cra Cra!
            La Rana Parlante: Crrrrrrrrrrra!
            <i>La rana sta dicendo che spesso il ragazzino viene sulle sponde dello stagno e chiacchiera.</i>
            <i>E mentre chiacchiera si lamenta degli adulti.</i>
            La Rana Parlante: Craac!
            <i>Tranne della nonna e del fratello.</i>
            La Rana Parlante: Cra!
            <i>Al bambino non piacciono gli adulti perché non sono coerenti.</i>
            <i>Secondo la rana il modo migliore per conquistarlo non è per forza dargli ragione: è avere una direzione nelle cose che gli dici.</i>
            La Rana Parlante: Cracak Craac Cra.
            <i>Ma che sta anche a te decidere che fare alla fine.</i>
            <i>E che se serve può aiutarti ancora, in futuro.</i>
            <i>Ma ora ha fame.</i>
            La Rana Parlante: Crac!
                -> main
            * * -> main

   
   