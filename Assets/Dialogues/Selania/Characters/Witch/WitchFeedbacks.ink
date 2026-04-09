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
        ~ temp sigilUsed = false

        {charTag(TheWitch, "{witch_state()}")}:<i>Le radici ci raccontano che {player_name} ha fatto la sua prima riscrittura.
        <i>E un nuovo tronco cresce. Questo ci porta gioia.

        {
        //Frasi sulle PNG
            - firstChar_storyStatus == story_storyEnded && witch_debriefPNG hasnt FirstCharacter:
                <i>Siamo contente che {charNameOne} abbia trovato un nuovo nome, e un nuovo modo di vedere il proprio presente.
                <i>{charNameOne} è così giovane, eppure faticava a immaginare un futuro.
                <i>La gemma per crescere deve già contenere la foglia.
                <i>{charNameOne} ora ha trovato la sua forma.
                    ~ witch_debriefPNG += FirstCharacter
                    ~ witch_sigilsComment += FirstCharacter   
                    ~ sigilUsed = firstChar_usedSigil
            
            - secondChar_storyStatus == story_storyEnded && witch_debriefPNG hasnt SecondCharacter:
                <i>Il piccolo {charNameTwo} ora ha un nuovo nome da gridare.
                <i>La sua rabbia l'ha inzuppato di problemi.
                <i>L'ha protetto da cose peggiori.
                    ~ witch_debriefPNG += SecondCharacter
                    ~ witch_sigilsComment += SecondCharacter
                    ~ sigilUsed = secondChar_usedSigil 

            - thirdChar_storyStatus == story_storyEnded && witch_debriefPNG hasnt ThirdCharacter:
                Testo:
                    ~ witch_debriefPNG += ThirdCharacter
                    ~ witch_sigilsComment += ThirdCharacter
                    ~ sigilUsed = thirdChar_usedSigil   
        }

        <i>Un problema personale è un masso lungo il sentiero.
        <i>Il terreno può essere pulito.
        <i>La vista magnifica.
        <i>L'aria fresca.
        <i>Ma è comunque impossibile proseguire.
        <i>Cosa c'è nel petto di {player_name} dopo questa prima riscrittura?
        
            + (water) La gioia di aver aiutato qualcuno.
                    -> glyph_modifier_variation_management(PG, waterC)->
                {charTag(TheWitch, "{witch_state()}")}:<i>Aiutato chi {player_name} ha riscritto?
                <i>O aiutato l{player_pronouns has him:o|{player_pronouns has her:a|ə}} stess{player_pronouns has him:o|{player_pronouns has her:a|ə}} {player_name}?
                <i>Ma anche noi sentiamo questa gioia.
                <i>La serra è tiepida, la stazione attende, e le nubi dicono che {player_name} è dove deve essere.</i>
                
            + (fire) L'energia della voglia di fare, fare, fare ancora.
                    -> glyph_modifier_variation_management(PG, fireC)->
                {charTag(TheWitch, "{witch_state()}")}:<i>Il vulcano si carica di energia.
                <i>Il suo fare scivola lungo la collina.
                <i>Il terreno si fa fertile.
                <i>Fertile è la volontà di {player_name}.
                
            + (air) La curiosità di scoprire quali nuove cose accadranno.
                   -> glyph_modifier_variation_management(PG, airC)->
                {charTag(TheWitch, "{witch_state()}")}:<i>La curiosità del falco lo spinge verso l'alto.
                <i>Quella della talpa verso il basso.
                <i>Abbiamo l'impressione che quella di {player_name} sappia seguire ogni direzione.</i>
                
            + (earth) La soddisfazione di aver raggiunto un obbiettivo.
                    -> glyph_modifier_variation_management(PG, earthC)->
                {charTag(TheWitch, "{witch_state()}")}:<i>Il leoncino salta di fosso in fosso, senza mai trovare pace.
                <i>La leonessa si stende per ore dopo la caccia.
                <i>Crogiolarsi nella soddisfazione è una dote che siamo liete {player_name} sappia coltivare.
            
            + (aether) La sorpresa di aver scoperto cose nuove su di me.
                    -> glyph_modifier_variation_management(PG, aetherC)->
                {charTag(TheWitch, "{witch_state()}")}:<i>La luna distante sposta oceani.
                <i>Il vento invisibile sradica alberi.
                <i>E {player_name} decide di osservare sé nella propria interezza.</i>
            -

        <i>Riconoscere ciò che si prova a volte è un lusso che non tutti conoscono.
        <i>Soprattutto quando c'è qualcosa che fa star male.
        <i>A volte è solo qualcosa di personale.
        <i>A volte è il segno che qualcosa deve bruciare.

            {
                - sigilUsed > 0:
                    <i>Prima di congedarci, vorremo dire una cosa a {player_name}.
                    -> witch_sigilsUsedComment -> 
            }

    
        <i>Ringraziando ancora {player_name} per ora ci congediamo.
        <i>Senza mai davvero lasciar{player_pronouns has him:lo|{player_pronouns has her:la|lə}}.</i>
    
            -> witch_closing_storylet ->
            -> main
        
    
    === witch_second_debrief
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
        ~ temp sigilUsed = false

        {charTag(TheWitch, "{witch_state()}")}:<i>Il vento canta di una seconda riscrittura.
        <i>I rami si riempiono di storie.
        <i>E {player_name} conosce ormai il proprio valore.

        {
        //Frasi sulle PNG
            - firstChar_storyStatus == story_storyEnded && witch_debriefPNG hasnt FirstCharacter:
                <i>{charNameOne} racconta la storia di una generazione.
                <i>Del peso del capire troppo, e del non sapere che fare.
                <i>E del non poter accettare che le cose non possano cambiare.
                    ~ witch_debriefPNG += FirstCharacter
                    ~ witch_sigilsComment += FirstCharacter
                    ~ sigilUsed = firstChar_usedSigil

            - secondChar_storyStatus == story_storyEnded && witch_debriefPNG hasnt SecondCharacter:
                <i>La famiglia di {charNameTwo} è come una slavina.
                <i>Fiocco sulla vetta.
                <i>Valanga a valle.
                <i>Ma forse {charNameTwo} può trasformare la neve in pupazzo. 
                    ~ witch_debriefPNG += SecondCharacter
                    ~ witch_sigilsComment += SecondCharacter
                    ~ sigilUsed = secondChar_usedSigil

            - thirdChar_storyStatus == story_storyEnded && witch_debriefPNG hasnt ThirdCharacter:
                Testo:
                ~ witch_debriefPNG += ThirdCharacter
                ~ witch_sigilsComment += ThirdCharacter
                ~ sigilUsed = thirdChar_usedSigil
        }

        <i>Ci sono problemi che restano personali.
        <i>E altri che sono condivisi.
        <i>Come nubi scure che adombrano intere vallate.
        <i>Quale nube condivide {player_name} con le persone qui incontrate?
        
            + (water) Penso a {charNameTwo} e mi chiedo chi sarei ora, con una famiglia diversa alle spalle.
                    -> glyph_modifier_variation_management(PG, waterC)->
                {charTag(TheWitch, "{witch_state()}")}:<i>La gemma sul ramo ignora il tronco, eppure cresce.
                <i>Il girino nuota, non importa la dimensione dello stagno.
                <i>{player_name} prova a riscrivere il passato.
                <i>La sua voce può forse cercare nuovi modi di guardarlo?</i>
     
            + (aether) Come {charNameOne} ho bisogno di uno scopo per vivere davvero, ma non lo trovo.
                    -> glyph_modifier_variation_management(PG, aetherC)->
                {charTag(TheWitch, "{witch_state()}")}:<i>La rondine crea un nido di paglia.
                <i>E quando l'inverno arriva il nido cade sul terreno.
                <i>I funghi lo trasformano in cibo per il terreno.
                <i>In primavera l'erba ricresce, il caldo la secca.
                <i>La rondine crea un nido di paglia.</i>
                            
            + (fire) Ho la sensazione che Mentore si senta viva solo se utile, e lo stesso è per me.
                    -> glyph_modifier_variation_management(PG, fireC)->
                {charTag(TheWitch, "{witch_state()}")}:<i>Il colibrì vola ansioso di fiore in fiore.
                <i>Se non mangia spesso, muore.
                <i>Migliaia sono le piante nate dalla sua fatica.
                <i>In quante ricordano il suo nome?

            + (air) COMMENTO LEGATO A PNG3.
                    -> glyph_modifier_variation_management(PG, airC)->
                {charTag(TheWitch, "{witch_state()}")}:<i>Il sapere è una luce.
                <i>Il sapere è un rifugio.
                <i>Una luce troppo forte confonde strada e burrone.
                <i>Un rifugio col tempo può diventare prigione.</i>
         
            + (earth) Franco è sempre iperattivo. Forse lui ed io dovremmo imparare a riposare.
                    -> glyph_modifier_variation_management(PG, earthC)->
                {charTag(TheWitch, "{witch_state()}")}:<i>Le radici si rilassano nel tepore del terreno.
                <i>Le foglie ridono quando il vento le sfiora.
                <i>L'albero cresce, l'albero riposa.
            -
        
        <i>Un albero è un albero.
        <i>Quanti alberi fanno una foresta?
        <i>"Mi è successo questo", racconta qualcuna.
        <i>"Anche a me", risponde un'altra.
        <i>Una ferita è una ferita.
        <i>Quante ferite richiedono una protesta?
        
            {
                - sigilUsed > 0:
                    <i>Prima di congedarci, vorremo dire una cosa a {player_name}.
                    -> witch_sigilsUsedComment -> 
            }
        
        -> witch_closing_storylet ->
        -> main
        
    === witch_third_debrief
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
        ~ temp sigilUsed = false

        {charTag(TheWitch, "{witch_state()}")}:<i>La cagnolina della posta è sorpresa da questa terza riscrittura.
        <i>La nuova chioma raccoglie i suoi dubbi.
        Se vive una oppressione?

        {
        //Frasi sulle PNG
            - firstChar_storyStatus == story_storyEnded && witch_debriefPNG hasnt FirstCharacter:
                    <i>{charNameOne} le ha insegnato che non tutt3 hanno una casa.
                    <i>E che alcun3 ne hanno ancora meno di altr3.
                    <i>E la cagnolina non comprende, perché il mondo per lei è una grande tana.
                        ~ witch_debriefPNG += FirstCharacter
                        ~ witch_sigilsComment += FirstCharacter
                        ~ sigilUsed = firstChar_usedSigil    

            - secondChar_storyStatus == story_storyEnded && witch_debriefPNG hasnt SecondCharacter:
                    <i>Con {charNameTwo} ha scoperto che esistono i bambini.
                    <i>E che i bambini come i cuccioli vivono e fanno cose.
                    <i>Ma non possono decidere le cose che li riguardano.
                    <i>Il cucciolo cresce facendo i suoi errori.
                    <i>Ai bambini si chiede di crescere sembrano piccoli adulti.
                        ~ witch_debriefPNG += SecondCharacter
                        ~ witch_sigilsComment += SecondCharacter
                        ~ sigilUsed = secondChar_usedSigil

            - thirdChar_storyStatus == story_storyEnded && witch_debriefPNG hasnt ThirdCharacter:
                Testo:
                        ~ witch_debriefPNG += ThirdCharacter
                        ~ witch_sigilsComment += ThirdCharacter
                        ~ sigilUsed = thirdChar_usedSigil  
        }
        
        <i>La cagnolina non può pensare quello che non conosce.
        <i>La cagnolina si vede per quello che crede di essere, e vede il mondo allo stesso modo.
        <i>Chi ci insegna a vederci come siamo?

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

            {
                - sigilUsed > 0:
                    <i>Prima di congedarci, vorremo dire una cosa a {player_name}.
                    -> witch_sigilsUsedComment -> 
            }


        -> witch_closing_storylet ->
        -> main 
        
    === witch_fourth_debrief
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)

        {charTag(TheWitch, "{witch_state()}")}: Descriviamo il vantaggio personale e collettivo di un gruppo rispetto all'esperienza della personaggia. Le scappatoie di questo gruppo, le irresponsabilità. Stesso gesto, scelte diverse.
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

        {charTag(TheWitch, "{witch_state()}")}: Parliamo della necessità di lottare assieme per il cambiamento.
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



