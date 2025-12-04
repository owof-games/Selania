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
        

        Osserviamo {player_name} e ci chiediamo cosa provi dopo aver aiutato {charNameOne}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        
            + [Mi chiedo se sono all'altezza di tutto questo.]
                    -> color_variation_management(PG, greenC)->
                All'altezza per {charNameOne}?#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                All'altezza per {player_name}?
                O all'altezza per soddisfare {mentorName}?
                La serra è tiepida, la stazione attende, e le nubi dicono che {player_name} è dove deve essere.
                
            + [Sono felice per lei, ma il mondo non dovrebbe fare così paura.]
                    -> color_variation_management(PG, redC)->
                Non è il mondo a fare paura.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                Il mondo gira e muta e muore e rinasce.
                Sono le regole degli uomini a generare la paura.
                Ma così come l'acqua cancella anche la pietra più dura, {player_name} e {charNameOne} possono piegare le regole più severe.
                Con l'aiuto di altre gocce.
                
            + [Non ho apprezzato la sua mancanza di senso logico.]
                   -> color_variation_management(PG, blueC)->
                {charNameOne} possiede un forte senso logico.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                Soltanto, è diverso da quello di {player_name}.
                O di {mentorName}.
                Il senso logico del falco lo spinge verso l'alto.
                Quello della talpa verso il basso.
                E {charNameOne} segue ora la sua nuova direzione.
                
            + [Pensavo sarebbe stato più divertente.]
                    -> color_variation_management(PG, yellowC)->
                Quando il leone salta su un altro leone, trova la rissa.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                Ma quando un leoncino salta su un altro leoncino, trova ruzzoloni e corse.
                Il gioco non è nell'azione, ma nell'attitudine.
                Quale attitudine è radicata nelle azioni di {player_name}?
                Dove {player_name} trova il suo giocare?
            
            + [Spero che {charNameOne} sia capace di portare il suo cambiamento nel mondo.]
                    -> color_variation_management(PG, purpleC)->
                La luna distante sposta oceani.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                Il vento invisibile sradica alberi.
                {charNameOne} respira e il mondo ruota un po' più rapido.
                E {player_name} decide di osservare le cose nell'interezza.
            -

        L'acqua antica di {charNameOne} raccoglie tutti i sempre e i mai e ciò che non è stato.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        E ci racconta che {mentorName} ha molto aiutato {player_name} in questo viaggio.
        Anche noi vogliamo aiutare {player_name}, e per questo condividiamo una cosa.
        {player_name} può seguire la voce di {mentorName} e scegliere di studiare la persona che ha davanti come un uomo studia la vita attraverso un libro.
        Oppure {player_name} può decidere di essere sé {player_pronouns has him:stesso|{player_pronouns has her:stessa|stessə}}, anche se questo può creare attrito con l'altra persona.
        E scoprire che c'è chi ha bisogno di venir contraddettə.
        A volte l'attrito genera fastidio, o volte genera fuoco.
        A volte brucia il vecchio, permettendo al nuovo di crescere.
        Nessuna persona è uguale, nessuna persona vuole lo stesso trattamento.
        Ma funghi solleticano e distraggono le nostre rinascenti radici.
        Ringraziandoti ancora {player_name} per ora ci congediamo.
        Senza mai davvero lasciarti.
        
            @animation:RewriterBook

                -> main
    
    
    = second_story_ended_check
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)

        Un nuovo pezzo di noi ritrova spazio in questo mondo.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        L'aria finalmente ci rinfresca.
        E gli uccelli ci raccontano cose su {player_name}.
        E su quello che ha fatto per {charNameTwo}.
        E noi ci chiediamo: come sta {player_name} ora che {charNameTwo} è libero?
        
            + [Mi chiedo chi sarei ora, con una famiglia diversa alle spalle.]
                    -> color_variation_management(PG, greenC)->
                La gemma sul ramo ignora il tronco, eppure cresce.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                Il girino nuota, non importa la dimensione dello stagno.
                {player_name} prova a riscrivere il passato.
                La sua voce può forse cercare nuovi modi di guardarlo?
     
            + [Secondo te serve uno scopo più grande per vivere davvero?]
                    -> color_variation_management(PG, purpleC)->
                La rondine crea un nido di paglia.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                E quando l'inverno arriva il nido cade sul terreno.
                I funghi lo trasformano in cibo per il terreno.
                In primavera l'erba ricresce, il caldo la secca.
                La rondine crea un nido di paglia.
                            
            + [Nonostante tutto, mi ha fatto rivalutare la forza della rabbia.]
                    -> color_variation_management(PG, redC)->
                La lava scorre e brucia.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                Col tempo rende il terreno fertile.
                E dove prima cresceva solo erba, ora c'è un'intera foresta.
                
            + [Avevo dimenticato quanto conforto possa dare il sapere.]
                    -> color_variation_management(PG, blueC)->
                Il sapere è una luce.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                Il sapere è un rifugio.
                Una luce troppo forte confonde strada e burrone.
                Un rifugio col tempo può diventare prigione.
         
            + [Dovrei rimparare a giocare, a prendere le cose alla leggera.]
                    -> color_variation_management(PG, yellowC)->
                Le radici ridono quando l'erba fa solletico.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                Le foglie ridono quando il vento le sfiora.
                {player_name} forse ride quando non è {player_pronouns has him:solo|{player_pronouns has her:sola|solə}}.
            -

        L'acqua ci ha portato le lacrime di {mentorName}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        Questa storia per lei è stata faticosa.
        Le sue radici sembrano solide, ma il tronco ondeggia a ogni accenno di burrasca.
        Forse {player_name} può essere il suo sostegno.
        O forse {player_name} può lasciarla cadere, e ricominciare.
        Ora noi ci godiamo la brezza e il sole.
        Ma più tardi tornaci a trovare.
        
            @animation:RewriterBook

                -> main
        
    = third_story_ended_check
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
        
        + [Scelta verde.]
            -> color_variation_management(PG, greenC)->
            
        + [SCelta rossa.]
            -> color_variation_management(PG, redC)->
            
        + [Scelta blu.]
            -> color_variation_management(PG, blueC)->
     
        + [Scelta gialla.]
            -> color_variation_management(PG, yellowC)->
 
        + [Scelta viola.]
            -> color_variation_management(PG, purpleC)->
        -        
            -> main  
        
    = fourth_story_ended_check
         ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
        
        + [Scelta verde.]
            -> color_variation_management(PG, greenC)->
            
        + [SCelta rossa.]
            -> color_variation_management(PG, redC)->
            
        + [Scelta blu.]
            -> color_variation_management(PG, blueC)->
     
        + [Scelta gialla.]
            -> color_variation_management(PG, yellowC)->
 
        + [Scelta viola.]
            -> color_variation_management(PG, purpleC)->
        -        
            -> main   
    
    = fifth_story_ended_check
         ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
        
        + [Scelta verde.]
            -> color_variation_management(PG, greenC)->
            
        + [SCelta rossa.]
            -> color_variation_management(PG, redC)->
            
        + [Scelta blu.]
            -> color_variation_management(PG, blueC)->
     
        + [Scelta gialla.]
            -> color_variation_management(PG, yellowC)->
 
        + [Scelta viola.]
            -> color_variation_management(PG, purpleC)->
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
        {~Vecchie radici si ancorano nella memoria.|La corteccia tenace resiste alla dimenticanza.|Formiche inquiete cercano riparo nel vecchio legno.}#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            -> main
    
    = two
    //Opinioni dopo la fine di una storia  
        {~Gambe chiedono di percorrere nuove strade.|Nuovi piedi si riempiono di vecchie domande.|Porcellini di terra rotolano tra dita distese.}#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            -> main

    = three
    //Opinioni dopo la fine di due storie 
        {~L'aria saggia scalda il petto.|Un braccio steso in cerca di risposte.|Il tronco si torce inquieto.|L'erba si rinfresca ai piedi della nuova ombra.}#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            -> main

    = four
    
    -> main
    
