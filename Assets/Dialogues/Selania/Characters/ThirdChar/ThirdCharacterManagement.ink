                                                        /* ---------------------------------
                                                        
                                                                LISTE E VARIABILI
                                                        
                                                        ----------------------------------*/


//Gestione del ritmo della storia
    //Stato della storia 
        //Non avviata, avviata, conclusa
        VAR thirdChar_storyStatus = story_storyNotStarted
        //Ordine di conclusione della riscrittura (prima storia conclusa, seconda storia conclusa)
        VAR thirdChar_storyEndingPosition = ()
        //Quantità di storylets letti dalla giocatrice prima di accedere alla riscrittura
        VAR thirdChar_minStoryletsForRewriting = grimThirdCharSix
        //Abbiamo l'info speciale su Mentore? Se le condizioni sono corrette, viene messa su true dalla funzione inkLevel(Character)
        VAR thirdChar_specialEvent = false
        //Conteggio totale delle scelte prese con la PNG
        VAR thirdChar_totalChoices = 0
    //Eventi speciali
        VAR thirdChar_firstCharRage = false
        VAR thirdChar_inkFirstRewriting = 0
        VAR thirdChar_inkFirstRewriting_updated = false
        VAR thirdChar_inkFSecondRewriting_updated = false  

    //Ritmo della storia    
        //Variabili per mettere in pausa la conversazione
        VAR thirdChar_pauseTalking = 0
        VAR thirdChar_pauseDuration = 2
        //Questa variabile verifica se abbiamo appena parlato con unx PNG, in modo tale da presentarci in modo diverso le possibili proposte che possiamo farle.
        VAR thirdChar_justTalked = false
        //Variabile per il tempo di attesa tra una lettera e l'altra
        VAR thirdChar_mailPause = 0
        VAR thirdChar_mailPauseDuration = 5


//Stato della PNG
    //Gestione nomi
    LIST thirdChar_possibleStates = Boccale, (Forum), (Canovaccio), (Sigaro), (Guantone), (Cerchio)
    VAR thirdChar_ActualName = Boccale

    //Registro delle scelte prese
    VAR thirdChar_aether = 0
    VAR thirdChar_earth = 0
    VAR thirdChar_air = 0
    VAR thirdChar_water = 0
    VAR thirdChar_fire= 0
    
        //Storage del valore precedente
        VAR thirdChar_last_aether = 0
        VAR thirdChar_last_earth = 0
        VAR thirdChar_last_air = 0
        VAR thirdChar_last_water = 0
        VAR thirdChar_last_fire= 0

    //Utilizzo dei sigilli
    VAR thirdChar_usedSigil = 0
    VAR thirdChar_usedSigilsTracking = ()

    //Moltiplicatore per la riscrittura
    VAR thirdChar_glyphVariation = 2

    //Variabile per bloccare le reazioni dell3 altr3 PNG mentre rispondiamo alle lettere
    VAR ThirdCharacterLetters = false


//Tracciamento della relazione
    //Genere registrato dellx giocatricx.
    VAR thirdChar_recordedPlayerPronoun = ()
    //Indicatore della relazione
    VAR thirdChar_relationshipIndicator = 0
    VAR thirdChar_lastRelationshipIndicator = 0
    //Status = chiamato da cucina e prima della riscrittura per valutare il rapporto creato e il relativo inchiostro. Ora è un insieme di valori "scritti"
    VAR thirdChar_relationshipStatus = neutral
    //Reaction: qui registriamo la reazione che verrà attivata coi sigilli
    VAR thirdChar_relationshipReaction = neutral
    //Qui registro lo stato della relazione dopo la prima lettera, così che nel grimorio sia sempre stabile.
    VAR thirdChar_relationshipFirstLetterStatus = neutral

//Gestione dei doni
    //Tracciamento apprezzamento doni/ingredienti. Tutto ciò che è fuori da questa lista = reazione neutrale/disgustata.
    VAR thirdChar_favouritesGifts = (CardoAspinato, FalsaPalude)
    VAR thirdChar_goodGifts = (BastoneDellOzioso, EderaDelleAmanti, Olobino)
    //Dono consigliato dalla rana
    VAR frog_third_char_gift = ""
    VAR frog_third_temp_growing_gift = false
    //Dono effettuato
    VAR thirdChar_giftedObject = ()


