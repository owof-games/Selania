//Nota: i coltivabili ad ora crescono o entrando e uscendo dalla serra, o finendo un blocco narrativo di una personaggia (es: talking_with_char_two.one).

=== growing_check
{
    - not growing_check:
        ~ somethingStrange ++
}

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
            ~ growthLicheneDegliAbissi = stepZero
        - growStep has stepOne:
            ~ growthLicheneDegliAbissi = stepOne
        - growStep has stepTwo:
            ~ growthLicheneDegliAbissi = stepTwo
        - growStep has stepThree:
            ~ growthLicheneDegliAbissi = stepThree
    }

    - chosenCultivable has EderaDelleAmanti:
    {
        - growStep has stepZero:
            ~ growthEderaDelleAmanti = stepZero
        - growStep has stepOne:
            ~ growthEderaDelleAmanti = stepOne
        - growStep has stepTwo:
            ~ growthEderaDelleAmanti = stepTwo
        - growStep has stepThree:
             ~ growthEderaDelleAmanti = stepThree
    }

    - chosenCultivable has CantoDelleCompagne:
    {
        - growStep has stepZero:
            ~ growthCantoDelleCompagne = stepZero
        - growStep has stepOne:
            ~ growthCantoDelleCompagne = stepOne
        - growStep has stepTwo:
            ~ growthCantoDelleCompagne = stepTwo
        - growStep has stepThree:
             ~ growthCantoDelleCompagne = stepThree
    }

    - chosenCultivable has LaSpazzata:
    {
        - growStep has stepZero:
            ~ growthLaSpazzata = stepZero
        - growStep has stepOne:
            ~ growthLaSpazzata = stepOne
        - growStep has stepTwo:
            ~ growthLaSpazzata = stepTwo
        - growStep has stepThree:
            ~ growthLaSpazzata = stepThree
    }

    - chosenCultivable has BaccaDellaAddolorata:
    {
        - growStep has stepZero:
            ~ growthBaccaDellaAddolorata = stepZero
        - growStep has stepOne:
            ~ growthBaccaDellaAddolorata = stepOne
        - growStep has stepTwo:
            ~ growthBaccaDellaAddolorata = stepTwo
        - growStep has stepThree:
            ~ growthBaccaDellaAddolorata = stepThree
    }

    - chosenCultivable has NonTiScordarDiTe:
    {
        - growStep has stepZero:
            ~ growthNonTiScordarDiTe = stepZero
        - growStep has stepOne:
            ~ growthNonTiScordarDiTe = stepOne
        - growStep has stepTwo:
            ~ growthNonTiScordarDiTe = stepTwo
        - growStep has stepThree:
            ~ growthNonTiScordarDiTe = stepThree
    }

    - chosenCultivable has BrinaDellImpossibile:
    {
        - growStep has stepZero:
            ~ growthBrinaDellImpossibile = stepZero
        - growStep has stepOne:
            ~ growthBrinaDellImpossibile = stepOne
        - growStep has stepTwo:
            ~ growthBrinaDellImpossibile = stepTwo
        - growStep has stepThree:
             ~ growthBrinaDellImpossibile = stepThree
    }

    - chosenCultivable has CardoAspinato:
    {
        - growStep has stepZero:
            ~ growthCardoAspinato = stepZero
        - growStep has stepOne:
            ~ growthCardoAspinato = stepOne
        - growStep has stepTwo:
            ~ growthCardoAspinato = stepTwo
        - growStep has stepThree:
             ~ growthCardoAspinato = stepThree
    }    

    - chosenCultivable has BastoneDellOzioso:
    {
        - growStep has stepZero:
            ~ growthBastoneDellOzioso = stepZero
        - growStep has stepOne:
            ~ growthBastoneDellOzioso = stepOne
        - growStep has stepTwo:
            ~ growthBastoneDellOzioso = stepTwo
        - growStep has stepThree:
             ~ growthBastoneDellOzioso = stepThree
    } 
    
    - chosenCultivable has BarbaDellInciampo:
    {
        - growStep has stepZero:
            ~ growthBarbaDellInciampo = stepZero
        - growStep has stepOne:
            ~ growthBarbaDellInciampo = stepOne
        - growStep has stepTwo:
            ~ growthBarbaDellInciampo = stepTwo
        - growStep has stepThree:
             ~ growthBarbaDellInciampo = stepThree
    }     
    
    
    ->->
}

->->

