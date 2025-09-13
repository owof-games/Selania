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
    -> main
}

=== lichene_degli_abissi
//Collaborazione, ciclicità, cancellazione
//Outcome: allontana qualcuno.
    
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
        <i>L'odore del <b>Lichene degli abissi.</b></i>
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
                                <i>Hai ottenuto: <b>Lichene degli Abissi.</b></i>
                            }
                    ~ move_entity(GreenhouseRecap, BookPlace)
                
                + + {backupCultivable != () && are_two_entities_together(WateringCan, PG)}[Voglio coltivare qualcosa di nuovo.]
                        -> cultivable_test
                + + [Mi aggiro per la serra.]    
                        -> main

              


=== edera_delle_amanti
//Collaborazione, novità, ricordo
//Outcome: datti piacere
    = TW
        <i>Trigger Warning: questa pianta allude a contenuti erotici.
        <i>{name} vuole farla crescere, o preferisce cambiare?
        + [Voglio andare avanti.]
            -> step_zero
        + [Voglio rimuoverla, ma solo per ora.]
            -> tempCultTW_formula -> cultivable_test
        + [Voglio rimuoverla per sempre.]
            -> remove_proposed_cultivable -> cultivable_test
        -
        -> step_zero

    
        = step_zero
    -> remove_proposed_cultivable ->  
    ~ growthEderaDelleAmanti = stepZero
        <i>Gli occhi di {name} si riempiono di miele luminoso.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>I polpastrelli hanno fame.</i>
            -> main
    
    = step_uno
        <i>Rami morbidi si sollevano lungo le pareti della serra.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Le labbra di {name} vibrano.</i> 
            -> main
          
    = step_due
        <i>I rami sono intrecciati, abbracciati, uniti, arrotolati. Si avviluppano giocosi.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Radici gentili saggiano il legno della serra, lo sfiorano, lo penetrano.</i>
        <i>Foglie giovani maturano, nutrendosi di questo gioco.</i>
            -> main
    
    = step_tre
        ~ move_entity(GoldenBee, Greenhouse)
        <i>Calore nel ventre.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Un pezzo di serra è ora coperto di fiori e abbracci.</i>
        <i>Faticoso è resistere all'idea di tuffarvisi.</i>
        
            + (colto) [Prendo una foglia.]
                <i>Per un attimo {name} perde i suoi confini.</i>
                <i>Diventa un bacio nella notte, dita desiderate tra le coscie.</i>
                <i>Acqua sulle labbra, pelle nuda sulla terra umida.</i>
                <i>Pienezza che riempie, la forza dell'<b>Edera delle amanti</b></i>.
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
                            <i>Hai ottenuto: <b>Edera delle Amanti.</b></i>
                        }
                        
                    ~ move_entity(GreenhouseRecap, BookPlace)
                    
                + + {backupCultivable != () && are_two_entities_together(WateringCan, PG)}[Voglio coltivare qualcosa di nuovo.]
                        -> cultivable_test
                + + [Mi aggiro per la serra.]    
                        -> main


=== canto_delle_compagne
//Collaborazione, ciclicità, ricordo
//Outcome: danza, sola o con le compagne
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
        <i>La nebbia si è fatta fiume, goccie rosse che vibrano.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Che danzano.</i>
        <i>E quando si scontrano, la serra riecheggia di una festosa risata.</i>
            -> main
          
    = step_tre
        ~ move_entity(RedBee, Greenhouse)
        <i>La serra si muove e si scuote, le travi cigolano nel voler danzare.</i> #speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Ilare, <b>Canto delle compagne</b> turbina e balla riversandosi dal vaso.</i>
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
                        <i>Hai ottenuto: <b>Canto delle Compagne.</b></i>
                    }

                    ~ move_entity(GreenhouseRecap, BookPlace)
                
                + + {backupCultivable != () && are_two_entities_together(WateringCan, PG)}[Voglio coltivare qualcosa di nuovo.]
                        -> cultivable_test
                + + [Mi aggiro per la serra.]    
                        -> main

              