//Tracciamento cucina
    //Autonoma
        VAR kitchen_thirdCharIsCooking = false
        VAR kitchen_thirdCharCookingTime = 0
        VAR kitchen_thirdCharHasCooked = false
        //Tempo che ci impiega a fare la sua ricetta
        VAR kitchen_thirdCharCookingMaxTime = 8
    //Nostro invito
        //l'abbiamo invitata
        VAR kitchen_thirdCharCookingTogetherInvite = false
        //Quante volte l'abbiamo invitata
        VAR kitchen_thirdCharCookingTogetherNumberInvite = 0
        //Da quanto ci sta aspettando
        VAR kitchen_thirdCharCookingTogetherWaiting = 0
        //Quanta pazienza ha ad aspettarci
        VAR kitchen_thirdCharCookingMAXTogetherWaiting = 8
        //Ricetta creata
        VAR kitchen_thirdCharRecipe = ""
        //Suggerimento rana
        VAR frog_third_char_ingredient = ""
        VAR frog_third_temp_growing_ingredient = false
            
    //Valore ingredienti
        VAR kitchen_thirdCharRecipeNoun = ""
        VAR kitchen_thirdCharRecipeAdjective = ""
        VAR kitchen_thirdCharRecipeComplement = ""
        VAR kitchen_thirdCharExtraIngredient = ()
        VAR kitchen_thirdCharExtraIngredientReaction = notReaction

//Tracciamento del racconto
    VAR frog_third_novel = ""

//Tracciamento degli esiti delle scelte PG nelle varie lettere
    VAR letters_thirdCharLetterTwoChoice = ()
    VAR letters_thirdCharLetterThreeChoice = ()
    VAR letters_thirdCharLetterFourChoice = ()
    VAR letters_thirdCharLetterFiveChoice = ()
    VAR letters_thirdCharLetterSixChoice = ()
    VAR letters_thirdCharLetterSevenChoice = ()
                     
                                                        /* ---------------------------------
                                                        
                                                            FUNZIONI PER AFFINITA' E NOME
                                                        
                                                        ----------------------------------*/





