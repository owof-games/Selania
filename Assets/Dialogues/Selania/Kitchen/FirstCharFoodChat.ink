/* ---------------------------------

   Cucina con Chitarra

 ----------------------------------*/
=== pre_start_cooking_with_first_char
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
Quindi {player_name}, iniziamo a cucinare assieme? #speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        
        + [Ci sto!]
            -> cooking_with_first_char
        
        + [Ci penso un attimo.]
            -> main
 

=== cooking_with_first_char
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
    -> storage_colors(FirstCharacter)->
    -> cooking_animations_on ->

    Sai {charNameOne}, mentre cuciniamo potremmo parlare un po'.
    In particolare, ripensando alle nostre conversazioni, mi farebbe piacere parlare di più...
    
    - (top)    
        
        + [Dei rapporti che hai con le persone che ti sono care.]
                -> first_theme
                

        + [{first_char_main_storylets.six: Del bisogno di fare qualcosa che salvi il mondo.|<i>Parla ancora con {charNameOne} per sbloccare questo tema.</i>}]
            {
                - first_char_main_storylets.six:
                    -> second_theme
                
                - else:
                    -> top
            }
        
        + [{first_char_main_storylets.nine: Del tuo rapporto con la creatività.|<i>Parla ancora con {charNameOne} per sbloccare questo tema.</i>}]
            {
            
                - first_char_main_storylets.nine:
                    -> third_theme
                
                - else:
                    -> top
            }
            
        + [Sai, forse preferirei cucinare più tardi.]
            Nessun problema, prenditi i tuoi tempi {player_name}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            -> main


    
    = first_theme
        Uh, hai già capito che per me le relazioni sono abbastanza il centro di tutto.
        Vediamo, cosa ti posso raccontare?
        Da piccola in realtà ero abbastanza un disastro sociale.
        Timida a bestia, bullizzata perché in carne, e secchiona.
        Non la ragazzina più amata dalla scuola.
        Uh, aspetta che abbasso la fiamma.
        Meglio.
        Però a casa era un piccolo paradiso.
        I miei sono gente semplice, ma hanno sempre premiato la curiosità.
        Papà mi ha passato l'amore per la musica.
        Mamma quando canta ha una voce che scioglie ogni tensione.
        Ma è stato papà quello che mi regalava sempre qualcosina che faceva rumore.
        E appena è riuscito a risparmiare a sufficienza, mi ha dato lezioni di piano.
        Credo che i miei mi abbiano insegnato che le relazioni sono cura.
        E sacrificio.
        Credi abbia senso?
        
            + [Scelta blu]
                -> color_variation_management(FirstCharacter, blueC)->
               
            + [Scelta gialla]
                -> color_variation_management(FirstCharacter, yellowC)->
             
            + [Scelta rossa]
                -> color_variation_management(FirstCharacter, redC)->
        
            + [Scelta verde]
                -> color_variation_management(FirstCharacter, greenC)->
    
            + [Scelta viola]
                -> color_variation_management(FirstCharacter, purpleC)->
            -    
        No no taglio io, non ti preoccupare, continua a mischiare.
        Ma invece tu che rapporto hai coi tuoi genitori?
            {
                - not cooking_with_second_char: Provi a parlare, ma non ti escono le parole. Però gli ingredienti possono parlare per te.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            }
        {player_name} aggiunge alla ricetta... #speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        
            + [Dei cubetti di grano del rispetto.]
                ~ kitchen_recipeNoun = "Sautè di grano"
                Uh, credo di capire.
                Il rispetto è una bella cosa coi genitori.
                Il trattarsi reciprocamente da adulti, giusto?
                Una forma di affetto.
               
            + [Delle striscioline di seitan malinconico.]
                ~ kitchen_recipeNoun = "Grigliata di seitan"
                Credo mi dispiaccia, vero?
                Insomma.
                Qualcosa che manca, che non è come dovrebbe essere.
                O che non è più.
                Mi spiace, {player_name}, davvero.
                
            + [Dei fagioli del conflitto.]
               ~ kitchen_recipeNoun = "Fagiolata"
               Non so se ti possa consolare, ma è una cosa comune.
               Molte delle mie amiche hanno un rapporto conflittuale coi genitori.
               Talco pensa sia un passaggio necessario per diventare adulti.
               Per questo mi chiamava "Cocca di papà".
        
            + [Delle cimette di broccolo della fiducia.]
                ~ kitchen_recipeNoun = "Cimetta di broccolo"
                Sento anche io questa cosa.
                Questa fiducia reciproca.
                Credo sia l'esito la cosa più bella da creare coi propri genitori.
                Un segno totale d'amore.
    
            + [Degli spicchi di aglio del distacco.]
                ~ kitchen_recipeNoun = "Crema d'aglio"
                Merda.
                Mi spiace {player_name}.
                Non so se ha senso, ma la distanza mi sembra peggio del litigio, del conflitto.
                Perché dal conflitto può nascere un cambiamento.
                Ed è comunque un rapporto.
                Insomma.
                Mi spiace, davvero.
            -  
        
        Dove ho messo il sale?
        Eccolo.
        Però anche se da piccola non avevo amicizie con persone della mia età, l'arrivo al nord ha cambiato tutto.
        È stato come poter ricominciare da capo.
        Nel giro di pochi mesi avevo il mio giro del Conservatorio.
        I primi mesi sono stati magnifici.
        Poi, dopo un anno ho scoperto una cosa: nei gruppi si litiga.
        E a una certa Luana, una ragazza del gruppo, si è allontanata.
        Quel tipo di rapporto per cui ci si saluta etc, ma non si parla più.
        Io.
        Boh.
        Credo sentissi il bisogno di chiarire, ma non sapevo come fare.
        Mi sembrava che farlo avrebbe significato tradire il gruppo, che invece si era più ancorato all'idea di lasciare cadere le cose.
        Anche se Luana si è comportata da stronza.
        Ha senso?
        
            + [Scelta blu]
                -> color_variation_management(FirstCharacter, blueC)->
               
            + [Scelta gialla]
                -> color_variation_management(FirstCharacter, yellowC)->
             
            + [Scelta rossa]
                -> color_variation_management(FirstCharacter, redC)->
        
            + [Scelta verde]
                -> color_variation_management(FirstCharacter, greenC)->
    
            + [Scelta viola]
                -> color_variation_management(FirstCharacter, purpleC)->
            -
        
        Buono comunque questo vino rosso.
        E tu cosa ti aspetti da un'amicizia, {player_name}?
        {player_name} aggiunge alla ricetta... #speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        
            + [Del pepe dell'onestà.]
                ~ kitchen_recipeAdjective = "onesta"
                Come Talco.
                Quel tipo di persona che se fai una cagata, te la dice.
               
            + [Della curcuma divertente.]
                ~ kitchen_recipeAdjective = "allegra"
                L'amicizia da balotta quindi.
                Da cazzeggio assieme.
                Da oasi nel casino del mondo.
             
            + [Del cumino empatico.]
               ~ kitchen_recipeAdjective = "empatica"
               Quel tipo di rapporto che ti fa sentire ascoltata.
               Capita.
               Dove puoi essere te stessa.
               Spero di essere quel tipo di amica, sai?
        
            + [Della cannella incondizionata.]
                ~ kitchen_recipeAdjective = "incondizionata"
                Posso capire, ma non mi piace tantissimo come idea.
                Mi piace che le amicizie ci siano anche nel conflitto.
                Non mi preoccupa che le amicizie finiscano.
                Mi preoccupa il come.
                Tipo se finisce la stima.
                Terribile.
    
            + [Dello zenzero leale.]
                ~ kitchen_recipeAdjective = "leale"
                Essere leali significa essere affidabili, vero?
                Quel tipo di persona che non va in giro a dire i tuoi segreti.
                E che cerca sempre di darti il consiglio giusto, non quello che le torna comodo.
            -      
        
        Aspè, aggiungo ancora del brodino.
        Ecco.
        Si stava addensando troppo.
        Ma il profumo è magnifico.
        Comunque, unpopular opinion che non è poi molto unpopular: non è che c'è tutta 'sta differenza tra amore romantico e amicizia.
        Credo che una parte di me veda il tizio che chiami "amore" solo come un amico con cui è anche bello scopare.
        E di certo non me la sento di dire che una persona viene prima dell'altra solo per questo tipo di cose.
        Tipo che Talco ed Ennio per me sono i miei due grandi amori.
        E forse mi contraddico con altre cose che ho detto ma è un casino perché quando parli devi parlare con il linguaggio di chi hai davanti.
        E non c'è molto linguaggio per dire queste cose.
        Quando ho detto "Ti amo" a Talco una volta, ubriaca, per un poco le cose si sono fatte strane.
        Perché dietro quella parola c'è una botta infinita di aspettative.
        Però per fortuna Talco è Talco e ne abbiamo parlato e ci siamo capit3.
        Ha senso vero?
        
            + [Scelta blu]
                -> color_variation_management(FirstCharacter, blueC)->
               
            + [Scelta gialla]
                -> color_variation_management(FirstCharacter, yellowC)->
             
            + [Scelta rossa]
                -> color_variation_management(FirstCharacter, redC)->
        
            + [Scelta verde]
                -> color_variation_management(FirstCharacter, greenC)->
    
            + [Scelta viola]
                -> color_variation_management(FirstCharacter, purpleC)->
            -
        
        Carini gli insetti ma vorrei non finissero nel nostro veganissimo piatto.
        Ecco, questo coperchio ci sta perfettamente.
        Così, a caldo.
        Una persona che ti piace ti dice "Ti amo". Qual è la prima sensazione che provi?
        {player_name} aggiunge alla ricetta... #speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        
            + [Una mestolata di brodo del terrore.]
                ~ kitchen_recipeComplement = "del terrore"
                Woah, {player_name}.
                Questa è intensa.
                Anche se effettivamente l'amore può far cagare addosso.
               
            + [Una grattuggiata di noce euforica.]
                ~ kitchen_recipeComplement = "dell'euforia"
                Mi risuona tanto.
                Detta dalla persona giusta è una parola che ti fa volare, vero?
             
            + [Una spolverata di semi dell'"io? no, no è possibile!".]
               ~ kitchen_recipeComplement = "dell'impossibile"
                Coff Coff.
                La sento.
                Madonna se la sento.
                Mi è successo anche con Ennio.
                E a volte mi succede ancora.
        
            + [Una cucchiata di olio lusingato.]
                ~ kitchen_recipeComplement = "della lusinga"
                Uh, a qualcuno piace quando il suo pelo viene lisciato, vero?
                Però non rischia di essere una cosa egoista?
                Più legata a come ti senti che al sentimento che provi per quella persona?
    
            + [Una manciata di peperoncini arrapati.]
                ~ kitchen_recipeComplement = "dell'arrapamento"
                Questa non me l'aspettavo, ma ci sta.
                Sentirsi amatə è indubbiamente sexy.
                Anni fa confondevo a manetta arrapamento e amore.
                Puoi immaginare i casini che ho combinato.
            -  
        
            -> fourth_ingredient_dispatcher
            
    
    = second_theme
        Il tema scelto è il numero due.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Chitarra parla.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Possiamo fare una di queste cinque scelte.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            + [Scelta blu]
                -> color_variation_management(FirstCharacter, blueC)->
               
            + [Scelta gialla]
                -> color_variation_management(FirstCharacter, yellowC)->
             
            + [Scelta rossa]
                -> color_variation_management(FirstCharacter, redC)->
        
            + [Scelta verde]
                -> color_variation_management(FirstCharacter, greenC)->
    
            + [Scelta viola]
                -> color_variation_management(FirstCharacter, purpleC)->
            -    
        A questo punto è chitarra a chiedere a noi qualcosa sul tema a, e noi e rispondiamo con un ingrediente.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Step uno: sostantivi (es: Patate, bellezza, calcestruzzo).#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            + [Sostantivo A]
                ~ kitchen_recipeNoun = "Sostantivo A"
               
            + [Sostantivo B]
                ~ kitchen_recipeNoun = "Sostantivo B"
             
            + [Sostantivo C]
               ~ kitchen_recipeNoun = "Sostantivo C"
        
            + [Sostantivo D]
                ~ kitchen_recipeNoun = "Sostantivo D"
    
            + [Sostantivo E]
                ~ kitchen_recipeNoun = "Sostantivo E"
            -  
        Chitarra commenta.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Chitarra dice un'altra cosa sul tema che stiamo esplorando.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Noi rispondiamo una di queste cinque cose.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            + [Scelta blu]
                -> color_variation_management(FirstCharacter, blueC)->
               
            + [Scelta gialla]
                -> color_variation_management(FirstCharacter, yellowC)->
             
            + [Scelta rossa]
                -> color_variation_management(FirstCharacter, redC)->
        
            + [Scelta verde]
                -> color_variation_management(FirstCharacter, greenC)->
    
            + [Scelta viola]
                -> color_variation_management(FirstCharacter, purpleC)->
            -
        Chitarra allora ci chiede qualcosa di personale sempre sul tema, e noi rispondiamo con il secondo ingrediente.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Step due: aggettivi (es: saporito, triste, colorato).#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            + [Aggettivo A]
                ~ kitchen_recipeAdjective = "Aggettivo A"
               
            + [Aggettivo B]
                ~ kitchen_recipeAdjective = "Aggettivo B"
             
            + [Aggettivo C]
               ~ kitchen_recipeAdjective = "Aggettivo C"
        
            + [Aggettivo D]
                ~ kitchen_recipeAdjective = "Aggettivo D"
    
            + [Aggettivo E]
                ~ kitchen_recipeAdjective = "Aggettivo E"
            -      
    
        Chitarra commenta.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Chitarra condivide per la terza e ultima volta qualcosa sul tema che stiamo affrontando.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Noi diciamo per la terza volta qualcosa legato a quel tema.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            + [Scelta blu]
                -> color_variation_management(FirstCharacter, blueC)->
               
            + [Scelta gialla]
                -> color_variation_management(FirstCharacter, yellowC)->
             
            + [Scelta rossa]
                -> color_variation_management(FirstCharacter, redC)->
        
            + [Scelta verde]
                -> color_variation_management(FirstCharacter, greenC)->
    
            + [Scelta viola]
                -> color_variation_management(FirstCharacter, purpleC)->
            -
        
        Chitarra ci chiede per la terza e ultima volta qualcosa di personale sul tema, e aggiungiamo il terzo ingrediente.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Step tre: complementi (es: del campo, per rimbecco, di coriandolo)#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            + [Complemento A]
                ~ kitchen_recipeComplement = "Complemento A"
               
            + [Complemento B]
                ~ kitchen_recipeComplement = "Complemento B"
             
            + [Complemento C]
               ~ kitchen_recipeComplement = "Complemento C"
        
            + [Complemento D]
                ~ kitchen_recipeComplement = "Complemento D"
    
            + [Complemento E]
                ~ kitchen_recipeComplement = "Complemento E"
            -  

            -> fourth_ingredient_dispatcher
                
                
    
    = third_theme
        Il tema scelto è il numero tre.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Chitarra parla.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Possiamo fare una di queste cinque scelte.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            + [Scelta blu]
                -> color_variation_management(FirstCharacter, blueC)->
               
            + [Scelta gialla]
                -> color_variation_management(FirstCharacter, yellowC)->
             
            + [Scelta rossa]
                -> color_variation_management(FirstCharacter, redC)->
        
            + [Scelta verde]
                -> color_variation_management(FirstCharacter, greenC)->
    
            + [Scelta viola]
                -> color_variation_management(FirstCharacter, purpleC)->
            -    
        A questo punto è chitarra a chiedere a noi qualcosa sul tema a, e noi e rispondiamo con un ingrediente.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Step uno: sostantivi (es: Patate, bellezza, calcestruzzo).#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            + [Sostantivo A]
                ~ kitchen_recipeNoun = "Sostantivo A"
               
            + [Sostantivo B]
                ~ kitchen_recipeNoun = "Sostantivo B"
             
            + [Sostantivo C]
               ~ kitchen_recipeNoun = "Sostantivo C"
        
            + [Sostantivo D]
                ~ kitchen_recipeNoun = "Sostantivo D"
    
            + [Sostantivo E]
                ~ kitchen_recipeNoun = "Sostantivo E"
            -  
        Chitarra commenta.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Chitarra dice un'altra cosa sul tema che stiamo esplorando.
        Noi rispondiamo una di queste cinque cose.
            + [Scelta blu]
                -> color_variation_management(FirstCharacter, blueC)->
               
            + [Scelta gialla]
                -> color_variation_management(FirstCharacter, yellowC)->
             
            + [Scelta rossa]
                -> color_variation_management(FirstCharacter, redC)->
        
            + [Scelta verde]
                -> color_variation_management(FirstCharacter, greenC)->
    
            + [Scelta viola]
                -> color_variation_management(FirstCharacter, purpleC)->
            -
        Chitarra allora ci chiede qualcosa di personale sempre sul tema, e noi rispondiamo con il secondo ingrediente.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Step due: aggettivi (es: saporito, triste, colorato).
            + [Aggettivo A]
                ~ kitchen_recipeAdjective = "Aggettivo A"
               
            + [Aggettivo B]
                ~ kitchen_recipeAdjective = "Aggettivo B"
             
            + [Aggettivo C]
               ~ kitchen_recipeAdjective = "Aggettivo C"
        
            + [Aggettivo D]
                ~ kitchen_recipeAdjective = "Aggettivo D"
    
            + [Aggettivo E]
                ~ kitchen_recipeAdjective = "Aggettivo E"
            -      
    
        Chitarra commenta.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Chitarra condivide per la terza e ultima volta qualcosa sul tema che stiamo affrontando.
        Noi diciamo per la terza volta qualcosa legato a quel tema.
            + [Scelta blu]
                -> color_variation_management(FirstCharacter, blueC)->
               
            + [Scelta gialla]
                -> color_variation_management(FirstCharacter, yellowC)->
             
            + [Scelta rossa]
                -> color_variation_management(FirstCharacter, redC)->
        
            + [Scelta verde]
                -> color_variation_management(FirstCharacter, greenC)->
    
            + [Scelta viola]
                -> color_variation_management(FirstCharacter, purpleC)->
            -
        
        Chitarra ci chiede per la terza e ultima volta qualcosa di personale sul tema, e aggiungiamo il terzo ingrediente.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Step tre: complementi (es: del campo, per rimbecco, di coriandolo)
            + [Complemento A]
                ~ kitchen_recipeComplement = "Complemento A"
               
            + [Complemento B]
                ~ kitchen_recipeComplement = "Complemento B"
             
            + [Complemento C]
               ~ kitchen_recipeComplement = "Complemento C"
        
            + [Complemento D]
                ~ kitchen_recipeComplement = "Complemento D"
    
            + [Complemento E]
                ~ kitchen_recipeComplement = "Complemento E"
            -  
            -> fourth_ingredient_dispatcher
    
    
            //La chiusura è comune, sempre per ridurre il rischio di errori
            = fourth_ingredient_dispatcher
            Ma {player_name}, qui a me sembra tutto pronto, non trovi?
            
                {
                    - backpack_findedGifts == (): Dato che lo zaino di {player_name} è vuoto, non è possibile inserire un ingrediente speciale.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                        -> recipe_name_creator ->
                        -> at_table_with_first_char
                        
                    - else:
                        -> add_ingredient
                
                }
            
                = add_ingredient
                    Dato che lo zaino di {player_name} contiene degli oggetti, può inserirne uno nel piatto.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                        
                        + [Voglio aggiungere un ingrediente extra.]
                            -> extra_ingredient_management(FirstCharacter)->
                            ~ disableNestDialogue()
                            
                        + [Mi va bene così.]
                        -
                        
                    Andiamo a mangiare, ama!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                        -> recipe_name_creator ->
                        -> at_table_with_first_char



=== at_table_with_first_char
    ~ move_entity(CookingWithFirstCharOBJ, Kitchen)
    ~ move_entity(EatingWithFirstCharOBJ, Kitchen)
    ~ temp piatto = kitchen_tempRecipeName
    
    Passiamo alla scena al tavolo con Chitarra#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate

    
    
    Buono questo {piatto}!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
    
    //Commento ricetta
    Quando prima hai aggiunto {kitchen_recipeNoun} mi hai ricordato una cosa.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
    E con {kitchen_recipeAdjective} un'altra, e con {kitchen_recipeComplement} un'altra ancora.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            {
                - kitchen_firstCharExtraIngredientReaction != notReaction:
                    -> extra_ing_feedback
            }
    
    Non abbiamo aggiunto un ingrediente extra, per cui Chitarra ci dice: "Comunque, ottimo piatto!"#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        -> relationship_feedback
    
        
        
        = extra_ing_feedback
        // Qui verranno fatti commenti diversi a seconda che l'ingrediente sarà apprezzato o meno.
            {
                - kitchen_firstCharExtraIngredientReaction == goodReaction:
                    -> good_reaction
                
                - kitchen_firstCharExtraIngredientReaction == badReaction:
                    -> bad_reaction
                
                - kitchen_firstCharExtraIngredientReaction == mehReaction:
                    -> meh_reaction
                
                - else:
                    ERROR: non abbiamo un valore valido di kitchen_firstCharExtraIngredientReaction, che è uguale a {kitchen_firstCharExtraIngredientReaction}.
            }
        
        
                = good_reaction
                Abbiamo aggiunto un ingrediente extra apprezzato da Chitarra, per cui lei commenta:#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                Aggiungere {ingredientTranslator(kitchen_firstCharExtraIngredient)} è stata una scelta.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                E poi ci dà un'informazione utile per capire come gestire le conversazioni in futuro:#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                Non prendermi per terrapiattista o che, ma non sono una grande fan delle conversazioni eccessivamente razionali. Mi tarpano la creatività, il piacere.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                
                    -> relationship_feedback
                
                = bad_reaction
                Abbiamo aggiunto un ingrediente extra detestato da Chitarra, per cui lei commenta:#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                Aggiungere {ingredientTranslator(kitchen_firstCharExtraIngredient)} è stata una scelta terrificante, non farlo mai più!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                E poiché ha odiato l'ingrediente, non ci dirà niente di utile su come gestire le conversazioni future.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
               
                    -> relationship_feedback
            
                
                = meh_reaction
                Abbiamo aggiunto un ingrediente extra che Chitarra percepisce come neutro, né buono né cattivo, per cui lei commenta:#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                Aggiungere {ingredientTranslator(kitchen_firstCharExtraIngredient)} è stata una scelta.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                E poi ci dà un'informazione enigmatica per capire come gestire le conversazioni in futuro:#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                Informazione enigmatica per dire che non le piacciono le conversazioni razionali.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                
                    -> relationship_feedback
            
    
        
    = relationship_feedback
        A prescindere che sia stato aggiunto o meno il quarto ingrediente, Chitarra ci dirà anche finalmente dove sta andando la relazione con lei.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        Il feedback fa riferimento a come è andata la conversazione in cucina, e non in generale.
            -> firstAffinityCalc ->
            {
                - firstAffinityCalc == 1:
                    {
                        - firstChar_relationshipStatus == 0: Non ci stiamo pigliando.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                        - firstChar_relationshipStatus == 1: Ci piacciamo.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                    }
                    
                - firstAffinityCalc == 2:
                    {
                        - firstChar_relationshipStatus == 0: Mi stai sul culo.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                        - firstChar_relationshipStatus == 1: Non male ma potrebbe migliorare.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                        - firstChar_relationshipStatus == 2: Ci piacciamo tantissimo.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                    }    
        
            }
            
            -> ending_cooking_with_first_char
            
        
=== ending_cooking_with_first_char
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
E poi ci saluta e se ne va allo stagno.

    -> cooking_animations_off ->
    ~ move_entity(FirstCharacter, Pond)
    ~ kitchen_firstCharCookingTogetherInvite = false
    -> update_colors(FirstCharacter) ->
    -> check_kitchen_recap -> 

-> main




/* ---------------------------------

   Altri storylets legati alla cucina 

 ----------------------------------*/


=== first_char_cooking_tracker
~ move_entity(FirstCharCookingAloneOBJ, Kitchen)
//Lo lascio come knot e non come variabile perché potrebbe essermi utile (es: per attivare un suono che faccia sapere che c'è qualcunx in cucina)
    {debug: passo per first_char_cooking_tracker.}
    
    ->->


=== first_char_cooking_alone
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    {debug: passo per first_char_cooking_alone.}
        -> cooking_animations_on ->
        
    {first_char_cooking_alone:
    
        - 1:
            {Voglio preparare il piatto preferito di mio padre.|Scusami {player_name}, ma sto cucinando.}
            
        - 2:
            {Potrei sostituire l'aneto con, uh, no, non una buona idea.|Perdonami {player_name}, ma sto cercando qualcosa che non mi avveleni.}
        
        - 3:
            {Ricordati ragazza che cucinare non è una scusa per bere. Ma che gioia aver trovato del vinello. |Torna dopo {player_name}, devo, ehm, riflettere.}
            
        - 4:
            {Quante possibilità ci sono che se caccio la mano nell'alveare della serra riesco a recuperare del miele?|{player_name}, ho un'idea stupida, torna dopo.}
        
        - 5:
            {Uh, questo sughino spacca. Mamma ne sarebbe orgogliosa.|{player_name}, ho bisogno di concentrazione, a dopo.}
    
        - 6:
            {Sarà una buona idea avere tutti questi coltelli accessibili con il bimbo in giro in giro? Merda, stavo per tagliarmi. Forse sono io il problema, non lui.|{player_name}, faccio danni già da sola, torna tra un po'.}
        
        - 7:
            {Tocco finale, la crema di funghi. E ora lasciamo cuocere un po'. E ci beviamo un altro goccino.|{player_name}, resisti che ho quasi finito!}
        
        - else:
            {Direi che ci siamo. Giusto la fiammata per restringere il brodo, ed è perfetta!|{player_name}, un attimo e ti lascio i fornelli, promesso.}
        
    }
    
    
    -> main




=== food_gift_first_char
{debug: passo per food_gift_first_char.}
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
    Cucinare da sola prima è stato un momento terapeutico.
    E non lo dico solo perché mi sono sparata un bel po' di vinello.
    Per me la tavola è lo spazio più bello di una casa perché amo mangiare con le altre persone.
    E amo quando mangiano quello che cucino.
    Credo sia una cosa che ho imparato da mia mamma.
    Mamma non l'ho mai capita fino in fondo.
    Non è una che parla tantissimo.
    Però ci tiene molto alle persone, e per fartelo capire fa cose.
    Come cucinare.
    Da quando vivo al Nord è salita solo una volta.
    Lei e papà hanno dormito nella mia camera, mentre io ho dormito con Valeria.
    Le coinqui erano in imbarazzo perché ha pulito tutta casa.
    E un giorno quando siamo uscite con papà a fargli fare il giro della città, lei è rimasta in casa da sola.
    Siamo tornate, e aveva preparato praticamente un cenone della vigilia.
    E ha tenuto conto del fatto che Valeria è vegana, e che a Irene non piacciono le cose rosse e tutta una serie di cose che ha capito in quei pochi giorni con loro.
    Credo che mamma sappia dire "Ti voglio bene" solo dietro ai fornelli.
    Non ti chiedo un'opinione, scusa, voglio tenermi ancorata ancora un po' a questa sensazione.
    Ma a proposito di cenone della vigilia.
    Da quando vivo su, ho iniziato a organizzare cenoni con le ame.
    Credo sia uno dei momenti più belli dell'anno.
    Qui non c'è abbastanza roba per farlo, ma ho pensato di portare un po' di Natale comunque.
    E quindi ti ho lasciato qualcosina su uno degli alberi della cucina.
    Spero possa portarti un po' di gioia, {player_name}.
    A dopo.

        ~ firstChar_pauseTalking = firstChar_pauseDuration
        ~ firstChar_justTalked = true

-> main