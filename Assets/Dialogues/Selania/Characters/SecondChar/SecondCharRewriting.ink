=== rewriting_proposal_second_character
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    
//Così se decido di uscire dalla conversazione, posso riprendere da dove eravamo rimaste.
    {
        - grimoire_secondChar hasnt grimSecondCharProposal:
            -> confession
            
        - else:
            -> rewriting

    }
    
    = confession
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    

    {charTag(SecondCharacter, "melanchonic")}:      Da quando nonna è nella casa dei vecchi fa tutto schifo.
    {charTag(SecondCharacter, "neutral")}:          Papà è tornato ma litiga sempre con mamma.
    {charTag(SecondCharacter, "angry")}:            E quando papà non c'è mamma si arrabbia con me.
                                                    E l'unica cosa che mi dice è che devo smetterla di piangere e fare il grande.
    {charTag(SecondCharacter, "neutral")}:          Che anche se piango nonna non torna e che è in un posto migliore.
    {charTag(SecondCharacter, "angry")}:            E a scuola le maestre sono fastidiose.
    {charTag(SecondCharacter, "neutral")}:          Dicono che sono cattivo e bugiardo e sono violento, e finisco sempre in punizione.
    {charTag(SecondCharacter, "melanchonic")}:      Mio fratello dice che il mondo è un posto orribile e che non si può più aggiustare.
                                                    Gli animali spariranno tutti e non posso fare nulla.
                                                    Papà dice che devo crescere, non pensare agli animali perché ora sono grande.
    {charTag(SecondCharacter, "angry")}:            Ma i grandi fanno schifo.
    {charTag(SecondCharacter, "melanchonic")}:      E non voglio fare schifo.
    {charTag(SecondCharacter, "angry")}:            E non voglio diventare grande.
    {charTag(SecondCharacter, "neutral")}:          Per questo sono venuto qui.
    {charTag(SecondCharacter, "energy")}:           Per stare con gli animali.
    {charTag(SecondCharacter, "melanchonic")}:      E non è il mio compleanno.
    {charTag(SecondCharacter, "neutral")}:          Ma se non mi invento un motivo per le cose nessuno mi ascolta.
    {charTag(SecondCharacter, "melanchonic")}:      Scusa per la bugia {player_name}.
                                                    Io voglio solo fare il bambino.

        -> second_char_closing_storylet ->

        + \ {charTag(PG, "neutral")}:               Ti ho ascoltato, {charNameTwo}, e posso aiutarti a riscrivere la tua storia.
            -> rewriting
        
        + \ {charTag(PG, "neutral")}:               Capisco il tuo dolore, ma ho bisogno di riflettere un attimo.
            -> main


    = rewriting
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    

    {charTag(SecondCharacter, "neutral")}:          Va bene.
                                                    Ma stavo pensando una cosa però prima.
    {charTag(SecondCharacter, "emotional")}:        Abbiamo parlato tantissimo noi due.
                                                    Ma davvero TANTISSSSSSIMO!
    {charTag(SecondCharacter, "energy")}:           E sai cosa penso di te?

        //Funzione di preparazione alla riscrittura
            ~  rewriting_prep(SecondCharacter)
        
        //E poi a seconda dello stato di inchiostro, mi sposto sulla domanda prevista      
            {
                - secondChar_InkLevel == ink_empty:
                    -> ending
                - else: 
                    -> one
            } 


    = one
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    


    {charTag(SecondCharacter, "neutral")}:      Comunque possiamo cominciare quando vuoi.
        
    //Affrontiamo gli adulti in generale
    {charTag(PG, "neutral")}:                   Hai detto che da quando nonna è nella casa dei vecchi fa tutto schifo.
                                                Che tuo papà litiga con tua mamma, e che mamma si arrabbia con te e di non piangere perché nonna è in un posto migliore.

        + \ {charTag(PG, "neutral")}:           Tua nonna ti ha insegnato a lottare: lotta anche tu!
            -> glyph_choice_manager(false, fireC)->
                                                E ti ha insegnato a barare!
                                                E a sputare nel caffè di chi ti fa male.
        {
            - grimoire_fifthChar has grimSecondCharMentorPeace:
                                                Pensa a prima, a quando hai convinto {charNameFive} a chiederti scusa.
                                                Sapevi di avere ragione, e per questo hai ottenuto quello di cui avevi bisogno.
        }
                
        
        + \ {charTag(PG, "neutral")}:           I tuoi genitori sono infelici, {charNameTwo}, prova a comprenderli.
            -> glyph_choice_manager(false, waterC)->
                                                Tutti i litigi, la fuga di tuo padre.
                                                Il modo in cui si arrabbia per tutto.
                                                Le paure di tua mamma.
                                                Sono cose che puoi capire, che vivi anche tu.                                                                    
        {
        - grimoire_secondChar has grimSecondCharKitchenOne:
                                                Se hai difficoltà, hai sempre la possibilità di immaginarli come animali, come mi hai raccontato cucinando!
        }                                     
                
                
        + \ {charTag(PG, "neutral")}:           Tuo fratello però ha trovato qualcosa di bello anche in questo casino.
            -> glyph_choice_manager(false, earthC)->
                                                Ci sono le sue statue, c'è il suo compagno.
        {
            -   grimoire_secondChar has grimSecondCharEleven:
                                                E quando sei a casa sua, ti lascia sperimentare con le cose di casa.
        }
        {
            - grimoire_secondChar has grimSecondCharKitchenOne:
                                                E poi hai il prociorso!
        } 
                
        + \ {charTag(PG, "neutral")}:           Anche se ti manca, la casa dei vecchi è un posto per farla stare bene.
                -> glyph_choice_manager(false, airC)->
                                                Una persona anziana ha bisogno di cure, {charNameTwo}.
                                                Di persone che le diano quello di cui ha bisogno.
                                                È giusto che tu senta la sua mancanza.
                                                Ma sarebbe la cosa giusta per lei, riportarla a casa?
        {
            - grimoire_secondChar has grimSecondCharTwelve:
                                                E poi puoi passare del tempo con la nonna del mare.
        }         

        + \ {charTag(PG, "neutral")}:           Saper piangere ti rende forte, {charNameTwo}.
            -> glyph_choice_manager(false, aetherC)->
                                                Tu tieni agli animali.
                                                A tuo fratello.
                                                Alla nonna.
        {
            - grimoire_secondChar has grimSecondCharTwelve:
                                                Anche alla nonna del mare.
        }                                         
        {
            - grimoire_secondChar has grimSecondCharKitchenOne:
                                                Al prociorso.
        }                                         
                                                Tieni anche ai tuoi genitori.
                                                Puoi imparare a fidarti.
                
    -
        ~ numberQuestion ++  
    {charTag(SecondCharacter, "neutral")}:      Sì no boh.
                                                Continua.
    
        //Check per commento strega
        -> rewriting_witch_feedback(oneR) ->          

        {
        - secondChar_InkLevel == ink_low:
            -> ending
        - else: 
            -> two
        }        
        
    
    = two
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour= translator(fourthChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)
        

    {charTag(PG, "neutral")}:                   A scuola le maestre dicono che sei cattivo, bugiardo, violento, e finisci sempre in punizione.

    + \ {charTag(PG, "neutral")}:               Le bugie alla fine sono solo storie. Usale per divertirti.
            -> glyph_choice_manager(false, earthC)->
    {
        - grimoire_secondChar has grimSecondCharKitchenThree:
                                                L'hai detto anche mentre cucinavamo: non tutte le bugie sono uguali.
                                                E che sei felice di inventare storie con tuo fratello.
    }    
                                                Ti piace immaginare giornate diverse: prova a condividere questa cosa con nuove persone, facendoti nuovi amici.
                                                La tua testa è un bellissimo parco giochi: perché non condividerla con gli altri?
    {
        - grimoire_secondChar has grimSecondOpenLibrary:
                                                Come i racconti che hai trovato in biblioteca!
    }
                
    + \ {charTag(PG, "neutral")}:               Tutto a questo mondo cambia. Anche un bambino cocciuto e bugiardo.
            -> glyph_choice_manager(false, airC)->
                                                Quando sei arrivato qui hai litigato con {charNameFive}.
                                                E mi hai detto molte bugie.
                                                Ma hai anche chiesto scusa.
                                                Puoi partire da questo per cambiare.
    {
    - grimoire_fifthChar has grimSecondCharMentorPeace:
                                                Anche {charNameFive} è cambiata, e ha capito quanto ti ha ferito.
                                                Tutti possono cambiare.
    }                                            
                
    + \ {charTag(PG, "neutral")}:               La rabbia è parte della tua vita, della tua famiglia: trasformala.
            -> glyph_choice_manager(false, fireC)->
                                                Come quando ti arrabbi perché gli animali stanno scomparendo.
                                                O perché papà tratta male nonna.
                                                Puoi prendere quello che senti a farci qualcosa di buono per te e le persone che ami.
    {
        - grimoire_secondChar has grimSecondCharNovel:
                                                L'hai detto anche quando hai letto il racconto del sassolino: i grandi non sempre vedono l'aragosta.
                                                Ma tu sì, e puoi cambiare tante cose.
    }
                
    + \ {charTag(PG, "neutral")}:               Ma non sei solo questo: sei gentile, sei curioso, sei divertente.
            -> glyph_choice_manager(false, waterC)->
                                                Hai sviluppato un bel rapporto con {charNameOne}.
                                                Mi hai raccontato tante cose interessanti sugli animali.
                                                Hai fatto amicizia con Franco.
     {
    - grimoire_fifthChar has grimSecondCharMentorPeace:
                                                Hai fatto pace con {charNameFive}.
    }                                             
                                                Ti sei preso le tue responsabilità.
                                                Forse a volte sei violento.
                                                E menti.
                                                Ma sei anche tante altre cose, {charNameTwo}.
                
    + \ {charTag(PG, "neutral")}:               Eppure hai trovato il modo di fare pace con {charNameFive}.
            -> glyph_choice_manager(false, aetherC)->
                                                Hai fatto lo sforzo di capirla.
                                                E mi hai chiesto scusa più volte per le tue bugie.
                                                Stai già cambiando, {charNameTwo}!
    -
    ~ numberQuestion ++  
    {charTag(SecondCharacter, "neutral")}:      Non ci avevo pensato.
                                                Che le cose possono cambiare.
    
        //Check per commento strega
        -> rewriting_witch_feedback(twoR) ->           
    
        {
        - secondChar_InkLevel == ink_normal:
            -> ending
        - else: 
            -> three
        }
        
    = three
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    
    //Affrontiamo il mondo. Rabbia, bugie, fantasia, violenza etc.
    {charTag(PG, "neutral")}:                   Tuo fratello dice che il mondo è orribile e che non si può più aggiustare.
                                                E hai paura che gli animali possano sparire.
                                                Così è logico vedere il futuro come un posto spaventoso.

    //renderla più interessante  
    + \ {charTag(PG, "neutral")}:               Eppure ci sono le associazioni che proteggono gli animali.
        -> glyph_choice_manager(false, aetherC)->
                                                Come quelle di cui ti ha parlato la tua maestra.
                                                E la sua amica del canile.
    {
        - grimoire_secondChar has grimSecondCharTwelve:
                                                E magari da grande studierai davvero come si curano i pesci.
    }

    + \ {charTag(PG, "neutral")}:               Eppure tuo fratello ama il suo ragazzo.
        -> glyph_choice_manager(false, waterC)->
                                                E ama te.
                                                E fa in modo che possiate passare tanto tempo assieme.
                                                Che tu possa avere uno spazio felice.
                                                E così rende il mondo un po' meno orribile.

    + \ {charTag(PG, "neutral")}:               Eppure continua a proteggerti da tuo padre.
        -> glyph_choice_manager(false, fireC)->
        {
            - grimoire_secondChar has grimSecondCharEleven:
                                                E quando sei a casa sua ti fa fare un sacco di esperimenti.
        }
                                                Si è creato una nuova casa.
                                                Non si è fatto mettere i piedi in testa da nessuno.
                                                E questo lo fai se pensi ci sia un futuro dove andare.
                
    + \ {charTag(PG, "neutral")}:               Ma sai anche trovare la fantasia e la giocosità nel mondo.
        -> glyph_choice_manager(false, earthC)->
                                                Sei arrivato in questo posto sconosciuto e invece di avere paura, ti sei messo a curiosare.
                                                Ti sei fatto amico una rana parlante.
            {
                - grimoire_secondChar has grimSecondCharDog:
                                                E ti sei esaltato quando hai incontrato il cane.
            }
            {
                - grimoire_secondChar has grimSecondCharKitchenThree:
                                                E un giorno avrai uno struzzo!
            }    
                                                Quando tu giochi non hai paura di nulla.
    //renderla più interessante  
    + \ {charTag(PG, "neutral")}:               Tuo fratello ha scelto di aggiustare le cose che non vanno.
        -> glyph_choice_manager(false, airC)->
                                                Vede le cose rotte e le ripara.
                                                Quindi ci sono cose che si possono aggiustare.
                                                Serve solo un meccanico per le cose che lo spaventano.
    -

    ~ numberQuestion ++ 
    {charTag(SecondCharacter, "neutral")}:      Si no boh.
                                                Magari hai ragione.
    
        //Check per commento strega
        -> rewriting_witch_feedback(threeR) ->           
    
        {
        - secondChar_InkLevel == ink_medium:
            -> ending
        - else: 
            -> four
        }
    
    = four
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
     

    {charTag(PG, "neutral")}:                   Hai detto che i grandi fanno schifo, e che non vuoi diventare grande.
    
        + \ {charTag(PG, "neutral")}:           Ma puoi essere un adulto combattente, come tua nonna.
            -> glyph_choice_manager(false, fireC)->
        {
            - grimoire_secondChar has grimSecondCharKitchenOne:
                                                Un adulto che dice le cose come sono, come mi raccontavi cucinando.
        }
        {
            - grimoire_secondChar has grimSecondCharKitchenTwo:
                                                Essere furbo, come ti ha detto lei.
        }
                                                E non farti mettere i piedi in testa da nessuna persona!
                    
    
        + \ {charTag(PG, "neutral")}:           Ma puoi essere un adulto curioso e studioso, come un po' già sei.
            -> glyph_choice_manager(false, airC)->
        {
            - grimoire_firstChar has grimFirstSecondChar:
                                                Come quando hai detto a {charNameOne} che volevi scoprire dove vanno tutti i posti chiusi qui.
                                                E come trovare le caramelle.
        }
                                                E tutto quello che ora sai degli animali diventerà mille volte ancora di più.

        
        + \ {charTag(PG, "neutral")}:            Ma puoi essere un adulto in cerca di uno scopo più grande, come {charNameOne}.
            -> glyph_choice_manager(false, aetherC)->
        {
            - grimoire_secondChar has grimSecondCharKitchenThree:
                                                Non uno di quegli adulti che fanno le cose perché devono, come raccontavi in cucina.
        }
                                                E trovare modi inaspettati di aiutare le altre persone, gli animali, il mondo.
                
        + \ {charTag(PG, "neutral")}:           Ma puoi essere un adulto che si prende cura delle persone, come {charNameFive}.
            -> glyph_choice_manager(false, waterC)->
                                                E rendere più facile la vita all3 altr3.
        {
            - grimoire_secondChar has grimSecondCharKitchenTwo:
                                                Una brava persona, come ti ha detto tuo fratello.
        }
        {
            - grimoire_fifthChar has grimSecondCharMentorPeace:
                                                Non uno di quei grandi che chiedono sempre scusa per tutte le cose ma poi le rifanno, come hai detto a {charNameFive}.
                                                Ma un adulto responsabile, come tuo fratello.
        }

        + \ {charTag(PG, "neutral")}:           Ma puoi essere un adulto creativo, come tuo fratello.
            -> glyph_choice_manager(false, earthC)->
                                                E condividere le tue storie e i tuoi esperimenti.
                                                Essere felice nel farli.
                    

    -
    ~ numberQuestion ++  
    {charTag(SecondCharacter, "neutral")}:      Posso essere un adulto buono.
                                                Uh.
    
    //Check per commento strega
        -> rewriting_witch_feedback(fourR) ->     
        
        -> ending

    
    = ending
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    

    {charTag(PG, "neutral")}:                   Credo di aver compreso quale sia il tuo blocco, perché sei qui.
                                                E riguarda gli adulti.
                                                Perché se chi dovrebbe proteggerti ti ha ferito, come fai a fidarti delle persone?
                                                E per questo ti dico {charNameTwo}:
        
    //Check per commento strega
    -> rewriting_witch_feedback(endR) ->    
    
        + (fire)\ {charTag(PG, "neutral")}:     Diventa il più forte, il più coraggioso.
        -> glyph_choice_manager(false, fireC)->
                                                Sei testardo, bugiardo, dispettoso.
                                                Queste cose unite possono renderti indistruttibile.
                                                E di cosa avrà mai paura un ragazzo indistruttibile?
                

        + (aether)\ {charTag(PG, "neutral")}:   Tutti abbiamo paura. Condividi questa paura con le altre persone.
        -> glyph_choice_manager(false, aetherC)->
                                                Falle sentire meno sole.
                                                Meno sbagliate.
                                                A quel punto saranno pronte a fare il passo.
                                                A cambiare le cose a loro volta.
                                                Assieme.
                

        + (earth)\ {charTag(PG, "neutral")}:    L'opposto della paura è la curiosità.
        -> glyph_choice_manager(false, earthC)->
                                                E tu sei il ritratto della curiosità.
                                                Guarda le cose che arriveranno chiedendoti "Chissà se..." o "E se invece..." o "Perché accade questo?".
                                                E a quel punto ogni paura diventerà solo un problema da risolvere.
                
            
        + (water)\ {charTag(PG, "neutral")}:    I tuoi genitori sono spaventati, aiutatevi a vicenda.
        -> glyph_choice_manager(false, waterC)->
                                                Nessuna persona può cambiare il mondo da sola.
                                                Ma possiamo partire dal cambiare le cose che ci circondano, un pezzo alla volta.
                
    
        + (air)\ {charTag(PG, "neutral")}:      Con la tua intelligenza puoi rendere il mondo migliore.
        -> glyph_choice_manager(false, airC)->
                                                Puoi aiutare gli adulti a essere meno tristi.
                                                E gli animali a non morire.
                                                E tua nonna a uscire dalla casa dei vecchi.
        -
    //Nota: la parte di accettazione del nome è prima dell'aggiornamento, così il nome nuovo compare solo quando viene dichiarato.
    {charTag(SecondCharacter, "neutral")}:      Sì. 
                                                No.
                                                Boh.

