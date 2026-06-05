/* ---------------------------------

   Cucina con Chitarra

 ----------------------------------*/
=== pre_start_cooking_with_first_char
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)


    
{charTag(FirstCharacter, "neutral")}:                   {player_name}, iniziamo a cucinare assieme? 
        
    + \ {charTag(PG, "neutral")}:                       Sono pront{player_pronoun has him:o|{player_pronoun has her:a|ə}}!
        -> cooking_with_first_char
    
    + \ {charTag(PG, "neutral")}:                       Vorrei pensarci un attimo {charNameOne}.
        {charTag(FirstCharacter, "neutral")}:           Prenditela con calma {player_name}.
        {charTag(FirstCharacter, "curious")}:           Intanto cerco qualcosa da sgranocchiare. 
            -> main
 

=== cooking_with_first_char
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)

    
    
    {charTag(PG, "neutral")}:                                   Mi stavo chiedendo di cosa potremmo parlare mentre cuciniamo.

    - (top)
    {charTag(PG, "neutral")}:                                   In particolare, ripensando alle nostre conversazioni, mi farebbe piacere parlare di più...

    {
        - grimoire_firstChar hasnt grimFirstCharNine:
        {charTag(TheWitch, witch_state())}:                     <i>{charNameOne} ha altri argomenti importanti da condivide con {player_name}, se {player_name} deciderà di conoscere {charNameOne} meglio.</i>
    }
    
    + \ {charTag(PG, "neutral")}:                               Del rapporto che hai con le persone care.
        ~ cooking_animations_on()
        ~ storage_glyphs(FirstCharacter)
        -> kitchen_moon_feedback -> 
        -> first_theme
            
    + {grimoire_firstChar has grimFirstCharSix}\ {charTag(PG, "neutral")}:          Del bisogno di fare qualcosa che salvi il mondo.
        ~ cooking_animations_on()
        ~ storage_glyphs(FirstCharacter)
        -> kitchen_moon_feedback -> 
        -> second_theme

    + {grimoire_firstChar has grimFirstCharNine}\ {charTag(PG, "neutral")}:         Della tua creatività.
        ~ cooking_animations_on()
        ~ storage_glyphs(FirstCharacter)
        -> kitchen_moon_feedback -> 
        -> third_theme
            

        
    + \ {charTag(PG, "neutral")}:                               Anzi, preferisco cucinare più tardi.
        {charTag(FirstCharacter, "neutral")}:                   Nessun problema, prenditi i tuoi tempi {player_name}.
                                                                Io vado a farmi due passi.
            ~ kitchen_firstCharCookingTogetherInvite = false
            ~ kitchen_firstCharCookingTogetherWaiting = 0
            ~ move_entity(FirstCharacter, Pond)
            ~ move_entity(FirstCharacterCucina, Safekeeping)
        -> main


    = first_theme
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)

    {charTag(FirstCharacter, "affectionate")}:                  Quindi hai già capito che per me le relazioni sono il centro di tutto.
    {charTag(FirstCharacter, "curious")}:                       Vediamo, cosa ti posso raccontare? 
    {charTag(FirstCharacter, "sad")}:                           Da piccola ero un disastro sociale.
                                                                Timida a bestia, bullizzata perché "grassa" e secchiona.
    {charTag(FirstCharacter, "neutral")}:                       Ora sono meno timida, più in carne, e molto meno secchiona.
                                                                Aspetta che abbasso la fiamma.
    {charTag(FirstCharacter, "affectionate")}:                  Però a casa era un piccolo paradiso.
    {charTag(FirstCharacter, "neutral")}:                       I miei sono gente semplice, e hanno sempre premiato la curiosità.
    {charTag(FirstCharacter, "affectionate")}:                  Mamma quando canta ha una voce che scioglie il cuore.
    {charTag(FirstCharacter, "curious")}:                       Papà mi ha passato l'amore per la musica. 
    {charTag(FirstCharacter, "neutral")}:                       È stato lui quello che mi regalava sempre qualcosa che faceva rumore.
                                                                E appena è riuscito a risparmiare a sufficienza, mi ha fatto fare lezioni di piano.
                                                                Credo che i miei mi abbiano insegnato che le relazioni sono cura.
                                                                E sacrificio.
    {charTag(FirstCharacter, "neutral")}:                       Credi abbia senso?
    
    
        + \ {charTag(PG, "neutral")}:                           E se le relazioni fossero comunicazione e compromesso?
            -> glyph_choice_manager(false, earthC)->
        {charTag(FirstCharacter, "neutral")}:                   Che è la roba che mi sento dire da che sono piccola.
        {charTag(FirstCharacter, "annoyed")}:                   Ma posso anche dire "no"?
        {charTag(FirstCharacter, "neutral")}:                   Cioè, sì a vita per la comunicazione.
                                                                Ma papà dice sempre che "un compromesso crea due infelicità".

        + \ {charTag(PG, "neutral")}:                           Tuo padre è super! Voglio anche io cose che fanno rumore!
            -> glyph_choice_manager(false, airC)->
        {charTag(FirstCharacter, "affectionate")}:              Se ci fossimo incontrat3 da piccol3 avremmo fatto casino assieme.
        {charTag(FirstCharacter, "curious")}:                   A volte poi lo faccio ancora con papà. 
        {charTag(FirstCharacter, "neutral")}:                   Gli piace fare musica con gli oggetti in casa, o le cose che ha nel laboratorio.
        {charTag(FirstCharacter, "annoyed")}:                   Mamma lo chiama "casino".
        {charTag(FirstCharacter, "affectionate")}:              Ma secondo me si diverte anche lei.
            
        + \ {charTag(PG, "neutral")}:                           Le relazioni sono passione e uno scopo condiviso.
            -> glyph_choice_manager(false, fireC)->
            {charTag(FirstCharacter, "neutral")}:               Quando ero più piccola vivevo i rapporti con molta più passione.
            {charTag(FirstCharacter, "annoyed")}:               E molti più casini.
            {charTag(FirstCharacter, "neutral")}:               Lo scopo condiviso invece.
            {charTag(FirstCharacter, "affectionate")}:          Uh, ce l'ho con le ame.
            {charTag(FirstCharacter, "sad")}:                   Ma con Ennio?

        //MAGGIOR PARTE DELLE SCELTE: ACQUA
        + \ {charTag(PG, "neutral")}:                           Credo molto nell'idea di cura, supporto, sostegno reciproco.
            -> glyph_choice_manager(false, waterC)->
            {charTag(FirstCharacter, "affectionate")}:          Mi suona molto, ama.
                                                                Fare la strada assieme, aiutandosi.
                                                                Totale.
        //Mi piace l'immagine, in generale c'è da capire meglio come focalizzare le scelte spirito
        + \ {charTag(PG, "neutral")}:                           Una relazione è una foresta, una rete di infinite vite diverse.
            -> glyph_choice_manager(false, aetherC)->
            {charTag(FirstCharacter, "curious")}:               Messa così è più tipo una rete di relazioni, che non una relazione? 
            {charTag(FirstCharacter, "neutral")}:               Una cosa tipo che ognunə di noi è legatə a tante persone legate a loro volta ad altre persone.
            {charTag(FirstCharacter, "affectionate")}:          E così quindi creiamo una foresta?
        -    
    {charTag(FirstCharacter, "neutral")}:                       No no taglio io, non ti preoccupare, continua a mischiare.
    {charTag(FirstCharacter, "curious")}:                       Ma invece tu che rapporto hai coi tuoi genitori? 

            -> kitchen_moon_feedback -> 

        + (earth1)\ {charTag(PG, "neutral")}:                   <i>Soffriggo dei cubetti di grano del rispetto.</i>
            ~ kitchen_recipeNoun = "Zuppa di grano"
            -> glyph_choice_manager(true, earthC)->
            {charTag(FirstCharacter, "neutral")}:               Uh, credo di capire.
                                                                Il rispetto è una bella cosa coi genitori.
                                                                Il trattarsi reciprocamente da adulti etc etc, giusto?
            {charTag(FirstCharacter, "affectionate")}:          Una forma di affetto.
            
        + (water1)\ {charTag(PG, "neutral")}:                   <i>Impano delle striscioline di seitan malinconico.</i>
            ~ kitchen_recipeNoun = "Grigliata di seitan"
            -> glyph_choice_manager(true, waterC)->
            {charTag(FirstCharacter, "sad")}:                   Credo mi dispiaccia, vero?
            {charTag(FirstCharacter, "neutral")}:               Insomma.
                                                                Qualcosa che manca, che non è come dovrebbe essere.
                                                                O che non è più.
            {charTag(FirstCharacter, "sad")}:                   Mi spiace, {player_name}, davvero.
            
        + (fire1)\ {charTag(PG, "neutral")}:                    <i>Sgrano dei fagioli del conflitto.</i>
            ~ kitchen_recipeNoun = "Fagiolata"
            -> glyph_choice_manager(true, fireC)->
            {charTag(FirstCharacter, "neutral")}:               Non so se ti possa consolare, ma è una cosa comune.
                                                                Molte delle mie amiche hanno un rapporto di merda coi genitori.
                                                                Talco pensa sia un passaggio necessario per diventare adulti.
            {charTag(FirstCharacter, "annoyed")}:               E poi mi chiama "Cocca di papà".
            {charTag(FirstCharacter, "affectionate")}:          Stronzə.
    
        + (aether1)\ {charTag(PG, "neutral")}:                  <i>Sbollento delle cimette di broccolo della fiducia.</i>
            ~ kitchen_recipeNoun = "Cimetta di broccolo"
            -> glyph_choice_manager(true, aetherC)->
            {charTag(FirstCharacter, "affectionate")}:          Sento anche io questa cosa.
                                                                Questa fiducia reciproca.
                                                                Credo sia la cosa più bella da creare coi propri genitori.
                                                                Un segno totale d'amore.

        + (air1)\ {charTag(PG, "neutral")}:                     <i>Schiaccio degli spicchi di aglio del distacco.</i>
            ~ kitchen_recipeNoun = "Crema d'aglio"
            -> glyph_choice_manager(true, airC)->
            {charTag(FirstCharacter, "neutral")}:               Merda.
            {charTag(FirstCharacter, "sad")}:                   Mi spiace {player_name}.
            {charTag(FirstCharacter, "neutral")}:               Non so se ha senso, ma la distanza mi sembra peggio del litigio, del conflitto.
                                                                Perché dal conflitto può nascere un cambiamento.
                                                                Ed è comunque un rapporto.
                                                                Insomma.
            {charTag(FirstCharacter, "sad")}:                   Mi spiace ama.
        -  
    
    {charTag(FirstCharacter, "curious")}:                       Dove ho messo il sale? 
    {charTag(FirstCharacter, "neutral")}:                       Eccolo.
                                                                Lato amicizie, l'arrivo al nord è stato un reset.
                                                                In pochi mesi avevo il mio giro del Conservatorio.
    {charTag(FirstCharacter, "affectionate")}:                  All'inizio è stato magnifico: confidenze, feste, studio di gruppo e casini di cuore.
    {charTag(FirstCharacter, "annoyed")}:                       Ma dopo un anno ho scoperto una cosa: nei gruppi si litiga.
    {charTag(FirstCharacter, "sad")}:                           A una certa Luana, una ragazza del gruppo, si è allontanata.
                                                                Quel tipo di rapporto per cui ci si saluta, "Ehi, come stai?", "Bene" e poi ognuna per la sua strada.
                                                                Io.
    {charTag(FirstCharacter, "neutral")}:                       Boh.
                                                                Sentivo il bisogno di chiarire, ma non sapevo come fare.
    {charTag(FirstCharacter, "sad")}:                           Mi sembrava che farlo avrebbe significato tradire il gruppo.
    {charTag(FirstCharacter, "sad")}:                           Perché le altre non la sopportavano più.
    {charTag(FirstCharacter, "annoyed")}:                       Anche se Luana si è comportata da stronza.
    {charTag(FirstCharacter, "neutral")}:                       Ho sbagliato?

        //DA RAFFORZARE SCELTA FUOCO
        + \ {charTag(PG, "neutral")}:                           Un'amicizia non è volontariato: se si sta male, ci si divide.
            -> glyph_choice_manager(false, fireC)->
            {charTag(FirstCharacter, "annoyed")}:               Una amicizia è anche volontariato, in un certo senso.
                                                                Non è che te ne vai quando le cose non vanno bene, no?
        
        + \ {charTag(PG, "neutral")}:                           Avevate concordato delle regole per queste situazioni?
            -> glyph_choice_manager(false, airC)->
            {charTag(FirstCharacter, "neutral")}:               Certo.
                                                                Vidimate dalla notaia.
                                                                Fammi vedere se le ho lasciate nello zainetto del "Ma che diavolo dice {player_name}?"
                                                                Mmm.
                                                                No.
                                                                Non c'è.
    
        + \ {charTag(PG, "neutral")}:                           Senza chiarirsi, certe ferite rimarranno per sempre.
            -> glyph_choice_manager(false, waterC)->
            {charTag(FirstCharacter, "sad")}:                   Penso tanto a Luana.
                                                                A volte mi manca.
            {charTag(FirstCharacter, "neutral")}:               A volte vorrei capire cosa è successo.
                                                                Se le cose potrebbero andare diversamente.
            {charTag(FirstCharacter, "sad")}:                   E tutte queste domande fanno un male boia.
    
        + \ {charTag(PG, "neutral")}:                           Perché parlandole avresti tradito il gruppo? Mi son pers{player_pronoun has him:o|{player_pronoun has her:a|ə}} il nuovo "regole dell'amicizia"?
            -> glyph_choice_manager(false, earthC)->
            {charTag(FirstCharacter, "neutral")}:               Ma è ovvio che.
                                                                Che no.
            {charTag(FirstCharacter, "sad")}:                   Non lo so.
                                                                Ci sono tutte queste cose che non si dicono nelle relazioni.
                                                                Ma puoi comunque romperle.
            {charTag(FirstCharacter, "neutral")}:               Ha senso?
            
        + \ {charTag(PG, "neutral")}:                           Cosa succederebbe se litigassero con te?
            -> glyph_choice_manager(false, aetherC)->
            {charTag(FirstCharacter, "sad")}:                   In realtà è quello che è successo.
            {charTag(FirstCharacter, "neutral")}:               Anni dopo, per una cavolata.
                                                                Però mi è stato detto "Quando è troppo è troppo."
            {charTag(FirstCharacter, "sad")}:                   E sono tutte sparite.
                                                                E non ho mai capito cosa sia successo di troppo.
                                                                Continuo a non saperlo.
        -
    
    {charTag(FirstCharacter, "affectionate")}:                  Buono comunque questo vino rosso.
    {charTag(FirstCharacter, "curious")}:                       E tu cosa ti aspetti da un'amicizia, {player_name}? 
    
        + (air2)\ {charTag(PG, "neutral")}:                     <i>Tosto del pepe dell'onestà.</i>
            ~ kitchen_recipeAdjective = "onestà"
            -> glyph_choice_manager(true, earthC)->
            {charTag(FirstCharacter, "affectionate")}:          Come Talco.
                                                                Quel tipo di persona che se fai una cagata, te la dice.
            
        + (earth2)\ {charTag(PG, "neutral")}:                   <i>Spargo della curcuma divertente.</i>
            ~ kitchen_recipeAdjective = "comicità"
            -> glyph_choice_manager(true, airC)->
                                                                L'amicizia da balotta quindi. 
                                                                Da cazzeggio assieme.
                                                                Da oasi nel casino del mondo.
            
        + (water2)\ {charTag(PG, "neutral")}:                   <i>Aggiungo del cumino empatico.</i>
            ~ kitchen_recipeAdjective = "empatia"
            -> glyph_choice_manager(true, waterC)->
            {charTag(FirstCharacter, "affectionate")}:          Quel tipo di rapporto che ti fa sentire ascoltata.
                                                                Capita.
                                                                Dove puoi essere te stessa.
            {charTag(FirstCharacter, "sad")}:                   Spero tanto di essere quel tipo di amica, sai?
    
        + (aether2)\ {charTag(PG, "neutral")}:                  <i>Grattugio della cannella completa.</i>
            ~ kitchen_recipeAdjective = "completezza"
            -> glyph_choice_manager(true, aetherC)->
            {charTag(FirstCharacter, "neutral")}:               Posso capire, ma non mi piace tantissimo come idea.
                                                                Mi piace che le amicizie ci siano anche nel conflitto.
                                                                Non mi preoccupa che le amicizie finiscano.
            {charTag(FirstCharacter, "sad")}:                   Mi preoccupa il <i>come</i>.
                                                                Tipo se finisce la stima.
                                                                Terribile.

        + (fire2)\ {charTag(PG, "neutral")}:                    <i>Sminuzzo dello zenzero leale.</i>
            ~ kitchen_recipeAdjective = "lealtà"
            -> glyph_choice_manager(true, fireC)->
            {charTag(FirstCharacter, "neutral")}:               Essere leali significa essere affidabili, vero?
                                                                Quel tipo di persona che non va in giro a dire i tuoi segreti.
                                                                E che cerca sempre di darti il consiglio giusto, non quello che le torna comodo.
        -      
    
    {charTag(FirstCharacter, "neutral")}:                       Aspè, aggiungo ancora del brodino.
    {charTag(FirstCharacter, "affectionate")}:                  Il profumo è magnifico ama.
    {charTag(FirstCharacter, "neutral")}:                       Comunque, unpopular opinion che non è poi molto unpopular: non è che c'è tutta 'sta differenza tra amore e amicizia.
                                                                Vedo lə tiziə che chiamiamo "amore" solo come unə amicə con cui è anche bello scopare.
                                                                Ma va bene anche non scoparci.
    {charTag(FirstCharacter, "annoyed")}:                       Vedi il casino con 'ste parole?
    {charTag(FirstCharacter, "neutral")}:                       E di certo non me la sento di dire che una persona viene prima dell'altra solo per questo tipo di cose.
    {charTag(FirstCharacter, "affectionate")}:                  Tipo che Talco ed Ennio per me sono i miei due grandi amori.
                                                                Punto.
    {charTag(FirstCharacter, "neutral")}:                       E forse mi contraddico con altre cose che ho detto ma è un casino.
                                                                Perché quando parli devi parlare con il linguaggio di chi hai davanti, o non ci si capisce.
                                                                E non c'è molto linguaggio per raccontare con vulnerabilità queste cose.
    {charTag(FirstCharacter, "sad")}:                           Quando ho detto "Ti amo" a Talco una volta, ubriaca, per un poco le cose si sono fatte strane.
                                                                Perché dietro quella parola c'è una botta infinita di aspettative.
    {charTag(FirstCharacter, "affectionate")}:                  Per fortuna Talco è Talco e ne abbiamo parlato e ci siamo capit3.
    {charTag(FirstCharacter, "neutral")}:                       Ha senso vero?
    
        + \ {charTag(PG, "neutral")}:                           L'avresti detto se non fossi stata ubriaca?
            -> glyph_choice_manager(false, aetherC)->
            {charTag(FirstCharacter, "neutral")}:               Credo di sì.
                                                                Prima o poi sì.
                                                                Perché l'ho pensato a lungo.
                                                                Non ho più avuto il coraggio di dirlo di nuovo.
                                                                E non l'ho di certo dimostrato, dopo il modo in cui l'ho traditə.
        
        + \ {charTag(PG, "neutral")}:                           Contano le azioni, le parole creano solo confusione.
            -> glyph_choice_manager(false, fireC)->
            {charTag(FirstCharacter, "neutral")}:               Mmm.
                                                                Non credo.
            {charTag(FirstCharacter, "annoyed")}:               Non è che conta tipo il <i>perché</i> fai le cose, invece?
            {charTag(FirstCharacter, "neutral")}:               Cioè: ti posso dare uno schiaffo per difendermi o per attaccarti.
                                                                E sono due schiaffi proprio diversi, no?
        
        + \ {charTag(PG, "neutral")}:                           Che aspettative hai quando dici <i>Ti amo</i>?
            -> glyph_choice_manager(false, airC)->
            {charTag(FirstCharacter, "annoyed")}:               È quello che mi chiedo da quando sono qui.
            {charTag(FirstCharacter, "neutral")}:               Prima ti avrei detto: reciprocità.
                                                                Fiducia.
                                                                Fedeltà ma non a letto, quanto agli impegni presi.
            {charTag(FirstCharacter, "sad")}:                   Ma quali sono gli impegni presi, se non se ne parla, se non vengono concordati?                                                    
            
        + \ {charTag(PG, "neutral")}:                           Una lingua esprime ciò che la sua cultura ritiene importante.
            -> glyph_choice_manager(false, earthC)->
            {charTag(FirstCharacter, "annoyed")}:               Ma una lingua è una roba viva.
                                                                La cultura, pure.
            {charTag(FirstCharacter, "neutral")}:               E quando le cose cambiano, cambiano entrambe, no?
            {charTag(FirstCharacter, "annoyed")}:               Mica viviamo in un museo a cielo aperto, tipo.
                
        + \ {charTag(PG, "neutral")}:                           I sentimenti non si esauriscono se condivisi con più persone.
            -> glyph_choice_manager(false, waterC)->
            {charTag(FirstCharacter, "neutral")}:               Questo.
                                                                Sì.
            {charTag(FirstCharacter, "affectionate")}:          Questo è vero.
            {charTag(FirstCharacter, "neutral")}:               Non facilissimo da far capire, sai?
            {charTag(FirstCharacter, "affectionate")}:          Ma vero.
        -
    {
        - contentsKitchen has SecondCharCookingAloneOBJ:
        {charTag(FirstCharacter, "annoyed")}:                   Questo pipistrello mi sta spaventando.
        {charTag(FirstCharacter, "affectionate")}:              Ma c'è da dire che da quando c'è lui in giro ci sono meno zanzare in giro!

        - else:
        {charTag(FirstCharacter, "annoyed")}:                   Carini gli insetti ma vorrei non finissero nel nostro veganissimo piatto.
    }
    {charTag(FirstCharacter, "affectionate")}:                  Ecco, questo coperchio ci sta perfettamente.
    {charTag(FirstCharacter, "neutral")}:                       Così, a caldo.
    {charTag(FirstCharacter, "curious")}:                       Una persona che ti piace ti dice "Ti amo". Qual è la prima sensazione che provi? 
        
        //Trasforma la domanda in aria
        + (air3)\ {charTag(PG, "neutral")}:                     <i>Verso una mestolata di brodo del terrore.</i>
            ~ kitchen_recipeComplement = "brodo del terrore"
            -> glyph_choice_manager(true, airC)->
            {charTag(FirstCharacter, "neutral")}:               Woah, {player_name}.
                                                                Questa è intensa.
                                                                Anche se effettivamente l'amore può far cagare addosso.
            
        + (earth3)\ {charTag(PG, "neutral")}:                   <i>Manteco della noce euforica.</i>
            ~ kitchen_recipeComplement = "noce euforica"
            -> glyph_choice_manager(true, earthC)->
            {charTag(FirstCharacter, "neutral")}:               Mi risuona tanto.
                                                                Anche se mi è successo solo due volte.
            {charTag(FirstCharacter, "affectionate")}:          Detta dalla persona giusta è una parola che ti fa volare, vero?
            
        + (water3)\ {charTag(PG, "neutral")}:                   <i>Condisco con semi dell'"io? no, no è possibile!".</i>
            ~ kitchen_recipeComplement = "semi dell'<i>io? no, no è possibile!</i>"
            -> glyph_choice_manager(true, waterC)->
            {charTag(FirstCharacter, "neutral")}:               Coff Coff.
                                                                La sento.
                                                                Madonna se la sento.
                                                                Mi è successo anche con Ennio.
            {charTag(FirstCharacter, "sad")}:                   E a volte mi succede ancora.

        //è poco spirito. comunione? viaggio assieme?
        + (aether3)\ {charTag(PG, "neutral")}:                  <i>Incorporo una cucchiata di olio delle lusinghe.</i>
            ~ kitchen_recipeComplement = "olio delle lusinghe"
            -> glyph_choice_manager(true, aetherC)->
            {charTag(FirstCharacter, "curious")}:               Uh, a qualcuno piace quando il suo pelo viene lisciato, vero? 
            {charTag(FirstCharacter, "annoyed")}:               Però non rischia di essere una cosa egoista?
            {charTag(FirstCharacter, "neutral")}:               Più legata a come ti senti che al sentimento che provi per quella persona?

        + (fire3)\ {charTag(PG, "neutral")}:                    <i>Sminuzzo una manciata di peperoncini arrapati.</i>
            ~ kitchen_recipeComplement = "peperoncini arrapati"
            -> glyph_choice_manager(true, fireC)->
            {charTag(FirstCharacter, "neutral")}:               Questa non me l'aspettavo, ma ci sta.
            {charTag(FirstCharacter, "affectionate")}:          Sentirsi amatə è indubbiamente sexy.
            {charTag(FirstCharacter, "neutral")}:               Anni fa confondevo a manetta arrapamento e amore.
            {charTag(FirstCharacter, "annoyed")}:               Puoi immaginare i casini che ho combinato.
        -  
    
        -> fourth_ingredient_dispatcher
            
    
    = second_theme
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    

        {charTag(FirstCharacter, "neutral")}:                   Woah, pesa.
                                                                Forse "salvare il mondo" è pretenzioso da dire.
        {charTag(FirstCharacter, "sad")}:                       Anche se so bene di averlo detto io.
                                                                Credo.
        {charTag(FirstCharacter, "neutral")}:                   Perché poi, da cosa dovrei salvarlo?
                                                                E come?
                                                                Respira {charNameOne}, respira.
        {charTag(FirstCharacter, "sad")}:                       Non sono una brava con le cose politiche, ama.
        {charTag(FirstCharacter, "neutral")}:                   Prendi la Rifugia, quella associazione per cui abbiamo suonato.
        {charTag(FirstCharacter, "neutral")}:                   Perché è nata?
                                                                Perché per vivere ci servono le case.
                                                                E le case non ci sono.
        {charTag(FirstCharacter, "annoyed")}:                   O meglio, ci sono, ma solo per far fare vacanze a persone che poi alla fin fine della tua città non gliene frega niente.
        {charTag(FirstCharacter, "neutral")}:                   Ma poi metà del loro lavoro è inseguire l'Assessora XYZ o fare gli incontri con altre associazioni.
                                                                E quando sono stata alle loro riunioni.
                                                                Aiuto.
        {charTag(FirstCharacter, "sad")}:                       Non le so usare le parole grandi come fanno loro.
                                                                Patriarcato.
                                                                Fascismo.
                                                                Razzismo.
                                                                Crisi climatica.
                                                                Gaza, Darfur, genocidio.
        {charTag(FirstCharacter, "annoyed")}:                   Sarebbe come mettermi in bocca concetti che non conosco bene.
        {charTag(FirstCharacter, "neutral")}:                   Ma anche se non so che nome dare alle cose, le vedo.
                                                                E le voglio cambiare.
        {charTag(FirstCharacter, "sad")}:                       Questo è ufficialmente il discorso più sconclusionato che abbia mai fatto.
        
            + \ {charTag(PG, "neutral")}:                       Non è che prima di battere un mostro lo studi, no?
                -> glyph_choice_manager(false, earthC)->
            {charTag(FirstCharacter, "neutral")}:               Ehm.
                                                                Dovresti chiedere a Ennio, è lui quello bravo coi videogiochi.
                                                                Ma un po' sì, no?
                                                                Nel senso, me lo ricordo su <i>Hollow Knight</i> a studiarsi i pattern dei mostri col coinquilino.
             
            + \ {charTag(PG, "neutral")}:                       Non è sconclusionato: lottare ci rende viv3!
                -> glyph_choice_manager(false, fireC)->
            {charTag(FirstCharacter, "neutral")}:               Sì, credo?
                                                                Però non sempre sei prontə ad agire.
            {charTag(FirstCharacter, "sad")}:                   Quindi se non fai cose, se non cambi cose, non sei viva?

            + \ {charTag(PG, "neutral")}:                       Le parole grandi hanno anche grandi poteri.
                -> glyph_choice_manager(false, aetherC)->
            {
                -first_char_main_storylets.four.no:
                {charTag(FirstCharacter, "curious")}:           Esatto, come dicevamo prima sui "no" che hanno cambiato la storia, vero? 
            }
            {charTag(FirstCharacter, "affectionate")}:          Forse tutte le parole hanno grandi poteri, non ce ne sono di grandi e piccole.
            {charTag(FirstCharacter, "neutral")}:               Penso a quando Talco ha deciso di chiamarsi Talco.
            {charTag(FirstCharacter, "affectionate")}:          E a quel punto, con quella parola, è diventata la persona che è sempre statə.
            {charTag(FirstCharacter, "curious")}:               Le parole sono sempre enormi. 
                                                                Ha senso?    
    
            + \ {charTag(PG, "neutral")}:                       Quindi ti senti inadeguata?
                -> glyph_choice_manager(false, waterC)->
            {charTag(FirstCharacter, "neutral")}:               Bingo.
            {charTag(FirstCharacter, "sad")}:                   Già.
                                                                Totale.
            {charTag(FirstCharacter, "neutral")}:               Lo so che è una cosa comune.
                                                                Ma non è che mi fa stare proprio meglio.
            
            + \ {charTag(PG, "neutral")}:                       C'è qualcunə che può aiutarti a capirle, quelle parole?
                -> glyph_choice_manager(false, airC)->
            {charTag(FirstCharacter, "neutral")}:               Il mondo intero.
                                                                Valeria me ne racconta tante di cose ma.
                                                                Capisco solo quello che vivo.
            {charTag(FirstCharacter, "sad")}:                   Ha senso?
            {charTag(FirstCharacter, "neutral")}:               E anche se qualche storia terribile l'ho sentita durante gli incontri della Rifugia, è una cosa diversa dal viverle.
                                                                E mi viene da pensare che dovrei agire solo per le cose che capisco.
                                                                Ma se queste cose non le capisco, allora qual è la cosa più giusta?
            {charTag(FirstCharacter, "annoyed")}:               Non dovrei fare nulla? 
            -        
        
        {charTag(FirstCharacter, "annoyed")}:                   Aspetta, stagliuzzo io.
                                                                Comunque è una questione di futuro, no?
                                                                Ora abbiamo alcune cose nel presente.
        {charTag(FirstCharacter, "annoyed")}:                   Quelle cose ci fanno cagare.
                                                                Non le vogliamo, o le vogliamo diverse nel futuro.
        {charTag(FirstCharacter, "curious")}:                   Tu {player_name} sai che futuro vuoi vedere? 
        
            -> kitchen_moon_feedback -> 
            
            + (air1)\ {charTag(PG, "neutral")}:                 <i>Infarino confusamente delle tagliatelle.</i>
                ~ kitchen_recipeNoun = "Tagliatelle"
                -> glyph_choice_manager(true, airC)->
            {charTag(FirstCharacter, "sad")}:                   Già.
                                                                Anche perché sembra sempre che puoi salvare una sola cosa alla volta.
            {charTag(FirstCharacter, "neutral")}:               Anche se Valeria dice che non è vero, che i problemi sono tutti collegati.
               
            + (earth1)\ {charTag(PG, "neutral")}:               <i>Stendo con decisione delle lasagne.</i>
                ~ kitchen_recipeNoun = "Lasagne"
                -> glyph_choice_manager(true, earthC)->
                {charTag(FirstCharacter, "neutral")}:           Uh.
                                                                Ha senso dire che ti invidio per questa tua chiarezza?
                {charTag(FirstCharacter, "sad")}:               Deve essere bello sapere dove si vuole andare.
            //Trasformare in spirito 
            + (aether1)\ {charTag(PG, "neutral")}:              <i>Affetto con disinteresse delle bruschette.</i>
               ~ kitchen_recipeNoun = "Bruschette"
               -> glyph_choice_manager(true, aetherC)->
               {charTag(FirstCharacter, "neutral")}:            Quindi sei più del tipo "Vediamo dove andiamo?"
                                                                Che ha senso magari a livello personale.
               {charTag(FirstCharacter, "annoyed")}:            Ma per le grandi cose, boh.
        
            + (fire1)\ {charTag(PG, "neutral")}:                <i>Impasto furiosamente delle arancine.</i>
                ~ kitchen_recipeNoun = "Arancine"
                -> glyph_choice_manager(true, fireC)->
               {charTag(FirstCharacter, "neutral")}:            Immagino che la furia sia un modo per guardare a ciò che non va ora.
                                                                A volte mi piacerebbe sapermi arrabbiare.
            {
                - secondChar_storyStatus == story_storyStarted:
                {charTag(FirstCharacter, "affectionate")}:      Dovrei imparare da {charNameTwo}.
                
                - else:
                {charTag(FirstCharacter, "affectionate")}:      Avrei dovuto imparare da {charNameTwo}.
            }
               
            + (water1)\ {charTag(PG, "neutral")}:               <i>Scaldo disperatamente delle tortillas.</i>
                ~ kitchen_recipeNoun = "Tortillas"
                -> glyph_choice_manager(true, waterC)->
                {charTag(FirstCharacter, "neutral")}:           È un sentimento.
                                                                Non so se sia peggio la confusione o la disperazione.
            -  
       
        {charTag(FirstCharacter, "neutral")}:                   Mi sa che mi metto ad affettare qualcosa intanto.
                                                                C'è una cosa che mi imbarazza tantissimo dire, ma.
                                                                Non sono la persona più sicura del pianeta, l'avrai visto.
        {charTag(FirstCharacter, "sad")}:                       Ma se c'è un motivo quando si parla di queste cose per cui non mi sento mai all'altezza sono i social.
        {charTag(FirstCharacter, "annoyed")}:                   Non è che mi metto a dire "Brutta la tecnologia, bruciamo tutto!".
        {charTag(FirstCharacter, "sad")}:                       Ma anche dal vivo, anche ora, una parte di me ha in testa la voce di InfluTizia e TikTokerCoso che mi criticano per una parola sbagliata o che.
        {charTag(FirstCharacter, "annoyed")}:                   Non si dice così ma cosà.
                                                                E hai dimenticato questo.
                                                                E questa cosa non è vera, l'ha detto Butler dieci minuti fa, dovevi saperlo.
                                                                E.
        {charTag(FirstCharacter, "neutral")}:                   E insomma, ci sta.
                                                                Si sta cercando di creare un mondo diverso ed è un bene non portarci dentro le cose che non vanno ora.
                                                                Ma questo modo di fare mi fa sentire costantemente inadeguata.
        {charTag(FirstCharacter, "sad")}:                       Sbagliata.
        {charTag(FirstCharacter, "annoyed")}:                   E una parte di me pensa che abbiamo il diritto anche di sbagliare, no?
        {charTag(FirstCharacter, "neutral")}:                   In generale, ma soprattutto in queste cose.
                                                                Perché se dobbiamo andare verso futuri che ancora non esistono, sbagliare è inevitabile.
        {charTag(FirstCharacter, "curious")}:                   E ci fa bene, no? 
        {charTag(FirstCharacter, "neutral")}:                   Alla fine cose buonissime sono nate da errori.
        {charTag(FirstCharacter, "curious")}:                   Come il gorgonzola. 
        {charTag(FirstCharacter, "affectionate")}:              Dovremmo fare meno l3 poliziott3, e perdonarci di più.
        
            + \ {charTag(PG, "neutral")}:                       Serve del metodo. Se la base non è solida, crolla tutta la casa.
                -> glyph_choice_manager(false, earthC)->
            {charTag(FirstCharacter, "annoyed")}:               Ma se poi quella base non la costruisce nessunə, perché si perde lo slancio, il coraggio?
                                                                Cosa ci abbiamo guadagnato?
            
            + \ {charTag(PG, "neutral")}:                       Dobbiamo farci meno paranoie e agire di più.
                -> glyph_choice_manager(false, fireC)->
            {charTag(FirstCharacter, "annoyed")}:               Non so.
                                                                Fare per fare non porta molto lontano.
            {charTag(FirstCharacter, "neutral")}:               O meglio: magari porta lontano.
            {charTag(FirstCharacter, "sad")}:                   Ma senza sapere dove arriveremo.

            //trasforma in aria   
            + \ {charTag(PG, "neutral")}:                       Come te li immagini questi futuri inesistenti?
                -> glyph_choice_manager(false, airC)->
            {charTag(FirstCharacter, "affectionate")}:          Senza auto.
            {charTag(FirstCharacter, "annoyed")}:               Odio le auto.
            {charTag(FirstCharacter, "affectionate")}:          Senza ricchi.
                                                                Senza separare umani da animali.                                                    
                                                                Senza confini nazionali.
                                                                Anzi: senza nazioni.
                                                                Piccole comunità aperte dove ci si divide il lavoro e ci si aiuta a vicenda.
                                                                Una specie di enorme Rifugia.

            + \ {charTag(PG, "neutral")}:                       Il perdono è un atto di coraggio, ci rende vulnerabili.
                -> glyph_choice_manager(false, waterC)->
            {charTag(FirstCharacter, "affectionate")}:          E la soluzione per me è nella vulnerabilità.
            {charTag(FirstCharacter, "neutral")}:               Certa gente prende strade di merda perché ha il terrore di mostrarsi ferita.
                                                                Feribile.
            {charTag(FirstCharacter, "affectionate")}:          Ma solo condividendo le vulnerabilità possiamo davvero capirci.
            {charTag(FirstCharacter, "curious")}:               Woah, che filosofa che sono! 
    
            + \ {charTag(PG, "neutral")}:                       Quello che conta è cosa fai quando ti viene detto che hai sbagliato.
                -> glyph_choice_manager(false, aetherC)->
            {charTag(FirstCharacter, "affectionate")}:          Mi suona molto.
            {charTag(FirstCharacter, "sad")}:                   Anche se è difficile, ama.
            {charTag(FirstCharacter, "neutral")}:               Madonna se è difficile.
            {charTag(FirstCharacter, "sad")}:                   Perché dove lo metti comunque il senso di colpa?
            {charTag(FirstCharacter, "neutral")}:               Però è un bel punto di partenza. 
            -
        
        {charTag(FirstCharacter, "affectionate")}:              <i>Più gorgonzola, meno poliziott3.</i>
                                                                Devo proporlo a Valeria.
        {charTag(FirstCharacter, "neutral")}:                   Aspetta, mescolo o si attacca tutto.
        {charTag(FirstCharacter, "curious")}:                   Comunque non te l'ho mai chiesto, {player_name}: tu ti senti una persona sicura? 

            + (earth2)\ {charTag(PG, "neutral")}:               <i>Aggiungo con convinzione delle prugne.</i>
                ~ kitchen_recipeAdjective = "convinzione"
                -> glyph_choice_manager(true, earthC)->
               
            + (water2)\ {charTag(PG, "neutral")}:               <i>Spolvero con titubanza del mais.</i>
                ~ kitchen_recipeAdjective = "titubanza"
                -> glyph_choice_manager(true, waterC)->
             
            + (fire2)\ {charTag(PG, "neutral")}:                <i>Affetto con autocontrollo delle zucchine.</i>
               ~ kitchen_recipeAdjective = "disciplina"
               -> glyph_choice_manager(true, fireC)->
        
            + (air2)\ {charTag(PG, "neutral")}:                 <i>Spremo tempestosamente del chinotto.</i>
                ~ kitchen_recipeAdjective = "tempestosità"
                -> glyph_choice_manager(true, airC)->
    
            + (aether2)\ {charTag(PG, "neutral")}:              <i>Sminuzzo con consapevolezza della cipolla.</i>
                ~ kitchen_recipeAdjective = "consapevolezza"
                -> glyph_choice_manager(true, aetherC)->
            -     
        {
            - (kitchen_storageAether >  kitchen_storageEarth) && (kitchen_storageAether >  kitchen_storageFire) && (kitchen_storageAether >  kitchen_storageWater) && (kitchen_storageAether >  kitchen_storageAir):
            {charTag(FirstCharacter, "curious")}:               Interessante. 
            {charTag(FirstCharacter, "neutral")}:               In queste conversazioni non so perché ma ti ho visto come una persona quasi spirituale.
                                                                Più attenta al grande insieme delle cose.
            {charTag(FirstCharacter, "affectionate")}:          Mi dai l'idea di solidità, sai?

            - (kitchen_storageEarth >  kitchen_storageAether) && (kitchen_storageEarth >  kitchen_storageFire) && (kitchen_storageEarth >  kitchen_storageWater) && (kitchen_storageEarth >  kitchen_storageAir):
            {charTag(FirstCharacter, "curious")}:               Interessante. 
            {charTag(FirstCharacter, "affectionate")}:          In queste conversazioni non so perché ma ti ho visto come una persona giocosa.
                                                                Una che trova il piacere, il bello nel mondo, anche quando non è facile.
                                                                Credo ci voglia tanto equilibrio interiore per farlo.

            - (kitchen_storageFire >  kitchen_storageEarth) && (kitchen_storageFire >  kitchen_storageAether) && (kitchen_storageFire >  kitchen_storageWater) && (kitchen_storageFire >  kitchen_storageAir):
            {charTag(FirstCharacter, "curious")}:               Interessante. 
            {charTag(FirstCharacter, "neutral")}:               In queste conversazioni non so perché ma ti ho visto come una persona molto attiva.
                                                                Più interessata alle cose da fare che non ai grandi ragionamenti.
            {charTag(FirstCharacter, "annoyed")}:               Ammetto che associo questa cosa all'idea del chaddone tontolotto.
            {charTag(FirstCharacter, "sad")}:                   Ma è un mio pregiudizio, lo so.

            - (kitchen_storageWater >  kitchen_storageEarth) && (kitchen_storageWater >  kitchen_storageFire) && (kitchen_storageWater >  kitchen_storageAether) && (kitchen_storageWater >  kitchen_storageAir):
            {charTag(FirstCharacter, "curious")}:               Interessante. 
            {charTag(FirstCharacter, "affectionate")}:          In queste conversazioni non so perché ma ti ho visto come una persona molto legata alle emozioni.
                                                                Ma a differenza mia, sembra che tu riesca a trovare la tua solidità in questo.

            - (kitchen_storageAir >  kitchen_storageEarth) && (kitchen_storageAir >  kitchen_storageFire) && (kitchen_storageAir >  kitchen_storageWater) && (kitchen_storageAir >  kitchen_storageAether):
            {charTag(FirstCharacter, "curious")}:               Interessante. 
            {charTag(FirstCharacter, "neutral")}:               In queste conversazioni non so perché ma ti ho visto come una persona molto razionale.
                                                                Con uno sguardo analitico sul mondo.
            {charTag(FirstCharacter, "annoyed")}:               Nella mia testa questa roba è tipo finta sicurezza.
                                                                Ha a che fare col controllo.
            {charTag(FirstCharacter, "neutral")}:               Ma lo so, è un vizio tutto mio.

            - else:
            {charTag(FirstCharacter, "curious")}:               Interessante.
            {charTag(FirstCharacter, "neutral")}:               Ammetto di non averti ancora inquadrat{player_pronoun has him:o|{player_pronoun has her:a|ə}} molto.
                                                                Ma siamo qui anche per conoscerci, giusto?        
        }

        {charTag(FirstCharacter, "affectionate")}:              Madonna, che profumino che sta salendo.
                                                                Faccio un brindisi: a noi!
        {charTag(FirstCharacter, "neutral")}:                   Comunque non sto davvero rispondendo alla tua domanda.
        {charTag(FirstCharacter, "affectionate")}:              Ammazza se picchia 'sto vino.
        {charTag(FirstCharacter, "neutral")}:                   Sto imparando tanto da Valeria, sai?
                                                                Talco è statə la persona che mi ha insegnato ad accogliere la creatività del caos.
                                                                Valeria mi sta mostrando quanto si possa fare unit3.
                                                                Ma non c'è solo quello: c'è un aspetto di piacere.
        {charTag(FirstCharacter, "annoyed")}:                   Lei è sfavata quando vede i modi seriosi e pesanti di comunicare, di fare le cose.
        {charTag(FirstCharacter, "neutral")}:                   Crede che il cambiamento, la lotta debba essere piacevole.
        {charTag(FirstCharacter, "sad")}:                       Perché sennò al primo problema, e ce ne sono sempre di problemi, finisci per smollare.
        {charTag(FirstCharacter, "affectionate")}:              Per questo abbiamo tirato su la band.
        {charTag(FirstCharacter, "neutral")}:                   E c'è anche un piacere più piccolo.
                                                                Quello che provo quando vado a letto e so che un'altra persona ora sta meglio, anche grazie a me.
                                                                A volte lo ritrovo anche nel lavoro.
        {charTag(FirstCharacter, "affectionate")}:              Come quando si vede che un cliente ha avuto una giornata di merda, e lo fai uscire col sorriso.
        {charTag(FirstCharacter, "neutral")}:                   Ma non so come dire, non è merito del lavoro, è giusto per caso che vi siete trovate lì, perché passiamo una marea di tempo a lavorare.
        {charTag(FirstCharacter, "annoyed")}:                   E a volte è quasi un incidente, perché gli obbiettivi dei capoccia sono diversi.
        {charTag(FirstCharacter, "neutral")}:                   Merda, mi sto perdendo, maledetto vino.
        {charTag(FirstCharacter, "affectionate")}:              Insomma: è bello lottare per le cose grandi.
                                                                Ed è bello fare cambiamenti piccoli.
        {charTag(FirstCharacter, "neutral")}:                   E addormentarsi precarie e con i casini ma sapendo di aver portato un po' di gioia a una persona.
        {charTag(FirstCharacter, "curious")}:                   Ha senso? 
        
            + \ {charTag(PG, "neutral")}:                       Il cuore è caldo quando aiutiamo le altre persone, vero?
                -> glyph_choice_manager(false, waterC)->
            {charTag(FirstCharacter, "affectionate")}:          C'è quel momento.
            {charTag(FirstCharacter, "neutral")}:               Tipo quando una è indecisa su cosa ordinare e tu le fai una battuta buffa, e le ti fa un sorriso sincero.
                                                                E tu sei lì stanca a bestia e incazzata con mezzo mondo.
            {charTag(FirstCharacter, "affectionate")}:          E ti sciogli.
                                                                Ed è tutto così vivo.

            + \ {charTag(PG, "neutral")}:                       Quando tutto è dovere il piacere è rivoluzionario. Saggi{player_pronoun has him:o|{player_pronoun has her:a|ə}}, vero?
                -> glyph_choice_manager(false, earthC)->
            {charTag(FirstCharacter, "curious")}:               Inaspettatamente saggia. 
            {charTag(FirstCharacter, "neutral")}:               Ma è una cosa sensata.
            {charTag(FirstCharacter, "affectionate")}:          Talco l'avrebbe apprezzata proprio tanto questa cosa.
            {charTag(FirstCharacter, "neutral")}:               E un po' anche io.
             
            + \ {charTag(PG, "neutral")}:                       La stanchezza migliore è quella di quando hai portato un cambiamento.
                -> glyph_choice_manager(false, fireC)->
            {charTag(FirstCharacter, "neutral")}:               Sì.
                                                                Ma.
                                                                No, non so che altro dire.
                                                                Ti do ragione e bona a questo giro.

            //Troppo distaccata
            + \ {charTag(PG, "neutral")}:                       Vivete la band tutte allo stesso modo?
                -> glyph_choice_manager(false, airC)->
            {charTag(FirstCharacter, "neutral")}:               Circa.
                                                                A volte si discute, ma mai sulle cose grosse.
                                                                Tipo: suonare in quel locale col padrone che ha idee del cazzo così che tiriamo su due soldi per fare cose belle poi, o no?
                                                                Farla una cover dell'ennesima cantante che non ha detto una parola che una sul genocidio?
                                                                Queste cose qui.

            + \ {charTag(PG, "neutral")}:                       Non rischi di mettere il tuo piacere davanti ai bisogni di chi vuoi aiutare?
                -> glyph_choice_manager(false, aetherC)->
            {charTag(FirstCharacter, "annoyed")}:               Io.
            {charTag(FirstCharacter, "neutral")}:               Uh.
            {charTag(FirstCharacter, "sad")}:                   Non ci avevo pensato.
            {charTag(FirstCharacter, "annoyed")}:               Cioè, ora mi verrebbe da urlarti e dirti: "Ma che balle {player_name}!"
                                                                "Devi rovinare tutto così?"
            {charTag(FirstCharacter, "neutral")}:               Però mi rendo conto che non è una domanda stupida.
            {charTag(FirstCharacter, "curious")}:               Forse la cosa buona è che se si fanno le cose in gruppo ci si aiuta per non fare casini egoistici?
            -
        
        {charTag(FirstCharacter, "neutral")}:                   Ancora due minuti e ci siamo ama.
                                                                Mamma che fame!
        {charTag(FirstCharacter, "curious")}:                   E visto che siamo alla fine, te la butto leggera: sei felice della vita che hai? 
        {charTag(FirstCharacter, "neutral")}:                   Anzi no aspetta che sennò ci prende male di sicuro.
        {charTag(FirstCharacter, "curious")}:                   Ti senti di star partecipando a qualcosa di più grande, di trasformativo, con le cose che fai? 


            //Risistemare aria e terra
            +(air3) \ {charTag(PG, "neutral")}:                 <i>Trituro con gioia dell'anice stellato.</i>
                ~ kitchen_recipeComplement = "anice gioioso"
                -> glyph_choice_manager(true, airC)->
            {charTag(FirstCharacter, "affectionate")}:          Gioiaaaaa!
                                                                Sì, la gioia è qualcosa che manca tanto in questo mondo ama.
                                                                Sono così felice per te!
            //acqua sempre molto triste
            + (water3)\ {charTag(PG, "neutral")}:               <i>Aggiungo {player_pronoun has him:pieno|{player_pronoun has her:piena|pienə}} di terrore esistenziale dell'origano.</i>
                ~ kitchen_recipeComplement = "origano terrorizzato"
                -> glyph_choice_manager(true, waterC)->
            {charTag(FirstCharacter, "annoyed")}:               La cosa più millennial che potessi dire, ama.
            {charTag(FirstCharacter, "affectionate")}:          Ma posso capire.

            + (earth3) \ {charTag(PG, "neutral")}:              <i>Sbuccio titubante della vaniglia.</i>
               ~ kitchen_recipeComplement = "vaniglia"
               -> glyph_choice_manager(true, earthC)->
            {charTag(FirstCharacter, "neutral")}:               Già.
            {charTag(FirstCharacter, "annoyed")}:               A volte non è così facile capire, vero?
            {charTag(FirstCharacter, "neutral")}:               Serve del tempo anche solo per vedere i risultati.
            {charTag(FirstCharacter, "sad")}:                   E nel mentre il dubbio ti rimane: avrà senso tutta 'sta roba?
        
            +(aether3) \ {charTag(PG, "neutral")}:              <i>Tosto {player_pronoun has him:rassegnato|{player_pronoun has her:rassegnata|rassegnatə}} del coriandolo.</i>
                ~ kitchen_recipeComplement = "coriandolo rassegnato"
                -> glyph_choice_manager(true, aetherC)->
            {charTag(FirstCharacter, "sad")}:                   No no, niente rassegnazione {player_name}!
            {charTag(FirstCharacter, "neutral")}:               Mo mi invento qualcosa per tirarti su.
            {charTag(FirstCharacter, "curious")}:               Tipo: vino? 
    
            + (fire3)\ {charTag(PG, "neutral")}:                <i>Caramello {player_pronoun has him:sopraffatto|{player_pronoun has her:sopraffatta|sopraffattə}} della salvia.</i>
                ~ kitchen_recipeComplement = "salvia sopraffatta"
                -> glyph_choice_manager(true, fireC)->
            {charTag(FirstCharacter, "sad")}:                   Sentimento comune.
            {charTag(FirstCharacter, "neutral")}:               Però può consolare un po'?
            {charTag(FirstCharacter, "affectionate")}:          Poco poco?

            -   
        {charTag(FirstCharacter, "annoyed")}:                   Che poi è una domanda stupida da farti, vero?
                                                                Sei {player_pronoun has him:un riscrittore|{player_pronoun has her: una riscrittora|unə riscrittorə}}, e stai facendo un lavorone anche solo con me.
        {charTag(FirstCharacter, "affectionate")}:              Grazie per questo, {player_name}!

            -> fourth_ingredient_dispatcher
                
                
    
    = third_theme
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)


        {charTag(FirstCharacter, "neutral")}:                   Cavolo.
        {charTag(FirstCharacter, "affectionate")}:              Tu e Talco andreste davvero d'accordo, {player_name}.
        {charTag(FirstCharacter, "neutral")}:                   Però dopo il pippone di prima sull'acqua antica e blah blah blah ci sta.
                                                                Intanto pulisco qualche ciotola, che penso meglio quando mi muovo.
                                                                E a proposito di pulire, la prima cosa che mi viene da dire è che creare mi pulisce il cervello.
        {charTag(FirstCharacter, "affectionate")}:              Quando inizio a creare un brano vado in un posto altro, dove vedo e mi vedo in modo diverso.
        {charTag(FirstCharacter, "neutral")}:                   Ci sono cose che so pensare solo quando compongo.
                                                                Creare è terapeutico.
                                                                Certo, poi quello che hai in testa deve parlare a più persone.
        {charTag(FirstCharacter, "annoyed")}:                   Sennò stai facendo una roba per la tua cameretta, no?
        {charTag(FirstCharacter, "neutral")}:                   Però credo che il primo motivo per cui la creatività per me è importante, è che mi fa stare bene.
        {charTag(FirstCharacter, "affectionate")}:              Bene con me stessa.
        {charTag(FirstCharacter, "neutral")}:                   Ha senso?

            + \ {charTag(PG, "neutral")}:                       Ogni cosa che immagini crea nuove versioni di te.
                    -> glyph_choice_manager(false, aetherC)->
            {charTag(FirstCharacter, "neutral")}:               Anche se l'idea di un universo pieno di me è terrificante, la frase mi suona molto.
                                                                Un po' come se provassi a vedere quello che non ho, non sono, non sono stata.
                                                                Così poi posso anche fare cose nel mondo, fuori, diverse.
               
            + \ {charTag(PG, "neutral")}:                       Non ti capita mai di creare cose che ti fanno stare male.
                    -> glyph_choice_manager(false, airC)->
            {charTag(FirstCharacter, "neutral")}:               Spesso.
            {charTag(FirstCharacter, "sad")}:                   Corri per giorni e non ti fermi, ma le cose non smettono di far male.
            {charTag(FirstCharacter, "neutral")}:               E quando ti metti al pianoforte, salgono come un veleno.
                                                                Ma non è male, anzi.
                                                                Se non ci fosse la creatività, non avrei idea delle mille cose che mi girano in testa.
            {charTag(FirstCharacter, "sad")}:                   E probabilmente uscirebbero nel momento peggiore, ferendo qualcuno.                                                    

            + \ {charTag(PG, "neutral")}:                       Quindi riesci a trovare parti di te che altrimenti non vedresti?
                    -> glyph_choice_manager(false, waterC)->
            {charTag(FirstCharacter, "neutral")}:               Esatto.
            {charTag(FirstCharacter, "sad")}:                   Non sono proprio bravissima a vedermi.
            {charTag(FirstCharacter, "annoyed")}:               Per quanto mi tiri un sacco di pipponi, lo so.
            {charTag(FirstCharacter, "neutral")}:               Ma mentre creo, mi vedo davvero.

            + \ {charTag(PG, "neutral")}:                       Dipende da cosa ci fai poi, con quel benessere.
                -> glyph_choice_manager(false, fireC)->
            {charTag(FirstCharacter, "neutral")}:               Un pisolino?

            //più terra
            + \ {charTag(PG, "neutral")}:                       Immaginare plasma il cervello, per cui sì, è empiricamente sensato.
                -> glyph_choice_manager(false, earthC)->
            {charTag(FirstCharacter, "neutral")}:               Ora facciamo un gioco, {player_name}.
            {charTag(FirstCharacter, "affectionate")}:          Prova a immaginare di essere una persona affettuosa, gentile.
                                                                Empatica.
            {charTag(FirstCharacter, "annoyed")}:               Lo senti?
                                                                Lo senti il tuo cervello cambiare?
            -    

        {charTag(FirstCharacter, "neutral")}:                   Ciotole pulite!
                                                                Do una sciacquata anche ai bicchieri, che ho visto che c'è del vino rosso sotto al lavello.
                                                                O è una bomba o ci avvelena.
        {charTag(FirstCharacter, "curious")}:                   E tu {player_name} hai qualcosa che ti aiuta a star bene con te? 
            
            -> kitchen_moon_feedback -> 

            + (earth1)\ {charTag(PG, "neutral")}:               <i>Lesso sportivamente delle patate.</i>
                ~ kitchen_recipeNoun = "Patate"
                -> glyph_choice_manager(true, earthC)->
            {charTag(FirstCharacter, "curious")}:               Ti ci vedo a correre e scaricare il nervo. 
                                                                O in piscina.
                                                                O a ballare.
            {charTag(FirstCharacter, "neutral")}:               Uh, sarà un caso che non ho citato sport di gruppo?

            + (air1)\ {charTag(PG, "neutral")}:                 <i>Friggo con creatività delle mele.</i>
                ~ kitchen_recipeNoun = "Mele"
                -> glyph_choice_manager(true, airC)->
            {charTag(FirstCharacter, "affectionate")}:          Lo sapevo!
            {charTag(FirstCharacter, "neutral")}:               Ecco perché mi sento capita da te.
                                                                {player_pronoun has her:unite|unit3} dalla creatività!

            //rendi più fuoco
            + (fire1)\ {charTag(PG, "neutral")}:                <i>Arrostisco scientemente delle melanzane.</i>
               ~ kitchen_recipeNoun = "Melanzane"
               -> glyph_choice_manager(true, airC)->
            {charTag(FirstCharacter, "neutral")}:               Ennio fa qualcosa di simile.
                                                                Quando è teso si mette a studiare qualcosa che ama.
                                                                O a fare esercizi di fisica.
                                                                Quando ha perso il lavoro ha passato un intero fine settimana a fare calcoli prima di dire: "Ok, ora me ne cerco uno nuovo".
        
            +(water1) \ {charTag(PG, "neutral")}:               <i>Griglio amichevolmente delle pesche.</i>
                ~ kitchen_recipeNoun = "Pesche"
                -> glyph_choice_manager(true, waterC)->
            {charTag(FirstCharacter, "affectionate")}:          Stare assieme è una cosa che cura molte ferite.
            {charTag(FirstCharacter, "sad")}:                   Forse a volte ho bisogno però di star da sola.
            {charTag(FirstCharacter, "neutral")}:               Ma mi rendo conto che per altre persone la socialità è una medicina.
    
            +(aether1) \ {charTag(PG, "neutral")}:              <i>Abbrustolisco meditativamente delle bietole.</i>
                ~ kitchen_recipeNoun = "Bietole"
                -> glyph_choice_manager(true, aetherC)->
            {charTag(FirstCharacter, "neutral")}:               Ci ho provato mille volte.
            {charTag(FirstCharacter, "annoyed")}:               Ma non so, non riesco a starmene ferma.
            {charTag(FirstCharacter, "neutral")}:               Però gli "ohm" mi piacciono.
            {charTag(FirstCharacter, "affectionate")}:          Mi vibra tutta la pancia.
            -  
        
        {charTag(FirstCharacter, "neutral")}:                   Abbasso la fiamma un attimo.
                                                                Come si fa con questa legna?
        {charTag(FirstCharacter, "affectionate")}:              Però che odore buono, vero?
        {charTag(FirstCharacter, "neutral")}:                   Cominciare a lavorare mi ha aperto a problemi che non avevo mai considerato.
        {charTag(FirstCharacter, "sad")}:                       A volte sono così stanca che proprio non ci riesco a comporre qualcosa.
        {charTag(FirstCharacter, "annoyed")}:                   Manco a suonare e bona.
        {charTag(FirstCharacter, "neutral")}:                   E allora il mio cervello si mette a creare musica mentre cerco di dormire.
        {charTag(FirstCharacter, "annoyed")}:                   Col risultato che mi sveglio stanca morta.
                                                                Frustrata perché non ricordo mezzo accordo.
                                                                O lo ricordo, ma devo correre da qualche parte e poi lo perdo.
        {charTag(FirstCharacter, "neutral")}:                   Però non è solo quello.
        {charTag(FirstCharacter, "sad")}:                       Per la prima volta mi sto chiedendo: esisterei ancora, se non potessi creare?
        {charTag(FirstCharacter, "neutral")}:                   Perché l'ho fatto da sempre, {player_name}.
                                                                Papà dice sempre che ho imparato prima a creare con lo xilofono che a parlare.
                                                                Puoi essere ancora te se perdi qualcosa che ti ha sempre caratterizzatə?
        //Rendi terra
            + \ {charTag(PG, "neutral")}:                       Il carattere è solo una funzione del tuo cervello.
                    -> glyph_choice_manager(false, earthC)->
            {charTag(FirstCharacter, "affectionate")}:          Questa è una bellissima notizia!
            {charTag(FirstCharacter, "annoyed")}:               Perché a questo punto posso smettere di essere un disastro ansioso.
            {charTag(FirstCharacter, "affectionate")}:          Dai, dimmi come fare {player_name}!
                                                                Dimmi come resettarmi il cervello!
               
            + \ {charTag(PG, "neutral")}:                       Sei le relazioni che hai, e per questo non potrai mai perderti.
                    -> glyph_choice_manager(false, waterC)->
            {charTag(FirstCharacter, "affectionate")}:          A volte mi rendo conto di usare frasi o modi di fare di chi voglio bene.
            {charTag(FirstCharacter, "neutral")}:               Mi sento composta anche dalle persone che amo.
            {charTag(FirstCharacter, "sad")}:                   Quando l'ho detto a Talco mi ha detto che è spaventoso, che è come perdersi.
            {charTag(FirstCharacter, "neutral")}:               Ma per me è il contrario: è tipo come avere delle boe dentro di me con cui orientarmi.
                                                                Ha senso?

            //rendi aria
            + \ {charTag(PG, "neutral")}:                       Se non riesci a suonare, la tua creatività trova altri sfoghi?
                    -> glyph_choice_manager(false, airC)->
                {charTag(FirstCharacter, "affectionate")}:      Sì, tantissimo.
                {charTag(FirstCharacter, "neutral")}:           Nei sogni.
                                                                Oppure a volte sono lì che lavoro e mi chiedo: "E se invece..."?
                                                                E finisco per farmi i film sui clienti.
                {charTag(FirstCharacter, "annoyed")}:           Anche se poi il capo mi chiede perché sto sorridendo invece di pulire i tavoli.
                {charTag(FirstCharacter, "neutral")}:           Effettivamente è una cosa che non mi abbandona mai.

            + \ {charTag(PG, "neutral")}:                       Perdersi non è così male, potresti ritrovarti in modi inaspettati.
                    -> glyph_choice_manager(false, aetherC)->
            {charTag(FirstCharacter, "neutral")}:               Da piccola mi sono persa nel bosco.
                                                                La cosa sarà durata tre ore.
            {charTag(FirstCharacter, "affectionate")}:          E ho imparato una cosa assurda: che sono meno fifona di quanto penso.
                                                                E che nei casini me la sfango bene.
            {charTag(FirstCharacter, "neutral")}:               Per cui sì, mi suona tantissimo quello che hai detto.

            + \ {charTag(PG, "neutral")}:                       Sono i tuoi obiettivi a dirti chi sei, {charNameOne}!
                    -> glyph_choice_manager(false, fireC)->
            {charTag(FirstCharacter, "annoyed")}:               La maggior parte delle volte il mio obiettivo è "non dover campare a crackers ogni fine mese".
                                                                O "pagare in qualche modo la bolletta dell'acqua".
                                                                O "non piangere in bagno a lavoro".
            {charTag(FirstCharacter, "neutral")}:               Cosa dicono di me questi obiettivi?
            -
        {charTag(FirstCharacter, "affectionate")}:              Che botta questo vino comunque.
        {
            - secondChar_storyStatus == story_storyStarted:
            {charTag(FirstCharacter, "annoyed")}:               Devo metterlo in alto, non vorrei mai che {charNameTwo} provasse a berlo.
            
            - else:
            {charTag(FirstCharacter, "curious")}:               Dovrei proporre un brindisino a {charNameFive}, e farci due chiacchiere in scialleria. 
        }
        {charTag(FirstCharacter, "curious")}:                   Tu {player_name} ti senti te? 
        {charTag(FirstCharacter, "annoyed")}:                   Domanda idiota.
        {charTag(FirstCharacter, "neutral")}:                   Ti senti la persona che puoi essere?
                                                                La persona che avresti voluto essere?
                                                                O ti senti qualcosa che non vorresti essere?
        {charTag(FirstCharacter, "annoyed")}:                   E sì, se ripeto ancora "essere" puoi mandarmi a sbucciare patate per tutto il giorno.

            +(fire2) \ {charTag(PG, "neutral")}:                <i>Frullo della zucca camminando in avanti.</i>
                ~ kitchen_recipeAdjective = "progressità"
                -> glyph_choice_manager(true, fireC)->
            {charTag(FirstCharacter, "affectionate")}:          C'è anche qualcosa di bello nel sapere che si sta compiendo la propria strada, vero?

            + (earth2)\ {charTag(PG, "neutral")}:               <i>Pesto dell'ortica con statica soddisfazione.</i>
                ~ kitchen_recipeAdjective = "soddisfazione"
                -> glyph_choice_manager(true, earthC)->
                {charTag(FirstCharacter, "sad")}:               Vorrei sapere cosa si prova ad esser al proprio posto.
                {charTag(FirstCharacter, "neutral")}:           Ti guardo e mi sembri una persona equilibrata.
                                                                Deve essere bello.

            //più aria? 
            + (air2)\ {charTag(PG, "neutral")}:                 <i>Schiaccio dei rapanelli girando in tondo.</i>
               ~ kitchen_recipeAdjective = "blocchità"
               -> glyph_choice_manager(true, airC)->
                {charTag(FirstCharacter, "annoyed")}:           Già.
                                                                Ne hanno voglia a dire "conosci te stessə" e tutte quelle robe lì.
                {charTag(FirstCharacter, "sad")}:               Ma alla fine il più delle volte invece di avanzare, continui a girare su te stessə.
        
            + (water2)\ {charTag(PG, "neutral")}:               <i>Pulisco dei finferli arretrando.</i>
                ~ kitchen_recipeAdjective = "retrocessione"
                -> glyph_choice_manager(true, waterC)->
            {charTag(FirstCharacter, "neutral")}:               Uh.
                                                                Spero tu non viva male questa cosa.
            {charTag(FirstCharacter, "neutral")}:               Per quanto può valere, tornare sui propri passi credo sia sempre un segno del conoscersi meglio.
                                                                Almeno sai dove non vuoi andare.

            //più spirito?
            + (aether2)\ {charTag(PG, "neutral")}:              <i>Sciacquo confusamente della lattuga.</i>
                ~ kitchen_recipeAdjective = "confusione"
                -> glyph_choice_manager(true, aetherC)->
            {charTag(FirstCharacter, "neutral")}:               A volte è solo questione di tempo, vero?
                                                                Prima di capire dove andare.
                                                                O magari è un momento per fermarsi e riposare.
                                                                Ha senso?
            -      
    
        {charTag(FirstCharacter, "neutral")}:                   Il sapore è ottimo, aggiusto appena appena di sale.
                                                                Comunque per me creare non è solo una cosa per me, per stare bene.
                                                                È gettare un ponte.
                                                                C'è sia quella cosa di prima dell'acqua antica la storia blah blah blah.
        {charTag(FirstCharacter, "affectionate")}:              Ma è anche un ponte con la storia delle persone che ho conosciuto.
        {charTag(FirstCharacter, "neutral")}:                   Quelle legate alla musica, come mio padre o le compagne del conservatorio o le ragazze della band.
                                                                E anche chi con la musica ha avuto poco a che fare, come Ennio o le colleghe di lavoro.
        {charTag(FirstCharacter, "curious")}:                   Creare secondo me significa immaginare nuovi collegamenti. 
                                                                Anche tra persone che non si conoscono.
        {charTag(FirstCharacter, "affectionate")}:              E fare da testimone di queste storie.
        {charTag(FirstCharacter, "neutral")}:                   Trovare l'universale nel particolare, per non perderci.
                                                                Per ritrovarci.
                                                                E a quel punto mi sale un po' un'altra domanda.
        {charTag(FirstCharacter, "curious")}:                   Perché se ciò che creo viene dagli scambi quotidiani, dai ricordi creati assieme, allora di chi è l'opera che si crea? 

            + \ {charTag(PG, "neutral")}:                       Tua: chi l'ha fatta la fatica, il lavoro?
                -> glyph_choice_manager(false, fireC)->
            {charTag(FirstCharacter, "annoyed")}:               E la fatica attorno a me?
                                                                Pensa ai vicini che si sentono le prove fino a tardi?
                                                                Le sere in cui ho dato buca ad Ennio perché presa dalla creazione.
                                                                Le riflessioni infinite con Valeria e le altre per capire cosa non funziona e cosa sì.
                                                                Non è fatica la loro? Non è lavoro? 

            + \ {charTag(PG, "neutral")}:                       Non è comunque il tuo punto di vista a crearla?
                -> glyph_choice_manager(false, airC)->
                {charTag(FirstCharacter, "annoyed")}:           Avrei di che ridire anche su questo.
                                                                Perché è un punto di vista creato con le altre persone, no?
                {charTag(FirstCharacter, "sad")}:               Scusa, sicuramente le tue intenzioni sono buone, ma questa cosa non so perché mi urta tantissimo.                                 

            + \ {charTag(PG, "neutral")}:                       Di chi la ascolta, la legge, la guarda, creando un rapporto con te.
                -> glyph_choice_manager(false, waterC)->
            {charTag(FirstCharacter, "neutral")}:               Mmm.
                                                                Ci sta.
                                                                Anche se è un po' sempre quella roba "separare l'opera dall'autorə".
            {charTag(FirstCharacter, "annoyed")}:               Che mi fa tanto "Critico J.K.Rowling ma spendo soldi in roba di Harry Potter".
            {charTag(FirstCharacter, "affectionate")}:          Però l'idea del rapporto con chi mi ascolta mi piace molto molto molto.

            + \ {charTag(PG, "neutral")}:                       Dell'acqua, e delle sue infinite storie.
                -> glyph_choice_manager(false, aetherC)->
            {charTag(FirstCharacter, "affectionate")}:          È una bella visione.
                                                                Così mi inserisco in una lunga conversazione, che non è né l'inizio né la fine.
            {charTag(FirstCharacter, "neutral")}:               E fa meno paura ogni prova, ogni rischio.
            
            + \ {charTag(PG, "neutral")}:                       Quando ti diverti con qualcuno, non ti chiedi di chi è cosa.
                -> glyph_choice_manager(false, earthC)->
                {charTag(FirstCharacter, "neutral")}:           Good point.
                {charTag(FirstCharacter, "annoyed")}:           Ma {player_name}, hai visto anche tu che non so stare senza farmi domande complicate, vero?
            -
        
        {charTag(FirstCharacter, "annoyed")}:                   Merda, credo di aver raggiunto dei livelli di pesantezza da record.
        {charTag(FirstCharacter, "sad")}:                       Perdonami {player_name}.
        {charTag(FirstCharacter, "neutral")}:                   Il vino mi rende filosofica.
        {charTag(FirstCharacter, "annoyed")}:                   O solo idiota.
        {charTag(FirstCharacter, "neutral")}:                   Riposati un secondo, controllo io che non bruci tutto.
        {charTag(FirstCharacter, "curious")}:                   Ma a proposito di scambi quotidiani: quando crei qualcosa, la tieni per te?
                                                                O la condividi?


            + (fire3)\ {charTag(PG, "neutral")}:                <i>Brucio del peperoncino.</i>
                ~ kitchen_recipeComplement = "peperoncino bruciato"
                -> glyph_choice_manager(true, fireC)->
            {charTag(FirstCharacter, "sad")}:                   Merda.
            {charTag(FirstCharacter, "neutral")}:               Spero non per insoddisfazione.
            {charTag(FirstCharacter, "sad")}:                   Perché non so te, ma è dura essere soddisfattə di quello che si crea.

            + (aether3)\ {charTag(PG, "neutral")}:              <i>Spargo ovunque del cardamomo.</i>
                ~ kitchen_recipeComplement = "cardamomo sparso"
                -> glyph_choice_manager(true, aetherC)->
            {charTag(FirstCharacter, "neutral")}:               Hai creato qualcosa, vuoi che lo conoscano più persone possibile.
                                                                Credo.
             
            + (earth3)\ {charTag(PG, "neutral")}:               <i>Seleziono dei chiodi di garofano.</i>
               ~ kitchen_recipeComplement = "chiodi di garofano selezionati"
               -> glyph_choice_manager(true, earthC)->
            {charTag(FirstCharacter, "neutral")}:               Anche a me piace condividere solo con la cerchia ristretta di am3.
            {charTag(FirstCharacter, "neutral")}:               Mi fa sentire al sicuro.
            {charTag(FirstCharacter, "sad")}:                   Ma a volte da quella bolla ci devo uscire.
                                                                O finisce per essere una conversazione privata.
        
            + (water3)\ {charTag(PG, "neutral")}:               <i>Copro dello zenzero.</i>
                ~ kitchen_recipeComplement = "zenzero coperto"
                -> glyph_choice_manager(true, waterC)->
            {charTag(FirstCharacter, "neutral")}:               Tieni le tue creature per te.
            {charTag(FirstCharacter, "curious")}:               Sarà un gesto di affetto o di insicurezza? 
                                                                O una lotta all'idea che tutto debba essere produttivo?
            {charTag(FirstCharacter, "neutral")}:               Sarei curiosa di scoprirlo.

            //non è proprio una risposta da aria, se è una cosa creativa
            + (air3)\ {charTag(PG, "neutral")}:                 <i>Aggiungo con disinteresse del cumino.</i>
                ~ kitchen_recipeComplement = "cumino disinteressato"
                -> glyph_choice_manager(true, airC)->
            {charTag(FirstCharacter, "neutral")}:               Quello che conta è creare e basta per te, quindi?
                                                                Ha senso.
                                                                Dovrei farlo anche io ogni tanto.
            -   
            -> fourth_ingredient_dispatcher
    
    
    //La chiusura è comune, sempre per ridurre il rischio di errori
    = fourth_ingredient_dispatcher
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)

    {charTag(FirstCharacter, "affectionate")}:                  {player_name}, qui a me sembra tutto pronto, non trovi?
    
    {
        - backpack_findedGifts == (): 
        {charTag(TheWitch, witch_state())}:                     <i>{player_name} non ha ingredienti speciali da aggiungere.</i>
            -> at_table_with_first_char
            
        - else:
            -> add_ingredient
    
    }
    
        = add_ingredient
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour= translator(fourthChar_ActualName)
        ~ temp charNameFive= translator(fifthChar_ActualName)
    
        
        {charTag(TheWitch, witch_state())}:                     <i>Il giusto ingrediente renderà la ricetta di {player_name} e {charNameOne} musicale.</i>
                                                                <i>E {player_name} potrebbe capire un po' meglio {charNameOne}.</i>
    
            + \ {charTag(PG, "neutral")}:                       <i>Aggiungo un ingrediente speciale.</i>
                -> grimoire_greenhouse_gifts_and_ingredient ->

                //Dopo di che associo la scelta fatta alla PNG
                ~ kitchen_firstCharExtraIngredient = grimoire_chosenPlant
                //E svuoto la variabile del grimorio
                ~ grimoire_chosenPlant = ()
                //E poi chiamo la funzione per aggiornare i valori
                ~ object_value_for_PNG(kitchen_firstCharExtraIngredient, Kitchen, FirstCharacter)
                //E il nome dell'ingrediente
                ~ extra_ingredient_name(kitchen_firstCharExtraIngredient)
            
        
            + \ {charTag(PG, "neutral")}:                       <i>Non aggiungo altro.</i>
            -
            
        {charTag(FirstCharacter, "neutral")}:                   Andiamo a mangiare, ama!
            -> at_table_with_first_char



