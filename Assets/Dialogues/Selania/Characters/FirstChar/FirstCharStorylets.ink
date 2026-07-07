=== first_char_main_storylets

    = one
        //Riferimenti per la riscrittura: poco poco affetti.
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour= translator(fourthChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)

         //Aggiungiamo a lista list_currentActors
        ~ list_currentActors += FirstCharacter
        

        {charTag(FirstCharacter, "neutral")}:                   Ehi, ciao!
        {charTag(FirstCharacter, "curious")}:                   Non è che hai visto in giro la versione umana di un pettirosso?
                                                                Una persona rossiccia, morbidosa e che sembra sempre un po' pissata col mondo?
        {charTag(FirstCharacter, "neutral")}:                   Si chiama Talco.
                                                                Tira sempre delle pezze contro le AI o su quanto è divina Florence Welch.
        {charTag(FirstCharacter, "sad")}:                       Sempre che non abbia cambiato fissa in questi mesi.
        {charTag(FirstCharacter, "neutral")}:                   Insomma: l'hai vistə?
        

        + (aether)\ {charTag(PG, "neutral")}:                   Ho sempre pensato che Florence fosse una strega.
                -> glyph_choice_manager(false, aetherC)->
        {charTag(FirstCharacter, "affectionate")}:              Pa-le-se!
        {charTag(FirstCharacter, "curious")}:                   Ha una congrega con Bjork e Tori Amos.
                                                                E passano il sabato sera a maledire gli uomini potenti.


        + (fire) \ {charTag(PG, "neutral")}:                    Talco sembra una persona piena di passioni!
                -> glyph_choice_manager(false, fireC)->
        {charTag(FirstCharacter, "affectionate")}:              Lo è!
        {charTag(FirstCharacter, "neutral")}:                   Anche se a volte è davvero davvero difficile starlə dietro.
                                                                Il tempo che hai iniziato a capire meglio un suo nuovo interesse, ed eccolə che è già su altro.
        {charTag(FirstCharacter, "affectionate")}:              Ma lə voglio bene per questo, perché è una botta di energia anche nei momenti peggiori.                                                     
        
        + (air)\ {charTag(PG, "neutral")}:                      Siete arrivatə qui assieme?
                -> glyph_choice_manager(false, airC)->
        {charTag(FirstCharacter, "annoyed")}:                   Dovrei essere io quella che fa le domande.
        {charTag(FirstCharacter, "neutral")}:                   Ma no, non che io ricordi.
        {charTag(FirstCharacter, "affectionate")}:              Ma ogni volta che mi sono svegliata in posti assurdi era con me. 
                
        + (water) \ {charTag(PG, "neutral")}:                   Sembra una persona a cui tieni molto.
                -> glyph_choice_manager(false, waterC)->
        {charTag(FirstCharacter, "sad")}:                       Talco è.
        {charTag(FirstCharacter, "neutral")}:                   Sì.
                                                                Sì.
                                                                <b>La</b> persona a cui tengo.

        + (earth) \ {charTag(PG, "neutral")}:                   Anche io voglio tirare le pietre contre le AI.
                -> glyph_choice_manager(false, earthC)->
        {charTag(FirstCharacter, "curious")}:                   Le pezze, non le pietre.
        {charTag(FirstCharacter, "affectionate")}:              Ma credo che Talco apprezzerebbe comunque.
        {charTag(FirstCharacter, "neutral")}:                   Io ogni volta che ci penso ho solo il terrore di aver studiato per anni per il nulla.
        -
        
        {charTag(FirstCharacter, "sad")}:                       Merda, Talco sa sempre come tirarmi fuori dai casini!
        {charTag(FirstCharacter, "annoyed")}:                   E avevo giurato ad Ennio che non sarebbero più successe cose strane.
        {charTag(FirstCharacter, "affectionate")}:              Per la cronaca Ennio è il mio ragazzo, mentre Talco è lə miə amə.
        {charTag(FirstCharacter, "neutral")}:                   Ma perché te lo sto dicendo?
                                                                Non è che ho preso dei funghi?
                                                                Come con quel risotto allucinogeno dopo l'esame di composizione.
        {charTag(FirstCharacter, "affectionate")}:              Ma manco mi sono presentata.
                                                                Mi chiamo <b>{charNameOne}</b>.
            - (firstPresentation)
            ~ grimoire_firstChar += grimFirstCharPresentation
        
        {charTag(FirstCharacter, "annoyed")}:                   No no aspetta io sono <b><i>{charNameOne}</b></i>.
                                                                Ehi! Non è mica questo il mio nome!
        {charTag(FirstCharacter, "neutral")}:                   <i>{charNameOne}</i>.
                                                                Ma.
        {charTag(FirstCharacter, "curious")}:                   Se lo dico al contrario?
        {charTag(FirstCharacter, "annoyed")}:                   <i>Arratihc.</i>
        {charTag(FirstCharacter, "neutral")}:                   Uh.
                                                                Prova tu.
                                                                Come ti chiami?

            -> name_choice.top2 ->
            -> gender ->

        {charTag(FirstCharacter, "neutral")}:                   {player_pronoun has her:Anche io uso i pronomi femminili!|Invece io uso i femminili.}
        {charTag(FirstCharacter, "annoyed")}:                   Anche se continuo a non chiamarmi {charNameOne}.
        {charTag(FirstCharacter, "neutral")}:                   Ora: la cosa più sensata è pensare che questa roba sia un'allucinazione.
                                                                Ha senso?
                                                                Forse mi sono di nuovo addormentata a lavoro?
        {charTag(FirstCharacter, "annoyed")}:                   Merda, il capo mi farà il culo.


        {
        - tutorial_MentorTutorial == true:
            ~ temp my_location = entity_location(PG)
            ~ move_entity(Mentor, my_location)
            {
            - are_two_entities_together(Mentor, PG):    
                                                                Ed ecco di nuovo quel fiore parlante!
            }
                
        }
                                                            
        {charTag(FirstCharacter, "neutral")}:                   {player_name}, qual è il messaggio nascosto di questo trip o sogno o quel che è?
                                                                Fai il tuo dovere da inconscio, così mi ripiglio e vedo di non mandare in merda il lavoro.
       

        + \ {charTag(PG, "neutral")}:                           Ma riesci a pensare il tuo vero nome? O ti senti solo {charNameOne}?
            -> glyph_choice_manager(false, airC)->
        {
            - one.air:
            {charTag(FirstCharacter, "annoyed")}:               Siamo alla seconda domanda ama.
            {charTag(FirstCharacter, "neutral")}:               E sono io quella in panico ora, dovresti rispondere alle mie domande!
                                                                Comunque.
        }
        {charTag(FirstCharacter, "neutral")}:                   È come se ci fosse un ronzio di fondo, e ci arrivo vicina col pensiero ma non ce la faccio ad arrivarci.
        {charTag(FirstCharacter, "annoyed")}:                   Come quando una parola ti resta sulla punta della lingua.
                                                                O ti ricordi l'effetto di un accordo, ma continua ad uscirti sbagliato.


        + \ {charTag(PG, "neutral")}:                           Sì sì sono il tuo inconscio e ti dico di fare tu il culo al tuo capo!
            -> glyph_choice_manager(false, fireC)->
        {
            - one.earth:
            {charTag(FirstCharacter, "neutral")}:               Questa fa il paro con le pietre contro le AI.
        }
        {charTag(FirstCharacter, "curious")}:                   Ti assicuro che mi farebbe piacere, se lo merita.
                                                                Ma in questo momento sono troppo preoccupata per poterci davvero pensare.
            

        + \ {charTag(PG, "neutral")}:                           Allora dovrei mostrarti lune di sangue, volpi affamate, rami eterni.
            -> glyph_choice_manager(false, aetherC)->
        {
            - one.aether:
            {charTag(FirstCharacter, "affectionate")}:          Dopo il commento su Florence, ora chiedo direttamente la tua mano.
        }
            {charTag(FirstCharacter, "affectionate")}:          Quindi devo correre per i boschi nuda e cantare alla luna?
            {charTag(FirstCharacter, "neutral")}:               Perché è un piano che mi piace molto.
        

        + (pizzico) \ {charTag(PG, "neutral")}:                 <i>La pizzico, così capisce che sono reale.</i>
            -> glyph_choice_manager(false, earthC)->
        {charTag(FirstCharacter, "annoyed")}:                   Ehi!
        {
            - one.fire:
            {charTag(FirstCharacter, "neutral")}:               Hai intenzione di andare avanti a pizzichi e silenzi?
            {charTag(FirstCharacter, "annoyed")}:               Perché perdonami ama ma è una roba un po' passivo aggressiva!
        }
        {charTag(FirstCharacter, "neutral")}:                   Comunque ok, messaggio arrivato: sei reale.
                                                                O siamo tuttə e due in un sogno.
                

        + (water2) \ {charTag(PG, "neutral")}:                  Facessimo un bel respiro e ripartiamo da capo, con dolcezza.
            -> glyph_choice_manager(false, waterC)->
        {
            - one.water:
            {charTag(FirstCharacter, "neutral")}:               Le cose che mi dici mi rassicurano, {player_name}.
            {charTag(FirstCharacter, "affectionate")}:          Mi piace come mi parli.
        }
            {charTag(FirstCharacter, "neutral")}:               Inspiro.
                                                                Trattengo.
                                                                Espiro.
            {charTag(FirstCharacter, "annoyed")}:               Urlo dentro.
            {charTag(FirstCharacter, "curious")}:               Piacere di nuovo, sono {charNameOne} anche se non è vero.
                                                                Ma potrò prima o poi dire il mio nome.      

        - 
                {
                - are_two_entities_together(Mentor, PG) && tutorial_MentorTutorial == true:    
                {
                - grimoire_fifthChar hasnt grimMentorIntro:
                {charTag(FifthCharacter, "hurry")}:                     Vi chiedo scusa, non avrei voluto origliare, ma volevo dirvi che non siete in un sogno, e che posso aiutarvi.
                {charTag(FifthCharacter, "neutral")}:                   E tu quando puoi parlami, e ti spiegherò un po' di cose.
                {charTag(FirstCharacter, "annoyed")}:                   Oook.
                {charTag(FirstCharacter, "neutral")}:                   Ok.
                
                - else:
                {charTag(FifthCharacter, "hurry")}:                     Scusatemi, non avrei voluto origliare, ma ci tenevo a dirti che no, non sei in un sogno {charNameOne}, ma {player_name} può davvero aiutarti.
                }
                    
                - else:
                                                                    E inizio a sentire caldo.    
                }
            
        
        {charTag(FirstCharacter, "neutral")}:                   Devo idratarmi.
                                                                Devo assolutamente idratarmi.
        ~ move_entity(FirstCharacter, Pond)

            -> first_char_closing_storylet ->
            -> main
        

    
    = two
        //Riferimenti per la riscrittura: poco poco musica.
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour= translator(fourthChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)

         //Aggiungiamo a lista list_currentActors
        ~ list_currentActors += FirstCharacter
        

        {charTag(FirstCharacter, "affectionate")}:              {player_name}, ma hai sentito che silenzio che c'è in questo posto?
        {charTag(FirstCharacter, "neutral")}:                   Mi sento la testa libera.
                                                                Riesco ad ascoltare i miei pensieri.
        {charTag(FirstCharacter, "annoyed")}:                   E non è un bene.
                                                                Ci sono le canzoncine della pubblicità ancorate nel mio cervello.
                                                                Che sfigata.
        {charTag(FirstCharacter, "neutral")}:                   O magari è perché prima ho preso una botta assurda contro il vetro della serra e mi sono resettata il cervello?
        {
            - one.pizzico: 
            {charTag(FirstCharacter, "annoyed")}:               Botta comunque meno fastidiosa del tuo pizzico di prima, mannaggia a te.
        }
        {
            - are_two_entities_together(Mentor, PG):
            {charTag(FifthCharacter, "sorry")}:                 Questo posto non sarà mai abbastanza sicuro.
        }  
        {charTag(FirstCharacter, "neutral")}:                   Però il male mi ha fatto capire che questo non è un altro trip.
                                                                Peccato.
        {charTag(FirstCharacter, "affectionate")}:              Dovrei essere preoccupata, vero?
                                                                Perché invece ho solo sonno.
        {charTag(FirstCharacter, "sad")}:                       Mi spiace giusto perché le mie coinquiline saranno strapreoccupate.
        {charTag(FirstCharacter, "affectionate")}:              Non me l'aspettavo, ma sono diventate la mia famiglia.
        {charTag(FirstCharacter, "neutral")}:                   Sono le persone con cui cazzeggio e piango e con cui ho anche una band.
                                                                Una band davvero figa!
        {charTag(FirstCharacter, "affectionate")}:              Le amo.
        {charTag(FirstCharacter, "sad")}:                       Anche a lavoro saranno incazzati a bestia.
        {charTag(FirstCharacter, "annoyed")}:                   Non che me ne freghi un granché per il capo: è una gran testa di cazzo.
                                                                Come ogni capo.
        {charTag(FirstCharacter, "sad")}:                       Però le colleghe saranno nella merda: se manca una di noi si devono smazzare più lavoro.
        {charTag(FirstCharacter, "neutral")}:                   Siamo sotto personale da sempre e non gliene frega niente a nessuno.
        {charTag(FirstCharacter, "annoyed")}:                   Meno stipendi uguale più guadagni, credo, quella roba lì da ricchi, giusto?
        {charTag(FirstCharacter, "neutral")}:                   Merda, spero che non sia una di quelle situazioni in cui il tempo qui passa lentissimo e nel mondo reale come un fulmine o divento del tutto povera.
        {charTag(FirstCharacter, "annoyed")}:                   Come lo pago l'affitto poi?
        {charTag(FirstCharacter, "neutral")}:                   Mmm.
        {
            - one.water2:
            {charTag(FirstCharacter, "curious")}:               Cosa mi avevi detto prima?
            {charTag(FirstCharacter, "neutral")}:               Ah sì, di respirare.
                                                                Respira, {charNameOne}.
                                                                Respira.

            - else:
            {charTag(FirstCharacter, "neutral")}:               Forse dovrei respirare e bona, alla fine non so come va questa roba.
        }

        {charTag(FirstCharacter, "neutral")}:                   Vorrei giusto avere carta e penna, e pensare a un pezzo su questa situazione.
        {charTag(FirstCharacter, "sad")}:                       Sono settimane che non ho le energie per crearne uno che uno, manco mezzo accordo.
        {charTag(FirstCharacter, "neutral")}:                   Ma sto dicendo cose senza senso, vero {player_name}?
        //TERRA E FUOCO POCO PRESE COME SCELTE
       
        + \ {charTag(PG, "neutral")}:                           Continui a citare trip e allucinazioni, sono cose che hai spesso?
                -> glyph_choice_manager(false, airC)->
            {charTag(FirstCharacter, "neutral")}:               Definisci <i>spesso</i>.
            {charTag(FirstCharacter, "annoyed")}:               No, non farlo, che è meglio.            
            {charTag(FirstCharacter, "curious")}:               Mi è capitato di prendere qualche allucinogeno.
                                                                Ti sembrerà una cosa idiota, ma mi aiutano con l'ansia.
            {charTag(FirstCharacter, "neutral")}:               Ma anche perché li prendo con la giusta compagnia.
                                                                O nel giusto momento.
            {charTag(FirstCharacter, "affectionate")}:          Mi aiutano a guardarmi senza giudicarmi troppo duramente.                                                         

        + \ {charTag(PG, "neutral")}:                           Tu hai più bisogno di fare cose e parlare meno.
                -> glyph_choice_manager(false, fireC)->
            {charTag(FirstCharacter, "annoyed")}:               Mmm, non amo proprio tanto tanto questo modo aggressivo.
            {charTag(FirstCharacter, "neutral")}:               Ma ha senso.
                                                                Potrei iniziare buttandoti nello stagno per esempio, no?
 
        
        + \ {charTag(PG, "neutral")}:                           Respirare è un punto di partenza. L'aria qui è buona.
                -> glyph_choice_manager(false, earthC)->
            {charTag(FirstCharacter, "neutral")}:               Già, e non è solo quello, ama.
            {charTag(FirstCharacter, "affectionate")}:          C'è qualcosa di <i>concreto</i> in quest'aria.
            {charTag(FirstCharacter, "neutral")}:               Come se lentamente mi pulisse via cose che mi appesantiscono.
            
        + \ {charTag(PG, "neutral")}:                           Come sarebbe un brano su questa situazione?
            -> glyph_choice_manager(false, aetherC)->

            {charTag(FirstCharacter, "curious")}:               Sarebbe qualcosa sulle strade.
                                                                Strade come rami.
                                                                E strade come radici.
            {charTag(FirstCharacter, "neutral")}:               E sarebbe una canzone polifonica.
            {charTag(FirstCharacter, "curious")}:               Qualcosa capace di raccontare in modo sincronico più storie, più emozioni.
                                                                Una canzone sul tutto.

        + \ {charTag(PG, "neutral")}:                           Ti mancano le amiche della band?
                -> glyph_choice_manager(false, waterC)->
            {charTag(FirstCharacter, "sad")}:                   Come l'aria.
            {charTag(FirstCharacter, "neutral")}:               Quando suoniamo è come se ci capissimo anche meglio di quando parliamo.
            {charTag(FirstCharacter, "affectionate")}:          A volte finiamo un brano ridendo sguaiate.
                                                                O sto piangendo a dirotto.
        -
        
        {charTag(FirstCharacter, "sad")}:                       Sai {player_name}: mi spiace che Talco non sia qui, ma sono felice di non essere sola.
        {charTag(FirstCharacter, "affectionate")}:              Potrebbe piacermi la tua compagnia.
        {
            - are_two_entities_together(SecondCharacter, PG):
            {charTag(SecondCharacter, "melanchonic")}:          E la mia?
                                                                Non ti piace la mia?
            {charTag(FirstCharacter, "affectionate")}:          Certo piccoletto.
            {charTag(FirstCharacter, "annoyed")}:               A parte quando hai passato venti minuti a spiegarmi perché sono gli scarafaggi sono fighi.
            {charTag(SecondCharacter, "angry")}:                Avevi detto che ti fanno schifo!
            {charTag(FirstCharacter, "neutral")}:               E non ho cambiato idea.               
        }

            -> first_char_closing_storylet ->
            -> options_first_character 
        
    = three
        //Riferimenti per la riscrittura: affetti e far del bene, scopo più grande
        //Reference musicale: Patricia di Florence + the Machine
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour= translator(fourthChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)

         //Aggiungiamo a lista list_currentActors
        ~ list_currentActors += FirstCharacter
        

        {charTag(FirstCharacter, "neutral")}:                   Ehi {player_name}!
                                                                Prima ho parlato con {charNameFive} che mi ha spiegato che sei qui per sistemarmi il cervello.
        {
            - are_two_entities_together(Mentor, PG):
                {charTag(FifthCharacter, "sorry")}:             Non l'ho messa esattamente così.
                                                                Ma va bene, immagino.             
        }    
        {charTag(FirstCharacter, "sad")}:                       {player_pronoun has him:Povero|{player_pronoun has her:Povera|Poverə}}.
        {charTag(FirstCharacter, "neutral")}:                   Dice che c'è qualcosa che mi blocca.
                                                                E che quando mi fiderò di te potrò chiederti aiuto e sbloccarmi e tornare a casa.
        {charTag(FirstCharacter, "annoyed")}:                   Tipo una versione emo di Dungeons & Dragons.
        {charTag(FirstCharacter, "affectionate")}:              Stavo per dirle: guarda, mi fido già di {player_name}!
                                                                Sono un labrador e mi fido sempre di tuttə subito.
        {charTag(FirstCharacter, "neutral")}:                   Poi ho pensato che non è vero.
        {charTag(FirstCharacter, "sad")}:                       Mi fido fino in fondo solo di Talco.
        {charTag(FirstCharacter, "annoyed")}:                   Si dice spesso "La cosa x mi ha salvato la vita", e ho sempre creduto che fosse una cazzata.
                                                                Pensavo che niente salvasse nessunə.
        {charTag(FirstCharacter, "neutral")}:                   Poi ho conosciuto Talco.
                                                                Abbiamo iniziato il Conservatorio assieme, ma ləi l'ha lasciato dopo un anno.
        {charTag(FirstCharacter, "curious")}:                   Credo abbia litigato con tutti i professori.
                                                                E anche i tizi della reception.
                                                                Talco non sopporta le regole che non hanno senso, e il Conservatorio ne è pieno.
        {charTag(FirstCharacter, "sad")}:                       Non so se l'avevi già capito {player_name}, ma io invece sono una persona che si tira un sacco di film in testa.
                                                                E quando ho incontrato Talco, ero bloccata in un brutto film che durava dalla fine del liceo.
        {charTag(FirstCharacter, "neutral")}:                   E ləi mi ha buttato nel mondo.
        {charTag(FirstCharacter, "curious")}:                   Mi ha fatto fare cose piccole che mi hanno aperto la testa.
                                                                Come quando ci siamo stesə in piazza per vedere come le persone reagivano.
        {charTag(FirstCharacter, "affectionate")}:              O riempito di stickers le Tesla con scritto "NaziMachine".
        {
        - are_two_entities_together(ThirdCharacter, PG):
        {
        - thirdChar_firstCharRage == true or grimoire_thirdChar has grimFirstThirdChar:
        {charTag(ThirdCharacter, "bored")}:                     Ovvio che fossi una di <i>quelle</i>.

        - else:
        {charTag(ThirdCharacter, "bored")}:                     Ma che c'entrano le macchine dei poveracci?    
        }
        }          
        {charTag(FirstCharacter, "neutral")}:                   O tutte le volte che davanti a una cosa ingiusta ha detto "no"!
                                                                Mi ha fatto capire che per me è importante fare qualcosa di utile per il mondo.
                                                                E che mi piace quando posso farlo con altre persone.
        {charTag(FirstCharacter, "sad")}:                       Io non so se sono davvero bloccata in qualcosa, come dice {charNameFive}.
                                                                Ma forse è vero che in qualche modo non mi muovo nella mia vita da un po'.
        {charTag(FirstCharacter, "affectionate")}:              Con Talco mi sono messa in situazioni strane perché mi fidavo di ləi.
        {charTag(FirstCharacter, "curious")}:                   E mi chiedevo: secondo te, cosa vuol dire fidarsi?
        //MAGGIOR PARTE DELLE SCELTE: ACQUA
        + \ {charTag(PG, "neutral")}:                           Sapere di poter essere vulnerabili.
                -> glyph_choice_manager(false, waterC)->
            {charTag(FirstCharacter, "affectionate")}:          Questa è una cosa che mi tocca il cuore, {player_name}.
                                                                È così bello essere vulnerabili.
            {charTag(FirstCharacter, "sad")}:                   E così faticoso.
            {charTag(FirstCharacter, "neutral")}:               Sapere che una persona può accogliere le tue fragilità è la vita.
                                                                Totale.
            
        + \ {charTag(PG, "neutral")}:                           La fiducia è una rete che ti accoglie quando cadi.
                -> glyph_choice_manager(false, aetherC)->
            {charTag(FirstCharacter, "neutral")}:               E a volte hai bisogno di cadere.
            {charTag(FirstCharacter, "sad")}:                   Quando arrivi proprio in alto, ma è un alto che non è tuo.
            {charTag(FirstCharacter, "neutral")}:               E allora devi mollare la presa, e sperare che qualcuno ti prenda.
                                                                Ha senso?
        
        + \ {charTag(PG, "neutral")}:                           Poter condividere i ragionamenti più assurdi senza venir giudicatə.
                -> glyph_choice_manager(false, airC)->
            {charTag(FirstCharacter, "neutral")}:               Tu sei come Talco.    
            {charTag(FirstCharacter, "affectionate")}:          Abbiamo passato nottate a immaginare gli scenari più assurdi.
            {charTag(FirstCharacter, "neutral")}:               Esplorare i limiti del lecito, per capire cosa per noi conta davvero.
        
      
        + \ {charTag(PG, "neutral")}:                           Concordare delle regole e vederle rispettate.
                -> glyph_choice_manager(false, earthC)->
            {charTag(FirstCharacter, "neutral")}:               Uh.
            {charTag(FirstCharacter, "annoyed")}:               Ma ti hanno spedit{player_pronoun has him:o|{player_pronoun has her:a|ə}} qui per caso col manuale delle istruzioni?
                                                                Che così ti resetto.
                                                                Che noia.
        
        + \ {charTag(PG, "neutral")}:                           La certezza che si può finire nella merda assieme e uscirne assieme.
                -> glyph_choice_manager(false, fireC)-> 
            {charTag(FirstCharacter, "curious")}:               Tu devi essere un{player_pronoun has him:o|{player_pronoun has her:a|ə}} che si caccia spesso nei casini, vero?
            {charTag(FirstCharacter, "neutral")}:               Mi piace come frase.
                                                                Ma non c'è solo il casino, no?
            {charTag(FirstCharacter, "sad")}:                   Anzi: la parte dura è esserci per le cose più piccole e noiose.
            {charTag(FirstCharacter, "neutral")}:               Ha senso?
            -
                                                                Mi manca, Talco.
                                                                Mi spiace per come le cose siano cambiate.    

                -> first_char_closing_storylet ->
                -> options_first_character
        
    = four
        //Riferimenti per la riscrittura: avere uno scopo
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour= translator(fourthChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)

         //Aggiungiamo a lista list_currentActors
        ~ list_currentActors += FirstCharacter
        
        
        {charTag(FirstCharacter, "neutral")}:                   Quando prima sono andata in panico parlando di lavoro, è perché da qualche mese servo in un ristorante.
        {charTag(FirstCharacter, "annoyed")}:                   Uno di quelli lussuosi, che si gasano tipo perché hanno la sede sia a Buco di Culo Lombardo che a Pechino.
        {
            - are_two_entities_together(Mentor, PG):
            {charTag(FifthCharacter, "neutral")}:               Potremmo evitare le parolacce, {charNameOne}?
            {charTag(FirstCharacter, "annoyed")}:               Oook.
            {charTag(FirstCharacter, "curious")}:               Ano Lombardo.
            {
                - are_two_entities_together(SecondCharacter, PG):
                {charTag(SecondCharacter, "energy")}:           Ano.
                                                                Ano ano ano.
                                                                Anoooooooooo!
                {charTag(FifthCharacter, "bored")}:             {charNameTwo}!
                {charTag(SecondCharacter, "melanchonic")}:      ...
                {charTag(SecondCharacter, "energy")}:           Ano.       
            }        
        }
        {charTag(FirstCharacter, "annoyed")}:                   Ovviamente in posti del genere non ti pagano un cazzo.
        {
            - are_two_entities_together(Mentor, PG):
                {charTag(FifthCharacter, "sad")}:               Mi arrendo.
        }
        {charTag(FirstCharacter, "sad")}:                       E ama, non era quello che mi aspettavo dopo il Conservatorio.
                                                                Zero proprio.
        {charTag(FirstCharacter, "neutral")}:                   Per un po' sono riuscita ad avere qualche commissione con il pianoforte, ma quasi sempre non pagata.
        {charTag(FirstCharacter, "sad")}:                       Poi mio padre ha perso il lavoro e mi ha detto: figlia, siamo nella merda.
        {charTag(FirstCharacter, "annoyed")}:                   E quindi: eccoci qui.
        {charTag(FirstCharacter, "neutral")}:                   Tengo sempre un orecchio alzato per qualche concertino.
        {
        - are_two_entities_together(ThirdCharacter, PG):
        {
        - thirdChar_firstCharRage == true or grimoire_thirdChar has grimFirstThirdChar:
        {charTag(ThirdCharacter, "jester")}:                    Bene, ora so dove non andare se mai avrò un fine settimana libero.

        - else:
        {charTag(ThirdCharacter, "neutral")}:                   Potremmo organizzare qualcosa al Baretto!
                                                                Ogni tanto chiamiamo qualche band, e i clienti lasciano un po' di mance.
        }
        }          
        {charTag(FirstCharacter, "annoyed")}:                   Ma per lo più sono di sera o nel fine settimana, quando figurati se mi danno il giorno libero dal ristorante.
        {charTag(FirstCharacter, "affectionate")}:              Per fortuna ci sono le prove con la band.
        {charTag(FirstCharacter, "sad")}:                       Quando ho le energie per farle.
        {charTag(FirstCharacter, "neutral")}:                   Lavorare al ristorante è una botta di fatica, ma il rapporto con le colleghe è bello.
        {charTag(FirstCharacter, "annoyed")}:                   Con alcune, per lo meno.
        {charTag(FirstCharacter, "neutral")}:                   Ogni tanto si parla di tirare su un gruppo sindacale.
                                                                Una cosa che esce così, quando magari ci accompagniamo alla fermata del bus.
                                                                E di nascosto, perché coi contrattini da fame che ci ritroviamo fanno alla svelta a lasciarci a casa.
        {charTag(FirstCharacter, "affectionate")}:              Deve essere bello dire "no!" assieme.                                                        
        {charTag(FirstCharacter, "sad")}:                       Ma non abbiamo ancora fatto il salto.
                                                                Forse sono solo stanca.
        {charTag(FirstCharacter, "neutral")}:                   Ma sento che dovrei fare qualcosa di più grande, che faccia meglio a più persone.
                                                                Non so se ha senso.
        
        + (no)  \ {charTag(PG, "neutral")}:                     Molti "no" hanno cambiato la storia.
                -> glyph_choice_manager(false, aetherC)->
        {charTag(FirstCharacter, "affectionate")}:              ESATTO!
        {charTag(FirstCharacter, "neutral")}:                   Sono paroline potentissime.
                                                                Talco dice che alcune parole sono magiche.
                                                                E "no" sicuramente è magica.
        {charTag(FirstCharacter, "sad")}:                       A volte mi fa una paura tremenda, {player_name}.                                                        
        
    
        + \ {charTag(PG, "neutral")}:                           Le energie sono sprecate solo se non sono indirizzate.
                -> glyph_choice_manager(false, earthC)->
            {charTag(FirstCharacter, "neutral")}:               Mmm.
                                                                Ok.
                                                                Cioè: ha senso.
            {charTag(FirstCharacter, "annoyed")}:               Ma non era quello il punto per me.
        

        + \ {charTag(PG, "neutral")}:                           Siamo vivə solo quando lottiamo, {charNameOne}! Vai di sindacato!
                -> glyph_choice_manager(false, fireC)-> 
            {charTag(FirstCharacter, "affectionate")}:          Quando si torna nel mondo tu vieni con me.
                                                                Che con questa energia risolviamo tutti i problemi in quindici giorni.
            {charTag(FirstCharacter, "neutral")}:               Risolviamo anche la fame nel mondo a 'sto punto.
            

        + (air)\ {charTag(PG, "neutral")}:                           Come mai dici spesso "non so se ha senso" o "ha senso?"?
                -> glyph_choice_manager(false, airC)->
            {charTag(FirstCharacter, "neutral")}:               Ehm.
                                                                Non vorrei dirti come devi fare il tuo lavoro, {player_name}.
                                                                Ma non ci vuole un genio per capire che sono una persona
                                                                IN
                                                                SI
                                                                CU
                                                                RA!
            {charTag(FirstCharacter, "annoyed")}:               E continuo a pensare di dire cazzate.
                                                                E domande come questa non mi aiutano moltissimo.                                                
            
        + \ {charTag(PG, "neutral")}:                           Sono le parole di una persona generosa.
                -> glyph_choice_manager(false, waterC)->
            {charTag(FirstCharacter, "neutral")}:               Una che ci prova.
                                                                E poi non è solo generosità.
                                                                Chi è che vuole vivere in un mondo pieno di merda?
            {charTag(FirstCharacter, "affectionate")}:          Però grazie, sei molto gentile {player_name}.
        -    
        
        {charTag(FirstCharacter, "affectionate")}:              A prescindere, ci sono giornate in cui l'unica cosa che mi tira giù dal letto è l'idea che le cose possano cambiare.
                                                                Gli insulti ai capoccia.
                                                                Il tenere traccia di tutte le ingiustizie.
        {charTag(FirstCharacter, "neutral")}:                   La speranza di fargliele ripagare, un giorno o l'altro.

            -> first_char_closing_storylet ->
            -> options_first_character
            
    = five
        //Riferimenti per la riscrittura: relazioni, forse un po' di rinuncia.
        //Reference musicale: All your gold di Bat for Lashes
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour= translator(fourthChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)

         //Aggiungiamo a lista list_currentActors
        ~ list_currentActors += FirstCharacter
        

        {charTag(FirstCharacter, "neutral")}:                   Prima mi sono tuffata nello stagno.
        {
            - are_two_entities_together(Mentor, PG):
                {charTag(FifthCharacter, "bored")}:             Non è igienico!
                                                                E non sappiamo cosa c'è sul fondale!    
        }
        {charTag(FirstCharacter, "neutral")}:                   Avevo bisogno di fare qualcosa di diverso.
        {charTag(FirstCharacter, "affectionate")}:              Mi aspettavo acqua fredda e schifosa, e invece era tiepida e avvolgente.
                                                                Mi ha fatto sentire al sicuro, a casa.
        {charTag(FirstCharacter, "neutral")}:                   La catapecchia dove vivo è piena di muffa, ma è calda grazie a Valeria e le altre coinquiline.
        {charTag(FirstCharacter, "sad")}:                       Ultimamente però il continuo ricambio di coinqui e le tracce di chi se ne è andata riempie lo spazio di fantasmi.
                                                                Mi fa sentire precaria, tipo.
        {charTag(FirstCharacter, "neutral")}:                   Poi c'è la casa dei miei.
                                                                Continuo a dire "torno a casa" quando scendo a trovarli.
        {charTag(FirstCharacter, "affectionate")}:              Ma se vogliamo dircela davvero è un bel posto pieno di ricordi.
        {charTag(FirstCharacter, "sad")}:                       Ma non qualcosa dove restare.
        {charTag(FirstCharacter, "neutral")}:                   Credo.
                                                                E poi c'è Ennio.
                                                                In questi anni mi sono chiesta se Ennio possa essere la mia casa, il mio rifugio.
                                                                Quando l'ho conosciuto non avrei mai pensato che ci saremmo messi assieme.
        {charTag(FirstCharacter, "annoyed")}:                   Lo trovavo noioso.
        {charTag(FirstCharacter, "affectionate")}:              E invece è diventato il mio primo amore, quello con la A gigante.
        {charTag(FirstCharacter, "neutral")}:                   Non è una persona che ti fa sdraiare in mezzo a una piazza, è più uno da sabato pomeriggio a fare la spesa.
        {charTag(FirstCharacter, "neutral")}:                   Pensavo che una persona così solida mi avrebbe permesso di sperimentarmi tantissimo.
                                                                Avrei potuto fare qualsiasi cazzata, sicura di avere una persona a cui tornare.
        {charTag(FirstCharacter, "sad")}:                       Col tempo però ho smesso di svolazzare.
                                                                E non so se è perché sto crescendo, o se perché il suo peso mi tiene a terra.
                                                                Forse capisco sempre di più perché mi chiamo {charNameOne}.
        {charTag(FirstCharacter, "neutral")}:                   Mi ripeto che essere adulta significa riconoscere che bisogna fare delle scelte, che non si può avere tutto.
                                                                Forse però non sono capace di prevedere le conseguenze delle mie scelte.
        {charTag(FirstCharacter, "annoyed")}:                   Faccio sempre schifo col pianificare le cose.
                                                                Ha senso?
            {
                - first_char_main_storylets.four.air:           E sì me l'hai già detto che dico troppo "ha senso"?
            }                                                    
        {charTag(FirstCharacter, "sad")}:                       Secondo te una relazione ci cambia? O ci mostra chi siamo davvero?
        
        + \ {charTag(PG, "neutral")}:                           Ma cosa rendeva Ennio noioso?
                -> glyph_choice_manager(false, airC)->
            {charTag(FirstCharacter, "neutral")}:               È una persona con una routine molto rigida.
                                                                E degli interessi che mi sembravano difficili da condividere.
            {charTag(FirstCharacter, "affectionate")}:          Però col tempo ho iniziato a vedere la passione che mette nelle cose che ama, e mi sono resa conto di quanto cuore ci sia dietro quella testolina.
            {charTag(FirstCharacter, "annoyed")}:               La me di qualche anno fa avrebbe vomitato all'idea di sentire due ore di analisi delle ramificazioni della storia di Baldur's Gate III.
            {charTag(FirstCharacter, "affectionate")}:          Ora gli mando i meme idioti su Karlach.
            {charTag(FirstCharacter, "neutral")}:               E forse è questa la risposta.
                                                                Una relazione ci mostra parti sconosciute di noi.
        
        + \ {charTag(PG, "neutral")}:                           Ho l'impressione che ti manchi svolazzare.
                -> glyph_choice_manager(false, waterC)->
            {charTag(FirstCharacter, "neutral")}:               Ehm.
            {charTag(FirstCharacter, "sad")}:                   Sì ama.
                                                                Mi sa di sì.
            {charTag(FirstCharacter, "affectionate")}:          Lo amo, tanto Ennio, tanto tanto.
                                                                Ma mi manca svolazzare.
            {charTag(FirstCharacter, "sad")}:                   Tantissimo.

 
        + \ {charTag(PG, "neutral")}:                           Non esiste un "chi siamo davvero", siamo noi e basta.
                -> glyph_choice_manager(false, earthC)->
            {charTag(FirstCharacter, "neutral")}:               Beh: sono abbastanza sicura che tu sia davvero pragmatic{player_pronoun has him:o|{player_pronoun has her:a|ə}}.
                                                                Con o senza relazioni.
                                                                Non deve essere male tutta questa sicurezza.
            {charTag(FirstCharacter, "annoyed")}:               Credo.
            
        + \ {charTag(PG, "neutral")}:                           È buona solo se ci smuove, se ci evita di ristagnare.
                -> glyph_choice_manager(false, fireC)->
            {charTag(FirstCharacter, "neutral")}:               Su quello credo che la relazione abbia poco potere.
                                                                Sono uscita con tipi de coccio, e non c'era modo di farli smuovere, qualsiasi cosa facessi.
                                                                E ci sono state volte in cui ero io quella non pronta a fare qualcosa di diverso.
            {charTag(FirstCharacter, "annoyed")}:               Non è sempre colpa della relazione, no?
                
        + \ {charTag(PG, "neutral")}:                           La relazione è un albero con le radici in due terreni.
                -> glyph_choice_manager(false, aetherC)->
            {charTag(FirstCharacter, "curious")}:               Quindi intendi tipo una cosa terza?
                                                                Che nasce dall'incontro tra le due persone?
            {charTag(FirstCharacter, "affectionate")}:          Mi piace l'idea dell'albero.
            {charTag(FirstCharacter, "curious")}:               Alla fine diciamo di curare le relazioni, no?
                                                                Coltivarle.
            {charTag(FirstCharacter, "affectionate")}:          Mi suona molto.
        - 
        
        {charTag(FirstCharacter, "neutral")}:                   Una settimana fa mi ha chiesto di andare a convivere.
                                                                Ho risposto subito di sì, presa dalla botta dell'entusiasmo.
        {charTag(FirstCharacter, "sad")}:                       Ma non so se è davvero quello che voglio.
        {
        - are_two_entities_together(ThirdCharacter, PG):
        {
        - thirdChar_firstCharRage == true or grimoire_thirdChar has grimFirstThirdChar:
        {charTag(ThirdCharacter, "bored")}:                     Sei brava a giudicarmi mi sembra.
                                                                Per poi trattare di merda il tuo moroso.
                                                                
        - else:
        {charTag(ThirdCharacter, "angry")}:                     Eccone un'altra che non sa quello che vuole.
        {charTag(ThirdCharacter, "melanchonic")}:               E un altro poveraccio che la pagherà per questo.                                   
        }
        }          
        {
            - are_two_entities_together(SecondCharacter, PG):
                {charTag(SecondCharacter, "energy")}:           Io lo so cosa vuoi.
                {charTag(SecondCharacter, "emotional")}:        Caramelle.
                {charTag(FirstCharacter, "annoyed")}:           Ti ho già detto che non ne ho, piccoletto.
                {charTag(SecondCharacter, "energy")}:           Ma magari non hai mica controllato bene bene nelle tasche!
                        
        }
              
                -> first_char_closing_storylet ->
                -> options_first_character
        
    = six
        //Riferimenti per la riscrittura: scopo più grande
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour= translator(fourthChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)

         //Aggiungiamo a lista list_currentActors
        ~ list_currentActors += FirstCharacter
        

        
        {charTag(FirstCharacter, "curious")}:                   Ma poi forse non sto già vivendo con la mia famiglia?
        {charTag(FirstCharacter, "neutral")}:                   Ah, sì, scusa, sto tornando sul pippone delle case di prima.
        {charTag(FirstCharacter, "sad")}:                       Però continuo a pensarci, anche perché ho paura che pensi che sono fredda quando parlo di Ennio.
        {charTag(FirstCharacter, "affectionate")}:              È che vivere con le ragazze mi fa strafelice.
                                                                Il mese scorso abbiamo fatto un piccolo concerto per raccogliere fondi per una associazione, "La Rifugia".
        {charTag(FirstCharacter, "neutral")}:                   È questa specie di antiAirbnb che mette in contatto persone per offrire un letto o un divano di supporto.
        {charTag(FirstCharacter, "annoyed")}:                   Cosa sempre più utile con questi affitti assurdi e le case che non ci sono.
        {charTag(FirstCharacter, "affectionate")}:              Le persone che la gestiscono sono fuori di testa in modo bello.
        {charTag(FirstCharacter, "affectionate")}:              L'idea di suonare per raccogliere fondi è stata di Valeria, la mia bestie in casa, nonché la nostra cantante.
        {charTag(FirstCharacter, "neutral")}:                   Ora vorrebbe fare un album cantando le storie di chi ha bisogno della Rifugia, perché spesso sono persone migranti.
                                                                E sono io quella che scrive le canzoni, per lo più.
        {charTag(FirstCharacter, "sad")}:                       Ed è una cosa strana scrivere robe politiche, perché diventa difficile mantenere la poesia.
                                                                Abbiamo mille modi di parlare d'amore, ma i problemi reali sembrano sempre troppo freddi.
                                                                Troppe parole complesse, da spiegare.
        {charTag(FirstCharacter, "annoyed")}:                   Dice tanto del nostro mondo, non credi?
        {charTag(FirstCharacter, "affectionate")}:              Eppure sono convinta che l'arte possa fare tanto per cambiare le cose.
                                                                Perché i fatti sono freddi, e l'arte può renderli pieni di calore.
        {charTag(FirstCharacter, "annoyed")}:                   Puoi tipo raccontare tutti i femminicidi del mondo e un uomo smonterà ogni dato e movente.
        {charTag(FirstCharacter, "affectionate")}:              Oppure scrivere <i>Un violador en tu camino</i> e riempire una piazza di forza e rabbia.
        {charTag(FirstCharacter, "sad")}:                       Ma io non credo proprio di saper scrivere canzoni così.                                                        
        {charTag(FirstCharacter, "neutral")}:                   Anche se poi sogno arrogantemente di creare qualcosa di così forte da spazzare tutta questa merda.
                                                                Qualcosa che salvi il mondo.
        {
            - are_two_entities_together(Mentor, PG):
            {charTag(FifthCharacter, "sad")}:                   Oh ragazza mia.
                                                                Che vita difficile vuoi sceglierti!             
        }
        
        + \ {charTag(PG, "neutral")}:                           Non è arrogante: è nostro dovere cambiare quello che non va!
                -> glyph_choice_manager(false, fireC)-> 
            {charTag(FirstCharacter, "neutral")}:               Ehm, uh.
                                                                Ok.
                                                                Credo abbia senso.
            {charTag(FirstCharacter, "annoyed")}:               Ma sei davvero intens{player_pronoun has him:o|{player_pronoun has her:a|ə}} {player_name}.
            {charTag(FirstCharacter, "sad")}:                   Intens{player_pronoun has him:o|{player_pronoun has her:a|ə}} per me intendo.
                
        + \ {charTag(PG, "neutral")}:                           <i>Resto in meditativo silenzio.</i>
                -> glyph_choice_manager(false, aetherC)->
            {charTag(FirstCharacter, "affectionate")}:          È la seconda volta che torno su questo discorso del salvare il mondo.    
            {charTag(FirstCharacter, "neutral")}:               Forse perché è importante.
                                                                Importante per me?
                                                                Ha senso, vero?

        + \ {charTag(PG, "neutral")}:                           Cosa significa per te "salvare il mondo"?
                -> glyph_choice_manager(false, airC)->
            {charTag(FirstCharacter, "neutral")}:               Aiuto.
                                                                Fermare le cose che non vanno.
                                                                Permettere a tutte le persone di avere una vita dignitosa.
                                                                Tipo cancellando i ricchi.
                                                                Prendendoci cura dell'ambiente.
            {charTag(FirstCharacter, "sad")}:                   Ha senso?
        
        + \ {charTag(PG, "neutral")}:                           Credo che siamo pienə di emozioni, non di fatti.
                -> glyph_choice_manager(false, waterC)->
            {charTag(FirstCharacter, "affectionate")}:          Esatto ama, esatto.
            {charTag(FirstCharacter, "neutral")}:               Cioè: bellini i fatti, davvero.
                                                                Graziosi.
            {charTag(FirstCharacter, "curious")}:               Ma durante il giorno ascolto quello provo, non quello che <b>è</b>.
            {charTag(FirstCharacter, "neutral")}:               Ha senso?


        + \ {charTag(PG, "neutral")}:                           Non giudicarti: serve un po' di arroganza per costruire qualcosa di nuovo.
                -> glyph_choice_manager(false, earthC)->
            {charTag(FirstCharacter, "neutral")}:               Ci sono cose che sono difficili da digerire, {player_name}.
                                                                Cose che sono sempre raccontate come negative.
            {charTag(FirstCharacter, "affectionate")}:          Ma capisco cosa intendi, grazie.
            {charTag(FirstCharacter, "curious")}:               E non dirmi troppo spesso che posso essere un po' arrogante, o divento incagabile.

            {
            - are_two_entities_together(ThirdCharacter, PG) && grimoire_firstChar has grimFirstThirdChar or thirdChar_firstCharRage == true:
            {charTag(ThirdCharacter, "neutral")}:               Non mi dire.
            }
            
            {
            - are_two_entities_together(SecondCharacter, PG):
            {charTag(SecondCharacter, "energy")}:               Mi piace incagabile!
                                                                In-ca-ga-bi-le!
                                                                In-ca-ga-bi-leeeeeeeee!
            {
                - are_two_entities_together(Mentor, PG):
                {charTag(FifthCharacter, "bored")}:             {charNameTwo}!
                {charTag(FifthCharacter, "sorry")}:             Anzi, non è colpa tua.
                {charTag(FifthCharacter, "bored")}:             {charNameOne}, le parolacce!
                {charTag(FifthCharacter, "neutral")}:           Oh povera me, povera me!
                {charTag(SecondCharacter, "emotional")}:        Si può dire inpisciabile?!?
                {charTag(FirstCharacter, "annoyed")}:           Me la sono cercata.
            }
            }
            
        -
        {charTag(FirstCharacter, "sad")}:                       Tra qualche mese Valeria si laureerà e tornerà dai suoi, e a quel punto non so cosa resterà della band.      
        {charTag(FirstCharacter, "neutral")}:                   A volte mi chiedo se non abbia senso lasciare il lavoro e dedicarmi solo alla musica.
                                                                Per evitare che la band muoia.
                                                                Per avere tempo e testa per creare buona musica.
        {charTag(FirstCharacter, "sad")}:                       Per fare concerti che salvino almeno una persona.
        {
            - are_two_entities_together(Franco, PG):
                {charTag(Franco, "question")}:                  Ma se i concerti si ascoltano in compagnia, allora da solə sono i solcerti?
                                                                Soncerti?
                                                                Sorcerti?
                {charTag(Franco, "neutral")}:                   Che cosa strana la lingua.
                {charTag(Franco, "party")}:                     Ma anche le dita sono strane.
        }

                -> first_char_closing_storylet ->
                -> options_first_character
        
    = seven
        //Riferimenti per la riscrittura: affetti
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour= translator(fourthChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)

         //Aggiungiamo a lista list_currentActors
        ~ list_currentActors += FirstCharacter
        

        
        {charTag(FirstCharacter, "annoyed")}:                   Ci sto girando attorno da un bel po' ormai.
        {charTag(FirstCharacter, "neutral")}:                   Continuo a parlare al passato di Talco, l'avrai notato.
        {charTag(FirstCharacter, "sad")}:                       Ed è perché non ci sentiamo da mesi.
                                                                E ora ti racconterò il perché e tu mi giudicherai una stronza epocale, e me lo merito.
        {charTag(FirstCharacter, "affectionate")}:              Un anno fa Talco mi scrive per fare un aperitivo solo tra noi, "come ai vecchi tempi".
        {charTag(FirstCharacter, "annoyed")}:                   Tra lavori e fidanzati e il resto non ci vedevamo da settimane.
        {charTag(FirstCharacter, "affectionate")}:              Abbiamo trovato un incrocio sui calendari, e la sera che l'ho rivistə mi si è spalancato il cuore.
        {charTag(FirstCharacter, "affectionate")}:              E tra una battuta e un lamento sul lavoro continuavo a pensare: e se riprendessimo in mano il vecchio progetto?
                                                                E se andassimo a vivere tuttə assieme in campagna?
                                                                Talco, io, le ragazze della band?
        {charTag(FirstCharacter, "neutral")}:                   Sicuro Ennio non apprezzerebbe molto, ma alla peggio potrebbe venire a trovarci nel fine settimana, no?
                                                                Quando Talco mi ha detto "devo dirti qualcosa di importante", ero già nel pieno del mio film.
        {charTag(FirstCharacter, "neutral")}:                   Mi ha preso la mano, tesə a bestia come non l'avevo mai vistə.
                                                                "Aspetto un bambino".
        {
        - are_two_entities_together(Mentor, PG):
            {charTag(FifthCharacter, "hurry")}:                 Ma che cosa adorabile!   
        }
        {charTag(FirstCharacter, "sad")}:                       E {player_name}, tutto è diventato grigio.
        {charTag(FirstCharacter, "neutral")}:                   Zero, il vuoto nella testa.
                                                                Ci eravamo ripromessə mille volte che non sarebbe successo.
        {charTag(FirstCharacter, "annoyed")}:                   Niente figli.
        {
            - are_two_entities_together(SecondCharacter, PG):
            {charTag(SecondCharacter, "melanchonic")}:          Perché?
            {charTag(FirstCharacter, "neutral")}:               Perché.
            {charTag(FirstCharacter, "affectionate")}:          Perché non sono tutti carini come te.
            {charTag(SecondCharacter, "angry")}:                Io non sono "carino".
            {charTag(FirstCharacter, "affectionate")}:          Ma hai le guanciottine adorabili!
                                                                Vieni qui, fattele strizzare.
            {charTag(SecondCharacter, "neutral")}:              No, no, no!
                ~ change_entity_place(SecondCharacter)
            {charTag(FirstCharacter, "sad")}:                   Povero piccoletto.    
            {charTag(FirstCharacter, "neutral")}:               Dov'ero?
            {charTag(FirstCharacter, "annoyed")}:               Ah sì: niente figli.              
        }
                                                                Niente partner gelosi.
        {charTag(FirstCharacter, "neutral")}:                   Niente a frapporsi tra noi.
        {charTag(FirstCharacter, "annoyed")}:                   E stava già succedendo comunque col lavoro e con Ennio e il suo Thomas ma cazzo, questa roba!
                                                                Non abbiamo manco trent'anni!
        {charTag(FirstCharacter, "sad")}:                       Talco ha capito subito cosa stavo pensando.
        {charTag(FirstCharacter, "neutral")}:                   E non si è manco arrabbiatə.
                                                                Mi ha solo detto che era un passo importante per ləi.
                                                                Perché anche se è una cosa inaspettata, ama Thomas, e sa che è l'uomo giusto.
                                                                E poi il colpo finale.
                                                                "Mi trasferisco da lui a Reykjavík. Qui non mi rimane nulla, nulla a parte te."
                                                                "E per questo, voglio che ti trasferisci con noi."
                                                                "Voglio crescerla con te, questa creaturina. Con le persone che amo. Con te e Thomas."
                                                                E…
        {charTag(FirstCharacter, "annoyed")}:                   Madonna, quanto vorrei del vino ora.
        {charTag(FirstCharacter, "neutral")}:                   Tu come ti saresti {player_pronoun has him:sentito|{player_pronoun has her:sentita|sentitə}} al mio posto?
       
        + \ {charTag(PG, "neutral")}:                           Tradit{player_pronoun has him:o|{player_pronoun has her:a|ə}}. E arrabbiat{player_pronoun has him:o|{player_pronoun has her:a|ə}}.
                -> glyph_choice_manager(false, fireC)->
            {charTag(FirstCharacter, "neutral")}:               Uh.
                                                                Scusa per il sospirone.
                                                                Ma credo sia stata la prima emozione che mi ha colta.
            {charTag(FirstCharacter, "sad")}:                   E mi ha fatto un male boia, {player_name}.
                                                                Un male boia.
            
        + \ {charTag(PG, "neutral")}:                           Incuriosit{player_pronoun has him:o|{player_pronoun has her:a|ə}} dall'idea di qualcosa di nuovo.
                -> glyph_choice_manager(false, airC)->
            {charTag(FirstCharacter, "annoyed")}:               Qualcosa di nuovo con un tizio che ho visto tre volte.
                                                                In una città diversa in un altro continente.
                                                                Eppure.
            {charTag(FirstCharacter, "sad")}:                   Eppure anche qualcosa di diverso da tutto quello che avevo.
                                                                Dalla stasi della mia vita.
            
        + \ {charTag(PG, "neutral")}:                           Forse spaventat{player_pronoun has him:o|{player_pronoun has her:a|ə}}, ma anche felice di questa nuova famiglia con Talco.
                -> glyph_choice_manager(false, waterC)->
            {charTag(FirstCharacter, "sad")}:                   Sei una persona migliore di me allora, {player_name}.
                                                                Perché le emozioni che ho provato erano davvero tante, ma non felicità.
            {charTag(FirstCharacter, "neutral")}:               Per nessuna delle persone coinvolte.
            {charTag(FirstCharacter, "annoyed")}:               E per questo mi sento una stronza.
            {charTag(FirstCharacter, "neutral")}:               Talco era felice di questa novità.
            {charTag(FirstCharacter, "sad")}:                   Io non son stata capace di essere felice per ləi.
            
        + \ {charTag(PG, "neutral")}:                           Una situazione assurda può farmi conoscere cose assurde di me.
                -> glyph_choice_manager(false, aetherC)->
            {charTag(FirstCharacter, "neutral")}:               Possibile.
            {charTag(FirstCharacter, "annoyed")}:               E la cosa più assurda sarebbe scoprire che è vero che non mi piacciono i bambini.
                                                                A migliaia di chilometri da tutto quello che conosco.
                                                                Col mio inglese terribile.
                                                                Dipendendo totalmente da una persona che deve prendersi cura di un infante.
        
        + \ {charTag(PG, "neutral")}:                           Senza la terra sotto ai miei piedi.
                -> glyph_choice_manager(false, earthC)->
            {charTag(FirstCharacter, "neutral")}:               Già.
                                                                Che, per carità, è una cosa normale con Talco.
                                                                Con ləi tutto è imprevedibile e irrazionale.
                                                                O razionale secondo gli standard di Talco.
            {charTag(FirstCharacter, "affectionate")}:          Ed è una cosa che adoro.
            {charTag(FirstCharacter, "sad")}:                   Ma è difficile da gestire quando vuole sconvolgerti tutta la tua vita.
        
        -

        {charTag(FirstCharacter, "sad")}:                       Quella sera ho scoperto che la persona in me che sa fare cose, le sa fare solo se sa che Talco è dalla sua parte.
        {charTag(FirstCharacter, "neutral")}:                   Un intero film mi è partito in testa. 
        {charTag(FirstCharacter, "sad")}:                       Una roba piena di solitudine abbandono e perdita.
        {charTag(FirstCharacter, "neutral")}:                   Ho lasciato il tavolo in silenzio, ho chiamato Ennio e l'ho raggiunto a casa sua.
                                                                Abbiamo scopato senza preservativo, ma poi l'ho cacciato fuori di forza quando stava per venire.
        {charTag(FirstCharacter, "sad")}:                       Ho pianto tutta la notte.
        {
        - are_two_entities_together(ThirdCharacter, PG):
        {charTag(ThirdCharacter, "bored")}:                     Se questa non è manipolazione bella e buona.
                                                                Ma no, voi donne siete sempre pure e innocenti.
                                                                                             
        }         
        {charTag(FirstCharacter, "neutral")}:                   Un mese dopo Talco è partitə, e non ci siamo più sentite fino a qualche settimana fa, quando mi ha mandato una cartolina.
                                                                Una foto dellə bimbə.
                                                                "Ora siamo in due ad aspettare un tuo abbraccio."

            -> first_char_closing_storylet ->
            -> options_first_character          
    
    = eight
        //Riferimenti per la riscrittura: mediocrità e fallimento, un poco "affetti"
        //Brano: Back in Town, Florence + The Machine.
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour= translator(fourthChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)

         //Aggiungiamo a lista list_currentActors
        ~ list_currentActors += FirstCharacter
        

        {charTag(FirstCharacter, "neutral")}:                   Tornare dai miei è come un viaggio nel tempo.
        {charTag(FirstCharacter, "affectionate")}:              Scendo, e mi sembra che tutto sia fermo, e questa cosa è rassicurante.
        {charTag(FirstCharacter, "annoyed")}:                   Ma passano i giorni e mi rendo conto della bugia.
        {charTag(FirstCharacter, "neutral")}:                   Chi sta via pensa sempre che il posto che lascia sia immutabile, che non cambino mai le persone che restano.
                                                                Ma quei cambiamenti arrivano spesso tra le righe.
                                                                Come quando scopri che un amico di famiglia non c'è più.
        {charTag(FirstCharacter, "annoyed")}:                   O che c'è una lite tra i fratelli di tuo padre che va avanti da due anni e non ne sapevi niente.
        {charTag(FirstCharacter, "neutral")}:                   Alcune delle amiche che sono tornate a vivere giù hanno trovato un altro modo di far parte di quel cambiamento.
        {charTag(FirstCharacter, "affectionate")}:              Anna, che studiava jazz, ha tirato su assieme ad altre persone un festival locale che sta iniziando a ingranare.
                                                                E Luigia, una ex di Valeria, ora si occupa di recupero e, come dice lei, "riterronizzazione" della storia del suo paesino sul Coghinas.
        {charTag(FirstCharacter, "annoyed")}:                   Altre, che qui facevano occupazioni e proteste e litigavano con la polizia ora sono sposate e raccontano vite che.
        {
        - are_two_entities_together(ThirdCharacter, PG):
        {
        - thirdChar_firstCharRage == true or grimoire_thirdChar has grimFirstThirdChar:
        {charTag(ThirdCharacter, "bored")}:                     Magari a te ti stupisce, ma c'è chi è felice dell'idea di sposarsi.
                                                                Per fortuna, che se sono tutte come te siamo estinti.
                                                                
        - else:
        {charTag(ThirdCharacter, "neutral")}:                   Lo dici come se fosse un crimine.                                 
        }
        }   
        {charTag(FirstCharacter, "neutral")}:                   Io.
                                                                Io.
                                                                Merda.
        {charTag(FirstCharacter, "sad")}:                       Non è che è per questo che mi chiamo {charNameOne}?                                                        
                                                                Tornare giù è un'opzione.
        {charTag(FirstCharacter, "affectionate")}:              Voglio molto bene ai miei.
                                                                Conosco poche persone che possono dire "Scendo a casa e sono felice di suonare e ubriacarmi con mio padre".
        {
            - are_two_entities_together(SecondCharacter, PG):
                ~change_entity_place(SecondCharacter)
                {charTag(FirstCharacter, "sad")}:               Perché il bimbetto se ne è andato?
                {
                    - are_two_entities_together(Mentor, PG):
                        {charTag(FifthCharacter, "sad")}:       Forse perché non è felice con suo padre?        
                }         
        }
        {charTag(FirstCharacter, "neutral")}:                   Farmi salire e studiare è stato uno sforzo enorme per loro.
                                                                E ora che sono sempre più vecchi, tornare potrebbe significare restituire il favore.
                                                                Prendermi cura di loro.
        {charTag(FirstCharacter, "sad")}:                       Ma una parte di me ha paura che tornare voglia dire "Ok, ho sbagliato tutto".
        {charTag(FirstCharacter, "neutral")}:                   E ho paura di finire in un certo tipo di gruppo.
        {charTag(FirstCharacter, "annoyed")}:                   Quello delle amiche sposate.
        {charTag(FirstCharacter, "neutral")}:                   Non è un crimine contro l'umanità, lo so.
                                                                Ma so anche che a volte sono la persona che il contesto mi permette di essere.
        {charTag(FirstCharacter, "affectionate")}:              E mi piace la persona che sono ora.
        {charTag(FirstCharacter, "annoyed")}:                   Ma non so se mi piacerebbe la persona che sarei tornando dai miei, tornando al paesino.
        {charTag(FirstCharacter, "sad")}:                       Credi abbia senso?
            
        + \ {charTag(PG, "neutral")}:                           Com'è cambiato il tuo paese?
                -> glyph_choice_manager(false, airC)->
            {charTag(FirstCharacter, "neutral")}:               In modo strano.
                                                                Tieni conto che è piena campagna, e che non spesso passavamo il tempo a giocare per i campi.
            {charTag(FirstCharacter, "sad")}:                   Ma ora è tutto recintato.
                                                                Ci sono divieti ovunque.
            {charTag(FirstCharacter, "annoyed")}:               E telecamere.
            {charTag(FirstCharacter, "neutral")}:               La piazza, gli spazi centrali sono più ordinati e curati.
                                                                Ma a quale prezzo?                                                    
        
        + \ {charTag(PG, "neutral")}:                           Trova il tuo obiettivo e buttati, così sai come non perderti!
                -> glyph_choice_manager(false, fireC)->
            {charTag(FirstCharacter, "neutral")}:               Un po' come Luigia e Anna, immagino.
                                                                Si può fare.
            {charTag(FirstCharacter, "annoyed")}:               Ma sono una che si perde spesso per strada, ama.
        
    
        + (air)\ {charTag(PG, "neutral")}:                      Ad essere praticə, sì: siamo bestie sociali, le persone ci influenzano.
                -> glyph_choice_manager(false, earthC)->
            {charTag(FirstCharacter, "neutral")}:               Sei una brava persona, non mi fraintendere.
            {charTag(FirstCharacter, "annoyed")}:               Ma riesci a rendere fredda anche una cosa bella come la socialità, {player_name}.
            {charTag(FirstCharacter, "sad")}:                   E sei riuscit{player_pronoun has him:o|{player_pronoun has her:a|ə}} pure a farmi preoccupare ancora di più.
        
        + \ {charTag(PG, "neutral")}:                           Forse condividere coi tuoi genitori queste preoccupazioni potrebbe fare bene a te e a loro.
                -> glyph_choice_manager(false, waterC)->
            {charTag(FirstCharacter, "neutral")}:               Non ci avevo pensato.
                                                                Non so se capirebbero.
            {charTag(FirstCharacter, "sad")}:                   Forse direbbero che non devo scendere, che ce la fanno da soli.
                                                                Non so.
            {charTag(FirstCharacter, "neutral")}:               Potrei provarci.
                
        + \ {charTag(PG, "neutral")}:                           Luigia e Anna trovando le loro radici sono sbocciate.
                -> glyph_choice_manager(false, aetherC)->
            {charTag(FirstCharacter, "neutral")}:               Questa è una cosa a cui penso spesso.
                                                                Al nord sto bene, ma.
            {charTag(FirstCharacter, "sad")}:                   Ma non mi sento mai davvero <b>a casa</b>.
            {charTag(FirstCharacter, "neutral")}:               E anche se sono una bestiola ansiosa e guardo sempre al peggio, il dubbio mi viene spesso.
                                                                E se anche io come loro potessi in realtà fiorire, scendendo?
        -
            -> first_char_closing_storylet ->
            -> options_first_character
    
    = nine
        //Riferimenti per la riscrittura: forse il "fare qualcosa di buono", ma ha a che fare molto con la creatività.
        //Brano: Third Eye, Florence + The Machine.
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour= translator(fourthChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)

         //Aggiungiamo a lista list_currentActors
        ~ list_currentActors += FirstCharacter
        
        
        {charTag(FirstCharacter, "curious")}:               Ciao {player_name}, e benvenut{player_pronoun has him:o|{player_pronoun has her:a|ə}} in un nuovo flusso di coscienza di {charNameOne} che non si chiama {charNameOne} e che prima o poi troverà il suo vero nome.
        {charTag(FirstCharacter, "neutral")}:               Stavo pensando a quando mi viene l'insonnia.
        {charTag(FirstCharacter, "neutral")}:               A volte si traduce in un rigirarsi nel letto guardando il cellulare, scorrendo video e articoli che ti dicono che il mondo è fottuto.
        {charTag(FirstCharacter, "annoyed")}:               E può essere stupido addormentarsi con queste cose, ma boh.
        {charTag(FirstCharacter, "sad")}:                   Forse sapere che non puoi fare nulla è più rassicurante che sapere che puoi fare qualcosa ma non sai cosa.
        {charTag(FirstCharacter, "neutral")}:               Ma queste conversazioni con te sono più come l'altra cosa che faccio quando mi viene l'insonnia.
                                                            Mi alzo, e vado in cucina.
        {charTag(FirstCharacter, "affectionate")}:          La cucina a casa è sempre piena di vita, abbiamo ospiti praticamente da pranzo a notte fonda.
                                                            Ma averla per me, sapendo che tutto dorme, mi offre una pace piena.
                                                            E i brani migliori li ho scritti in quelle situazioni.
                                                            Caffettino e quaderno, mi piace comporre andando a sentimento prima ancora di mettermi sulla tastiera.
        {charTag(FirstCharacter, "curious")}:               Ci sono momenti in cui qualcosa clicca, e allora so che ho preso una buona idea.
                                                            E non ha a che fare col razionale, no no.
        {charTag(FirstCharacter, "affectionate")}:          Ma è tipo come ritrovarsi i piedi in un'acqua antica.
                                                            Che raccoglie tutte le storie del mondo.
                                                            Per un attimo rinuncio a me, e allora trovo il tutto.
                                                            E allora sento che anche se uso parole di oggi e suoni di oggi sto parlando del <i>sempre</i>.
        {charTag(FirstCharacter, "neutral")}:               Di un certo tipo di sempre.
        {charTag(FirstCharacter, "affectionate")}:          E allora quella roba può far qualcosa di buono, di davvero buono.
        {charTag(FirstCharacter, "annoyed")}:               Però ora ci arrivo di rado in quell'acqua.
                                                            L'insonnia ha più a che fare ora con la caga di perdere il lavoro e altre para.
        {charTag(FirstCharacter, "sad")}:                   Mi fa sentire minacciata.
        {charTag(FirstCharacter, "neutral")}:               Però a volte torno a immergermi, e a quel punto non ho paura.
                                                            Non perché sono coraggiosa o che di punto in bianco, figurati.
                                                            Ma perché ho la sensazione che anche questi problemi, tutti i problemi, siano parte di quell'enorme storia.
                                                            E sono cose che noi persone abbiamo già affrontato miliardi di volte.
                                                            Eppure siamo ancora qui.
        {charTag(FirstCharacter, "affectionate")}:          E c'è ancora speranza.
        {
            - are_two_entities_together(Mentor, PG):
            {charTag(FifthCharacter, "hurry")}:             Sono parole piene di conforto, {charNameOne}.
                                                            Grazie.       
        }


        + \ {charTag(PG, "neutral")}:                       Hai mai portato qualcun altrə in quell'acqua?
                -> glyph_choice_manager(false, airC)->
            {charTag(FirstCharacter, "neutral")}:           No, è una cosa molto personale.
                                                            Ma è vero anche che ognunə ha la sua pozza, o qualcosa di simile.
            {charTag(FirstCharacter, "affectionate")}:      Quando ne ho parlato ad Ennio, mi ha detto che gli succede qualcosa di simile programmando.
                                                            E gli sembra di sentire sulla tastiera tutte le mani di tutte le persone che hanno costruito qualcosa nel passato.
            {charTag(FirstCharacter, "neutral")}:           Un'immagine che un po' mi spaventa, ma non è molto diversa, no?                                                
        
        + \ {charTag(PG, "neutral")}:                       Fa sentire meno solə, e più parte di una lunga rete di storie.
                -> glyph_choice_manager(false, waterC)->
            {charTag(FirstCharacter, "affectionate")}:      Sì!
                                                            E dà sicurezza, fiducia.
            {charTag(FirstCharacter, "neutral")}:           Non si tratta nemmeno più di fare qualcosa di stravolgente.
                                                            Ma di continuare un percorso che avanza da millenni.
                
        + \ {charTag(PG, "neutral")}:                       C'è molto coraggio nel riconoscersi parte di qualcosa di così grande.
                -> glyph_choice_manager(false, aetherC)->
            {charTag(FirstCharacter, "neutral")}:           Ehm.
                                                            Non so se sia coraggio.
                                                            Forse è più un bisogno, {player_name}.
            {charTag(FirstCharacter, "affectionate")}:      Ma mi piace l'idea di sentirmi coraggiosa per una volta, per cui me la porto a casa.
        
        + \ {charTag(PG, "neutral")}:                       E la speranza genera lotta, azione, cambiamento.
                -> glyph_choice_manager(false, fireC)->
            {charTag(FirstCharacter, "neutral")}:           La speranza è una gran cosa.
            {charTag(FirstCharacter, "sad")}:               Anche se non la conosco molto bene.
            {charTag(FirstCharacter, "neutral")}:           Non so se si era visto, ma tendo a vedere il peggio nelle cose.
            {charTag(FirstCharacter, "sad")}:               Cosa che spesso non mi permette di cambiare nulla.
        
        + \ {charTag(PG, "neutral")}:                       Il doomscrolling è terribile: ti toglie le fondamenta, ti fa sentire incapace di camminare, di fare qualsiasi cosa.
                -> glyph_choice_manager(false, earthC)->
            {charTag(FirstCharacter, "neutral")}:           Già.
                                                            Sai {player_name}?
            {charTag(FirstCharacter, "sad")}:               A volte ho l'impressione che l'unica cosa che ci rende adulti è la perdita dello stupore.
                                                            Tutto è prevedibile.
                                                            E terribile.
                                                            E corri corri guardando solo quello che ti serve sul momento perché l'alternativa è impazzire.
                                                            Ed è una vita così grigia.
                                                            Così triste.
        -
        {charTag(FirstCharacter, "neutral")}:               Visto che sono qui a pensare e basta, potrei mettermi a scrivere qualcosa di nuovo.
        {
            - are_two_entities_together(SecondCharacter, PG):
            {charTag(SecondCharacter, "energy")}:           Scriviamo una storia assieme {charNameOne}?
            {charTag(FirstCharacter, "annoyed")}:           Faccio schifo con le storie.
            {charTag(FirstCharacter, "affectionate")}:      Ma potremmo cantarla!
            {charTag(SecondCharacter, "angry")}:            Sono stonato.
            {charTag(FirstCharacter, "curious")}:           E chi se ne frega?
            {charTag(SecondCharacter, "energy")}:           Allora sìììììììììììì!
                                                            E voglio metterci le parolacce!
            {
            - are_two_entities_together(Mentor, PG):
            {charTag(FifthCharacter, "sad")}:               Cosa ho fatto di male?
            }
        }

            -> first_char_closing_storylet ->
            -> options_first_character 
    
    
    = ten
        //Riferimenti per la riscrittura: affetti e rinunce
        //Reference musicale: And Love/No Choir di Florence the Machine
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour= translator(fourthChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)

         //Aggiungiamo a lista list_currentActors
        ~ list_currentActors += FirstCharacter
        
        
        {charTag(FirstCharacter, "neutral")}:               Sai, {player_name}, l'amore non è come me l'aspettavo.
        {
            - are_two_entities_together(Mentor, PG):
            {charTag(FifthCharacter, "sad")}:               Temo sia sempre vero.    
        }
        {charTag(FirstCharacter, "neutral")}:               Sono una di quelle che dice "Ti amo" dopo due incontri.
        {charTag(FirstCharacter, "annoyed")}:               Lo puoi dire, è cringe.
        {charTag(FirstCharacter, "neutral")}:               Ma quando l'ho detto ad Ennio, è stato diverso dalle altre volte.
                                                            Aveva proprio un altro sapore in bocca, non di entusiasmo ma di qualcosa di dolce.
        {charTag(FirstCharacter, "affectionate")}:          Di promessa.
        {charTag(FirstCharacter, "neutral")}:               E poi la routine ha trasformato col tempo quel sapore.
        {charTag(FirstCharacter, "affectionate")}:          Ora sa di pane caldo, una cosa semplice ma magica.
        {charTag(FirstCharacter, "neutral")}:               C'è più silenzio quando stiamo assieme.
        {charTag(FirstCharacter, "affectionate")}:          Non mi serve riempire gli spazi di cose intelligenti o parlare di robe fighe per paura che lui si annoi.
        {charTag(FirstCharacter, "neutral")}:               A volte lo osservo giocare al PC mentre coccolo i suoi gatti e mi basta.
        {charTag(FirstCharacter, "curious")}:               Gli piace un sacco giocare, perché gli ricorda che se anche sbagli, puoi sempre ricominciare.
        {charTag(FirstCharacter, "neutral")}:               Ci sono sere in cui parlo più col suo coinquilino che non con lui.
        {charTag(FirstCharacter, "affectionate")}:          Ma è lì che mi tiene la mano o ci guarda, e so che mi ama.
        {charTag(FirstCharacter, "neutral")}:               Il sesso adesso è una coperta calda e non più una spiaggia torrida.
        {charTag(FirstCharacter, "affectionate")}:          Qualcosa che rassicura, che fa dormire bene.
        {charTag(FirstCharacter, "neutral")}:               Non so sempre cosa provo davanti a tutto questo.
                                                            Mi sento un po' come quando sei su un treno in stazione, e ne hai un altro fuori dal finestrino.
        {charTag(FirstCharacter, "annoyed")}:               E tu guardi fuori e c'è movimento ma non riesci proprio a capire se stai riprendendo a viaggiare, o se è l'altro treno che si sta spostando.
        {charTag(FirstCharacter, "sad")}:                   Ultimamente Ennio mi sembra insofferente, dice che ha il bisogno di passare più tempo assieme.
        {charTag(FirstCharacter, "neutral")}:               Non mi dice mai "Devi rinunciare a qualcosa per stare con me".
                                                            Ma è lì, negli sbuffi quando gli dico che quel fine settimana faccio doppio turno.
                                                            O che farò tardi perché Valeria è stata di nuovo lasciata e ha bisogno di supporto.
        {charTag(FirstCharacter, "sad")}:                   Sono mesi che non viene manco a vedere un nostro concerto.
        {charTag(FirstCharacter, "annoyed")}:               Per dargli più tempo non posso di certo smollare il lavoro, no?
                                                            E quindi c'è solo una cosa che posso togliere dalla mia vita.
        {charTag(FirstCharacter, "sad")}:                   E a quel punto, ripartirà mai il treno dalla mia stazione?
        {
        - are_two_entities_together(ThirdCharacter, PG):
        {
        - thirdChar_firstCharRage == true or grimoire_thirdChar has grimFirstThirdChar:
        {charTag(ThirdCharacter, "jester")}:                Se questo Ennio è abbastanza furbo, fa partire il treno e ti lascia giù.                              
        }
        }         

        + \ {charTag(PG, "neutral")}:                       Forse il treno è fermo perché Ennio è la tua fermata: sei arrivata a casa.
                -> glyph_choice_manager(false, waterC)->
            {charTag(FirstCharacter, "neutral")}:           Sarebbe una scoperta.
                                                            Una bella scoperta.
            {charTag(FirstCharacter, "sad")}:               Forse non ho mai davvero considerato la possibilità di fermarmi.
            {charTag(FirstCharacter, "neutral")}:           Alla fine ci ho messo tanto anche a capire che ero in viaggio con lui.
            {charTag(FirstCharacter, "affectionate")}:      Innamorata.
        
        + \ {charTag(PG, "neutral")}:                       Allora prendi il controllo del treno con Ennio e andate dove volete!
                -> glyph_choice_manager(false, fireC)->
            {charTag(FirstCharacter, "neutral")}:           Ehm.
                                                            Senza sapere come funziona il treno?
                                                            E con tuttə lə altrə passeggerə che magari devono andare in altri luoghi?
                                                            O non andare via affatto?
            {charTag(FirstCharacter, "annoyed")}:           Non è egoista?
            {charTag(FirstCharacter, "affectionate")}:      Però sarebbe divertente.
                
        + \ {charTag(PG, "neutral")}:                       Cosa vuoi promettergli quando gli dici "ti amo"? E a cosa rinunci?
                -> glyph_choice_manager(false, aetherC)->
            {charTag(FirstCharacter, "neutral")}:           Merda.
                                                            Io.
            {charTag(FirstCharacter, "sad")}:               Io.
            {charTag(FirstCharacter, "affectionate")}:      Credo di volergli promettere presenza.
                                                            Di esserci quando starà male, quando avrà bisogno di me.
            {charTag(FirstCharacter, "neutral")}:           E credo di poter rinunciare a.
            {charTag(FirstCharacter, "annoyed")}:           Al decidere sempre da sola?
            {charTag(FirstCharacter, "neutral")}:           A cosa dovrei rinunciare?
        
        
        + \ {charTag(PG, "neutral")}:                       Hai provato ad affrontare la cosa direttamente con Ennio?
                -> glyph_choice_manager(false, airC)->
            {charTag(FirstCharacter, "neutral")}:           No.
            {charTag(FirstCharacter, "sad")}:               Perché ho paura della risposta.
            {charTag(FirstCharacter, "neutral")}:           Fintanto che rimane una mia paranoia, non sono davvero obbligata ad affrontare la cosa, vero?
            {charTag(FirstCharacter, "annoyed")}:           Dio, quanto sono ipocrita.
        
        + \ {charTag(PG, "neutral")}:                       Non puoi tenere un treno fermo per sempre: alla fine tutto deve crescere, muoversi, cambiare.
                -> glyph_choice_manager(false, earthC)->
            {charTag(FirstCharacter, "annoyed")}:           Non è vero!
            {charTag(FirstCharacter, "neutral")}:           Per una manutenzione.
                                                            Per la pulizia.
                                                            Per scioperare.
            {charTag(FirstCharacter, "annoyed")}:           Per dare fastidio alla logica di {player_name}.    
        -

            -> first_char_closing_storylet ->
            -> options_first_character
    
    = eleven
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour= translator(fourthChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)

         //Aggiungiamo a lista list_currentActors
        ~ list_currentActors += FirstCharacter
        

        {charTag(FirstCharacter, "neutral")}:               C'è questa cosa che mi stupisce sempre.
                                                            Puoi passare anni con una persona, vederla quasi tutti i giorni.
                                                            Studiarci, farci festa, finire nei casini.
        {charTag(FirstCharacter, "sad")}:                   Poi cambierà città e a quel punto vi sentirete di rado o mai.
        {charTag(FirstCharacter, "affectionate")}:          Da una parte è bello quando ci si ritrova, perché ci si sente a casa.
        {charTag(FirstCharacter, "annoyed")}:               Ma poi accade qualcosa di grosso, come un matrimonio, come l'avere figli e non vi capite più.
        {charTag(FirstCharacter, "neutral")}:               Una cosa che non mi aspettavo della vita adulta, è di poter dimenticare le altre persone.
        {charTag(FirstCharacter, "annoyed")}:               Mi fa sentire una merda.
        {charTag(FirstCharacter, "neutral")}:               Ma ti svegli, vai a lavoro, torni, cerchi di tenere in piedi le relazioni che hai qui, di lavarti e dormire, di prenderti cura dei tuoi interessi.
        {charTag(FirstCharacter, "sad")}:                   E ti dici "Cazzo, devo scrivere a Cristina" oppure il calendario ti ricorda che è il compleanno di Stefano.
        {charTag(FirstCharacter, "neutral")}:               E allora magari vi sentite per uno, due giorni ma poi gli audio rimangono lì appesi.
                                                            E un po' ti senti una merda, ti senti in colpa, e alla fine non scrivi fino a quando non riaccade qualcosa che sia una scusa per farlo.
        {charTag(FirstCharacter, "sad")}:                   Molte delle ame che sono tornare giù sono diventate "amiche da ricorrenza".
                                                            E forse c'è questa cosa che mi spaventa, all'idea di scegliere di andare da Talco, o di finire per tornare dai miei.
                                                            Di diventare anche per Valeria e le altre ragazze, per le colleghe, una "amica da ricorrenza".
        {charTag(FirstCharacter, "neutral")}:               Per non parlare di Ennio.
        {charTag(FirstCharacter, "sad")}:                   Credo che mi lascerebbe prima.
        {charTag(FirstCharacter, "neutral")}:               E non è solo questo.
                                                            Vedo le colleghe più grandi, e la difficoltà che hanno a fare nuove amicizie.
                                                            Il senso di mancanza che si sente mentre parlano di persone che non vedono quasi più.
        {charTag(FirstCharacter, "annoyed")}:               Mi sembra che più si è grandi, più si finisce per essere soli.
                                                            E io non voglio stare sola.
        {
        - are_two_entities_together(ThirdCharacter, PG):
        {
        - thirdChar_firstCharRage == true or grimoire_thirdChar has grimFirstThirdChar:
        {charTag(ThirdCharacter, "bored")}:                 C'è anche chi se lo merita.
                                                                
        - else:
        {charTag(ThirdCharacter, "melanchonic")}:           Merda, mi spiace {charNameOne}.                                  
        }
        }                                                         
        {charTag(FirstCharacter, "neutral")}:               Ha senso?
        {
            - are_two_entities_together(Mentor, PG):
                ~ change_entity_place(Mentor)
            {charTag(FirstCharacter, "curious")}:           Com'è che {charNameFive} se ne è andata?    
        }

        + \ {charTag(PG, "neutral")}:                       Sai già cosa non vuoi, quindi sai già anche cosa fare.
                -> glyph_choice_manager(false, fireC)->
            {charTag(FirstCharacter, "annoyed")}:           Ma tu hai sempre questa visione così chiara del mondo?
                                                            Di ciò che sei e fai?
            {charTag(FirstCharacter, "neutral")}:           Perché quasi quasi te la invidio.
            
        + \ {charTag(PG, "neutral")}:                       Talco ti vuole bene anche nella distanza, e nonostante il conflitto: non resterai sola.
                -> glyph_choice_manager(false, waterC)->
            {charTag(FirstCharacter, "neutral")}:           Questo.
                                                            Questo è vero.
                                                            Mi suona molto, seppur a fatica.
            {charTag(FirstCharacter, "sad")}:               Ammetterlo è una cosa grossa.
            {charTag(FirstCharacter, "neutral")}:           Bella.
            {charTag(FirstCharacter, "sad")}:               Ma grossa.    
                
        + \ {charTag(PG, "neutral")}:                       Non riesco a capire se hai paura di restare sola o di sentirti sola.
                -> glyph_choice_manager(false, aetherC)->
            {charTag(FirstCharacter, "neutral")}:           Merda.
            {charTag(FirstCharacter, "annoyed")}:           Ora come ora forse di non sapere stare da sola.
            {charTag(FirstCharacter, "sad")}:               Non so come si faccia, {player_name}.
                                                            La solitudine mi manda nel panico.
            {charTag(FirstCharacter, "neutral")}:           Anche se poi la compagnia a volte è davvero faticosa.
                                                            Dovrei imparare a godermi il tempo con me.


        + \ {charTag(PG, "neutral")}:                       {charNameOne}, tu devi pensare meno e fare più di più.
                -> glyph_choice_manager(false, earthC)-> 
            {charTag(FirstCharacter, "neutral")}:           Guarda {player_name}, sarei strafelice se ci riuscissi.
                                                            Ci ho provato anche con la terapia.
            {charTag(FirstCharacter, "annoyed")}:           Almeno fintanto che la copriva il bonus psicologo.
            {charTag(FirstCharacter, "neutral")}:           Ma non so, non riesco a non farmi i pipponi.
            {charTag(FirstCharacter, "sad")}:               Scusa.
            
        + \ {charTag(PG, "neutral")}:                       Secondo te perché diventare grandi significa diventare soli?
            -> glyph_choice_manager(false, airC)->
            {charTag(FirstCharacter, "neutral")}:           Troppe ore di lavoro.
                                                            E spostamenti per arrivarci.
                                                            Le incombenze pratiche nel tempo libero.
                                                            Il fare quel minimo di attività fisica per non sentirsi un rottame.
                                                            Alla fine hai energie a malapena per alzarti dal divano.
            {charTag(FirstCharacter, "annoyed")}:           O per fare doomscrolling.


            -
        {charTag(FirstCharacter, "neutral")}:               Dopo il nostro primo litigio, Talco mi ha detto che una buona relazione è una relazione scomoda.
                                                            Che abbiamo delle teste pigre, e che le relazioni sane ci fanno uscire dalla pigrizia.
        {charTag(FirstCharacter, "annoyed")}:               Forse allora il problema della distanza è che può diventare una scusa per abbracciare quella pigrizia.
        {charTag(FirstCharacter, "neutral")}:               Mentre nei rapporti di tutti i giorni questa cosa non la puoi evitare.
                                                            Ha senso?
        {
            - are_two_entities_together(SecondCharacter, PG):
            {charTag(SecondCharacter, "neutral")}:          Te te lo chiedi tante volte {charNameOne}.
            {charTag(FirstCharacter, "neutral")}:           Cosa?
            {charTag(SecondCharacter, "neutral")}:          "Ha senso?"
                                                            Lo chiedi sempre.
            {charTag(FirstCharacter, "annoyed")}:           Lo so piccoletto. Ti dà fastidio?
            {charTag(SecondCharacter, "neutral")}:          Mmm.
                                                            No.
            {charTag(SecondCharacter, "melanchonic")}:      Ma mi dispiace per te.
            {charTag(FirstCharacter, "sad")}:               Anche a me.      
        }

            -> first_char_closing_storylet ->
            -> options_first_character
            
    = twelve
        //Riferimenti per la riscrittura: sentirsi mediocre
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour= translator(fourthChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)

         //Aggiungiamo a lista list_currentActors
        ~ list_currentActors += FirstCharacter
        
        
        {charTag(FirstCharacter, "neutral")}:               Sai perché litigo tantissimo con mamma?
        {charTag(FirstCharacter, "annoyed")}:               È perché dice che non so mai accontentarmi.
                                                            Detto da quella che mi ha spedito in quell'inferno di ipercompetitività che il Conservatorio.
                                                            Per fortuna l'ho scagata e non ho fatto classica o a quest'ora starei avvelenando gente per un assolo alla Carnegie.
        {charTag(FirstCharacter, "annoyed")}:               Ma la cosa che mi ferisce è che dice che sono pretenziosa, quando invece quello che continuo a pensare è di non essere abbastanza.
                                                            Di non essere all'altezza.
        {charTag(FirstCharacter, "sad")}:                   Se c'è un'ultima cosa da ammettere con te, qualcosa che magari ci fa capire come uscire da qui, è questa: la persona che sono non è all'altezza delle mie aspettative.
        {charTag(FirstCharacter, "neutral")}:               Prendi le relazioni: non sono stata capace di tenermi vicina la persona a cui voglio più bene.
                                                            E non so godermi la solidità che mi regala Ennio.
                                                            Ma la cosa peggiore è tutta la roba che dico quando parlo di salvare il mondo e delle canzoni che scrivo.
                                                            Perché sai qual è il sentimento che provo più spesso?
        {charTag(FirstCharacter, "annoyed")}:               Invidia.
        {charTag(FirstCharacter, "neutral")}:               Quando scrollo sui social e vedo vecchie compagne del Conservatorio avere successo, mi rode il culo.
        {charTag(FirstCharacter, "sad")}:                   Quando le vedo a fare viaggi fighi con tizi fighi e senza la paura di perdere la casa, senza dover fare lavori di merda, muoio dentro.
        {charTag(FirstCharacter, "neutral")}:               Dio, darei tutto a volte per la loro vita.
                                                            E so che non è vero, non è vero fino in fondo.
                                                            So che in un certo senso quella roba è parte di un problema più grande.
        {charTag(FirstCharacter, "annoyed")}:               Lo so, ma non lo "capisco" davvero.
        {charTag(FirstCharacter, "sad")}:                   Non lo sento fino in fondo.
                                                            Vorrei solo essere loro.
                                                            Per un po' almeno.
        {charTag(FirstCharacter, "affectionate")}:          Provare un po' di pace, di sicurezza economica.
                                                            Forse anche di riconoscimento sociale.
        {
        - are_two_entities_together(ThirdCharacter, PG):
        {
        - thirdChar_firstCharRage == true or grimoire_thirdChar has grimFirstThirdChar:
        {charTag(ThirdCharacter, "bored")}:                 Se la dico io una cosa del genere mi sei subito al collo.
                                                                
        - else:
        {charTag(ThirdCharacter, "neutral")}:               Stessa merda {charNameOne}.
                                                            Stessa merda.                                   
        }
        }                                                        
        {charTag(FirstCharacter, "annoyed")}:               Sono una merda, {player_name}, vero?
        {
            - are_two_entities_together(SecondCharacter, PG):
            {charTag(SecondCharacter, "energy")}:           La cacca fa cose suuuuperutili!
                                                            Le cose crescono grazie alla cacca.
                                                            E la cacca degli uccelli fa fare tanti soldi.
                                                            E.
            {charTag(FirstCharacter, "annoyed")}:           Non ora piccoletto, per favore.
            {charTag(SecondCharacter, "neutral")}:          Uh.
            {charTag(SecondCharacter, "melanchonic")}:      Scusa.
            {charTag(FirstCharacter, "annoyed")}:           Insomma: mi sento una <i>inutile merda</i>.
                                                            Di quelle umane inutili e tossiche e piene di antibiotici e conservanti.
        }                
                                                            Una delusione.
        {
            - are_two_entities_together(Mentor, PG):
            {charTag(FifthCharacter, "neutral")}:           Non essere così severa con te, {charNameOne}.
                                                            Essere adulte significa capire quanto siamo fallibili.
        }
        
        + \ {charTag(PG, "neutral")}:                       Non accontentarsi è fondamentale, o le lotte si spengono.
                -> glyph_choice_manager(false, fireC)->
            {charTag(FirstCharacter, "neutral")}:           Già.
            {charTag(FirstCharacter, "sad")}:               Anche se non sarebbe male riposare ogni tanto, credo.
            {charTag(FirstCharacter, "neutral")}:           No?
            
        + \ {charTag(PG, "neutral")}:                       {charNameOne}, lo sai già che l'erba del vicino è...?
                -> glyph_choice_manager(false, earthC)->
            {charTag(FirstCharacter, "annoyed")}:           Inesistente?
            {charTag(FirstCharacter, "neutral")}:           Perché chi ce l'ha una casa in centro col giardino?
            {charTag(FirstCharacter, "annoyed")}:           E prima che mi rispondi che ho frainteso: no, non ho frainteso.
                                                            E ho bisogno di bere.
    
        + \ {charTag(PG, "neutral")}:                       Se unə non ti conosce, che idea si fa di te sui social?
                -> glyph_choice_manager(false, airC)->
            {charTag(FirstCharacter, "neutral")}:           Di una brontolona.
                                                            No.
                                                            Non è vero.
            {charTag(FirstCharacter, "affectionate")}:      Ci sono le foto dei concertini.
                                                            E le serate con le ame.
                                                            Quelle mentre videogioco con Ennio.
                                                            E le vacanze dai miei.
                                                            E.
            {charTag(FirstCharacter, "sad")}:               Uh.
            {charTag(FirstCharacter, "neutral")}:           Credo di aver capito il punto.        
    
        + \ {charTag(PG, "neutral")}:                       Non colpevolizzarti per ciò che provi, {charNameOne}. Sii gentile con te stessa.
                -> glyph_choice_manager(false, waterC)->
            {charTag(FirstCharacter, "neutral")}:           Io.
            {charTag(FirstCharacter, "sad")}:               Già.
            {charTag(FirstCharacter, "neutral")}:           Potrebbe essere una cosa carina da fare.
                                                            Non darmi della merda ogni volta che non provo quello che vorrei provare.
            {charTag(FirstCharacter, "affectionate")}:      Grazie, {player_name}.
        
        + \ {charTag(PG, "neutral")}:                       Sei responsabile di ciò che fai, non ciò che provi.
                -> glyph_choice_manager(false, aetherC)->
            {charTag(FirstCharacter, "affectionate")}:      Tu e Talco andreste davvero d'accordo.
                                                            Questa è una cosa che mi dice spesso.
            {charTag(FirstCharacter, "neutral")}:           E poi alla fine non faccio mai nulla di crudele o che.
                                                            Al massimo mi intristisco in un angolino e bona.
            {charTag(FirstCharacter, "sad")}:               Credi sia una cosa neutra? Non è da persona cattiva?
        -
            -> first_char_closing_storylet ->
            -> options_first_character