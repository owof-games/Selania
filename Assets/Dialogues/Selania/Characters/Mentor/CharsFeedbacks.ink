//Feedback//
=== first_character_feedback
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)


        Hai concluso la riscrittura di {charNameOne}, {player_name}!#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_hurry
        E quindi: è tempo di feedback!
            {
                - are_two_entities_together(FirstCharacter, PG):
                    Ehm, non sono una grande fan delle pagelle.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                        ~ change_entity_place(FirstCharacter)
            }
            {
                - are_two_entities_together(SecondCharacter, PG):
                    Ma siamo a scuola?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                    Che noooooia!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                        ~ change_entity_place(SecondCharacter)
            }
        
        Partiamo con un promemoria: non ci sono riscritture buone o cattive, e nomi sbagliati.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        Ma: il mio lavoro come {mentorName} è quello di assicurarmi che tu possa essere la versione migliore di te.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        E quindi.
        {
            - firstChar_giftedObject == ():
                Ho notato che hai deciso di non donare nulla a {charNameOne}.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Spero che questo non ti abbia complicato il lavoro.

            - firstChar_favouritesGifts has firstChar_giftedObject:
                Hai donato qualcosa che {charNameOne} ha adorato.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Sono così orgogliosa di te!#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry

            - firstChar_goodGifts has firstChar_giftedObject:
                Hai donato qualcosa che {charNameOne} ha apprezzato molto.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Poteva esserci qualcosa di meglio?
                Sicuramente sì.#speaker:{fifthChar_tag()}#inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_sad
                Era quello l'obiettivo?#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                No, se sei {player_pronouns has him:soddisfatto|{player_pronouns has her:soddisfatta|soddisfattə}} di com'è andata la riscrittura.

            - firstChar_giftedObject != () && (firstChar_favouritesGifts hasnt firstChar_giftedObject) && (firstChar_goodGifts hasnt firstChar_giftedObject):
                Hai donato qualcosa che {charNameOne} non desiderava.#speaker:{fifthChar_tag()}#inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_sad
                Questo non ti ha permesso di ottenere dell'inchiostro in più.
                Ma dai propri errori si impara, giusto?#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry

        }
        {
            - firstChar_relationshipStatus == 0:
                La vostra relazione non è proprio andata benissimo.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Ecco: forse qui è dove mi sento più in colpa.#speaker:{fifthChar_tag()}#inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_sad
                Perché l'alunno alla fine rispecchia sempre le capacità dell'insegnante.

            - firstChar_relationshipStatus == 1:
                Hai sviluppato con {charNameOne} una buona fiducia.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                {
                    - not ending_cooking_with_first_char: 
                            Forse cucinare con lei avrebbe aperto qualche altra occasione di chiarimento? Chi lo sa.
                }
                Hai fatto un buon lavoro.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry

            - firstChar_relationshipStatus == 2:
                La vostra relazione si è rivelata ottima.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                Credo proprio che tu abbia fatto sentire {charNameOne} ascoltata e capita.   
        }

        Il nome che ha scelto è stato {charNameOne}. #speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral 

        {
            - firstChar_ActualName ==  Triangolo:
                E hai aiutato {charNameOne} a trovare il bello nel quotidiano.
                Qualcosa che personalmente apprezzo molto.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                {
                    - grimoire_firstChar has grimFirstCharMentor: Come ricorderai dalla mia chiacchierata con {charNameOne}.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                }
                E che spero possa apprezzare anche lei.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                {charNameOne} forse ora è capace di vedere quanta bellezza e quante soddisfazioni ha nella vita.
                Grazie a te.
                
            - firstChar_ActualName ==  RagazzaOrchestra:
                E ora {charNameOne} è pronta per cambiare città, provare qualcosa di nuovo.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Con una persona a cui vuole bene.
                Ammetto che un po' mi ha colpita questa scelta, ma perché {charNameOne} ha già vicine persone che le vogliono molto bene.#speaker:{fifthChar_tag()}#inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_sad
                Ma immagino che a volte andarsene possa aiutare.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Anche se si dice che i problemi che abbiamo ci seguono quando ce ne andiamo, vero?#speaker:{fifthChar_tag()}#inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_sad
                
            - firstChar_ActualName ==  FlautoDolce:
                E dopo il percorso fatto con te, {charNameOne} ha deciso di fare un passo enorme.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Mettere al centro della propria vita le altre persone, non è cosa da tutt3.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                E la propria passione.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                
            - firstChar_ActualName == Ocarina:
                L'idea di tornare dalla sua famiglia di origine è qualcosa che mi ha fatto tremare il mio cuoricino.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                Un gesto bello.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Che risponde al bisogno di ricominciare da un luogo che si conosce, anche per aiutare le altre persone.
                E la parte più giocosa di {charNameOne} e infantile, ha trovato il suo scopo nel riabbracciare le proprie radici.
                
            - firstChar_ActualName == Violino:
                E {charNameOne} ha scelto l'amore.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                L'amore è uno strumento molto potente.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                Spero possa trovare la felicità di cui ha bisogno.  
        }
        
        
        Non ti conosco ancora abbastanza, ma ci tengo a dirtelo: sentiti {player_pronouns has him:soddisfatto|{player_pronouns has her:soddisfatta|soddisfattə}}!#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_hurry
        Questo è un lavoro complesso, ma vedrai che col tempo sarà tutto più facile.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_neutral
        Comunque sia, direi che ti ho dato tutti gli strumenti per far sì che tu possa riscrivere storie in autonomia. #speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        Ma se avrai bisogno di aiuto per i luoghi del giardino, o un po' di supporto personale, sono qui.
        O anche solo per due chiacchiere.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        A dopo.

            -> mentor_closing_storylet ->
            -> main
          