=== plant_check
{
    - chosenCultivable has LicheneDegliAbissi:
    {
        - growthLicheneDegliAbissi == stepZero:
            -> lichene_degli_abissi.step_zero
        - growthLicheneDegliAbissi == stepOne:
            -> lichene_degli_abissi.step_uno
        - growthLicheneDegliAbissi == stepTwo:
            -> lichene_degli_abissi.step_due
        - growthLicheneDegliAbissi == stepThree:
            -> lichene_degli_abissi.step_tre
    }

    - chosenCultivable has EderaDelleAmanti:
    {
        - growthEderaDelleAmanti == stepZero:
            -> edera_delle_amanti.step_zero
        - growthEderaDelleAmanti == stepOne:
            -> edera_delle_amanti.step_uno
        - growthEderaDelleAmanti == stepTwo:
            -> edera_delle_amanti.step_due
        - growthEderaDelleAmanti == stepThree:
            -> edera_delle_amanti.step_tre
    }

    - chosenCultivable has CantoDelleCompagne:
    {
        - growthCantoDelleCompagne == stepZero:
            -> canto_delle_compagne.step_zero    
        - growthCantoDelleCompagne == stepOne:
            -> canto_delle_compagne.step_uno
        - growthCantoDelleCompagne == stepTwo:
            -> canto_delle_compagne.step_due
        - growthCantoDelleCompagne == stepThree:
            -> canto_delle_compagne.step_tre
    }

    - chosenCultivable has LaSpazzata:
    {
        - growthLaSpazzata == stepZero:
            -> la_spazzata.step_zero 
        - growthLaSpazzata == stepOne:
            -> la_spazzata.step_uno
        - growthLaSpazzata == stepTwo:
            -> la_spazzata.step_due
        - growthLaSpazzata == stepThree:
            -> la_spazzata.step_tre
    }

    - chosenCultivable has BaccaDellaAddolorata:
    {
        - growthBaccaDellaAddolorata == stepZero:
            -> bacca_della_addolorata.step_zero
        - growthBaccaDellaAddolorata == stepOne:
            -> bacca_della_addolorata.step_uno
        - growthBaccaDellaAddolorata == stepTwo:
            -> bacca_della_addolorata.step_due
        - growthBaccaDellaAddolorata == stepThree:
            -> bacca_della_addolorata.step_tre
    }

    - chosenCultivable has NonTiScordarDiTe:
    {
        - growthNonTiScordarDiTe == stepZero:
            -> non_ti_scordar_di_te.step_zero     
        - growthNonTiScordarDiTe == stepOne:
            -> non_ti_scordar_di_te.step_uno
        - growthNonTiScordarDiTe == stepTwo:
            -> non_ti_scordar_di_te.step_due
        - growthNonTiScordarDiTe == stepThree:
            -> non_ti_scordar_di_te.step_tre
    }

    - chosenCultivable has BrinaDellImpossibile:
    {
        - growthBrinaDellImpossibile == stepZero:
            -> brina_dell_impossibile.step_zero     
        - growthBrinaDellImpossibile == stepOne:
            -> brina_dell_impossibile.step_uno
        - growthBrinaDellImpossibile == stepTwo:
            -> brina_dell_impossibile.step_due
        - growthBrinaDellImpossibile == stepThree:
            -> brina_dell_impossibile.step_tre
    }
    
    - chosenCultivable has CardoAspinato:
    {
        - growthCardoAspinato == stepZero:
            -> cardo_aspinato.step_zero     
        - growthCardoAspinato == stepOne:
            -> cardo_aspinato.step_uno
        - growthCardoAspinato == stepTwo:
            -> cardo_aspinato.step_due
        - growthCardoAspinato == stepThree:
            -> cardo_aspinato.step_tre
    }
    
    - chosenCultivable has BastoneDellOzioso:
    {
        - growthBastoneDellOzioso == stepZero:
            -> bastone_dell_ozioso.step_zero     
        - growthBastoneDellOzioso == stepOne:
            -> bastone_dell_ozioso.step_uno
        - growthBastoneDellOzioso == stepTwo:
            -> bastone_dell_ozioso.step_due
        - growthBastoneDellOzioso == stepThree:
            -> bastone_dell_ozioso.step_tre
    }
    
    - chosenCultivable has BarbaDellInciampo:
    {
        - growthBarbaDellInciampo == stepZero:
            -> barba_dell_inciampo.step_zero     
        - growthBarbaDellInciampo == stepOne:
            -> barba_dell_inciampo.step_uno
        - growthBarbaDellInciampo == stepTwo:
            -> barba_dell_inciampo.step_due
        - growthBarbaDellInciampo == stepThree:
            -> barba_dell_inciampo.step_tre
    }    
    
    -> main
}

