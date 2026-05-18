//Feedback//
=== first_character_feedback
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    


        {charTag(FifthCharacter, "hurry")}:                                 Hai concluso la riscrittura di {charNameOne}, {player_name}!
                                                                            E quindi: è tempo di feedback!
        {
            - are_two_entities_together(FirstCharacter, PG):
                {charTag(FirstCharacter, "neutral")}:                       Ehm, non sono una grande fan delle pagelle.
                    ~ change_entity_place(FirstCharacter)
        }
        {
            - are_two_entities_together(SecondCharacter, PG):
                {charTag(SecondCharacter, "neutral")}:                      Ma siamo a scuola?
                {charTag(SecondCharacter, "angry")}:                        Che noooooia!
                    ~ change_entity_place(SecondCharacter)
        }
        
        {charTag(FifthCharacter, "hurry")}:                                 Partiamo con un promemoria: non ci sono riscritture buone o cattive, e nomi sbagliati.
        {charTag(FifthCharacter, "neutral")}:                               Ma: il mio lavoro come {charNameFive} è quello di assicurarmi che tu possa essere la versione migliore di te.
                                                                            Partiamo con quello che è accaduto prima della riscrittura.
        {
            - firstChar_giftedObject == ():
                {charTag(FifthCharacter, "neutral")}:                       Innanzitutto, ho notato che hai deciso di non donare nulla a {charNameOne}.
                                                                            Spero che questo non ti abbia complicato il lavoro.

            - firstChar_favouritesGifts has firstChar_giftedObject:
                {charTag(FifthCharacter, "neutral")}:                       Innanzitutto, hai donato qualcosa che {charNameOne} ha adorato.
                {charTag(FifthCharacter, "hurry")}:                         Sono così orgogliosa di te!

            - firstChar_goodGifts has firstChar_giftedObject:
                {charTag(FifthCharacter, "neutral")}:                       Innanzitutto, hai donato qualcosa che {charNameOne} ha apprezzato molto.
                                                                            Poteva esserci qualcosa di meglio?
                {charTag(FifthCharacter, "sad")}:                           Sicuramente sì.
                {charTag(FifthCharacter, "neutral")}:                       Era quello l'obiettivo?
                                                                            No, se sei {player_pronoun has him:soddisfatto|{player_pronoun has her:soddisfatta|soddisfattə}} di com'è andata la riscrittura.

            - firstChar_giftedObject != () && (firstChar_favouritesGifts hasnt firstChar_giftedObject) && (firstChar_goodGifts hasnt firstChar_giftedObject):
                {charTag(FifthCharacter, "sad")}:                           Innanzitutto, hai donato qualcosa che {charNameOne} non desiderava.
                                                                            Questo non ti ha permesso di ottenere dell'inchiostro in più.
                {charTag(FifthCharacter, "hurry")}:                         Ma dai propri errori si impara, giusto?

        }
        {
            - firstChar_relationshipStatus == negative:
                {charTag(FifthCharacter, "neutral")}:                       Nell'insieme, non hai creato una grande relazione con lei.
                {charTag(FifthCharacter, "sad")}:                           Ecco: forse qui è dove mi sento più in colpa.
                {charTag(FifthCharacter, "sorry")}:                         Perché l'alunno alla fine rispecchia sempre le capacità dell'insegnante.
                {
                    - grimoire_firstChar hasnt grimFirstCharKitchenEnded: 
                                                                            Forse cucinare con lei avrebbe aperto qualche altra occasione di chiarimento? Chi lo sa.
                }

            - firstChar_relationshipStatus == neutral:
                {charTag(FifthCharacter, "neutral")}:                       Nell'insieme hai sviluppato con {charNameOne} una buona fiducia.
                {
                    - grimoire_firstChar hasnt grimFirstCharKitchenEnded: 
                                                                            Forse cucinare con lei avrebbe aperto qualche altra occasione di chiarimento? Chi lo sa.
                }
                {charTag(FifthCharacter, "hurry")}:                         Direi: buon lavoro.

            - else:
                                                                            Nell'insieme la vostra relazione si è rivelata ottima.
                {charTag(FifthCharacter, "hurry")}:                         Credo proprio che tu abbia fatto sentire {charNameOne} ascoltata e capita.   
        }

        {charTag(FifthCharacter, "neutral")}:                               Il nome che ha scelto è stato {charNameOne}.  

        {
            - firstChar_ActualName ==  Triangolo:
                                                                            E hai aiutato {charNameOne} a trovare il bello nel quotidiano.
                {charTag(FifthCharacter, "hurry")}:                         Qualcosa che personalmente apprezzo molto.
                {
                    - grimoire_firstChar has grimFirstCharMentor:           Come ricorderai dalla mia chiacchierata con {charNameOne}.
                }
                {charTag(FifthCharacter, "neutral")}:                       E che spero possa apprezzare anche lei.
                                                                            {charNameOne} forse ora è capace di vedere quanta bellezza e quante soddisfazioni ha nella vita.
                                                                            Grazie a te.
                
            - firstChar_ActualName ==  Orchestra:
                {charTag(FifthCharacter, "neutral")}:                       E ora {charNameOne} è pronta per cambiare città, provare qualcosa di nuovo.
                                                                            Con una persona a cui vuole bene.
                {charTag(FifthCharacter, "sad")}:                           Ammetto che un po' mi ha colpita questa scelta, ma perché {charNameOne} ha già vicine persone che le vogliono molto bene.
                {charTag(FifthCharacter, "neutral")}:                       Ma immagino che a volte andarsene possa aiutare.
                {charTag(FifthCharacter, "sad")}:                           Anche se si dice che i problemi che abbiamo ci seguono quando ce ne andiamo, vero?
                
            - firstChar_ActualName ==  FlautoDolce:
                {charTag(FifthCharacter, "neutral")}:                       E dopo il percorso fatto con te, {charNameOne} ha deciso di fare un passo enorme.
                {charTag(FifthCharacter, "hurry")}:                         Mettere al centro della propria vita la propria passione, non è cosa da tutt3.

            - firstChar_ActualName == Ocarina:
                {charTag(FifthCharacter, "hurry")}:                         L'idea di tornare dalla sua famiglia di origine è qualcosa che ha fatto tremare il mio cuore.
                {charTag(FifthCharacter, "neutral")}:                       Un gesto bello.
                                                                            Che risponde al bisogno di ricominciare da un luogo che si conosce, anche per aiutare le altre persone.
                                                                            E la parte più giocosa di {charNameOne} e infantile, ha trovato il suo scopo nel riabbracciare le proprie radici.
                
            - firstChar_ActualName == Violino:
                {charTag(FifthCharacter, "neutral")}:                       E {charNameOne} ha scelto l'amore.
                                                                            L'amore è uno strumento molto potente.
                                                                            Spero possa trovare la felicità di cui ha bisogno.  
        }
        
        
        {charTag(FifthCharacter, "hurry")}:                                 Non ti conosco ancora abbastanza, ma ci tengo a dirtelo: sentiti {player_pronoun has him:soddisfatto|{player_pronoun has her:soddisfatta|soddisfattə}}!
        {charTag(FifthCharacter, "neutral")}:                               Questo è un lavoro complesso, ma vedrai che col tempo sarà tutto più facile.
        {charTag(FifthCharacter, "hurry")}:                                 Comunque sia, direi che ti ho dato tutti gli strumenti per far sì che tu possa riscrivere storie in autonomia. 
                                                                            Ma se avrai bisogno di aiuto o un po' di supporto personale, sono sempre qui.
        {charTag(FifthCharacter, "neutral")}:                               O anche solo per due chiacchiere.
                                                                            A dopo.

            -> mentor_closing_storylet ->
            -> main
          
