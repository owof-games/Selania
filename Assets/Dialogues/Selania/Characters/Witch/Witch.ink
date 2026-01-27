=== the_witch
    + {are_two_entities_together(TheWitch, PG)} [TheWitch]
    -> witch_storylets
    
    
=== witch_feedback
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
    {
        //Check per intro
        - not witch_intro && ((firstChar_storyStatus == story_storyEnded) or (secondChar_storyStatus == story_storyEnded) or (thirdChar_storyStatus == story_storyEnded)):
            -> witch_intro

    }
    
    {
        //Check post storie dopo l'intro
        - witch_intro && firstChar_storyStatus == story_storyEnded && not first_story_ended_check:
            -> first_story_ended_check
        - witch_intro && secondChar_storyStatus == story_storyEnded && not second_story_ended_check:
            -> second_story_ended_check
        - witch_intro && thirdChar_storyStatus == story_storyEnded && not third_story_ended_check:
            -> third_story_ended_check
        - witch_intro && fourthChar_storyStatus == story_storyEnded:
            -> fourth_story_ended_check
        - witch_intro && fifthChar_storyStatus == story_storyEnded:
            -> fifth_story_ended_check    

        
        - else:
            -> descriptions
    }




    = first_story_ended_check
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
        

        <i>Osserviamo {player_name} e ci chiediamo cosa provi dopo aver aiutato {charNameOne}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        
            + [Mi chiedo se sono all'altezza di tutto questo.]
                    -> color_variation_management(PG, greenC, varPGYes)->
                <i>All'altezza per {charNameOne}?#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                <i>All'altezza per {player_name}?
                <i>O all'altezza per soddisfare {mentorName}?
                <i>La serra è tiepida, la stazione attende, e le nubi dicono che {player_name} è dove deve essere.
                
            + [Sono felice per lei, ma il mondo non deve farle così paura.]
                    -> color_variation_management(PG, redC, varPGYes)->
                <i>Non è il mondo a farle paura.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                <i>Il mondo gira e muta e muore e rinasce.
                <i>Sono le regole degli uomini a generare la paura.
                <i>Ma così come l'acqua cancella anche la pietra più dura, {player_name} e {charNameOne} possono piegare le regole più severe.
                <i>Con l'aiuto di altre gocce.
                
            + [Non ho apprezzato la sua mancanza di senso logico.]
                   -> color_variation_management(PG, blueC, varPGYes)->
                <i>{charNameOne} possiede un forte senso logico.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                <i>Soltanto, è diverso da quello di {player_name}.
                <i>O di {mentorName}.
                <i>Il senso logico del falco lo spinge verso l'alto.
                <i>Quello della talpa verso il basso.
                <i>E {charNameOne} segue ora la sua nuova direzione.
                
            + [Pensavo sarebbe stato più divertente.]
                    -> color_variation_management(PG, yellowC, varPGYes)->
                <i>Quando il leone salta su un altro leone, trova la rissa.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                <i>Ma quando un leoncino salta su un altro leoncino, trova ruzzoloni e corse.
                <i>Il gioco non è nell'azione, ma nell'attitudine.
                <i>Quale attitudine è radicata nelle azioni di {player_name}?
                <i>Dove {player_name} trova il suo giocare?
            
            + [Spero che {charNameOne} sia capace di portare il suo cambiamento nel mondo.]
                    -> color_variation_management(PG, purpleC, varPGYes)->
                <i>La luna distante sposta oceani.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                <i>Il vento invisibile sradica alberi.
                <i>{charNameOne} respira e il mondo ruota un po' più rapido.
                <i>E {player_name} decide di osservare le cose nell'interezza.
            -

        <i>L'acqua antica di {charNameOne} raccoglie tutti i sempre e i mai e ciò che non è stato.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
       <i>E ci racconta che {mentorName} ha molto aiutato {player_name} in questo viaggio.
        <i>Anche noi vogliamo aiutare {player_name}, e per questo condividiamo una cosa.
        <i>{player_name} può seguire la voce di {mentorName} e scegliere di studiare la persona che ha davanti come un uomo studia la vita attraverso un libro.
        <i>Oppure {player_name} può decidere di essere sé {player_pronouns has him:stesso|{player_pronouns has her:stessa|stessə}}, anche se questo può creare attrito con l'altra persona.
        <i>E scoprire che c'è chi ha bisogno di venir contraddettə.
        <i>A volte l'attrito genera fastidio, o volte genera fuoco.
        <i>A volte brucia il vecchio, permettendo al nuovo di crescere.
        <i>Nessuna persona è uguale, nessuna persona vuole lo stesso trattamento.
        <i>Ma funghi solleticano e distraggono le nostre rinascenti radici.
        <i>Ringraziandoti ancora {player_name} per ora ci congediamo.
        <i>Senza mai davvero lasciarti.
        - (bookUpdate)

            @animation:RewriterBook

                -> main
    
    
    = second_story_ended_check
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)

        <i>Un nuovo pezzo di noi ritrova spazio in questo mondo.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        <i>L'aria finalmente ci rinfresca.
        <i>E gli uccelli ci raccontano cose su {player_name}.
        <i>E su quello che ha fatto per {charNameTwo}.
        <i>E noi ci chiediamo: come sta {player_name} ora che {charNameTwo} è libero?
        
            + [Mi chiedo chi sarei ora, con una famiglia diversa alle spalle.]
                    -> color_variation_management(PG, greenC, varPGYes)->
                <i>La gemma sul ramo ignora il tronco, eppure cresce.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                <i>Il girino nuota, non importa la dimensione dello stagno.
                <i>{player_name} prova a riscrivere il passato.
                <i>La sua voce può forse cercare nuovi modi di guardarlo?
     
            + [Secondo te serve uno scopo più grande per vivere davvero?]
                    -> color_variation_management(PG, purpleC, varPGYes)->
                <i>La rondine crea un nido di paglia.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                <i>E quando l'inverno arriva il nido cade sul terreno.
                <i>I funghi lo trasformano in cibo per il terreno.
                <i>In primavera l'erba ricresce, il caldo la secca.
                <i>La rondine crea un nido di paglia.
                            
            + [La rabbia è sottovalutata. Ha protetto questo bambino.]
                    -> color_variation_management(PG, redC, varPGYes)->
                <i>La lava scorre e brucia.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                <i>Col tempo rende il terreno fertile.
                <i>E dove prima cresceva solo erba, ora c'è un'intera foresta.
                
            + [Avevo dimenticato quanto conforto possa dare il sapere.]
                    -> color_variation_management(PG, blueC, varPGYes)->
                <i>Il sapere è una luce.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                <i>Il sapere è un rifugio.
                <i>Una luce troppo forte confonde strada e burrone.
                <i>Un rifugio col tempo può diventare prigione.
         
            + [Devo riprendere a giocare, a prendere le cose alla leggera.]
                    -> color_variation_management(PG, yellowC, varPGYes)->
                <i>Le radici ridono quando l'erba fa solletico.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                <i>Le foglie ridono quando il vento le sfiora.
                <i>{player_name} forse ride quando non è {player_pronouns has him:solo|{player_pronouns has her:sola|solə}}.
            -
        <i>Un'amica ci disse in tempi inquieti che per trovare il sentiero della magia occorre osservare con attenzione il bimbo che gioca.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        <i>{charNameTwo} ha portato in questi spazi sentieri inaspettati.
        <i>Così come l'acqua ci ha portato le lacrime di {mentorName}.
        <i>Questa storia per lei è stata faticosa.
        <i>Le sue radici sembrano solide, ma il tronco ondeggia a ogni accenno di burrasca.
        <i>Forse {player_name} può essere il suo sostegno.
        <i>O forse {player_name} può lasciarla cadere, e ricominciare.
        <i>Ora noi ci godiamo la brezza e il sole.
        <i>Ma più tardi tornaci a trovare.
        - (bookUpdate)
        
            @animation:RewriterBook

                -> main
        
    = third_story_ended_check
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
        
        + [Scelta verde.]
            -> color_variation_management(PG, greenC, varPGYes)->
            
        + [SCelta rossa.]
            -> color_variation_management(PG, redC, varPGYes)->
            
        + [Scelta blu.]
            -> color_variation_management(PG, blueC, varPGYes)->
     
        + [Scelta gialla.]
            -> color_variation_management(PG, yellowC, varPGYes)->
 
        + [Scelta viola.]
            -> color_variation_management(PG, purpleC, varPGYes)->
        -        
            -> main  
        
    = fourth_story_ended_check
         ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
        
        + [Scelta verde.]
            -> color_variation_management(PG, greenC, varPGYes)->
            
        + [SCelta rossa.]
            -> color_variation_management(PG, redC, varPGYes)->
            
        + [Scelta blu.]
            -> color_variation_management(PG, blueC, varPGYes)->
     
        + [Scelta gialla.]
            -> color_variation_management(PG, yellowC, varPGYes)->
 
        + [Scelta viola.]
            -> color_variation_management(PG, purpleC, varPGYes)->
        -        
            -> main   
    
    = fifth_story_ended_check
         ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
        
        + [Scelta verde.]
            -> color_variation_management(PG, greenC, varPGYes)->
            
        + [SCelta rossa.]
            -> color_variation_management(PG, redC, varPGYes)->
            
        + [Scelta blu.]
            -> color_variation_management(PG, blueC, varPGYes)->
     
        + [Scelta gialla.]
            -> color_variation_management(PG, yellowC, varPGYes)->
 
        + [Scelta viola.]
            -> color_variation_management(PG, purpleC, varPGYes)->
        -        
            -> main  

=== descriptions
    {   
        //Opinioni dopo la fine di due storie    
        - (firstChar_storyStatus == story_storyEnded) && (secondChar_storyStatus == story_storyEnded):
            -> three
        //Opinioni dopo la fine di una storia     
        - (firstChar_storyStatus == story_storyEnded) or (secondChar_storyStatus == story_storyEnded):
            -> two
        //Opinioni presenti da inizio gioco    
        - else:
            -> one
    }
    
    = one
    //Contenuti iniziali
        <i>{~Vecchie radici si ancorano nella memoria.|La corteccia tenace resiste alla dimenticanza.|Formiche inquiete cercano riparo nel vecchio legno.}#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            -> main
    
    = two
    //Opinioni dopo la fine di una storia  
        <i>{~Gambe chiedono di percorrere nuove strade.|Nuovi piedi si riempiono di vecchie domande.|Porcellini di terra rotolano tra dita distese.}#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            -> main

    = three
    //Opinioni dopo la fine di due storie 
        <i>{~L'aria saggia scalda il petto.|Un braccio steso in cerca di risposte.|Il tronco si torce inquieto.|L'erba si rinfresca ai piedi della nuova ombra.}#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            -> main

    = four
    
    -> main
    