=== lichene_degli_abissi
    
    = TW
        //<i>{chosenCultivable} affronta questo tema delicato: XYZ.
        //<i>Te la senti di farla crescere, o preferisci cambiare?
        //+ [Voglio andare avanti.]
        //    -> step_zero
        //+ [Voglio rimuoverla, ma solo per ora.]
        //    -> tempCultTW_formula -> cultivable_test
        //+ [Voglio rimuoverla, per sempre.]
        //    -> remove_proposed_cultivable -> cultivable_test
        //-
        -> step_zero
        
    = step_zero
    -> remove_proposed_cultivable ->
        ~ growthLicheneDegliAbissi = stepZero
        <i>Un odore salmastro si diffonde per la serra.</i> #speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>La terra si solleva ai lati del vaso.</i>
                -> main
    
    = step_uno
        <i>Affilata e trasparente, una foglia vortica al centro del vaso, catturando a fatica il tuo volto.</i> #speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>L'aria si fa di sale, brucia gli occhi.</i>
            -> main
          
    = step_due
        <i>In silenzio nuove foglie si inseguono nell'aria.</i> #speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Più si avvicinano, più l'odore si fa violento.</i>
            -> main
          
    = step_tre
        <i>L'odore è così forte da far lacrimare gli occhi di {name}.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>L'odore del <b><i>Lichene degli abissi.</b></i>
        <i>Roteare incessante tra fungo e alga.</i>
        <i>Si respingono nel piacere, si inseguono nel dolore, senza mai afferrarsi.</i>
        <i>Forti nella loro distruzione, estremamente fragili.</i>

            + (colto) [Sfioro il lichene.]
                ~ growthLicheneDegliAbissi = stepZero
                <i>Un piccolo sbuffo, rumore di vetro.</i> #speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
                <i>Le dita di {name} sanno di ricordo, sanno di mare.</i>
                <i>Di persone allontanate.</i>
                <i>Di addii dolorosi, e ferite risanate.</i>
                    ~ growing = 0
                    ~ chosenCultivable = ()
                    @animation:Inventory
                    @animation:RewriterBook 


                            {
                                - findedGifts hasnt LicheneDegliAbissi:
                                ~ findedGifts += LicheneDegliAbissi
                                <i>Hai ottenuto: <b><i>Lichene degli Abissi.</b></i>
                            }
                    ~ move_entity(GreenhouseRecap, BookPlace)
                    
                                    
                + + {backupCultivable != () && are_two_entities_together(WateringCan, PG)}[Voglio coltivare qualcosa di nuovo.]
                        -> cultivable_test
                + + [Mi aggiro per la serra.]    
                        -> main

              


=== edera_delle_amanti

    = TW
        <i>Attenzione: questa pianta allude a contenuti erotici.
        <i>{name} vuole farla crescere, o preferisce cambiare?
        + [Voglio andare avanti.]
            -> step_zero
        + [Voglio rimuoverla, ma solo per ora.]
            -> tempCultTW_formula -> cultivable_test
        + [Voglio rimuoverla per sempre.]
            -> remove_proposed_cultivable ->
            ~ chosenCultivable = ()
            -> cultivable_test
        -
        -> step_zero

    
        = step_zero
    -> remove_proposed_cultivable ->  
    ~ growthEderaDelleAmanti = stepZero
        <i>Il vaso gronda miele luminoso, calore riempie gli occhi di {name}.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>I polpastrelli hanno fame.</i>
            -> main
    
    = step_uno
        <i>Rami morbidi si sollevano lungo le pareti della serra.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Le labbra di {name} vibrano.</i> 
            -> main
          
    = step_due
        <i>I rami si sfiorano desideranti, colmi, sinuosi. Si avviluppano giocosi.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Radici gentili saggiano il legno della serra, lo sfiorano, lo penetrano.</i>
        <i>Foglie giovani maturano, nutrendosi di questo gioco.</i>
            -> main
    
    = step_tre
        
        <i>Calore nel ventre.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Un pezzo di serra è ora coperto di fiori e abbracci.</i>
        <i>Faticoso è resistere all'idea di tuffarvisi.</i>
        
            + (colto) [Prendo una foglia.]
                <i>Per un attimo {name} perde i suoi confini.</i>
                <i>Diventa un bacio nella notte, dita desiderate tra le coscie.</i>
                <i>Acqua sulle labbra, pelle nuda sulla terra umida.</i>
                <i>Pienezza che riempie, la forza dell'<b><i>Edera delle amanti</b></i>.
                <i>Il corpo colmo di piacere.</i>
                <i>Di fusione.</i>
                <i>Vivo.</i>
                    ~ growing = 0
                    ~ chosenCultivable = ()
                    
                    @animation:Inventory
                    @animation:RewriterBook
                    
                        {
                            - findedGifts hasnt EderaDelleAmanti:
                            ~ findedGifts += EderaDelleAmanti
                            <i>Hai ottenuto: <b><i>Edera delle Amanti.</b></i>
                        }
                        
                    ~ move_entity(GreenhouseRecap, BookPlace)
                    ~ move_entity(GoldenBee, Greenhouse)


                + + {backupCultivable != () && are_two_entities_together(WateringCan, PG)}[Voglio coltivare qualcosa di nuovo.]
                        -> cultivable_test
                + + [Mi aggiro per la serra.]    
                        -> main


