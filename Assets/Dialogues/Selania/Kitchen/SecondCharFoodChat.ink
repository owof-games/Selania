/* ---------------------------------

   Cucina con Riccio

 ----------------------------------*/
=== pre_start_cooking_with_second_char
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    
    
    {charTag(SecondCharacter, "neutral")}:        Quando cuciniamo? 
    {charTag(SecondCharacter, "energy")}:       Quando cuciniamo?!?
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
    ~ temp charNameFive = translator(fifthChar_ActualName)
    
    
    
    {charTag(PG, "neutral")}:      Sai {charNameTwo}, mentre cuciniamo potremmo parlare un po'.
        - (top)
    
    {charTag(PG, "neutral")}:      In particolare, ripensando alle nostre conversazioni, mi farebbe piacere parlare di più... 
        {
            - grimoire_secondChar hasnt grimSecondCharEight:
                {charTag(TheWitch, witch_state())}:   <i>{charNameTwo} ha altri temi che vorrebbe condividere con {player_name}, ma vorrebbe che {player_name} prima lo conoscesse un po' meglio.</i>
        }

            + \ {charTag(PG, "neutral")}:                                           Parliamo di animali.
                    ~ cooking_animations_on()
                    ~ storage_glyphs(SecondCharacter)
                    -> kitchen_moon_feedback -> 
                    -> first_theme

            + \ {grimoire_secondChar has grimSecondCharSix} {charTag(PG, "neutral")}:          Della scuola.
                    ~ cooking_animations_on()
                    ~ storage_glyphs(SecondCharacter)
                    -> kitchen_moon_feedback -> 
                    -> second_theme
    
            + \ {grimoire_secondChar has grimSecondCharEight} {charTag(PG, "neutral")}:         Delle bugie.
                    ~ cooking_animations_on()
                    ~ storage_glyphs(SecondCharacter)
                    -> kitchen_moon_feedback -> 
                    -> third_theme
                    
            + \ {charTag(PG, "neutral")}:                       Ho cambiato idea.
                {charTag(SecondCharacter, "neutral")}:          Sì no boh.
                                                                Allora vado a salutare la rana.

                    ~ kitchen_secondCharCookingTogetherInvite = false
                    ~ kitchen_secondCharCookingTogetherWaiting = 0
                    ~ move_entity(SecondCharacter, Pond)
            -> main

    
    = first_theme
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
        

        {charTag(SecondCharacter, "energy")}:                   Animaliiiiiiiiiiii!
        {charTag(SecondCharacter, "neutral")}:                  A casa ho una vecchia enciclopedia, era del papà, che è piena di disegni e cose sugli animali.
                                                                E poi a un mercatino abbiamo trovato una collezione di riviste sugli insetti.
                                                                E sul tablet ho tre app per riconoscere gli animali.
        {charTag(SecondCharacter, "energy")}:                   E una me li fa vedere in casa, ed è DI-VER-TEN-TIS-SI-MO quando li faccio andare su cose sbagliate.
        {charTag(SecondCharacter, "neutral")}:                  Come il letto di mamma.
                                                                O le vecchie videocassette di papà.
                                                                Poi ho dei modellini di dinosauri.
                                                                Che però ultimamente non mi piacciono più.
        {charTag(SecondCharacter, "energy")}:                   Mentre mi piace disegnare animali inventati mettendo assieme pezzi diversi.
        {charTag(SecondCharacter, "emotional")}:                Il mio preferito è il prociorso, che è un po' procione e un po' orso e mangia il miele ma lo puoi abbracciare.
        {charTag(SecondCharacter, "melanchonic")}:              Perché l'orso ti mangerebbe la mano.
        {charTag(SecondCharacter, "neutral")}:                  Papà dice che sono fissato, ma mio fratello dice che sono molto intelligente e quindi è normale.
        {charTag(SecondCharacter, "emotional")}:                Ci mettiamo anche il cioccolato?
        {charTag(SecondCharacter, "energy")}:                   Una volta ho fatto uno spettacolo a casa con il teatrino i disegni e gli animali inventati.
        {charTag(SecondCharacter, "neutral")}:                  Quando faccio queste cose chiamo tutta la famiglia.
                                                                E mi fanno i complimenti e ridono però non lo so.
                                                                Mi sembra che i grandi le cose le fanno perché devono.
        {charTag(SecondCharacter, "melanchonic")}:              Non lo so mica se si divertono davvero.


            + \ {charTag(PG, "neutral")}:                       Un po' meno dei bambini, e con cose diverse dai prociorsi.
                    -> glyph_choice_manager(false, airC)->
                {charTag(SecondCharacter, "neutral")}:          Anche i prociorsi si divertono con cose diverse dai grandi.
                {charTag(SecondCharacter, "energy")}:           Una volta un prociorso ha passato due ore a rincorrere un gatto.
                                                                E poi lui si è buttato in acqua.
                {charTag(SecondCharacter, "emotional")}:        E il gatto gli è stato sulla pancia, perché non sa nuotare.
               
            + \ {charTag(PG, "neutral")}:                       \ {charNameTwo}: gli adulti devono imparare tanto dai bambini!
                -> glyph_choice_manager(false, earthC)->
                {charTag(SecondCharacter, "neutral")}:          Si no boh.
                                                                Io voglio insegnare tante cose agli adulti.
                                                                Come si fanno gli aerei di carta.
                {charTag(SecondCharacter, "energy")}:           Perché le caramelle fanno bene.
                                                                E che Elio aveva ragione sugli alieni da sempre e dovevano ascoltarlo.
    
            + \ {charTag(PG, "neutral")}:                       Però tu stai comunque bene quando fai queste cose, no?
               -> glyph_choice_manager(false, aetherC)->
               {charTag(SecondCharacter, "energy")}:            Sì!
                                                                Tantissimissimo!
               {charTag(SecondCharacter, "neutral")}:           A volte nemmeno mi accorgo del tempo che passa, e di cosa fanno le altre persone.
               {charTag(SecondCharacter, "emotional")}:         Mi piace!

            + \ {charTag(PG, "neutral")}:                       Le cose hanno senso se hanno uno scopo. Fare per fare è inutile.
                -> glyph_choice_manager(false, fireC)->
                {charTag(SecondCharacter, "neutral")}:          Sì no boh.
                                                                Che noia.
                                                                Franco fa tantissimissime cose senza senso.
                {charTag(SecondCharacter, "energy")}:           Ma sono le più migliori qui!
        
            + \ {charTag(PG, "neutral")}:                       Il cuore degli adulti è molto molto complicato, {charNameTwo}.
                -> glyph_choice_manager(false, waterC)->
                {charTag(SecondCharacter, "neutral")}:          Che vuol dire?
                {charTag(SecondCharacter, "angry")}:            Anche noi abbiamo cose complicate!
                                                                Tutti i compiti.
                                                                I bulli.
                                                                I grandi arrabbiati ma non si capisce mica mai perché. 
            -    
        
        {charTag(SecondCharacter, "energy")}:                   Ho una fame!
                                                                Ho anche trovato del cacao!
        {charTag(SecondCharacter, "neutral")}:                  Ma a te come ti piace divertirti?

            -> kitchen_moon_feedback -> 
        
            + (fire1)\ {charTag(PG, "neutral")}:                <i>Preparo una base per una torta sportiva.</i>
                ~ kitchen_recipeNoun = "Torta"
                -> glyph_choice_manager(true, fireC)->
                {charTag(SecondCharacter, "neutral")}:          Bleah.
                                                                Non la torta.
                                                                Ma lo sport.
                                                                Bleah!
               
            + (air1)\ {charTag(PG, "neutral")}:                 <i>Stendo della sfoglia per una brioche giocosa.</i>
                ~ kitchen_recipeNoun = "Brioche"
                -> glyph_choice_manager(true, airC)->
                {charTag(SecondCharacter, "energy")}:           E a cosa giochi?
                                                                A me piace tantissimo fare quelli di intelligenza ora.
                                                                Quando sono a casa di mio fratello posso starci tutto il tempo che voglio!
             
            + (water1)\ {charTag(PG, "neutral")}:               <i>Impasto un preparato per crostate socievoli.</i>
               ~ kitchen_recipeNoun = "Crostata"
               -> glyph_choice_manager(true, waterC)->
               {charTag(SecondCharacter, "neutral")}:           Nel senso che stai sempre con le persone?
                                                                Sempre?
               {charTag(SecondCharacter, "melanchonic")}:       Anche dopo la scuola e il lavoro?
        
            + (aether1)\ {charTag(PG, "neutral")}:              <i>Pulisco le formine per una mousse artistica.</i>
                ~ kitchen_recipeNoun = "Mousse"
                -> glyph_choice_manager(true, aetherC)->
                {charTag(SecondCharacter, "neutral")}:          Mmm.
                                                                So che è roba che piace a {charNameOne}.
                                                                A me mi piace fare le cose.
                                                                Ma non so se mi piace guardarle.
    
            + (earth1)\ {charTag(PG, "neutral")}:               <i>Raffreddo la frutta per una granita sonnacchiosa.</i>
                ~ kitchen_recipeNoun = "Granita"
                -> glyph_choice_manager(true, earthC)->
                {grimoire_firstChar has grimFirstSecondChar: Ancora con questa cosa del dormire!|Che balle dormire!}
                {charTag(SecondCharacter, "angry")}:            Ci sono così tante cose da fare!
                {charTag(SecondCharacter, "neutral")}:          Che noia!
            -
        {charTag(SecondCharacter, "energy")}:                   Posso schiacciare qualcosa?
                                                                Mi piace schiacciare le cose perché alcune vanno dappertutto, altre fanno l'olio, altre sembrano dei dischi volanti!    
                                                                E mi piace prevedere cosa succederà.
        {charTag(SecondCharacter, "neutral")}:                  Mi piacciono le cose che si possono prevedere.
                                                                Anche per questo mi piacciono gli animali.
                                                                Non è che un leone all'improvviso fa il ragioniere.
                                                                O un coniglio diventa campione di videogiochi.
        {charTag(SecondCharacter, "melanchonic")}:              E poi gli animali non sono cattivi.
        {charTag(SecondCharacter, "neutral")}:                  Fanno le cose che devono fare.
                                                                E litigano per le cose importanti per loro.
        {charTag(SecondCharacter, "angry")}:                    Ma non fanno male solo perché gli piace fare male.
        {charTag(SecondCharacter, "neutral")}:                  A parte i gatti.
        {charTag(SecondCharacter, "angry")}:                    Che non mi piacciono.
        {charTag(SecondCharacter, "energy")}:                   Però mi piace immaginare le persone come animali.
        {charTag(SecondCharacter, "neutral")}:                  Mi aiuta a capirle.
                                                                E a prevedere di più cosa faranno.
        {charTag(SecondCharacter, "energy")}:                   {charNameOne} per esempio mi ricorda un quokka perché con me è sempre giocosa.
        {charTag(SecondCharacter, "neutral")}:                  Mentre {charNameFive} mi sembra un delfino perché sono simpatici fino a quando non sai cosa fanno davvero.
                                                                E tu invece.
                                                                No, dimmelo tu.
        {charTag(SecondCharacter, "energy")}:                   Che animale sei?

            + \ {charTag(PG, "neutral")}:                       L'affettuoso cane.
                    -> glyph_choice_manager(false, waterC)->
                {charTag(SecondCharacter, "energy")}:           I cani copiano tantissime cose degli umani, lo sapevi?
                {charTag(SecondCharacter, "melanchonic")}:      Quando cammini si muovono al tuo passo.
                                                                E se stai male stanno male anche loro.
                {charTag(SecondCharacter, "melanchonic")}:      Ora che ci penso forse è meglio se non ce ne abbiamo uno a casa.
                
            + \ {charTag(PG, "neutral")}:                       Il combattivo leone!
                    -> glyph_choice_manager(false, fireC)->
                {charTag(SecondCharacter, "neutral")}:          Sì no boh.
                {charTag(SecondCharacter, "angry")}:            I leoni sono noiosi.
                {charTag(SecondCharacter, "neutral")}:          Dormono tantissimo.
                                                                Come i gatti.
                                                                Però da piccoli sono suuuuperincapaci di camminare.
                {charTag(SecondCharacter, "energy")}:           Quello è divertente.
        
            + \ {charTag(PG, "neutral")}:                       Il misterico corvo.
                    -> glyph_choice_manager(false, aetherC)->
               {charTag(SecondCharacter, "energy")}:            Sai che i corvi si insegnano tra loro le cose?
               {charTag(SecondCharacter, "neutral")}:           E che se li fai arrabbiare se lo ricordano per sempre.
                                                                Una volta un amico di mamma ha spaventato un corvo con la sua moto.
               {charTag(SecondCharacter, "energy")}:            E ora tutte le volte che viene da noi il corvo gli graffia la moto!
            
            + \ {charTag(PG, "neutral")}:         L'intelligente civetta.
                    -> glyph_choice_manager(false, airC)->
                {charTag(SecondCharacter, "energy")}:           Sapevi che le civette vedono il calore con le orecchie?
                                                                E che i piccoli quando piangono sembrano bambini?
                                                                E poi non hanno.
                {charTag(SecondCharacter, "emotional")}:        Non hanno il sedere!
                {charTag(SecondCharacter, "energy")}:           Chissà se fanno le puzzette.
               
            + \ {charTag(PG, "neutral")}:         Un{player_pronouns has him:o|{player_pronouns has her:a|ə}} prociors{player_pronouns has him:o|{player_pronouns has her:a|ə}}!
                    -> glyph_choice_manager(false, earthC)->
                {charTag(SecondCharacter, "energy")}:           Sììììì!!!
                                                                Possiamo tuffarci nell'acqua ora assieme?
                                                                Mi insegni a nuotare?
                                                                Rubiamo il miele alle api della serra?
                {charTag(SecondCharacter, "emotional")}:        Spaventiamo {charNameOne}?
                                                                Mi fa ridere tantissimissimo quando urla!   
            -
        {charTag(SecondCharacter, "energy")}:                   Il profumo è buono.
                                                                Ma quindi mangiamo solo dolce oggi?
        {charTag(SecondCharacter, "emotional")}:                Questa è una cosa bellissima!
        {charTag(SecondCharacter, "energy")}:                   Ma tu capisci sempre le persone?
        
            + (air2)\ {charTag(PG, "neutral")}:                 <i>Aggiungo del caramello della perplessità.</i>
                ~ kitchen_recipeAdjective = "perplessità"
                -> glyph_choice_manager(true, airC)->
                {charTag(SecondCharacter, "neutral")}:          Anche io.
                {charTag(SecondCharacter, "melanchonic")}:      Sono così difficili.
                {charTag(SecondCharacter, "neutral")}:          È come capire degli animaletti strani.
                                                                Come l'aye-aye o il rinopiteco.
                                                                Ma almeno quello so che se piove starnutisce.
                {charTag(SecondCharacter, "melanchonic")}:      Mentre mamma a volte è felice e a volte si arrabbia.

            + (aether2) \ {charTag(PG, "neutral")}:             <i>Spolvero del cacao della convinzione.</i>
                ~ kitchen_recipeAdjective = "convinzione"
                -> glyph_choice_manager(true, aetherC)->
                {charTag(SecondCharacter, "neutral")}:          Magari mentre siamo assieme capisco qualcosa da te allora.
                                                                Magari.
             
            + (fire2)\ {charTag(PG, "neutral")}:                <i>Verso dello sciroppo della negazione.</i>
               ~ kitchen_recipeAdjective = "negazione"
               -> glyph_choice_manager(true, fireC)->
                {charTag(SecondCharacter, "neutral")}:          Magari allora puoi provare anche tu con gli animali.
                                                                O un'altra cosa che ti piace.
                {charTag(SecondCharacter, "energy")}:           L'amico di mio fratello usa i segni zodiacali.
                                                                Che non hanno assolutamente senso.
                {charTag(SecondCharacter, "neutral")}:          Contento lui.
                
            + (earth2)\ {charTag(PG, "neutral")}:               <i>Grattugio della noce della vicinanza.</i>
                ~ kitchen_recipeAdjective = "vicinanza"
                -> glyph_choice_manager(true, earthC)->
                {charTag(SecondCharacter, "neutral")}:          Si no boh.
                                                                Le persone vicine mi sembrano ancora più incasinate.
                {charTag(SecondCharacter, "melanchonic")}:      Per loro devo avere almeno tre animali per capirle.
    
            + (water2)\ {charTag(PG, "neutral")}:               <i>Mescolo della vaniglia della solitudine.</i>
                ~ kitchen_recipeAdjective = "solitudine"
                -> glyph_choice_manager(true, waterC)->
                {charTag(SecondCharacter, "neutral")}:          Già.
                                                                Si no boh.
                                                                Quindi capita anche alle altre persone.
                                                                Wow.
            -      

        {charTag(SecondCharacter, "neutral")}:                  Intanto preparo del succo.
                                                                Ma non con le cose della serra, perché fanno cose strane.
        {charTag(SecondCharacter, "energy")}:                   A me piacciono le cose strane.
        {charTag(SecondCharacter, "melanchonic")}:              Ma le persone mi dicono sempre che sono strano.
        {charTag(SecondCharacter, "neutral")}:                  La cosa che mi dicono di più a casa è "Ma perché fai così?!?!"
                                                                Con un sacco di gesti delle mani.
                                                                E io provo a spiegarlo ma mica mi capiscono.
        {charTag(SecondCharacter, "angry")}:                    E poi si arrabbiano perché mi dicono delle cose ma non sono davvero le cose che vogliono.
        {charTag(SecondCharacter, "neutral")}:                  I grandi sono strani.
                                                                Ti dicono una cosa ma ne vogliono un'altra e quindi tu sbagli sempre alla fine.
                                                                E dicono a me che sono strano.

            + \ {charTag(PG, "neutral")}:                       Serve metodo e disciplina per comunicare in modo efficace.
                    -> glyph_choice_manager(false, airC)->
                {charTag(SecondCharacter, "angry")}:            Puoi dirlo un bambinese?
                                                                Ogni volta che un grande dice "disciplina", è solo perché non c'ha voglia di capirmi.
                                                                Come le maestre che mi mettono in castigo.
                {charTag(SecondCharacter, "melanchonic")}:      Tutti mettono in castigo ma nessuno chiede il perché.
             
             //Più terra  
            + \ {charTag(PG, "neutral")}:                       La stranezza è qualcosa che arricchisce il mondo.
                    -> glyph_choice_manager(false, earthC)->
                {charTag(SecondCharacter, "energy")}:           Sì!
                                                                Come le bussole, che sono suuuuperstrane!
                                                                O quando la benzina fa gli arcobaleni per terra.
                                                                O papà che si arrabbia con le persone in televisione.
             
            + \ {charTag(PG, "neutral")}:                       Fregatene. Hai tutto il diritto di essere strano!
                    -> glyph_choice_manager(false, fireC)->
                {charTag(SecondCharacter, "neutral")}:          Sì no boh.
                {charTag(SecondCharacter, "angry")}:            Tu lo dici, ma mica sei tu ad andare in punizione!
        
            + \ {charTag(PG, "neutral")}:                       Spesso gli adulti non sanno cosa provano o vogliono, amico mio.
                    -> glyph_choice_manager(false, waterC)->
                {charTag(SecondCharacter, "neutral")}:          Sì no boh.
                {charTag(SecondCharacter, "angry")}:            Ma io che c'entro?
                {charTag(SecondCharacter, "melanchonic")}:      Magari me lo possono dire invece di sgridarmi.
    
            + \ {charTag(PG, "neutral")}:         C             iò che è strano porta risposte a domande che non ci siamo ancora fatt3.
                -> glyph_choice_manager(false, aetherC)->
               {charTag(SecondCharacter, "neutral")}:           Eh?
                                                                Però le domande mi piacciono.
               {charTag(SecondCharacter, "melanchonic")}:       Anche se poi papà dice che gli rompo le palle.
               {charTag(SecondCharacter, "neutral")}:           Ultimamente mi dice: "Chiedi al tablet, sant'Iddio!".
               {charTag(SecondCharacter, "emotional")}:         Così posso usare il tablet anche a cena.
            -
        
        {charTag(SecondCharacter, "neutral")}:                  No non mettere lo zucchero a velo, non mi piace.
                                                                Mi fa venire la tosse e poi mi sporco tutto!
                                                                A me non piace essere strano.
        {charTag(SecondCharacter, "melanchonic")}:              Io voglio essere me.
                                                                Nessuno dice a {charNameFive} che è strana.
        {charTag(SecondCharacter, "neutral")}:                  E lo è tanto. 
                                                                Ma se si preoccupa tantissimo per qualcosa, {charNameOne} dice solo "Che ci vuoi fare, è {charNameTwo}".
                                                                Voglio solo essere me.
                                                                A te ti piace come ti trattano le altre persone?

            + (air3)\ {charTag(PG, "neutral")}:                 <i>Guarnisco con delle ciliege deluse.</i>
                ~ kitchen_recipeComplement = "ciliege deluse"
                -> glyph_choice_manager(true, airC)->
                {charTag(SecondCharacter, "neutral")}:          A mamma piace tanto quella parola.
                                                                Delusa.
                {charTag(SecondCharacter, "melanchonic")}:      Di solito quando dice "{charNameTwo}, mi hai delusa."
                {charTag(SecondCharacter, "neutral")}:          Poi le ciliege deludono sempre.
                                                                Te le ricordi più buone.
                                                                Poi le mangi e bleah!
               
            + (earth3)\ {charTag(PG, "neutral")}:               <i>Decoro con della granella soddisfatta.</i>
                ~ kitchen_recipeComplement = "granella soddisfatta"
                -> glyph_choice_manager(true, earthC)->
                {charTag(SecondCharacter, "neutral")}:          Deve essere bello.
                                                                Come l'amico di mio fratello.
                {charTag(SecondCharacter, "emotional")}:        Mio fratello dice che ha un cuore grande e gli vogliono tutti bene.
             
            + (water3)\ {charTag(PG, "neutral")}:               <i>Rifinisco con della glassa sofferente.</i>
               ~ kitchen_recipeComplement = "glassa sofferente"
               -> glyph_choice_manager(true, waterC)->
                {charTag(SecondCharacter, "neutral")}:          Mmm.
                                                                Mi dispiace.
        
            + (fire3)\ {charTag(PG, "neutral")}:                <i>Aggiungo delle crema migliorante.</i>
                ~ kitchen_recipeComplement = "con crema migliorante"
                -> glyph_choice_manager(true, fireC)->
                {charTag(SecondCharacter, "neutral")}:          Nonna dice che tutto migliora, sempre.
                                                                Però a me interessa più che una cosa arriva da qualche parte.
                                                                Mica puoi migliorare all'infinito.
                                                                Non c'ha senso.
    
            + (aether3)\ {charTag(PG, "neutral")}:              <i>Spalmo della confettura altalenante.</i>
                ~ kitchen_recipeComplement = "confettura altalenante"
                -> glyph_choice_manager(true, aetherC)->
                {charTag(SecondCharacter, "neutral")}:          Cioè che dipende dalle persone?
                                                                O dalla persona?
                {charTag(SecondCharacter, "melanchonic")}:      Come mamma che un giorno ti adora e poi il giorno dopo non ti parla più?
            -  
        
        {charTag(SecondCharacter, "neutral")}:                  Mi sa che questo dolce lo faccio anche a mio fratello.
            -> fourth_ingredient_dispatcher
    
    = second_theme
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    

            {charTag(SecondCharacter, "angry")}:                Bleah.
                                                                Ma questa è una punizione!
                                                                La scuola fa schifo.
                                                                Ed è tutto lento.
            {charTag(SecondCharacter, "neutral")}:              Mi annoia tantissimo.
            {charTag(SecondCharacter, "angry")}:                A scuola sono sempre in punizione.
            {charTag(SecondCharacter, "melanchonic")}:          O prendo le note.
            {charTag(SecondCharacter, "angry")}:                Ma mi annoio.
                                                                Mi annoio.
            {charTag(SecondCharacter, "energy")}:               Quando ci sono i compiti finisco subito.
            {charTag(SecondCharacter, "neutral")}:              E non so mica cosa fare.
            {charTag(SecondCharacter, "energy")}:               A volte leggo.
                                                                A volte faccio cadere le cose per raccoglierle.
            {charTag(SecondCharacter, "neutral")}:              O vado in bagno.
                                                                Ma si può andare in bagno solo una volta per lezione.
            {charTag(SecondCharacter, "angry")}:                Che è una cosa stupida.
            {charTag(SecondCharacter, "neutral")}:              E infatti una volta Cristian della terza si è fatto la pipì addosso.
            {charTag(SecondCharacter, "emotional")}:            Mettiamo le noccioline?
            {charTag(SecondCharacter, "angry")}:                Le punizioni sono stupide.
                
                + \ {charTag(PG, "neutral")}:                   E l3 ribelli si oppongono alle punizioni!
                        -> glyph_choice_manager(false, fireC)->
                    {charTag(SecondCharacter, "neutral")}:      Però poi mi sgridano di più.
                                                                Una volta ci ho provato ma hanno chiamato mamma.
                                                                E mi hanno dato cinque note.
                    {charTag(SecondCharacter, "melanchonic")}:  E mamma era così arrabbiata che mi ha chiuso in camera per un giorno intero.

                + \ {charTag(PG, "neutral")}:                   Punire non porta conoscenza, non si impara nulla, no?
                        -> glyph_choice_manager(false, airC)->
                    {charTag(SecondCharacter, "energy")}:       LO SAPEVO!
                    {charTag(SecondCharacter, "neutral")}:      Ti fanno solo arrabbiare.
                                                                E piangere.
                    {charTag(SecondCharacter, "angry")}:        E a nessuno piace piangere!
            
                + \ {charTag(PG, "neutral")}:                   A chi serve la punizione? A chi la fa o a chi la subisce?
                        -> glyph_choice_manager(false, aetherC)->
                    {charTag(SecondCharacter, "angry")}:        A me non mi fa mica bene.
                    {charTag(SecondCharacter, "neutral")}:      La maestra dice sempre "Mi dispiace metterti in punizione, davvero."
                                                                Ma io mica ci credo.
                                                                L'altra settimana mi ha messo in castigo otto volte.
                                                                Mi sa che non le dispiace così tanto.
                
                + \ {charTag(PG, "neutral")}:                   A volte però serve anche capire che ci sono conseguenze per ciò che si fa.
                        -> glyph_choice_manager(false, earthC)->
                    {charTag(SecondCharacter, "neutral")}:      Uhm.
                    {charTag(SecondCharacter, "angry")}:        Allora me lo possono spiegare, non sono scemo.
                    {charTag(SecondCharacter, "neutral")}:      Come quando per sbaglio ho fatto scappare il pappagallino della preside.
                                                                E poi hanno trovato Ciro, il gatto del cortile, che se ne mangiava uno.
                    {charTag(SecondCharacter, "melanchonic")}:  Povero pappagallino.
                                                                E hanno messo in castigo anche Ciro, povero.                                        
                    
                + \ {charTag(PG, "neutral")}:                   Chi punisce non riesce ad ascoltare il suo cuore.
                        -> glyph_choice_manager(false, waterC)->
                    {charTag(SecondCharacter, "neutral")}:      Si no boh.
                                                                Mio fratello però dice una cosa come questa qui che hai detto tu.
                                                                Che papà è sempre arrabbiato perché non ascolta le sue emozioni.
                    {charTag(SecondCharacter, "melanchonic")}:  Magari è una cosa dei grandi?
            -
        
            {charTag(SecondCharacter, "energy")}:               Posso usare la grattugia?
                                                                Mi piace tanto grattugiare le cose!    
            {charTag(SecondCharacter, "neutral")}:              Mi puniscono, ma poi sono il più bravo.
            {charTag(SecondCharacter, "angry")}:                Che è una cosa ancora più stupida.
            {charTag(SecondCharacter, "energy")}:               Tu sei {player_pronouns has him:il più bravo|{player_pronouns has her:la più brava|lə più bravə}} in quello che fai?

                -> kitchen_moon_feedback -> 
            
            +(air1) \ {charTag(PG, "neutral")}:                 <i>Preparo un mediocre stampo da cupcake.</i>
                ~ kitchen_recipeNoun = "Cupcake"
                -> glyph_choice_manager(true, airC)->
                    {charTag(SecondCharacter, "neutral")}:      Nonna dice sempre che la virtù sta a metà.
                                                                Mamma dice che è una frase da perdenti.

            + (fire1)\ {charTag(PG, "neutral")}:                <i>Pulisco le migliori formine da muffin.</i>
                ~ kitchen_recipeNoun = "Muffin"
                -> glyph_choice_manager(true, fireC)->
                    {charTag(SecondCharacter, "energy")}:       Sii.
                                                                Tra migliori ci capiamo!!!
             
            + (water1)\ {charTag(PG, "neutral")}:               <i>Infarino la peggior teglia per tartellette.</i>
               ~ kitchen_recipeNoun = "Tartellette "
               -> glyph_choice_manager(true, waterC)->
                    {charTag(SecondCharacter, "neutral")}:      Uh.
                                                                Io ad esempio sono il peggiore a ginnastica.
                                                                Solo Lara è peggio di me.
                    {charTag(SecondCharacter, "melanchonic")}:  Ma mi batte a inglese.
        
            +(aeterh1) \ {charTag(PG, "neutral")}:              <i>Riscaldo l'unica piastra da waffle.</i>
                ~ kitchen_recipeNoun = "Waffle"
                -> glyph_choice_manager(true, aetherC)->
                    {charTag(SecondCharacter, "neutral")}:      Sulla cima.
                    {charTag(SecondCharacter, "energy")}:       Anche io ci arrivo.
                                                                Sì sì.

                //Più terra   
            +(earth1) \ {charTag(PG, "neutral")}:               <i>Controllo una disperata teglia da plumcake.</i>
                ~ kitchen_recipeNoun = "Plumcake"
                -> glyph_choice_manager(true, earthC)->
                    {charTag(SecondCharacter, "neutral")}:      Mi sembra piena di buchi, {player_name}.
                    {charTag(SecondCharacter, "melanchonic")}:  Che vuole dire?
                    {charTag(SecondCharacter, "angry")}:        Non capisco.
            -  

            {charTag(SecondCharacter, "neutral")}:              Per un po' a scuola hanno tolto i voti.
                                                                Le maestre dicono che se guardiamo i voti poi non impariamo, cerchiamo solo di vincere.
                                                                Cosa non l'ho capito.
                                                                Però alcune mamme si sono arrabbiate.
                                                                Anche la mia.
            {charTag(SecondCharacter, "emotional")}:            Posso assaggiare l'impasto?
            {charTag(SecondCharacter, "neutral")}:              {charNameOne} ha lasciato solo cose vegane.
            {charTag(SecondCharacter, "emotional")}:            Però sono buone!
            {charTag(SecondCharacter, "neutral")}:              Se c'è una cosa che mi fa arrabbiare della mamma, è che quando si tratta di scuola lei sa solo arrabbiarsi.
            {charTag(SecondCharacter, "melanchonic")}:          Se torno con un bel voto mi dice "Hai fatto il tuo dovere!" e poi torna a fare le sue cose.
            {charTag(SecondCharacter, "angry")}:                Ma se combino qualcosa, vengo punito.
            {charTag(SecondCharacter, "neutral")}:              E poi dice a tutti che sono bravo.
                                                                Quando siamo in giro dice "Come sono orgogliosa di {charNameTwo}, è il più bravo della classe!"
                                                                E ho visto che se faccio un casino, più è grosso il casino più dice che sono bravo a scuola.
            {charTag(SecondCharacter, "melanchonic")}:          Ma poi a casa si arrabbia.
            {charTag(SecondCharacter, "neutral")}:              Mio fratello dice che non devo ascoltare mamma, perché non serve essere i più bravi, ma essere brave persone.
            {charTag(SecondCharacter, "melanchonic")}:          Mamma dice che lui dice così perché non ha nemmeno finito le superiori.
            {charTag(SecondCharacter, "energy")}:               Nonna dice che serve essere furbi.
            {charTag(SecondCharacter, "melanchonic")}:          Io non so mica se posso essere tutte queste cose.

                + \ {charTag(PG, "neutral")}:                   Essere te stesso vuol dire già essere un intero universo.
                        -> glyph_choice_manager(false, aetherC)->
                    {charTag(SecondCharacter, "energy")}:       Questo l'ha detto anche la maestra di scienze.
                    {charTag(SecondCharacter, "neutral")}:      Che noi per i virus siamo così grandi come la Terra lo è per noi!
                                                                A volte sono a letto e penso a tutti questi piccoli virus.
                                                                Magari hanno intere città dentro di me.
                    {charTag(SecondCharacter, "energy")}:       E ogni volta che respiro si mettono a nuotare nell'aria?

                + \ {charTag(PG, "neutral")}:                   L'unica cosa razionale che puoi fare, è essere te stesso.
                        -> glyph_choice_manager(false, airC)->
                    {charTag(SecondCharacter, "neutral")}:      Sì no boh.
                                                                Un cane è un cane.
                                                                Un gatto un gatto.
                    {charTag(SecondCharacter, "melanchonic")}:  Quindi io posso solo essere io?
    
                + \ {charTag(PG, "neutral")}:                   Concordo con tuo fratello: ciò che conta è essere brave persone.
                        -> glyph_choice_manager(false, waterC)->
                    {charTag(SecondCharacter, "neutral")}:      Mio fratello è una brava persona.
                                                                Anche il suo amico.
                                                                Anche nonna.
                                                                Però dicono sempre che la vita è difficile.
                    {charTag(SecondCharacter, "melanchonic")}:  Forse non è così bello essere brave persone.
         
                + \ {charTag(PG, "neutral")}:                   Nonna ha ragione, serve un po' di pratica furbizia, {charNameTwo}.
                        -> glyph_choice_manager(false, earthC)->
                    {charTag(SecondCharacter, "neutral")}:      Sì no boh.
                                                                Boh.
                                                                Io non so mica essere furbo.
                    {charTag(SecondCharacter, "melanchonic")}:  Capisco le battute in ritardo, come faccio a fare le cose prima degli altri?
                    {charTag(SecondCharacter, "energy")}:       Però so fare le cose in modo strategico.
                                                                Uno è furbo anche se ci mette più tempo?
                    
                + \ {charTag(PG, "neutral")}:                   L'importante è essere lotta, cambiamento, fuoco!
                        -> glyph_choice_manager(false, fireC)->
                    {charTag(SecondCharacter, "energy")}:       Il fuoco mi piace.
                    {charTag(SecondCharacter, "neutral")}:      Ma a casa non me lo fanno toccare perché una volta ho.
                    {charTag(SecondCharacter, "melanchonic")}:  È una cosa brutta.
                    {charTag(SecondCharacter, "neutral")}:      Volevo vedere cosa succede alle code dei gatti.
                    {charTag(SecondCharacter, "melanchonic")}:  Ora la vicina non mi parla più.
                -
            
            {charTag(SecondCharacter, "energy")}:               Ho trovato della cannella!
                                                                Mi piace la cannella.
            {charTag(SecondCharacter, "emotional")}:            Possiamo metterla?
            {charTag(SecondCharacter, "neutral")}:              Papà dice che lui è bravo a lavoro perché è capace di fare le cose sotto pressione.
                                                                E che il capo all'inizio diceva che era uno che <i>cazzeggiava</i>, ma poi ha visto che corre tantissimo con le scadenze.
            {charTag(SecondCharacter, "melanchonic")}:          A me la pressione non mi piace.
            {charTag(SecondCharacter, "angry")}:                Mi agita.
            {charTag(SecondCharacter, "neutral")}:              Mio fratello invece dice che lavora bene quando c'è tanto casino.
                                                                E te?
            {charTag(SecondCharacter, "melanchonic")}:          Magari poi io parlo tanto e tu cucini e ti agiti?
        
                + (water2)\ {charTag(PG, "neutral")}:           <i>Trito della menta isolata.</i>
                    ~ kitchen_recipeAdjective = "solitudine"
                    -> glyph_choice_manager(true, waterC)->
                    {charTag(SecondCharacter, "neutral")}:      Deve essere difficile questo lavoro allora.
                                                                Perché c'è sempre gente in giro.
                                                                E devi parlare con noi.
                
                + (fire2)\ {charTag(PG, "neutral")}:            <i>Sbuccio della vaniglia frenetica.</i>
                    ~ kitchen_recipeAdjective = "frenesia"
                    -> glyph_choice_manager(true, fireC)->
                                                                Un po' come {charNameFive} allora.
                                                                Che corre sempre da una parte all'altra.
                
                + (earth2)\ {charTag(PG, "neutral")}:           <i>Spremo del cedro organizzato.</i>
                    ~ kitchen_recipeAdjective = "organizzazione"
                    -> glyph_choice_manager(true, earthC)->
                    {charTag(SecondCharacter, "neutral")}:      Io ci provo a organizzarmi.
                                                                Ma non mi viene benissimo.
                                                                Voglio fare le cose con calma.
                    {charTag(SecondCharacter, "melanchonic")}:  Ma poi finisco nel caos.
            
                + (air2)\ {charTag(PG, "neutral")}:             <i>Setaccio della cannella ritardataria.</i>
                    ~ kitchen_recipeAdjective = "procrastinazione"
                    -> glyph_choice_manager(true, airC)->
                    {charTag(SecondCharacter, "neutral")}:      Lara in classe fa sempre così.
                                                                Arriva sempre il giorno dopo coi compiti.
                    {charTag(SecondCharacter, "energy")}:       La maestra dice che Lara si dimenticherà la testa a casa un giorno.
                                                                Sarebbe suuuuuuperdivertente!
        
                + (aether2)\ {charTag(PG, "neutral")}:          <i>Frullo del caffè caotico.</i>
                    ~ kitchen_recipeAdjective = "caoticità"
                    -> glyph_choice_manager(true, aetherC)->
                    {charTag(SecondCharacter, "angry")}:        Io non posso bere il caffè.
                    {charTag(SecondCharacter, "neutral")}:      Mamma dice che faccio già abbastanza casini da solo.
                    {charTag(SecondCharacter, "energy")}:       Però conosco il caos.
                -      

        {charTag(SecondCharacter, "emotional")}:                Mi sa che mi preparo del succo.
        {charTag(SecondCharacter, "energy")}:                   A te ti piace?
        {charTag(SecondCharacter, "neutral")}:                  C'è una cosa che voglio dirti.
                                                                E che dico solo a te.
                                                                Perché sembra triste.
        {charTag(SecondCharacter, "angry")}:                    Ma non mi piace quando le persone sono tristi per me.
        {charTag(SecondCharacter, "energy")}:                   A scuola ho un posto segreto.
        {charTag(SecondCharacter, "neutral")}:                  C'è una porticina che si nasconde nel muro, e che porta sotto il tetto.
                                                                E lì c'è un sacco di polvere e scatole.
                                                                Ma ci sono le finestre e c'è luce.
                                                                E allora mi metto lì a leggere.
                                                                A volte durante l'intervallo, così mi lasciano in pace.
                                                                A volte anche durante le lezioni.
        {charTag(SecondCharacter, "angry")}:                    Le maestre mi mettono le note.
        {charTag(SecondCharacter, "emotional")}:                Ma non mi hanno ancora scoperto.
        {charTag(SecondCharacter, "neutral")}:                  Ci ho letto tutto "La storia infinita".
        {charTag(SecondCharacter, "energy")}:                   Due volte.
        {charTag(SecondCharacter, "neutral")}:                  E un libro sugli insetti della città che mi ha dato mio fratello.
        {charTag(SecondCharacter, "emotional")}:                È il mio posto segreto.

            + \ {charTag(PG, "neutral")}:                       Ogni guerrierə ha bisogno di riposarsi prima della battaglia.
                    -> glyph_choice_manager(false, fireC)->
                {charTag(SecondCharacter, "angry")}:            Ma io mica voglio fare il guerriero.
                {charTag(SecondCharacter, "neutral")}:          Ma non mi voglio annoiare con le tabelline.
                                                                C'è la calcolatrice.
                {charTag(SecondCharacter, "energy")}:           E i numeri non si toccano, mentre i delfini sì!
        
            + \ {charTag(PG, "neutral")}:                       Hai un tuo nido, un posto sicuro, tutto per te.
                    -> glyph_choice_manager(false, waterC)->
                {charTag(SecondCharacter, "energy")}:           Sì!
                {charTag(SecondCharacter, "neutral")}:          Cerco sempre di non farmi scoprire perché non voglio vengano altri bambini.
                                                                Una volta ci sono rimasto quando è chiusa la scuola.
                                                                Mamma era preoccupata ma mi è piaciuto tantissimo.
                                                                Pioveva, non si sentiva niente.
                {charTag(SecondCharacter, "emotional")}:        È stato il mio giorno più bello.

            + \ {charTag(PG, "neutral")}:                       Quindi ci impari quello che la scuola non ti insegna.
                    -> glyph_choice_manager(false, airC)->
                {charTag(SecondCharacter, "emotional")}:        Sì!
                {charTag(SecondCharacter, "neutral")}:          A me non mi interessa mica la storia.
                                                                Ci sono solo nomi e date e mi rompo.
                                                                E allora prendo i libri sui delfini.
                {charTag(SecondCharacter, "energy")}:           Quelli mi piacciono.
    
            + \ {charTag(PG, "neutral")}:                       "Ma i desideri non si possono evocare, né soffocare a piacimento."
                    -> glyph_choice_manager(false, aetherC)->
                {charTag(SecondCharacter, "energy")}:           L'hai letto anche tu!
                {charTag(SecondCharacter, "neutral")}:          Quella frase me l'ha spiegata mio fratello.
                                                                E mi è piaciuta, perché ai grandi non piace sempre quando vuoi qualcosa.
                {charTag(SecondCharacter, "angry")}:            Ma non è mica che lo faccio apposta.
                {charTag(SecondCharacter, "energy")}:           E ora lo dice anche un libro!

            + \ {charTag(PG, "neutral")}:                       "Ma ci sono cose che non si possono capire con la riflessione, bisogna viverle."
                    -> glyph_choice_manager(false, earthC)->
                {charTag(SecondCharacter, "energy")}:           L'hai letto anche tu?!?!
                                                                Il tipo che l'ha scritto era strano.
                {charTag(SecondCharacter, "emotional")}:        Ma strano bello.
                {charTag(SecondCharacter, "neutral")}:          Nonna dice che andava sempre in giro con una bussola e dei pupazzi e una pietra.
                {charTag(SecondCharacter, "energy")}:           Mi piacciono le bussole!
            -
        
        {charTag(SecondCharacter, "emotional")}:                Che profumino!
        {charTag(SecondCharacter, "neutral")}:                  Mi sa che manca poco.
        {charTag(SecondCharacter, "energy")}:                   Posso assaggiare?
        {charTag(SecondCharacter, "angry")}:                    Scotta!
        {charTag(SecondCharacter, "neutral")}:                  Però ora che ci penso.
                                                                Così sembra che le persone non mi piacciono.
        {charTag(SecondCharacter, "energy")}:                   Ma a me piacciono tanto, {player_name}.
        {charTag(SecondCharacter, "melanchonic")}:              Solo che non le capisco.
        {charTag(SecondCharacter, "neutral")}:                  Mi piace stare da solo.
        {charTag(SecondCharacter, "melanchonic")}:              Ma non mi piace sentirmi solo.
        {charTag(SecondCharacter, "neutral")}:                  E boh.
                                                                Forse sono qui perché mi sento solo.
        {charTag(SecondCharacter, "energy")}:                   Magari con te capisco come fare?
        {charTag(SecondCharacter, "neutral")}:                  Tu ti senti {player_pronouns has him:solo|{player_pronouns has her:sola|solə}}?

            + (water3)\ {charTag(PG, "neutral")}:                <i>Do una spolverata di moltissimo cacao.</i>
                ~ kitchen_recipeComplement = "moltissimo cacao"
                -> glyph_choice_manager(true, waterC)->
                {charTag(SecondCharacter, "energy")}:           Però ora hai me!
                {charTag(SecondCharacter, "emotional")}:        E {charNameOne}!
                {charTag(SecondCharacter, "energy")}:           E me!
                
            + (air3)\ {charTag(PG, "neutral")}:                 <i>Incorporo un poco di marmellata.</i>
                ~ kitchen_recipeComplement = "poca marmellata"
                -> glyph_choice_manager(true, airC)->
                {charTag(SecondCharacter, "neutral")}:          In effetti già qui hai fatto tante amicizie, vero?
                {charTag(SecondCharacter, "emotional")}:        Anche con me.
             

            + (earth3)\ {charTag(PG, "neutral")}:               <i>Non aggiungo nulla: è tutto perfetto così.</i>
               ~ kitchen_recipeComplement = "aria perfetta"
               -> glyph_choice_manager(true, earthC)->
                {charTag(SecondCharacter, "energy")}:           Woah.
                                                                Deve essere bello.
                {charTag(SecondCharacter, "melanchonic")}:      Spero di essere anche io tuo amico!
        
            + (fire3)\ {charTag(PG, "neutral")}:                <i>Spennello della glassa solitaria.</i>
                ~ kitchen_recipeComplement = "glassa solitaria"
                -> glyph_choice_manager(true, fireC)->
                {charTag(SecondCharacter, "neutral")}:          Mio fratello è uno solitario.
                                                                Dice che è un orso.
                                                                Anche il suo amico dice che è un orso.
                                                                E poi ridono.
                {charTag(SecondCharacter, "angry")}:            Non capisco mai perché.
    
            + (aether3)\ {charTag(PG, "neutral")}:              <i>Farcisco con pochi ma affidabili pezzetti di cioccolato.</i>
                ~ kitchen_recipeComplement = "affidabili pezzetti di cioccolato"
                -> glyph_choice_manager(true, aetherC)->
                {charTag(SecondCharacter, "emotional")}:        Come nonna.
                {charTag(SecondCharacter, "neutral")}:          Che dice che la vita ti da un grande amore, due grandi amicizie, tre grandi rotture di gatto.
                                                                Non abbiamo un gatto.
                                                                Quindi non ne ho rotto nessuno.
                {charTag(SecondCharacter, "melanchonic")}:      A parte quello della vicina.
            -   
        
        {charTag(SecondCharacter, "neutral")}:                  Sono contento che parli di cose serie con me.
        {charTag(SecondCharacter, "angry")}:                    Gli adulti pensano che i bambini siano stupidi.
        {charTag(SecondCharacter, "neutral")}:                  Ma sappiamo tantissime cose.
        {charTag(SecondCharacter, "emotional")}:                Ma ora ho fame.
            -> fourth_ingredient_dispatcher
    
    
    = third_theme
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    

        {charTag(SecondCharacter, "angry")}:                    Mi vuoi sgridare di nuovo?
                                                                Ti ho già chiesto scusa.
        {charTag(SecondCharacter, "melanchonic")}:              Ho imparato la lezione.
            
            + \ {charTag(PG, "neutral")}:                       Bimbo, rilassati, non sono un{player_pronouns has her:a|ə} professor{player_pronouns has him:o|{player_pronouns has her:a|ə}}.
                    -> glyph_choice_manager(false, fireC)->
                {charTag(SecondCharacter, "neutral")}:          Però sei qui per lavorare.
                {charTag(SecondCharacter, "angry")}:            E alle persone che lavorano i bambini danno fastidio.
                {charTag(SecondCharacter, "neutral")}:          Come quando vai in biblioteca e ti prendi bene e fai un po' di rumore e i grandi ti guardano male.
        
            + \ {charTag(PG, "neutral")}:                       Mi spiace, non volevo farti arrabbiare. Vorrei solo parlare con te.
                    -> glyph_choice_manager(false, waterC)->
                {charTag(SecondCharacter, "neutral")}:          Però quello lo facciamo già.
                                                                Anche se non parliamo di bugie.    

            + \ {charTag(PG, "neutral")}:                       No: voglio solo avere le idee più chiare su alcune cose.
                    -> glyph_choice_manager(false, airC)->
                {charTag(SecondCharacter, "angry")}:            Non è che mi stai studiando vero?
                {charTag(SecondCharacter, "neutral")}:          Come con le tigri allo zoo.
                                                                Non sono mica felici loro.

            + \ {charTag(PG, "neutral")}:                       Ora però vorrei imparare io una lezione da te.
                    -> glyph_choice_manager(false, aetherC)->
                {charTag(SecondCharacter, "energy")}:           Quindi sono il tuo professore?
                                                                Allora ti insegno cose sui topi!
                {charTag(SecondCharacter, "emotional")}:        Sapevi che cantano?
                                                                E che ogni topo ha un suo odore?
                                                                E sanno risolvere tantissime cose complicate.
                {charTag(SecondCharacter, "energy")}:           Anche i labirinti.
                {charTag(SecondCharacter, "neutral")}:          Io mi perdo invece nei labirinti!

            + \ {charTag(PG, "neutral")}:                       Abbi pazienza, {charNameTwo}, non tutto è una critica.
                    -> glyph_choice_manager(false, earthC)->
                {charTag(SecondCharacter, "neutral")}:          Sì no boh.
                                                                Alle persone grandi piace sempre criticare gli altri.
                {charTag(SecondCharacter, "emotional")}:        Solo Franco non critica mai nessuno.
                {charTag(SecondCharacter, "energy")}:           Ma non ho capito quanto è grande Franco.
            -  
        {charTag(SecondCharacter, "neutral")}:                  Scusa {player_name}.
        {
            - food_gift_second_char:
                {charTag(SecondCharacter, "emotional")}:        Sono contento di aver fatto pace con {charNameFive}.
                {charTag(SecondCharacter, "angry")}:            Ma sono ancora un po' arrabbiato.
                {charTag(SecondCharacter, "melanchonic")}:      E questo mi fa arrabbiare velocemente.

            - grimoire_fifthChar has grimSecondCharMentorPeace:
                {charTag(SecondCharacter, "angry")}:            Sto ancora cercando di non essere arrabbiato con {charNameFive}.
                {charTag(SecondCharacter, "melanchonic")}:      E non mi piace essere arrabbiato.
                Mi fa arrabbiare di più.

            - else:
                {charTag(SecondCharacter, "angry")}:            Sono ancora arrabbiato con {charNameFive}.
                {charTag(SecondCharacter, "melanchonic")}:      E non mi piace essere arrabbiato.
                                                                Mi fa arrabbiare di più.
        }

        {charTag(SecondCharacter, "emotional")}:                Facciamo qualcosa con la frutta?
        {charTag(SecondCharacter, "neutral")}:                  Mamma pensa che mangio solo schifezze.
                                                                Ma la frutta mi piace.
                                                                C'è una cosa che mi fa arrabbiare tanto tanto quando si parla di bugie.
        {charTag(SecondCharacter, "angry")}:                    Perché in casa sembra che sia solo io a dire le bugie.
        {charTag(SecondCharacter, "neutral")}:                  Ma mamma ne dice tante.
                                                                E le sue sono brutte.
                                                                Perché non dice mai cose giganti.
                                                                No.
                                                                Lei dice che non ha fatto cose che ha fatto.
        {charTag(SecondCharacter, "melanchonic")}:              Cose che non ha fatto a me.
        {charTag(SecondCharacter, "angry")}:                    O mi dà la colpa per cose che ha fatto lei.
        {charTag(SecondCharacter, "melanchonic")}:              E quando lei dice qualcosa, papà le crede sempre.
                                                                E nonna non le crede, ma mi dice che fa finta di crederci per non litigare.
                                                                Le sue bugie fanno male.
        {charTag(SecondCharacter, "neutral")}:                  Le mie no.
                                                                Tutte le bugie sono sbagliate?

            -> kitchen_moon_feedback -> 
        
            + (bugie_innocenti) \ {charTag(PG, "neutral")}:     <i>Sbuccio delle pesche innocenti.</i>
                ~ kitchen_recipeNoun = "Pesche"
                -> glyph_choice_manager(true, airC)->
                {charTag(SecondCharacter, "energy")}:           Esatto!
                                                                Ci sono bugie che non fanno male a nessuno.
                                                                E sono anche carine!
               
            + (bugie_omesse) \ {charTag(PG, "neutral")}:         <i>Affetto delle mele omesse.</i>
                ~ kitchen_recipeNoun = "Mele"
                -> glyph_choice_manager(true, waterC)->
                {charTag(SecondCharacter, "energy")}:           Come quando non dici che hai fatto una cosa.
                                                                Fino a quando non ti scoprono.
                {charTag(SecondCharacter, "melanchonic")}:      Però poi finisci nei guai.
                                                                Grossi.
             
            + (bugie_difensive)\ {charTag(PG, "neutral")}:      <i>Taglio delle pere difensive.</i>
               ~ kitchen_recipeNoun = "Pere"
               -> glyph_choice_manager(true, earthC)->
               {charTag(SecondCharacter, "melanchonic")}:       A scuola servono le bugie per difendersi.
               {charTag(SecondCharacter, "neutral")}:           Tantissime.
               {charTag(SecondCharacter, "angry")}:             Le maestre pensano sempre che hai fatto qualcosa di brutto.
        
            + (bugie_nessuna)\ {charTag(PG, "neutral")}:        <i>Sciacquo delle prugne impeccabili.</i>
                ~ kitchen_recipeNoun = "Prugne"
                -> glyph_choice_manager(true, aetherC)->
                {charTag(SecondCharacter, "neutral")}:          Si no boh.
                                                                Nessuna persona non dice le bugie.
                                                                Anche perché ci ricordiamo sempre le cose diverse da come sono.
                                                                Magari <i>pensi</i> di non dire bugie.
                                                                Ma le dici comunque.
    
            + (bugie_autoinganno)\ {charTag(PG, "neutral")}:    <i>Spremo delle arance dell'autoinganno</i>
                ~ kitchen_recipeNoun = "Arance"
                -> glyph_choice_manager(true, fireC)->
                {charTag(SecondCharacter, "neutral")}:          Come quando mi dico che a ginnastica sono stato bravo.
                                                                Anche se sono caduto con la faccia sulle scarpe di Tommaso.
                {charTag(SecondCharacter, "angry")}:            Che schifo!
            -  
        {charTag(SecondCharacter, "emotional")}:                Posso assaggiare?
        {charTag(SecondCharacter, "neutral")}:                  Comunque i grandi fanno un sacco di regole.
                                                                Ma poi le rompono tantissimo.
        {charTag(SecondCharacter, "angry")}:                    E poi sgridano noi bambini se lo facciamo.
        {charTag(SecondCharacter, "neutral")}:                  Ci metto della menta.
                                                                Ecco.
                                                                A scuola ho un soprannome.
        {charTag(SecondCharacter, "melanchonic")}:              Un soprannome brutto.
        {charTag(SecondCharacter, "neutral")}:                  Perché una volta ho detto una bugia così grossa che tutti si sono arrabbiati.
                                                                E ora c'ho questo soprannome addosso.
                                                                Lo so che dico tantissime bugie.
                                                                A volte non me ne accorgo nemmeno.
                                                                Ma.
                                                                Mmm.
        {charTag(SecondCharacter, "energy")}:                   Nonna dice sempre che "ma" è amico del diavolo.
        {charTag(SecondCharacter, "melanchonic")}:              Ma con le bugie le persone mi ascoltano.
        {charTag(SecondCharacter, "neutral")}:                  E poi.
                                                                La mia vita è.
                                                                Non è che le mie cose piacciono agli altri bambini.
        {charTag(SecondCharacter, "melanchonic")}:              Non posso vedere i cartoni.
                                                                Non ho i fumetti.
        {charTag(SecondCharacter, "angry")}:                    Ho pochissimi giochi.
        {charTag(SecondCharacter, "neutral")}:                  Posso giocare ai videogiochi di mio fratello, ma non sono quelli dei miei compagni.
                                                                Io non so cosa dire.
                                                                E quindi o sto da solo, o devo dire bugie.

            + \ {charTag(PG, "neutral")}:                       Ma perché non guardi i cartoni di nascosto? O prendi i fumetti in biblio?
                    -> glyph_choice_manager(false, fireC)->
                {charTag(SecondCharacter, "melanchonic")}:      La televisione la controlla mamma.
                {charTag(SecondCharacter, "energy")}:           Però non ci avevo pensato alla biblioteca.
                                                                Lì ci posso andare per leggere.
                                                                A volte mi accompagnava nonna, e si metteva a leggere libri sui cavalli.
                {charTag(SecondCharacter, "emotional")}:        Mi piace questo piano, grazie {player_name}!


            + \ {charTag(PG, "neutral")}:                       Le relazioni richiedono tempo, {charNameTwo}. C'è qualcuno che ti dà fiducia?
                    -> glyph_choice_manager(false, airC)->
                {charTag(SecondCharacter, "neutral")}:          Si no boh.
                {charTag(SecondCharacter, "melanchonic")}:      A scuola, non tanto.
                {charTag(SecondCharacter, "neutral")}:          Ai bambini piace il calcio, ma a me no.
                                                                Oppure parlano di Roblox e Minecraft e io so solo le cose che ho visto sul tablet.               
                                                                E le bambini sono strane.
                                                                E mi dicono che sono strano.
                                                                E a volte mi fanno giocare con loro.
                                                                Ma mi fanno fare sempre il papà o cose così.
                {charTag(SecondCharacter, "angry")}:            E mi annoio e mi distraggo e si arrabbiano.

            + \ {charTag(PG, "neutral")}:                       Devi sentirti molto solo.
                    -> glyph_choice_manager(false, waterC)->
                {charTag(SecondCharacter, "neutral")}:          Si no boh.
                                                                Non mi dire mica che ti dispiace.
                                                                Ma a me mi piace stare con gli altri.
                {charTag(SecondCharacter, "angry")}:            Ma è così difficile.

               
            + \ {charTag(PG, "neutral")}:                       Tu amico mio hai tan-tis-si-ma fantasia, e devi condividerla con qualcunə!
                    -> glyph_choice_manager(false, airC)->
                {charTag(SecondCharacter, "energy")}:           A volte scrivo storie per mio fratello.
                                                                E a lui piacciono.
                {charTag(SecondCharacter, "emotional")}:        Una volta ha anche fatto dei disegni dalle mie storie!
                                                                Ho il quaderno nascosto sotto il letto.

            + \ {charTag(PG, "neutral")}:                       <i>Mi abbasso offrendo un abbraccio.</i>
                -> glyph_choice_manager(false, aetherC)->
                {charTag(SecondCharacter, "neutral")}:          Sì no boh.
                {charTag(SecondCharacter, "emotional")}:        Ok.
                                                                Ecco, scusa.
                {charTag(SecondCharacter, "melanchonic")}:      Ti ho spinato mi sa.
                                                                Mi spiace.
                                                                Scusa {player_name}!
            -
        {charTag(SecondCharacter, "neutral")}:                  Guarda!
                                                                La frutta piace anche ai pesci!
        {charTag(SecondCharacter, "emotional")}:                Che faccia buffa quello!
        {charTag(SecondCharacter, "neutral")}:                  Ci sono compagni che piacciono a tutti.
                                                                Lara ha un sacchissimo di amiche!
                                                                Jin è il primo che viene cercato ogni volta che si gioca a qualcosa.
                                                                Tommaso è antipatico invece.
                                                                Ma la sua famiglia è ricca.
                                                                E ha la piscina e tantissimi giochi.
        {charTag(SecondCharacter, "energy")}:                   A te cosa ti rende interessante?

            + (aether2)\ {charTag(PG, "neutral")}:              <i>Shakero un bicchiere vuoto.</i>
                ~ kitchen_recipeAdjective = "assenza"
                -> glyph_choice_manager(true, aetherC)->
                {charTag(SecondCharacter, "neutral")}:          Non è vero!
                                                                Abbiamo già parlato tantissimo!
               
            + (water2)\ {charTag(PG, "neutral")}:               <i>Aggiungo della lavanda empatica.</i>
                ~ kitchen_recipeAdjective = "empatia"
                -> glyph_choice_manager(true, waterC)->
                {charTag(SecondCharacter, "neutral")}:          Come quando io mi faccio male e tu senti dolore?
                                                                Deve essere faticoso!
             
            + (earth2)\ {charTag(PG, "neutral")}:                <i>Grattugio della scorza di chinotto sportivo.</i>
               ~ kitchen_recipeAdjective = "sportività"
               -> glyph_choice_manager(true, earthC)->
                {charTag(SecondCharacter, "melanchonic")}:      Magari conosci Jin.
                                                                O suo fratello.
                {charTag(SecondCharacter, "neutral")}:          Il fratello di Jin è ENORME!
                                                                È campione di sollevamento pesi.
                {charTag(SecondCharacter, "energy")}:           Una volta mi ha alzato con una sola mano!
        
            + (air2)\ {charTag(PG, "neutral")}:                 <i>Misuro dell'acqua di rose erudita.</i>
                ~ kitchen_recipeAdjective = "erudizione"
                -> glyph_choice_manager(true, airC)->
                {charTag(SecondCharacter, "energy")}:           Anche a me piace sapere le cose.
                {charTag(SecondCharacter, "neutral")}:          Ma poi devi trovare le persone a cui piacciono le cose che piacciono a te.
                {charTag(SecondCharacter, "melanchonic")}:      O ti dicono che sei strano.
            

            + (fire2)\ {charTag(PG, "neutral")}:                <i>Macino del pepe rosa pratico.</i>
                ~ kitchen_recipeAdjective = "praticità"
                -> glyph_choice_manager(true, fireC)->
                {charTag(SecondCharacter, "energy")}:           Tipo che sai come si sistemano i treni?
                                                                E come creare l'elettricità?
                                                                E attirare un prociorso?      
            -      
    
        {charTag(SecondCharacter, "neutral")}:              Bleah.
                                                            Le spezie sono strane.
                                                            Nei cibi sono buone.
                                                            Ma da sole fanno bleah.
        {charTag(SecondCharacter, "energy")}:               A mio fratello non dico mai bugie.
                                                            E inventiamo tante storie.
        {charTag(SecondCharacter, "neutral")}:              Mio fratello mi dice che le storie sono delle bugie condivise.
                                                            E per questo non fanno male.
                                                            Una volta era triste.
                                                            E mi ha detto che le persone creano cose per mentire.
                                                            Per dirsi che possono esistere cose diverse da quelle che si hanno.
        {charTag(SecondCharacter, "melanchonic")}:          E che l'arte è una bella bugia per farci andare avanti quando le cose fanno schifo.

            + \ {charTag(PG, "neutral")}:                   Quindi se dici che sei uno scrittore puoi dire tutte le bugie che vuoi?
                    -> glyph_choice_manager(false, earthC)->
                {charTag(SecondCharacter, "energy")}:       Non ci avevo pensato!
                {charTag(SecondCharacter, "neutral")}:      E a me piace scrivere.
                                                            Posso fare come gli investigatori che fanno finta di essere altre persone per risolvere i casi!
             
            + \ {charTag(PG, "neutral")}:                   L'unica cosa che fa andare avanti è il cambiamento, non le belle bugie.
                    -> glyph_choice_manager(false, fireC)->
                {charTag(SecondCharacter, "neutral")}:      Eh?
                                                            Non ho mica capito {player_name}.
                                                            Cosa devo cambiare?
            
            + \ {charTag(PG, "neutral")}:                   Ci sono belle bugie che sono come coperte contro il freddo.
                    -> glyph_choice_manager(false, waterC)->
                {charTag(SecondCharacter, "neutral")}:      Le statue di mio fratello sono cose che non esistono mica.
                {charTag(SecondCharacter, "energy")}:       Ma le guardo e mi piacciono tanto.
                {charTag(SecondCharacter, "neutral")}:      Dici una cosa così quindi?

            + \ {charTag(PG, "neutral")}:                   L'arte mostra ciò che i fatti non sanno raccontare.
                    -> glyph_choice_manager(false, aetherC)->
                {charTag(SecondCharacter, "angry")}:        A volte parli come un libro.
                {charTag(SecondCharacter, "neutral")}:      Ma questa cosa la capisco.
                                                            Quando sei un bambino se spieghi le cose nessuno ti ascolta.
                                                            Però i libri ti capiscono.    

            + \ {charTag(PG, "neutral")}:                   L'arte non è fattuale, per cui sì, è una bella bugia.
                    -> glyph_choice_manager(false, airC)->
                {charTag(SecondCharacter, "angry")}:        Tu parli strano a volte.
                {charTag(SecondCharacter, "neutral")}:      Però allora vuole dire che i grandi possono dirle le bugie.
                {charTag(SecondCharacter, "angry")}:        Perché io no?
            -
        
        {charTag(SecondCharacter, "emotional")}:            Con la frutta avanzata ci preparo un succo!
        {charTag(SecondCharacter, "neutral")}:              A me non mi piacciono i grandi.
                                                            E so che devo diventare grande.
                                                            Ma mi fa paura.
        {charTag(SecondCharacter, "emotional")}:            L'unica cosa bella di diventare grande è che posso avere una casa tutta per me.
        {charTag(SecondCharacter, "energy")}:               E comprarmi uno struzzo senza che la mamma rompa.
                                                            Voglio andare a scuola su uno struzzo.
        {charTag(SecondCharacter, "angry")}:                Non è vero che gli struzzi sono stupidi.
        {charTag(SecondCharacter, "neutral")}:              Fanno delle cose che non capiamo, ma che per loro sono fondamentali per sopravvivere.
                                                            Come dire bugie quando sei un bambino.
        {charTag(SecondCharacter, "energy")}:               Per te cosa significa essere grande?
        
            + (water3)\ {charTag(PG, "neutral")}:           <i>Unisco della cioccolata angosciata.</i>
                ~ kitchen_recipeComplement = "cioccolata angosciata"
                -> glyph_choice_manager(true, waterC)->
                {charTag(SecondCharacter, "angry")}:        Vedi?
                                                            Perché dovrei diventare grande?!?
               
            + (fire3)\ {charTag(PG, "neutral")}:            <i>Caramello delle scorze di limone indipendente.</i>
                ~ kitchen_recipeComplement = "limone indipendente"
                -> glyph_choice_manager(true, fireC)->
                {charTag(SecondCharacter, "neutral")}:      Perché fai quello che vuoi?
                                                            Questo è bello.
                {charTag(SecondCharacter, "energy")}:       Per lo struzzo.
                                                            E magari anche una volpe.
                                                            E una lontra.
                {charTag(SecondCharacter, "neutral")}:      I grandi possono avere uno zoo?
             
            + (earth3)\ {charTag(PG, "neutral")}:           <i>Guarnisco con marshmallow responsabili.</i>
               ~ kitchen_recipeComplement = "marshmallow responsabili"
               -> glyph_choice_manager(true, earthC)->
               {charTag(SecondCharacter, "neutral")}:       Sì no boh.
                                                            Anche i bambini sono responsabili.
                                                            Quindi non è tanto diverso no?
        
            + (aether3)\ {charTag(PG, "neutral")}:          <i>Spolvero dello zenzero fallito.</i>
                ~ kitchen_recipeComplement = "zenzero fallito"
                -> glyph_choice_manager(true, aetherC)->
                {charTag(SecondCharacter, "melanchonic")}:  Non voglio diventare grandeeeeeee.
                                                            Non vogliooooo!
    
            + (air3)\ {charTag(PG, "neutral")}:             <i>Verso del succo d'ananas esplorativo.</i>
                ~ kitchen_recipeComplement = "ananas esplorativo"
                -> glyph_choice_manager(true, airC)->
                {charTag(SecondCharacter, "neutral")}:      Non ci avevo pensato.
                                                            Però posso viaggiare dove voglio.
                {charTag(SecondCharacter, "melanchonic")}:  Noi viaggiamo poco.
                {charTag(SecondCharacter, "neutral")}:      Perché non abbiamo soldi.
                {charTag(SecondCharacter, "energy")}:       Però conosco tutti i posto segreti del mio quartiere!
                                                            E alcuni sono pericolosi!
            - 

        {charTag(SecondCharacter, "emotional")}:            Comunque giuro su tutto tuttissimo che ho smesso di dirti bugie.
                                                            E ho tanta fame, {player_name}.
                                                            Tanta tanta fame!
            -> fourth_ingredient_dispatcher
    

    
        //La chiusura è comune, sempre per ridurre il rischio di errori
        = fourth_ingredient_dispatcher
        {charTag(SecondCharacter, "energy")}:               Abbiamo sporcato tantissime cose.
                                                            Dici che si lavano da sole?
        {charTag(SecondCharacter, "emotional")}:            Dici che è pronto?
        
            {
                - backpack_findedGifts == ():
                    {charTag(TheWitch, witch_state())}:   <i>{player_name} non ha niente da aggiungere alla ricetta.</i>

                    -> at_table_with_second_char
                
                - else:
                    -> add_ingredient
            
            }
            
                = add_ingredient
                    ~ temp charNameOne = translator(firstChar_ActualName)
                    ~ temp charNameTwo = translator(secondChar_ActualName)
                    ~ temp charNameThree = translator(thirdChar_ActualName)
                    ~ temp charNameFour= translator(fourthChar_ActualName)
                    ~ temp charNameFive = translator(fifthChar_ActualName)
                
                
                {charTag(TheWitch, witch_state())}:     <i>Il giusto ingrediente renderà la ricetta di {player_name} e {charNameTwo} spaziale.</i>
                <i>E {player_name} potrebbe capire un po' meglio {charNameTwo}.</i>

                    + \ {charTag(PG, "neutral")}:       <i>Voglio aggiungere un ingrediente speciale.</i>
                        -> grimoire_greenhouse_gifts_and_ingredient ->

                        //Dopo di che associo la scelta fatta alla PNG
                        ~ kitchen_secondCharExtraIngredient = grimoire_chosenPlant
                        //E svuoto la variabile del grimorio
                        ~ grimoire_chosenPlant = ()
                        //E poi chiamo la funzione per aggiornare i valori
                        ~ object_value_for_PNG(kitchen_secondCharExtraIngredient, Kitchen, SecondCharacter)
                        //E il nome dell'ingrediente
                        ~ extra_ingredient_name(kitchen_secondCharExtraIngredient)
                    
                    
                    + \ {charTag(PG, "neutral")}:         <i>Non aggiungo altro.</i>
                    -
            {charTag(SecondCharacter, "emotional")}:    A tavola!
            Ho tantissima aquilina!
            

                    -> at_table_with_second_char
    


