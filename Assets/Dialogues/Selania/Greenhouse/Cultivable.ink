//Nota: i coltivabili ad ora crescono o entrando e uscendo dalla serra, o finendo un blocco narrativo di una personaggia (es: talking_with_char_two.one).

=== growing_check
{
    - not growing_check:
        ~ player_somethingStrange ++
}

{
    - greenhouse_cultivableGrowing < 2:
        ~ greenhouse_growStep = ()
        ~ greenhouse_growStep += stepZero
    - greenhouse_cultivableGrowing < 3:
        ~ greenhouse_growStep = ()
        ~ greenhouse_growStep += stepOne    
    - greenhouse_cultivableGrowing < 4:
        ~ greenhouse_growStep = ()
        ~ greenhouse_growStep += stepTwo
    - else:
        ~ greenhouse_growStep = ()
        ~ greenhouse_growStep += stepThree

}

{

    - greenhouse_chosenCultivable has BaccaDellaAddolorata:
        {
            - greenhouse_growStep has stepZero:
                ~ growthBaccaDellaAddolorata = stepZero
                ~ narrativeGrowthBaccaDellaAddolorata = stepZero
            - greenhouse_growStep has stepOne:
                ~ growthBaccaDellaAddolorata = stepOne
                ~ narrativeGrowthBaccaDellaAddolorata = stepOne
            - greenhouse_growStep has stepTwo:
                ~ growthBaccaDellaAddolorata = stepTwo
                ~ narrativeGrowthBaccaDellaAddolorata = stepTwo
            - greenhouse_growStep has stepThree:
                 ~ growthBaccaDellaAddolorata = stepTwo
                 ~ narrativeGrowthBaccaDellaAddolorata = stepThree
        }
    - greenhouse_chosenCultivable has BarbaDellInciampo:
        {
            - greenhouse_growStep has stepZero:
                ~ growthBarbaDellInciampo = stepZero
                ~ narrativeGrowthBarbaDellInciampo = stepZero
            - greenhouse_growStep has stepOne:
                ~ growthBarbaDellInciampo = stepOne
                ~ narrativeGrowthBarbaDellInciampo = stepOne
            - greenhouse_growStep has stepTwo:
                ~ growthBarbaDellInciampo = stepTwo
                ~ narrativeGrowthBarbaDellInciampo = stepTwo
            - greenhouse_growStep has stepThree:
                 ~ growthBarbaDellInciampo = stepTwo
                 ~ narrativeGrowthBarbaDellInciampo = stepThree
        }

    - greenhouse_chosenCultivable has BastoneDellOzioso:
        {
            - greenhouse_growStep has stepZero:
                ~ growthBastoneDellOzioso = stepZero
                ~ narrativeGrowthBastoneDellOzioso = stepZero
            - greenhouse_growStep has stepOne:
                ~ growthBastoneDellOzioso = stepOne
                ~ narrativeGrowthBastoneDellOzioso = stepOne
            - greenhouse_growStep has stepTwo:
                ~ growthBastoneDellOzioso = stepTwo
                ~ narrativeGrowthBastoneDellOzioso = stepTwo
            - greenhouse_growStep has stepThree:
                 ~ growthBastoneDellOzioso = stepTwo
                 ~ narrativeGrowthBastoneDellOzioso = stepThree
        } 
    
    - greenhouse_chosenCultivable has BrinaDellImpossibile:
        {
            - greenhouse_growStep has stepZero:
                ~ growthBrinaDellImpossibile = stepZero
                ~ narrativeGrowthBrinaDellImpossibile = stepZero
            - greenhouse_growStep has stepOne:
                ~ growthBrinaDellImpossibile = stepOne
                ~ narrativeGrowthBrinaDellImpossibile = stepOne
            - greenhouse_growStep has stepTwo:
                ~ growthBrinaDellImpossibile = stepTwo
                ~ narrativeGrowthBrinaDellImpossibile = stepTwo
            - greenhouse_growStep has stepThree:
                 ~ growthBrinaDellImpossibile = stepTwo
                 ~ narrativeGrowthBrinaDellImpossibile = stepThree
        }

    - greenhouse_chosenCultivable has CantoDelleCompagne:
        {
            - greenhouse_growStep has stepZero:
                ~ growthCantoDelleCompagne = stepZero
                ~ narrativeGrowthCantoDelleCompagne = stepZero
            - greenhouse_growStep has stepOne:
                ~ growthCantoDelleCompagne = stepOne
                ~ narrativeGrowthCantoDelleCompagne = stepOne
            - greenhouse_growStep has stepTwo:
                ~ growthCantoDelleCompagne = stepTwo
                ~ narrativeGrowthCantoDelleCompagne = stepTwo
            - greenhouse_growStep has stepThree:
                 ~ growthCantoDelleCompagne = stepTwo
                 ~ narrativeGrowthCantoDelleCompagne = stepThree
        }
    
    - greenhouse_chosenCultivable has CardoAspinato:
        {
            - greenhouse_growStep has stepZero:
                ~ growthCardoAspinato = stepZero
                ~ narrativeGrowthCardoAspinato = stepZero
            - greenhouse_growStep has stepOne:
                ~ growthCardoAspinato = stepOne
                ~ narrativeGrowthCardoAspinato = stepOne
            - greenhouse_growStep has stepTwo:
                ~ growthCardoAspinato = stepTwo
                ~ narrativeGrowthCardoAspinato = stepTwo
            - greenhouse_growStep has stepThree:
                 ~ growthCardoAspinato = stepTwo
                 ~ narrativeGrowthCardoAspinato = stepThree
        }     

    - greenhouse_chosenCultivable has EderaDelleAmanti:
        {
            - greenhouse_growStep has stepZero:
                ~ growthEderaDelleAmanti = stepZero
                ~ narrativeGrowthEderaDelleAmanti= stepZero
            - greenhouse_growStep has stepOne:
                ~ growthEderaDelleAmanti = stepOne
                ~ narrativeGrowthEderaDelleAmanti= stepOne
            - greenhouse_growStep has stepTwo:
                ~ growthEderaDelleAmanti = stepTwo
                ~ narrativeGrowthEderaDelleAmanti= stepTwo
            - greenhouse_growStep has stepThree:
                 ~ growthEderaDelleAmanti = stepTwo
                 ~ narrativeGrowthEderaDelleAmanti= stepThree
        }
    
    - greenhouse_chosenCultivable has ErbaLiccia:
        {
            - greenhouse_growStep has stepZero:
                ~ growthErbaLiccia = stepZero
                ~ narrativeGrowthErbaLiccia = stepZero
            - greenhouse_growStep has stepOne:
                ~ growthErbaLiccia = stepOne
                ~ narrativeGrowthErbaLiccia = stepOne
            - greenhouse_growStep has stepTwo:
                ~ growthErbaLiccia = stepTwo
                ~ narrativeGrowthErbaLiccia = stepTwo
            - greenhouse_growStep has stepThree:
                 ~ growthErbaLiccia = stepTwo
                 ~ narrativeGrowthErbaLiccia = stepThree
        }
    
    - greenhouse_chosenCultivable has FalsaPalude:
        {
            - greenhouse_growStep has stepZero:
                ~ growthFalsaPalude = stepZero
                ~ narrativeGrowthFalsaPalude = stepZero
            - greenhouse_growStep has stepOne:
                ~ growthFalsaPalude = stepOne
                ~ narrativeGrowthFalsaPalude = stepOne
            - greenhouse_growStep has stepTwo:
                ~ growthFalsaPalude = stepTwo
                ~ narrativeGrowthFalsaPalude = stepTwo
            - greenhouse_growStep has stepThree:
                 ~ growthFalsaPalude = stepTwo
                 ~ narrativeGrowthFalsaPalude = stepThree
        }     
    
    - greenhouse_chosenCultivable has LanaNotturna:
        {
            - greenhouse_growStep has stepZero:
                ~ growthLanaNotturna = stepZero
                ~ narrativeGrowthLanaNotturna = stepZero
            - greenhouse_growStep has stepOne:
                ~ growthLanaNotturna = stepOne
                ~ narrativeGrowthLanaNotturna = stepOne
            - greenhouse_growStep has stepTwo:
                ~ growthLanaNotturna = stepTwo
                ~ narrativeGrowthLanaNotturna = stepTwo
            - greenhouse_growStep has stepThree:
                 ~ growthLanaNotturna = stepTwo
                 ~ narrativeGrowthLanaNotturna = stepThree
        }
        
    - greenhouse_chosenCultivable has LicheneDegliAbissi:
        {
            - greenhouse_growStep has stepZero:
                ~ growthLicheneDegliAbissi = stepZero
                ~ narrativeGrowthLicheneDegliAbissi = stepZero
            - greenhouse_growStep has stepOne:
                ~ growthLicheneDegliAbissi = stepOne
                ~ narrativeGrowthLicheneDegliAbissi = stepOne
            - greenhouse_growStep has stepTwo:
                ~ growthLicheneDegliAbissi = stepTwo
                ~ narrativeGrowthLicheneDegliAbissi = stepTwo
            - greenhouse_growStep has stepThree:
                ~ growthLicheneDegliAbissi = stepTwo
                ~ narrativeGrowthLicheneDegliAbissi = stepThree
        }
    
    - greenhouse_chosenCultivable has NonTiScordarDiTe:
        {
            - greenhouse_growStep has stepZero:
                ~ growthNonTiScordarDiTe = stepZero
                ~ narrativeGrowthNonTiScordarDiTe = stepZero
            - greenhouse_growStep has stepOne:
                ~ growthNonTiScordarDiTe = stepOne
                ~ narrativeGrowthNonTiScordarDiTe = stepOne
            - greenhouse_growStep has stepTwo:
                ~ growthNonTiScordarDiTe = stepTwo
                ~ narrativeGrowthNonTiScordarDiTe = stepTwo
            - greenhouse_growStep has stepThree:
                 ~ growthNonTiScordarDiTe = stepTwo
                 ~ narrativeGrowthNonTiScordarDiTe = stepThree
        }
    
    - greenhouse_chosenCultivable has Olobino:
        {
            - greenhouse_growStep has stepZero:
                ~ growthOlobino = stepZero
                ~ narrativeGrowthOlobino = stepZero
            - greenhouse_growStep has stepOne:
                ~ growthOlobino = stepOne
                ~ narrativeGrowthOlobino = stepOne
            - greenhouse_growStep has stepTwo:
                ~ growthOlobino = stepTwo
                ~ narrativeGrowthOlobino = stepTwo
            - greenhouse_growStep has stepThree:
                 ~ growthOlobino = stepTwo
                 ~ narrativeGrowthOlobino = stepThree
        }

    - greenhouse_chosenCultivable has LaSpazzata:
        {
            - greenhouse_growStep has stepZero:
                ~ growthLaSpazzata = stepZero
                ~ narrativeGrowthLaSpazzata = stepZero
            - greenhouse_growStep has stepOne:
                ~ growthLaSpazzata = stepOne
                ~ narrativeGrowthLaSpazzata = stepOne
            - greenhouse_growStep has stepTwo:
                ~ growthLaSpazzata = stepTwo
                ~ narrativeGrowthLaSpazzata = stepTwo
            - greenhouse_growStep has stepThree:
                 ~ growthLaSpazzata = stepTwo
                 ~ narrativeGrowthLaSpazzata = stepThree
        }
    ->->
}

