/* ---------------------------------

   Cucina con Chitarra

 ----------------------------------*/
=== pre_start_cooking_with_third_char
    ~ temp charNameOne = translator(thirdChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
Quindi {player_name}, iniziamo a cucinare assieme?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:boccale_neutral
        
        + Sono pront{player_pronouns has him:o|{player_pronouns has her:a|ə}}!
            -> cooking_with_third_char
        
        + Vorrei pensarci un attimo {charNameOne}.
            Prenditela con calma {player_name}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:boccale_neutral
            Intanto cerco qualcosa da sgranocchiare.
                -> main
 

=== cooking_with_third_char
    ~ temp charNameOne = translator(thirdChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
    
    Sai {charNameOne}, mentre cuciniamo potremmo parlare un po'.#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral
    
    - (top)
    In particolare, ripensando alle nostre conversazioni, mi farebbe piacere parlare di più...#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral
        
        + Dei rapporti che hai con le persone che ti sono care.
                -> storage_glyphs(ThirdCharacter)->
                -> cooking_animations_on ->
                -> third_theme
                
        TODO: risolvere questa parte
        + .{third_char_main_storylets.six: Del bisogno di fare qualcosa che salvi il mondo.|<i>{player_name} deve parlare ancora con {charNameOne} per sbloccare questo tema.</i>}
            {
                - third_char_main_storylets.six:
                    -> storage_glyphs(ThirdCharacter)->
                    -> cooking_animations_on ->
                    -> second_theme
                
                - else:
                    -> top
            }
        
        + .{third_char_main_storylets.nine: Della tua creatività.|<i>{player_name} deve parlare ancora con {charNameOne} per sbloccare questo tema.</i>}
            {
            
                - third_char_main_storylets.nine:
                    -> storage_glyphs(ThirdCharacter)->
                    -> cooking_animations_on ->
                    -> third_theme
                
                - else:
                    -> top
            }
            
        + Sai, forse preferirei cucinare più tardi.
            Nessun problema, prenditi i tuoi tempi {player_name}.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                ~ kitchen_thirdCharCookingTogetherInvite = false
                ~ kitchen_thirdCharCookingTogetherWaiting = 0
                ~ move_entity(ThirdCharacter, Pond)
            -> main


    
    = first_theme
    ~ temp charNameOne = translator(thirdChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

       
        Credi abbia senso?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:boccale_neutral
        
            + Realisticamente, le relazioni sono compromesso e imprevedibilità.
                -> glyph_modifier_variation_management(ThirdCharacter, airC, decreaseYes)->
                Che è la roba che mi sento dire da che sono piccola.

               
            + Tuo padre è super! Voglio anche io cose che fanno rumore!
                -> glyph_modifier_variation_management(ThirdCharacter, earthC, decreaseYes)->
                Se ci fossimo incontrat3 da piccol3 avremmo fatto casino assieme.

            + Le relazioni sono passione e uno scopo condiviso.
                -> glyph_modifier_variation_management(ThirdCharacter, fireC, decreaseYes)->
                Quando ero più piccola vivevo i rapporti con molta più passione.

            + Credo molto nell'idea di cura, supporto, sostegno reciproco.
                -> glyph_modifier_variation_management(ThirdCharacter, waterC, decreaseYes)->
                Mi suona molto, ama.
    
            + Una relazione è una foresta, una rete di infinite vite diverse.
                -> glyph_modifier_variation_management(ThirdCharacter, aetherC, decreaseYes)->
                Messa così è più tipo una rete di relazioni, che non una relazione?
            -    
        No no taglio io, non ti preoccupare, continua a mischiare.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:boccale_neutral
            
            -> kitchen_moon_feedback -> 
        

            + <i>Soffriggo dei cubetti di grano del rispetto.
                ~ kitchen_recipeNoun = "Zuppa di grano"
                -> glyph_modifier_variation_management(PG, earthC, decreaseYes)->
                Uh, credo di capire.

            + <i>Impano delle striscioline di seitan malinconico.
                ~ kitchen_recipeNoun = "Grigliata di seitan"
                -> glyph_modifier_variation_management(PG, waterC, decreaseYes)->
                Credo mi dispiaccia, vero?
                
            + <i>Sgrano dei fagioli del conflitto.
               ~ kitchen_recipeNoun = "Fagiolata"
               -> glyph_modifier_variation_management(PG, fireC, decreaseYes)->
               Non so se ti possa consolare, ma è una cosa comune.
        
            + <i>Sbollento delle cimette di broccolo della fiducia.
                ~ kitchen_recipeNoun = "Cimetta di broccolo"
                -> glyph_modifier_variation_management(PG, aetherC, decreaseYes)->
                Sento anche io questa cosa.
    
            + <i>Schiaccio degli spicchi di aglio del distacco.
                ~ kitchen_recipeNoun = "Crema d'aglio"
                -> glyph_modifier_variation_management(PG, earthC, decreaseYes)->
                Merda.
            -  
        
        Dove ho messo il sale?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:boccale_neutral
    
            + Un'amicizia non è una onlus, e se si sta male ci si divide.
                -> glyph_modifier_variation_management(ThirdCharacter, fireC, decreaseYes)->
                Una amicizia è anche una onlus.
            
            + Avevate concordato delle regole per queste situazioni?
                -> glyph_modifier_variation_management(ThirdCharacter, airC, decreaseYes)->
                Certo.
        
            + Sì: il cuore ha ferite che non si chiuderanno senza un chiarimento.
                -> glyph_modifier_variation_management(ThirdCharacter, waterC, decreaseYes)->
                Penso tanto a Luana.
       
            + Perché parlandole avresti tradito il gruppo? Mi son pers{player_pronouns has him:o|{player_pronouns has her:a|ə}} il nuovo "regole dell'amicizia"?
                -> glyph_modifier_variation_management(ThirdCharacter, earthC, decreaseYes)->
                Ma è ovvio che.
             
            + Cosa succederebbe se litigassero con te?
                -> glyph_modifier_variation_management(ThirdCharacter, aetherC, decreaseYes)->
                In realtà è quello che è successo.
            -
        
        Buono comunque questo vino rosso.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:boccale_neutral
        
            + <i>Tosto del pepe dell'onestà.
                ~ kitchen_recipeAdjective = "onesta"
                -> glyph_modifier_variation_management(PG, earthC, decreaseYes)->
                Come Talco.
               
            + <i>Spargo della curcuma divertente.
                ~ kitchen_recipeAdjective = "allegra"
                -> glyph_modifier_variation_management(PG, airC, decreaseYes)->
                L'amicizia da balotta quindi.
             
            + <i>Aggiungo del cumino empatico.
               ~ kitchen_recipeAdjective = "empatica"
               -> glyph_modifier_variation_management(PG, waterC, decreaseYes)->
               Quel tipo di rapporto che ti fa sentire ascoltata.
        
            + <i>Grattugio della cannella incondizionata.
                ~ kitchen_recipeAdjective = "incondizionata"
                -> glyph_modifier_variation_management(PG, aetherC, decreaseYes)->
                Posso capire, ma non mi piace tantissimo come idea.
    
            + <i>Sminuzzo dello zenzero leale.
                ~ kitchen_recipeAdjective = "leale"
                -> glyph_modifier_variation_management(PG, fireC, decreaseYes)->
                Essere leali significa essere affidabili, vero?
            -      
        
        Aspè, aggiungo ancora del brodino.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:boccale_neutral

            + L'avresti detto se non fossi stata ubriaca?
                -> glyph_modifier_variation_management(ThirdCharacter, aetherC, decreaseYes)->
                Credo di sì.
            
            + Conta quello che si fa, le parole fanno solo casino.
                -> glyph_modifier_variation_management(ThirdCharacter, fireC, decreaseYes)->
                Mmm.
            
            + {charNameOne}, basta con "ha senso". Ha senso per voi, no?
                -> glyph_modifier_variation_management(ThirdCharacter, earthC, decreaseYes)->
                Sì.
             
            + Una lingua esprime ciò che la sua cultura ritiene importante.
                -> glyph_modifier_variation_management(ThirdCharacter, airC, decreaseYes)->
                Ma una lingua è una roba viva.
                   
            + I sentimenti non si esauriscono se condivisi con più persone.
                -> glyph_modifier_variation_management(ThirdCharacter, waterC, decreaseYes)->
                Questo.
            -
        {
            - contentsKitchen has Bat:
                Questo pipistrello mi sta spaventando.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                Ma c'è da dire che da quando c'è lui in giro ci sono meno zanzare in giro!#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate

            - else:
                Carini gli insetti ma vorrei non finissero nel nostro veganissimo piatto.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:boccale_neutral
        }
        Ecco, questo coperchio ci sta perfettamente.
        
            + <i>Verso una mestolata di brodo del terrore.
                ~ kitchen_recipeComplement = "con brodo del terrore"
                -> glyph_modifier_variation_management(PG, waterC, decreaseYes)->
                Woah, {player_name}.
               
            + <i>Manteco della noce euforica.
                ~ kitchen_recipeComplement = "con noce euforica"
                -> glyph_modifier_variation_management(PG, earthC, decreaseYes)->
                Mi risuona tanto.
             
            + <i>Condisco con semi dell'"io? no, no è possibile!".
               ~ kitchen_recipeComplement = "con semi dell'<i>io? no, no è possibile!</i>"
               -> glyph_modifier_variation_management(PG, airC, decreaseYes)->
                Coff Coff.
        
            + <i>Incorporo una cucchiata di olio delle lusinghe.
                ~ kitchen_recipeComplement = "con olio delle lusinghe"
                -> glyph_modifier_variation_management(PG, aetherC, decreaseYes)->
                Uh, a qualcuno piace quando il suo pelo viene lisciato, vero?
    
            + <i>Sminuzzo una manciata di peperoncini arrapati.
                ~ kitchen_recipeComplement = "con peperoncini arrapati"
                -> glyph_modifier_variation_management(PG, fireC, decreaseYes)->
                Questa non me l'aspettavo, ma ci sta.
            -
            -> fourth_ingredient_dispatcher
            
    
    = second_theme
        ~ temp charNameOne = translator(thirdChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour= translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)

        
        Ha senso?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:boccale_neutral
        
            + Non è che prima di battere un mostro lo studi, no?
                -> glyph_modifier_variation_management(ThirdCharacter, earthC, decreaseYes)->
                Ehm.
             
            + È l'unico senso, altrimenti perché siamo viv3?
                -> glyph_modifier_variation_management(ThirdCharacter, fireC, decreaseYes)->
                Sì, credo?

            + Le parole grandi hanno anche grandi poteri.
                -> glyph_modifier_variation_management(ThirdCharacter, aetherC, decreaseYes)->
                Forse tutte le prole hanno grandi poteri, non ce ne sono di grandi e piccole.
        
            + Quindi ti senti inadeguata?
                -> glyph_modifier_variation_management(ThirdCharacter, waterC, decreaseYes)->
                Bingo.
            
            + Razionalmente ha senso cambiare solo ciò che si capisce.
                -> glyph_modifier_variation_management(ThirdCharacter, airC, decreaseYes)->
                E quando decidi che cosa hai capito e cosa no?
            -        
        
        Aspetta, ho visto delle forbici prima.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:boccale_neutral
        
            -> kitchen_moon_feedback -> 
            
            + <i>Infarino confusamente delle tagliatelle.
                ~ kitchen_recipeNoun = "Tagliatelle"
                -> glyph_modifier_variation_management(PG, airC, decreaseYes)->
                Già.
               
            + <i>Stendo con decisione delle lasagne.
                ~ kitchen_recipeNoun = "Lasagne"
                -> glyph_modifier_variation_management(PG, fireC, decreaseYes)->
                Uh.
            + <i>Affetto con disinteresse delle bruschette.
               ~ kitchen_recipeNoun = "Bruschette"
               -> glyph_modifier_variation_management(PG, earthC, decreaseYes)->
               Quindi sei più del tipo "Vediamo dove andiamo?
        
            + <i>Impasto furiosamente delle arancine.
                ~ kitchen_recipeNoun = "Arancine"
                -> glyph_modifier_variation_management(PG, fireC, decreaseYes)->
               Immagino che la furia sia un modo per guardare a ciò che non va ora.
               
            + <i>Scaldo disperatamente delle tortillas.
                ~ kitchen_recipeNoun = "Tortillas"
                -> glyph_modifier_variation_management(PG, aetherC, decreaseYes)->
                È un sentimento.
            -  
       
        Mi sa che mi metto ad affettare qualcosa intanto.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:boccale_neutral
        
            + Serve del metodo. Se la base non è solida, crolla tutta la casa.
                -> glyph_modifier_variation_management(ThirdCharacter, airC, decreaseYes)->
                Ma se poi quella base non la costruisce nessunə, perché si perde lo slancio, il coraggio?
            
            + Dobbiamo farci meno paranoie e agire di più.
                -> glyph_modifier_variation_management(ThirdCharacter, fireC, decreaseYes)->
                Non so.
               
            + Non ho capito molto, ma di sicuro non mi piacciono l3 poliziott3.
                -> glyph_modifier_variation_management(ThirdCharacter, earthC, decreaseYes)->
                Siamo in due.

            + Il perdono è un atto di coraggio, ci rende vulnerabili.
                -> glyph_modifier_variation_management(ThirdCharacter, waterC, decreaseYes)->
                E la soluzione per me è nella vulnerabilità.
    
            + Quello che conta è cosa fai quando ti viene detto che hai sbagliato.
                -> glyph_modifier_variation_management(ThirdCharacter, aetherC, decreaseYes)->
                Mi suona molto.
            -
        
        <i>Più gorgonzola, meno poliziott3.</i>#speaker:{firstChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:boccale_neutral

            + <i>Aggiungo con convinzione delle prugne.
                ~ kitchen_recipeAdjective = "convinte"
                -> glyph_modifier_variation_management(PG, earthC, decreaseYes)->
               
            + <i>Spolvero con titubanza del mais.
                ~ kitchen_recipeAdjective = "titubanti"
                -> glyph_modifier_variation_management(PG, waterC, decreaseYes)->
             
            + <i>Affetto con autocontrollo delle zucchine.
               ~ kitchen_recipeAdjective = "disciplinate"
               -> glyph_modifier_variation_management(PG, fireC, decreaseYes)->
        
            + <i>Spremo tempestosamente del chinotto.
                ~ kitchen_recipeAdjective = "tempestose"
                -> glyph_modifier_variation_management(PG, airC, decreaseYes)->
    
            + <i>Sminuzzo con consapevolezza della cipolla.
                ~ kitchen_recipeAdjective = "consapevoli"
                -> glyph_modifier_variation_management(PG, aetherC, decreaseYes)->
            -     
        
        Madonna, che profumino che sta salendo.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:boccale_neutral
            + Il cuore è caldo quando aiutiamo le altre persone, vero?
                -> glyph_modifier_variation_management(ThirdCharacter, waterC, decreaseYes)->
                C'è quel momento.

            + Quando tutto è dovere il piacere è rivoluzionario. Saggi{player_pronouns has him:o|{player_pronouns has her:a|ə}}, vero?
                -> glyph_modifier_variation_management(ThirdCharacter, earthC, decreaseYes)->
                Inaspettatamente saggia.
             
            + La stanchezza migliore è quella di quando hai portato un cambiamento.
                -> glyph_modifier_variation_management(ThirdCharacter, fireC, decreaseYes)->
                Sì.

            + Senza distacco finisci per perdere l'obiettivo.
                -> glyph_modifier_variation_management(ThirdCharacter, airC, decreaseYes)->
                E magari faccio le cose perché mi piacciono, non perché sono utili.

            + Non rischi di mettere il tuo piacere davanti ai bisogni di chi vuoi aiutare?
                -> glyph_modifier_variation_management(ThirdCharacter, aetherC, decreaseYes)->
                Io.
            -
        
        Ancora due minuti e ci siamo ama.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:boccale_neutral

            + <i>Trituro con gioia dell'anice stellato.
                ~ kitchen_recipeComplement = "con anice stellato"
                -> glyph_modifier_variation_management(PG, airC, decreaseYes)->
                    Gioiaaaaa!

            + <i>Aggiungo {player_pronouns has him:pieno|{player_pronouns has her:piena|pienə}} di terrore esistenziale dell'origano.
                ~ kitchen_recipeComplement = "con origano"
                -> glyph_modifier_variation_management(PG, waterC, decreaseYes)->
                    La cosa più millennial che potessi dire, ama.

            + <i>Sbuccio titubante della vaniglia.
               ~ kitchen_recipeComplement = "con vaniglia"
               -> glyph_modifier_variation_management(PG, earthC, decreaseYes)->
                    Già.
        
            + <i>Tosto {player_pronouns has him:rassegnato|{player_pronouns has her:rassegnata|rassegnatə}} del coriandolo.
                ~ kitchen_recipeComplement = "con coriandolo"
                -> glyph_modifier_variation_management(PG, aetherC, decreaseYes)->
                    No no, niente rassegnazione {player_name}!
    
            + <i>Caramello {player_pronouns has him:sopraffatto|{player_pronouns has her:sopraffatta|sopraffattə}} della salvia.
                ~ kitchen_recipeComplement = "con salvia"
                -> glyph_modifier_variation_management(PG, fireC, decreaseYes)->
                    Sentimento comune.

            - (bookUpdate)  

        Che poi è una domanda stupida da farti, vero?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:boccale_neutral

            -> fourth_ingredient_dispatcher
                
                
    
    = third_theme
    ~ temp charNameOne = translator(thirdChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

        Cavolo.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:boccale_neutral

            + Ogni cosa che immagini crea nuove versioni di te.
                    -> glyph_modifier_variation_management(ThirdCharacter, aetherC, decreaseYes)->
                Anche se l'idea di un universo pieno di me è terrificante, la frase mi suona molto.
               
            + Creare è come viaggiare, è vedere cose inesistenti, è spet-ta-co-la-re!
                    -> glyph_modifier_variation_management(ThirdCharacter, earthC, decreaseYes)->
                Talco diceva sempre una cosa del genere.

            + Quindi riesci a trovare parti di te che altrimenti non vedresti?
                    -> glyph_modifier_variation_management(ThirdCharacter, waterC, decreaseYes)->
                Esatto.

            + Dipende da cosa ci fai poi, con quel benessere.
                -> glyph_modifier_variation_management(ThirdCharacter, fireC, decreaseYes)->
                Un pisolino, vale?

            + Immaginare plasma il cervello, per cui sì, è empiricamente sensato.
                -> glyph_modifier_variation_management(ThirdCharacter, airC, decreaseYes)->
                Ora facciamo un gioco, {player_name}.

            -    
        Ciotole pulite!

             -> kitchen_moon_feedback -> 

            + <i>Lesso sportivamente delle patate.
                ~ kitchen_recipeNoun = "Patate"
                -> glyph_modifier_variation_management(PG, earthC, decreaseYes)->
                Ti ci vedo a correre e scaricare il nervo.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:boccale_neutral

            + <i>Friggo con creatività delle mele.
                ~ kitchen_recipeNoun = "Mele"
                -> glyph_modifier_variation_management(PG, earthC, decreaseYes)->
                Lo sapevo!

            + <i>Arrostisco scientemente delle melanzane.
               ~ kitchen_recipeNoun = "Melanzane"
               -> glyph_modifier_variation_management(PG, airC, decreaseYes)->
                Ennio fa qualcosa di simile.
            
        
            + <i>Griglio amichevolmente delle pesche.
                ~ kitchen_recipeNoun = "Pesche"
                -> glyph_modifier_variation_management(PG, waterC, decreaseYes)->
                Stare assieme è una cosa che cura molte ferite.

            + <i>Abbrustolisco meditativamente delle bietole.
                ~ kitchen_recipeNoun = "Bietole"
                -> glyph_modifier_variation_management(PG, aetherC, decreaseYes)->
                Ci ho provato mille volte.
            -  
        
        Abbasso la fiamma un attimo.

            + Il carattere è solo una funzione del tuo cervello.
                    -> glyph_modifier_variation_management(ThirdCharacter, airC, decreaseYes)->
                Questa è una bellissima notizia!
               
            + Sei le relazioni che hai, e per questo non potrai mai perderti.
                    -> glyph_modifier_variation_management(ThirdCharacter, waterC, decreaseYes)->
                A volte mi rendo conto di usare frasi o modi di fare di chi voglio bene.

            + Sono sicur{player_pronouns has him:o|{player_pronouns has her:a|ə}} che ti farai sempre tan-tis-si-me domande serie.
                    -> glyph_modifier_variation_management(ThirdCharacter, earthC, decreaseYes)->
                Ehm.

            + Perdersi non è così male, potresti ritrovarti in modi inaspettati.
                    -> glyph_modifier_variation_management(ThirdCharacter, aetherC, decreaseYes)->
                Da piccola mi sono persa nel bosco.

            + Sono i tuoi obiettivi a dirti chi sei, {charNameOne}!
                    -> glyph_modifier_variation_management(ThirdCharacter, fireC, decreaseYes)->
                La maggior parte delle volte il mio obiettivo è "non dover campare a crackers ogni fine mese".
            -
        Che botta questo vino comunque.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:boccale_neutral

            + <i>Frullo della zucca camminando in avanti.
                ~ kitchen_recipeAdjective = "avanzanti"
                -> glyph_modifier_variation_management(PG, fireC, decreaseYes)->
               C'è anche qualcosa di bello nel sapere che si sta compiendo la propria strada, vero?

            + <i>Pesto dell'ortica con statica soddisfazione.
                ~ kitchen_recipeAdjective = "soddisfatte"
                -> glyph_modifier_variation_management(PG, earthC, decreaseYes)->
                Vorrei sapere cosa si prova ad esser al proprio posto.
             
            + <i>Schiaccio dei rapanelli girando in tondo.
               ~ kitchen_recipeAdjective = "bloccate"
               -> glyph_modifier_variation_management(PG, airC, decreaseYes)->
                Già.
        
            + <i>Pulisco dei finferli arretrando.
                ~ kitchen_recipeAdjective = "arretranti"
                -> glyph_modifier_variation_management(PG, waterC, decreaseYes)->
                Uh.
    
            + <i>Sciacquo confusamente della lattuga.
                ~ kitchen_recipeAdjective = "confuse"
                -> glyph_modifier_variation_management(PG, aetherC, decreaseYes)->
                A volte è solo questione di tempo, vero?
            -      
    
        Il sapore è ottimo, aggiusto appena appena di sale.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:boccale_neutral

            + Tua: chi l'ha fatta la fatica, il lavoro?
                -> glyph_modifier_variation_management(ThirdCharacter, fireC, decreaseYes)->
                E la fatica attorno a me?

            + Realisticamente? Tua. È tuo il punto di vista dell'opera.
                -> glyph_modifier_variation_management(ThirdCharacter, airC, decreaseYes)->
                Avrei di che ridire anche su questo.

            + Di chi la ascolta, la legge, la guarda, creando un rapporto con te.
                -> glyph_modifier_variation_management(ThirdCharacter, waterC, decreaseYes)->
                Mmm.

            + Dell'acqua, e delle sue infinite storie.
                -> glyph_modifier_variation_management(ThirdCharacter, aetherC, decreaseYes)->
                È una bella visione.
            
            + Quando giochi ti godi la compagnia, non ti chiedi di chi è chi.
                -> glyph_modifier_variation_management(ThirdCharacter, earthC, decreaseYes)->
                Good point.
            -
        
        Merda, credo di aver raggiunto dei livelli di pesantezza da record.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:boccale_neutral

            + <i>Brucio del peperoncino.
                ~ kitchen_recipeComplement = "con peperoncino"
                -> glyph_modifier_variation_management(PG, aetherC, decreaseYes)->
                Merda.

            + <i>Spargo ovunque del cardamomo.
                ~ kitchen_recipeComplement = "con cardamomo"
                -> glyph_modifier_variation_management(PG, fireC, decreaseYes)->
                Un gesto sicuro, deciso.
             
            + <i>Raggruppo dei chiodi di garofano.
               ~ kitchen_recipeComplement = "con chiodi di garofano"
               -> glyph_modifier_variation_management(PG, earthC, decreaseYes)->
                Anche a me piace condividere solo con la cerchia ristretta di am3.

        
            + <i>Copro dello zenzero.
                ~ kitchen_recipeComplement = "con zenzero"
                -> glyph_modifier_variation_management(PG, fireC, decreaseYes)->
                Tieni le tue creature per te.
    
            + <i>Non faccio nulla.
                ~ kitchen_recipeComplement = "con essenza del nulla"
                -> glyph_modifier_variation_management(PG, airC, decreaseYes)->
                Perdonami, do sempre per scontato che le persone creino qualcosa.
            - (bookUpdate)  
            -> fourth_ingredient_dispatcher
    
    
    //La chiusura è comune, sempre per ridurre il rischio di errori
    = fourth_ingredient_dispatcher
    Ma {player_name}, qui a me sembra tutto pronto, non trovi?
    
        {
            - backpack_findedGifts == (): 
                <i>Lo zaino di {player_name} giace vuoto sulle sue spalle. {player_name} non può aggiungere alla ricetta un ingrediente speciale.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                    -> recipe_name_creator ->
                    -> recipe_name_storage(ThirdCharacter) ->
                    -> at_table_with_third_char
                
            - else:
                -> add_ingredient
        
        }
    
        = add_ingredient
        ~ temp charNameOne = translator(thirdChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour= translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
        
            <i>Il giusto ingrediente renderà la ricetta di {player_name} e {charNameOne} musicale.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            <i>E {player_name} potrebbe capire un po' meglio {charNameOne}.
       
                + <i>Aggiunto un ingrediente speciale.
                    -> extra_ingredient_management(ThirdCharacter)->
                    ~ disableNestDialogue()
                    
                + <i>Non aggiungo altro.
                -
                
            Andiamo a mangiare, ama!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:boccale_neutral
                -> recipe_name_creator ->
                -> recipe_name_storage(ThirdCharacter) ->
                -> at_table_with_third_char



=== at_table_with_third_char
    ~ move_entity(CookingWithThirdCharOBJ, Kitchen)
    ~ move_entity(EatingWithThirdCharOBJ, Kitchen)
    ~ temp piatto = kitchen_tempRecipeName
    
    È stato divertente cucinare assieme, {player_name}.

        {
            -cooking_with_third_char.third_theme:
                E non mi facevo certe domande da molto.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:boccale_neutral

            -cooking_with_third_char.second_theme:
                E non avevo mai pensato fino in fondo al discorso del salvare il mondo etc etc.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:boccale_neutral
            
            -cooking_with_third_char.third_theme:
                E discutere di creatività.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:boccale_neutral

        }
    E poi questo {piatto}!
    Spacca, non trovi?
    
        {
            - kitchen_thirdCharExtraIngredientReaction != notReaction:
                -> extra_ing_feedback
            
            - else:
                E ho la pancia strapiena ora.
                -> relationship_feedback
                
        }
        
        
    
        
        
        = extra_ing_feedback
        
        // Qui verranno fatti commenti diversi a seconda che l'ingrediente sarà apprezzato o meno.
            {
                - kitchen_thirdCharExtraIngredientReaction == goodReaction:
                    -> good_reaction
                
                - kitchen_thirdCharExtraIngredientReaction == badReaction:
                    -> bad_reaction
                
                - kitchen_thirdCharExtraIngredientReaction == mehReaction:
                    -> meh_reaction
                
                - else:
                    ERROR: non abbiamo un valore valido di kitchen_thirdCharExtraIngredientReaction, che è uguale a {kitchen_thirdCharExtraIngredientReaction}.
            }

        
                = good_reaction
                ~ temp charNameOne = translator(thirdChar_ActualName)
                ~ temp charNameTwo = translator(secondChar_ActualName)
                ~ temp charNameThree = translator(thirdChar_ActualName)
                ~ temp charNameFour= translator(fourthChar_ActualName)
                ~ temp mentorName = translator(mentor_ActualName)
                        
                        -> kitchen_moon_feedback -> 

                    Aggiungere {ingredientTranslator(kitchen_thirdCharExtraIngredient)} è stato un tocco geniale.
                        @animation:RewriterBook

                        -> relationship_feedback
                
                = bad_reaction
                ~ temp charNameOne = translator(thirdChar_ActualName)
                ~ temp charNameTwo = translator(secondChar_ActualName)
                ~ temp charNameThree = translator(thirdChar_ActualName)
                ~ temp charNameFour= translator(fourthChar_ActualName)
                ~ temp mentorName = translator(mentor_ActualName)  

                        -> kitchen_moon_feedback -> 

                    Aggiungere {ingredientTranslator(kitchen_thirdCharExtraIngredient)} è stata una scelta.
        
                        -> relationship_feedback
            
                
                = meh_reaction
                ~ temp charNameOne = translator(thirdChar_ActualName)
                ~ temp charNameTwo = translator(secondChar_ActualName)
                ~ temp charNameThree = translator(thirdChar_ActualName)
                ~ temp charNameFour= translator(fourthChar_ActualName)
                ~ temp mentorName = translator(mentor_ActualName)
                        
                        -> kitchen_moon_feedback -> 

                    L'aggiunta di {ingredientTranslator(kitchen_thirdCharExtraIngredient)} mi ha confusa.
                        @animation:RewriterBook
                        
                        -> relationship_feedback
            
    
        
    = relationship_feedback
        Comunque {player_name}, stavo pensando alla nostra conversazione qui, assieme.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental
        E se basandomi solo su questa chiacchierata in cucina dovessi dire: ho appena conosciuto {player_name}, vorrei farci amicizia?
        
            -> thirdAffinityCalc ->
            {
                - thirdAffinityCalc == 1:
                    {
                        - thirdChar_relationshipStatus == 0:
                            Credo che la risposta sia no.
                    
                        - thirdChar_relationshipStatus == 1:
                            La risposta è sicuramente "sì".
                    }
                    
                - thirdAffinityCalc == 2:
                    {
                        - thirdChar_relationshipStatus == 0:
                            Credo che la risposta sia no.
                            
                        - thirdChar_relationshipStatus == 1:
                            Credo che la risposta sia "{player_pronouns has him:rimandato|{player_pronouns has her:rimandata|rimandatə}} a settembre".
                        
                        - thirdChar_relationshipStatus == 2:
                             La risposta è sicuramente "sì".
                    }    
        
            }
            
            -> ending_cooking_with_third_char
            
        
=== ending_cooking_with_third_char
    ~ temp charNameOne = translator(thirdChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
    E ora {player_name}, credo mi farò due passi.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental
    Mi sento piena e soddisfatta.
    Grazie ancora per questo tempo assieme.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental
    - (bookUpdate)

            -> cooking_animations_off ->
                ~ move_entity(ThirdCharacter, Pond)
                ~ kitchen_thirdCharCookingTogetherInvite = false
            -> update_glyphs(ThirdCharacter) ->
            -> check_kitchen_recap -> 
            -> third_char_closing_storylet ->
            -> main




/* ---------------------------------

   Altri storylets legati alla cucina 

 ----------------------------------*/


=== third_char_cooking_tracker
//Lo lascio come knot e non come variabile perché potrebbe essermi utile (es: per attivare un suono che faccia sapere che c'è qualcunə in cucina)
    {debug: passo per third_char_cooking_tracker.}
    
    ->->


=== third_char_cooking_alone
    ~ temp charNameOne = translator(thirdChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    {debug: passo per third_char_cooking_alone.}
        -> cooking_animations_on ->
        
    {kitchen_thirdCharCookingTime:

        - 0:
            {Voglio preparare il piatto preferito di mio padre.|Scusami {player_name}, ma sto cucinando.}#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental

        - 1:
            {Voglio preparare il piatto preferito di mio padre.|Scusami {player_name}, ma sto cucinando.}#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental
            
        - 2:
            {Potrei sostituire l'aneto con, uh, no, non una buona idea.|Perdonami {player_name}, ma sto cercando qualcosa che non mi avveleni.}#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental
        
        - 3:
            {Ricordati ragazza che cucinare non è una scusa per bere. Ma che gioia aver trovato del vinello. |Torna dopo {player_name}, devo, ehm, riflettere.}#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental
            
        - 4:
            {Quante possibilità ci sono che se caccio la mano nell'alveare della serra riesco a recuperare del miele?|{player_name}, ho un'idea stupida, torna dopo.}#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental
        
        - 5:
            {Uh, questo sughino spacca. Mamma ne sarebbe orgogliosa.|{player_name}, ho bisogno di concentrazione, a dopo.}#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental
    
        - 6:
            {Sarà una buona idea avere tutti questi coltelli accessibili con il bimbo in giro in giro? Merda, stavo per tagliarmi. Forse sono io il problema, non lui.|{player_name}, faccio danni già da sola, torna tra un po'.}#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental
        
        - 7:
            {Tocco finale, la crema di funghi. E ora lasciamo cuocere un po'. E ci beviamo un altro goccino.|{player_name}, resisti che ho quasi finito!}#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental
        
        - else:
            {Direi che ci siamo. Giusto la fiammata per restringere il brodo, ed è perfetta!|{player_name}, un attimo e ti lascio i fornelli, promesso.}#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental
    }
    
        ~ thirdChar_pauseTalking = thirdChar_pauseDuration
    -> main




=== food_gift_third_char
{debug: passo per food_gift_third_char.}
    ~ temp charNameOne = translator(thirdChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
    Cucinare da sola prima è stato un momento terapeutico.
    
    -> third_char_closing_storylet ->
    -> main