=== witch_sigilsUsedComment

{   
        
            - glyph_usedSigils == ():
                <i>Abbiamo visto che {player_name} non ha utilizzato i sigilli, {tutorial_witchSigils: e siamo felici che ci abbia ascoltate|e ne siamo felici}.

            - else:
                <i>Abbiamo visto che {player_name} ha utilizzato i sigilli, {tutorial_witchSigils: nonostante il nostro consiglio|e la cosa non ci rende felici}.
        
                    ~ temp speaker = ""
                    ~ temp char_aether = 0.00
                    ~ temp char_earth = 0.00
                    ~ temp char_air = 0.00
                    ~ temp char_water = 0.00
                    ~ temp char_fire = 0.00
                    ~ temp player_PNG_aether = 0.00
                    ~ temp player_PNG_earth = 0.00
                    ~ temp player_PNG_air = 0.00
                    ~ temp player_PNG_water = 0.00
                    ~ temp player_PNG_fire = 0.00

                {
                    - witch_sigilsComment has FirstCharacter:
                        ~ speaker = translator(firstChar_ActualName)
                        ~ char_aether = firstChar_aether
                        ~ char_earth =  firstChar_earth
                        ~ char_air =  firstChar_air
                        ~ char_water =  firstChar_water
                        ~ char_fire =  firstChar_fire
                        ~ player_PNG_aether =  player_aether_first_char
                        ~ player_PNG_earth =  player_earth_first_char
                        ~ player_PNG_air =  player_air_first_char
                        ~ player_PNG_water =  player_water_first_char
                        ~ player_PNG_fire =  player_fire_first_char

                    - witch_sigilsComment has SecondCharacter:
                        ~ speaker = translator(secondChar_ActualName)
                        ~ char_aether = secondChar_aether
                        ~ char_earth =  secondChar_earth
                        ~ char_air =  secondChar_air
                        ~ char_water =  secondChar_water
                        ~ char_fire =  secondChar_fire
                        ~ player_PNG_aether =  player_aether_second_char
                        ~ player_PNG_earth =  player_earth_second_char
                        ~ player_PNG_air =  player_air_second_char
                        ~ player_PNG_water =  player_water_second_char
                        ~ player_PNG_fire =  player_fire_second_char

                    - witch_sigilsComment has ThirdCharacter:
                        ~ speaker = translator(thirdChar_ActualName)
                        ~ char_aether = thirdChar_aether
                        ~ char_earth =  thirdChar_earth
                        ~ char_air =  thirdChar_air
                        ~ char_water =  thirdChar_water
                        ~ char_fire =  thirdChar_fire
                        ~ player_PNG_aether =  player_aether_third_char
                        ~ player_PNG_earth =  player_earth_third_char
                        ~ player_PNG_air =  player_air_third_char
                        ~ player_PNG_water =  player_water_third_char
                        ~ player_PNG_fire =  player_fire_third_char    
                }

                {
                    - char_fire > player_PNG_fire:
                        <i>Ad esempio {player_name} ha suggerito spesso a {speaker} di agire, di fare, ma ha usato sigilli molto meno attivi.

                    - char_earth > player_PNG_earth:
                        <i>Ad esempio {player_name} ha parlato spesso a {speaker} di cose concrete, di praticità, ma ha usato sigilli molto più vacui.

                    - char_water > player_PNG_water:
                        <i>Ad esempio {player_name} ha parlato spesso a {speaker} di relazioni e cura, ma ha usato sigilli meno emozionali.

                    - char_air > player_PNG_air:
                        <i>Ad esempio {player_name} ha evocato con {speaker} parole di sapere e curiosità, ma ha usato sigilli molto meno propensi alla conoscenza.

                    - else:
                        <i>Ad esempio {player_name} ha parlato spesso a {speaker} di unità, di una visione collettiva, spirituale, ma ha usato sigilli molto più concreti.
                }

                    <i>Noi crediamo nel lavoro e nelle scelte di {player_name}.
                    <i>Ma il bosco ha memoria, e noi con lui.

        }    







->->