=== greenhouse_middle_path ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
            ~ arrivingFrom = ()
            ~ arrivingFrom = GreenhouseMiddlePath
{greenhouse_middle_path== 1: <i>Spazi aperti, insetti, e ninfee galleggianti</i>|<i>{~Il cammino è ricco dell'odore dei funghi|Il cammino è luce|Lontana, la serra si rinfresca all'ombra dei monti|Lo stagno brulica di vita}</i>}. #speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: fungus_neutral
    + [Mi guardo attorno.]
    -
    
-> main


=== the_frog
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameOne = translator(firstCharacterState)

    + (talkFrog) {are_two_entities_together(TheFrog, PG)} [TheFrog]
        <i>Una rana bluastra ti osserva incuriosita.</i> #speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: fungus_neutral
            Cra Cra #speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #portrait:frog_neutral
            Cra
            Cra?
            {
                - the_frog == 1:
                ~ saturationVar ++
                ~ move_entity(bowl, Bedroom)
            }

            ~ move_entity(FrogRecap, BookPlace)
            - (top)
            
                * * (frog) [{charNameTwo} dice che hai un regalo per me.]
                    <i>La rana si silenza per un istante.</i> #speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: fungus_neutral
                    Cra?:#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #portrait:frog_neutral
                    Cra Cra Cra!
                    Crrrrrrrrrrra!
                    <i>La rana sta dicendo che spesso il ragazzino viene sulle sponde dello stagno e chiacchiera.</i>#speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: fungus_neutral
                    <i>E mentre chiacchiera si lamenta degli adulti.</i>
                    Craac!:#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #portrait:frog_neutral
                    <i>Tranne della nonna e del fratello.</i>#speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: fungus_neutral
                    Cra!:#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #portrait:frog_neutral
                    <i>Al bambino non piacciono gli adulti perché non sono coerenti.</i> #speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: fungus_neutral
                    <i>Secondo la rana il modo migliore per conquistarlo non è per forza dargli ragione: è avere una direzione nelle cose che gli dici.</i>
                    Cracak Craac Cra.:#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #portrait:frog_neutral
                    <i>Ma che sta anche a te decidere che fare alla fine.</i>#speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: fungus_neutral
                    <i>E che se serve può aiutarti ancora, in futuro.</i>
                    <i>Ma ora ha fame.</i>
                    Crac!:#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #portrait:frog_neutral
                    ~ bookBGVariations ++
                        -> top
                        
                * * {frog && firstStory == Active} [Puoi aiutarmi anche per {charNameOne}?]
                    <i>La rana sembra rifletterci.</i>#speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: fungus_neutral
                    Cra.:#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #portrait:frog_neutral
                    <i>La rana accetta, ma non promette di essere così disponibile in futuro.</i>#speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: fungus_neutral
                    CRRRRRRACC. Crac. Cra?:#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #portrait:frog_neutral
                    <i>L'unica cosa certa è che {charNameOne} DETESTA le persone troppo razionali.</i>#speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: fungus_neutral
                    <i>Non ce l'ha con la scienza in sé, quanto con l'idea che tutto possa essere ridotto a calcolo e numero.</i>
                    Craaaaaac. Cra cra. Cra cra.:#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #portrait:frog_neutral
                    La Rana Parlate: Cra.
                    <i>E che quando si siede qui sullo stagno, parla molto di spiritualità.</i>#speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: fungus_neutral
                    Crac crac crac Craac crac cracccc.:#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #portrait:frog_neutral
                    <i>E chiede se la prossima volta le porti uno stuzzichino, perché ha molta fame.</i>#speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: fungus_neutral
                        -> top
                        
                + + -> main

   
   