->->

=== plant_check
{
    - greenhouse_chosenCultivable has BaccaDellaAddolorata:
    {
        - narrativeGrowthBaccaDellaAddolorata == stepZero:
            -> bacca_della_addolorata.step_zero
        - narrativeGrowthBaccaDellaAddolorata == stepOne:
            -> bacca_della_addolorata.step_uno
        - narrativeGrowthBaccaDellaAddolorata == stepTwo:
            -> bacca_della_addolorata.step_due
        - narrativeGrowthBaccaDellaAddolorata == stepThree:
            -> bacca_della_addolorata.step_tre
    }

    - greenhouse_chosenCultivable has BarbaDellInciampo:
    {
        - narrativeGrowthBarbaDellInciampo == stepZero:
            -> barba_dell_inciampo.step_zero     
        - narrativeGrowthBarbaDellInciampo == stepOne:
            -> barba_dell_inciampo.step_uno
        - narrativeGrowthBarbaDellInciampo == stepTwo:
            -> barba_dell_inciampo.step_due
        - narrativeGrowthBarbaDellInciampo == stepThree:
            -> barba_dell_inciampo.step_tre
    } 
    
    - greenhouse_chosenCultivable has BastoneDellOzioso:
    {
        - narrativeGrowthBastoneDellOzioso == stepZero:
            -> bastone_dell_ozioso.step_zero     
        - narrativeGrowthBastoneDellOzioso == stepOne:
            -> bastone_dell_ozioso.step_uno
        - narrativeGrowthBastoneDellOzioso == stepTwo:
            -> bastone_dell_ozioso.step_due
        - narrativeGrowthBastoneDellOzioso == stepThree:
            -> bastone_dell_ozioso.step_tre
    }

    - greenhouse_chosenCultivable has BrinaDellImpossibile:
    {
        - narrativeGrowthBrinaDellImpossibile == stepZero:
            -> brina_dell_impossibile.step_zero     
        - narrativeGrowthBrinaDellImpossibile == stepOne:
            -> brina_dell_impossibile.step_uno
        - narrativeGrowthBrinaDellImpossibile == stepTwo:
            -> brina_dell_impossibile.step_due
        - narrativeGrowthBrinaDellImpossibile == stepThree:
            -> brina_dell_impossibile.step_tre
    }

    - greenhouse_chosenCultivable has CantoDelleCompagne:
    {
        - narrativeGrowthCantoDelleCompagne == stepZero:
            -> canto_delle_compagne.step_zero    
        - narrativeGrowthCantoDelleCompagne == stepOne:
            -> canto_delle_compagne.step_uno
        - narrativeGrowthCantoDelleCompagne == stepTwo:
            -> canto_delle_compagne.step_due
        - narrativeGrowthCantoDelleCompagne == stepThree:
            -> canto_delle_compagne.step_tre
    }
    
    - greenhouse_chosenCultivable has CardoAspinato:
    {
        - narrativeGrowthCardoAspinato == stepZero:
            -> cardo_aspinato.step_zero     
        - narrativeGrowthCardoAspinato == stepOne:
            -> cardo_aspinato.step_uno
        - narrativeGrowthCardoAspinato == stepTwo:
            -> cardo_aspinato.step_due
        - narrativeGrowthCardoAspinato == stepThree:
            -> cardo_aspinato.step_tre
    }

    - greenhouse_chosenCultivable has EderaDelleAmanti:
    {
        - narrativeGrowthEderaDelleAmanti == stepZero:
            -> edera_delle_amanti.step_zero
        - narrativeGrowthEderaDelleAmanti == stepOne:
            -> edera_delle_amanti.step_uno
        - narrativeGrowthEderaDelleAmanti == stepTwo:
            -> edera_delle_amanti.step_due
        - narrativeGrowthEderaDelleAmanti == stepThree:
            -> edera_delle_amanti.step_tre
    }
    
    - greenhouse_chosenCultivable has ErbaLiccia:
    {
        - narrativeGrowthErbaLiccia has stepZero:
            -> erba_liccia.step_zero 
        - narrativeGrowthErbaLiccia has stepOne:
            -> erba_liccia.step_uno 
        - narrativeGrowthErbaLiccia has stepTwo:
            -> erba_liccia.step_due 
        - narrativeGrowthErbaLiccia has stepThree:
            -> erba_liccia.step_tre 
    }

    - greenhouse_chosenCultivable has FalsaPalude:
    {
        - narrativeGrowthFalsaPalude has stepZero:
            -> falsa_palude.step_zero 
        - narrativeGrowthFalsaPalude has stepOne:
            -> falsa_palude.step_uno 
        - narrativeGrowthFalsaPalude has stepTwo:
            -> falsa_palude.step_due 
        - narrativeGrowthFalsaPalude has stepThree:
            -> falsa_palude.step_tre 
    }

    - greenhouse_chosenCultivable has LanaNotturna:
    {
        - narrativeGrowthLanaNotturna has stepZero:
            -> lana_notturna.step_zero 
        - narrativeGrowthLanaNotturna has stepOne:
            -> lana_notturna.step_uno 
        - narrativeGrowthLanaNotturna has stepTwo:
            -> lana_notturna.step_due 
        - narrativeGrowthLanaNotturna has stepThree:
            -> lana_notturna.step_tre 
    }
        
    
    - greenhouse_chosenCultivable has LicheneDegliAbissi:
    {
        - narrativeGrowthLicheneDegliAbissi == stepZero:
            -> lichene_degli_abissi.step_zero
        - narrativeGrowthLicheneDegliAbissi == stepOne:
            -> lichene_degli_abissi.step_uno
        - narrativeGrowthLicheneDegliAbissi == stepTwo:
            -> lichene_degli_abissi.step_due
        - narrativeGrowthLicheneDegliAbissi == stepThree:
            -> lichene_degli_abissi.step_tre
    }

    - greenhouse_chosenCultivable has NonTiScordarDiTe:
    {
        - narrativeGrowthNonTiScordarDiTe == stepZero:
            -> non_ti_scordar_di_te.step_zero     
        - narrativeGrowthNonTiScordarDiTe == stepOne:
            -> non_ti_scordar_di_te.step_uno
        - narrativeGrowthNonTiScordarDiTe == stepTwo:
            -> non_ti_scordar_di_te.step_due
        - narrativeGrowthNonTiScordarDiTe == stepThree:
            -> non_ti_scordar_di_te.step_tre
    }    

    - greenhouse_chosenCultivable has Olobino:
    {
        - narrativeGrowthOlobino has stepZero:
            -> olobino.step_zero 
        - narrativeGrowthOlobino has stepOne:
            -> olobino.step_uno 
        - narrativeGrowthOlobino has stepTwo:
            -> olobino.step_due 
        - narrativeGrowthOlobino has stepThree:
            -> olobino.step_tre 
    }    


    - greenhouse_chosenCultivable has LaSpazzata:
    {
        - narrativeGrowthLaSpazzata == stepZero:
            -> la_spazzata.step_zero 
        - narrativeGrowthLaSpazzata == stepOne:
            -> la_spazzata.step_uno
        - narrativeGrowthLaSpazzata == stepTwo:
            -> la_spazzata.step_due
        - narrativeGrowthLaSpazzata == stepThree:
            -> la_spazzata.step_tre
    }

    
    -> main
}