=== canto_delle_compagne

    = TW
        //<i>{chosenCultivable} affronta questo tema delicato: XYZ.
        //<i>Te la senti di farla crescere, o preferisci cambiare?
        //+ [Voglio andare avanti.]
        //    -> step_zero
        //+ [Voglio rimuoverla, ma solo per ora.]
        //    -> tempCultTW_formula -> cultivable_test
        //+ [Voglio rimuoverla, per sempre.]
        //    -> remove_proposed_cultivable -> cultivable_test
        //-
        -> step_zero

        
    = step_zero
        -> remove_proposed_cultivable ->
        ~ growthCantoDelleCompagne = stepZero
        <i>Qualcosa vibra e sveglia le gambe di {name}.<i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Ha voglia di danzare.</i>
            -> main
        
    = step_uno
        <i>Il vaso è caldo al tocco.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>L'aria attorno vibra di una nebbiolina rossastra.</i>
          -> main
          
    = step_due
        <i>La nebbia si è fatta fiume, goccie che vibrano.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Che danzano.</i>
        <i>E quando si scontrano, la serra riecheggia di una festosa risata.</i>
            -> main
          
    = step_tre
        
        <i>La serra si muove e si scuote, le travi cigolano nel voler danzare.</i> #speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Ilare, <b><i>Canto delle compagne</b></i> turbina e balla riversandosi dal vaso.</i>
        <i>In un altro tempo questo cespuglio veniva chiamato "Canto delle streghe".</i>
        <i>L'euforia riempie i polmoni di {name}, sente la gioia di sapere che non è mai stata davvero {pronouns has him:solo|{pronouns has her:sola|solə}}.</i>
        
        + (colto)[Ne raccolgo una goccia.]
                <i>Le gambe di {name} iniziano a ballare.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
                <i>Spingono il suo corpo nella stanza.</i>
                <i>La sua voce si alza e canta, chiama l3 compagn3.</i>
                <i>Si uniscono in una festa, un sabba, rendendo il mondo intero il loro palcoscenico.</i>
                <i>Ridendo feroci di chi l3 teme.</i>
                    ~ growing = 0
                    ~ chosenCultivable = ()
                    
                    @animation:Inventory
                    @animation:RewriterBook
                    
                    {
                        - findedGifts hasnt CantoDelleCompagne:
                        ~ findedGifts += CantoDelleCompagne
                        <i>Hai ottenuto: <b><i>Canto delle Compagne.</b></i>
                    }

                    ~ move_entity(GreenhouseRecap, BookPlace)
                    ~ move_entity(RedBee, Greenhouse)

                + + {backupCultivable != () && are_two_entities_together(WateringCan, PG)}[Voglio coltivare qualcosa di nuovo.]
                        -> cultivable_test
                + + [Mi aggiro per la serra.]    
                        -> main

              
