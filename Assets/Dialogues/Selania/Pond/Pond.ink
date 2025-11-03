=== pond ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
           
{debug: La lista degli oggetti nella stanza è: {pondContents}.}

{pond  == 1:Lo stagno è caldo, il cammino ricco dell'odore dei funghi.}#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}

~ arrivingFrom = Pond

// {pond  == 1: Spazi aperti, insetti, e ninfee galleggianti|{~Il cammino è ricco dell'odore dei funghi|Il cammino è luce|Lontana, la serra si rinfresca all'ombra dei monti|Lo stagno brulica di vita}}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}

    -> main

//Debug della rana
    + {debug_test_frog} [FrogDebug]
        -> welcoming_frog


=== the_frog
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameOne = translator(firstCharacterState)
    {
        - the_frog == 1:
        ~ somethingStrange ++
    
    }
    + (talkFrog) {are_two_entities_together(TheFrog, PG)} [TheFrog]
        Una rana bluastra ti osserva incuriosita.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
            Cra Cra#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #portrait:frog_neutral
            Cra

            {
                - talkFrog == 1:
                ~ saturationVar ++
                ~ move_entity(bowl, Bedroom)
                ~ move_entity(waterLily, Bedroom)
            }
            ~ move_entity(FrogRecap, BookPlace)
            
            - (top)
            Cra?#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #portrait:frog_neutral
                
                * (frog) [{charNameTwo} dice che hai un regalo per me.]
                    La rana si silenza per un istante.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
                    Cra?#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #portrait:frog_neutral
                    Cra Cra Cra!
                    Crrrrrrrrrrra!
                    La rana sta dicendo che spesso il ragazzino viene sulle sponde dello stagno e chiacchiera.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
                    E mentre chiacchiera si lamenta degli adulti.
                    Craac!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #portrait:frog_neutral
                    Tranne della nonna e del fratello.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
                    Cra!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #portrait:frog_neutral
                    Al bambino non piacciono gli adulti perché non sono coerenti.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
                    Secondo la rana il modo migliore per conquistarlo non è per forza dargli ragione: è mostrare coerenza.
                    Cracak Craac Cra.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #portrait:frog_neutral
                    Ma che sta anche a te decidere che fare alla fine.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
                    E che se serve può aiutarti ancora, in futuro.
                    Ma ora ha fame.
                    Crac!:#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #portrait:frog_neutral
                        ~ bookBGVariations ++

                    @animation:RewriterBook

                        -> top
                    
                * (second) {frog && firstStory == StoryStarted} [Puoi aiutarmi con {charNameOne}?]
                    La rana sembra rifletterci.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
                    Cra.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #portrait:frog_neutral
                    La rana accetta, ma non promette di essere così disponibile in futuro.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
                    CRRRRRRACC. Crac. Cra?#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #portrait:frog_neutral
                    L'unica cosa certa è che {charNameOne} DETESTA le persone troppo razionali.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
                    Non ce l'ha con la scienza in sé, quanto con l'idea che tutto possa essere ridotto a calcolo e numero.
                    Craaaaaac. Cra cra. Cra cra.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #portrait:frog_neutral
                    Cra.
                    E che quando si siede qui sullo stagno, parla molto di spiritualità.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
                    Crac crac crac Craac crac cracccc.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #portrait:frog_neutral
                    E chiede se la prossima volta le porti uno stuzzichino, perché ha DAVVERO molta fame.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
                        
                     @animation:RewriterBook

                        -> top
                        
                + [Mi allontano.]
                    {~Crac crac crac.|CRRRRRRACC.|Cra!|Cra?|Cra.|Crac!Crrrrrrrrrrra!|Cra cra.}#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #portrait:frog_neutral
                    -> main

   
   