=== bacca_della_addolorata

    = TW
        -> step_zero
        
    = step_zero
        -> remove_proposed_cultivable ->
            ~ growthBaccaDellaAddolorata = stepZero
        <i>L'aria attorno a {player_name} vibra di tensione.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            -> main
    
    = step_uno
        <i>Odore elettrico e ceramica tesa.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Un vaso deformato resiste con fatica alla sua stessa pressione.
            -> main
    
    = step_due
        <i>Il vaso è come fango al sole.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Un ramo saggia l'aria.
        <i>Asciutto e timido verso {player_name}.
          -> main
          
    = step_tre
        <i>L'aria è attesa.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>La strada è chiara, manca solo il primo passo.
        <i>Qualcosa da ammettere.
        
            + (colto) [<i>Confido le mie paure.]
                ~ growthBaccaDellaAddolorata = stepThree
            
            <i>Rami verso il cielo sostengono un frutto.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            <i>Semi rosati e foglie carnose.
            <i>Coraggiosa, la <b>Bacca dell'Addolorata</b> espone le sue ferite al mondo.
            <i>La pianta di chi finalmente ha trovato la sua strada ma non riesce ancora ad avanzare.
            <i>Tenace il frutto, e rilassate le spalle di {player_name}.
            <i>L'incertezza scivola via.
            <i>{player_name} ricorda come camminare.
                    -> ending_cultivation
                    
            + [<i>Ho bisogno di tempo per riflettere.]
                    -> main     

              