=== la_spazzata

    = TW
        //<i>{chosenCultivable} affronta questo tema delicato: XYZ.
        //<i>Te la senti di farla crescere, o preferisci cambiare?
        //+ [Voglio andare avanti.]
        //    -> step_zero
        //+ [Voglio rimuoverla, ma solo per ora.]
        //    -> tempCultTW_formula -> cultivable_test
        //+ [Voglio rimuoverla, per sempre.]
        //    -> remove_proposed_cultivable -> cultivable_test
        //-
        -> step_zero

        
    = step_zero
    -> remove_proposed_cultivable ->
    ~ growthLaSpazzata = stepZero
        <i>Il pavimento della serra si è spezzato, riempiendosi dell'acqua che viene dallo stagno.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Una singola piccola fogliolina galleggia morbidamente.</i>
        <i>Un singolo piccolo pensiero stuzzica {name}.</i>
            -> main
         
    = step_uno
         <i>Molte più foglie riempiono ora la fossa.</i> #speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
         <i>Molti più pensieri riempiono la testa di {name}.</i>
         <i>Cos'era quella cosa che avresti voluto dire a, sì, sai a chi.</i>
         <i>Ma non è il caso, alla fine.</i>
         <i>Non è mai il caso.</i>
            -> main
    
    = step_due
        <i>La serra è invasa di foglie, l'acqua si infila sotto vasi e mobili.</i> #speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>E pensieri come spilli invadono la testa di {name}.</i>
        <i>L'ansia si infila sotto ricordi e sicurezze, e tutto trema.</i>
            -> main
    
    = step_tre
        <i>Il pavimento vuoto scricchiola.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Tutto sembra in ordine, eppure la testa di {name} è pronta ad esplodere.</i>
        <i>Ai suoi piedi resta il foro della <b><i>Spazzata</b></i>.
        <i>La Spazzata è e non è.</i>
        <i>Si abbuffa delle cose non dette.</i>
        <i>E quando è sazia, travolge ogni cosa.</i>

        + (colto)[Infilo una mano nel foro.]
            <i>Odore di autunno, di foglie umide.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            <i>La pancia di {name} colma di un senso di vuoto.</i>
            <i>La sensazione di quando ha condiviso qualcosa che riteneva terribile.</i>
            <i>Per poi scoprire che il mondo non è finito quella volta, e non finirà oggi.</i>
            <i>Le cose sono sempre peggiori nella propria testa.</i>
            <i>Ma reali, lasciano segni e ferite.</i>
            
                    ~ growing = 0
                    ~ chosenCultivable = ()
                    @animation:Inventory
                    @animation:RewriterBook
                    
                    {
                        - findedGifts hasnt LaSpazzata:
                        ~ findedGifts += LaSpazzata
                        <i>Hai ottenuto: <b><i>La Spazzata.</b></i>
                    }
                    ~ move_entity(GreenhouseRecap, BookPlace)

                + + {backupCultivable != () && are_two_entities_together(WateringCan, PG)}[Voglio coltivare qualcosa di nuovo.]
                        -> cultivable_test
                + + [Mi aggiro per la serra.]    
                        -> main




=== bacca_della_addolorata

    = TW
        //<i>{chosenCultivable} affronta questo tema delicato: XYZ.
        //<i>Te la senti di farla crescere, o preferisci cambiare?
        //        + [Voglio andare avanti.]
        //    -> step_zero
        //+ [Voglio rimuoverla, ma solo per ora.]
        //    -> tempCultTW_formula -> cultivable_test
        //+ [Voglio rimuoverla, per sempre.]
        //    -> remove_proposed_cultivable -> cultivable_test
        // -
        -> step_zero
        
    = step_zero
    -> remove_proposed_cultivable ->
    ~ growthBaccaDellaAddolorata = stepZero
        <i>Cinque punte titubanti emergono dal vaso.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Saggiano l'aria con timore, pronte a ritirarsi.</i>
            -> main
    
    = step_uno
        <i>Rami secchi graffiano l'aria.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Cercano invano di tornare nella terra.</i>
            -> main
    
    = step_due
        <i>Rami come dita riempiono il vaso.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Slanciati verso l'alto, feriti.</i>
          -> main
          
    = step_tre
        <i>Le dita ora una mano tesa verso il cielo, una vecchia ferita al centro brilla di resina rossastra.<i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Coraggiosa, la <b><i>Bacca dell'Addolorata</b></i> espone le sue ferite al mondo.</b></i>
        <i>Una pianta cara a chi ha finalmente trovato la sua strada, ma non riesce ancora ad avanzare.</i>

            + (colto) [Afferro la bacca.]
            <i>La mano cede la sua presa rilassandosi.
            <i>Si rilassano le spalle di {name}.
            <i>L'incertezza scivola via.
            <i>Compiere il primo passo è faticoso.
            <i>Ma ora {name} ricorda come camminare.
                ~ growing = 0
                ~ chosenCultivable = ()
                @animation:Inventory
                @animation:RewriterBook
                
                    {
                        - findedGifts hasnt BaccaDellaAddolorata:
                        ~ findedGifts += BaccaDellaAddolorata
                        <i>Hai ottenuto: <b><i>Bacca della Addolorata</b></i>
                    }
                    ~ move_entity(GreenhouseRecap, BookPlace)

                + + {backupCultivable != () && are_two_entities_together(WateringCan, PG)}[Voglio coltivare qualcosa di nuovo.]
                        -> cultivable_test
                + + [Mi aggiro per la serra.]    
                        -> main

              
