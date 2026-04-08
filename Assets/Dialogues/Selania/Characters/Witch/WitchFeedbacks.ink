//Gradualmente ognuno dei cinque feedback che lei ci dà serviranno per tracciare un percorso che parta dalla riscrittura come esperienza personale a qualcosa che è parte di un cambiamento per forza collettivo, inevitabilmente collettivo.
/***************

    Ogni debriefing è un percorso per tracciare il passaggio da una lettura personale a una sistemica delle repressioni.
    FASE 1: Mi succede qualcosa che non sembra essere grave per gli altri, ma lo è per me, o che mi viene chiesto di nascondere.
        es1: le luci a lavoro mi innervosiscono tantissimo, ma se provo a chiedere di cambiarle mi rispondo che sono le leggi, che se ne occupa HR o cose del genere.
        es2: provo desiderio verso un uomo, ma sin da piccolo "frocio" è un'offesa e mi vedo come sbagliato.
    FASE 2: Non è una cosa che capita solo a me, e inizio a sentirmi meno in colpa/sbagliata etc.
        es1: una collega confida che anche lei ha dei problemi, ma che non sa come comunicarlo senza sentirsi dire che fa troppe storie.
        es2: un compagno di scuola fa coming out, e il suo mondo non crolla.
    FASE 3: Riconosciamo che ci sono motivi culturali e sociali che favoriscono l'oppressione:
        es1: quando parliamo dentro e fuori dal lavoro delle nostre difficoltà, vengono sminuite. Ma soprattutto l'etica del lavoro e del sacrificio ci mette costantemente nella posizione di persone pigre, lamentone, fannullone.
        es2: col compagno scopriamo che la mascolinità egemone resta in piedi solo perché ha qualcuno da opprimere.
    FASE 4: Ci rendiamo conto che quelle norme favoriscono un gruppo, e che questo gruppo ha maggiore potere sociale, politico ed economico. Non solo: queste persone hanno sempre delle scappatoie, delle scuse per non prendersi responsabilità, cosa che a noi non è concesso. Stesso gesto, risposte sociali diverse.
        es1: ci rivolgiamo ad HR con una raccolta di testimonianze ampia sui problemi di accessibilità nel luogo di lavoro. HR ci risponde che non ci sono fondi, eppure il CEO ha appena ricevuto un assegno milionario. Ci viene detto che le soluzioni si possono trovare se portiamo delle certificazioni mediche, ma il medico non riconosce molti dei nostri problemi, oppure le liste d'attesa sono infinite, oppure la soluzione è farmacologica.
        es2: i bulli della scuola si sentono più fighi quando ci prendono di mira, definiscono la loro mascolinità dal modo in cui ci possono insultare. Ma questo lo fanno anche i politici, e quando portiamo i problemi che stiamo vivendo alla preside, questa ci dice che non può farci nulla, che la scuola non è politica e cose del genere. Eppure un mese prima ha ospitato il vescovo, ed è venuto anche il sindaco di FdI a parlare del suo lavoro.
    FASE 5: Diventa necessario lottare assieme per il cambiamento.
        Il dolore e le fatiche personali rimangono, e serve trovare modi per stare bene. Ma nel mentre devono cambiare le leggi, i poteri, le culture che permettono l'oppressione.

**************/
=== witch_first_debrief
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)

        {
        //Frasi sulle PNG
            - firstChar_storyStatus == story_storyEnded && witch_debriefPNG hasnt FirstCharacter:
                Testo:
                 ~ witch_debriefPNG += FirstCharacter       

            - secondChar_storyStatus == story_storyEnded && witch_debriefPNG hasnt SecondCharacter:
                Testo:
                 ~ witch_debriefPNG += SecondCharacter 

            - thirdChar_storyStatus == story_storyEnded && witch_debriefPNG hasnt ThirdCharacter:
                Testo:
                 ~ witch_debriefPNG += ThirdCharacter   
        }

        Descriviamo il problema della PNG in chiave personale (un po' come mentore), e poi chiediamo com'è stata la PG.

        
            + (water) Mi chiedo se sono all'altezza di tutto questo.
                    -> glyph_modifier_variation_management(PG, waterC)->
                <i>All'altezza per {charNameOne}?#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                <i>All'altezza per {player_name}?
                <i>O all'altezza per soddisfare {mentorName}?
                <i>La serra è tiepida, la stazione attende, e le nubi dicono che {player_name} è dove deve essere.</i>
                
            + (fire) Sono felice per lei, ma il mondo non deve farle così paura.
                    -> glyph_modifier_variation_management(PG, fireC)->
                <i>Non è il mondo a farle paura.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                <i>Il mondo gira e muta e muore e rinasce.
                <i>Sono le regole degli uomini a generare la paura.
                <i>Ma così come l'acqua cancella anche la pietra più dura, {player_name} e {charNameOne} possono piegare le regole più severe.
                <i>Con l'aiuto di altre gocce.</i>
                
            + (air) Non ho apprezzato la sua mancanza di senso logico.
                   -> glyph_modifier_variation_management(PG, airC)->
                <i>{charNameOne} possiede un forte senso logico.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                <i>Soltanto, è diverso da quello di {player_name}.
                <i>O di {mentorName}.
                <i>Il senso logico del falco lo spinge verso l'alto.
                <i>Quello della talpa verso il basso.
                <i>E {charNameOne} segue ora la sua nuova direzione.</i>
                
            + (earth) Pensavo sarebbe stato più divertente.
                    -> glyph_modifier_variation_management(PG, earthC)->
                <i>Quando il leone salta su un altro leone, trova la rissa.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                <i>Ma quando un leoncino salta su un altro leoncino, trova ruzzoloni e corse.
                <i>Il gioco non è nell'azione, ma nell'attitudine.
                <i>Quale attitudine è radicata nelle azioni di {player_name}?
                <i>Dove {player_name} trova il suo giocare?</i>
            
            + (aether) Spero che {charNameOne} sia capace di portare il suo cambiamento nel mondo.
                    -> glyph_modifier_variation_management(PG, aetherC)->
                <i>La luna distante sposta oceani.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                <i>Il vento invisibile sradica alberi.
                <i>{charNameOne} respira e il mondo ruota un po' più rapido.
                <i>E {player_name} decide di osservare le cose nell'interezza.</i>
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
        <i>Senza mai davvero lasciarti.</i>
        - 

        -> witch_closing_storylet ->
        -> main
    
    
    === witch_second_debrief
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)

        Descriviamo il problema delle PNG come più esteso, magari citando cose dalle loro storie, o che in generale sono comuni ad altre persone.
        Chiediamo alla PG se si è trovata in qualche modo legata alla personaggia.

        {
        //Frasi sulle PNG
            - firstChar_storyStatus == story_storyEnded && witch_debriefPNG hasnt FirstCharacter:
                Testo:
                ~ witch_debriefPNG += FirstCharacter       

            - secondChar_storyStatus == story_storyEnded && witch_debriefPNG hasnt SecondCharacter:
                Testo:
                ~ witch_debriefPNG += SecondCharacter 

            - thirdChar_storyStatus == story_storyEnded && witch_debriefPNG hasnt ThirdCharacter:
                Testo:
                ~ witch_debriefPNG += ThirdCharacter   
        }

        
            + (water) Mi chiedo chi sarei ora, con una famiglia diversa alle spalle.
                    -> glyph_modifier_variation_management(PG, waterC)->
                <i>La gemma sul ramo ignora il tronco, eppure cresce.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                <i>Il girino nuota, non importa la dimensione dello stagno.
                <i>{player_name} prova a riscrivere il passato.
                <i>La sua voce può forse cercare nuovi modi di guardarlo?</i>
     
            + (aether) Secondo te serve uno scopo più grande per vivere davvero?
                    -> glyph_modifier_variation_management(PG, aetherC)->
                <i>La rondine crea un nido di paglia.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                <i>E quando l'inverno arriva il nido cade sul terreno.
                <i>I funghi lo trasformano in cibo per il terreno.
                <i>In primavera l'erba ricresce, il caldo la secca.
                <i>La rondine crea un nido di paglia.</i>
                            
            + (fire) La rabbia è sottovalutata. Ha protetto questo bambino.
                    -> glyph_modifier_variation_management(PG, fireC)->
                <i>La lava scorre e brucia.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                <i>Col tempo rende il terreno fertile.
                <i>E dove prima cresceva solo erba, ora c'è un'intera foresta.</i>
                
            + (air) Avevo dimenticato quanto conforto possa dare il sapere.
                    -> glyph_modifier_variation_management(PG, airC)->
                <i>Il sapere è una luce.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                <i>Il sapere è un rifugio.
                <i>Una luce troppo forte confonde strada e burrone.
                <i>Un rifugio col tempo può diventare prigione.</i>
         
            + (earth) Devo riprendere a giocare, a prendere le cose alla leggera.
                    -> glyph_modifier_variation_management(PG, earthC)->
                <i>Le radici ridono quando l'erba fa solletico.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                <i>Le foglie ridono quando il vento le sfiora.
                <i>{player_name} forse ride quando non è {player_pronouns has him:solo|{player_pronouns has her:sola|solə}}.</i>
            -
        <i>Un'amica ci disse in tempi inquieti che per trovare il sentiero della magia occorre osservare con attenzione il bimbo che gioca.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        <i>{charNameTwo} ha portato in questi spazi sentieri inaspettati.
        <i>Così come l'acqua ci ha portato le lacrime di {mentorName}.
        <i>Questa storia per lei è stata faticosa.
        <i>Le sue radici sembrano solide, ma il tronco ondeggia a ogni accenno di burrasca.
        <i>Forse {player_name} può essere il suo sostegno.
        <i>O forse {player_name} può lasciarla cadere, e ricominciare.
        <i>Ora noi ci godiamo la brezza e il sole.
        <i>Ma più tardi tornaci a trovare.</i>
        - 
        
        -> witch_closing_storylet ->
        -> main
        
    === witch_third_debrief
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)

        Descriviamo gli aspetti culturali e sociali che favoriscono l'oppressione (o mettiamo luce su cose diverse, nel caso di PNG3, sul perché non lo sia).
        Poi cosa chiediamo alla PG?
        Se vive una oppressione?

        {
        //Frasi sulle PNG
            - firstChar_storyStatus == story_storyEnded && witch_debriefPNG hasnt FirstCharacter:
                Testo:
                 ~ witch_debriefPNG += FirstCharacter       

            - secondChar_storyStatus == story_storyEnded && witch_debriefPNG hasnt SecondCharacter:
                Testo:
                 ~ witch_debriefPNG += SecondCharacter 

            - thirdChar_storyStatus == story_storyEnded && witch_debriefPNG hasnt ThirdCharacter:
                Testo:
                 ~ witch_debriefPNG += ThirdCharacter   
        }
        


        Domanda: chi mi ha insegnato a vedermi così? cosa me l'ha insegnato? In generale: da dove vengono le credenze su di sé, queste riscritture che dobbiamo poi andare a fare?

        
            
        + (fire) SCelta rossa.
            -> glyph_modifier_variation_management(PG, fireC)->
            
        + (air) Scelta blu.
            -> glyph_modifier_variation_management(PG, airC)->

        + (aether) Scelta viola.
            -> glyph_modifier_variation_management(PG, aetherC)->    

        + (water) Scelta verde.
            -> glyph_modifier_variation_management(PG, waterC)->    
     
        + (earth) Scelta gialla.
            -> glyph_modifier_variation_management(PG, earthC)->
        -        
        -> witch_closing_storylet ->
        -> main 
        
    === witch_fourth_debrief
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)

        Descriviamo il vantaggio personale e collettivo di un gruppo rispetto all'esperienza della personaggia. Le scappatoie di questo gruppo, le irresponsabilità. Stesso gesto, scelte diverse.
        E poi chiediamo alla giocatrice qualcosa sulla sua posizione di vantaggio, di privilegio.

        {
        //Frasi sulle PNG
            - fourthChar_storyStatus == story_storyEnded && witch_debriefPNG hasnt FourthCharacter:
                Testo:
                 ~ witch_debriefPNG += FourthCharacter       

            - fifthChar_storyStatus == story_storyEnded && witch_debriefPNG hasnt FifthCharacter:
                    Personale e sociale non sono scollegati. E la rilettura di Mentore diventa la presenza di una doppia strada: prendersi cura di sé, cambiare il mondo.
                    Con gli altri.
                    Mentore stava di merda perché cercava di essere qualcosa che non era.
                    Ma non perché fosse pazza, ma perché il nostro mondo ci dice: sii una sola cosa, o smetti di esistere.

                 ~ witch_debriefPNG += FifthCharacter 
        }

        
        Nonna molotov ci ha insegnate ora in modo evidente che il problema è sistemico. A cosa serve riscriversi, quando un problema è sistemico?


            
        + (air) Scelta blu.
            -> glyph_modifier_variation_management(PG, airC)->

        + (water) Scelta verde.
            -> glyph_modifier_variation_management(PG, waterC)->

        + (earth) Scelta gialla.
            -> glyph_modifier_variation_management(PG, earthC)->
 
        + (aether) Scelta viola.
            -> glyph_modifier_variation_management(PG, aetherC)-> 

        + (fire) SCelta rossa.
            -> glyph_modifier_variation_management(PG, fireC)->            
        -        
        -> witch_closing_storylet ->
        -> main  
    
    === witch_fifth_debrief
         ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)

        Parliamo della necessità di lottare assieme per il cambiamento.
        Il dolore e le fatiche personali rimangono, e serve trovare modi per stare bene. Ma nel mentre devono cambiare le leggi, i poteri, le culture che permettono l'oppressione.
        E la domanda ora è:
        come pensi di lottare, PG?

        {
        //Frasi sulle PNG
            - fourthChar_storyStatus == story_storyEnded && witch_debriefPNG hasnt FourthCharacter:
                Testo:
                 ~ witch_debriefPNG += FourthCharacter       

            - fifthChar_storyStatus == story_storyEnded && witch_debriefPNG hasnt FifthCharacter:
                    Personale e sociale non sono scollegati. E la rilettura di Mentore diventa la presenza di una doppia strada: prendersi cura di sé, cambiare il mondo.
                    Con gli altri.
                    Mentore stava di merda perché cercava di essere qualcosa che non era.
                    Ma non perché fosse pazza, ma perché il nostro mondo ci dice: sii una sola cosa, o smetti di esistere.

                 ~ witch_debriefPNG += FifthCharacter 
        }

        + (earth) Scelta gialla.
            -> glyph_modifier_variation_management(PG, earthC)->
 
        + (aether) Scelta viola.
            -> glyph_modifier_variation_management(PG, aetherC)->
        
        + (fire) SCelta rossa.
            -> glyph_modifier_variation_management(PG, fireC)->

        + (water) Scelta verde.
            -> glyph_modifier_variation_management(PG, waterC)->
    
        + (air) Scelta blu.
            -> glyph_modifier_variation_management(PG, airC)->
     

        -        
        -> witch_closing_storylet ->
        -> main 