=== barba_dell_inciampo

    = TW
        -> step_zero
    
    = step_zero
            -> remove_proposed_cultivable ->
            ~ growthBarbaDellInciampo = stepZero
        
        <i>L'errore è come una spina.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Una scheggia che brucia anche nel riposo.
        <i>Che rende bianche le notti di {player_name}.
                -> main
    
    = step_uno
        <i>La spina infetta.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Infetta la lingua di colpa.
        <i>La lingua difende.
        <i>La lingua critica.
        <i>La lingua aggredisce.
        <i>La colpa attanaglia {player_name}.
                -> main
    
    = step_due
        <i>La colpa si fa muro.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>L'errore nascosto, la spina protetta.
        <i>La colpa si fa muro.
        <i>La colpa cresce, cresce la paura di {player_name}.
                -> main
    
    = step_tre
        <i>Il muro vacilla.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Non ricorda più se protegge il fuori dal dentro, o il dentro dal fuori.

        + (colto)[<i>Abbasso le mie difese.]
            ~ growthBarbaDellInciampo = stepThree
            
            <i>Il muro si fa calice.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            <i>Gli occhi di {player_name} vedono al di là da sé.
            <i>C'è pace in {player_name}.
            <i>Pace nella serra.
            <i>La barricata della <b>Barba dell'inciampo</b> ora è tana.
            <i>Separa colpa e responsabilità.
            <i>Punizione ed elaborazione.
            <i>La spina della <b>Barba dell'inciampo</b> ora è riparo.
            <i>E l'errore di {player_name} guida per cambiare.
                ~ move_entity(Snail, Greenhouse)            
                -> ending_cultivation
            
        + [<i>Mi prendo ancora del tempo.]
                    -> main     
                    
