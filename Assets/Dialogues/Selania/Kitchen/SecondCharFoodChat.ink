/* ---------------------------------

   Cucina con Riccio

 ----------------------------------*/
=== pre_start_cooking_with_second_char
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
    {charTag(SecondCharacter, "neutral")}:        Quando cuciniamo? 
    Quando cuciniamo?!? #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_energy
    {charTag(SecondCharacter, "emotional")}:        Cuciniamo ora?

        + \ {charTag(PG, "neutral")}:         Iniziamo!
            -> cooking_with_second_char
        
        + \ {charTag(PG, "neutral")}:         Ti chiedo ancora un attimo {charNameTwo}.
            Oooook.
            Aspetto.
            Ma poco poco {player_name}!
                -> main
  
 
 
=== cooking_with_second_char
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
    
    Sai {charNameTwo}, mentre cuciniamo potremmo parlare un po'.#speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral
        - (top)
    
    In particolare, ripensando alle nostre conversazioni, mi farebbe piacere parlare di più... #speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #ewWord:{em_state(Other)} #portrait:PG_neutral
        {
            - not first_char_main_storylets.nine:
                {charTag(TheWitch, witch_state())}:   <i>{charNameTwo} ha altri temi che vorrebbe condividere con {player_name}, ma vorrebbe che {player_name} prima lo conoscesse un po' meglio.</i>
        }

            + \ {charTag(PG, "neutral")}:         Parliamo di animali.
                    -> first_theme

            + \ {second_char_main_storylets.six} {charTag(PG, "neutral")}:         Della scuola.
                {
                    - second_char_main_storylets.six:
                        -> storage_glyphs(SecondCharacter)->
                        -> cooking_animations_on ->
                        -> second_theme
                    
                    - else:
                        -> top
                }
            
            + \ {second_char_main_storylets.eight} {charTag(PG, "neutral")}:         Delle bugie.
                {
                
                    - second_char_main_storylets.eight:
                        -> storage_glyphs(SecondCharacter)->
                        -> cooking_animations_on ->
                        -> third_theme
                    
                    - else:
                        -> top
                }
            
            + \ {charTag(PG, "neutral")}:         Ho cambiato idea.
                {charTag(SecondCharacter, "neutral")}:        Sì no boh.
                Allora vado a salutare la rana.

                    ~ kitchen_secondCharCookingTogetherInvite = false
                    ~ kitchen_secondCharCookingTogetherWaiting = 0
                    ~ move_entity(SecondCharacter, Pond)
            ->->

    
    = first_theme
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour= translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)

        Animaliiiiiiiiiiii!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
        {charTag(SecondCharacter, "neutral")}:        A casa ho una vecchia enciclopedia, era del papà, che è piena di disegni e cose sugli animali.
        E poi a un mercatino abbiamo trovato una collezione di riviste sugli insetti.
        E sul tablet ho tre app per riconoscere gli animali.
        E una me li fa vedere in casa, ed è DI-VER-TEN-TIS-SI-MO quando li faccio andare su cose sbagliate.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
        {charTag(SecondCharacter, "neutral")}:        Come il letto di mamma.
        O le vecchie videocassette di papà.
        Poi ho dei modellini di dinosauri.
        Che però ultimamente non mi piacciono più.
        Mentre mi piace disegnare animali inventati mettendo assieme pezzi diversi.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
        {charTag(SecondCharacter, "emotional")}:        Il mio preferito è il prociorso, che è un po' procione e un po' orso e mangia il miele ma lo puoi abbracciare.
        Perché l'orso ti mangerebbe la mano.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
        {charTag(SecondCharacter, "neutral")}:        Papà dice che sono fissato, ma mio fratello dice che sono molto intelligente e quindi è normale.
        {charTag(SecondCharacter, "emotional")}:        Ci mettiamo anche il cioccolato?
        Una volta ho fatto uno spettacolo a casa con il teatrino i disegni e gli animali inventati.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
        {charTag(SecondCharacter, "neutral")}:        Quando faccio queste cose chiamo tutta la famiglia.
        E mi fanno i complimenti e ridono però non lo so.
        Mi sembra che i grandi le cose le fanno perché devono.
        Non lo so mica se si divertono davvero.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic

            + \ {charTag(PG, "neutral")}:         Statisticamente sì, solo con cose diverse dai prociorsi.
                    -> glyph_modifier_variation_management(SecondCharacter, airC)->
                {charTag(SecondCharacter, "neutral")}:        Anche i prociorsi si divertono con cose diverse dai grandi.
                Una volta un prociorso ha passato due ore a rincorrere un gatto.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                E poi lui si è buttato in acqua.
                {charTag(SecondCharacter, "emotional")}:        E il gatto gli è stato sulla pancia, perché non sa nuotare.
               
            + \ {charTag(PG, "neutral")}:         \ {charNameTwo}: gli adulti devono imparare tanto dai bambini!
                -> glyph_modifier_variation_management(SecondCharacter, earthC)->
                {charTag(SecondCharacter, "neutral")}:        Si no boh.
                Io voglio insegnare tante cose agli adulti.
                Come si fanno gli aerei di carta.
                Perché le caramelle fanno bene.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                E che Elio aveva ragione sugli alieni da sempre e dovevano ascoltarlo.
    
            + \ {charTag(PG, "neutral")}:         Però tu stai comunque bene quando fai queste cose, no?
               -> glyph_modifier_variation_management(SecondCharacter, aetherC)->
               Sì!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
               Tantissimissimo!
               {charTag(SecondCharacter, "neutral")}:        A volte nemmeno mi accorgo del tempo che passa, e di cosa fanno le altre persone.
               {charTag(SecondCharacter, "emotional")}:        Mi piace!

            + \ {charTag(PG, "neutral")}:         Le cose hanno senso se hanno uno scopo. Fare per fare è inutile.
                -> glyph_modifier_variation_management(SecondCharacter, fireC)->
                {charTag(SecondCharacter, "neutral")}:        Sì no boh.
                Che noia.
                Franco fa tantissimissime cose senza senso.
                Ma sono le più migliori qui!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
        
            + \ {charTag(PG, "neutral")}:         Il cuore degli adulti è molto molto complicato, {charNameTwo}.
                -> glyph_modifier_variation_management(SecondCharacter, waterC)->
                {charTag(SecondCharacter, "neutral")}:        Che vuol dire?
                Anche noi abbiamo cose complicate!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                Tutti i compiti.
                I bulli.
                I grandi arrabbiati ma non si capisce mica mai perché. #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
            -    
        
        Ho una fame!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
        Ho anche trovato del cacao!
        {charTag(SecondCharacter, "neutral")}:        Ma a te come ti piace divertirti?

            -> kitchen_moon_feedback -> 
        
            + \ {charTag(PG, "neutral")}:         <i>Preparo una base per biscotti sportivi.</i>
                ~ kitchen_recipeNoun = "Biscotti"
                -> glyph_modifier_variation_management(PG, fireC)->
                {charTag(SecondCharacter, "neutral")}:        Bleah.
                Non i biscotti.
                Ma lo sport.
                Bleah!
               
            + \ {charTag(PG, "neutral")}:         <i>Stendo della sfoglia per brioches giocose.</i>
                ~ kitchen_recipeNoun = "Brioches"
                -> glyph_modifier_variation_management(PG, airC)->
                E a chi giochi?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                A me piace tantissimo fare quelli di intelligenza ora.
                Quando sono a casa di mio fratello posso starci tutto il tempo che voglio!
             
            + \ {charTag(PG, "neutral")}:         <i>Impasto un preparato per crostate socievoli.</i>
               ~ kitchen_recipeNoun = "Crostata"
               -> glyph_modifier_variation_management(PG, earthC)->
               {charTag(SecondCharacter, "neutral")}:        Nel senso che stai sempre con le persone?
               Sempre?
               Anche dopo la scuola e il lavoro?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
        
            + \ {charTag(PG, "neutral")}:         <i>Pulisco le formine per gelati artistici.</i>
                ~ kitchen_recipeNoun = "Gelato"
                -> glyph_modifier_variation_management(PG, aetherC)->
                {charTag(SecondCharacter, "neutral")}:        Mmm.
                So che è roba che piace a {charNameOne}.
                A me mi piace fare le cose.
                Ma non so se mi piace guardarle.
    
            + \ {charTag(PG, "neutral")}:         <i>Raffreddo la frutta per sorbetti sonnacchiosi.</i>
                ~ kitchen_recipeNoun = "Sorbetto"
                -> glyph_modifier_variation_management(PG, waterC)->
                {grimoire_firstChar has grimFirstSecondChar: Ancora con questa cosa del dormire!|Che balle dormire!}
                Ci sono così tante cose da fare!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                {charTag(SecondCharacter, "neutral")}:        Che noia!
            -
        Posso schiacciare qualcosa?##speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
        Mi piace schiacciare le cose perché alcune vanno dappertutto, altre fanno l'olio, altre sembrano dei dischi volanti!    
        E mi piace prevedere cosa succederà.
        {charTag(SecondCharacter, "neutral")}:        Mi piacciono le cose che si possono prevedere.
        Anche per questo mi piacciono gli animali.
        Non è che un leone all'improvviso fa il ragioniere.
        O un coniglio diventa campione di videogiochi.
        E poi gli animali non sono cattivi.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
        {charTag(SecondCharacter, "neutral")}:        Fanno le cose che devono fare.
        E litigano per le cose importanti per loro.
        Ma non fanno male solo perché gli piace fare male.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
        {charTag(SecondCharacter, "neutral")}:        A parte i gatti.
        Che non mi piacciono.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
        Però mi piace immaginare le persone come animali.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
        {charTag(SecondCharacter, "neutral")}:        Mi aiuta a capirle.
        E a prevedere di più cosa faranno.
        {charNameOne} per esempio mi ricorda un quokka perché con me è sempre giocosa.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
        {charTag(SecondCharacter, "neutral")}:        Mentre {mentorName} mi sembra un delfino perché sono simpatici fino a quando non sai cosa fanno davvero.
        E tu invece.
        No, dimmelo tu.
        Che animale sei?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy

            + \ {charTag(PG, "neutral")}:         L'affettuoso cane.
                    -> glyph_modifier_variation_management(SecondCharacter, waterC)->
                I cani copiano tantissime cose degli umani, lo sapevi?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                Quando cammini si muovono al tuo passo.
                #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                E se stai male stanno male anche loro.
                Ora che ci penso forse è meglio se non ce ne abbiamo uno a casa.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                
            + \ {charTag(PG, "neutral")}:         Il combattivo leone!
                    -> glyph_modifier_variation_management(SecondCharacter, fireC)->
                {charTag(SecondCharacter, "neutral")}:        Sì no boh.
                I leoni sono noiosi.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                {charTag(SecondCharacter, "neutral")}:        Dormono tantissimo.
                Come i gatti.
                Però da piccoli sono suuuuperincapaci di camminare.
                Quello è divertente.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
        
            + \ {charTag(PG, "neutral")}:         Il misterico corvo.
                    -> glyph_modifier_variation_management(SecondCharacter, aetherC)->
               Sai che i corvi si insegnano tra loro le cose?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
               {charTag(SecondCharacter, "neutral")}:        E che se li fai arrabbiare se lo ricordano per sempre.
               Una volta un amico di mamma ha spaventato un corvo con la sua moto.
               E ora tutte le volte che viene da noi il corvo gli graffia la moto!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
            
            + \ {charTag(PG, "neutral")}:         L'intelligente civetta.
                    -> glyph_modifier_variation_management(SecondCharacter, airC)->
                Sapevi che le civette vedono il calore con le orecchie?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                E che i piccoli quando piangono sembrano bambini?
                E poi non hanno.
                {charTag(SecondCharacter, "emotional")}:        Non hanno il sedere!
                Chissà se fanno le puzzette.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
               
            + \ {charTag(PG, "neutral")}:         Un{player_pronouns has him:o|{player_pronouns has her:a|ə}} prociors{player_pronouns has him:o|{player_pronouns has her:a|ə}}!
                    -> glyph_modifier_variation_management(SecondCharacter, earthC)->
                Sììììì!!!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                Possiamo tuffarci nell'acqua ora assieme?
                Mi insegni a nuotare?
                Rubiamo il miele alle api della serra?
                {charTag(SecondCharacter, "emotional")}:        Spaventiamo {charNameOne}?
                Mi fa ridere tantissimissimo quando urla!   
            -
        Il profumo è buono.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
        Ma quindi mangiamo solo dolce oggi?
        {charTag(SecondCharacter, "emotional")}:        Questa è una cosa bellissima!
        Ma tu capisci sempre le persone?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
        
            + \ {charTag(PG, "neutral")}:         <i>Aggiungo del caramello della perplessità.</i>
                ~ kitchen_recipeAdjective = "della perplessità"
                -> glyph_modifier_variation_management(PG, airC)->
                {charTag(SecondCharacter, "neutral")}:        Anche io.
                Sono così difficili.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                {charTag(SecondCharacter, "neutral")}:        È come capire degli animaletti strani.
                Come l'aye-aye o il rinopiteco.
                Ma almeno quello so che se piove starnutisce.
                Mentre mamma a volte è felice e a volte si arrabbia.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic

            + \ {charTag(PG, "neutral")}:         <i>Spolvero del cacao della convinzione.</i>
                ~ kitchen_recipeAdjective = "della convinzione"
                -> glyph_modifier_variation_management(PG, aetherC)->
                {charTag(SecondCharacter, "neutral")}:        Magari mentre siamo assieme capisco qualcosa da te allora.
                Magari.
             
            + \ {charTag(PG, "neutral")}:         <i>Verso dello sciroppo della negazione.</i>
               ~ kitchen_recipeAdjective = "della negazione"
               -> glyph_modifier_variation_management(PG, fireC)->
                {charTag(SecondCharacter, "neutral")}:        Magari allora puoi provare anche tu con gli animali.
                O un'altra cosa che ti piace.
                L'amico di mio fratello usa i segni zodiacali.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                Che non hanno assolutamente senso.
                {charTag(SecondCharacter, "neutral")}:        Contento lui.
                
            + \ {charTag(PG, "neutral")}:         <i>Grattugio della noce della vicinanza.</i>
                ~ kitchen_recipeAdjective = "della vicinanza"
                -> glyph_modifier_variation_management(PG, earthC)->
                {charTag(SecondCharacter, "neutral")}:        Si no boh.
                Le persone vicine mi sembrano ancora più incasinate.
                Per loro devo avere almeno tre animali per capirle.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
    
            + \ {charTag(PG, "neutral")}:         <i>Mescolo della vaniglia della solitudine.</i>
                ~ kitchen_recipeAdjective = "della solitudine"
                -> glyph_modifier_variation_management(PG, waterC)->
                {charTag(SecondCharacter, "neutral")}:        Già.
                Si no boh.
                Quindi capita anche alle altre persone.
                Wow.
            -      

        {charTag(SecondCharacter, "neutral")}:        Intanto preparo del succo.
        Ma non con le cose della serra, perché fanno cose strane.
        A me piacciono le cose strane.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
        Ma le persone mi dicono sempre che sono strano.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
        {charTag(SecondCharacter, "neutral")}:        La cosa che mi dicono di più a casa è "Ma perché fai così?!?!"
        Con un sacco di gesti delle mani.
        E io provo a spiegarlo ma mica mi capiscono.
        E poi si arrabbiano perché mi dicono delle cose ma non sono davvero le cose che vogliono.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
        {charTag(SecondCharacter, "neutral")}:        I grandi sono strani.
        Ti dicono una cosa ma ne vogliono un'altra e quindi tu sbagli sempre alla fine.
        E dicono a me che sono strano.

            + \ {charTag(PG, "neutral")}:         Serve metodo e disciplina per comunicare in modo efficace.
                    -> glyph_modifier_variation_management(SecondCharacter, airC)->
                Puoi dirlo un bambinese?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                Ogni volta che un grande dice "disciplina", è solo perché non c'ha voglia di capirmi.
                Come le maestre che mi mettono in castigo.
                Tutti mettono in castigo ma nessuno chiede il perché.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
               
            + \ {charTag(PG, "neutral")}:         Le cose strane sono divertenti!
                    -> glyph_modifier_variation_management(SecondCharacter, earthC)->
                Sì!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                Come le bussole, che sono suuuuperstrane!
                O quando la benzina fa gli arcobaleni per terra.
                O papà che si arrabbia con le persone in televisione.
             
            + \ {charTag(PG, "neutral")}:         Fregatene. Sii strano come va a te, {charNameTwo}!
                    -> glyph_modifier_variation_management(SecondCharacter, fireC)->
                {charTag(SecondCharacter, "neutral")}:        Sì no boh.
                Tu lo dici, ma mica sei tu ad andare in punizione!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
        
            + \ {charTag(PG, "neutral")}:         Spesso gli adulti non sanno cosa desiderano, amico mio.
                    -> glyph_modifier_variation_management(SecondCharacter, waterC)->
                {charTag(SecondCharacter, "neutral")}:        Sì no boh.
                Ma io che c'entro?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                Magari me lo possono dire invece di sgridarmi.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
    
            + \ {charTag(PG, "neutral")}:         Ciò che è strano porta risposte a domande che non ci siamo ancora fatt3.
                -> glyph_modifier_variation_management(SecondCharacter, aetherC)->
               {charTag(SecondCharacter, "neutral")}:        Eh?
               Però le domande mi piacciono.
               Anche se poi papà dice che gli rompo le palle.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
               {charTag(SecondCharacter, "neutral")}:        Ultimamente mi dice: "Chiedi al tablet, sant'Iddio!".
               {charTag(SecondCharacter, "emotional")}:        Così posso usare il tablet anche a cena.
            -
        
        {charTag(SecondCharacter, "neutral")}:        No non mettere lo zucchero a velo, non mi piace.
        Mi fa venire la tosse e poi mi sporco tutto!
        A me non piace essere strano.
        Io voglio essere me.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
        Nessuno dice a {mentorName} che è strana.
        {charTag(SecondCharacter, "neutral")}:        E lo è tanto. 
        Ma se si preoccupa tantissimo per qualcosa, {charNameOne} dice solo "Che ci vuoi fare, è {charNameTwo}".
        Voglio solo essere me.
        A te ti piace come ti trattano le altre persone?

            + \ {charTag(PG, "neutral")}:         <i>Guarnisco con delle ciliege deluse.</i>
                ~ kitchen_recipeComplement = "con ciliege deluse"
                -> glyph_modifier_variation_management(PG, airC)->
                {charTag(SecondCharacter, "neutral")}:        A mamma piace tanto quella parola.
                Delusa.
                Di solito quando dice "{charNameTwo}, mi hai delusa."#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                {charTag(SecondCharacter, "neutral")}:        Poi le ciliege deludono sempre.
                Te le ricordi più buone.
                Poi le mangi e bleah!
               
            + \ {charTag(PG, "neutral")}:         <i>Decoro con della granella soddisfatta.</i>
                ~ kitchen_recipeComplement = "con granella soddisfatta"
                -> glyph_modifier_variation_management(PG, earthC)->
                {charTag(SecondCharacter, "neutral")}:        Deve essere bello.
                Come l'amico di mio fratello.
                {charTag(SecondCharacter, "emotional")}:        Mio fratello dice che ha un cuore grande e gli vogliono tutti bene.
             
            + \ {charTag(PG, "neutral")}:         <i>Rifinisco con della glassa sofferente.</i>
               ~ kitchen_recipeComplement = "con glassa sofferente"
               -> glyph_modifier_variation_management(PG, waterC)->
                {charTag(SecondCharacter, "neutral")}:        Mmm.
                Mi dispiace.
        
            + \ {charTag(PG, "neutral")}:         <i>Aggiungo delle crema migliorante.</i>
                ~ kitchen_recipeComplement = "con crema migliorante"
                -> glyph_modifier_variation_management(PG, fireC)->
                {charTag(SecondCharacter, "neutral")}:        Nonna dice che tutto migliora, sempre.
                Però a me interessa più che una cosa arriva da qualche parte.
                Mica puoi migliorare all'infinito.
                Non c'ha senso.
    
            + \ {charTag(PG, "neutral")}:         <i>Spalmo della confettura altalenante.</i>
                ~ kitchen_recipeComplement = "con confettura altalenante"
                -> glyph_modifier_variation_management(PG, aetherC)->
                {charTag(SecondCharacter, "neutral")}:        Cioè che dipende dalle persone?
                O dalla persona?
                Come mamma che un giorno ti adora e poi il giorno dopo non ti parla più?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
            -  
        
        {charTag(SecondCharacter, "neutral")}:        Mi sa che questo dolce lo faccio anche a mio fratello.
            -> fourth_ingredient_dispatcher
    
    = second_theme
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

            Bleah.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
            Ma questa è una punizione!
            La scuola fa schifo.
            Ed è tutto lento.
            {charTag(SecondCharacter, "neutral")}:        Mi annoia tantissimo.
            A scuola sono sempre in punizione.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
            O prendo le note.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
            Ma mi annoio.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
            Mi annoio.
            Quando ci sono i compiti finisco subito.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
            {charTag(SecondCharacter, "neutral")}:        E non so mica cosa fare.
            A volte leggo.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
            A volte faccio cadere le cose per raccoglierle.
            {charTag(SecondCharacter, "neutral")}:        O vado in bagno.
            Ma si può andare in bagno solo una volta per lezione.
            Che è una cosa stupida.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
            {charTag(SecondCharacter, "neutral")}:        E infatti una volta Cristian della terza si è fatto la pipì addosso.
            {charTag(SecondCharacter, "emotional")}:        Mettiamo le noccioline?
            Le punizioni sono stupide.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                
                + \ {charTag(PG, "neutral")}:         E l3 ribelli si oppongono alle punizioni!
                        -> glyph_modifier_variation_management(SecondCharacter, fireC)->
                    {charTag(SecondCharacter, "neutral")}:        Però poi mi sgridano di più.
                    Una volta ci ho provato ma hanno chiamato mamma.
                    E mi hanno dato cinque note.
                    E mamma era così arrabbiata che mi ha chiuso in camera per un giorno intero.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic

                + \ {charTag(PG, "neutral")}:         È comprovato che le punizioni non siano efficaci.
                        -> glyph_modifier_variation_management(SecondCharacter, airC)->
                    LO SAPEVO!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                    {charTag(SecondCharacter, "neutral")}:        Ti fanno solo arrabbiare.
                    E piangere.
                    E a nessuno piace piangere!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
            
                + \ {charTag(PG, "neutral")}:         A chi fa bene la punizione? A chi la fa o a chi la subisce?
                        -> glyph_modifier_variation_management(SecondCharacter, aetherC)->
                    A me non mi fa mica bene.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                    {charTag(SecondCharacter, "neutral")}:        La maestra dice sempre "Mi dispiace metterti in punizione, davvero."
                    Ma io mica ci credo.
                    L'altra settimana mi ha messo in castigo otto volte.
                    Mi sa che non le dispiace così tanto.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry

                + \ {charTag(PG, "neutral")}:         Allora fai così tante cose sbagliate da rendere le punizioni inutili!
                        -> glyph_modifier_variation_management(SecondCharacter, earthC)->
                    {charTag(SecondCharacter, "neutral")}:        Uhm.
                    So dove la maestra di matematica nasconde i suoi dolci.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                    E poi come si apre l'armadio vietato di disegno.
                    E al bidello bruciano gli occhi quando tagliano l'erba!
                    
                + \ {charTag(PG, "neutral")}:         Chi punisce non riesce ad ascoltare il suo cuore.
                        -> glyph_modifier_variation_management(SecondCharacter, waterC)->
                    {charTag(SecondCharacter, "neutral")}:        Si no boh.
                    Mio fratello però dice una cosa come questa qui che hai detto tu.
                    Che papà è sempre arrabbiato perché non ascolta le sue emozioni.
                    Magari è una cosa dei grandi?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
            -
        
            Posso usare la grattugia?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
            Mi piace tanto grattugiare le cose!    
            {charTag(SecondCharacter, "neutral")}:        Mi puniscono, ma poi sono il più bravo.
            Che è una cosa ancora più stupida.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
            Tu sei {player_pronouns has him:il più bravo|{player_pronouns has her:la più brava|lə più bravə}} in quello che fai?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy

                -> kitchen_moon_feedback -> 
            
            + \ {charTag(PG, "neutral")}:         <i>Preparo un mediocre stampo da cupcake.</i>
                ~ kitchen_recipeNoun = "Cupcake"
                -> glyph_modifier_variation_management(PG, airC)->
                    {charTag(SecondCharacter, "neutral")}:        Nonna dice sempre che la virtù sta a metà.
                    Mamma dice che è una frase da perdenti.

            + \ {charTag(PG, "neutral")}:         <i>Pulisco le migliori formine da muffin.</i>
                ~ kitchen_recipeNoun = "Muffin"
                -> glyph_modifier_variation_management(PG, fireC)->
                    Sii.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                    Tra migliori ci capiamo!!!
             
            + \ {charTag(PG, "neutral")}:         <i>Infarino la peggior teglia per tartellette.</i>
               ~ kitchen_recipeNoun = "Tartellette "
               -> glyph_modifier_variation_management(PG, waterC)->
                    {charTag(SecondCharacter, "neutral")}:        Uh.
                    Io ad esempio sono il peggiore a ginnastica.
                    Solo Lara è peggio di me.
                    Ma mi batte a inglese.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
        
            + \ {charTag(PG, "neutral")}:         <i>Riscaldo l'unica piastra da waffle.</i>
                ~ kitchen_recipeNoun = "Waffle"
                -> glyph_modifier_variation_management(PG, aetherC)->
                    {charTag(SecondCharacter, "neutral")}:        Sulla cima.
                    Anche io ci arrivo.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                    Sì sì.
    
            + \ {charTag(PG, "neutral")}:         <i>Controllo una disperata teglia da plumcake.</i>
                ~ kitchen_recipeNoun = "Plumcake"
                -> glyph_modifier_variation_management(PG, earthC)->
                    {charTag(SecondCharacter, "neutral")}:        Mi sembra piena di buchi, {player_name}.
                    Che vuole dire?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                    Non capisco.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
            -  

            {charTag(SecondCharacter, "neutral")}:        Per un po' a scuola hanno tolto i voti.
            Le maestre dicono che se guardiamo i voti poi non impariamo, cerchiamo solo di vincere.
            Cosa non l'ho capito.
            Però alcune mamme si sono arrabbiate.
            Anche la mia.
            {charTag(SecondCharacter, "emotional")}:        Posso assaggiare l'impasto?
            {charTag(SecondCharacter, "neutral")}:        {charNameOne} ha lasciato solo cose vegane.
            {charTag(SecondCharacter, "emotional")}:        Però sono buone!
            {charTag(SecondCharacter, "neutral")}:        Se c'è una cosa che mi fa arrabbiare della mamma, è che quando si tratta di scuola lei sa solo arrabbiarsi.
            Se torno con un bel voto mi dice "Hai fatto il tuo dovere!" e poi torna a fare le sue cose.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
            Ma se combino qualcosa, vengo punito.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
            {charTag(SecondCharacter, "neutral")}:        E poi dice a tutti che sono bravo.
            Quando siamo in giro dice "Come sono orgogliosa di {charNameTwo}, è il più bravo della classe!"
            E ho visto che se faccio un casino, più è grosso il casino più dice che sono bravo a scuola.
            Ma poi a casa si arrabbia.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
            {charTag(SecondCharacter, "neutral")}:        Mio fratello dice che non devo ascoltare mamma, perché non serve essere i più bravi, ma essere brave persone.
            Mamma dice che lui dice così perché non ha nemmeno finito le superiori.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
            Nonna dice che serve essere furbi.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
            Io non so mica se posso essere tutte queste cose.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic

                + \ {charTag(PG, "neutral")}:         Essere te stesso vuol dire già essere un intero universo.
                        -> glyph_modifier_variation_management(SecondCharacter, aetherC)->
                    Questo l'ha detto anche la maestra di scienze.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                    {charTag(SecondCharacter, "neutral")}:        Che noi per i virus siamo così grandi come la Terra lo è per noi!
                    A volte sono a letto e penso a tutti questi piccoli virus.
                    Magari hanno intere città dentro di me.
                    E ogni volta che respiro si mettono a nuotare nell'aria?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy

                + \ {charTag(PG, "neutral")}:         L'unica cosa logica è essere te stesso.
                        -> glyph_modifier_variation_management(SecondCharacter, airC)->
                    {charTag(SecondCharacter, "neutral")}:        Sì no boh.
                    Un cane è un cane.
                    Un gatto un gatto.
                    Quindi io posso solo essere io?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
    
                + \ {charTag(PG, "neutral")}:         Concordo con tuo fratello: ciò che conta è essere brave persone.
                        -> glyph_modifier_variation_management(SecondCharacter, waterC)->
                    {charTag(SecondCharacter, "neutral")}:        Mio fratello è una brava persona.
                    Anche il suo amico.
                    Anche nonna.
                    Però dicono sempre che la vita è difficile.
                    Forse non è così bello essere brave persone.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic

                + \ {charTag(PG, "neutral")}:         Allora prova ad essere un dinosauro rosa!
                        -> glyph_modifier_variation_management(SecondCharacter, earthC)->
                    {charTag(SecondCharacter, "neutral")}:        Bleah!
                    I dinosauri sì, ma il rosa è da bambine.
                    Posso essere un dinosauro gigante che sa volare.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                    Posso sparare fuoco?
                    {charTag(SecondCharacter, "neutral")}:        Però non mi piacciono le piume, mi fanno solletico.
                    Posso avere le squame di acciaio?
                    Come le statue di mio fratello!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                
                + \ {charTag(PG, "neutral")}:         L'importante è essere lotta, cambiamento, fuoco!
                        -> glyph_modifier_variation_management(SecondCharacter, fireC)->
                    Il fuoco mi piace.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                    {charTag(SecondCharacter, "neutral")}:        Ma a casa non me lo fanno toccare perché una volta ho.
                    È una cosa brutta.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                    {charTag(SecondCharacter, "neutral")}:        Volevo vedere cosa succede alle code dei gatti.
                    Ora la vicina non mi parla più.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                -
            
            Ho trovato della cannella!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
            Mi piace la cannella.
            {charTag(SecondCharacter, "emotional")}:        Possiamo metterla?
            {charTag(SecondCharacter, "neutral")}:        Papà dice che lui è bravo a lavoro perché è capace di fare le cose sotto pressione.
            E che il capo all'inizio diceva che era uno che <i>cazzeggiava</i>, ma poi ha visto che corre tantissimo con le scadenze.
            A me la pressione non mi piace.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
            Mi agita.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
            {charTag(SecondCharacter, "neutral")}:        Mio fratello invece dice che lavora bene quando c'è tanto casino.
            E te?
            Magari poi io parlo tanto e tu cucini e ti agiti?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
        
                + \ {charTag(PG, "neutral")}:         <i>Trito della menta isolata.</i>
                    ~ kitchen_recipeAdjective = "dell'isolamento"
                    -> glyph_modifier_variation_management(PG, waterC)->
                    {charTag(SecondCharacter, "neutral")}:        Deve essere difficile questo lavoro allora.
                    Perché c'è sempre gente in giro.
                    E devi parlare con noi.
                
                + \ {charTag(PG, "neutral")}:         <i>Sbuccio della vaniglia frenetica.</i>
                    ~ kitchen_recipeAdjective = "della frenesia"
                    -> glyph_modifier_variation_management(PG, fireC)->
                    Un po' come {mentorName} allora.
                    Che corre sempre da una parte all'altra.
                
                + \ {charTag(PG, "neutral")}:         <i>Spremo del cedro organizzato.</i>
                    ~ kitchen_recipeAdjective = "dell'organizzazione"
                    -> glyph_modifier_variation_management(PG, earthC)->
                    {charTag(SecondCharacter, "neutral")}:        Io ci provo a organizzarmi.
                    Ma non mi viene benissimo.
                    Voglio fare le cose con calma.
                    Ma poi finisco nel caos.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
            
                + \ {charTag(PG, "neutral")}:         <i>Setaccio della cannella ritardataria.</i>
                    ~ kitchen_recipeAdjective = "dell'indugio"
                    -> glyph_modifier_variation_management(PG, airC)->
                    {charTag(SecondCharacter, "neutral")}:        Lara in classe fa sempre così.
                    Arriva sempre il giorno dopo coi compiti.
                    La maestra dice che Lara si dimenticherà la testa a casa un giorno.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
        
                + \ {charTag(PG, "neutral")}:         <i>Frullo del caffè caotico.</i>
                    ~ kitchen_recipeAdjective = "della caoticità"
                    -> glyph_modifier_variation_management(PG, aetherC)->
                    Io non posso bere il caffè.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                    {charTag(SecondCharacter, "neutral")}:        Mamma dice che faccio già abbastanza casini da solo.
                    Però conosco il caos.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                -      

        {charTag(SecondCharacter, "emotional")}:        Mi sa che mi preparo del succo.
        A te ti piace?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
        {charTag(SecondCharacter, "neutral")}:        C'è una cosa che voglio dirti.
        E che dico solo a te.
        Perché sembra triste.
        Ma non mi piace quando le persone sono tristi per me.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
        A scuola ho un posto segreto.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
        {charTag(SecondCharacter, "neutral")}:        C'è una porticina che si nasconde nel muro, e che porta sotto il tetto.
        E lì c'è un sacco di polvere e scatole.
        Ma ci sono le finestre e c'è luce.
        E allora mi metto lì a leggere.
        A volte durante l'intervallo, così mi lasciano in pace.
        A volte anche durante le lezioni.
        Le maestre mi mettono le note.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
        {charTag(SecondCharacter, "emotional")}:        Ma non mi hanno ancora scoperto.
        {charTag(SecondCharacter, "neutral")}:        Ci ho letto tutto "La storia infinita".
        Due volte.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
        {charTag(SecondCharacter, "neutral")}:        E un libro sugli insetti della città che mi ha dato mio fratello.
        {charTag(SecondCharacter, "emotional")}:        È il mio posto segreto.

            + \ {charTag(PG, "neutral")}:         Ogni guerrierə ha bisogno di riposarsi prima della battaglia.
                    -> glyph_modifier_variation_management(SecondCharacter, fireC)->
                Ma io mica voglio fare il guerriero.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                {charTag(SecondCharacter, "neutral")}:        Ma non mi voglio annoiare con le tabelline.
                C'è la calcolatrice.
                E i numeri non si toccano, mentre i delfini sì!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
        
            + \ {charTag(PG, "neutral")}:         Hai un tuo nido, un posto sicuro, tutto per te.
                    -> glyph_modifier_variation_management(SecondCharacter, waterC)->
                Sì!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                {charTag(SecondCharacter, "neutral")}:        Cerco sempre di non farmi scoprire perché non voglio vengano altri bambini.
                Una volta ci sono rimasto quando è chiusa la scuola.
                Mamma era preoccupata ma mi è piaciuto tantissimo.
                Pioveva, non si sentiva niente.
                {charTag(SecondCharacter, "emotional")}:        È stato il mio giorno più bello.

            + \ {charTag(PG, "neutral")}:         Quindi ci impari quello che la scuola non ti insegna.
                    -> glyph_modifier_variation_management(SecondCharacter, airC)->
                {charTag(SecondCharacter, "emotional")}:        Sì!
                {charTag(SecondCharacter, "neutral")}:        A me non mi interessa mica la storia.
                Ci sono solo nomi e date e mi rompo.
                E allora prendo i libri sui delfini.
                Quelli mi piacciono.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
    
            + \ {charTag(PG, "neutral")}:         "Ma i desideri non si possono evocare, né soffocare a piacimento."
                    -> glyph_modifier_variation_management(SecondCharacter, aetherC)->
                L'hai letto anche tu!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                {charTag(SecondCharacter, "neutral")}:        Quella frase me l'ha spiegata mio fratello.
                E mi è piaciuta, perché ai grandi non piace sempre quando vuoi qualcosa.
                Ma non è mica che lo faccio apposta.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                E ora lo dice anche un libro!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy

            + \ {charTag(PG, "neutral")}:         "Ma ci sono cose che non si possono capire con la riflessione, bisogna viverle."
                    -> glyph_modifier_variation_management(SecondCharacter, earthC)->
                L'hai letto anche tu?!?!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                Il tipo che l'ha scritto era strano.
                {charTag(SecondCharacter, "emotional")}:        Ma strano bello.
                {charTag(SecondCharacter, "neutral")}:        Mamma dice che andava sempre in giro con una bussola e dei pupazzi e una pietra.
                Mi piacciono le bussole!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
            -
        
        {charTag(SecondCharacter, "emotional")}:        Che profumino!
        {charTag(SecondCharacter, "neutral")}:        Mi sa che manca poco.
        Posso assaggiare?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
        Scotta!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
        {charTag(SecondCharacter, "neutral")}:        Però ora che ci penso.
        Così sembra che le persone non mi piacciono.
        Ma a me piacciono tanto, {player_name}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
        Solo che non le capisco.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
        {charTag(SecondCharacter, "neutral")}:        Mi piace stare da solo.
        Ma non mi piace sentirmi solo.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
        {charTag(SecondCharacter, "neutral")}:        E boh.
        Forse sono qui perché mi sento solo.
        Magari con te capisco come fare?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
        {charTag(SecondCharacter, "neutral")}:        Tu ti senti {player_pronouns has him:solo|{player_pronouns has her:sola|solə}}?

            + \ {charTag(PG, "neutral")}:         <i>Do una spolverata di moltissimo cacao.</i>
                ~ kitchen_recipeComplement = "con moltissimo cacao"
                -> glyph_modifier_variation_management(PG, waterC)->
                Però ora hai me!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                {charTag(SecondCharacter, "emotional")}:        E {charNameOne}!
                E me!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                
            + \ {charTag(PG, "neutral")}:         <i>Incorporo un poco di marmellata.</i>
                ~ kitchen_recipeComplement = "con poca marmellata"
                -> glyph_modifier_variation_management(PG, airC)->
                {charTag(SecondCharacter, "neutral")}:        In effetti già qui hai fatto tante amicizie, vero?
                {charTag(SecondCharacter, "emotional")}:        Anche con me.
             
            + \ {charTag(PG, "neutral")}:         <i>Non aggiungo nulla.</i>
               ~ kitchen_recipeComplement = "senza guarnizioni"
               -> glyph_modifier_variation_management(PG, earthC)->
                Woah.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                Deve essere bello.
                Spero di essere anche io tuo amico!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
        
            + \ {charTag(PG, "neutral")}:         <i>Spennello della glassa solitaria.</i>
                ~ kitchen_recipeComplement = "con glassa solitaria"
                -> glyph_modifier_variation_management(PG, fireC)->
                {charTag(SecondCharacter, "neutral")}:        Mio fratello è uno solitario.
                Dice che è un orso.
                Anche il suo amico dice che è un orso.
                E poi ridono.
                Non capisco mai perché.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
    
            + \ {charTag(PG, "neutral")}:         <i>Farcisco con pochi ma affidabili pezzetti di cioccolato.</i>
                ~ kitchen_recipeComplement = "con affidabili pezzetti di cioccolato"
                -> glyph_modifier_variation_management(PG, aetherC)->
                {charTag(SecondCharacter, "emotional")}:        Come nonna.
                {charTag(SecondCharacter, "neutral")}:        Che dice che la vita ti da un grande amore, due grandi amicizie, tre grandi rotture di gatto.
                Non abbiamo un gatto.
                Quindi non ne ho rotto nessuno.
                A parte quello della vicina.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
            -   
        
        {charTag(SecondCharacter, "neutral")}:        Sono contento che parli di cose serie con me.
        Gli adulti pensano che i bambini siano stupidi.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
        {charTag(SecondCharacter, "neutral")}:        Ma sappiamo tantissime cose.
        {charTag(SecondCharacter, "emotional")}:        Ma ora ho fame.
            -> fourth_ingredient_dispatcher
    
    
    = third_theme
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

        Mi vuoi sgridare di nuovo?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
        Ti ho già chiesto scusa.
        Ho imparato la lezione.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
            
            + \ {charTag(PG, "neutral")}:         Bimbo, rilassati, non sono un{player_pronouns has her:a|ə} professor{player_pronouns has him:o|{player_pronouns has her:a|ə}}.
                    -> glyph_modifier_variation_management(SecondCharacter, fireC)->
                {charTag(SecondCharacter, "neutral")}:        Però sei qui per lavorare.
                E alle persone che lavorano i bambini danno fastidio.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                {charTag(SecondCharacter, "neutral")}:        Come quando vai in biblioteca e ti prendi bene e fai un po' di rumore e i grandi ti guardano male.
        
            + \ {charTag(PG, "neutral")}:         Mi spiace, non volevo farti arrabbiare. Vorrei solo parlare con te.
                    -> glyph_modifier_variation_management(SecondCharacter, waterC)->
                {charTag(SecondCharacter, "neutral")}:        Però quello lo facciamo già.
                Anche se non parliamo di bugie.    

            + \ {charTag(PG, "neutral")}:         No: voglio solo razionalmente capire meglio alcune cose.
                    -> glyph_modifier_variation_management(SecondCharacter, airC)->
                Non è che mi stai studiando vero?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                {charTag(SecondCharacter, "neutral")}:        Come le scimmie allo zoo.
                Non sono mica felici loro.

            + \ {charTag(PG, "neutral")}:         Ora però vorrei imparare io una lezione da te.
                    -> glyph_modifier_variation_management(SecondCharacter, aetherC)->
                Quindi sono il tuo professore?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                Allora ti insegno cose sui topi!
                {charTag(SecondCharacter, "emotional")}:        Sapevi che cantano?
                E che ogni topo ha un suo odore?
                E sanno risolvere tantissime cose complicate.
                Anche i labirinti.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                {charTag(SecondCharacter, "neutral")}:        Io mi perdo invece nei labirinti!

            + \ {charTag(PG, "neutral")}:         Naa, al massimo sgridiamo {mentorName}. Ti sembro un{player_pronouns has him:o|{player_pronouns has her:a|ə}} che ti sgrida?!
                    -> glyph_modifier_variation_management(SecondCharacter, earthC)->
                {charTag(SecondCharacter, "neutral")}:        Sì no boh.
                Alle persone grandi piace sempre sgridare.
                {charTag(SecondCharacter, "emotional")}:        Solo Franco non mi sgrida mai.
                Ma non ho capito quanto sia grande Franco.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
            -  
        Scusa {player_name}.
            {
                - food_gift_second_char:
                    {charTag(SecondCharacter, "emotional")}:        Sono contento di aver fatto pace con {mentorName}.
                    Ma sono ancora un po' arrabbiato.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                    E questo mi fa arrabbiare velocemente.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic

                - grimoire_fifthChar has grimSecondCharMentorPeace:
                    Sto ancora cercando di non essere arrabbiato con {mentorName}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                    E non mi piace essere arrabbiato.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                    Mi fa arrabbiare di più.

                - else:
                    Sono ancora arrabbiato con {mentorName}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                    E non mi piace essere arrabbiato.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                    Mi fa arrabbiare di più.
            }

        {charTag(SecondCharacter, "emotional")}:        Facciamo qualcosa con la frutta?
        {charTag(SecondCharacter, "neutral")}:        Mamma pensa che mangio solo schifezze.
        Ma la frutta mi piace.
        C'è una cosa che mi fa arrabbiare tanto tanto quando si parla di bugie.
        Perché in casa sembra che sia solo io a dire le bugie.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
        {charTag(SecondCharacter, "neutral")}:        Ma mamma ne dice tante.
        E le sue sono brutte.
        Perché non dice mai cose giganti.
        No.
        Lei dice che non ha fatto cose che ha fatto.
        Cose che non ha fatto a me.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
        O mi dà la colpa per cose che ha fatto lei.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
        E quando lei dice qualcosa, papà le crede sempre.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
        E nonna non le crede, ma mi dice che fa finta di crederci per non litigare.
        Le sue bugie fanno male.
        {charTag(SecondCharacter, "neutral")}:        Le mie no.
        Tutte le bugie sono sbagliate?

            -> kitchen_moon_feedback -> 
        
            + (bugie_innocenti) \ {charTag(PG, "neutral")}:         <i>Sbuccio delle pesche innocenti.</i>
                ~ kitchen_recipeNoun = "Pesche"
                -> glyph_modifier_variation_management(PG, airC)->
                Esatto!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                Ci sono bugie che non fanno male a nessuno.
                E sono anche carine!
               
            + (bugie_omesse) \ {charTag(PG, "neutral")}:         <i>Affetto delle mele omesse.</i>
                ~ kitchen_recipeNoun = "Mele"
                -> glyph_modifier_variation_management(PG, waterC)->
                Come quando non dici che hai fatto una cosa.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                Fino a quando non ti scoprono.
                Però poi finisci nei guai.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                Grossi.
             
            + (bugie_difensive)\ {charTag(PG, "neutral")}:         <i>Taglio delle pere difensive.</i>
               ~ kitchen_recipeNoun = "Pere"
               -> glyph_modifier_variation_management(PG, earthC)->
               A scuola servono le bugie per difendersi.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
               {charTag(SecondCharacter, "neutral")}:        Tantissime.
               Le maestre pensano sempre che hai fatto qualcosa di brutto.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
        
            + (bugie_nessuna)\ {charTag(PG, "neutral")}:         <i>Sciacquo delle prugne impeccabili.</i>
                ~ kitchen_recipeNoun = "Prugne"
                -> glyph_modifier_variation_management(PG, aetherC)->
                {charTag(SecondCharacter, "neutral")}:        Si no boh.
                Nessuna persona non dice le bugie.
                Anche perché ci ricordiamo sempre le cose diverse da come sono.
                Magari <i>pensi</i> di non dire bugie.
                Ma le dici comunque.
    
            + (bugie_autoinganno)\ {charTag(PG, "neutral")}:         <i>Spremo delle arance dell'autoinganno</i>
                ~ kitchen_recipeNoun = "Arance"
                -> glyph_modifier_variation_management(PG, fireC)->
                {charTag(SecondCharacter, "neutral")}:        Come quando mi dico che a ginnastica sono stato bravo.
                Anche se sono caduto con la faccia sulle scarpe di Tommaso.
                Che schifo!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
            -  
        {charTag(SecondCharacter, "emotional")}:        Posso assaggiare?
        {charTag(SecondCharacter, "neutral")}:        Comunque i grandi fanno un sacco di regole.
        Ma poi le rompono tantissimo.
        E poi sgridano noi bambini se lo facciamo.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
        {charTag(SecondCharacter, "neutral")}:        Ci metto della menta.
        Ecco.
        A scuola ho un soprannome.
        Un soprannome brutto.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
        {charTag(SecondCharacter, "neutral")}:        Perché una volta ho detto una bugia così grossa che tutti si sono arrabbiati.
        E ora c'ho questo soprannome addosso.
        Lo so che dico tantissime bugie.
        A volte non me ne accorgo nemmeno.
        Ma.
        Mmm.
        Nonna dice sempre che "ma" è amico del diavolo.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
        Ma con le bugie le persone mi ascoltano.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
        {charTag(SecondCharacter, "neutral")}:        E poi.
        La mia vita è.
        Non è che le mie cose piacciono agli altri bambini.
        Non posso vedere i cartoni.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
        Non ho i fumetti.
        Ho pochissimi giochi.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
        {charTag(SecondCharacter, "neutral")}:        Posso giocare ai videogiochi di mio fratello, ma non sono quelli dei miei compagni.
        Io non so cosa dire.
        E quindi o sto da solo, o devo dire bugie.

            + \ {charTag(PG, "neutral")}:         Ma perché non guardi i cartoni di nascosto? O prendi i fumetti in biblio?
                    -> glyph_modifier_variation_management(SecondCharacter, fireC)->
                La televisione la controlla mamma.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                Però non ci avevo pensato alla biblioteca.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                Lì ci posso andare per leggere.
                A volte mi accompagna mamma ma poi si mette a fumare fuori con le amiche.
                {charTag(SecondCharacter, "emotional")}:        Mi piace questo piano, grazie {player_name}!

            + \ {charTag(PG, "neutral")}:         Statisticamente deve esserci una persona con cui poter legare.
                    -> glyph_modifier_variation_management(SecondCharacter, airC)->
                {charTag(SecondCharacter, "neutral")}:        Si no boh.
                Ai bambini piace il calcio, ma a me no.
                Oppure parlano di Roblox e Minecraft e io so solo le cose che ho visto sul tablet.
                E le bambini sono strane.
                E mi dicono che sono strano.
                E a volte mi fanno giocare con loro.
                Ma mi fanno fare sempre il papà o cose così.
                E mi annoio e mi distraggo e si arrabbiano.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry

            + \ {charTag(PG, "neutral")}:         Devi sentirti molto solo.
                    -> glyph_modifier_variation_management(SecondCharacter, waterC)->
                {charTag(SecondCharacter, "neutral")}:        Si no boh.
                Non mi dire mica che ti dispiace.
                Ma a me mi piace stare con gli altri.
                Ma è così difficile.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry

            + \ {charTag(PG, "neutral")}:         Tu amico mio hai tan-tis-si-ma fantasia, e devi condividerla con qualcunə!
                    -> glyph_modifier_variation_management(SecondCharacter, earthC)->
                A volte scrivo storie per mio fratello.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                E a lui piacciono.
                {charTag(SecondCharacter, "emotional")}:        Una volta ha anche fatto dei disegni dalle mie storie!
                Ho il quaderno nascosto sotto il letto.

            + \ {charTag(PG, "neutral")}:         <i>Mi abbasso offrendo un abbraccio.</i>
                -> glyph_modifier_variation_management(SecondCharacter, aetherC)->
                {charTag(SecondCharacter, "neutral")}:        Sì no boh.
                {charTag(SecondCharacter, "emotional")}:        Ok.
                Ecco, scusa.
                Ti ho spinato mi sa.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                Mi spiace.
                Scusa {player_name}!
            -
        {charTag(SecondCharacter, "neutral")}:        Guarda!
        La frutta piace anche ai pesci!
        {charTag(SecondCharacter, "emotional")}:        Che faccia buffa quello!
        {charTag(SecondCharacter, "neutral")}:        Ci sono compagni che piacciono a tutti.
        Lara ha un sacchissimo di amiche!
        Jin è il primo che viene cercato ogni volta che si gioca a qualcosa.
        Tommaso è antipatico invece.
        Ma la sua famiglia è ricca.
        E ha la piscina e tantissimi giochi.
        A te cosa ti rende interessante?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy

            + \ {charTag(PG, "neutral")}:         <i>Shakero un bicchiere vuoto.</i>
                ~ kitchen_recipeAdjective = "del vuoto"
                -> glyph_modifier_variation_management(PG, aetherC)->
                {charTag(SecondCharacter, "neutral")}:        Non è vero!
                Abbiamo già parlato tantissimo!
               
            + \ {charTag(PG, "neutral")}:         <i>Aggiungo della lavanda empatica.</i>
                ~ kitchen_recipeAdjective = "dell'empatia"
                -> glyph_modifier_variation_management(PG, waterC)->
                {charTag(SecondCharacter, "neutral")}:        Come quando io mi faccio male e tu senti dolore?
                Deve essere faticoso!
             
            + \ {charTag(PG, "neutral")}:         <i>Grattugio della scorza di chinotto sportivo.</i>
               ~ kitchen_recipeAdjective = "della sportività"
               -> glyph_modifier_variation_management(PG, fireC)->
                Magari conosci Jin.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                O suo fratello.
                {charTag(SecondCharacter, "neutral")}:        Il fratello di Jin è ENORME!
                È campione di sollevamento pesi.
                Una volta mi ha alzato con una sola mano!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
        
            + \ {charTag(PG, "neutral")}:         <i>Misuro dell'acqua di rose erudita.</i>
                ~ kitchen_recipeAdjective = "dell'erudizione"
                -> glyph_modifier_variation_management(PG, airC)->
                Anche a me piace sapere le cose.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                {charTag(SecondCharacter, "neutral")}:        Ma poi devi trovare le persone a cui piacciono le cose che piacciono a te.
                O ti dicono che sei strano.
    
            + \ {charTag(PG, "neutral")}:         <i>Macino del pepe rosa divertito.</i>
                ~ kitchen_recipeAdjective = "del divertimento"
                -> glyph_modifier_variation_management(PG, earthC)->
                Scherzi e battute!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                Ma lontano dalle maestre.
                E da {mentorName}.
            -      
    
        {charTag(SecondCharacter, "neutral")}:        Bleah.
        Le spezie sono strane.
        Nei cibi sono buone.
        Ma da sole fanno bleah.
        A mio fratello non dico mai bugie.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
        E inventiamo tante storie.
        {charTag(SecondCharacter, "neutral")}:        Mio fratello mi dice che le storie sono delle bugie condivise.
        E per questo non fanno male.
        Una volta era triste.
        E mi ha detto che le persone creano cose per mentire.
        Per dirsi che possono esistere cose diverse da quelle che si hanno.
        E che l'arte è una bella bugia per farci andare avanti quando le cose fanno schifo.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic

            + \ {charTag(PG, "neutral")}:         Quindi se dici che sei uno scrittore puoi dire tutte le bugie che vuoi?
                    -> glyph_modifier_variation_management(SecondCharacter, earthC)->
                Non ci avevo pensato!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                {charTag(SecondCharacter, "neutral")}:        E a me piace scrivere.
                Posso fare come gli investigatori che fanno finta di essere altre persone per risolvere i casi!
             
            + \ {charTag(PG, "neutral")}:         L'unica cosa che fa andare avanti è il cambiamento, non le belle bugie.
                    -> glyph_modifier_variation_management(SecondCharacter, fireC)->
                {charTag(SecondCharacter, "neutral")}:        Eh?
                Non ho mica capito {player_name}.
                Cosa devo cambiare?
            
            + \ {charTag(PG, "neutral")}:         Ci sono belle bugie che sono come coperte contro il freddo.
                    -> glyph_modifier_variation_management(SecondCharacter, waterC)->
                {charTag(SecondCharacter, "neutral")}:        Le statue di mio fratello sono cose che non esistono mica.
                Ma le guardo e mi piacciono tanto.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                {charTag(SecondCharacter, "neutral")}:        Dici una cosa così quindi?

            + \ {charTag(PG, "neutral")}:         L'arte mostra ciò che i fatti non sanno raccontare.
                    -> glyph_modifier_variation_management(SecondCharacter, aetherC)->
                A volte parli come un libro.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                {charTag(SecondCharacter, "neutral")}:        Ma questa cosa la capisco.
                Quando sei un bambino se spieghi le cose nessuno ti ascolta.
                Però i libri ti capiscono.    

            + \ {charTag(PG, "neutral")}:         L'arte non è fattuale, per cui sì, è una bella bugia.
                    -> glyph_modifier_variation_management(SecondCharacter, airC)->
                Tu parli strano a volte.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                {charTag(SecondCharacter, "neutral")}:        Però allora vuole dire che i grandi possono dirle le bugie.
                Perché io no?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
            -
        
        {charTag(SecondCharacter, "emotional")}:        Con la frutta avanzata ci preparo un succo!
        {charTag(SecondCharacter, "neutral")}:        A me non mi piacciono i grandi.
        E so che devo diventare grande.
        Ma mi fa paura.
        {charTag(SecondCharacter, "emotional")}:        L'unica cosa bella di diventare grande è che posso avere una casa tutta per me.
        E comprarmi uno struzzo senza che la mamma rompa.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
        Voglio andare a scuola su uno struzzo.
        Non è vero che gli struzzi sono stupidi.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
        {charTag(SecondCharacter, "neutral")}:        Fanno delle cose che non capiamo, ma che per loro sono fondamentali per sopravvivere.
        Come dire bugie quando sei un bambino.
        Per te cosa significa essere grande?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
        
            + \ {charTag(PG, "neutral")}:         <i>Unisco della cioccolata angosciata.</i>
                ~ kitchen_recipeComplement = "con cioccolata angosciata"
                -> glyph_modifier_variation_management(PG, waterC)->
                Vedi?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                Perché dovrei diventare grande?!?
               
            + \ {charTag(PG, "neutral")}:         <i>Caramello delle scorze di limone indipendente.</i>
                ~ kitchen_recipeComplement = "con limone indipendente"
                -> glyph_modifier_variation_management(PG, fireC)->
                {charTag(SecondCharacter, "neutral")}:        Perché fai quello che vuoi?
                Questo è bello.
                Per lo struzzo.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                E magari anche una volpe.
                E una lontra.
                {charTag(SecondCharacter, "neutral")}:        I grandi possono avere uno zoo?
             
            + \ {charTag(PG, "neutral")}:         <i>Guarnisco con marshmallow responsabili.</i>
               ~ kitchen_recipeComplement = "con marshmallow responsabili"
               -> glyph_modifier_variation_management(PG, earthC)->
               {charTag(SecondCharacter, "neutral")}:        Sì no boh.
               Anche i bambini sono responsabili.
               Quindi non è tanto diverso no?
        
            + \ {charTag(PG, "neutral")}:         <i>Spolvero dello zenzero fallito.</i>
                ~ kitchen_recipeComplement = "con zenzero fallito"
                -> glyph_modifier_variation_management(PG, aetherC)->
                Non voglio diventare grandeeeeeee.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                Non vogliooooo!
    
            + \ {charTag(PG, "neutral")}:         <i>Verso del succo d'ananas esplorativo.</i>
                ~ kitchen_recipeComplement = "con ananas esplorativo"
                -> glyph_modifier_variation_management(PG, airC)->
                {charTag(SecondCharacter, "neutral")}:        Non ci avevo pensato.
                Però posso viaggiare dove voglio.
                Noi viaggiamo poco.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                {charTag(SecondCharacter, "neutral")}:        Perché non abbiamo soldi.
                Però conosco tutti i posto segreti del mio quartiere!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                E alcuni sono pericolosi!
            - 

        {charTag(SecondCharacter, "emotional")}:        Comunque giuro su tutto tuttissimo che ho smesso di dirti bugie.
        E ho tanta fame, {player_name}.
        Tanta tanta fame!
            -> fourth_ingredient_dispatcher
    

    
        //La chiusura è comune, sempre per ridurre il rischio di errori
        = fourth_ingredient_dispatcher
        Abbiamo sporcato tantissime cose.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
        Dici che si lavano da sole?
        {charTag(SecondCharacter, "emotional")}:        Dici che è pronto?
        
            {
                - backpack_findedGifts == ():
                    {charTag(TheWitch, witch_state())}:   <i>{player_name} non ha niente da aggiungere alla ricetta.</i>
                    -> recipe_name_creator ->
                    -> recipe_name_storage(SecondCharacter) ->
                    -> at_table_with_second_char
                
                - else:
                    -> add_ingredient
            
            }
            
                = add_ingredient
                ~ temp charNameOne = translator(firstChar_ActualName)
                ~ temp charNameTwo = translator(secondChar_ActualName)
                ~ temp charNameThree = translator(thirdChar_ActualName)
                ~ temp charNameFour= translator(fourthChar_ActualName)
                ~ temp mentorName = translator(mentor_ActualName)
                
                {charTag(TheWitch, witch_state())}:   <i>Il giusto ingrediente renderà la ricetta di {player_name} e {charNameTwo} spaziale.</i>
                <i>E {player_name} potrebbe capire un po' meglio {charNameTwo}.</i>

                    + \ {charTag(PG, "neutral")}:         <i>Voglio aggiungere un ingrediente speciale.</i>
                        -> grimoire_greenhouse_gifts_and_ingredient ->

                        //Dopo di che associo la scelta fatta alla PNG
                        ~ kitchen_secondCharExtraIngredient = grimoire_chosenPlant
                        //E svuoto la variabile del grimorio
                        ~ grimoire_chosenPlant = ()
                        //E poi chiamo la funzione per aggiornare i valori
                        ~ object_value_for_PNG(kitchen_secondCharExtraIngredient, Kitchen, SecondCharacter)
                        //E il nome dell'ingrediente
                        ~ extra_ingredient_name(kitchen_secondCharExtraIngredient)
                        
                        -> notification_system -> 
                    
                    + \ {charTag(PG, "neutral")}:         <i>Non aggiungo altro.</i>
                    -
            {charTag(SecondCharacter, "emotional")}:        A tavola!
            Ho tantissima aquilina!
            
                    -> recipe_name_creator ->
                    -> recipe_name_storage(SecondCharacter) ->
                    -> at_table_with_second_char
    