=== non_ti_scordar_di_te

    = TW
        <i>Attenzione: questa pianta parla di lutto e della sua elaborazione.
        <i>Se la sente {name} di farla crescere, o preferisce cercare qualcosa di diverso?
        + [Me la sento, iniziamo.]
            -> step_zero
        + [Vorrei evitarla ora, ma riproponimela in futuro.]
            -> tempCultTW_formula -> cultivable_test
        + [Non propormi mai più questa pianta.]
            -> remove_proposed_cultivable ->
            ~ chosenCultivable = ()
            -> cultivable_test
        -
            -> step_zero
        
    = step_zero
    -> remove_proposed_cultivable ->
        ~ growthNonTiScordarDiTe = stepZero
        <i>Affusolata come un asparago una gelatina cristallina spunta da un ramo.</b></i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            -> main
    
    = step_uno
        <i>Il ramo sembra più leggero, vitreo.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>La gelatina non è invitante al tatto, ma l'aria ha un profumo sa di, di cosa? Tabacco?</i>
        <i>O è canfora? O forse torta e caffè?
        <i>O l'odore di un vecchio e fidato maglione.</i>
          -> main
          
    = step_due
        <i>Il ramo sembra sparire nella luce della serra.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Trasparente, gioca con la luce, la rende calda e accogliente.</i>
          -> main
          
    = step_tre
        <i>Ramo e sostanza sono una cosa sola: un fungo di vetro, dita che si sfiorano e intrecciano tese verso il cielo.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Hai trovato un <b><i>Non ti scordar di te</b></i>.</i>
        <i>Trasforma ciò che è era per renderlo vita nuova.</i>
        <i>Il nuovo nell'antico, il presente nel futuro.</i>

        + (colto) [Intreccio le mie dita alle sue.]
            <i>{name} ha il volto rigato di lacrime.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            <i>E sorride.</i>
            <i>L'aria è riscaldata da un profumo familiare.</i>
            <i>Una carezza sul viso, un saluto.</i>
            <i>Un nome che continua a pronunciare, anche se nessun arriva più.</i>
            <i>Ma quel nome e {name} si intrecciano, come ramo e fungo.
            <i>Due capitoli della stessa storia.</i>
                ~ growing = 0
                ~ chosenCultivable = ()
                    @animation:Inventory
                    @animation:RewriterBook
                     
                    {
                        - findedGifts hasnt NonTiScordarDiTe:
                        ~ findedGifts += NonTiScordarDiTe
                        <i>Hai ottenuto: <b><i>Non Ti Scordar di Te.</b></i>
                    }
                    ~ move_entity(GreenhouseRecap, BookPlace)

                                       

                + + {backupCultivable != () && are_two_entities_together(WateringCan, PG)}[Voglio coltivare qualcosa di nuovo.]
                        -> cultivable_test
                + + [Mi aggiro per la serra.]    
                        -> main                    

=== brina_dell_impossibile

    = TW
        //<i>{chosenCultivable} affronta questo tema delicato: XYZ.
        //<i>Te la senti di farla crescere, o preferisci cambiare?
        //        + [Voglio andare avanti.]
        //    -> step_zero
        //+ [Voglio rimuoverla, ma solo per ora.]
        //    -> tempCultTW_formula -> cultivable_test
        //+ [Voglio rimuoverla, per sempre.]
        //    -> remove_proposed_cultivable -> cultivable_test
        // -
        -> step_zero
        
    = step_zero
        -> remove_proposed_cultivable ->
        ~ growthBrinaDellImpossibile = stepZero
        <i>Sulla finestra è comparsa una crepa.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            -> main
    
    = step_uno
        <i>La crepa si è estesa.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>La stanza si riempie dell'odore dello stagno.
          -> main
          
    = step_due
        <i>Impossibile, eppure il vetro resiste imperturbato mentre le linee si allargano.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Forse invece {name} si sente tentennare?</i>
          -> main
    
    = step_tre
        <i>Isole di vetro galleggiano nell'aria.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>E baccelli crescono tra le ferite, come navi colme di semi.

        + (colto) [Colgo uno dei baccelli.]
            <i>{name} vede e dà un nome a qualcosa del suo passato.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            <i>A qualcosa che è sempre stato lì, eppure non vedeva.
            <i>La <b><i>Brina dell'Impossibile</b></i> si raccoglie nel luogo di un trauma.</i>
            <i>Riempie le ferite così che siano visibili.</i>
            <i>Anche se fa male, aiuta a guardare, nominare, affrontare.</i>
            <i>Offre con ogni suo baccello semi vivi di speranza.</i>

                ~ growing = 0
                ~ chosenCultivable = ()
                @animation:Inventory
                @animation:RewriterBook
                
                    {
                        - findedGifts hasnt BrinaDellImpossibile:
                        ~ findedGifts += BrinaDellImpossibile
                       <i>Hai ottenuto: <b><i>Brina dell'Impossibile</b></i>
                    }

                    ~ move_entity(GreenhouseRecap, BookPlace)

                                    

                + + {backupCultivable != () && are_two_entities_together(WateringCan, PG)}[Voglio coltivare qualcosa di nuovo.]
                        -> cultivable_test
                + + [Mi aggiro per la serra.]    
                    -> main


