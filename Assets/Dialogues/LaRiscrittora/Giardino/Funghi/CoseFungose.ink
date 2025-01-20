=== plant_check
TODO: probabilmente ha più senso fare uno script come quello per l'albero e bona, così ho un solo oggetto.
LIST growStep = stepZero, stepUno, stepDue, stepTre
{
    - growStep has stepZero:
        ~ growStep = ()
        ~ growStep += stepZero
    - growStep has stepUno:
        ~ growStep = ()
        ~ growStep += stepUno    
    - growStep has stepDue:
        ~ growStep = ()
        ~ growStep += stepDue
    - inCrescita > 8:
        ~ growStep = ()
        ~ growStep += stepTre

}

{
    - fungoProposto has LicheneDegliAbissi:
    {
        - growStep has stepZero:
            //~ move_entity(LicheneDegliAbissiSZ, Funghi)
            -> lichene_degli_abissi.step_zero
        - growStep has stepUno:
            //~ move_entity(LicheneDegliAbissiSZ, CasettaAnime)
            //~ move_entity(LicheneDegliAbissiSU, Funghi)
            -> lichene_degli_abissi.step_uno
        - growStep has stepDue:
            //~ move_entity(LicheneDegliAbissiSU, CasettaAnime)
            //~ move_entity(LicheneDegliAbissiSD, Funghi)
            -> lichene_degli_abissi.step_due
        - growStep has stepTre:
            //~ move_entity(LicheneDegliAbissiSD, CasettaAnime)
            ~ move_entity(LicheneDegliAbissi, Funghi)
            -> lichene_degli_abissi.step_tre
        // - growStep has stepTre:: -> lichene_degli_abissi.step_quattro
    }

    - fungoProposto has MuschioDelleAmanti:
    {
        - growStep has stepZero: -> muschio_delle_amanti.step_zero
        - growStep has stepUno: -> muschio_delle_amanti.step_uno
        - growStep has stepDue: -> muschio_delle_amanti.step_due
        - growStep has stepTre::
             ~ move_entity(MuschioDelleAmanti, Funghi)
            -> muschio_delle_amanti.step_tre
        // - growStep has stepTre:: -> muschio_delle_amanti.step_quattro
    }

    - fungoProposto has CantoDelleCompagne:
    {
        - growStep has stepZero: -> canto_delle_compagne.step_zero    
        - growStep has stepUno: -> canto_delle_compagne.step_uno
        - growStep has stepDue: -> canto_delle_compagne.step_due
        - growStep has stepTre::
             ~ move_entity(CantoDelleCompagne, Funghi)
            -> canto_delle_compagne.step_tre
        // - growStep has stepTre:: -> canto_delle_compagne.step_quattro
    }

    - fungoProposto has LaSpazzata:
    {
        - growStep has stepZero: -> la_spazzata.step_zero 
        - growStep has stepUno: -> la_spazzata.step_uno
        - growStep has stepDue: -> la_spazzata.step_due
        - growStep has stepTre::
             ~ move_entity(LaSpazzata, Funghi)
            -> la_spazzata.step_tre
        // - growStep has stepTre:: -> la_spazzata.step_quattro
    }

    - fungoProposto has BaccaDellaAddolorata:
    {
        - growStep has stepZero: -> bacca_della_addolorata.step_zero 
        - growStep has stepUno: -> bacca_della_addolorata.step_uno
        - growStep has stepDue: -> bacca_della_addolorata.step_due
        - growStep has stepTre::
             ~ move_entity(BaccaDellaAddolorata, Funghi)
            -> bacca_della_addolorata.step_tre
        // - growStep has stepTre:: -> bacca_della_addolorata.step_quattro
    }

    - fungoProposto has NonTiScordarDiTe:
    {
        - growStep has stepZero: -> non_ti_scordar_di_te.step_zero     
        - growStep has stepUno: -> non_ti_scordar_di_te.step_uno
        - growStep has stepDue: -> non_ti_scordar_di_te.step_due
        - growStep has stepTre::
             ~ move_entity(NonTiScordarDiTe, Funghi)
            -> non_ti_scordar_di_te.step_tre
        //- growStep has stepTre:: -> non_ti_scordar_di_te.step_quattro
    }

    - fungoProposto has BrinaDellImpossibile:
    {
        - growStep has stepZero: -> brina_dell_impossibile.step_zero     
        - growStep has stepUno: -> brina_dell_impossibile.step_uno
        - growStep has stepDue: -> brina_dell_impossibile.step_due
        - growStep has stepTre::
             ~ move_entity(BrinaDellImpossibile, Funghi)
            -> brina_dell_impossibile.step_tre
        //- growStep has stepTre:: -> brina_dell_impossibile.step_quattro
    }    
    ->->
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
    // + {are_two_entities_together(LicheneDegliAbissi, PG)} [LicheneDegliAbissi]
        <i>Eccolo qui. Un <b>Lichene degli abissi</b></i>
        <i>Il lichene degli abissi è una danza, un roteare costante di fungo ed alga. Un ripetersi anche nell'errore, nel dolore.</i>
        <i>Alga e fungo girano e rigirano senza mai afferrarsi.</i>
        <i>Se qualcuno sfiora il lichene, questo è destinato a scomparire.</i>
            
            + [Tocco il lichene.]
                <i> Un piccolo sbuffo. Le tue dita ora sanno di mare.</i>
                <i>Il lichene è scomparso, tu no.</i>
                <i>C'è qualcuno che devi allontanare?</i>
                    //~ move_entity(LicheneDegliAbissi, CasettaAnime)
                    ~ inCrescita = 0
                    ~ fungoProposto = ()
            + [Lo lascio dov'è.]
            -
              -> main
              
    // = step_quattro
    //     <i>Troppo tempo è passato, e non rimane che un foro nel terreno.</i>
    //         //~ move_entity(LicheneDegliAbissi, CasettaAnime)
    //         ~ inCrescita = 0
    //         ~ fungoProposto = ()
    //           -> main

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
    // + {are_two_entities_together(MuschioDelleAmanti, PG)} [MuschioDelleAmanti]
        <i>Senti un fremito nel ventre. I rami ora sono coperti da un fitto tappeto del color dell'alba.</i>
        <i>Quando lo sfiori le tue labbra tremano, ricordi ti invadono: quel bacio, quelle dita desiderate tra le coscie.</i>
        <i>Pienezza ti riempie: è per forza del <b>Muschio delle amanti</b></i>.
        <i>Potresti portarne un po' con te, sapendo che sparirà.</i>
        <i>O lasciarlo qui sull'albero.
            
            + [Raccolgo un po' del muschio.]
                <i>Così vicino, il muschio ti chiama.</i>
                <i>Ti invita a fermare per un attimo tutto, a premiare come più ti piace il tuo corpo, dentro o fuori che sia.</i>
                    //~ move_entity(MuschioDelleAmanti, CasettaAnime)
                    ~ inCrescita = 0
                    ~ fungoProposto = ()
                    {
                        - doniTrovati hasnt MuschioDelleAmanti:
                        ~ doniTrovati += MuschioDelleAmanti
                    }
            + [Non è ancora il momento.]
            -
             -> main
    
    // = step_quattro
    //     <i>Qualcosa ti titilla lo stomaco, ma qualunque cosa stesse crescendo, non c'è più.</i>
    //             //~ move_entity(MuschioDelleAmanti, CasettaAnime)
    //             ~ inCrescita = 0
    //             ~ fungoProposto = ()
    //         -> main

=== canto_delle_compagne
//Collaborazione, ciclicità, ricordo
//Outcome: canta, sola o con le compagne
    = step_zero
        <i>Qualcosa vibra e ti sveglia le gambe.<i>
        <i>Hai voglia di danzare.</i>
            -> main
        
    = step_uno
        <i>Piccole palline rosse sul terreno caldo.</i>
        <i>L'umidità evapora creando una nebbiolina rossastra.</i>
          -> main
          
    = step_due
        <i>Le palline ondeggiano nella nebbia ora, sospinte da un vento invisibile.</i>
        <i>Si rincorrono e si tuffano sul terreno, facendo come un suono di risata.</i>
            -> main
          
    = step_tre
    // + {are_two_entities_together(CantoDelleCompagne, PG)} [CantoDelleCompagne]
        <i>La serra tutta si è fatta rossa, uno stupendo <b>Canto delle compagne</b> galleggia sul terreno.</i>
        <i>In un altro tempo, più pauroso, questo fungo veniva chiamato "Canto delle streghe".</i>
        <i>L'euforia ti riempie i polmoni, senti la gioia di sapere che non sei mai stata davvero sola.</i>
        <i>Hai voglia di cantare.</i>
        <i>Questo spingerà il fungo altrove, verso altre streghe, altre compagne.</i>
        
        + [È il momento di cantare.]
                <i>Puoi farlo da te, o chiamare qualcuno a cui tieni.
                Riempiti dell'euforia del fungo, e lascia che il mondo intero ascolti la tua voce.
                Con l'ultima nota, il fungo sarà altrove, da un'altra compagna bisognosa.</i>
                    //~ move_entity(CantoDelleCompagne, CasettaAnime)
                    ~ inCrescita = 0
                    ~ fungoProposto = ()
                    -> main
        + [No, non ora.]
              -> main
              
    // = step_quattro
    //     <i>Rimane un coro lontano dell'aria, nulla di più.</i>
    //             //~ move_entity(CantoDelleCompagne, CasettaAnime)
    //         ~ inCrescita = 0
    //         ~ fungoProposto = ()
    //         -> main

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
        <i>Le luci sono più tenui.</i>
        <i>Il soffitto di rami sfiora la tua testa.</i>
            -> main
    
    = step_tre
    // + {are_two_entities_together(LaSpazzata, PG)} [LaSpazzata]
        <i>Tutto scricchiola, gli alberi sembrano gemere dal dolore.
        Il terreno stesso è impacciato, crepato.</i>
        <i>Ora riconosci cosa hai piantato: una grossa, esplosiva <b>Spazzata</b></i>.
        <i>La Spazzata non è un fungo, non è una pianta, ma è un insieme di tutte queste cose.</i>
        <i>E se non viene fatta sfogare, esploderà spazzando via tutta la serra.</i>
        
        + [Bene: facciamola sfogare!]
            <i>Questa è la parte più facile: basta prometterle che dirai a qualcuno qualcosa che senti sullo stomaco.
            <i>Qualcosa che sono giorni o settimane (uh: questa Spazzata è molto grande. forse mesi?) che ti pesa.</i>
            <i>Falle la promessa, e se ne andrà.</i>
            <i>Ma se poi tradisci la promessa, la Spazzata tornerà ancora più forte.</i>
                    //~ move_entity(LaSpazzata, CasettaAnime)
                    ~ inCrescita = 0
                    ~ fungoProposto = ()
                    -> main
        + [Non ora.]
            -> main
    
    // = step_quattro
    //     <i>Il soffitto di rami sembra incavato. Ciò che c'era, ora non è più.</i>
    //         //~ move_entity(LaSpazzata, CasettaAnime)
    //         ~ inCrescita = 0
    //         ~ fungoProposto = ()    
    //       -> main


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
    // + {are_two_entities_together(BaccaDellaAddolorata, PG)} [BaccaDellaAddolorata]
        <i>Nè rami, nè fiori. Solo la mano, e una piccolissima bacca vermiglia.<i>
        <i>Hai trovato una <b>Bacca dell'addolorata</b></i>
        <i>Una pianta cara a chi ha finalmente trovato la sua strada, ma non riesce ad avanzare</i>
        <i>La sua bacca aiuta a capire cosa ci vincola, cosa non ci lascia allontanare.</i>
            
            + [La afferro.]
            <i>La mano molla la sua presa, rivelandosi per quel che era dall'inizio: solo un insieme tenace di radici.</i>
            <i>Senti dalle tue spalle qualcosa sciogliersi, scivolare via: ora hai un po' meno paura di camminare.</i>
                //~ move_entity(BaccaDellaAddolorata, CasettaAnime)
                ~ inCrescita = 0
                ~ fungoProposto = ()
                    {
                        - doniTrovati hasnt BaccaDellaAddolorata:
                        ~ doniTrovati += BaccaDellaAddolorata
                    }
            
                -> main
            + [Non è il momento.]
                -> main
              
    // = step_quattro
    //     <i>Una mano tremante nel terreno, rinsecchita. Si sbriciola al primo soffio d'aria.</i>
    //         //~ move_entity(BaccaDellaAddolorata, CasettaAnime)
    //         ~ inCrescita = 0
    //         ~ fungoProposto = ()
    //         -> main

=== non_ti_scordar_di_te
//Indipendenza, ciclicità, ricordo
//Outcome: ricordo di chi non c'è più
    = step_zero
        <i>Su uno dei tronchi a terra è comparsa una sostanza viscosa, gelatinosa.</i>
            -> main
    
    = step_uno
        <i>La sostanza si è espansa.</i>
        <i>Non è invitante al tatto, ma l'aria attorno ti ricorda qualcosa: sigaro, tabacco forse?</i>
        <i>O è canfora? O addirittura torta, o rabarbaro, o caffè.
        <i>Qualunque cosa sia, ti piace.</i>
          -> main
          
    = step_due
        <i>La sostanza si è solidificata, e nel farlo il tronco è in più punti sparito.</i>
        <i>No, non sparito: è trasparente.</i>
        <i>Fili di vetro sembrano puntare verso il cielo.</i>
          -> main
          
    = step_tre
    // + {are_two_entities_together(NonTiScordarDiTe, PG)} [NonTiScordarDiTe]
        <i>Tronco e sostanza sono una cosa sola: un fungo di vetro, dita che si sfiorano e intrecciano lanciate verso il cielo.</i>
        <i>Hai trovato un <i><b>Non ti scordar di te</b></i>
        <i>Cresce su ciò che è passato, che non c'è più, per renderlo parte di sè.</i>
        <i>Qualcosa di nuovo, eppure antico.</i>
        <i>Quando sfiorisce, il ciclo ricomincia.</i>
        
        + [Intreccio le mie dita alle sue.]
            <i>Si sciolgono tra le tue mani, rilasciando di nuovo un profumo familiare.</i>
            <i>Ti porti quel che rimane alle labbra: il tuo corpo viene invaso da fiducia e calore.</i>
            <i>Senti in te chi non c'è più: siete parte della stessa storia.</i>
                //~ move_entity(NonTiScordarDiTe, CasettaAnime)
                ~ inCrescita = 0
                ~ fungoProposto = ()
              -> main
        + [Non ora.]
              -> main
              
    // = step_quattro
    //     <i>Malinconia. La sensazione di aver fatto tardi, di aver perso qualcosa di importante.</i>
    //         //~ move_entity(NonTiScordarDiTe, CasettaAnime)
    //         ~ inCrescita = 0
    //         ~ fungoProposto = ()
    //     -> main
        

=== brina_dell_impossibile
//Ricordo, collaborazione, novità
//Outcome: prova una strada nuova
    = step_zero
        <i>Le vetrate della serra sembrano più opache.</i>
            -> main
    
    = step_uno
        <i>Al centro di una delle vetrate è comparso quello che sembra un foro.</i>
          -> main
          
    = step_due
        <i>Il foro si è trasformato in un reticolato irregolare.</i>
          -> main
    
    = step_tre
    // + {are_two_entities_together(BrinaDellImpossibile, PG)} [BrinaDellImpossibile]
        <i>Isole di vetro galleggiano nell'aria.</i>
        <i>La vetrata dovrebbe crollare, sparire, svanire ma invece resta dov'è, e se la spingi non si sposta.</i>
        <i>Eppure api e petali attraversano il reticolato.</i>
        <i>E quando provi a infilarci un dito, un ricordo imprevisto: sai che questa cosa si chiama <b>Brina dell'Impossibile</b></i>.
        <i>Sai che puoi raccoglierla, anche se non sai cosa accadrà.</i>
        
        + [Infilo la mano tra quegli spazi vuoti.]
            <i>Il vetro si rinsalda, spingendo via la tua mano.</i>
            <i>Le linee del tuo palmo si fanno trasparenti, inconsistenti. Eppure puoi muovere le dita, e non provi alcun dolore.</i>
            <i>Non tutti i cambiamenti sono così facili, ma ora hai la certezza che puoi provare quella cosa che rimandi da sempre: la paura di trovarti a pezzi è solo quello: paura.</i>
                //~ move_entity(BrinaDellImpossibile, CasettaAnime)
                ~ inCrescita = 0
                ~ fungoProposto = ()
                    {
                        - doniTrovati hasnt BrinaDellImpossibile:
                        ~ doniTrovati += BrinaDellImpossibile
                    }                
              -> main
        + [Ho bisogno di pensarci un poco.]
              -> main
              
    // = step_quattro
    //     <i>Non noti nulla di strano. Qualcosa è cambiato, senza che te ne accorgessi.</i>
    //         //~ move_entity(BrinaDellImpossibile, CasettaAnime)
    //         ~ inCrescita = 0
    //         ~ fungoProposto = ()

                        
    //     -> main      
          

-> main