=== at_table_with_second_char
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    ~ move_entity(CookingWithSecondCharOBJ, Kitchen)
    ~ move_entity(EatingWithSecondCharOBJ, Kitchen)
    ~ temp piatto = kitchen_tempRecipeName
    
    {charTag(SecondCharacter, "emotional")}:        Hai visto che pancia grande che ho ora?
    Grazie {player_name}, era buonissimo!
    E poi questo {piatto} sembra una cosa da cinema.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
        {
            - firstChar_storyStatus == story_storyStarted:
                {charTag(SecondCharacter, "emotional")}:        Secondo me a {charNameOne} gli sarebbe piaciuto TAN-TIS-SI-MO!
                Dovevo lasciargli un pezzetto!
            
            - else:
                {charTag(SecondCharacter, "emotional")}:        Secondo me a {charNameOne} gli sarebbe piaciuto TAN-TIS-SI-MO!
                Un po' mi manca.
        }

    {charTag(SecondCharacter, "neutral")}:        A me mi piace parlare, ma gli adulti non mi ascoltano mai così tanto.
        {
            -cooking_with_second_char.first_theme:
                E sono contento che mi hai chiesto degli animali.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                {charTag(SecondCharacter, "neutral")}:        E le cose che mi hai detto sulle persone.
                {charTag(SecondCharacter, "emotional")}:        Grazie.

            -cooking_with_second_char.second_theme:
                Mi è piaciuto parlare di cose da adulti.
                {charTag(SecondCharacter, "neutral")}:        E conoscerti di più.
            
            -cooking_with_second_char.third_theme:
                {charTag(SecondCharacter, "emotional")}:        È bello che abbiamo parlato di bugie.
                {charTag(SecondCharacter, "neutral")}:        Ci sono tantissime cose nelle bugie.
                Ma nessuno le ascolta mai davvero.
        }


        {
            - kitchen_secondCharExtraIngredientReaction != notReaction:
                -> extra_ing_feedback
            
            - else:
                E ho la pancia strapiena ora.
                -> relationship_feedback
        }
        
        
        = extra_ing_feedback
        // Qui verranno fatti commenti diversi a seconda che l'ingrediente sarà apprezzato o meno.
            {
                - kitchen_secondCharExtraIngredientReaction == goodReaction:
                    -> good_reaction
                
                - kitchen_secondCharExtraIngredientReaction == badReaction:
                    -> bad_reaction
                
                - kitchen_secondCharExtraIngredientReaction == mehReaction:
                    -> meh_reaction
                
                - else:
                    ERROR: non abbiamo un valore valido di kitchen_secondCharExtraIngredientReaction, che è uguale a {kitchen_secondCharExtraIngredientReaction}.
            }
        
        
                = good_reaction
                ~ temp charNameOne = translator(firstChar_ActualName)
                ~ temp charNameTwo = translator(secondChar_ActualName)
                ~ temp charNameThree = translator(thirdChar_ActualName)
                ~ temp charNameFour= translator(fourthChar_ActualName)
                ~ temp mentorName = translator(mentor_ActualName)
                        
                        -> kitchen_moon_feedback -> 

                    {charTag(SecondCharacter, "emotional")}:        Mi è piaciuto tanto tanto che c'hai messo {ingredientTranslator(kitchen_secondCharExtraIngredient)}.
                    {
                        - kitchen_firstCharExtraIngredient == universalIngredient:
                            AGGIUNGI RICORDO IMPORTANTE DI RICCIO.
                    }
                    {charTag(SecondCharacter, "neutral")}:        Lo vuoi sapere un segreto?
                    Alla fine non sono <i>così</i> strano.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                    Ma mi piace quando le persone sono <b>coerenti</b>.
                    Sennò mi sembra che vuoi avere ragione, non che mi vuoi parlare davvero.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                        @animation:RewriterBook

                        -> relationship_feedback
                
                = bad_reaction
                ~ temp charNameOne = translator(firstChar_ActualName)
                ~ temp charNameTwo = translator(secondChar_ActualName)
                ~ temp charNameThree = translator(thirdChar_ActualName)
                ~ temp charNameFour= translator(fourthChar_ActualName)
                ~ temp mentorName = translator(mentor_ActualName)
                        
                        -> kitchen_moon_feedback -> 

                    Però {ingredientTranslator(kitchen_secondCharExtraIngredient)} mi ha fatto suuuuuperschifo.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                    {charTag(SecondCharacter, "neutral")}:        Super.
                    Bleah!
                        -> relationship_feedback
            
                
                = meh_reaction
                ~ temp charNameOne = translator(firstChar_ActualName)
                ~ temp charNameTwo = translator(secondChar_ActualName)
                ~ temp charNameThree = translator(thirdChar_ActualName)
                ~ temp charNameFour= translator(fourthChar_ActualName)
                ~ temp mentorName = translator(mentor_ActualName)
                        
                        -> kitchen_moon_feedback -> 

                    {charTag(SecondCharacter, "neutral")}:        Mi è piaciuto che c'hai messo {ingredientTranslator(kitchen_secondCharExtraIngredient)}.
                    Non il mio preferito, ma quasi.
                    Mi ha fatto pensare una cosa.
                    {charTag(SecondCharacter, "emotional")}:        Mi piacciono i cani.
                    Ma non mi piace quando fanno le cose a caso.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                    {charTag(SecondCharacter, "neutral")}:        Come correre a destra e sinistra e ovunque.
                    Un cane deve andare dove deve andare, mica a caso!
                    Come quando si parla.
                        @animation:RewriterBook
                        
                        -> relationship_feedback
            
    
        
    = relationship_feedback
    -> achievements_onGame_statusUpdate_GM ->
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour= translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)

        {charTag(SecondCharacter, "emotional")}:        Mi sa che sono davvero pieno.
        {charTag(SecondCharacter, "neutral")}:        Abbiamo parlato tanto, vero, qui?
        Non abbiamo mai passato così tanto tempo assieme.
        E penso che se ti ho conosciuto solo qui in cucina ora e {charNameOne} mi dice: vuoi fare amicizia con {player_name}?

            -> secondAffinityCalc ->
            
            {
                - secondAffinityCalc == 1:
                    {
                        - secondChar_relationshipStatus == 0:
                            {charTag(SecondCharacter, "neutral")}:        Rispondo di no.
                            Perché non so.
                            Non è che mi è piaciuto molto molto come abbiamo parlato.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic

                        - secondChar_relationshipStatus == 1:
                            {charTag(SecondCharacter, "emotional")}:        Rispondo subito sììììììììì!
                            Mi sono divertito.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                            {charTag(SecondCharacter, "emotional")}:        E mi è sembrato che mi hai ascoltato davvero.
                            E mi piace questa cosa!
                    }
                    
                - secondAffinityCalc == 2:
                    {
                        - secondChar_relationshipStatus == 0:
                            {charTag(SecondCharacter, "neutral")}:        Rispondo di no.
                            Perché non so.
                            Non è che mi è piaciuto molto molto come abbiamo parlato.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                        
                        - secondChar_relationshipStatus == 1:
                            {charTag(SecondCharacter, "neutral")}:        Sì no boh.
                            Devo ancora capirlo.
                            {charTag(SecondCharacter, "emotional")}:        Perché ci sono stati dei momenti in cui ho detto "Ma che figo che è avere qui {player_name}".
                            E dei momenti in cui non ti capivo.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                        
                        - secondChar_relationshipStatus == 2:
                            {charTag(SecondCharacter, "emotional")}:        Rispondo subito sììììììììì!
                            Mi sono divertito.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                            {charTag(SecondCharacter, "emotional")}:        E mi è sembrato che mi hai ascoltato davvero.
                            E mi piace questa cosa!
                    }    
        
            }

    Abbiamo ancora tante chiacchierate da fare, vero?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy        
            
        -> ending_cooking_with_second_char