=== cardo_aspinato

    = TW
        ////<i>{chosenCultivable} affronta questo tema delicato: XYZ.
        //<i>Te la senti di farla crescere, o preferisci cambiare?
        //        + [Voglio andare avanti.]
        //    -> step_zero
        //+ [Voglio rimuoverla, ma solo per ora.]
        //    -> tempCultTW_formula -> cultivable_test
        //+ [Voglio rimuoverla, per sempre.]
        //    -> remove_proposed_cultivable -> cultivable_test
        //-
        -> step_zero
    
    = step_zero
    -> remove_proposed_cultivable ->
        ~ growthCardoAspinato = stepZero
        <i>Odore di buio, di cielo senza stelle. Di bosco e nebbia e nessuna strada da imboccare.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Una palla soffice emerge dal terreno.</i>
                -> main
    
    = step_uno
        <i>Rumore di passi, qualcosa che corre, che fugge, che non arriva mai.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>I peli del fusto vibrano, si sollevano quando {name} si avvicina, {pronouns has him:lo|{pronouns has her:la|lə}} tengono distante.</i>
                -> main
    
    = step_due
       <i>È comparsa una gemma sulla cima dello stelo.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>E dalla gemma emergono filamenti disgustosi, il loro puzzo chiede di provare paura, di allontanarsi, di arrendersi, di evitare ogni contatto.</i>
                -> main
    
    = step_tre
        <i>La piante cede, si stende tra le gambe di {name}.</i>.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        
        + (colto)[Allungo le dita.]
            <i>{name} allunga le dita, ne carezza il pelo, e al contatto, sente.</i>
            <i>Sente la luna, le stelle, le foglie nel vento, l'erba umida.</i>
            <i>Sente abbracci e sorrisi e mani che sorreggono.
            <i>La pianta sboccia.
            
            <i>Il <b><i>Cardo aspinato</b></i> sboccia nel supporto.</i>
            <i>Nel capire che lasciarsi aiutare è aiutare l'altrə.</i>
            <i>Nell'accettare che aiutare è aiutarsi.</i>
                ~ growing = 0
                ~ chosenCultivable = ()
                
                @animation:Inventory
                @animation:RewriterBook
                
                    {
                        - findedGifts hasnt CardoAspinato:
                        ~ findedGifts += CardoAspinato
                       <i>Hai ottenuto: <b><i>Cardo Aspinato</b></i>
                    }

                    ~ move_entity(GreenhouseRecap, BookPlace)
                    ~ move_entity(BrownBee, Greenhouse)
                    
                                    

                + + {backupCultivable != () && are_two_entities_together(WateringCan, PG)}[Voglio coltivare qualcosa di nuovo.]
                        -> cultivable_test
                + + [Mi aggiro per la serra.]    
                    -> main



          