=== bastone_dell_ozioso

    = TW
        -> step_zero
    
    = step_zero
            -> remove_proposed_cultivable ->
        ~ growthBastoneDellOzioso = stepZero

        <i>{player_name} ha un prurito.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Un prurito che è gesto, nota, passo, salto.
        <i>Qualcosa di trattenuto, qualcosa di mai fatto.
                -> main
    
    = step_uno
        <i>Il prurito riempie la testa.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>{player_name} si dice che non si fanno le cose che non si sanno fare.
        <i>Ma {player_name} si dice anche che a volte serve un solo passo per iniziare a ballare.
                -> main
    
    = step_due
        <i>Il prurito si è fatto gioia, si è fatto movimento.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Le mani di {player_name} applaudono da sole quando arriva il momento.
        <i>E anche se non lo sa davvero fare, a chi importa?
        <i>Chi decide come è giusto camminare?
                -> main
    
    = step_tre
        <i>Il vento tra le canne vuote canta.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        
        + (colto)[<i>E io canto con lui.]
            ~ growthBastoneDellOzioso = stepThree
            
            <i>Rami come braccia come gambe come festa.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            <i>Il prurito è una protesta.
            <i>I rami del <b>Bastone dell'Ozioso</b> vibrano di note stonate.
            <i>Le giunture si agitano sgraziate.
            <i>Ma non c'è gioia più grande del fare per il solo piacere di fare.
            <i>Senza luoghi dove andare.
            <i>Senza classifiche da scalare.

                ~ move_entity(BastonSound, Greenhouse)
                    -> ending_cultivation
            
        + [<i>Aspetto.]
                -> main          
        
        
=== brina_dell_impossibile

    = TW
        -> step_zero
        
    = step_zero
        -> remove_proposed_cultivable ->
            ~ growthBrinaDellImpossibile = stepZero

            <i>Una crepa.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            <i>Un pezzo di mondo attraverso la finestra.
            -> main
    
    = step_uno
        <i>Ferite nel vetro.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Odore di stagno.
        <i>Di cose che {player_name} non ha mai guardato.
        <i>La crepa si è estesa.
          -> main
          
    = step_due
        <i>Il mondo alle sue spalle.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Il vetro resiste.
        <i>Compie la sua trasparente missione, ignorando il proprio dolore.
          -> main
    
    = step_tre
        <i>Isole di vetro galleggiano nell'aria.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Sostengono il proprio ruolo.
        <i>Si reggono a vecchie ferite.
        
        + (colto) [<i>E io osservo le mie.]
             ~ growthBrinaDellImpossibile = stepThree

            <i>Baccelli crescono tra le ferite, navi colme di semi.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            <i>{player_name} nomina qualcosa del suo passato.
            <i>Qualcosa che è sempre stato lì ma non vedeva.
            <i>La <b>Brina dell'Impossibile</b> si raccoglie nel luogo di un trauma.
            <i>Riempie le ferite affinché siano visibili.
            <i>Risveglia il dolore, così che lo si possa nominare.
            <i>Conosce la fatica del percorso, e offre baccelli vivi di speranza.
                
                -> ending_cultivation
        
        + [<i>Per ora ignoro le mie.]
                    -> main              
                    
=== canto_delle_compagne

    = TW
        -> step_zero

    = step_zero
        -> remove_proposed_cultivable ->
        ~ growthCantoDelleCompagne = stepZero

        <i>Qualcosa vibra e sveglia le gambe di {player_name}.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Ha voglia di danzare.
            -> main
        
    = step_uno
        <i>Il vaso è caldo al tocco.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>L'aria attorno rifiorisce di una nebbiolina rossastra.
          -> main
          
    = step_due
        <i>La nebbia si è fatta fiume, gocce che vibrano.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Che danzano.
        <i>E quando si scontrano, la serra riecheggia di una festosa risata.
            -> main
          
    = step_tre
        <i>La serra si muove e si scuote, le travi cigolano nel voler danzare. #speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>I piedi di {player_name} battono il ritmo.
        
        + (colto)[<i>Inizio a danzare.]
            ~ growthCantoDelleCompagne = stepThree
            
            <i>Ilare, <b>Canto delle compagne</b> turbina e balla riversandosi dal vaso.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            <i>In un altro tempo questo cespuglio veniva chiamato "Canto delle streghe".
            <i>L'euforia riempie i polmoni di {player_name}, sente la gioia di sapere che non è mai stata davvero {player_pronouns has him:solo|{player_pronouns has her:sola|solə}}.
            <i>I piedi spingono il suo corpo nella stanza.
            <i>La sua voce si alza e canta, chiama l3 compagn3.
            <i>Si uniscono in una festa, un sabba, rendendo il mondo intero il loro palcoscenico.
            <i>Ridendo feroci di chi l3 teme.
            
                ~ backpack_findedGifts += CantoDelleCompagne
                ~ move_entity(RedBee, Greenhouse)
                -> ending_cultivation
        
        + [<i>Preferisco aspettare.]
                    -> main     

              
=== cardo_aspinato

    = TW
        -> step_zero
    
    = step_zero
        -> remove_proposed_cultivable ->
        ~ growthCardoAspinato = stepZero
        
        <i>Odore di buio, di cielo senza stelle.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Di bosco e nebbia e nessuna strada da imboccare.
        <i>E una palla soffice deposta sul terreno.
                -> main
    
    = step_uno
        <i>Rumore di passi, qualcosa che corre, che fugge, che non arriva mai.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>I peli del fusto vibrano, si sollevano quando {player_name} si avvicina, {player_pronouns has him:lo|{player_pronouns has her:la|lə}} tengono distante.
                -> main
    
    = step_due
        <i>È comparsa una gemma sulla cima dello stelo.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>E dalla gemma emergono filamenti disgustosi, il loro puzzo chiede di provare paura, di allontanarsi, di arrendersi, di evitare ogni contatto.
                -> main
    
    = step_tre
        La resistenza della pianta si fa sempre più debole.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        
        + (colto)[<i>Offro il mio aiuto.]
            ~ growthCardoAspinato = stepThree
            
            <i>La piante cede, si stende tra le gambe di {player_name}.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            <i>{player_name} allunga le dita, ne carezza il pelo, e al contatto, sente.
            <i>Sente la luna, le stelle, le foglie nel vento, l'erba umida.
            <i>Sente abbracci e sorrisi e mani che sorreggono.
            <i>La pianta sboccia.
            <i>Il <b>Cardo aspinato</b> sboccia nel supporto.
            <i>Nel capire che lasciarsi aiutare è aiutare l'altrə.
            <i>Nell'accettare che aiutare è aiutarsi.
                ~ move_entity(BrownBee, Greenhouse)
                -> ending_cultivation
            
            + [<i>Preferisco aspettare.]
                    -> main          