=== second_character_feedback
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)   
    
   Hai finito il percorso con {charNameTwo}, {player_name}!#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_neutral
   Ed entramb3 mi avete stupita: non pensavo davvero che un bambino avrebbe avuto bisogno di questo luogo.
   E ne avrebbe tratto così tanto giovamento.
        {
            - are_two_entities_together(SecondCharacter, PG):
                Il mio nome è {charNameTwo}, e sono sempre felice di stupirvi!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                Mi mancherai bimbetto, mi mancherai.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_neutral
        }

    Ed è arrivato il momento di dirti due cosine su come sono andate le cose.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
            {
                - are_two_entities_together(FirstCharacter, PG):
                    Immagino sia giusto lasciarvi in santa pace.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                        ~ change_entity_place(FirstCharacter)
            }
            {
                - are_two_entities_together(SecondCharacter, PG):
                    Mi sa che vado a salutare il pipistrello prima di partire!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
                        ~ change_entity_place(SecondCharacter)
            }
            
        {
            - secondChar_giftedObject == ():
                Hai scelto di non offrire doni a {charNameTwo}. #speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Spero sia stata una scelta deliberata, e non la paura di sbagliare.#speaker:{fifthChar_tag()}#inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_sad

            - secondChar_favouritesGifts has secondChar_giftedObject:
                Hai donato qualcosa che ha fatto {charNameTwo} molto molto felice.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                E questo è indice di grande ascolto e comprensione da parte tua.

            - secondChar_goodGifts has secondChar_giftedObject:
                Hai donato qualcosa che {charNameTwo} ha davvero apprezzato.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Poteva andare meglio, ma sono sicura che questo non ti abbia complicato la riscrittura.

            - secondChar_giftedObject != () && (secondChar_favouritesGifts hasnt secondChar_giftedObject) && (secondChar_goodGifts hasnt secondChar_giftedObject):
                Hai donato a {charNameTwo} la sua cosa "schiferita", come direbbe mia figlia.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
                Ehm, scusa.
                Comunque un dono poco apprezzato non ti ha permesso di ottenere dell'inchiostro.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral

        }
        {
            - secondChar_relationshipStatus == 0:
                Non avete sviluppato una grande relazione.#speaker:{fifthChar_tag()}#inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_sad
                Credo sia inevitabile, soprattutto con un bambino.
                Sono molto più complessi di un adulto.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Avrei dovuto darti degli strumenti migliori.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_sorry

            - secondChar_relationshipStatus == 1:
                {charNameTwo} si è fidato di te.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                    {
                        - not ending_cooking_with_first_char:
                            Non so se l'hai tenuto lontano dalla cucina per non fare disastri, ma magari avrebbe apprezzato.
                    }
                Hai fatto un buon lavoro. Non perfetto, ma buono.

            - secondChar_relationshipStatus == 2:
                Hai creato con lui la migliore relazione pensabile.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                Spero tu possa provare gioia, {player_name}!
                
        }

    Il nostro piccoletto ha scelto il nome di {charNameTwo}.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral 

    {
            - secondChar_ActualName == Grizzly:
                Ha deciso di abbracciare il suo lato rabbioso.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_neutral
                E invece di combatterlo, l'ha fatto proprio.
                Personalmente, la rabbia non mi convince mai molto.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_sad
                Porta solo disordine e dolore.
                Ma quello che non funziona per una persona, può essere la soluzione per un'altra, vero?
    
            - secondChar_ActualName == Lupo:
                La famiglia è qualcosa di importante, {player_name}.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_neutral
                E sono contenta che {charNameTwo} abbia scoperto in sé la voglia di prendersene cura.
                Spero solo che non si sobbarchi di un carico che non è adatto a un bambino.
                Magari un giorno la sua nonna e suo fratello torneranno sotto il tetto dei genitori.
                Per me sarebbe un finale davvero felice.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_hurry

            - secondChar_ActualName == Delfino:
                Sono perplessa: non pensavo l'avresti spinto ad abbracciare il suo lato più infantile.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_neutral
                Giocoso.
                So che il tuo lavoro è fare uscire queste persone dal blocco.
                Mi chiedo solo se renderlo un giullare potesse essere l'unica soluzione.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_sad
                Un giullare bugiardo.
                
            - secondChar_ActualName == Capibara:
                A volte forse devo solo dirmi: non tutto il mondo può essere come vorrei.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_sad
                Il fatto che il nostro piccolo amico ora si senta un {charNameTwo} mi lascia perplessa.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_neutral
                Non sono mai stata una grande fan de "l'unione fa la forza".#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
                Ma forse tu hai visto qualcosa in quel bimbo che a me sfuggiva.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                E un giorno diventerà un uomo responsabile.
                Spero.
            
            - secondChar_ActualName == Corvo:
                In cuor mio, non credo avresti potuto ottenere un esito migliore.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_hurry
                La sua curiosità, la sua intelligenza indirizzate verso qualcosa di concreto, utile.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_neutral
                Ce lo vedo a studiare nuovi modi per curare le persone.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                Per ridurre la fame nel mondo.
                O anche solo per inventare una variante di begonia che sia completamente nera.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Ottimo lavoro, {player_name}!#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_hurry
        }
        
    Spero di cuore che tu sia felice di quello che stai facendo.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_neutral
    A prescindere dal risultato.
    E un giorno potrai fare questo lavoro da {player_pronouns has him:solo|{player_pronouns has her:sola|solə}}.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_hurry
    E a quel punto forse anche io potrò un poco riposare.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_sad
    
        -> mentor_closing_storylet ->
        -> main
   

=== third_character_feedback
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName) 
    
   third_character_feedback #speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_neutral 
        -> mentor_closing_storylet ->
        -> main
   
=== fourth_character_feedback
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
    fourth_character_feedback #speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_neutral 
        
        -> mentor_closing_storylet ->
        -> main
    
=== fifth_character_feedback
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)    
    
    fifth_character_feedback#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Other)} #portrait:mentore_neutral 
        
        -> mentor_closing_storylet ->
        -> main