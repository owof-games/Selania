//Nota: i coltivabili ad ora crescono o entrando e uscendo dalla serra, o finendo un blocco narrativo di una personaggia (es: talking_with_char_two.one).

=== growing_check
{
    - growing < 2:
        ~ growStep = ()
        ~ growStep += stepZero
    - growing < 3:
        ~ growStep = ()
        ~ growStep += stepOne    
    - growing < 4:
        ~ growStep = ()
        ~ growStep += stepTwo
    - else:
        ~ growStep = ()
        ~ growStep += stepThree

}
{
    - chosenCultivable has LicheneDegliAbissi:
    {
        - growStep has stepZero:
            ~ statoLicheneDegliAbissi = stepZero
        - growStep has stepOne:
            ~ statoLicheneDegliAbissi = stepOne
        - growStep has stepTwo:
            ~ statoLicheneDegliAbissi = stepTwo
        - growStep has stepThree:
            ~ statoLicheneDegliAbissi = stepThree
    }

    - chosenCultivable has MuschioDelleAmanti:
    {
        - growStep has stepZero:
            ~ statoMuschioDelleAmanti = stepZero
        - growStep has stepOne:
            ~ statoMuschioDelleAmanti = stepOne
        - growStep has stepTwo:
            ~ statoMuschioDelleAmanti = stepTwo
        - growStep has stepThree:
             ~ statoMuschioDelleAmanti = stepThree
    }

    - chosenCultivable has CantoDelleCompagne:
    {
        - growStep has stepZero:
            ~ statoCantoDelleCompagne = stepZero
        - growStep has stepOne:
            ~ statoCantoDelleCompagne = stepOne
        - growStep has stepTwo:
            ~ statoCantoDelleCompagne = stepTwo
        - growStep has stepThree:
             ~ statoCantoDelleCompagne = stepThree
    }

    - chosenCultivable has LaSpazzata:
    {
        - growStep has stepZero:
            ~ statoLaSpazzata = stepZero
        - growStep has stepOne:
            ~ statoLaSpazzata = stepOne
        - growStep has stepTwo:
            ~ statoLaSpazzata = stepTwo
        - growStep has stepThree:
            ~ statoLaSpazzata = stepThree
    }

    - chosenCultivable has BaccaDellaAddolorata:
    {
        - growStep has stepZero:
            ~ statoBaccaDellaAddolorata = stepZero
        - growStep has stepOne:
            ~ statoBaccaDellaAddolorata = stepOne
        - growStep has stepTwo:
            ~ statoBaccaDellaAddolorata = stepTwo
        - growStep has stepThree:
            ~ statoBaccaDellaAddolorata = stepThree
    }

    - chosenCultivable has NonTiScordarDiTe:
    {
        - growStep has stepZero:
            ~ statoNonTiScordarDiTe = stepZero
        - growStep has stepOne:
            ~ statoNonTiScordarDiTe = stepOne
        - growStep has stepTwo:
            ~ statoNonTiScordarDiTe = stepTwo
        - growStep has stepThree:
            ~ statoNonTiScordarDiTe = stepThree
    }

    - chosenCultivable has BrinaDellImpossibile:
    {
        - growStep has stepZero:
            ~ statoBrinaDellImpossibile = stepZero
        - growStep has stepOne:
            ~ statoBrinaDellImpossibile = stepOne
        - growStep has stepTwo:
            ~ statoBrinaDellImpossibile = stepTwo
        - growStep has stepThree:
             ~ statoBrinaDellImpossibile = stepThree
    }    
    ->->
}

->->