=== at_table_with_first_char
    -> grimoire_storylets_updater -> 
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive= translator(fifthChar_ActualName)

    ~ move_entity(CookingWithFirstCharOBJ, Kitchen)
    ~ move_entity(EatingWithFirstCharOBJ, Kitchen)
    ~ temp piatto = kitchen_tempRecipeName
    
    ~ recipe_name_creator()
    ~ recipe_name_storage(FirstCharacter)
    
    {charTag(FirstCharacter, "curious")}:                       È stato divertente cucinare assieme, {player_name}. 
    {charTag(FirstCharacter, "affectionate")}:                  Mi ha fatta sentire a casa.
    {
        -grimoire_firstChar has grimFirstCharKitchenOne:
        {charTag(FirstCharacter, "neutral")}:                   E non mi facevo certe domande da molto.
                                                                Mi ha fatto bene parlare di rapporti.
        {charTag(FirstCharacter, "affectionate")}:              Grazie di cuore, davvero.

        -grimoire_firstChar has grimFirstCharKitchenTwo:
        {charTag(FirstCharacter, "neutral")}:                   E non avevo mai pensato fino in fondo al discorso del salvare il mondo etc etc.
                                                                Parlarne con te mi ha reso le idee molto più chiare.
        {charTag(FirstCharacter, "affectionate")}:              Grazie, davvero.
        
        -grimoire_firstChar has grimFirstCharKitchenThree:
        {charTag(FirstCharacter, "neutral")}:                   E discutere di creatività.
        {charTag(FirstCharacter, "sad")}:                       Mamma, quanto vorrei avere la mia tastiera, ora.
        {charTag(FirstCharacter, "neutral")}:                   Ma a prescindere, parlarne mi ha aiutata tantissimo.
        {charTag(FirstCharacter, "affectionate")}:              Grazie mille, sei un tesoro.

    }
    {charTag(FirstCharacter, "affectionate")}:                  E poi questo {piatto}!
                                                                Spacca, non trovi?
    
    {
        - kitchen_firstCharExtraIngredientReaction != notReaction:
            -> extra_ing_feedback
        
        - else:
        {charTag(FirstCharacter, "affectionate")}:              E ho la pancia strapiena ora.
            -> relationship_feedback
            
    }
        
        

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
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour= translator(fourthChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)
            
                -> kitchen_moon_feedback -> 

        {charTag(FirstCharacter, "affectionate")}:              Aggiungere {ingredientTranslator(kitchen_firstCharExtraIngredient)} è stato un tocco geniale.
                                                                Mi è arrivato proprio al cuore.
        {
            - kitchen_firstCharExtraIngredient == universalIngredient:
            {charTag(FirstCharacter, "affectionate")}:          Ha un retrogusto di festa in famiglia.
                                                                Mi ha ricorda i cenoni di Natale, quando ero piccola.
                                                                Ed ero felicissima perché mamma mi permetteva di cucinare con lei.
                                                                E presa dall'attesa di scoprire che regalo avrei ricevuto il giorno dopo.
        }
        {charTag(FirstCharacter, "neutral")}:                   Sai, so che non è sempre facilissimo capire come ragiono.
                                                                Però a me sembra tutto abbastanza limpido.
        {charTag(FirstCharacter, "annoyed")}:                   Alla fine basta non riempirmi di commenti rigidini e razionali quando parliamo.
        {charTag(FirstCharacter, "neutral")}:                   Non mi fraintendere, non sono qui per dire che la terra è piatta o altra roba del genere.
        {charTag(FirstCharacter, "annoyed")}:                   Ma solo che mi trovo più a mio agio con le cose emotive, che non con i dati freddi e distaccati.

            -> relationship_feedback
    
    = bad_reaction
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour= translator(fourthChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)
    

            -> kitchen_moon_feedback ->  

        {charTag(FirstCharacter, "annoyed")}:                   Aggiungere {ingredientTranslator(kitchen_firstCharExtraIngredient)} è stata una scelta.
                                                                Una scelta terribile, {player_name}.
        {charTag(FirstCharacter, "neutral")}:                   Per fortuna che ho una fame bestiale.

            -> relationship_feedback

    
    = meh_reaction
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour= translator(fourthChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)

            
            -> kitchen_moon_feedback -> 

        {charTag(FirstCharacter, "neutral")}:                   L'aggiunta di {ingredientTranslator(kitchen_firstCharExtraIngredient)} mi ha confusa.
                                                                È come.
                                                                Uh, non so se hai presente.
                                                                Quando parli con una persona sai cosa ami, e sai cosa detesti.
                                                                E poi ci sono quelle cose che stanno nel mezzo, che non ti fanno nulla.
        {charTag(FirstCharacter, "annoyed")}:                   Tipo, per me è quando una persona mi dice sempre che si risolve tutto facendo cose.
                                                                O con la rabbia.
                                                                Oppure che non prende mai troppo il mondo sul serio.
        {charTag(FirstCharacter, "affectionate")}:              Cioè, mi piace fare casino, ma ogni tanto.
        {charTag(FirstCharacter, "neutral")}:                   E quindi boh, il sapore di {ingredientTranslator(kitchen_firstCharExtraIngredient)} è come questa roba a metà, che non mi dice niente.
                                                                Ma non mi fa manco schifo.
            -> relationship_feedback
        
    
        
    = relationship_feedback
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour= translator(fourthChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)

        {charTag(FirstCharacter, "neutral")}:                   Comunque {player_name}, stavo pensando alla nostra conversazione qui, assieme.
                                                                E se basandomi solo su questa chiacchierata in cucina dovessi dire: ho appena conosciuto {player_name}, vorrei farci amicizia?
        
        //Prima di tutto chiamo la funzione per il calcolo dello stato della relazione
        ~ affinity_calc(FirstCharacter)
        //Così poi posso dare il feedback
    {
        - firstChar_relationshipStatus == negative:
            {charTag(FirstCharacter, "annoyed")}:               Credo che la risposta sia no.
            {charTag(FirstCharacter, "neutral")}:               Non sei tu, sia chiaro.
                                                                E non sono io.
                                                                Ma piuttosto, le cose che sono per te importanti non lo sono per me.
            {charTag(FirstCharacter, "annoyed")}:               È come se guardassimo il mondo con due paia di occhiali molto diversi.
            {charTag(FirstCharacter, "neutral")}:               Ma non ti preoccupare: abbiamo ancora un sacco di chiacchierate da fare per conoscerci, no?

                ~ grimoire_firstChar += grimFirstCharKitchenNegativeReaction
            
        - firstChar_relationshipStatus == neutral:
            {charTag(FirstCharacter, "neutral")}:               Credo che la risposta sia "{player_pronoun has him:rimandato|{player_pronoun has her:rimandata|rimandatə}} a settembre".
            {charTag(FirstCharacter, "sad")}:                   Un po' ci capiamo e un po' no.
            {charTag(FirstCharacter, "curious")}:               Che poi ci sta, no? 
            {charTag(FirstCharacter, "neutral")}:               Alla fine ci stiamo conoscendo giusto ora.
                                                                E abbiamo ancora un bel po' di chiacchierate da farci assieme, e capirci di più.
            {charTag(FirstCharacter, "annoyed")}:               O di meno.

                ~ grimoire_firstChar += grimFirstCharKitchenNeutralReaction

        - firstChar_relationshipStatus == positive:
            {charTag(FirstCharacter, "affectionate")}:          La risposta è sicuramente "sì".
            {charTag(FirstCharacter, "neutral")}:               Vediamo il mondo in modo simile.
                                                                E non credo che l'amicizia debba coincidere con l'essere la stessa persona, assolutamente no.
                                                                Però avere gli stessi valori aiuta a capirsi, a costruire cose assieme.
            {charTag(FirstCharacter, "affectionate")}:          E posso dirti per ora che sei una persona che mi dà fiducia, {player_name}.
                                                                Sono felice di starti conoscendo.

                ~ grimoire_firstChar += grimFirstCharKitchenPositiveReaction
    }
            
            -> ending_cooking_with_first_char
            
        