=== function thirdAffinityFeedback()
{debug: passo per thirdAffinityFeedback. Lo stato di inchiostro è {thirdChar_InkLevel}.}
//Utilizziamo questa funzione per far fare alla PNG un commento esplicito sullo stato della relazione.
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)

    //Boccale passa da queste parti due volte. La prima dal vivo, con soli tre possibili esiti (empty, low, normal) e la seconda con tutti e cinque.
    //La cosa che ci permette di fare un distinguo è lo stato della storia, se è story_storyStarted (primo check) o story_storyRemote (secondo check).
    {
    - thirdChar_storyStatus == story_storyStarted:

        {
            - thirdChar_InkLevel == ink_empty:
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == him:
                {charTag(ThirdCharacter, "bored")}:                 Ho avuto la sensazione che tu hai passato il tempo a giudicarmi.
                                                                    A farmi domande fastidiose.
                                                                    Non me lo aspettavo da te, vecio.
                                                                    Ho come l'impressione che ti senti meglio di me.
                {charTag(ThirdCharacter, "angry")}:                 Vola basso, {player_name}.
                {charTag(ThirdCharacter, "neutral")}:               Sono ancora più contento di levarmi da qui, guarda.

                - else:
                {charTag(ThirdCharacter, "neutral")}:               Non è scattata la scintilla, mi spiace.
                {charTag(ThirdCharacter, "jester")}:                Per te il campionato finisce qui.
                {charTag(ThirdCharacter, "neutral")}:               Scherzi a parte, non ci siamo mai capiti, ma non è che mi aspettavo di più.
                                                                    Fossi stato un uomo, ci sarei rimasto male, ma così non tanto, dai.
                } 


            - thirdChar_InkLevel == ink_low:
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == him:
                {charTag(ThirdCharacter, "jester")}:                Sei un po' come una birra calda, vecio.
                {charTag(ThirdCharacter, "neutral")}:               Una cosa che magari bevi perché non ti rimane niente in giro.
                                                                    Ma che non ti disseta.
                {charTag(ThirdCharacter, "jester")}:                A stare qui in giro sto dicendo cose gay, aiuto!
                {charTag(ThirdCharacter, "neutral")}:               Però non sei così male alla fine.
                                                                    Mettiamola così: ti inviterei per una partita a calcetto.
                                                                    Ma non ti metterei mai come titolare.                                               
                - else:
                {charTag(ThirdCharacter, "neutral")}:               È andata meglio di quanto pensavo.
                    {
                    - thirdChar_recordedPlayerPronoun == her:
                    {charTag(ThirdCharacter, "neutral")}:           Non una proposta di matrimonio, direi.
                    {charTag(ThirdCharacter, "jester")}:            Sempre che te non ci stai, a quel punto ci faccio comunque un pensierino.
                    - else:
                    {charTag(ThirdCharacter, "neutral")}:           Tu non ti sei arrabbiat{thirdChar_recordedPlayerPronoun has him:o|{thirdChar_recordedPlayerPronoun has her:a|ə}} se ho sbagliato i tuoi pronomi.
                    {charTag(ThirdCharacter, "jester")}:            E io ho ignorato le volte in cui mi hai fatto sentire un idiota.                                            
                    }
                {charTag(ThirdCharacter, "neutral")}:               Diciamo che sei passi al Baretto, una birra te la offro con piacere.                                                    
                } 
                                                                
            - thirdChar_InkLevel == ink_normal:
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == him:
                {charTag(ThirdCharacter, "jester")}:                Noi ci capiamo vecio, ma tanto anche.
                                                                    Tipo fratelli separati alla nascita o quelle cose lì.
                {charTag(ThirdCharacter, "neutral")}:               Non avrei mai pensato di dirlo, ma mi spiacerà un po' andarmene.
                {charTag(ThirdCharacter, "jester")}:                Ma non farti strane idee!                                                                                
                                                                
                - else:
                {charTag(ThirdCharacter, "neutral")}:               Non ti arrabbiare, ma non pensavo che mi sarei trovato così bene con {thirdChar_recordedPlayerPronoun == her: una donna|una persona non binaria}.
                {charTag(ThirdCharacter, "jester")}:                {thirdChar_recordedPlayerPronoun == her: E senza il sesso di mezzo, woah!|Non abbiamo mai litigato per i pronomi, woah!}
                {charTag(ThirdCharacter, "neutral")}:               Scherzi a parte, mi son divertito con te, come se tu fossi un uomo.
                                                                    Che figata.
                                                                    Sono contento di andarmene, ma grazie a te stare qui è volata.
                } 
        
    - else:
                                                                    Comunque è arrivato anche il momento di fare un po' i conti col nostro rapporto {player_pronoun has him:vecio|{player_pronoun has her:zia|campionə}}.
                                                                    Una seconda volta.
        {
        - thirdChar_InkLevel == ink_empty:
                                                                    Ci siamo fatti un intero campionato assieme.
                                                                    Ma se saremo assieme la prossima annata, sicuro sicuro ti caccio in panchina.
                                                                    Non penso tu abbia capito molto di me, {player_name}.
                                                                    Uno su dieci per tutta la stagione, scusa.

        - thirdChar_InkLevel == ink_low:
                                                                    Mi sono sentito un po' come un portiere professionista con un difensore dilettante.
                                                                    C'hai la passione, la voglia di fare, ma non leggi proprio il mio gioco {player_name}.
                                                                    Una pagella da tre su dieci per la stagione, più per non abbatterti che per un effettivo merito.

        - thirdChar_InkLevel == ink_normal:
                                                                    È stato un po' come avere quel centrocampista che ogni tanto ti fa un assist a modo.
                                                                    <i>Ogni tanto</i> non garantisce la vittoria, ma almeno non si fa una figura di merda tutto l'anno, vero?
                                                                    E così siamo arrivati a metà classifica: né vincitori, né retrocessi.
                                                                    Una pagella da sei su dieci, con un punto in più per l'affetto.

        - thirdChar_InkLevel == ink_medium:
                                                                    Mi hai messo alla prova {player_pronoun has him:vecio|{player_pronoun has her:zia|campionə}}, ma in modo buono.
                                                                    Siamo state due punte che si sono fatte un po' di sana competizione a vicenda, ma sempre con rispetto.
                                                                    E abbiamo fatto un campionato grandioso.
                                                                    Niente scudetto, ma ogni partita è stata una gioia per i tifosi.
                                                                    Pagella: otto su dieci, ma con la sicurezza che la perfezione è dietro l'angolo.
        
        - thirdChar_InkLevel == ink_high:
                                                                    Che dire {player_pronoun has him:vecio|{player_pronoun has her:zia|campionə}}?
                                                                    Abbiamo vinto il campionato.
                                                                    Ci hanno chiamati in nazionale.
                                                                    Ci siamo presi le migliori prime pagine della Gazzetta.
                                                                    Due eroi noi due.
                                                                    Una pagella da dieci su dieci, e la sicurezza di aver trovato un{player_pronoun has him:o|{player_pronoun has her:a|ə}} nuov{player_pronoun has him:o|{player_pronoun has her:a|ə}} amic{player_pronoun has him:o|{player_pronoun has her:a|ə}}.

        }
    }
    }