=== plant_check
{
    - chosenCultivable has LicheneDegliAbissi:
    {
        - statoLicheneDegliAbissi == stepZero:
            -> lichene_degli_abissi.step_zero
        - statoLicheneDegliAbissi == stepOne:
            -> lichene_degli_abissi.step_uno
        - statoLicheneDegliAbissi == stepTwo:
            -> lichene_degli_abissi.step_due
        - statoLicheneDegliAbissi == stepThree:
            -> lichene_degli_abissi.step_tre
    }

    - chosenCultivable has MuschioDelleAmanti:
    {
        - statoMuschioDelleAmanti == stepZero:
            -> edera_delle_amanti.step_zero
        - statoMuschioDelleAmanti == stepOne:
            -> edera_delle_amanti.step_uno
        - statoMuschioDelleAmanti == stepTwo:
            -> edera_delle_amanti.step_due
        - statoMuschioDelleAmanti == stepThree:
            -> edera_delle_amanti.step_tre
    }

    - chosenCultivable has CantoDelleCompagne:
    {
        - statoCantoDelleCompagne == stepZero:
            -> canto_delle_compagne.step_zero    
        - statoCantoDelleCompagne == stepOne:
            -> canto_delle_compagne.step_uno
        - statoCantoDelleCompagne == stepTwo:
            -> canto_delle_compagne.step_due
        - statoCantoDelleCompagne == stepThree:
            -> canto_delle_compagne.step_tre
    }

    - chosenCultivable has LaSpazzata:
    {
        - statoLaSpazzata == stepZero:
            -> la_spazzata.step_zero 
        - statoLaSpazzata == stepOne:
            -> la_spazzata.step_uno
        - statoLaSpazzata == stepTwo:
            -> la_spazzata.step_due
        - statoLaSpazzata == stepThree:
            -> la_spazzata.step_tre
    }

    - chosenCultivable has BaccaDellaAddolorata:
    {
        - statoBaccaDellaAddolorata == stepZero:
            -> bacca_della_addolorata.step_zero
        - statoBaccaDellaAddolorata == stepOne:
            -> bacca_della_addolorata.step_uno
        - statoBaccaDellaAddolorata == stepTwo:
            -> bacca_della_addolorata.step_due
        - statoBaccaDellaAddolorata == stepThree:
            -> bacca_della_addolorata.step_tre
    }

    - chosenCultivable has NonTiScordarDiTe:
    {
        - statoNonTiScordarDiTe == stepZero:
            -> non_ti_scordar_di_te.step_zero     
        - statoNonTiScordarDiTe == stepOne:
            -> non_ti_scordar_di_te.step_uno
        - statoNonTiScordarDiTe == stepTwo:
            -> non_ti_scordar_di_te.step_due
        - statoNonTiScordarDiTe == stepThree:
            -> non_ti_scordar_di_te.step_tre
    }

    - chosenCultivable has BrinaDellImpossibile:
    {
        - statoBrinaDellImpossibile == stepZero:
            -> brina_dell_impossibile.step_zero     
        - statoBrinaDellImpossibile == stepOne:
            -> brina_dell_impossibile.step_uno
        - statoBrinaDellImpossibile == stepTwo:
            -> brina_dell_impossibile.step_due
        - statoBrinaDellImpossibile == stepThree:
            -> brina_dell_impossibile.step_tre
    }    
    -> main
}