=== ending_cooking_with_second_char
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    {charTag(SecondCharacter, "neutral")}:        Però ora devo farmi due passi o mi addormento.
    E non voglio dormire.
    Voglio parlare con Franco.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
    {charTag(SecondCharacter, "neutral")}:        A dopo {player_name}!
    - 
    
        -> cooking_animations_off ->
            ~ move_entity(SecondCharacter, Pond)
            ~ kitchen_secondCharCookingTogetherInvite = false
            ~ kitchen_allChefs += SecondCharacter
            ~ kitchen_kitchenOccupied = false
        -> update_glyphs(SecondCharacter) ->
        -> achievements_onGame_statusUpdate_GM ->
        -> second_char_closing_storylet ->
        -> main


/* ---------------------------------

   Altri storylets legati alla cucina 

 ----------------------------------*/


=== second_char_cooking_alone
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
{debug: passo per second_char_cooking_alone.}
-> cooking_animations_on ->

{kitchen_secondCharCookingTime:
        - 0:
            {Se unisco aceto e bicarbonato la schiuma è buona?| Sto cucinando {player_name}!}#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy

        - 1:
            {Se unisco aceto e bicarbonato la schiuma è buona?| Sto cucinando {player_name}!}#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
            
        - 2:
            {Il lievito ha un sapore strano.|{player_name} vai via ora!}#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
        
        - 3:
            {Mi fa male la pancia. Ma devo tagliare tantissime mele.|Torna dopo {player_name}!}#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
            
        - 4:
            {Cavolo, quante cose possono bruciare! Ma sono in ritardo col piatto!|{player_name} non guardare o mi agito.}#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
        
        - 5:
            {È normale che il pane abbia questo odore?|{player_name} lasciami solo.}#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
    
        - 6:
            {Se {mentorName} scopre che {charNameOne} ha messo tutti questi coltelli, si arrabbia tantissimo. Ma così posso tagliare le noci.|{player_name}, via o brucio tutto.}#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
        
        - 7:
            {Un pezzo di unghia in tutto questo cioccolato grattugiato sparisce, vero?|Due minuti e ho finito, davvero.}#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
        
        - else:
            {Direi che ci siamo. Deve giusto diventare freddo. E stare fermo.|{player_name}, non hai pazienza!}#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
        
    }

    -> second_char_closing_storylet ->
    -> main