=== edera_delle_amanti

    = TW
        <i>Attenzione: questa pianta allude a contenuti erotici.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>{player_name} vuole farla crescere, o preferisce cambiare?
            + [<i>Voglio andare avanti.]
                -> step_zero
            
            + [<i>Voglio rimuoverla, ma solo per ora.]
                -> tempCultTW_formula
                
            + (rimuovi) <i>[Voglio rimuoverla per sempre.]
                -> remove_proposed_cultivable ->
                    ~ greenhouse_chosenCultivable = ()
                {
                    - greenhouse_backupCultivable != ():
                        ->  cultivable_test
                    
                    - else:
                        <i>Al momento la serra non ha domande da porre a {player_name}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                    -> main
                }
            
    
    = step_zero
        -> remove_proposed_cultivable ->  
        ~ growthEderaDelleAmanti = stepZero
        
        <i>Il vaso gronda miele luminoso, calore riempie gli occhi di {player_name}.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>I polpastrelli hanno fame.
            -> main
    
    = step_uno
        <i>Rami morbidi si sollevano lungo le pareti della serra.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Le labbra di {player_name} vibrano. 
            -> main
          
    = step_due
        <i>I rami si sfiorano desideranti, colmi, sinuosi. #speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Si avviluppano giocosi.
        <i>Radici gentili saggiano il legno della serra, lo sfiorano, lo penetrano.
        <i>Foglie giovani maturano, nutrendosi di questo gioco.
            -> main
    
    = step_tre
        <i>Calore nel ventre.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Un pezzo di serra è abbracciato da foglie e bisbigli.
        <i>Faticoso è resistere all'idea di tuffarvisi.
        
            + (colto) [<i>Mi tuffo con loro.]
                ~ growthEderaDelleAmanti = stepThree
                
                <i>Per un attimo {player_name} perde i suoi confini.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
                <i>Diventa un bacio nella notte, dita desiderate tra le cosce.
                <i>Acqua sulle labbra, pelle nuda sulla terra umida.
                <i>Pienezza che riempie, la forza dell'<b>Edera delle amanti</b>.
                <i>Il corpo colmo di piacere.
                <i>Di fusione.
                <i>Vivo.
                
                    ~ move_entity(GoldenBee, Greenhouse)
                    -> ending_cultivation
            
            + [<i>Preferisco aspettare.]
                    -> main        

=== erba_liccia

    = TW
        -> step_zero
    
    = step_zero
        -> remove_proposed_cultivable ->
        ~ growthErbaLiccia = stepZero
        
        <i>Dal vaso due cespuglietti erbosi.
        <i>Da {player_name} due pensieri spinosi: quando ho smesso di essere ciò che ero, e sono diventat{player_pronouns has him:o|{player_pronouns has her:a|ə}} ciò che sono?#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            -> main
    
    = step_uno
        <i>L'erba cresce e i pensieri di {player_name} con lei.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Sono la persona che avrei voluto essere?
        <i>O ho tradito le promesse del mio passato?
            -> main
    
    = step_due
        <i>I due cespuglietti si sfiorano, si sfiorano i pensieri di {player_name}.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Le parti di sé che non ci sono più.
        <i>Quelle nuove.
        <i>E quelle che si sono trasformate nel tempo.
        <i>Cosa significa cambiare?
            -> main
    
    = step_tre
        <i>Il passato è una terra spinosa.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Il ricordo si modella sul bisogno del presente.
        <i>Il futuro sboccia nella contraddizione.
        
        + (colto)[<i>E io rifuggo la coerenza.]
            ~ growthErbaLiccia = stepThree
            
            <i>Il vaso brulica di erba verde e fresca.
            <i>L'<b><i>Erba Liccia</b></i> matura quando le sue radici aeree sanno ritrovarsi.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            <i>Quando nel cambiamento sanno ritrovarsi.
            <i>Quando sanno vedere ciò che erano, accogliere ciò che sono, curiosare su ciò che saranno.
                    -> ending_cultivation
        
        + [<i>Preferisco aspettare.]
                    -> main                                      