=== second_character_feedback
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
       
    
   {charTag(FifthCharacter, "neutral")}:                                    Hai finito il percorso con {charNameTwo}, {player_name}!
                                                                            Ed entramb3 mi avete stupita: non pensavo davvero che un bambino avrebbe tratto giovamento da questo luogo.
        {
            - are_two_entities_together(SecondCharacter, PG):
                {charTag(SecondCharacter, "energy")}:                       Il mio nome è {charNameTwo}, e sono sempre felice di stupirvi!
                {charTag(FifthCharacter, "neutral")}:                       Mi mancherai bimbetto, mi mancherai.
        }

    {charTag(FifthCharacter, "neutral")}:                                   È arrivato il momento da darti un commento su come sono andate le cose con lui.
            {
                - are_two_entities_together(FirstCharacter, PG):
                    {charTag(FirstCharacter, "neutral")}:                   Immagino sia giusto lasciarvi in santa pace.
                        ~ change_entity_place(FirstCharacter)
            }
            {
                - are_two_entities_together(SecondCharacter, PG):
                    {charTag(SecondCharacter, "energy")}:                   Mi sa che vado a salutare il pipistrello prima di partire!
                        ~ change_entity_place(SecondCharacter)
            }

    {charTag(FifthCharacter, "neutral")}:                                   Iniziamo dal lavoro preparatorio che hai fatto.        
        {
            - secondChar_giftedObject == ():
                                                                            Hai scelto di non offrire doni a {charNameTwo}. 
                {charTag(FifthCharacter, "sad")}:                           Spero sia stata una scelta deliberata, e non la paura di sbagliare.

            - secondChar_favouritesGifts has secondChar_giftedObject:
                {charTag(FifthCharacter, "hurry")}:                         Hai donato qualcosa che ha fatto {charNameTwo} molto molto felice.
                                                                            E questo è indice di grande ascolto e comprensione da parte tua.

            - secondChar_goodGifts has secondChar_giftedObject:
                                                                            Hai donato qualcosa che {charNameTwo} ha davvero apprezzato.
                                                                            Poteva andare meglio, ma sono sicura che questo non ti abbia complicato la riscrittura.

            - secondChar_giftedObject != () && (secondChar_favouritesGifts hasnt secondChar_giftedObject) && (secondChar_goodGifts hasnt secondChar_giftedObject):
                {charTag(FifthCharacter, "sorry")}:                         Hai donato a {charNameTwo} la sua cosa "schiferita", come direbbe mio figlio.
                                                                            Ehm, scusa.
                                                                            Comunque un dono poco apprezzato non ti ha permesso di ottenere dell'inchiostro.

        }
        {
            - secondChar_relationshipStatus == negative:
                {charTag(FifthCharacter, "sad")}:                           Mi spiace che tu non abbia creato una grande relazione con lui.
                                                                            Credo sia inevitabile, soprattutto con un bambino.
                {charTag(FifthCharacter, "neutral")}:                       Sono molto più complessi di un adulto.
                {charTag(FifthCharacter, "sorry")}:                         Avrei dovuto darti degli strumenti migliori.
                {
                        - grimoire_secondChar hasnt grimSecondCharKitchenEnded::
                                                                            Non so se l'hai tenuto lontano dalla cucina per non fare disastri, ma magari avrebbe apprezzato.
                    }

            - secondChar_relationshipStatus == neutral:
                {charTag(FifthCharacter, "hurry")}:                         Sei riuscit{player_pronoun has him:o|{player_pronoun has her:a|ə}} a creare una bella relazione con {charNameTwo}, che si è fidato di te.
                    {
                        - grimoire_secondChar hasnt grimSecondCharKitchenEnded::
                                                                            Non so se l'hai tenuto lontano dalla cucina per non fare disastri, ma magari avrebbe apprezzato.
                    }
                                                                            Hai fatto un buon lavoro.
                {charTag(FifthCharacter, "neutral")}:                       Non perfetto, ma buono.

            - else:
                {charTag(FifthCharacter, "hurry")}:                         Hai creato con lui la migliore relazione pensabile.
                                                                            Spero tu possa provare gioia, {player_name}!
                
        }

    {charTag(FifthCharacter, "neutral")}:                                   Il nostro piccoletto ha scelto il nome di {charNameTwo}. 

    {
            - secondChar_ActualName == Grizzly:
                {charTag(FifthCharacter, "neutral")}:                       Ha deciso di abbracciare il suo lato rabbioso.
                                                                            E invece di combatterlo, l'ha fatto proprio.
                {charTag(FifthCharacter, "sad")}:                           Personalmente, la rabbia non mi convince mai molto.
                                                                            Porta solo disordine e dolore.
                {charTag(FifthCharacter, "neutral")}:                       Ma quello che non funziona per una persona, può essere la soluzione per un'altra.
                {charTag(FifthCharacter, "sad")}:                           Vero?
    
            - secondChar_ActualName == Lupo:
                {charTag(FifthCharacter, "neutral")}:                       La famiglia è qualcosa di importante, {player_name}.
                                                                            E sono contenta che {charNameTwo} abbia scoperto in sé la voglia di prendersene cura.
                {charTag(FifthCharacter, "sad")}:                           Spero solo che non si sobbarchi di un carico che non è adatto a un bambino.
                {charTag(FifthCharacter, "neutral")}:                       Magari un giorno la sua nonna e suo fratello torneranno sotto il tetto dei genitori.
                {charTag(FifthCharacter, "hurry")}:                         Per me sarebbe un finale davvero felice.

            - secondChar_ActualName == Delfino:
                {charTag(FifthCharacter, "neutral")}:                       Sono perplessa: non pensavo l'avresti spinto ad abbracciare il suo lato più infantile.
                                                                            Giocoso.
                                                                            So che il tuo lavoro è fare uscire queste persone dal blocco.
                {charTag(FifthCharacter, "sad")}:                           Mi chiedo solo se renderlo un giullare potesse essere l'unica soluzione.
                                                                            Un giullare bugiardo.
                
            - secondChar_ActualName == Capibara:
                {charTag(FifthCharacter, "sad")}:                           A volte forse devo solo dirmi: non tutto il mondo può essere come vorrei.
                {charTag(FifthCharacter, "neutral")}:                       Il fatto che il nostro piccolo amico ora si senta un {charNameTwo} mi lascia perplessa.
                {charTag(FifthCharacter, "sorry")}:                         Non sono mai stata una grande fan de "l'unione fa la forza".
                {charTag(FifthCharacter, "neutral")}:                       Ma forse tu hai visto qualcosa in quel bimbo che a me sfuggiva.
                                                                            E un giorno diventerà un uomo responsabile.
                                                                            Spero.
            
            - secondChar_ActualName == Corvo:
                {charTag(FifthCharacter, "hurry")}:                         In cuor mio, non credo avresti potuto ottenere un esito migliore.
                {charTag(FifthCharacter, "neutral")}:                       La sua curiosità, la sua intelligenza indirizzate verso qualcosa di concreto, utile.
                {charTag(FifthCharacter, "hurry")}:                         Ce lo vedo a studiare nuovi modi per curare le persone.
                                                                            Per ridurre la fame nel mondo.
                                                                            O anche solo per inventare una variante di begonia che sia completamente nera.
                {charTag(FifthCharacter, "hurry")}:                         Ottimo lavoro, {player_name}!
        }
        
    {charTag(FifthCharacter, "neutral")}:                                   Spero di cuore che tu sia felice di quello che stai facendo.
                                                                            A prescindere dal risultato.
    {charTag(FifthCharacter, "hurry")}:                                     E un giorno potrai fare questo lavoro da {player_pronoun has him:solo|{player_pronoun has her:sola|solə}}.
    {charTag(FifthCharacter, "sad")}:                                       E a quel punto forse anche io potrò un poco riposare.
    
        -> mentor_closing_storylet ->
        -> main
   

=== third_character_feedback
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
     
    
   {charTag(FifthCharacter, "neutral")}:       third_character_feedback  
        -> mentor_closing_storylet ->
        -> main
   
=== fourth_character_feedback
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    
    
    {charTag(FifthCharacter, "neutral")}:       fourth_character_feedback  
        
        -> mentor_closing_storylet ->
        -> main
    
=== fifth_character_feedback
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
        
    
    {charTag(FifthCharacter, "neutral")}:       fifth_character_feedback 
        
        -> mentor_closing_storylet ->
        -> main