=== ending_cooking_with_first_char
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)

    
    {charTag(FirstCharacter, "neutral")}:                       E ora {player_name}, credo mi farò due passi.
                                                                Mi sento piena e soddisfatta.
    {charTag(FirstCharacter, "affectionate")}:                  Grazie ancora per questo tempo assieme.
    - 

                ~ cooking_animations_off()
                ~ move_entity(FirstCharacter, Pond)
                ~ move_entity(FirstCharacterCucina, Safekeeping)
                ~ kitchen_firstCharCookingTogetherInvite = false
                ~ kitchen_allChefs += FirstCharacter
                ~ kitchen_kitchenOccupied = false
                ~ update_glyphs(FirstCharacter)
            -> first_char_closing_storylet ->
            -> achievements_onGame_statusUpdate_GM ->
            -> main




/* ---------------------------------

   Altri storylets legati alla cucina 

 ----------------------------------*/
=== first_char_cooking_alone
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)

    {debug: passo per first_char_cooking_alone.}
    ~ cooking_animations_on()
        
    {kitchen_firstCharCookingTime:

        - 0:
            {charTag(FirstCharacter, "neutral")}:           {Voglio preparare il piatto preferito di mio padre.|Scusami {player_name}, ma sto cucinando.}

        - 1:
            {charTag(FirstCharacter, "neutral")}:           {Voglio preparare il piatto preferito di mio padre.|Scusami {player_name}, ma sto cucinando.}
            
        - 2:
            {charTag(FirstCharacter, "neutral")}:           {Potrei sostituire l'aneto con, uh, no, non una buona idea.|Perdonami {player_name}, ma sto cercando qualcosa che non mi avveleni.}
        
        - 3:
            {charTag(FirstCharacter, "neutral")}:           {Ricordati ragazza che cucinare non è una scusa per bere. Ma che gioia aver trovato del vinello. |Torna dopo {player_name}, devo, ehm, riflettere.}
            
        - 4:
            {charTag(FirstCharacter, "neutral")}:           {Quante possibilità ci sono che se caccio la mano nell'alveare della serra riesco a recuperare del miele?|{player_name}, ho un'idea stupida, torna dopo.}
        
        - 5:
            {charTag(FirstCharacter, "neutral")}:           {Uh, questo sughino spacca. Mamma ne sarebbe orgogliosa.|{player_name}, ho bisogno di concentrazione, a dopo.}
    
        - 6:
            {charTag(FirstCharacter, "neutral")}:           {Sarà una buona idea avere tutti questi coltelli accessibili con il bimbo in giro in giro? Merda, stavo per tagliarmi. Forse sono io il problema, non lui.|{player_name}, faccio danni già da sola, torna tra un po'.}
        
        - 7:
            {charTag(FirstCharacter, "neutral")}:           {Tocco finale, la crema di funghi. E ora lasciamo cuocere un po'. E ci beviamo un altro goccino.|{player_name}, resisti che ho quasi finito!}
        
        - else:
            {charTag(FirstCharacter, "neutral")}:           {Direi che ci siamo. Giusto la fiammata per restringere il brodo, ed è perfetta!|{player_name}, un attimo e ti lascio i fornelli, promesso.}
        
    }
    
    -> first_char_closing_storylet ->
    -> main


=== food_gift_first_char
{debug: passo per food_gift_first_char.}
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)

    
    {charTag(FirstCharacter, "neutral")}:                   Cucinare da sola prima è stato un momento terapeutico.
    {charTag(FirstCharacter, "affectionate")}:              E non lo dico solo perché mi sono sparata un bel po' di vinello.
                                                            Per me la tavola è lo spazio più bello di una casa perché amo mangiare con le altre persone.
                                                            E amo quando mangiano quello che cucino.
    {charTag(FirstCharacter, "neutral")}:                   Credo sia una cosa che ho imparato da mia mamma.
    {charTag(FirstCharacter, "sad")}:                       Mamma non l'ho mai capita fino in fondo.
    {charTag(FirstCharacter, "neutral")}:                   Non è una che parla tantissimo.
                                                            Però ci tiene molto alle persone, e per fartelo capire fa cose.
                                                            Come cucinare.
    {charTag(FirstCharacter, "sad")}:                       Da quando vivo al nord è salita solo una volta.
    {charTag(FirstCharacter, "neutral")}:                   Lei e papà hanno dormito nella mia camera, mentre io ho dormito con Valeria.
    {charTag(FirstCharacter, "annoyed")}:                   Le coinqui erano in imbarazzo perché ha pulito tutta casa.
    {charTag(FirstCharacter, "neutral")}:                   E un giorno quando siamo uscite con papà a fargli fare il giro della città, lei è rimasta in casa da sola.
                                                            Siamo tornate, e aveva preparato praticamente un cenone della vigilia.
                                                            E ha tenuto conto del fatto che Valeria è vegana, e che a Irene non piacciono le cose rosse e tutta una serie di bisogni che ha capito in quei pochi giorni con loro.
    {charTag(FirstCharacter, "affectionate")}:              Credo che mamma sappia dire "Ti voglio bene" solo dietro ai fornelli.
    {charTag(FirstCharacter, "neutral")}:                   Non ti chiedo un'opinione, scusa, voglio tenermi ancorata ancora un po' a questa sensazione.
                                                            Ma a proposito di cenone della vigilia.
                                                            Da quando vivo su, ho iniziato a organizzare cenoni con le ame.
    {charTag(FirstCharacter, "affectionate")}:              Credo sia uno dei momenti più belli dell'anno.
                                                            Qui non c'è abbastanza roba per farlo, ma ho pensato di portare un po' di Natale comunque.
    {charTag(FirstCharacter, "curious")}:                   E quindi ti ho lasciato qualcosina su uno degli alberi della cucina. 
                                                            Spero possa portarti un po' di gioia, {player_name}.
    {charTag(FirstCharacter, "neutral")}:                   A dopo.

    -> first_char_closing_storylet ->
    ->->