=== falsa_palude

    = TW
        -> step_zero
    
    = step_zero
        -> remove_proposed_cultivable ->
        ~ growthFalsaPalude = stepZero
        
        <i>Il vento spinge lo sporco sul pavimento, avvicinandolo ai piedi di {player_name}.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            -> main
    
    = step_uno
        <i>Lo sporco si è accresciuto.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>E ogni sua parte bisbiglia parole.
        <i>Il nome di {player_name} sembra lontano.
        <i>Ma riconosce sentimenti che ha già vissuto.
            -> main
    
    = step_due
       <i>Nella calma della serra il pavimento sembra vivo.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
       <i>Foglie e fiori e pistilli avanzano l3 un3 verso l3 altr3.
       <i>Il sentimento si è fatto movimento.
       <i>Forse {player_name} non è {player_pronouns has him:solo|{player_pronouns has her:sola|solə}} nel vivere certe emozioni?
            -> main
    
    = step_tre
        <i>La separazione è solo illusione.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        
        + (colto)[<i>Voglio vedere oltre l'illusione.]
            ~ growthFalsaPalude = stepThree
            
            <i>Il movimento si è fatto unione, si è fatto gruppo.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            <i>E un cespuglio fitto e odoroso illumina il pavimento della serra.
            <i>E tutta la <b>Falsa Palude</b> sospira.
            <i>Esule dell'acqua, eppure capace di germogliare.
            <i>La <b>Falsa Palude</b> è corallo di terra, colonia.
            <i>Vibrazione vicina e ascolto.
            <i>Ciò che accade quando il dolore si fa terreno comune.
            <i>Quando storie diverse riconoscono la propria voce.
            <i>E ciò che sembrava un ostacolo personale, si dimostra un problema strutturale.
                -> ending_cultivation
        
        + [<i>Preferisco aspettare.]
                -> main                                 

=== lana_notturna

    = TW
        -> step_zero
    
    = step_zero
        -> remove_proposed_cultivable ->
        ~ growthLanaNotturna = stepZero
        
        <i>Ha quella sensazione, {player_name}.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Quella di quando la notte {player_pronouns has him:lo|{player_pronouns has her:la|lə}} afferra nel letto, svegliandola, ributtandola in incubi e pensieri quotidiani soffocanti.
        <i>Di quando si agita tra le coperte, in trappola.
                -> main
    
    = step_uno
        <i>Le cose che non può cambiare si affastellano sulla pelle di {player_name}, le cose che non vanno.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Si appesantiscono sulle mani, schiacciano lo stomaco.
        <i>L'aria è sabbia, le scarse ombre minaccia.
            -> main
    
    = step_due
        <i>Fare un passo fuori dal letto è come una corsa.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Aprire la porta, accendere una luce.
        <i>Il mondo fuori dorme, ma {player_name} è {player_pronouns has him:sveglio|{player_pronouns has her:sveglia|svegliə}}.
        <i>Qualcosa si appoggia sulle sue labbra, sulla sua coscienza.
            -> main
    
    = step_tre
        <i>Perché il fiore sbocci, la gemma deve spaccarsi, ferirsi.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Ma serve attendere il tempo giusto, lasciare che le cose possano maturare.
        
        + (colto)[<i>Ho imparato ad attendere.]
            ~ growthLanaNotturna = stepThree
            
            <i>Un unico grande e morbido fiore, i petali soffici si spalancano nella serra.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            <i><b>Lana Notturna</b> è una coperta nella notte, una tisana nei giorni bui.
            <i>Sboccia nelle terre dimenticate, per ricordare che anche quando tutto sembra perduto, da qualche parte cresce il seme del cambiamento.
                -> ending_cultivation
        
        + [<i>Preferisco aspettare.]
                -> main             
                    
=== lichene_degli_abissi
    
    = TW
        -> step_zero
        
    = step_zero
        -> remove_proposed_cultivable ->
        ~ growthLicheneDegliAbissi = stepZero
        
        <i>Due mondi si incontrano.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Foglie nuove si accrescono.
        <i>L'aria è piena di possibilità.
            -> main
    
    = step_uno
        <i>Le foglie ora riempiono ogni cosa, vedono solo sé stesse.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            -> main
          
    = step_due
        <i>Fiori come cuori, e un susseguirsi di bisbigli amorosi.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Le radici interconnesse, indistricate.
        <i>Piccoli pruriti taciuti.
        <i>La volontà di non trovare una separazione.
            -> main
          
    = step_tre
        <i>Dubbi e non detti esplodono come lame.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Ciò che prima era amorevolmente interconnesso ora è imprigionato.
        <i>Ci sono forze da rilasciare.

            + (colto) [<i>Ho qualcuno da salutare.]
                ~ growthLicheneDegliAbissi = stepThree
                
                <i><b>Lichene degli abissi</b> offre frutti taglienti.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
                <i>Cresce dove ci sono relazioni che non sanno maturare.
                <i>Storie da lasciare.
                <i>L'odore delle sue foglie sa di persone allontanate.
                <i>Di addii dolorosi.
                <i>E ferite da risanare.
                    -> ending_cultivation
                    
             + [<i>Preferisco aspettare.]
                    -> main
                    
=== non_ti_scordar_di_te

    = TW
        -> step_zero
        
    = step_zero
        -> remove_proposed_cultivable ->
        ~ growthNonTiScordarDiTe = stepZero
        
        <i>Radici cromate si raccolgono in piccoli mucchi.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>L'aria odora di terra e ricordi.
            -> main
    
    = step_uno
        <i>L'unione ha portato a una fioritura.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Le radici cespugliose sono sbocciate in qualcosa di nuovo.
        <i>{player_name} pensa a chi da tempo cammina con {player_pronouns has him:lui|{player_pronouns has her:lei|ləi}}.
            -> main
          
    = step_due
        <i>Nuove congiunzioni si accrescono tra i cespugli radicali.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Ciò che era separato genera nuove storie.
            -> main
          
    = step_tre
        <i>Qualcosa di nuovo attende la sua occasione per fiorire.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}

        + (colto) [<i>Penso alle persone che mi compongono.]
            ~ growthNonTiScordarDiTe = stepThree
            
            <i>{player_name} si sente ramo, si sente radice.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            <i>Si sente le persone che è {player_pronouns has him:stato|{player_pronouns has her:stata|statə}} e quelle che sarà.
            <i>Le persone che l'hanno {player_pronouns has him:accompagnato|{player_pronouns has her:accompagnata|accompagnatə}} nella sua vita.
            <i><b>Non ti scordar di te</b> è la pianta del ricordo.
            <i>E del costruire.
            <i>Del celebrare le parti di chi abbiamo incontrato, che continuano a vivere in noi.
            <i>Del sentirci eredi e messagger3, parte di un percorso intessuto di nomi.
                    -> ending_cultivation
                    
            + [<i>Preferisco aspettare.]
                    -> main          
                    
                    