=== at_table_with_second_char
    -> grimoire_storylets_updater -> 
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ move_entity(CookingWithSecondCharOBJ, Kitchen)
    ~ move_entity(EatingWithSecondCharOBJ, Kitchen)
    ~ temp piatto = kitchen_tempRecipeName

    ~ recipe_name_creator()
    ~ recipe_name_storage(SecondCharacter)
    
    {charTag(SecondCharacter, "emotional")}:            Hai visto che pancia grande che ho ora?
                                                        Grazie {player_name}, era buonissimo!
    {charTag(SecondCharacter, "energy")}:               E poi questo {piatto} sembra una cosa da cinema.
    {
        - firstChar_storyStatus == story_storyStarted:
            {charTag(SecondCharacter, "emotional")}:    Secondo me a {charNameOne} gli sarebbe piaciuto TAN-TIS-SI-MO!
                                                        Dovevo lasciarle un pezzetto!
        
        - else:
            {charTag(SecondCharacter, "emotional")}:    Secondo me a {charNameOne} gli sarebbe piaciuto TAN-TIS-SI-MO!
                                                        Un po' mi manca.
    }

    {charTag(SecondCharacter, "neutral")}:              A me mi piace parlare, ma gli adulti non mi ascoltano mai così tanto.
    {
        -cooking_with_second_char.first_theme:
            {charTag(SecondCharacter, "energy")}:       E sono contento che mi hai chiesto degli animali.
            {charTag(SecondCharacter, "neutral")}:      E le cose che mi hai detto sulle persone.
            {charTag(SecondCharacter, "emotional")}:    Grazie.

        -cooking_with_second_char.second_theme:
            {charTag(SecondCharacter, "emotional")}:     Mi è piaciuto parlare di cose da adulti.
            {charTag(SecondCharacter, "neutral")}:       E conoscerti di più.
        
        -cooking_with_second_char.third_theme:
            {charTag(SecondCharacter, "emotional")}:    È bello che abbiamo parlato di bugie.
            {charTag(SecondCharacter, "neutral")}:      Ci sono tantissime cose nelle bugie.
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
                
                        
                        -> kitchen_moon_feedback -> 

                {charTag(SecondCharacter, "emotional")}:    Mi è piaciuto tanto tanto che c'hai messo {ingredientTranslator(kitchen_secondCharExtraIngredient)}.
                {
                    - kitchen_firstCharExtraIngredient == universalIngredient:
                    {charTag(SecondCharacter, "emotional")}:    Ha lo stesso sapore della torta di nonna.
                                                                Quella che mi ha fatto per il compleanno due anni fa.
                                                                Eravamo tutti a casa e nessuno era arrabbiato.
                                                                Ero felice felice!
                }
                {charTag(SecondCharacter, "neutral")}:          Lo vuoi sapere un segreto?
                {charTag(SecondCharacter, "energy")}:           Alla fine non sono <i>così</i> strano.
                                                                Ma mi piace quando le persone sono <b>coerenti</b>.
                                                                Quando pensano le cose in un modo preciso.
                {charTag(SecondCharacter, "angry")}:            Sennò mi sembra che vuoi avere ragione, non che mi vuoi parlare davvero.
               
                        -> relationship_feedback
                
                = bad_reaction
                ~ temp charNameOne = translator(firstChar_ActualName)
                ~ temp charNameTwo = translator(secondChar_ActualName)
                ~ temp charNameThree = translator(thirdChar_ActualName)
                ~ temp charNameFour= translator(fourthChar_ActualName)
                
                        
                        -> kitchen_moon_feedback -> 

                {charTag(SecondCharacter, "angry")}:            Però {ingredientTranslator(kitchen_secondCharExtraIngredient)} mi ha fatto suuuuuperschifo.
                {charTag(SecondCharacter, "neutral")}:          Super.
                                                                Bleah!
                    -> relationship_feedback
            
                
                = meh_reaction
                ~ temp charNameOne = translator(firstChar_ActualName)
                ~ temp charNameTwo = translator(secondChar_ActualName)
                ~ temp charNameThree = translator(thirdChar_ActualName)
                ~ temp charNameFour= translator(fourthChar_ActualName)
                
                        
                        -> kitchen_moon_feedback -> 

                {charTag(SecondCharacter, "neutral")}:          Mi è piaciuto che c'hai messo {ingredientTranslator(kitchen_secondCharExtraIngredient)}.
                                                                Non il mio preferito, ma quasi.
                                                                Mi ha fatto pensare una cosa.
                {charTag(SecondCharacter, "emotional")}:        Mi piacciono i cani.
                {charTag(SecondCharacter, "angry")}:            Ma non mi piace quando fanno le cose a caso.
                {charTag(SecondCharacter, "neutral")}:          Come correre a destra e sinistra e ovunque.
                                                                Un cane deve andare dove deve andare, mica a caso!
                                                                Come quando si parla, mica puoi dire cose che non c'entrano nulla, no?

                    -> relationship_feedback
            
    
        
    = relationship_feedback
    -> achievements_onGame_statusUpdate_GM ->
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour= translator(fourthChar_ActualName)
        

        {charTag(SecondCharacter, "emotional")}:                Mi sa che sono davvero pieno.
        {charTag(SecondCharacter, "neutral")}:                  Abbiamo parlato tanto, vero, qui?
                                                                Non abbiamo mai passato così tanto tempo assieme.
                                                                E penso che se ti ho conosciuto solo qui in cucina ora e {charNameOne} mi dice: vuoi fare amicizia con {player_name}?
        //Prima di tutto chiamo la funzione per il calcolo dello stato della relazione
        ~ affinity_calc(SecondCharacter)
        //Così poi posso dare il feedback
            {
                - secondChar_relationshipStatus == negative:
                    {charTag(SecondCharacter, "neutral")}:      Rispondo di no.
                                                                Perché non so.
                    {charTag(SecondCharacter, "melanchonic")}:  Non è che mi è piaciuto molto molto come abbiamo parlato.

                        ~ grimoire_secondChar += grimSecondCharKitchenNegativeReaction

                - secondChar_relationshipStatus == neutral:
                    {charTag(SecondCharacter, "neutral")}:      Sì no boh.
                                                                Devo ancora capirlo.
                    {charTag(SecondCharacter, "emotional")}:    Perché ci sono stati dei momenti in cui ho detto "Ma che figo che è avere qui {player_name}".
                    {charTag(SecondCharacter, "melanchonic")}:  E dei momenti in cui non ti capivo.

                    ~ grimoire_secondChar += grimSecondCharKitchenNeutralReaction
                
                - secondChar_relationshipStatus == positive:
                    {charTag(SecondCharacter, "emotional")}:    Rispondo subito sììììììììì!
                    {charTag(SecondCharacter, "energy")}:       Mi sono divertito.
                    {charTag(SecondCharacter, "emotional")}:    E mi è sembrato che mi hai ascoltato davvero.
                                                                E mi piace questa cosa!
                    ~ grimoire_secondChar += grimSecondCharKitchenPositiveReaction                                            
            }    


    {charTag(SecondCharacter, "energy")}:                       Abbiamo ancora tante chiacchierate da fare, vero?        
            
        -> ending_cooking_with_second_char



=== ending_cooking_with_second_char
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    

    {charTag(SecondCharacter, "neutral")}:                      Però ora devo farmi due passi o mi addormento.
                                                                E non voglio dormire.
    {charTag(SecondCharacter, "energy")}:                       Voglio parlare con Franco.
    {charTag(SecondCharacter, "neutral")}:                      A dopo {player_name}!
    - 
    
            ~ cooking_animations_off()
            ~ move_entity(SecondCharacter, Pond)
            ~ kitchen_secondCharCookingTogetherInvite = false
            ~ kitchen_allChefs += SecondCharacter
            ~ kitchen_kitchenOccupied = false
        ~ update_glyphs(SecondCharacter)
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
    ~ temp charNameFive = translator(fifthChar_ActualName)

{debug: passo per second_char_cooking_alone.}
        ~ cooking_animations_on()

{kitchen_secondCharCookingTime:
        - 0:
            {charTag(SecondCharacter, "energy")}:       {Se unisco aceto e bicarbonato la schiuma è buona?| Sto cucinando {player_name}!}

        - 1:
            {charTag(SecondCharacter, "energy")}:       {Se unisco aceto e bicarbonato la schiuma è buona?| Sto cucinando {player_name}!}
            
        - 2:
            {charTag(SecondCharacter, "energy")}:       {Il lievito ha un sapore strano.|{player_name} vai via ora!}
        
        - 3:
            {charTag(SecondCharacter, "energy")}:       {Mi fa male la pancia. Ma devo tagliare tantissime mele.|Torna dopo {player_name}!}
            
        - 4:
            {charTag(SecondCharacter, "energy")}:       {Cavolo, quante cose possono bruciare! Ma sono in ritardo col piatto!|{player_name} non guardare o mi agito.}
        
        - 5:
            {charTag(SecondCharacter, "energy")}:       {È normale che il pane abbia questo odore?|{player_name} lasciami solo.}
    
        - 6:
            {charTag(SecondCharacter, "energy")}:       {Se {charNameFive} scopre che {charNameOne} ha messo tutti questi coltelli, si arrabbia tantissimo. Ma così posso tagliare le noci.|{player_name}, via o brucio tutto.}
        
        - 7:
           {charTag(SecondCharacter, "energy")}:        {Un pezzo di unghia in tutto questo cioccolato grattugiato sparisce, vero?|Due minuti e ho finito, davvero.}
        
        - else:
            {charTag(SecondCharacter, "energy")}:       {Direi che ci siamo. Deve giusto diventare freddo. E stare fermo.|{player_name}, non hai pazienza!}
        
    }

    -> second_char_closing_storylet ->
    -> main




=== food_gift_second_char
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    
{debug: passo per food_gift_second_char.}

    {charTag(FifthCharacter, "hurry")}:                     E proteggono tutta la biblioteca?
    {charTag(SecondCharacter, "energy")}:           Sì! Vedi che sono carini?
    {charTag(FifthCharacter, "neutral")}:                   Continuo a pensare che non siano carini, ma ora mi fanno un po' meno paura.
    {charTag(FifthCharacter, "hurry")}:                     Ehi {player_name}! {charNameTwo} mi diceva che c'è questa biblioteca in Portogallo dove i pipistrelli proteggono i libri!
    {charTag(SecondCharacter, "neutral")}:          Sìì! E allora ho pensato di mettere una casetta per pipistrelli in cucina.
                                                    Così tengono lontani gli insetti fastidiosi!
    {charTag(FifthCharacter, "neutral")}:                   E poi mi ha preparato questo piatto, ehm, curioso.
    {charTag(SecondCharacter, "neutral")}:          Si chiama PanTutto.
    {charTag(SecondCharacter, "energy")}:           So cucinare tantissime cose!
    {charTag(FifthCharacter, "neutral")}:                   Hai imparato dalla tua mamma?
    {charTag(SecondCharacter, "melanchonic")}:      No.
    {charTag(SecondCharacter, "neutral")}:          A casa ci sto tanto da solo, e quindi mi invento le cose. 
    {charTag(SecondCharacter, "energy")}:           Ma cucinare è come un laboratorio.
    {charTag(SecondCharacter, "neutral")}:          E quindi ho inventato tanti piatti.
                                                    Sono contento che l'hai assaggiato, {charNameFive}!
                                                    Ma non mi arrabbio se non ti piace.
                                                    So che i vecchi mangiano solo cose schifose come i broccoli.
    {charTag(FifthCharacter, "hurry")}:                     Dovresti assaggiare la mia sacher, bimbo: ti porta direttamente in paradiso
    {charTag(SecondCharacter, "emotional")}:        Ha il cioccolato?
    {charTag(FifthCharacter, "hurry")}:                     Ha il cioccolato, e tanto.
    {charTag(FifthCharacter, "sorry")}:                     {charNameTwo}: abbiamo fatto pace?
    {charTag(SecondCharacter, "neutral")}:          Mmm.
                                                    Sì.
                                                    Ma già da prima.
    {charTag(FifthCharacter, "neutral")}:                   Posso abbracciarti?
    {charTag(SecondCharacter, "neutral")}:          No.
    {charTag(SecondCharacter, "emotional")}:        Ma puoi farmi quella torta al cioccolato?
    {charTag(FifthCharacter, "hurry")}:                     Subito!
                        ~ change_entity_place(Mentor)

        + \ {charTag(PG, "neutral")}:               Sono felice che abbiate fatto pace.
                -> glyph_choice_manager(false, waterC)->
            {charTag(SecondCharacter, "neutral")}:  Mi sembra che ci tiene taaaaaaaanto a fare una buona impressione ora.
                                                    Un po' mi dispiace.
                                                    Però sono contento perché mi fa la torta!
            
        + \ {charTag(PG, "neutral")}:               Avete trovato una nuova armonia?
                -> glyph_choice_manager(false, aetherC)->
            {charTag(SecondCharacter, "neutral")}:  Tipo come quando si canta?
                                                    Non ce la vedo molto {charNameFive} a cantare.
        {charTag(SecondCharacter, "melanchonic")}:  E io sono stra stonato.                                            
            

        + \ {charTag(PG, "neutral")}:               Il cibo unisce tutte le persone, vero?
                -> glyph_choice_manager(false, earthC)->
            {charTag(SecondCharacter, "energy")}:   Lo dice anche Franco!
            {charTag(SecondCharacter, "neutral")}:  Ma dice anche "{charNameTwo}, ricorda che la metà di un biscotto è un bisquattro!"
                                                    E poi prima ha cercato di convincermi che le ninfee sono fatte di formaggio.
                                                    Ed è quasi annegato, per fortuna sono arrivati i suoi mariti ad aiutarlo.
        
        + \ {charTag(PG, "neutral")}:               Sono curios{player_pronouns has him:o|{player_pronouns has her:a|ə}}: cosa ti ha fatto cambiare idea su {charNameFive}?
                -> glyph_choice_manager(false, airC)->
            {charTag(SecondCharacter, "neutral")}:  Non ho cambiato idea su di lei.
                                                    Ma sono cambiate le cose che fa.
            {charTag(SecondCharacter, "energy")}:   Ora sembra interessata a quello che dico!
                                                    E non mi dice più che me ne devo andare.
            {charTag(SecondCharacter, "neutral")}:  E poi mi ha chiesto se mi può abbracciare.
                                                    I grandi non lo fanno mai.                                                                                
        
        + \ {charTag(PG, "neutral")}:               Non l'hai perdonata troppo presto?
                -> glyph_choice_manager(false, fireC)->
            {charTag(SecondCharacter, "neutral")}:  Non mi piace tenere il muso.
                                                    Lo fa mamma ed è suuuperfaticoso.
                                                    E poi si sta impegnando tanto per conoscermi.
                                                    A volte forse troppo.    
        -
    {charTag(SecondCharacter, "energy")}:           E ora devo solo aspettare la mia torta!
            -> second_char_closing_storylet ->
            ->->