=== la_spazzata
//Indipendenza, novità, cancellazione
//Outcome: prometti di dire qualcosa che ti pesa sullo stomaco.
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
        <i>Niente sembra cambiare.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Eppure l'aria è più pesante.</i>
            -> main
         
    = step_uno
         <i>Qualcosa osserva {name} dagli angoli più scuri della serra.</i> #speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
         <i>L'aria manca, ha voglia di gridare.</i>
            -> main
    
    = step_due
        <i>Tremore nell'aria.</i> #speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Spine sottili irritano gli occhi di {name}.</i>
        <i>I piedi fremono dalla voglia di calpestare, percuotere, schiacciare.</i>
            -> main
    
    = step_tre
        <i>Il tetto della serra scricchiola, le sue travi gemono dal dolore.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>La testa di {name} è pronta ad esplodere.</i>
        <i>Sopra di {pronouns has him:lui|{pronouns has her:lei|ləi}} pulsa e si contrae nervosa una nascente <b>Spazzata</b></i>.
        <i>La Spazzata è e non è.</i>
        <i>Si abbuffa delle cose non dette.</i>
        <i>E quando è sazia, travolge ogni cosa.</i>

        + (colto)[Colpisco i suoi rami.]
            <i>Una forte contrazione.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            <i>E poi si ferma, immagine di ciò che un tempo era.</i>
            <i>La pancia di {name} colma di un senso di vuoto.</i>
            <i>La sensazione di quando ha condiviso qualcosa che riteneva terribile.</i>
            <i>Per poi scoprire che il mondo non è finito quella volta, e non finirà oggi.</i>
            <i>Le cose son sempre peggiori nella propria testa.</i>
            <i>La Spazzata è innocua se riesce a parlare.</i>
                    ~ growing = 0
                    ~ chosenCultivable = ()
                    @animation:Inventory
                    @animation:RewriterBook
                    {
                        - findedGifts hasnt LaSpazzata:
                        ~ findedGifts += LaSpazzata
                        <i>Hai ottenuto: <b>La Spazzata.</b></i>
                    }
                    ~ move_entity(GreenhouseRecap, BookPlace)
                
                + + {backupCultivable != () && are_two_entities_together(WateringCan, PG)}[Voglio coltivare qualcosa di nuovo.]
                        -> cultivable_test
                + + [Mi aggiro per la serra.]    
                        -> main




=== bacca_della_addolorata
//Indipendenza, novità, cancellazione
//Outcome: liberazione, invito ad avanzare
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
        <i>Coraggiosa, la <b>Bacca dell'Addolorata</b> espone le sue ferite al mondo.</b>
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
                        <i>Hai ottenuto: <b>Bacca della Addolorata</b></i>
                    }
                    ~ move_entity(GreenhouseRecap, BookPlace)
                    
                + + {backupCultivable != () && are_two_entities_together(WateringCan, PG)}[Voglio coltivare qualcosa di nuovo.]
                        -> cultivable_test
                + + [Mi aggiro per la serra.]    
                        -> main

              
=== non_ti_scordar_di_te
//Indipendenza, ciclicità, ricordo
//Outcome: ricordo di chi non c'è più
    = TW
        <i>Questa pianta ti vuole raccontare qualcosa sul lutto e la sua elaborazione.
        <i>Te la senti di farla crescere, {name} o preferisci provare con un'altra pianta?
        + [Me la sento, iniziamo.]
            -> step_zero
        + [Vorrei evitarla, ora, ma riproponimela in futuro.]
            -> tempCultTW_formula -> cultivable_test
        + [Non propormi mai più questa pianta.]
            -> remove_proposed_cultivable -> cultivable_test
        -
        -> step_zero
        
    = step_zero
    -> remove_proposed_cultivable ->
        ~ growthNonTiScordarDiTe = stepZero
        <i>Su uno vecchio ramo è comparsa una sostanza gelatinosa, una gomma che sembra un asparago.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            -> main
    
    = step_uno
        <i>Il ramo sembra più leggero, vitreo.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>La gelatina non è invitante al tatto, ma l'aria ha un profumo sa di, di cosa? Sigaro, tabacco forse?</i>
        <i>O è canfora? O addirittura torta, o rabarbaro, o caffè.
        <i>L'odore di un vecchio e fidato maglione.</i>
          -> main
          
    = step_due
        <i>Il ramo sembra sparire nella luce della serra.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>No, non sparire: è trasparente.</i>
        <i>Gioca con la luce, la rende calda e accogliente.</i>
          -> main
          
    = step_tre
        <i>Ramo e sostanza sono una cosa sola: un fungo di vetro, dita che si sfiorano e intrecciano lanciate verso il cielo.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Hai trovato un <b>Non ti scordar di te</b>.</i>
        <i>Trasforma ciò che è passato, che non c'è più, per renderlo vita nuova.</i>
        <i>Il nuovo nell'antico, il noi nel nostro passato.</i>

        + (colto) [Intreccio le mie dita alle sue.]
            <i>Ti metti a piangere.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            <i>Sorridi e piangi.</i>
            <i>L'aria è riscaldata da un profumo familiare.</i>
            <i>Una carezza sul viso: un saluto di chi non c'è più, ma vive in te.</i>
            <i>Siete parte della stessa storia.</i>
                ~ growing = 0
                ~ chosenCultivable = ()
                    @animation:Inventory
                    @animation:RewriterBook
                    {
                        - findedGifts hasnt NonTiScordarDiTe:
                        ~ findedGifts += NonTiScordarDiTe
                        <i>Hai ottenuto: <b>Non Ti Scordar di Te.</b></i>
                    }
                    ~ move_entity(GreenhouseRecap, BookPlace)
                    
                + + {backupCultivable != () && are_two_entities_together(WateringCan, PG)}[Voglio coltivare qualcosa di nuovo.]
                        -> cultivable_test
                + + [Mi aggiro per la serra.]    
                        -> main                    

