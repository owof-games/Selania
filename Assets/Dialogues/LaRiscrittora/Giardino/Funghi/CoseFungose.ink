=== plant_check
{
    - fungoProposto has licheneDegliAbissi:
    {
        - inCrescita <2: -> lichene_degli_abissi.step_zero
        - inCrescita <5: -> lichene_degli_abissi.step_uno
        - inCrescita <8: -> lichene_degli_abissi.step_due
        - inCrescita <10: -> lichene_degli_abissi.step_tre
        - inCrescita <20: -> lichene_degli_abissi.step_quattro
    }

    - fungoProposto has muschioDelleAmanti:
    {
        - inCrescita <2: -> muschio_delle_amanti.step_zero
        - inCrescita <5: -> muschio_delle_amanti.step_uno
        - inCrescita <8: -> muschio_delle_amanti.step_due
        - inCrescita <10: -> muschio_delle_amanti.step_tre
        - inCrescita <20: -> muschio_delle_amanti.step_quattro
    }

    - fungoProposto has cantoDelleCompagne:
    {
        - inCrescita <2: -> canto_delle_compagne.step_zero    
        - inCrescita <5: -> canto_delle_compagne.step_uno
        - inCrescita <8: -> canto_delle_compagne.step_due
        - inCrescita <10: -> canto_delle_compagne.step_tre
        - inCrescita <20: -> canto_delle_compagne.step_quattro
    }

    - fungoProposto has laSpazzata:
    {
        - inCrescita <2: -> la_spazzata.step_zero 
        - inCrescita <5: -> la_spazzata.step_uno
        - inCrescita <8: -> la_spazzata.step_due
        - inCrescita <10: -> la_spazzata.step_tre
        - inCrescita <20: -> la_spazzata.step_quattro
    }

    - fungoProposto has baccaDellaAddolorata:
    {
        - inCrescita <2: -> bacca_della_addolorata.step_zero 
        - inCrescita <5: -> bacca_della_addolorata.step_uno
        - inCrescita <8: -> bacca_della_addolorata.step_due
        - inCrescita <10: -> bacca_della_addolorata.step_tre
        - inCrescita <20: -> bacca_della_addolorata.step_quattro
    }

    - fungoProposto has nonTiScordarDiTe:
    {
        - inCrescita <2: -> non_ti_scordar_di_te.step_zero     
        - inCrescita <5: -> non_ti_scordar_di_te.step_uno
        - inCrescita <8: -> non_ti_scordar_di_te.step_due
        - inCrescita <10: -> non_ti_scordar_di_te.step_tre
        - inCrescita <20: -> non_ti_scordar_di_te.step_quattro
    }
}