=== food_gift_second_char
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
{debug: passo per food_gift_second_char.}

    {charTag(Mentor, "hurry")}:             E proteggono tutta la biblioteca?
    Sì! Vedi che sono carini?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
    {charTag(Mentor, "neutral")}:                   Continuo a pensare che non siano carini, ma ora mi fanno un po' meno paura.
    {charTag(Mentor, "hurry")}:             Ehi {player_name}! {charNameTwo} mi diceva che c'è questa biblioteca in Portogallo dove i pipistrelli proteggono i libri!
    {charTag(SecondCharacter, "neutral")}:        Sìì! E allora ho pensato di mettere una casetta per pipistrelli in cucina.
    Così tengono lontani gli insetti fastidiosi!
    {charTag(Mentor, "neutral")}:                   E poi mi ha preparato questo piatto, ehm, curioso.
    {charTag(SecondCharacter, "neutral")}:        Si chiama PanTutto.
    So cucinare tantissime cose!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
    {charTag(Mentor, "neutral")}:                   Hai imparato dalla tua mamma?
    No.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
    {charTag(SecondCharacter, "neutral")}:        A casa ci sto tanto da solo, e quindi mi invento le cose. 
    Ma cucinare è come un laboratorio.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
    {charTag(SecondCharacter, "neutral")}:        E quindi ho inventato tanti piatti.
    Sono contento che l'hai assaggiato, {mentorName}!
    Ma non mi arrabbio se non ti piace.
    So che i vecchi mangiano solo cose schifose come i broccoli.
    {charTag(Mentor, "hurry")}:             Dovresti assaggiare la mia sacher, bimbo: ti porta direttamente in paradiso
    {charTag(SecondCharacter, "emotional")}:        Ha il cioccolato?
    {charTag(Mentor, "hurry")}:             Ha il cioccolato, e tanto.
    {charTag(Mentor, "sorry")}:             {charNameTwo}: abbiamo fatto pace?
    {charTag(SecondCharacter, "neutral")}:        Mmm.
    Sì.
    Ma già da prima.
    {charTag(Mentor, "neutral")}:                   Posso abbracciarti?
    {charTag(SecondCharacter, "neutral")}:        No.
    {charTag(SecondCharacter, "emotional")}:        Ma puoi farmi quella torta al cioccolato?
-   

            + \ {charTag(PG, "neutral")}:          Scelta acqua
                    -> glyph_modifier_variation_management(SecondCharacter, waterC)->
                
                
            + \ {charTag(PG, "neutral")}:         Scelta spirito
                    -> glyph_modifier_variation_management(SecondCharacter, aetherC)->
                
            
            + \ {charTag(PG, "neutral")}:          Scelta terra
                    -> glyph_modifier_variation_management(SecondCharacter, earthC)->
                
            
            + \ {charTag(PG, "neutral")}:         Scelta aria
                    -> glyph_modifier_variation_management(SecondCharacter, airC)->
                
            
            + \ {charTag(PG, "neutral")}:         Scelta fuoco
                    -> glyph_modifier_variation_management(SecondCharacter, fireC)-> 
                
            -

    -> second_char_closing_storylet ->
    ->->