=== brina_dell_impossibile
//Ricordo, collaborazione, novità
//Outcome: prova una strada nuova
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
        <i>Qualcosa ha rotto un vetro della serra?</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            -> main
    
    = step_uno
        <i>Le crepe si sono fatte ora più fitte, investendo anche il vaso.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
          -> main
          
    = step_due
        <i>Vaso, vetro e mobile: linee nette mostrano il cielo fuori dalla serra.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Eppure non sembrano cadere, non sembrano tentennare.</i>
          -> main
    
    = step_tre
        <i>Isole di vetro, terracotta e legno galleggiano nell'aria.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Le spingi ma non si spostano.</i>
        <i>Api e petali attraversano le ferite, il cielo bluastro le riempie.</i>

        + (colto) [Infilo la mano tra gli spazi vuoti.]
            <i>Il vetro si rinsalda, spingendo via la tua mano.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            <i>Le linee del tuo palmo si fanno trasparenti, inconsistenti. Eppure puoi muovere le dita, e non provi alcun dolore.</i>
            <i>La <b>Brina dell'Impossibile</b> si raccoglie nel luogo di un trauma.</i>
            <i>Riempie le ferite per permetterti di vederle, ascoltarle.</i>
            <i>Ti ricorda che non serve dimenticare per poter riprendere a vivere.</i>
                ~ growing = 0
                ~ chosenCultivable = ()
                @animation:Inventory
                @animation:RewriterBook
                    {
                        - findedGifts hasnt BrinaDellImpossibile:
                        ~ findedGifts += BrinaDellImpossibile
                       <i>Hai ottenuto: <b>Brina dell'Impossibile</b></i>
                    }

                    ~ move_entity(GreenhouseRecap, BookPlace)
                    
                + + {backupCultivable != () && are_two_entities_together(WateringCan, PG)}[Voglio coltivare qualcosa di nuovo.]
                        -> cultivable_test
                + + [Mi aggiro per la serra.]    
                    -> main


=== cardo_aspinato
//Ricordo, collaborazione, novità
//Outcome: prova una strada nuova
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
        <i>I peli del fusto vibrano, si sollevano quando ti avvicini, ti tengono distante.</i>
          -> main
    
    = step_due
       <i>È comparsa una gemma sulla cima dello stelo.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>E dalla gemma emergono filamenti disgustosi, il loro puzzo ti chiede di provare paura, di allontanarti, di arrenderti, di evitare ogni contatto.</i>
        -> main
    
    = step_tre
        <i>La piante cede, si stende tra le tue gambe.</i>.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        + (colto)[Allungo le dita.]
            <i>Allunghi le dita, ne carezzi il pelo, e al contatto, senti.</i>
            <i>Senti la luna, le stelle, le foglie nel vento, l'erba umida.</i>
            <i>Senti abbracci e sorrisi e mani che vi sorreggono.
            <i>La pianta sboccia.
            ~ move_entity(BrownBee, Greenhouse)
            <i>Il <b>Cardo aspinato</b> doveva scoprire di non essere solo.</i>
            <i>Che lasciarsi aiutare è aiutare l'altrx.</i>
            <i>Che aiutare è aiutarsi.</i>
                ~ growing = 0
                ~ chosenCultivable = ()
                @animation:Inventory
                @animation:RewriterBook
                    {
                        - findedGifts hasnt CardoAspinato:
                        ~ findedGifts += CardoAspinato
                       <i>Hai ottenuto: <b>CardoAspinato</b></i>
                    }

                    ~ move_entity(GreenhouseRecap, BookPlace)
                    
                + + {backupCultivable != () && are_two_entities_together(WateringCan, PG)}[Voglio coltivare qualcosa di nuovo.]
                        -> cultivable_test
                + + [Mi aggiro per la serra.]    
                    -> main

 
          

-> main