=== lichene_degli_abissi
//Collaborazione, ciclicità, cancellazione
//Outcome: allontana qualcuno.
    = step_zero
        <i>Una punticina bluastra emerge dal terreno.</i>
        -> main
    
    = step_uno
        <i>Un odore salmastro si diffonde per la serra.</i>
        <i>Ora la punta è più grande, e attorno c'è un foro circolare.</i>
          -> main
          
    = step_due
        <i>Il foro ha le dimensioni di un pugno, mentre la punta sembra roteare nell'aria a incredibile velocità, completamente silenziosa.</i>
          -> main
          
    = step_tre
        <i>Eccolo qui. Un Lichene degli abissi.
        Il lichene degli abissi è una danza, un roteare costante di fungo ed alga. Un ripetersi anche nell'errore, nel dolore.
        Alga e fungo girano e rigirano senza mai afferrarsi.
        Se qualcuno sfiora il lichene, questo è destinato a scomparire.</i>
            
            + + [Tocco il lichene]
                <i> Un piccolo sbuffo. Le tue dita ora sanno di mare.
                Il lichene è scomparso, tu no.
                C'è qualcuno che devi allontanare?</i>
                    ~ inCrescita = 0
                    ~ fungoProposto = ()
            + + [Lo lascio dov'è]
            - -
              -> main
              
    = step_quattro
        <i>Troppo tempo è passato, e non rimane che un foro nel terreno.</i>
            ~ inCrescita = 0
            ~ fungoProposto = ()
              -> main

=== muschio_delle_amanti
//Collaborazione, novità, ricordo
//Outcome: datti piacere
    = step_zero
        <i>È solo una tua impressione, o i rami hanno iniziato a brillare?</i>
        -> main
    
    = step_uno
        <i>C'è una polvere ramata, brillante, che scende da alcuni rami.</i>
          -> main
          
    = step_due
        <i>La polvere si è intrecciata, arrotolata, come a formare dei fili.</i>
          -> main
    
    = step_tre
        <i>Senti un fremito nel ventre. I rami ora sono coperti da un fitto tappeto del color dell'alba.
        Quando lo sfiori le tue labbra tremano, ricordi ti invadono: quel bacio, quelle dita desiderate tra le coscie.
        Pienezza ti riempie: è per forza del Muschio delle amanti.
        Potresti portarne un po' con te, sapendo che sparirà.</i>
        O lasciarlo qui sull'albero.
            
            + + [Raccolgo un po' del muschio]
                Così vicino, il muschio ti chiama.
                Ti invita a fermare per un attimo tutto, a premiare come più ti piace il tuo corpo, dentro o fuori che sia.
                    ~ inCrescita = 0
                    ~ fungoProposto = ()
                    {
                        - doniTrovati hasnt muschiodelleamanti:
                        ~ doniTrovati += muschiodelleamanti
                    }
            + + [Non è ancora il momento]
            - -
             -> main
    
    = step_quattro
        <i>Qualcosa ti titilla lo stomaco, ma qualunque cosa stesse crescendo, non c'è più.</i>
                ~ inCrescita = 0
                ~ fungoProposto = ()
            -> main

=== canto_delle_compagne
//Collaborazione, ciclicità, ricordo
//Outcome: canta, sola o con le compagne
    = step_zero
        <i>Qualcosa vibra e ti sveglia le gambe.
        Hai voglia di danzare.</i>
        -> main
        
    = step_uno
        <i>Piccole palline rosse sul terreno caldo.
        L'umidità evapora creando una nebbiolina rossastra.</i>
          -> main
          
    = step_due
        <i>Le palline ondeggiano nella nebbia ora, sospinte da un vento invisibile.
        Si rincorrono e si tuffano sul terreno, facendo come un suono di risata.</i>
          -> main
          
    = step_tre
        <i>La serra tutta si è fatta rossa, uno stupendo Canto delle compagnegalleggia sul terreno.
        In un altro tempo, più pauroso, questo fungo veniva chiamato
        "Canto delle streghe".
        L'euforia ti riempie i polmoni, senti la gioia di sapere che non sei mai stata davvero sola.
        Hai voglia di cantare.
        Questo spingerà il fungo altrove, verso altre streghe, altre compagne.</i>
        
        + + [È il momento di cantare]
                <i>Puoi farlo da te, o chiamare qualcuno a cui tieni.
                Riempiti dell'euforia del fungo, e lascia che il mondo intero ascolti la tua voce.
                Con l'ultima nota, il fungo sarà altrove, da un'altra compagna bisognosa.</i>
                    ~ inCrescita = 0
                    ~ fungoProposto = ()
                    -> main
        + + [No, non ora]
              -> main
              
    = step_quattro
        <i>Rimane un coro lontano dell'aria, nulla di più.</i>
            ~ inCrescita = 0
            ~ fungoProposto = ()
            -> main

=== la_spazzata
//Indipendenza, novità, cancellazione
//Outcome: prometti di dire qualcosa che ti pesa sullo stomaco.
    = step_zero
        <i>Uh. Non vedi nulla. Forse qualcosa è andato storto?</i>
            -> main
         
    = step_uno
         <i>La serra è vuota, eppure qualcosa è cambiato.</i>
            -> main
    
    = step_due
        <i>Le luci sono più tenui.
        Il soffitto di rami sfiora la tua testa.</i>
            -> main
    
    = step_tre
        <i>Tutto scricchiola, gli alberi sembrano gemere dal dolore.
        Il terreno stesso è impacciato, crepato.
        Ora riconosci cosa hai piantato: una grossa, esplosiva <i>Spazzata</i>.
        La Spazzata non è un fungo, non è una pianta, ma è un insieme di tutte queste cose.
        E se non viene fatta sfogare, esploderà spazzando via tutta la serra.</i>
        
        + + [Bene: facciamola sfogare!]
            <i>Questa è la parte più facile: basta prometterle che dirai a qualcuno qualcosa che senti sullo stomaco. Qualcosa che sono giorni o settimane (uh: questa Spazzata è molto grande. forse mesi?) che ti pesa.
                Falle la promessa, e se ne andrà.
                Ma se poi tradisci la promessa, la Spazzata tornerà ancora più forte.</i>
                    ~ inCrescita = 0
                    ~ fungoProposto = ()
                    -> main
        + + [Non ora]
            -> main
    
    = step_quattro
        <i>Il soffitto di rami sembra incavato. Ciò che c'era, ora non è più.</i>
            ~ inCrescita = 0
            ~ fungoProposto = ()    
          -> main


=== bacca_della_addolorata
//Indipendenza, novità, cancellazione
//Outcome: liberazione, invito ad avanzare
    = step_zero
        <i>Cinque punte scure emergono dal terreno.</i>
            -> main
    
    = step_uno
        <i>Una mano rugosa stritola il terreno, le sue dita sembrano arrivare a infinita profondità.</i>
            -> main
    
    = step_due
        <i>Dalla troncatura della mano emergono piccoli rami ricolmi di fiorellini bianchi. Ogni volta che espiri, un fiorellino vola via.</i>
          -> main
          
    = step_tre
        <i>Nè rami, nè fiori. Solo la mano, e una piccolissima bacca vermiglia.
        Hai trovato una <i>Bacca dell'addolorata</i>. Una pianta cara a chi ha finalmente trovato la sua strada, ma non riesce ad avanzare.
        La sua bacca aiuta a capire cosa ci vincola, cosa non ci lascia allontanare.</i>
            
            + + [La afferro]
            <i>La mano molla la sua presa, rivelandosi per quel che era dall'inizio: solo un insieme tenace di radici.
            Senti dalle tue spalle qualcosa sciogliersi, scivolare via: ora hai un po' meno paura di camminare.</i>
                ~ inCrescita = 0
                ~ fungoProposto = ()
                    {
                        - doniTrovati hasnt baccadellaaddolorata:
                        ~ doniTrovati += baccadellaaddolorata
                    }
            
                -> main
            + + [Non è il momento]
                -> main
              
    = step_quattro
        <i>Una mano tremante nel terreno, rinsecchita. Si sbriciola al primo soffio d'aria.</i>          
            ~ inCrescita = 0
            ~ fungoProposto = ()
            -> main

=== non_ti_scordar_di_te
//Indipendenza, ciclicità, ricordo
//Outcome: ricordo di chi non c'è più
    = step_zero
        <i>Su uno dei tronchi a terra è comparsa una sostanza viscosa, gelatinosa.</i>
            -> main
    
    = step_uno
        <i>La sostanza si è espansa.
        Non è invitante al tatto, ma l'aria attorno ti ricorda qualcosa: sigaro, tabacco forse?
        O è canfora? O addirittura torta, o rabarbaro, o caffè.
        Qualunque cosa sia, ti piace.</i>
          -> main
          
    = step_due
        <i>La sostanza si è solidificata, e nel farlo il tronco è in più punti sparito.
        No, non sparito: è trasparente.
        Fili di vetro sembrano puntare verso il cielo.</i>
          -> main
          
    = step_tre
        <i>Tronco e sostanza sono una cosa sola: un fungo di vetro, dita che si sfiora e intrecciano lanciate verso il cielo.
        Hai trovato un <i>Non ti scordar di te</i>.
        Cresce su ciò che è passato, che non c'è più, per renderlo parte di sè.
        Qualcosa di nuovo, eppure antico.
        Quando sfiorisce, il ciclo ricomincia.</i>
        
        + + [Intreccio le tue dita alle sue]
            <i>Si sciolgono tra le tue mani, rilasciando di nuovo un profumo familiare.
            Ti porti quel che rimane alle labbra: il tuo corpo viene invaso da fiducia e calore.
            Senti in te chi non c'è più: siete parte della stessa storia.</i>
                ~ inCrescita = 0
                ~ fungoProposto = ()
              -> main
        + + [Non ora]
              -> main
              
    = step_quattro
        <i>Malinconia. La sensazione di aver fatto tardi, di aver perso qualcosa di importante.</i>
            ~ inCrescita = 0
            ~ fungoProposto = ()
        -> main