=== lichene_degli_abissi
//Collaborazione, ciclicità, cancellazione
//Outcome: allontana qualcuno.
    = step_zero
        ~ statoLicheneDegliAbissi = stepZero
        <i>Qualcosa vortica sopra al vaso.</i>
        <i>La terra si accumla ai lati, lasciando un incavo nel terreno.</i>
        -> main
    
    = step_uno
        <i>Un odore salmastro si diffonde per la serra.</i>
        <i>Una punticina bluastra emerge dal terreno.</i>
          -> main
          
    = step_due
        <i>Le punte sono aumentate, e roteano nell'aria a incredibile velocità, senza alcun rumore.</i>
          -> main
          
    = step_tre
        <i>L'odore è così forte da farti lacrimare gli occhi.</i>
        <i>Davanti a te vortica un <b>Lichene degli abissi</b></i>
        <i>Il lichene degli abissi è una danza, un roteare incessante di fungo e alga.</i>
        <i>Si inseguono nel piacere, si inseguono nel dolore, senza mai afferrarsi.</i>
        <i>Forti nella loro distruzione, estremamente fragili.</i>

            + [Fermo il lichene.]
                ~ statoLicheneDegliAbissi = stepZero
                <i>Un piccolo sbuffo, rimane solo un foro.</i>
                <i>Le tue dita sanno di ricordo, sanno di mare.</i>
                <i>Pensi a qualcuno.</i>
                <i>A volte c'è pace solo nell'allontanare.</i>
                    ~ growing = 0
                    ~ chosenCultivable = ()
                    {
                        - findedGifts hasnt LicheneDegliAbissi:
                        ~ findedGifts += LicheneDegliAbissi
                        <i>Hai ottenuto: <b>Lichene degli Abissi.</b></i>
                    }
                    
                + + {backupCultivable != ()}[Voglio coltivare qualcosa di nuovo.]
                    -> cultivable_test
                + + [Mi aggiro per la serra.]    
                    -> main
                    
            + [Lo lascio dov'è.]
            -
              -> main
              


=== edera_delle_amanti
//Collaborazione, novità, ricordo
//Outcome: datti piacere
    = step_zero
    ~ statoMuschioDelleAmanti = stepZero
        <i>È solo una tua impressione, o il vaso ha iniziato a brillare?</i>
        -> main
    
    = step_uno
        <i>Nettare color rame sale lungo le corde che reggono il vaso.</i>
          -> main
          
    = step_due
        <i>Il nettare si è intrecciato, arrotolato, cerca le venature del legno della serra.</i>
        <i>Lo saggia, si mischia, lo penetra.</i>
        <i>Foglie rosastre nascono da questa unione.</i>
          -> main
    
    = step_tre
        <i>Calore nel ventre.</i>
        <i>Un pezzo di serra è ora coperto da un fitto tappeto del color dell'alba.</i>
        <i>Sembra la cosa più gustosa che tu abbia mai incontrato.</i>
            + [Provo a leccarlo.]
                <i>Per un attimo perdi i tuoi confini.</i>
                <i>Sei un bacio nella notte, dita desiderate tra le coscie.</i>
                <i>Sei acqua sulle labbra, pelle nuda sulla terra umida.</i>
                <i>Pienezza ti riempie, la forza dell'<b>Edera delle amanti</b></i>.
                <i>Il tuo corpo ha fame di piacere.</i>
                <i>Perditi nel desiderio.</i>
 
                    ~ growing = 0
                    ~ chosenCultivable = ()
                    {
                        - findedGifts hasnt MuschioDelleAmanti:
                        ~ findedGifts += MuschioDelleAmanti
                        <i>Hai ottenuto: <b>Muschio delle Amanti.</b></i>
                    }
                
                + + {backupCultivable != ()}[Voglio coltivare qualcosa di nuovo.]
                    -> cultivable_test
                + + [Mi aggiro per la serra.]    
                    -> main
                    
            + [Ora non me la sento.]
            -
             -> main

=== canto_delle_compagne
//Collaborazione, ciclicità, ricordo
//Outcome: danza, sola o con le compagne
    = step_zero
        ~ statoCantoDelleCompagne = stepZero
        <i>Qualcosa vibra e ti sveglia le gambe.<i>
        <i>Hai voglia di danzare.</i>
            -> main
        
    = step_uno
        <i>Il vaso è caldo al tocco.</i>
        <i>L'umidità del terreno evapora creando una nebbiolina rossastra.</i>
          -> main
          
    = step_due
        <i>La nebbia si è fatta ora goccia, goccie rosse che vibrano.</i>
        <i>Che si rincorrono e si tuffano nel vaso.</i>
        <i>E quando si scontrano, la serra riecheggia di una festosa risata.</i>
            -> main
          
    = step_tre
        <i>La serra vibra e si scuote, persino le travi sembrano voler danzare.</i>
        <i>Ilare, <b>Canto delle compagne</b> turbina e gioca sospesa sul vaso.</i>
        <i>In un altro tempo questo fungo veniva chiamato "Canto delle streghe".</i>
        <i>L'euforia ti riempie i polmoni, senti la gioia di sapere che non sei mai stata davvero {pronouns has him: solo|{pronouns has her: sola|solə}}.</i>

        + [È il momento di festeggiare.]
                <i>Il canto ti invita alla danza.</i>
                <i>Spinge le tue gambe nella stanza.</i>
                <i>O ad alzare al voce, cantare, e chiamare le compagne.</i>
                <i>Lasciando che la musica vi unisca, rendendo il mondo intero il vostro palcoscenico.</i>
                <i>Se qualcuno avrà paura, è solo perché non sa più come ballare.</i>
                    ~ growing = 0
                    ~ chosenCultivable = ()
                    {
                        - findedGifts hasnt CantoDelleCompagne:
                        ~ findedGifts += CantoDelleCompagne
                        <i>Hai ottenuto: <b>Canto delle Compagne.</b></i>
                    }
                
                + + {backupCultivable != ()}[Voglio coltivare qualcosa di nuovo.]
                    -> cultivable_test
                + + [Mi aggiro per la serra.]    
                    -> main
                    
        + [No, non ora.]
              -> main
              
=== la_spazzata
//Indipendenza, novità, cancellazione
//Outcome: prometti di dire qualcosa che ti pesa sullo stomaco.
    = step_zero
    ~ statoLaSpazzata = stepZero
        <i>Niente sembra cambiare.</i>
        <i>Eppure l'aria sembra più pesante.</i>
            -> main
         
    = step_uno
         <i>Qualcosa sembra osservarti dagli angoli più scuri della serra.</i>
         <i>L'aria ti manca, hai voglia di gridare.</i>
            -> main
    
    = step_due
        <i>C'è un forte vibrare.</i>
        <i>Cose sottili riempiono i tuoi occhi di fastidio.</i>
        <i>Della voglia di stringere, percuotere, sbattere qualcosa.</i>
            -> main
    
    = step_tre
        <i>Il tetto della serra scricchiola, le sue travi sembrano gemere dal dolore.</i>
        <i>La tua testa sembra pronta ad esplodere.</i>
        <i>Sopra di te pulsa e si contrae nervosa una grossa, esplosiva <b>Spazzata</b></i>.
        <i>La Spazzata è e non è.</i>
        <i>Si abbuffa delle cose non dette.</i>
        <i>E quando non ce la fa più, travolge ogni cosa.</i>

        + [Sfioro i suoi rami.]
            <i>Una forte contrazione.</i>
            <i>E poi si ferma, statua di ciò che un tempo era.</i>
            <i>Ti lascia in pancia un senso di vuoto.</i>
            <i>La sensazione di quando hai condiviso qualcosa che ritenevi terribile.</i>
            <i>Per poi scoprire che il mondo non è finito quella volta, e non finirà oggi.</i>
            <i>Sai già chi è la persona che ora vuoi chiamare.</i>
                    ~ growing = 0
                    ~ chosenCultivable = ()
                    {
                        - findedGifts hasnt LaSpazzata:
                        ~ findedGifts += LaSpazzata
                        <i>Hai ottenuto: <b>La Spazzata.</b></i>
                    }
                
                + + {backupCultivable != ()}[Voglio coltivare qualcosa di nuovo.]
                    -> cultivable_test
                + + [Mi aggiro per la serra.]    
                    -> main
                    
        + [Non ora.]
            -> main



=== bacca_della_addolorata
//Indipendenza, novità, cancellazione
//Outcome: liberazione, invito ad avanzare
    = step_zero
    ~ statoBaccaDellaAddolorata = stepZero
        <i>Cinque punte scure emergono dal vaso.</i>
            -> main
    
    = step_uno
        <i>Rami come dita rattrappite sembrano artigliare l'aria.</i>
            -> main
    
    = step_due
        <i>Le dita ora sono sollevate in una mano nervosa.</i>
          -> main
          
    = step_tre
        <i>La mano, ora tesa verso il cielo, sembra sguarciata da una resina rossastra.<i>
        <i>Hai trovato una <b>Bacca dell'addolorata</b>.</i>
        <i>Una pianta cara a chi ha finalmente trovato la sua strada, ma non riesce ancora ad avanzare.</i>

            + [Afferro la bacca.]
            <i>La mano molla la sua presa, rivelandosi per quel che era sin dall'inizio: solo un insieme tenace di radici.</i>
            <i>Senti le tue spalle sciogliersi, l'incertezza scivolare via.</i>
            <i>Il cambiamento fa paura, ma ora ricordi come camminare.</i>
                ~ growing = 0
                ~ chosenCultivable = ()
                    {
                        - findedGifts hasnt BaccaDellaAddolorata:
                        ~ findedGifts += BaccaDellaAddolorata
                        <i>Hai ottenuto: <b>Bacca della Addolorata</b></i>
                    }
            
                + + {backupCultivable != ()}[Voglio coltivare qualcosa di nuovo.]
                    -> cultivable_test
                + + [Mi aggiro per la serra.]    
                    -> main
                    
            + [Non è il momento.]
                -> main
              
=== non_ti_scordar_di_te
//Indipendenza, ciclicità, ricordo
//Outcome: ricordo di chi non c'è più
    = step_zero
        ~ statoNonTiScordarDiTe = stepZero
        <i>Su uno vecchio ramo è comparsa una sostanza gelatinosa, una gomma che sembra un asparago.</i>
            -> main
    
    = step_uno
        <i>Il ramo sembra più leggero, vitreo.</i>
        <i>La gelatina non è invitante al tatto, ma l'aria ha un profumo sa di, di cosa? Sigaro, tabacco forse?</i>
        <i>O è canfora? O addirittura torta, o rabarbaro, o caffè.
        <i>L'odore di un vecchio e fidato maglione.</i>
          -> main
          
    = step_due
        <i>Il ramo sembra sparire nella luce della serra.</i>
        <i>No, non sparire: è trasparente.</i>
        <i>Gioca con la luce, la rende calda e accogliente.</i>
          -> main
          
    = step_tre
        <i>Ramo e sostanza sono una cosa sola: un fungo di vetro, dita che si sfiorano e intrecciano lanciate verso il cielo.</i>
        <i>Hai trovato un <b>Non ti scordar di te</b>.</i>
        <i>Trasforma ciò che è passato, che non c'è più, per renderlo vita nuova.</i>
        <i>Il nuovo nell'antico, il noi nel nostro passato.</i>

        + [Intreccio le mie dita alle sue.]
            <i>Ti metti a piangere.</i>
            <i>Sorridi e piangi.</i>
            <i>L'aria è riscaldata da un profumo familiare.</i>
            <i>Una carezza sul viso: un saluto di chi non c'è più, ma vive in te.</i>
            <i>Siete parte della stessa storia.</i>
                ~ growing = 0
                ~ chosenCultivable = ()
                {
                        - findedGifts hasnt NonTiScordarDiTe:
                        ~ findedGifts += NonTiScordarDiTe
                        <i>Hai ottenuto: <b>Non Ti Scordar di Te.</b></i>
                    }
                + + {backupCultivable != ()}[Voglio coltivare qualcosa di nuovo.]
                    -> cultivable_test
                + + [Mi aggiro per la serra.]    
                    -> main                    
       
        + [Non ora.]
              -> main
              

=== brina_dell_impossibile
//Ricordo, collaborazione, novità
//Outcome: prova una strada nuova
    = step_zero
        ~ statoBrinaDellImpossibile = stepZero
        <i>Qualcosa ha rotto un vetro della serra?</i>
            -> main
    
    = step_uno
        <i>Le crepe si sono fatte ora più fitte, investendo anche il vaso.</i>
          -> main
          
    = step_due
        <i>Vaso, vetro e mobile: linee nette mostrano il cielo fuori dalla serra.</i>
        <i>Eppure non sembrano cadere, non sembrano tentennare.</i>
          -> main
    
    = step_tre
        <i>Isole di vetro, terracotta e legno galleggiano nell'aria.</i>
        <i>Le spingi ma non si spostano.</i>
        <i>Api e petali attraversano le ferite, il cielo bluastro le riempie.</i>

        + [Infilo la mano tra gli spazi vuoti.]
            <i>Il vetro si rinsalda, spingendo via la tua mano.</i>
            <i>Le linee del tuo palmo si fanno trasparenti, inconsistenti. Eppure puoi muovere le dita, e non provi alcun dolore.</i>
            <i>La <b>Brina dell'Impossibile</b> si raccoglie nel luogo di un trauma.</i>
            <i>Riempie le ferite per permetterci di vederle, ascoltarle.</i>
            <i>Ti ricorda che non serve dimenticare per poter riprendere a vivere.</i>
                ~ growing = 0
                ~ chosenCultivable = ()
                    {
                        - findedGifts hasnt BrinaDellImpossibile:
                        ~ findedGifts += BrinaDellImpossibile
                       <i> Hai ottenuto: <b>Brina dell'Impossibile</b></i>
                    }
                + + {backupCultivable != ()}[Voglio coltivare qualcosa di nuovo.]
                    -> cultivable_test
                + + [Mi aggiro per la serra.]    
                    -> main
        + [Ora non me la sento.]
              -> main
 
          

-> main