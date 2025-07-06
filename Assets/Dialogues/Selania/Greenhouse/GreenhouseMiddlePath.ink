=== greenhouse_middle_path ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
{greenhouse_middle_path== 1: <i>Spazi aperti, insetti, e ninfee galleggianti</i>|<i>{~Il cammino è ricco dell'odore dei funghi|Il cammino è luce|Lontana, la serra si rinfresca all'ombra dei monti|Lo stagno brulica di vita}</i>}.
    + [Mi guardo attorno.]
    -
    
-> main


=== the_frog
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameOne = translator(firstCharacterState)
    + {are_two_entities_together(TheFrog, PG)} [TheFrog]
        <i>Una rana bluastra ti osserva incuriosita.</i>
            La Rana Parlante: Cra Cra
            La Rana Parlante: Cra
            La Rana Parlante: Cra?
            - (top)
            
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
                        -> top
                        
                * * {frog && firstStory == Active} [Puoi aiutarmi anche per {charNameOne}?]
                    <i>La rana sembra rifletterci.</i>
                    La Rana Parlante: Cra.
                    <i>La rana accetta, ma non promette di essere così disponibile in futuro.</i>
                    La Rana Parlante: CRRRRRRACC. Crac. Cra?
                    <i>L'unica cosa certa è che {charNameOne} DETESTA le persone troppo razionali.</i>
                    <i>Non ce l'ha con la scienza in sé, quanto con l'idea che tutto possa essere ridotto a calcolo e numero.</i>
                    La Rana Parlante: Craaaaaac. Cra cra. Cra cra.
                    La Rana Parlate: Cra.
                    <i>E che quando si siede qui sullo stagno, parla molto di spiritualità.</i>
                    La Rana Parlante: Crac crac crac Craac crac cracccc.
                    <i>E chiede se la prossima volta le porti uno stuzzichino, perché ha molta fame.</i>
                        -> top
                        
                + + -> main

   
   