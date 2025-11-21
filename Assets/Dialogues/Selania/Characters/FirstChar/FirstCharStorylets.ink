=== first_char_main_storylets

    = one
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
        ~ firstChar_storyletsForRewritingCount ++
        
        Ehi, ciao!
        Non è che hai visto in giro la versione umana di un pettirosso?
        Una persona rossiccia, morbidosa e che sembra sempre un po’ pissata?
        Si chiama Talco e parla solo di Florence and the Machine.
        Anzi, *parlava* solo di Florence.
        Poi c’è stata quell’altra roba.
        Insomma: l’hai vistə?
        
            //Risposte, di cui una diversa a seconda che abbiamo incontrato o meno Mentore.
            + [Risposta viola.]
                -> color_variation_management(FirstCharacter, purpleC)->
            
            + [Risposta rossa.]
                -> color_variation_management(FirstCharacter, redC)->
    
            + {not welcome} [Risposta blu.]
                -> color_variation_management(FirstCharacter, blueC)->
            
            + {welcome} [Risposta blu.]
                -> color_variation_management(FirstCharacter, blueC)->    
                 
            + [Risposta verde.]
                -> color_variation_management(FirstCharacter, greenC)->

            + [Risposta gialla.]
                -> color_variation_management(FirstCharacter, yellowC)->
            
            -
        
        Merda, Talco sa sempre come tirarmi fuori dai casini!
        E avevo giurato ad Ennio che non sarebbero più successe cose strane.
        Per la cronaca Ennio è diciamo il mio ragazzo, mentre Talco è lə miə amə.
        Ma perché te lo sto dicendo?
        Non è che ho preso dei funghi e manco me ne sono resa conto?
        Come con quel risotto allucinogeno dopo l’esame di composizione.
        Che giornatona assurda quella!
        Ma manco mi sono presentata!
        Mi chiamo {charNameOne}.
            - (firstPresentation)
        
        No no aspetta io sono <b><i>{charNameOne}</b></i>.
        Ehi! Non è mica questo il mio nome!
        <i>{charNameOne}</i>.
        Se lo dico al contrario?
        Arratihc.
        Uh.
        Prova tu.
        Come ti chiami?
        
            + {name_choice} [Mi chiamo {player_name}.]
            + [Il mio nome è...]
                -> name_choice ->
                -> gender ->
            -

        {player_pronouns has her:Anche io uso i pronomi femminili!|Invece io uso i femminili.}
        Anche se continuo a non chiamarmi {charNameOne}.
        Ora: la cosa più sensata è pensare che tutto questo sia un’allucinazione.
        O forse mi sono di nuovo addormentata a lavoro e sto sognando.
        Merda, il capo mi farà il culo.
        Quindi, {player_name}, qual è il messaggio nascosto di questo trip o sogno o quel che è?
        Datti da fare con tutte le tue cose da inconscio, così mi sveglio o ripiglio e vedo di non mandare a puttane il lavoro o relazione.
        O entrambe.
        
            //Risposte, di cui una diversa se ho parlato o meno con Mentore.
            + {not welcome} [Risposta blu.]
                -> color_variation_management(FirstCharacter, blueC)->
            
            + {welcome} [Risposta blu.]
                -> color_variation_management(FirstCharacter, blueC)->
            
            + [Risposta gialla.]
                -> color_variation_management(FirstCharacter, yellowC)->
                
            + [Risposta viola.]
                -> color_variation_management(FirstCharacter, purpleC)->
            
            + [Risposta rossa.]
                -> color_variation_management(FirstCharacter, redC)->    
                 
            + [Risposta verde.]
                -> color_variation_management(FirstCharacter, greenC)->
            -
            
        ~ move_entity(Mentor, TrainStop)
        
        {
            - not welcome:
            (Mentore) Vi chiedo scusa, non avrei voluto origliare, ma volevo dirvi che non siete in un sogno, e che posso aiutarvi.
            Tu, {player_name}, quando puoi parlami, e ti spiegherò un po’ di cose.
            
            - else:
            (Mentore) Scusatemi, non avrei voluto origliare, ma ci tenevo a dirti che no, non sei in un sogno {charNameOne}, ma {player_name} può davvero aiutarti.
            E {player_name}, ci sono altre cose che posso spiegarti in più rispetto al solo “vai e parla con qualcunx”.
        }
        
        Ooook.
        Ok.
        Un fiore parlante.
        Quindi è un trip.
        Devo idratarmi.
        Devo assolutamente idratarmi.
        
            @animation:RewriterBook
            
            ~ move_entity(FirstCharacter, Pond)
            ~ move_entity(FirstRecap, BookPlace)
            
            ~ firstChar_pauseTalking = firstChar_pauseDuration
            ~ firstChar_justTalked = true
            
            -> options_first_character
        

    
    = two
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
        ~ firstChar_storyletsForRewritingCount ++
        
        {
            - are_two_entities_together(SecondCharacter, PG):
            Commetto Riccio.
                        
        }
        {
            - are_two_entities_together(Mentor, PG):
            Commetto Mentore.
                        
        } 
            
        {player_name}, ma hai sentito che silenzio che c’è in questo posto?
        Non silenzio silenzio tipo vuoto nello spazio.
        Anche perché ci sono animaletti e insetti e tutto il resto che fanno un sacco di casino.
        Ma mi sento la testa libera.
        Riesco ad ascoltare i miei pensieri.
        E le canzoncine della pubblicità ancorate nel mio cervello.
        O magari è perché prima ho preso una botta assurda contro il vetro della serra e mi sono resettata?
        Ma il male mi ha fatto capire che questa non è un’allucinazione o un sogno.
        E invece di essere preoccupata vorrei solo stendermi a riposare.
        Mi spiace giusto perché le mie coinquiline saranno preoccupate.
        E a lavoro saranno incazzati a bestia.
        Sempre che non sia una di quelle situazioni in cui il tempo qui passa velocissimo e nel mondo reale zero.
        Magari mi metto a recuperare il sonno arretrato.
        Forse vorrei giusto avere la mia tastiera, e le ragazze della band perché ho voglia di creare qualcosa di nuovo.
        Sono settimane che non ho le energie per creare un pezzo che uno, un accenno di melodia.
        Ma tu che idea ti sei {player_pronouns has him:fatto|{player_pronouns has her:fatta|fattə}}. di questo posto?
        
        //Risposte, di cui una diversa se ho parlato o meno con Mentore.
                
            + [Risposta gialla.]
                -> color_variation_management(FirstCharacter, yellowC)->
            
            + [Risposta rossa.]
                -> color_variation_management(FirstCharacter, redC)->  
                
            + [Risposta viola.]
                -> color_variation_management(FirstCharacter, purpleC)->
                
            + {not welcome} [Risposta blu.]
                -> color_variation_management(FirstCharacter, blueC)->
            
            + {welcome} [Risposta blu.]
                -> color_variation_management(FirstCharacter, blueC)->

            + [Risposta verde.]
                -> color_variation_management(FirstCharacter, greenC)->
            -
        
        Sai {player_name}: mi spiace che Talco non sia qui ma son felice di non essere sola.
        Potrebbe piacermi la tua compagnia.
                 
                ~ firstChar_pauseTalking = firstChar_pauseDuration
                ~ firstChar_justTalked = true
                @animation:RewriterBook
                
            -> options_first_character 
        
    = three
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
        ~ firstChar_storyletsForRewritingCount ++
    
        {
            - are_two_entities_together(SecondCharacter, PG):
            Commetto Riccio.
                        
        }
        {
            - are_two_entities_together(Mentor, PG):
            Commetto Mentore.
                        
        }     
        
        Ehi {player_name}!
        Prima ho parlato con {mentorName} che mi ha spiegato che sei qui per aiutarmi.
        Dice che c’è qualcosa che mi blocca.
        E che quando mi fiderò di te potrò chiederti aiuto e sbloccarmi e tornare a casa.
        Tipo una versione di D&D con le quest scritte da un emo.
        Stavo per dirle: guarda ama, mi fido già di {player_name}!
        Sono un labrador e mi fido sempre di tutte le persone che incontro!
        Poi ho pensato che non è vero.
        E che se sei davvero qui per aiutarmi, posso tirarti un piccolo pippone.
        Così ci conosciamo meglio.
        No, non è un vero pippone.
        Ma mi sono chiesta cosa sia la fiducia.
        E se fosse un tema, uno di quelli delle medie tipo “Parla della persona di cui ti fidi di più”, sarebbe un tema su Talco.
        Si dice spesso “cosa x mi ha salvato la vita”, e ho creduto per un sacco che fosse una cazzata.
        Pensavo che niente salvasse nessunə.
        Poi ho conosciuto Talco.
        Abbiamo iniziato il Conservatorio assieme, ma ləi l’ha lasciato dopo un anno.
        Credo abbia litigato con tutti i professori.
        Talco non sopporta le regole che non hanno senso, e il Conservatorio ne è pieno.
        Non so se l’avevi già capito {player_name}, ma sono una persona che si tira un sacco di film in testa.
        E quando ho incontrato Talco, ero bloccata in un brutto film che durava dalla fine del liceo.
        E ləi mi ha buttato nel mondo.
        Non con quelle cagate tipo “cammina nel verde e vedrai che passa tutto”.
        Ma mi ha fatto fare cose piccole che mi hanno aperto un mondo.
        Come quando ci siamo stes3 in piazza per vedere come le persone reagivano.
        O quando abbiamo finto di intervistare persone anziane per farle sentire ascoltate.
        O tutte le volte che davanti a una cosa ingiusta ha detto “no”!
        Mi ha fatto capire che per me è importante fare qualcosa di utile per il mondo.
        E che mi piace quando posso farlo con le altre persone.
        Mi piace stare con le persone.
        Io non so se sono bloccata in qualcosa, come dice {mentorName}.
        Ma forse è vero che in qualche modo non mi muovo nella mia vita da un po’.
        Con Talco mi sono messa in situazioni strane perché mi fidavo di lei.
        E mi chiedevo: secondo te, cosa vuol dire fidarsi?
        
        //Risposte
            + [Risposta verde.]
                -> color_variation_management(FirstCharacter, greenC)->
                
            + [Risposta viola.]
                -> color_variation_management(FirstCharacter, purpleC)->
            
            + [Risposta gialla.]
                -> color_variation_management(FirstCharacter, yellowC)->
            
            + [Risposta blu.]
                -> color_variation_management(FirstCharacter, blueC)->
            
            + [Risposta rossa.]
                -> color_variation_management(FirstCharacter, redC)->  
                
            -
        Mi manca, Talco.
        Mi spiace per come le cose siano cambiate.    
             
                ~ firstChar_pauseTalking = firstChar_pauseDuration
                ~ firstChar_justTalked = true
                @animation:RewriterBook
    
                -> options_first_character
        
    
    = four
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    ~ firstChar_storyletsForRewritingCount ++
        {
            - are_two_entities_together(SecondCharacter, PG):
            Commento Riccio.
                        
        }
        {
            - are_two_entities_together(Mentor, PG):
            Commento Mentore.
                        
        }
        
        Da qualche mese lavoro in un ristorante.
        Così, per iniziare le conversazioni a cavolo.
        Comunque, {player_name}: lavoro in un ristornante.
        Uno di quelli da catena, che si gasano perché hanno la sede sia a Buco di Culo Lombardo che a Pechino.
        Come puoi immaginare, non era quello che mi aspettavo dopo il Conservatorio.
        Per un po’ sono riuscita a fare qualche lavoretto con il pianoforte, quasi sempre non pagato.
        Poi mio padre ha perso il lavoro, e mi ha detto: figlia, siamo nella merda.
        Tengo sempre un orecchio alzato per qualche commissione.
        Ma per lo più sono di sera o nel fine settimana, quando col cavolo che mi danno il giorno libero dal ristorante.
        Per fortuna ci sono le prove con la band.
        Quando ho le energie per farle.
        Lavorare al ristorante è una merda, ma il rapporto con alcune colleghe è bello.
        Qualche settimana fa è venuto un dirigente di una compagnia petrolifera a mangiare.
        Una di quelle specializzate in greenwashing e che ti denunciano se solo racconti quello che fanno.
        Ci siamo rifiutate di servirlo.
        Il caposala era verde bestia, ma è stata la prima volta che mi son sentita viva a lavoro.
        Dire “no” è una cosa potentissima.
        Ed è stato bello farlo assieme.
        Da quel momento mi chiedo se possano esserci cose che mi diano uno scopo più ampio.
        A lavoro stiamo provando di nascosto a tirare su un gruppo sindacale.
        “Di nascosto”, perché coi contrattini precari da fame che ci ritroviamo fanno alla svelta a non rinnovarci.
        A volte temo siano energie sprecate.
        Altre, che dovrei fare qualcosa di più grande, che faccia meglio a più persone.
        Tu cosa ne pensi?
        
        //Risposte
        //Una di queste risposte genera un commento di Chitarra che ci racconta qualcosa simili imprenditore giochi Cortese come esempio tossico.

            + [Risposta viola.]
                -> color_variation_management(FirstCharacter, purpleC)->
            
            + [Risposta blu.]
                -> color_variation_management(FirstCharacter, blueC)->
            
            + [Risposta rossa.]
                -> color_variation_management(FirstCharacter, redC)->  
                
            + [Risposta gialla.]
                -> color_variation_management(FirstCharacter, yellowC)->
                
            + [Risposta verde.]
                -> color_variation_management(FirstCharacter, greenC)->

            -    
        
        A prescindere, ci sono giornate in cui l’unica cosa che mi gasa è la rabbia nella chat ribelle.
        Gli insulti ai capoccia.
        Il tenere traccia di tutte le ingiustizie.
        La speranza di fargliele ripagare, un giorno o l’altro.
        
            ~ firstChar_pauseTalking = firstChar_pauseDuration
            ~ firstChar_justTalked = true
            @animation:RewriterBook

                    -> options_first_character
            
    = five
    //Non mettere cose TW qui
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    ~ firstChar_storyletsForRewritingCount ++
    
         Hai presente quel meme del tizio che sta a una festa in un angolo.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
         E giudica tutti?
         Ecco: io sono quella che balla e ignora il basicone.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
         Passo le giornate circondata dall3 am3, mi vivo la festa.
         In casa siamo in cinque, sei se conti la muffa.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
         E poi tutt3 l3 ospiti.
         Ovviamente la meglio ama è Talco.
         Ti ho già detto che crea strumenti con qualsiasi cosa trova in giro?
            {
                - are_two_entities_together(SecondCharacter, PG): Mi piacerebbe tantissimo conoscere Talco!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_emotional
                
                    Ti adorerebbe!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
            }
         
        L'estate facciamo le feste sul tetto, cantiamo e improvvisiamo.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
        "E vento e sudore si portano via le preoccupazioni, non c’è nulla a cui pensare."
        "Ti senti parte di tutto, privə di confini."
        "Sei la musica, sei l’umidità nell’aria, sei la gola del vicino che si lamenta del casino."
        Sono parole scritte da Talco, le adoro.
        Qui è tutto così calmo, posso sentire i pensieri dei miei pensieri e questa roba mi cringia così tanto che non hai idea.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:chitarra_sad
        
                + [Allora serve fare più rumore.]
                    -> color_variation_management(FirstCharacter, redC)->
                     Facciamo incazzare la mentore?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                        {
                            - are_two_entities_together(Mentor, PG):Non sono capace di arrabbiarmi, mi spiace {charNameTwo}!#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #portrait:mentore_neutral
                                L'importante è crederci.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                        } 
                    Quindi dovrei riprendere a stordirmi di cose?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
                    Può essere un'idea.
                    Ma non so quanto sia utile per capire perché ho questo maledetto nome.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                        
                        
                + [Il pensiero è specchio: rompilo per distinguere reale e riflesso.]
                    -> color_variation_management(FirstCharacter, purpleC)->
                    Ti shippo, ama, ma parla come mangi.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                    Però forse dovrei stendermi e meditare.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                    Lasciare che i pensieri si spengano uno per uno.
                    Talco lo fa.
                    Dice spesso che devo "ignorare la paura che ho all'idea di vedere le cose come stanno".
                    Facile, proprio.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:chitarra_sad
                        {
                            - are_two_entities_together(Mentor, PG):Posso insergnarvi un po' di mindfulness.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                        }
                        
                
                + [La disciplina può aiutare a spegnere i pensieri.]
                    -> color_variation_management(FirstCharacter, blueC)->
                     Ma l'alcool lo fa prima, e meglio.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                     E costa meno della terapia.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:chitarra_sad
                        
                        
                + [Forse non è la festa, ma è il senso di unione che ti manca.]
                    -> color_variation_management(FirstCharacter, greenC)->
                     Ma con chi, qui?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                     Scusa, non per triggerarti.
                     Sei una persona a modo, ma non siamo ancora bestie.
                     Men che meno la mentore.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                        {
                            - are_two_entities_together(Mentor, PG):Non capisco perché tanto astio.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
                        }                     
                        
                        
                + [La serra ha un tetto! E io so sudare!]
                    -> color_variation_management(FirstCharacter, yellowC)-> 
                     Questo è un piano, ama!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                     Forse il vetro non ci reggerebbe a lungo ma che cambia?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
                     E almeno una di quelle strane piante saprà cantare!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                               
                -
        Ma ora ho bisogno di rilassarmi un po' ama.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
        E magari riposa anche tu.
        
        {
                - are_two_entities_together(Mentor, PG): Commento mentore. #speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
}
            ~ firstChar_pauseTalking = firstChar_pauseDuration
            ~ firstChar_justTalked = true
            @animation:RewriterBook
            
                -> options_first_character
        
    = six
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    ~ firstChar_storyletsForRewritingCount ++
        
        {
            - are_two_entities_together(SecondCharacter, PG):
            Commento Riccio.
                        
        }
        {
            - are_two_entities_together(Mentor, PG):
            Commento Mentore.
                        
        }
        
         
            ~ firstChar_pauseTalking = firstChar_pauseDuration
            ~ firstChar_justTalked = true
            @animation:RewriterBook
            
                -> options_first_character
        
    = seven
    //Non mettere cose TW qui
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    ~ firstChar_storyletsForRewritingCount ++
        
        {
            - are_two_entities_together(SecondCharacter, PG):
            Commento Riccio.
                        
        }
        {
            - are_two_entities_together(Mentor, PG):
            Commento Mentore.
                        
        }
        
        Ammettiamolo: ci sto girando attorno da un bel po’ ormai.
        Continuo a parlare al passato di Talco, l’avrai notato.
        Ed è perché non ci sentiamo da mesi.
        E ora ti racconterò il perché e tu mi giudicherai una stronza epocale, e me lo merito.
        Quindi.
        Un anno fa Talco mi scrive per propormi un aperitivo solo tra noi, “come ai vecchi tempi”.
        Tra lavori e fidanzati e il resto non ci vedevamo da molte settimane.
        Abbiamo trovato un incrocio coi calendari, e la sera che l’ho rivistə mi si è spalacanto il cuore.
        E tra una battuta e un lamento sul lavoro continuavo a pensare: e se riprendessimo in mano il vecchio progetto?
        E se andassimo a vivere tutt3 assieme in campagna?
        Talco, io, le ragazze del gruppo?
        Sicuro Ennio non apprezzerebbe molto, ma alla peggio potrebbe venire a trovarci nel fine settimana.
        Quando Talco mi ha detto “devo dirti qualcosa di importante”, ero già nel pieno del mio film.
        Mi ha preso la mano, tesə a bestia come non l’avevo mai vistə.
        “Aspetto un bambino”.
        E {player_name}, tutto è diventato grigio.
        Ci eravamo ripromess3 mille volte che non sarebbe successo.
        Niente figli, niente partner a frapporsi tra noi o cose del genere.
        E stava già succedendo comunque col lavoro e con Ennio e il suo Thomas ma cazzo, questa roba!
        Talco che diventa la prima persona che conosco a rimanere incintə.
        Non abbiamo manco trent’anni, cazzo!
        E l’ha visto, sulla mia faccia.
        Non ho detto nulla ma già aveva capito tutto.
        E non si è manco arrabbiatə**.**
        Mi ha solo detto che era un passo importante per ləi, perché anche se è una cosa inaspettata, ama Thomas, e sa che è l’uomo giusto.
        E poi, il colpo finale.
        “Vorrei trasferirmi da lui a Toronto. Qui non mi rimane nulla, nulla a parte te.”
        “E per questo, vorrei ti trasferissi con noi.”
        “Vorrei crescerla con te, questa creaturina. Con te e Thomas.”
        E…
        Dio, quanto vorrei del vino ora.
        Tu come ti saresti {player_pronouns has him:sentito|{player_pronouns has her:sentita|sentitə}} al mio posto?
        
        //Risposte.
                + [{player_pronouns has him:Tradito|{player_pronouns has her:Tradita|Traditə}}.]
                    -> color_variation_management(FirstCharacter, redC)->
                    
                    Uh.
                    Scusa per il sospirone.
                    Ma credo sia stata la prima emozione che mi ha colta.
                    E mi ha fatto un male boia, {player_name}.
                    Un male boia.
                    
                + [{player_pronouns has him:Incuriosito|{player_pronouns has her:Incuriosita|Incuriositə}} dall'idea di qualcosa di nuovo.]
                    -> color_variation_management(FirstCharacter, yellowC)->
                    
                    Qualcosa di nuovo con un tizio che ho visto tre volte.
                    In una città diversa in un altro continente.
                    Eppure.
                    Eppure anche qualcosa di diverso da tutto quello che avevo.
                    Dalla stasi della mia vita.
                    
                + [Felice di questa nuova famiglia con Talco.]
                    -> color_variation_management(FirstCharacter, greenC)->
                    
                    Sei una persona migliore di me allora, {player_name}.
                    Perché le emozioni che ho provato erano davvero tante, ma non felicità.
                    Per nessuna delle persone coinvolte.
                    E per questo mi sento una stronza.
                    Talco era felice di questa novità.
                    Io non son stata capace di essere felice per ləi.
                    
                + [Una situazione assurda può farmi conoscere cose assurde di me.]
                    -> color_variation_management(FirstCharacter, purpleC)->
                    
                    Possibile.
                    E la cosa più assurda sarebbe scoprire che è vero che non mi piacciono i bambini.
                    A migliaia di chilometri da tutto quello che conosco.
                    Col mio inglese terribile.
                    Dipendendo totalmente da una persona che deve prendersi cura di un infante.
                
                + [{player_pronouns has him:Confuso|{player_pronouns has her:Confusa|Confusə}} dall'assurdità di questa situazione.]
                    -> color_variation_management(FirstCharacter, blueC)->
                    
                    Non è assurda, non con Talco.
                    Ma confusione è una parola che mi ritorna, quando ripenso a quella sera.
                    Perché la quantità di cose che ho provato è stata immensa.
                
                -
        
        Quella sera ho scoperto che la persona in me che sa fare cose, le sa fare solo se sa che Talco è dalla sua parte.
        Un intero film mi è partito in testa.
        Una roba con Margherita Buy piena di solitudine abbandono e perdita.
        Ho lasciato il tavolo in silenzio, ho chiamato Ennio e l’ho raggiunto a casa sua.
        Abbiamo scopato senza preservativo, ma l’ho cacciato fuori di forza quando stava per venire.
        E poi ho pianto tutta la notte.
        Un mese dopo Talco è partitə, e non ci siamo più sentite fino a qualche settimana fa, quando mi ha mandato una cartolina.
        Una foto dellə bimbə.
        “Qualcuno aspetta un tuo abbraccio.”
        
                ~ firstChar_pauseTalking = firstChar_pauseDuration
                ~ firstChar_justTalked = true
                @animation:RewriterBook
                
                    -> options_first_character          
    
    = eight
    //Non mettere cose TW qui
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    ~ firstChar_storyletsForRewritingCount ++
        
       
            ~ firstChar_pauseTalking = firstChar_pauseDuration
            ~ book_BGVariations ++
            ~ firstChar_justTalked = true
            @animation:RewriterBook
                        
                -> options_first_character
    
    = nine
    //Da qui, no problem con contenuti TW. Si mette Chitarra che ci dice che, se non ce la sentiamo, ci dice qualcosa di diverso. Il rapporto non cambia., il greenhouse_questionsCounter non sale.
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
        //Voglia di fare qualcosa di utile, importante
        ~ firstChar_storyletsForRewritingCount ++
        
         Non lo dire alla mentore, ma mi ci sto abituando a stare qui.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate 
         Anche se non sarebbe male avere almeno un pianoforte e del vinello.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
         Però mi sembra che questo posto non cambi molto.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
         Sembra il momento prima del temporale, quando l'aria frizza e sai che sta per arrivare ma non sai quanto sarà forte.
         E ti senti viva.
         {
                - are_two_entities_together(Mentor, PG): Commento mentore. #speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
}
         Merda, faccio davvero schifo a parlare.
            
            + [È come una ninna nanna. Chissà cosa sognerai.]
                -> color_variation_management(FirstCharacter, greenC)->
                 La cosa preferita di Talco sono i pigiama party.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                 Chillare con l3 am3.
                 "Un sogno condiviso, sognando sognare."
                    
                    
            + [Non tanto a parlare ma ad arrivare al punto.]
                -> color_variation_management(FirstCharacter, blueC)->
                 Ama, mi ricordi perché continuo a raccontarti queste cose?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                 Ah, sì, perché siamo solo noi.
                 E la mentore.
                 E la mia noia.
                    
                    
            + [Ogni temporale toglie a qualcuna e dà a qualcun altro.]
                -> color_variation_management(FirstCharacter, purpleC)->
                 Ah, ci sta!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                 Come le piante nella serra.
                 Che mi sembra crescono con la terra e le nostre paturnie.
                 Per poi darci in cambio forme assurde e idee.
                    
                    
            + [O come il momento prima di una battaglia.]
                -> color_variation_management(FirstCharacter, redC)->
                 A te piace menare le mani, {player_name}?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                 Ma non è roba mia, andare a fare battaglie.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                 Tutte le cose di guerra mi fanno solo incazzare.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                 Mi sembra solo un modo idiota per vedere chi ce l'ha più grosso.
                 E manco tra la gente che poi muore.
                 Cringe.
                    
                    
            + [Qui l'aria sa di mare e zucchero filato!]
                -> color_variation_management(FirstCharacter, yellowC)-> 
                 Vero? Che è assurdo, perché non ho visto il mare da nessuna parte.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
                 Né dello zucchero filato.
                 Ma ora ho fame.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                 E voglia di farmi un giro sull'ottovolante.
                            
    
            -
            {
                - are_two_entities_together(SecondCharacter, PG): Commentto Riccio!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                    
            } 
         Vabbè.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
         Credo me ne starò qui ad aspettare questo finto temporale.

             ~ firstChar_pauseTalking = firstChar_pauseDuration
             ~ firstChar_justTalked = true
            @animation:RewriterBook
            
            -> options_first_character 
    = ten
        //Da qui, no problem con contenuti TW. Si mette Chitarra che ci dice che, se non ce la sentiamo, ci dice qualcosa di diverso. Il rapporto non cambia., il greenhouse_questionsCounter non sale.
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    ~ firstChar_storyletsForRewritingCount ++
        
         Comunque non è che penso solo a me stessa ama, giuro.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
         L'anno scorso abbiamo occupato un parco per una settimana.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
         Il comune voleva distruggere gli alberi, e volevamo fare qualcosa di decente per una buona volta.
            {
                - are_two_entities_together(SecondCharacter, PG): La prossima volta voglio aiutarvi!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_emotional
                    Sarai il primo a venire chiamato, promesso!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
            }
            
         La prima notte non abbiamo manco sentito il freddo da quanto eravamo prese bene.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
         {
                - are_two_entities_together(Mentor, PG): Commento mentore. #speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
}
         Però poi il mood si è spento.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:chitarra_sad
         Diverse se ne sono andate, e chi è rimasta non aveva più la spinta. Zero.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
         L'ultima sera c'è stato un momento di totale silenzio.
         Non si sentiva la pula, nessuna cantava, persino gli scoiattoli erano fermi.
         E a quel punto ho sentito il canto degli alberi.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
         Giuro, ama!
         E quando ho iniziato a cantare con loro mi sono sentita viva.
        
            + [Forse gli alberi qui conoscono la storia della tua lotta.]
                -> color_variation_management(FirstCharacter, greenC)->
                 Non è per flexare, ma sarebbe bello.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                 Però allora gli chiedo anche come tornare a casa.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                 Non so più quanto voglio restare quì.
                 Senza offesa, ama.
                    
                
            + [Hai anche danzato con gli alberi?]
                -> color_variation_management(FirstCharacter, yellowC)->
                 Non avevo preso i funghetti, no.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                 Ma avrei apprezzato molto, ama.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                 Anzi no, forse non l'avrei fatto.
                 Muovermi a volte mi sembra che rompa le cose.
                    
                    
            + [Sei tu che hai lottato per gli alberi, o loro per te?]
                -> color_variation_management(FirstCharacter, purpleC)->
                 Ti shippo totale.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                 Talco direbbe che ci siamo aiutate a vicenda. E non solo.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                 Che la separazione è solo una illusione, o roba del genere.
                 Che una melodia non esiste senza tutte le sue note.
                    
            
            + [Gli alberi "cantano" per allarmare altri alberi.]
                -> color_variation_management(FirstCharacter, blueC)->
                 Ama, tu sai uccidere il mood come poche persone al mondo.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                 Quindi secondo te ero immersa in un coro di disperazione?
                 Ora mi metto a urlare anche io.
                    
                
            + [Come ti sei sentita a combattere per qualcun altro?]
                -> color_variation_management(FirstCharacter, redC)->
                 Motivata.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                 Motivata fino al cuore.
                 L'avrai notato, faccio un po' cagare a spiegare le cose.
                 Ma in quel momento sapevo che stavo facendo qualcosa che aveva un senso.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                 Qualcosa di importante non solo per me.
                    
            -    
         Comunque la storia poi è finita male, ovvio.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
         I poliziotti ci hanno trascinate e bastonate e schedate.
         E soprattutto hanno tagliato gli alberi.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:chitarra_sad
         E sono tornata a sentirmi inutile.
            {
                - are_two_entities_together(SecondCharacter, PG): No, gli alberi no, poveri!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                    E non povera {charNameTwo}?!?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
            } 
            ~ firstChar_pauseTalking = firstChar_pauseDuration
            ~ firstChar_justTalked = true
            @animation:RewriterBook
            
            -> options_first_character
    
    = eleven
        //Da qui, no problem con contenuti TW. Si mette Chitarra che ci dice che, se non ce la sentiamo, ci dice qualcosa di diverso. Il rapporto non cambia., il greenhouse_questionsCounter non sale.
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
        //Famiglia d'origine
        ~ firstChar_storyletsForRewritingCount ++
        
         Ti racconto una cosa idiota. La passione per la musica l'ho presa da mio papà.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
         Lo stesso uomo che ora vorrebbe cercassi un "lavoro vero".#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
         Casa è piena di vecchi strumenti che nessuno tocca da anni.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:chitarra_sad
         Sono del nonno paterno.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
         Papà li tiene come se fossero delle reliquie.
         Da piccola ogni tanto mi lasciava sentire le vecchie registrazioni, di quando nonno suonava e cantava nelle balere.
         Nonno era un chad to-ta-le.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
         A volte papà ballava con me e mamma.
         E rideva un sacco.
         {
                - are_two_entities_together(Mentor, PG): Commento mentore. #speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
}
         Non il suo sport preferito, ora.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:chitarra_sad
        
            + [L'inferno è uno strumento che non può suonare.]
                -> color_variation_management(FirstCharacter, purpleC)->
                 Adoro.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                 Non avrei saputo dirlo meglio.
                 Ogni tanto li rubavo e suonavo in camera.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                 Alcuni avevano un suono storto, forse per colpa delle tarme.
                 Però ho sempre amato le cose un po' rotte perché hanno una storia tutta loro.
                    
                    
            + [E ora accresci l'albero della tua famiglia.]
                -> color_variation_management(FirstCharacter, greenC)->
                 Più o meno.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                 Per nonno la musica era fatta per unire, salvare il mondo forse.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                 Quando ci viene da ballare e cantare ci passa la voglia di litigare, no?
                    
                    
            + [Credi che tuo padre si sia arreso?]
                -> color_variation_management(FirstCharacter, redC)->
                 Merda, ci vai giù piano {player_name}!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                 Non ci crederai, ma no, secondo me no.
                 Lui è davvero felice di ciò che fa.
                 Il problema è che pensa che visto che le cose che fa lo fanno felice, allora tutti devono essere felici facendo le cose che fa.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                 Non ci avevo pensato, ma ora ho capito da dove gli vengono certe idee politiche di merda.
                    
                    
            + [Ti va di ballare con me?]
                -> color_variation_management(FirstCharacter, yellowC)->
                 Sì ama!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                 Forse non ora però.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                 Questa cosa della chitarra inizia a pesarmi.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:chitarra_sad
                    
                    
            + [Esistono lavori veri e lavori non veri?]
                -> color_variation_management(FirstCharacter, blueC)->
                 Sei tu la persona seria, no?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                 Se la vedi come mio padre la risposta è <i>sì</i>.
                 E non casualmente i lavori non veri sono tutti quelli che mi piacciono.
                    
            -
            
        Lasciami un po' sola ora, {player_name}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:chitarra_sad
        Perché sto entrando in fase lamentosa e non ho voglia di cringiarti.
            {
                - are_two_entities_together(SecondCharacter, PG): Commentto Riccio!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                    
            } 
             ~ firstChar_pauseTalking = firstChar_pauseDuration
             ~ firstChar_justTalked = true
            @animation:RewriterBook
            
                    -> options_first_character
            
    = twelve
        //Da qui, no problem con contenuti TW. Si mette Chitarra che ci dice che, se non ce la sentiamo, ci dice qualcosa di diverso. Il rapporto non cambia., il greenhouse_questionsCounter non sale.
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    ~ firstChar_storyletsForRewritingCount ++
    
         Comunque in merito a quello che ti dicevo prima, ama: non è che papà sia un mostro, sia chiaro. #speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
         {
                - are_two_entities_together(Mentor, PG): Commento mentore. #speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
}
         Mamma è più cinica di papà.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
         Le sono grata, quello sicuro: è lei che ha convinto papà a farmi fare il conservatorio.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
         Ma per farmi diventare una Lang Lang, Mitsuko Uchida, Alfred Brendel.
         Prestigio, onoreficienze e denaro.
         Lib totale lei, totale.
         Ma chi glielo dice che a ventitrè anni per queste cose sono già vecchia?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
            {
            - are_two_entities_together(SecondCharacter, PG): Moooooolto vecchia!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                Nanerottolo, vieni qui, che ti trasformo in uno sgabello!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            }         
        Se l'obiettivo è diventare Uchida, sono già fottuta.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
        
            + [Tua mamma vuole il tuo o il suo di bene?]
                -> color_variation_management(FirstCharacter, greenC)->
                 A mia madre interessa solo il nome della famiglia.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                 Come se poi fosse prestigioso.
                 Un po' mi spiace perché mi rendo conto che lei ci tiene proprio a sembrare una di quelle fighe.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                 Ed è l'unica a non accorgersi che può fare tutte le cose più assurde del mondo, ma tanto nessuno la considererà una al top.
                 Povera.
                    
                    
            + [Loro hanno fatto concerti prima della maggiore età.]
                -> color_variation_management(FirstCharacter, blueC)->
                 Grazie per avermelo ricordato.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                 Ne avevo davvero bisogno.
                 Ora dimmi che sono fallita e così posso appendere il piano al muro.
                 E non dirmi che non si può appendere un pianoforte al muro o giuro che ti rompo i timpani urlando.
                    
                
            + [La strada sbagliata è quella con più insegnamenti.]
                -> color_variation_management(FirstCharacter, redC)->
                {player_name}: non un nome ma un dispenser di aforismi.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                Però in qualche modo ha senso.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                Ma presto o tardi dovrò pure capire come mangiare, e a quel punto cosa me ne faccio di tutte le strade sbagliate del mondo?
                        
                        
            + [Ma loro si divertono, quando suonano?]
                -> color_variation_management(FirstCharacter, yellowC)->
                 Tanto, ama.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                 Prendi Uchida: quando suona è una gioia per gli occhi.
                 Anche se forse non lo chiamerei proprio divertimento.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                 Se ne va in un altro luogo, un mondo che non ho ancora trovato.
                 Forse è questo qui?
                 Sto suonando e sono così fatta da non averlo realizzato?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
                    
                    
            + [Cambiamo sempre, ma non diventiamo mai chi non siamo.]
                -> color_variation_management(FirstCharacter, purpleC)->
                 Un'altra frase così e mi crusho tantissimo per te.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                 Ma prima vallo a dire a mia madre.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                 Ama: mi fa male con queste cose ma non se ne rende nemmeno conto.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:chitarra_sad
                 È come se mi dicesse sempre che sono sbagliata.
                    
            -    
            
        Comunque: direi che ho finito di sputtanare la mia famiglia.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
        Woah.    
        Vado a deprimermi da qualche parte.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed

            ~ firstChar_pauseTalking = firstChar_pauseDuration
            ~ firstChar_justTalked = true
            @animation:RewriterBook
            
                    -> options_first_character