=== third_char_closing_storylet ===
    //Questo evita che venga proposto un altro storylet fino a quando la pausa non è finita
    ~ thirdChar_pauseTalking = thirdChar_pauseDuration
    //Questo è per la gestione delle domande
    ~ thirdChar_justTalked = true

    //Aggiornamento storylets
    -> grimoire_storylets_updater ->

->->

=== third_char_closing_letters
    ~ thirdChar_mailPause = thirdChar_mailPauseDuration
    ~ letters_doggoPause = false

    ~ move_entity(DoggoThirdLetters, Safekeeping)
    ~ move_entity(DoggoNoLetters, TrainStop)
    
    //Aggiornamento storylets
    -> grimoire_storylets_updater ->

->->


//Funzione per la trasformazione della relazione tra prima e seconda fase
=== function third_char_relationshipFromLiveToLetters()
//Il passaggio è un ribaltamento dello stato relazionale precedente: se all'inizio verremo premiat3 per l'uso per esempio del fuoco, ora deve essere al contrario la cosa.
//Tengo conto delle soglie espresse per gestire affinity_calc e le ribalto (ovvero: se thirdChar_relationshipIndicator è minore uguale del valore negativo, ora lo porto al valore entusiasta)
{
    - thirdChar_relationshipIndicator <= relationshipIndicatorNegativeValue:
        ~ thirdChar_relationshipIndicator = relationshipIndicatorEnthusiasticValue
        ~ thirdChar_relationshipFirstLetterStatus = positive

            Mi hai fatto incazzare tantissimo.
            Ma hai fatto bene, perché stavo in una situazione del cazzo, non me ne rendevo conto.
            E tu non ti sei mai fatt{player_pronoun has him:o|{player_pronoun has her:a|ə}} problemi a cercare di svegliarmi.
            Per questo ti odio un po' meno.

    - thirdChar_relationshipIndicator >= relationshipIndicatorPositiveValue:
        ~ thirdChar_relationshipIndicator = relationshipIndicatorNegativeValue
        ~ thirdChar_relationshipFirstLetterStatus = negative

            Mi hai detto quello che mi aspettavo da te.
            Ma la zia ha detto che ero lì perché c'era qualcosa da superare.
            Dovevi mettermi alla prova {player_name}, invece boh, mi hai lasciato nel brodo che già mi faceva male.

    - else:
        ~ thirdChar_relationshipIndicator = 0
        ~ thirdChar_relationshipFirstLetterStatus = neutral

            È stata una situazione neutra, non so se mi capisci.
            Magari non mi hai sfidato, ma non hai manco assecondato sempre il modo in cui vedo il mondo.
}