=== bastone_dell_ozioso

    = TW
        ////<i>{chosenCultivable} affronta questo tema delicato: XYZ.
        //<i>Te la senti di farla crescere, o preferisci cambiare?
        //        + [Voglio andare avanti.]
        //    -> step_zero
        //+ [Voglio rimuoverla, ma solo per ora.]
        //    -> tempCultTW_formula -> cultivable_test
        //+ [Voglio rimuoverla, per sempre.]
        //    -> remove_proposed_cultivable -> cultivable_test
        //-
        -> step_zero
    
    = step_zero
    -> remove_proposed_cultivable ->
        ~ growthBastoneDellOzioso = stepZero
        <i>{name} sente un prurito, la voglia di provare qualcosa.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Un gesto, una nota, un passo, quella cosa che non ha mai fatto.</i>
                -> main
    
    = step_uno
        <i>Il prurito ora si fa un grattare dietro alla testa.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>{name} forse si dice che non si fanno le cose che non si sanno fare.</i>
        <i>Ma {name} si dice anche che a volte serve un solo passo per iniziare a ballare.</i>
                -> main
    
    = step_due
       <i>Il grattare si è fatto gioia, si è fatto movimento.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Le mani di {name} quasi applaudono da sole quando arriva il momento.</i>
        <i>E anche se non lo sa davvero fare, a chi importa?</i>
        <i>Qualcuno forse decide come è giusto camminare?</i>
                -> main
    
    = step_tre
        <i>Rami come braccia lanciati in aria.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Il vento tra le canne vuote canta.</i>
        
        + (colto)[Canto anche io.]
            <i>La stanza esplode in una festa.</i>
            <i>I rami del <b>Bastone dell'Ozioso</b> vibrano di note chiassose.
            <i>La musica è stonata, i rami sgrazziati eppure.
            <i>Non c'è gioia più grande del fare per il solo piacere di fare.
            <i>Senza luoghi dove andare.
            <i>Senza classifiche da scalare.
                ~ growing = 0
                ~ chosenCultivable = ()
                
                @animation:Inventory
                @animation:RewriterBook
                
                    {
                        - findedGifts hasnt BastoneDellOzioso:
                            ~ findedGifts += BastoneDellOzioso
                       <i>Hai ottenuto: <b><i>Bastone dell'Ozioso</b></i>
                    }

                    ~ move_entity(GreenhouseRecap, BookPlace)
                    ~ move_entity(BrownBee, Greenhouse)

                + + {backupCultivable != () && are_two_entities_together(WateringCan, PG)}[Voglio coltivare qualcosa di nuovo.]
                        -> cultivable_test
                + + [Mi aggiro per la serra.]    
                    -> main 

=== barba_dell_inciampo

    = TW
        ////<i>{chosenCultivable} affronta questo tema delicato: XYZ.
        //<i>Te la senti di farla crescere, o preferisci cambiare?
        //        + [Voglio andare avanti.]
        //    -> step_zero
        //+ [Voglio rimuoverla, ma solo per ora.]
        //    -> tempCultTW_formula -> cultivable_test
        //+ [Voglio rimuoverla, per sempre.]
        //    -> remove_proposed_cultivable -> cultivable_test
        //-
        -> step_zero
    
    = step_zero
    -> remove_proposed_cultivable ->
        ~ growthBarbaDellInciampo = stepZero
        <i>{name} ha commesso un errore.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Un errore che è come una lancia.
                -> main
    
    = step_uno
        <i>La colpa attanaglia {name}.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Se qualcunə critica, aggredisce.</i>
        <i>Parole come lame, pronte a ferire.</i>
                -> main
    
    = step_due
       <i>Le lame si fanno muro.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
       <i>Nascondono l'errore dal mondo.</i>
       <i>Nascondono l'errore da {name}.
       <i>La colpa è come veleno.
                -> main
    
    = step_tre
        <i>Quando {name} abbassa le difese, vede con occhi diversi.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>E la pianta con {pronouns has him:lui|{pronouns has her:lei|ləi}}.</i>
        
        + (colto)[Afferro l'ultima spina.]
            <i>C'è pace in {name}, pace nella serra.</i>
            <i>E il calice della <b>Barba dell'inciampo</b> ora è tana.
            <i>C'è differenza tra colpa e reponsabilità.
            <i>Tra punizione ed elaborazione.
            <i>La lancia della pianta è ora tana per qualcosa di delicato.
            <i>L'errore di {name} è ora guida per cambiare.
                ~ growing = 0
                ~ chosenCultivable = ()
                
                @animation:Inventory
                @animation:RewriterBook
                
                    {
                        - findedGifts hasnt BastoneDellOzioso:
                            ~ findedGifts += BastoneDellOzioso
                       <i>Hai ottenuto: <b><i>Bastone dell'Ozioso</b></i>
                    }

                    ~ move_entity(GreenhouseRecap, BookPlace)
                    ~ move_entity(BrownBee, Greenhouse)
                    
                                    

                + + {backupCultivable != () && are_two_entities_together(WateringCan, PG)}[Voglio coltivare qualcosa di nuovo.]
                        -> cultivable_test
                + + [Mi aggiro per la serra.]    
                    -> main 

-> main