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
    
    - chosenCultivable has Olobino:
    {
        - growStep has stepZero:
            ~ growthOlobino = stepZero
        - growStep has stepOne:
            ~ growthOlobino = stepOne
        - growStep has stepTwo:
            ~ growthOlobino = stepTwo
        - growStep has stepThree:
             ~ growthOlobino = stepThree
    }

    - chosenCultivable has FalsaPalude:
    {
        - growStep has stepZero:
            ~ growthFalsaPalude = stepZero
        - growStep has stepOne:
            ~ growthFalsaPalude = stepOne
        - growStep has stepTwo:
            ~ growthFalsaPalude = stepTwo
        - growStep has stepThree:
             ~ growthFalsaPalude = stepThree
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
    
    - chosenCultivable has Olobino:
    {
        - growStep has stepZero:
            -> olobino.step_zero 
        - growStep has stepOne:
            -> olobino.step_uno 
        - growStep has stepTwo:
            -> olobino.step_due 
        - growStep has stepThree:
            -> olobino.step_tre 
    }    

    - chosenCultivable has FalsaPalude:
    {
        - growStep has stepZero:
            -> falsa_palude.step_zero 
        - growStep has stepOne:
            -> falsa_palude.step_uno 
        - growStep has stepTwo:
            -> falsa_palude.step_due 
        - growStep has stepThree:
            -> falsa_palude.step_tre 
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
                    {
                        - bookContents hasnt GreenhouseRecap:
                            ~ move_entity(GreenhouseRecap, BookPlace)
                    }
                    @animation:Inventory
                    @animation:RewriterBook
                    
                                    
                + + {backupCultivable != ()}[Voglio coltivare qualcosa di nuovo.]
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
                    ~ move_entity(GoldenBee, Greenhouse)
                    {
                        - bookContents hasnt GreenhouseRecap:
                            ~ move_entity(GreenhouseRecap, BookPlace)
                    }
                    @animation:Inventory
                    @animation:RewriterBook

                + + {backupCultivable != ()}[Voglio coltivare qualcosa di nuovo.]
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
                    ~ move_entity(RedBee, Greenhouse)
                    {
                        - bookContents hasnt GreenhouseRecap:
                            ~ move_entity(GreenhouseRecap, BookPlace)
                    }                    
                    @animation:Inventory
                    @animation:RewriterBook

                + + {backupCultivable != ()}[Voglio coltivare qualcosa di nuovo.]
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
                    {
                        - bookContents hasnt GreenhouseRecap:
                            ~ move_entity(GreenhouseRecap, BookPlace)
                    }
                    @animation:Inventory
                    @animation:RewriterBook

                + + {backupCultivable != ()}[Voglio coltivare qualcosa di nuovo.]
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
        <i>Nulla cambia.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            -> main
    
    = step_uno
        <i>Un vaso inizia a deformarsi.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>{name} sente un poco di freddo.</i>
            -> main
    
    = step_due
        <i>Un ramo rompe il vaso.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Insicuro eppure diritto punta verso {name}.</i>
          -> main
          
    = step_tre
        <i>Rami verso il cielo sostengono un frutto.<i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Semi rossastri e foglie sottili.
        <i>Coraggiosa, la <b><i>Bacca dell'Addolorata</b></i> espone le sue ferite al mondo.</b></i>
        <i>Una pianta cara a chi ha finalmente trovato la sua strada, ma non riesce ancora ad avanzare.</i>

            + (colto) [Afferro uno dei semi.]
            <i>Il frutto si rivela tenace, deciso.
            <i>Si rilassano le spalle di {name}.
            <i>L'incertezza scivola via.
            <i>L'avanzare di un ramo timido ha permesso alla <b>Bacca</b> di fruttare.
            <i>Compiere il primo passo è faticoso.
            <i>Ma ora {name} ricorda come camminare.
                ~ growing = 0
                ~ chosenCultivable = ()
                    {
                        - bookContents hasnt GreenhouseRecap:
                            ~ move_entity(GreenhouseRecap, BookPlace)
                    }
                @animation:Inventory
                @animation:RewriterBook

                + + {backupCultivable != ()}[Voglio coltivare qualcosa di nuovo.]
                        -> cultivable_test
                + + [Mi aggiro per la serra.]    
                        -> main

              
=== non_ti_scordar_di_te

    = TW
        //<i>Attenzione: questa pianta parla di lutto e della sua elaborazione.
        //<i>Se la sente {name} di farla crescere, o preferisce cercare qualcosa di diverso?
        //+ [Me la sento, iniziamo.]
        //    -> step_zero
        //+ [Vorrei evitarla ora, ma riproponimela in futuro.]
        //    -> tempCultTW_formula -> cultivable_test
        //+ [Non propormi mai più questa pianta.]
        //    -> remove_proposed_cultivable ->
        //    ~ chosenCultivable = ()
        //    -> cultivable_test
        //-
            -> step_zero
        
    = step_zero
    -> remove_proposed_cultivable ->
        ~ growthNonTiScordarDiTe = stepZero
        <i>Radici cromate si raccolgono in piccoli mucchi.</b></i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>L'aria odora di terra e ricordi.
            -> main
    
    = step_uno
        <i>L'unione ha portato a una fioritura.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Le radici cespugliose sono sbocciate in qualcosa di nuovo.</i>
        <i>{name} pensa a chi da tempo cammina con {pronouns has him:lui|{pronouns has her:lei|ləi}}.
          -> main
          
    = step_due
        <i>Nuove congiunzioni si accrescono tra i cespugli radicali.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Ciò che era separato genera nuove storie.</i>
          -> main
          
    = step_tre
        <i>Ciò che è nato fiorisce e genera a sua volta.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Trasforma un collegamento in una nuova vittoria.</i>

        + (colto) [Colgo uno dei fiori.]
            <i>{name} si sente ramo, si sente radice.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            <i>Si sente le persone che è {pronouns has him:stato|{pronouns has her:stata|statə}} e quelle che sarà.</i>
            <i>Le persone che l'hanno {pronouns has him:accompagnato|{pronouns has her:accompagnata|accompagnatə}} nella sua vita.
            <i><b>Non ti scordar di te</b> è la pianta del ricordo.
            <i>E del costruire.
            <i>Del celebrare le parti di chi abbiamo incontrato, che continuano a vivere in noi.
            <i>Del sentirci eredi e messagger3, parte di un percorso intessuto di nomi.
            <i>A quali nomi {name} name ripensa?
                ~ growing = 0
                ~ chosenCultivable = ()
                    {
                        - bookContents hasnt GreenhouseRecap:
                            ~ move_entity(GreenhouseRecap, BookPlace)
                    }
                    @animation:Inventory
                    @animation:RewriterBook
            
                + + {backupCultivable != ()}[Voglio coltivare qualcosa di nuovo.]
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
                    {
                        - bookContents hasnt GreenhouseRecap:
                            ~ move_entity(GreenhouseRecap, BookPlace)
                    }
                @animation:Inventory
                @animation:RewriterBook

                + + {backupCultivable != ()}[Voglio coltivare qualcosa di nuovo.]
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
                ~ move_entity(BrownBee, Greenhouse)                
                    {
                        - bookContents hasnt GreenhouseRecap:
                            ~ move_entity(GreenhouseRecap, BookPlace)
                    }
                @animation:Inventory
                @animation:RewriterBook

                + + {backupCultivable != ()}[Voglio coltivare qualcosa di nuovo.]
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
                    {
                        - bookContents hasnt GreenhouseRecap:
                            ~ move_entity(GreenhouseRecap, BookPlace)
                    }
                @animation:Inventory
                @animation:RewriterBook

                + + {backupCultivable != ()}[Voglio coltivare qualcosa di nuovo.]
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
                ~ move_entity(Snail, Greenhouse)                
                    {
                        - bookContents hasnt GreenhouseRecap:
                            ~ move_entity(GreenhouseRecap, BookPlace)
                    }
                @animation:Inventory
                @animation:RewriterBook

                + + {backupCultivable != ()}[Voglio coltivare qualcosa di nuovo.]
                        -> cultivable_test
                        
                + + [Mi aggiro per la serra.]    
                    -> main 

=== olobino

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
        ~ growthOlobino = stepZero
        
        <i>Piccoli bottoni luccicanti osservano la serra.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Le mani di {name} sembrano più calde.
                -> main
    
    = step_uno
        <i>I muscoli di {name} si distendono.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>La mente si fa limpida.</i>
                -> main
    
    = step_due
       <i>Ogni morbido fungo sembra sparire nell'altro.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
       <i>Il sottile micelio si mescola alle venature del legno.</i>
       <i>E {name}...
       <i>Perché dovrebbe limitarsi ad essere {name}?
                -> main
    
    = step_tre
        <i>Il tempo si mescola, ieri è oggidomanimai.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>I confini si sciolgono e un corpo è stanzapiantalucerespiro.</i>
        
        + (colto)[{name} si mescola col fungo.]
            <i>C'è solo amore.
            <i>Per le persone care e per quelle mai conosciute, per quelle perse e quelle che verranno.
            <i>Per l'insetto nel giardino e l'uccello nel cielo.
            <i>Per l'acqua sulla fronte e la plastica sotto le dita.
            <i>C'è completezza, non separazione.
            <i>C'è e non c'è e ci sarà ed è stato ed è qui, ora.
            <i>L'<i><b>Olobino</i></b> è un fungo semplice pieno di potere.
            <i>Il potere che c'è nel perdere il sé.
            <i>L'eternità nella collettività.
                ~ growing = 0
                ~ chosenCultivable = ()
                ~ move_entity(FromPondToGreenhouseBlooming, Pond)
                ~ move_entity(FromPondToGreenhouse, Safekeeping)                
                    {
                        - bookContents hasnt GreenhouseRecap:
                            ~ move_entity(GreenhouseRecap, BookPlace)
                    }

                @animation:Inventory
                @animation:RewriterBook
                
                + + {backupCultivable != ()}[Voglio coltivare qualcosa di nuovo.]
                        -> cultivable_test
                        
                + + [Mi aggiro per la serra.]    
                    -> main 

=== falsa_palude

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
        ~ growthFalsaPalude = stepZero
        <i>Il vento spinge lo sporco sul pavimento, avvicinandolo ai piedi di {name}.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
                -> main
    
    = step_uno
        <i>Lo sporco si è accresciuto.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>E ogni sua parte bisbiglia parole.</i>
        <i>Il nome di {name} sembra lontano.</i>
        <i>Ma riconosce sentimenti che ha già vissuto.</i>
                -> main
    
    = step_due
       <i>Nella calma della serra il pavimento sembra vivo.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
       <i>Foglie e fiori e pistilli avanzano l3 un3 verso l3 altr3.</i>
       <i>Il sentimento si è fatto movimento.
       <i>Forse {name} non è {pronouns has him:solo|{pronouns has her:sola|solə}} nel vivere certe emozioni?
                -> main
    
    = step_tre
        <i>Il movimento si è fatto unione, si è fatto gruppo.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>E un cespuglio fitto e odoroso illumina il pavimento della serra.</i>
        
        + (colto)[Raccolgo un petalo.]
            <i>E tutta la <b>Falsa Palude</b> sospira.
            <i>Esule dell'acqua, eppure capace di germogliare.
            <i>La <b>Falsa Palude</b> è corallo di terra, colonia.
            <i>Vibrazione vicina e ascolto.
            <i>Ciò che accade quando il dolore si fa terreno comune.
            <i>Quando storie diverse riconoscono la propria voce.
            <i>E ciò che sembrava un ostacolo personale, si dimostra un problema strutturale.
                ~ growing = 0
                ~ chosenCultivable = ()
                    {
                        - bookContents hasnt GreenhouseRecap:
                            ~ move_entity(GreenhouseRecap, BookPlace)
                    }
                @animation:Inventory
                @animation:RewriterBook

                + + {backupCultivable != ()}[Voglio coltivare qualcosa di nuovo.]
                        -> cultivable_test
                        
                + + [Mi aggiro per la serra.]    
                    -> main 


-> main