{
    - ending.fire:
    {charTag(SecondCharacter, "angry")}:        Non ci avevo mai pensato, che il fatto che sono bugiardo e dispettoso può rendermi indistruttibile. 
    
    - ending.aether:
        {charTag(SecondCharacter, "melanchonic")}: Non è che vedo sempre che anche le altre persone hanno paura.
                                                Questa cosa mi ha fatto sentire meno stupido.

    - ending.earth:
    {charTag(SecondCharacter, "energy")}:       Mi piace quella cosa che hai detto sulla curiosità perché è vera.
                                                Curioso sempre, curioso forte!

    - ending.water:
    {charTag(SecondCharacter, "melanchonic")}:  Io non ci avevo mica pensato che anche i miei genitori hanno paura.

    - ending.air:
    {charTag(SecondCharacter, "emotional")}:    Hai detto che la mia intelligenza può fare felici le altre persone.
                                                È una cosa bella, {player_name}.
        
}
    {charTag(SecondCharacter, "neutral")}:      Cavoli, quante parole che ho in testa!        

            //E andiamo a cambiare il nome
                ~ rewriting_end(SecondCharacter)
                
                ->naming
                
    
    
    = naming
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    
    
{

    - secondChar_ActualName has Grizzly:
    {
        - ending.fire:
                                                    E se penso a tutte le cose che abbiamo detto, c'è questo animale che è un po' me e che mi piace.
        - else:
                                                    Ma se penso a tutte le cose che abbiamo detto c'è un animale che mi piace e che so che è il nome che mi serve.
    }
        {charTag(SecondCharacter, "angry")}:        Il mio vero nome è <b><i>{charNameTwo}</b></i>.
            ~  characterChangingObjects(SecondCharacter)
    {charTag(SecondCharacter, characterPortraitsManagement(SecondCharacter))}:                                                 Combatterò la mia paura e diventerò il più forte di tutti, imbattibile!
    
    - secondChar_ActualName has Lupo:
    {
        - ending.water:
                                                    E se penso a tutte le cose che abbiamo detto, c'è questo animale che è un po' me e che mi piace.
        - else:
                                                    Ma se penso a tutte le cose che abbiamo detto c'è un animale che mi piace e che so che è il nome che mi serve.
    }
        {charTag(SecondCharacter, "angry")}:        Mi chiamerò <b><i>{charNameTwo}</b></i>.
            ~  characterChangingObjects(SecondCharacter)
    {charTag(SecondCharacter, characterPortraitsManagement(SecondCharacter))}:        E proteggerò il mio branco.
                                                                                    Mamma, papà, nonna e mio fratello.
                                                                                    Nessuna delle persone a cui voglio bene deve più stare male.
        
    - secondChar_ActualName has Delfino:
    {
        - ending.earth:
                                                    E se penso a tutte le cose che abbiamo detto, c'è questo animale che è un po' me e che mi piace.
        - else:
                                                    Ma se penso a tutte le cose che abbiamo detto c'è un animale che mi piace e che so che è il nome che mi serve.
    }
        {charTag(SecondCharacter, "energy")}:       E il mio nome è <b><i>{charNameTwo}</b></i>.
            ~  characterChangingObjects(SecondCharacter)
    {charTag(SecondCharacter, characterPortraitsManagement(SecondCharacter))}:        Perché tutto è un gioco.
                                                                                    La mia fantasia e qualche piccola bugia aiuteranno le altre persone ad avere meno paura.
                        
    
    - secondChar_ActualName has Capibara:
    {
        - ending.aether:
                                                    E se penso a tutte le cose che abbiamo detto, c'è questo animale che è un po' me e che mi piace.
        - else:
                                                    Ma se penso a tutte le cose che abbiamo detto c'è un animale che mi piace e che so che è il nome che mi serve.
    }
        {charTag(SecondCharacter, "emotional")}:    Mi chiamerò <b><i>{charNameTwo}</b></i>.
            ~  characterChangingObjects(SecondCharacter)
    {charTag(SecondCharacter, characterPortraitsManagement(SecondCharacter))}: E imparerò ad avere tantissimi amici.
                                                                            Ci sentiremo meno soli!
                                                                            E così avremo meno paura.
            
    - secondChar_ActualName has Corvo:
    {
        - ending.air:
                                                    E se penso a tutte le cose che abbiamo detto, c'è questo animale che è un po' me e che mi piace.
        - else:
                                                    Ma se penso a tutte le cose che abbiamo detto c'è un animale che mi piace e che so che è il nome che mi serve.
    }
        {charTag(SecondCharacter, "energy")}:        Io sono <b><i>{charNameTwo}</b></i>.
            ~  characterChangingObjects(SecondCharacter)
        {charTag(SecondCharacter, characterPortraitsManagement(SecondCharacter))}:                    Sono sveglio e posso capire ciò che mi circonda!
                                                                                                    E posso cambiare le cose che mi fanno paura.
                                                                                                    Aiutare gli altri.
            
}
        


            {
            - secondChar_specialEvent == true:
                -> secret_ending
            - else:
                -> exit
            }
    
    
    = secret_ending
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    

    {
        - grimoire_firstChar hasnt grimMentorFirstSecretEnding && grimoire_thirdChar hasnt grimMentorThirdSecretEnding :
                                                        <i>{charNameTwo} ripone piena fiducia in {player_name}, ed è pronto a condividere con {player_pronouns has him:lui|{player_pronouns has her:lei|ləi}} una informazione importante.</i>
    }

        {charTag(SecondCharacter, characterPortraitsManagement(SecondCharacter))}:                    Voglio dirti una cosa {player_name}. 
                                                                                                    Su {charNameFive}.
                                                                                                    A me non mi sembra mica felice.
                                                                                                    Mi ricorda mamma quando gira per casa dando consigli e dicendo cose sorridendo.
                                                                                                    E poi si rinchiude in camera e resta in silenzio per ore.
                                                                                                    Ora fa tante cose e parla tanto.
                                                                                                    Ma non mi sembra felice.
            
            
        -> second_char_closing_storylet ->    
        -> close
            
     = exit
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    
    {
        - contentsNest hasnt fireGlyph:
        {charTag(SecondCharacter, characterPortraitsManagement(SecondCharacter))}:    Ah {player_name}, prima ho trovato una cosa in giro.
                                                                                    O forse l'ho rubata.
                                                                                    Ma ho pensato che magari tu ci cavi qualcosa.
                                                                                    Devo iniziare a comportarmi diversamente, mi sa. 
                                                                                    Vero?
        {
            - player_accessiblePlaces has Nest: 
                Ho chiesto a Franco di lasciartela nel nido.
            
            - else: 
                Stavo per dartela direttamente, ma Franco mi ha detto che te l'avrebbe fatta trovare quando ti sarà servita.
        }
        ~ move_entity(fireGlyph, Nest)

    }
            
    -> close



    = close
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    
        
        {charTag(SecondCharacter, characterPortraitsManagement(SecondCharacter))}:                Torno a casa, {player_name}.
                                                                                                Non so cosa mi aspetta.
                                                                                                Spero un po' di dolci.
                                                                                                Ma te lo farò sapere, promesso!
                                                                                                Mi mancherai, sia?
                                                                                                Salutami Franco!
                                                                                                E {charNameFive}.
        {
            - firstChar_storyStatus == story_storyStarted:
                                                        E super {charNameOne}.

        }
        {
            - thirdChar_storyStatus == story_storyStarted:
                                                        E anche {charNameThree}.

        }
            
    -> second_char_closing_storylet ->    
    -> endingPNGstory(SecondCharacter)