=== olobino

    = TW
        -> step_zero
    
    = step_zero
        -> remove_proposed_cultivable ->
        ~ growthOlobino = stepZero
        
        <i>Piccoli bottoni luccicanti osservano la serra.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Le mani di {player_name} sembrano più calde.
            -> main
    
    = step_uno
        <i>I muscoli di {player_name} si distendono.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>La mente si fa limpida.
            -> main
    
    = step_due
       <i>Ogni morbido fungo sembra sparire nell'altro.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
       <i>Il sottile micelio si mescola alle venature del legno.
       <i>E {player_name}...
       <i>Perché dovrebbe limitarsi ad essere {player_name}?
            -> main
    
    = step_tre
        <i>Il tempo si mescola, ieri è oggidomanimai.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>I confini si sciolgono e un corpo è stanzapiantalucerespiro.
        
        + (colto)[<i>Mi sciolgo nel tempo.]
            ~ growthOlobino = stepThree
            
            <i>C'è solo amore.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            <i>Per le persone care e per quelle mai conosciute, per quelle perse e quelle che verranno.
            <i>Per l'insetto nel giardino e l'uccello nel cielo.
            <i>Per l'acqua sulla fronte e la plastica sotto le dita.
            <i>C'è completezza, non separazione.
            <i>C'è e non c'è e ci sarà ed è stato ed è qui, ora.
            <i>L'<b>Olobino</b> è un fungo semplice pieno di potere.
            <i>Il potere che c'è nel perdere il sé.
            <i>L'eternità nella collettività.
                    -> ending_cultivation
            
            + [<i>Preferisco aspettare.]
                    -> main          
                    
                    

=== la_spazzata

    = TW
        -> step_zero

        
    = step_zero
        -> remove_proposed_cultivable ->
        ~ growthLaSpazzata = stepZero
        
        <i>Il pavimento della serra si è spezzato, riempiendosi dell'acqua che viene dallo stagno.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Una singola piccola fogliolina galleggia morbidamente.
        <i>Un singolo piccolo pensiero stuzzica {player_name}.
            -> main
         
    = step_uno
        <i>Molte più foglie riempiono ora la fossa. #speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Molti più pensieri riempiono la testa di {player_name}.
        <i>Cos'era quella cosa che avrebbe voluto dire a, sì, sa a chi.
        <i>Ma non è il caso, alla fine.
        <i>Non è mai il caso.
            -> main
    
    = step_due
        <i>La serra è invasa di foglie, l'acqua si infila sotto vasi e mobili. #speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>E pensieri come spilli invadono la testa di {player_name}.
        <i>L'ansia si infila sotto ricordi e sicurezze, e tutto trema.
            -> main
    
    = step_tre
        <i>Il pavimento vuoto scricchiola.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Tutto sembra in ordine, eppure la testa di {player_name} è pronta ad esplodere.

        + (colto)[<i>C'è qualcosa che devo dire da molto tempo.]
            ~ growthLaSpazzata = stepThree
            
           <i>Odore di autunno, di foglie umide.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            <i>Ai piedi di {player_name} resta il foro della <b>Spazzata</b>.
            <i>La Spazzata è e non è.
            <i>Si abbuffa delle cose non dette.
            <i>E quando è sazia, travolge ogni cosa.
            <i>Ma la pancia di {player_name} è colma di un senso di vuoto.
            <i>La sensazione di quando ha condiviso qualcosa che riteneva terribile.
            <i>Per poi scoprire che il mondo non è finito quella volta, e non finirà oggi.
            <i>Le cose sono sempre peggiori nella propria testa.
            <i>Ma reali, lasciano segni e ferite.
                    -> ending_cultivation
                    
            + [<i>Preferisco aspettare.]
                    -> main                              

=== ending_cultivation
     {
       - ending_cultivation == 1:
           ~ saturationVar ++
           ~ move_entity(cultivationKit, Bedroom)
     }
    
    {
       - are_two_entities_together(PG,RewriterBook):
           @animation:RewriterBook
    }
    {
        - contentsBook hasnt GreenhouseRecap:
        ~ move_entity(GreenhouseRecap, BookPlace)
    }
    @animation:Backpack
    
    <i>{~ {player_name} ha raccolto|{player_name} ha ricevuto in dono|Tra le dita {player_name} si ritrova|Nello zaino {player_name} ora ha|{player_name} riceve in dono|Ecco per {player_name}} {ingredientTranslator(greenhouse_chosenCultivable)}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    
    
    ~ backpack_findedGifts += greenhouse_chosenCultivable
    ~ greenhouse_cultivableGrowing = 0
    ~ greenhouse_chosenCultivable = ()
    
    + {greenhouse_backupCultivable != ()}[<i>Voglio coltivare qualcosa di nuovo.]
            -> cultivable_test
    
    + [<i>{~ Mi aggiro per la serra.|Osservo ciò che è in crescita.|Ascolto i rumori della serra.|Mi rilasso un attimo.|Mi perdo nei colori dei vasi.}]  
            -> main    