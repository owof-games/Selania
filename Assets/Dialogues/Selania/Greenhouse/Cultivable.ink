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

    - chosenCultivable has BaccaDellaAddolorata:
        {
            - growStep has stepZero:
                ~ growthBaccaDellaAddolorata = stepZero
                ~ narrativeGrowthBaccaDellaAddolorata = stepZero
            - growStep has stepOne:
                ~ growthBaccaDellaAddolorata = stepOne
                ~ narrativeGrowthBaccaDellaAddolorata = stepOne
            - growStep has stepTwo:
                ~ growthBaccaDellaAddolorata = stepTwo
                ~ narrativeGrowthBaccaDellaAddolorata = stepTwo
            - growStep has stepThree:
                 ~ growthBaccaDellaAddolorata = stepTwo
                 ~ narrativeGrowthBaccaDellaAddolorata = stepThree
        }
    - chosenCultivable has BarbaDellInciampo:
        {
            - growStep has stepZero:
                ~ growthBarbaDellInciampo = stepZero
                ~ narrativeGrowthBarbaDellInciampo = stepZero
            - growStep has stepOne:
                ~ growthBarbaDellInciampo = stepOne
                ~ narrativeGrowthBarbaDellInciampo = stepOne
            - growStep has stepTwo:
                ~ growthBarbaDellInciampo = stepTwo
                ~ narrativeGrowthBarbaDellInciampo = stepTwo
            - growStep has stepThree:
                 ~ growthBarbaDellInciampo = stepTwo
                 ~ narrativeGrowthBarbaDellInciampo = stepThree
        }

    - chosenCultivable has BastoneDellOzioso:
        {
            - growStep has stepZero:
                ~ growthBastoneDellOzioso = stepZero
                ~ narrativeGrowthBastoneDellOzioso = stepZero
            - growStep has stepOne:
                ~ growthBastoneDellOzioso = stepOne
                ~ narrativeGrowthBastoneDellOzioso = stepOne
            - growStep has stepTwo:
                ~ growthBastoneDellOzioso = stepTwo
                ~ narrativeGrowthBastoneDellOzioso = stepTwo
            - growStep has stepThree:
                 ~ growthBastoneDellOzioso = stepTwo
                 ~ narrativeGrowthBastoneDellOzioso = stepThree
        } 
    
    - chosenCultivable has BrinaDellImpossibile:
        {
            - growStep has stepZero:
                ~ growthBrinaDellImpossibile = stepZero
                ~ narrativeGrowthBrinaDellImpossibile = stepZero
            - growStep has stepOne:
                ~ growthBrinaDellImpossibile = stepOne
                ~ narrativeGrowthBrinaDellImpossibile = stepOne
            - growStep has stepTwo:
                ~ growthBrinaDellImpossibile = stepTwo
                ~ narrativeGrowthBrinaDellImpossibile = stepTwo
            - growStep has stepThree:
                 ~ growthBrinaDellImpossibile = stepTwo
                 ~ narrativeGrowthBrinaDellImpossibile = stepThree
        }

    - chosenCultivable has CantoDelleCompagne:
        {
            - growStep has stepZero:
                ~ growthCantoDelleCompagne = stepZero
                ~ narrativeGrowthCantoDelleCompagne = stepZero
            - growStep has stepOne:
                ~ growthCantoDelleCompagne = stepOne
                ~ narrativeGrowthCantoDelleCompagne = stepOne
            - growStep has stepTwo:
                ~ growthCantoDelleCompagne = stepTwo
                ~ narrativeGrowthCantoDelleCompagne = stepTwo
            - growStep has stepThree:
                 ~ growthCantoDelleCompagne = stepTwo
                 ~ narrativeGrowthCantoDelleCompagne = stepThree
        }
    
    - chosenCultivable has CardoAspinato:
        {
            - growStep has stepZero:
                ~ growthCardoAspinato = stepZero
                ~ narrativeGrowthCardoAspinato = stepZero
            - growStep has stepOne:
                ~ growthCardoAspinato = stepOne
                ~ narrativeGrowthCardoAspinato = stepOne
            - growStep has stepTwo:
                ~ growthCardoAspinato = stepTwo
                ~ narrativeGrowthCardoAspinato = stepTwo
            - growStep has stepThree:
                 ~ growthCardoAspinato = stepTwo
                 ~ narrativeGrowthCardoAspinato = stepThree
        }     

    - chosenCultivable has EderaDelleAmanti:
        {
            - growStep has stepZero:
                ~ growthEderaDelleAmanti = stepZero
                ~ narrativeGrowthEderaDelleAmanti= stepZero
            - growStep has stepOne:
                ~ growthEderaDelleAmanti = stepOne
                ~ narrativeGrowthEderaDelleAmanti= stepOne
            - growStep has stepTwo:
                ~ growthEderaDelleAmanti = stepTwo
                ~ narrativeGrowthEderaDelleAmanti= stepTwo
            - growStep has stepThree:
                 ~ growthEderaDelleAmanti = stepTwo
                 ~ narrativeGrowthEderaDelleAmanti= stepThree
        }
    
    - chosenCultivable has ErbaLiccia:
        {
            - growStep has stepZero:
                ~ growthErbaLiccia = stepZero
                ~ narrativeGrowthErbaLiccia = stepZero
            - growStep has stepOne:
                ~ growthErbaLiccia = stepOne
                ~ narrativeGrowthErbaLiccia = stepOne
            - growStep has stepTwo:
                ~ growthErbaLiccia = stepTwo
                ~ narrativeGrowthErbaLiccia = stepTwo
            - growStep has stepThree:
                 ~ growthErbaLiccia = stepTwo
                 ~ narrativeGrowthErbaLiccia = stepThree
        }
    
    - chosenCultivable has FalsaPalude:
        {
            - growStep has stepZero:
                ~ growthFalsaPalude = stepZero
                ~ narrativeGrowthFalsaPalude = stepZero
            - growStep has stepOne:
                ~ growthFalsaPalude = stepOne
                ~ narrativeGrowthFalsaPalude = stepOne
            - growStep has stepTwo:
                ~ growthFalsaPalude = stepTwo
                ~ narrativeGrowthFalsaPalude = stepTwo
            - growStep has stepThree:
                 ~ growthFalsaPalude = stepTwo
                 ~ narrativeGrowthFalsaPalude = stepThree
        }     
    
    - chosenCultivable has LanaNotturna:
        {
            - growStep has stepZero:
                ~ growthLanaNotturna = stepZero
                ~ narrativeGrowthLanaNotturna = stepZero
            - growStep has stepOne:
                ~ growthLanaNotturna = stepOne
                ~ narrativeGrowthLanaNotturna = stepOne
            - growStep has stepTwo:
                ~ growthLanaNotturna = stepTwo
                ~ narrativeGrowthLanaNotturna = stepTwo
            - growStep has stepThree:
                 ~ growthLanaNotturna = stepTwo
                 ~ narrativeGrowthLanaNotturna = stepThree
        }
        
    - chosenCultivable has LicheneDegliAbissi:
        {
            - growStep has stepZero:
                ~ growthLicheneDegliAbissi = stepZero
                ~ narrativeGrowthLicheneDegliAbissi = stepZero
            - growStep has stepOne:
                ~ growthLicheneDegliAbissi = stepOne
                ~ narrativeGrowthLicheneDegliAbissi = stepOne
            - growStep has stepTwo:
                ~ growthLicheneDegliAbissi = stepTwo
                ~ narrativeGrowthLicheneDegliAbissi = stepTwo
            - growStep has stepThree:
                ~ growthLicheneDegliAbissi = stepTwo
                ~ narrativeGrowthLicheneDegliAbissi = stepThree
        }
    
    - chosenCultivable has NonTiScordarDiTe:
        {
            - growStep has stepZero:
                ~ growthNonTiScordarDiTe = stepZero
                ~ narrativeGrowthNonTiScordarDiTe = stepZero
            - growStep has stepOne:
                ~ growthNonTiScordarDiTe = stepOne
                ~ narrativeGrowthNonTiScordarDiTe = stepOne
            - growStep has stepTwo:
                ~ growthNonTiScordarDiTe = stepTwo
                ~ narrativeGrowthNonTiScordarDiTe = stepTwo
            - growStep has stepThree:
                 ~ growthNonTiScordarDiTe = stepTwo
                 ~ narrativeGrowthNonTiScordarDiTe = stepThree
        }
    
    - chosenCultivable has Olobino:
        {
            - growStep has stepZero:
                ~ growthOlobino = stepZero
                ~ narrativeGrowthOlobino = stepZero
            - growStep has stepOne:
                ~ growthOlobino = stepOne
                ~ narrativeGrowthOlobino = stepOne
            - growStep has stepTwo:
                ~ growthOlobino = stepTwo
                ~ narrativeGrowthOlobino = stepTwo
            - growStep has stepThree:
                 ~ growthOlobino = stepTwo
                 ~ narrativeGrowthOlobino = stepThree
        }

    - chosenCultivable has LaSpazzata:
        {
            - growStep has stepZero:
                ~ growthLaSpazzata = stepZero
                ~ narrativeGrowthLaSpazzata = stepZero
            - growStep has stepOne:
                ~ growthLaSpazzata = stepOne
                ~ narrativeGrowthLaSpazzata = stepOne
            - growStep has stepTwo:
                ~ growthLaSpazzata = stepTwo
                ~ narrativeGrowthLaSpazzata = stepTwo
            - growStep has stepThree:
                 ~ growthLaSpazzata = stepTwo
                 ~ narrativeGrowthLaSpazzata = stepThree
        }
    ->->
}

->->

=== plant_check
{
    - chosenCultivable has BaccaDellaAddolorata:
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

    - chosenCultivable has BarbaDellInciampo:
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
    
    - chosenCultivable has BastoneDellOzioso:
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

    - chosenCultivable has BrinaDellImpossibile:
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

    - chosenCultivable has CantoDelleCompagne:
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
    
    - chosenCultivable has CardoAspinato:
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

    - chosenCultivable has EderaDelleAmanti:
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
    
    - chosenCultivable has ErbaLiccia:
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

    - chosenCultivable has FalsaPalude:
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

    - chosenCultivable has LanaNotturna:
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
        
    
    - chosenCultivable has LicheneDegliAbissi:
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

    - chosenCultivable has NonTiScordarDiTe:
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

    - chosenCultivable has Olobino:
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


    - chosenCultivable has LaSpazzata:
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
        //{chosenCultivable} affronta questo tema delicato: XYZ.
        //Te la senti di farla crescere, o preferisci cambiare?
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
        
        Nulla cambia.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            -> main
    
    = step_uno
        Un vaso inizia a deformarsi.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        {name} sente un poco di freddo.
            -> main
    
    = step_due
        Un ramo rompe il vaso.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        Insicuro eppure diritto punta verso {name}.
          -> main
          
    = step_tre
        Il vaso è colmo di tensione.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        La strada è chiara, manca solo il primo passo.
        Il primo passo, e ammettere le proprie paure.
 
            + (colto) [Espongo le mie ferite.]
                ~ growthBaccaDellaAddolorata = stepThree
            
            Rami verso il cielo sostengono un frutto.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            Semi rossastri e foglie sottili.
            Coraggiosa, la <b>Bacca dell'Addolorata</b> espone le sue ferite al mondo.</b>
            Una pianta cara a chi ha finalmente trovato la sua strada, ma non riesce ancora ad avanzare.
            Il frutto si rivela tenace, deciso.
            Si rilassano le spalle di {name}.
            L'incertezza scivola via.
            L'avanzare di un ramo timido ha permesso alla <b>Bacca</b> di fruttare.
            Compiere il primo passo è faticoso.
            Ma ora {name} ricorda come camminare.
                    -> ending_cultivation
                    
            + [Preferisco aspettare.]
                    -> main     

              

=== barba_dell_inciampo

    = TW
        ////{chosenCultivable} affronta questo tema delicato: XYZ.
        //Te la senti di farla crescere, o preferisci cambiare?
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
        
        {name} ha commesso un errore.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        Un errore che è come una lancia.
                -> main
    
    = step_uno
        La colpa attanaglia {name}.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        Se qualcunə critica, aggredisce.
        Parole come lame, pronte a ferire.
                -> main
    
    = step_due
       Le lame si fanno muro.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
       Nascondono l'errore dal mondo.
       Nascondono l'errore da {name}.
       La colpa è come veleno.
                -> main
    
    = step_tre
        Il muro sostiene a fatica.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        Non ricorda più se ciò che deve difendere è fuori o dentro di sé.
        
        + (colto)[Abbasso le mie difese.]
            ~ growthBarbaDellInciampo = stepThree
            
            Il muro si è fatto calice.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            Quando {name} abbassa le difese, vede con occhi diversi.
            E la pianta con {pronouns has him:lui|{pronouns has her:lei|ləi}}.
            C'è pace in {name}, pace nella serra.
            E il calice della <b>Barba dell'inciampo</b> ora è tana.
            C'è differenza tra colpa e reponsabilità.
            Tra punizione ed elaborazione.
            La lancia della pianta è ora tana per qualcosa di delicato.
            L'errore di {name} è ora guida per cambiare.
                ~ move_entity(Snail, Greenhouse)            
                -> ending_cultivation
            
            + [Preferisco aspettare.]
                    -> main     
                    
=== bastone_dell_ozioso

    = TW
        ////{chosenCultivable} affronta questo tema delicato: XYZ.
        //Te la senti di farla crescere, o preferisci cambiare?
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
        
        {name} sente un prurito, la voglia di provare qualcosa.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        Un gesto, una nota, un passo, quella cosa che non ha mai fatto.
                -> main
    
    = step_uno
        Il prurito ora si fa un grattare dietro alla testa.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        {name} forse si dice che non si fanno le cose che non si sanno fare.
        Ma {name} si dice anche che a volte serve un solo passo per iniziare a ballare.
                -> main
    
    = step_due
       Il grattare si è fatto gioia, si è fatto movimento.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        Le mani di {name} quasi applaudono da sole quando arriva il momento.
        E anche se non lo sa davvero fare, a chi importa?
        Qualcuno forse decide come è giusto camminare?
                -> main
    
    = step_tre
        Il vento tra le canne vuote canta.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        
        + (colto)[Canto con lui.]
            ~ growthBastoneDellOzioso = stepThree
            
            Rami come braccia lanciati in aria.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            La stanza esplode in una festa.
            I rami del <b>Bastone dell'Ozioso</b> vibrano di note chiassose.
            La musica è stonata, i rami sgrazziati eppure.
            Non c'è gioia più grande del fare per il solo piacere di fare.
            Senza luoghi dove andare.
            Senza classifiche da scalare.
                ~ move_entity(BastonSound, Greenhouse)
                    -> ending_cultivation
            
            + [Preferisco aspettare.]
                    -> main          
        
        
=== brina_dell_impossibile

    = TW
        //{chosenCultivable} affronta questo tema delicato: XYZ.
        //Te la senti di farla crescere, o preferisci cambiare?
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
        
        Sulla finestra è comparsa una crepa.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            -> main
    
    = step_uno
        La crepa si è estesa.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        La stanza si riempie dell'odore dello stagno.
          -> main
          
    = step_due
        Il vetro resiste imperturbato mentre le linee si allargano.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        Forse invece {name} si sente tentennare?
          -> main
    
    = step_tre
        Isole di vetro galleggiano nell'aria.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        Sostengono il proprio ruolo, intersecate da mille ferite.
        
        + (colto) [<i>E io osservo le mie.]
             ~ growthBrinaDellImpossibile = stepThree

            Baccelli crescono tra le ferite, come navi colme di semi.
            {name} vede e dà un nome a qualcosa del suo passato.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            A qualcosa che è sempre stato lì, eppure non vedeva.
            La <b>Brina dell'Impossibile</b> si raccoglie nel luogo di un trauma.
            Riempie le ferite così che siano visibili.
            Anche se fa male, aiuta a guardare, nominare, affrontare.
            Offre con ogni suo baccello semi vivi di speranza.
                    -> ending_cultivation
        
        + [Preferisco aspettare.]
                    -> main              
                    
=== canto_delle_compagne

    = TW
        //{chosenCultivable} affronta questo tema delicato: XYZ.
        //Te la senti di farla crescere, o preferisci cambiare?
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
        
        Qualcosa vibra e sveglia le gambe di {name}.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        Ha voglia di danzare.
            -> main
        
    = step_uno
        Il vaso è caldo al tocco.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        L'aria attorno vibra di una nebbiolina rossastra.
          -> main
          
    = step_due
        La nebbia si è fatta fiume, goccie che vibrano.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        Che danzano.
        E quando si scontrano, la serra riecheggia di una festosa risata.
            -> main
          
    = step_tre
        La serra si muove e si scuote, le travi cigolano nel voler danzare. #speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        I piedi di {name} battono il ritmo.
        
        + (colto)[<i>Inizio a danzare.]
            ~ growthCantoDelleCompagne = stepThree
            
            Ilare, <b>Canto delle compagne</b> turbina e balla riversandosi dal vaso.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            In un altro tempo questo cespuglio veniva chiamato "Canto delle streghe".
            L'euforia riempie i polmoni di {name}, sente la gioia di sapere che non è mai stata davvero {pronouns has him:solo|{pronouns has her:sola|solə}}.
            I piedi spingono il suo corpo nella stanza.
            La sua voce si alza e canta, chiama l3 compagn3.
            Si uniscono in una festa, un sabba, rendendo il mondo intero il loro palcoscenico.
            Ridendo feroci di chi l3 teme.
            
                ~ findedGifts += CantoDelleCompagne
                ~ move_entity(RedBee, Greenhouse)
                -> ending_cultivation
        
        + [Preferisco aspettare.]
                    -> main     

              
              
=== cardo_aspinato

    = TW
        ////{chosenCultivable} affronta questo tema delicato: XYZ.
        //Te la senti di farla crescere, o preferisci cambiare?
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
        
        Odore di buio, di cielo senza stelle. Di bosco e nebbia e nessuna strada da imboccare.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        Una palla soffice emerge dal terreno.
                -> main
    
    = step_uno
        Rumore di passi, qualcosa che corre, che fugge, che non arriva mai.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        I peli del fusto vibrano, si sollevano quando {name} si avvicina, {pronouns has him:lo|{pronouns has her:la|lə}} tengono distante.
                -> main
    
    = step_due
       È comparsa una gemma sulla cima dello stelo.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        E dalla gemma emergono filamenti disgustosi, il loro puzzo chiede di provare paura, di allontanarsi, di arrendersi, di evitare ogni contatto.
                -> main
    
    = step_tre
        La pianta resiste con sempre maggior fatica.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        
        + (colto)[Offro il mio aiuto.]
            ~ growthCardoAspinato = stepThree
            
            La piante cede, si stende tra le gambe di {name}.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            {name} allunga le dita, ne carezza il pelo, e al contatto, sente.
            Sente la luna, le stelle, le foglie nel vento, l'erba umida.
            Sente abbracci e sorrisi e mani che sorreggono.
            La pianta sboccia.
            Il <b>Cardo aspinato</b> sboccia nel supporto.
            Nel capire che lasciarsi aiutare è aiutare l'altrə.
            Nell'accettare che aiutare è aiutarsi.
                ~ move_entity(BrownBee, Greenhouse)
                -> ending_cultivation
            
            + [Preferisco aspettare.]
                    -> main          


                        

=== edera_delle_amanti

    = TW
        Attenzione: questa pianta allude a contenuti erotici.
        {name} vuole farla crescere, o preferisce cambiare?
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
            
        Il vaso gronda miele luminoso, calore riempie gli occhi di {name}.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        I polpastrelli hanno fame.
            -> main
    
    = step_uno
        Rami morbidi si sollevano lungo le pareti della serra.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        Le labbra di {name} vibrano. 
            -> main
          
    = step_due
        I rami si sfiorano desideranti, colmi, sinuosi. Si avviluppano giocosi.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        Radici gentili saggiano il legno della serra, lo sfiorano, lo penetrano.
        Foglie giovani maturano, nutrendosi di questo gioco.
            -> main
    
    = step_tre
        Calore nel ventre.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        Un pezzo di serra è abbracciato da foglie e bisbigli.
        Faticoso è resistere all'idea di tuffarvisi.
        
            + (colto) [Mi tuffo con loro.]
                ~ growthEderaDelleAmanti = stepThree
                
                Per un attimo {name} perde i suoi confini.
                Diventa un bacio nella notte, dita desiderate tra le coscie.
                Acqua sulle labbra, pelle nuda sulla terra umida.
                Pienezza che riempie, la forza dell'<b>Edera delle amanti</b>.
                Il corpo colmo di piacere.
                Di fusione.
                Vivo.
                
                    ~ move_entity(GoldenBee, Greenhouse)
                    -> ending_cultivation
            
            + [Preferisco aspettare.]
                    -> main        

=== erba_liccia

    = TW
        ////{chosenCultivable} affronta questo tema delicato: XYZ.
        //Te la senti di farla crescere, o preferisci cambiare?
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
        ~ growthErbaLiccia = stepZero
        
        Dal vaso due cespuglietti erbosi.
        Da {name} due pensieri spinosi: quando ho smesso di essere ciò che ero, e sono diventat{pronouns has him:o|{pronouns has her:a|ə}} ciò che sono?#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
                -> main
    
    = step_uno
        L'erba cresce e i pensieri di {name} con lei.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        Sono la persona che avrei voluto essere?
        Od ho tradito le promesse del mio passato?
                -> main
    
    = step_due
        I due cespuglietti si sfiorano, si sfiorano i pensieri di {name}.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        Le parti di sé che non ci sono più.
        Quelle nuove.
        E quelle che si sono trasformate nel tempo.
        Cosa significa cambiare?
                -> main
    
    = step_tre
        Il passato è una terra spinosa.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        Il ricordo si modella sul bisogno del presente.
        Il futuro sboccia nella contraddizione.
        
        + (colto)[E io rifuggo la coerenza.]
            ~ growthErbaLiccia = stepThree
            
            Il vaso brulica di erba verde e fresca.
            L'<b><i>Erba Liccia</b></i> matura quando le sue radici aeree sanno ritrovarsi.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            Quando nel cambiamento sanno ritrovarsi.
            Quando sanno vedere ciò che erano, accogliere ciò che sono, curiosare su ciò che saranno.
                    -> ending_cultivation
        
        + [Preferisco aspettare.]
                    -> main                                      

=== falsa_palude

    = TW
        ////{chosenCultivable} affronta questo tema delicato: XYZ.
        //Te la senti di farla crescere, o preferisci cambiare?
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
        
        Il vento spinge lo sporco sul pavimento, avvicinandolo ai piedi di {name}.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
                -> main
    
    = step_uno
        Lo sporco si è accresciuto.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        E ogni sua parte bisbiglia parole.
        Il nome di {name} sembra lontano.
        Ma riconosce sentimenti che ha già vissuto.
                -> main
    
    = step_due
       Nella calma della serra il pavimento sembra vivo.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
       Foglie e fiori e pistilli avanzano l3 un3 verso l3 altr3.
       Il sentimento si è fatto movimento.
       Forse {name} non è {pronouns has him:solo|{pronouns has her:sola|solə}} nel vivere certe emozioni?
                -> main
    
    = step_tre
        La separazione è solo illusione.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        
        + (colto)[Voglio vedere oltre l'illusione.]
            ~ growthFalsaPalude = stepThree
            
            Il movimento si è fatto unione, si è fatto gruppo.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            E un cespuglio fitto e odoroso illumina il pavimento della serra.
            E tutta la <b>Falsa Palude</b> sospira.
            Esule dell'acqua, eppure capace di germogliare.
            La <b>Falsa Palude</b> è corallo di terra, colonia.
            Vibrazione vicina e ascolto.
            Ciò che accade quando il dolore si fa terreno comune.
            Quando storie diverse riconoscono la propria voce.
            E ciò che sembrava un ostacolo personale, si dimostra un problema strutturale.
                    -> ending_cultivation
        
        + [Preferisco aspettare.]
                    -> main                                 

=== lana_notturna

    = TW
        ////{chosenCultivable} affronta questo tema delicato: XYZ.
        //Te la senti di farla crescere, o preferisci cambiare?
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
        ~ growthLanaNotturna = stepZero
        
        Ha quella sensazione, {name}.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        Quella di quando la notte {pronouns has him:lo|{pronouns has her:la|lə}} afferra nel letto, svegliandola, ributtandola in incubi e pensieri quotidiani soffocanti.
        Di quando si agita tra le coperte, in trappola.
                -> main
    
    = step_uno
        Le cose che non può cambiare si affastellano sulla pelle di {name}, le cose che non vanno.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        Si appesantiscono sulle mani, schiacciano lo stomaco.
        L'aria è sabbia, le scarse ombre minaccia.

                -> main
    
    = step_due
        Far un passo fuori dal letto è come una corsa.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        Aprire la porta, accendere una luce.
        Il mondo fuori dorme, ma {name} è {pronouns has him:sveglio|{pronouns has her:sveglia|svegliə}}.
        Qualcosa si appoggia sulle sue labbra, sulla sua coscienza.

                -> main
    
    = step_tre
        Perché il fiore sbocci, la gemma deve spaccarsi, ferirsi.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        Ma serve attendere il tempo giusto, lasciare che le cose possano maturare.
        
        + (colto)[Ho imparato ad attendere.]
            ~ growthLanaNotturna = stepThree
            
            Un unico grande e morbido fiore, i petali soffici si spalancano nella serra.
            <b>Lana Notturna</b> è una coperta nella notte, una tisana nei giorni bui.
            Sboccia nelle terre dimenticate, per ricordare che anche quando tutto sembra perduto, da qualche parte cresce il seme del cambiamento.
                    -> ending_cultivation
        
        + [Preferisco aspettare.]
                    -> main             
                    
=== lichene_degli_abissi
    
    = TW
        //{chosenCultivable} affronta questo tema delicato: XYZ.
        //Te la senti di farla crescere, o preferisci cambiare?
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
        
        Due mondi si incontrano.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        Foglie nuove si accrescono.
        L'aria è piena di possibilità.
                -> main
    
    = step_uno
        Le foglie ora riempiono ogni cosa, vedono solo sé stesse.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
                -> main
          
    = step_due
        Fiori come cuori, e un susseguirsi di bisbigli amorosi.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        Le radici interconnesse, indistricate.
        Piccoli pruriti taciuti.
        La volontà di non trovare una separazione.
            -> main
          
    = step_tre
        Dubbi e non detti esplodono come lame.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        Ciò che prima era amorevolmente interconnesso ora è imprigionato.
        Ci sono forze da rilasciare.

            + (colto) [Ho un volto in mente.]
                ~ growthLicheneDegliAbissi = stepThree
                
                <b>Lichene degli abissi</b> offre frutti taglienti.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
                Cresce dove ci sono relazioni che non sanno maturare.
                Storie da lasciare.
                L'odore delle sue foglie sa di persone allontanate.
                Di addii dolorosi.
                E ferite da risanare.
                    -> ending_cultivation
                    
             + [Preferisco aspettare.]
                    -> main
                    
=== non_ti_scordar_di_te

    = TW
        //Attenzione: questa pianta parla di lutto e della sua elaborazione.
        //Se la sente {name} di farla crescere, o preferisce cercare qualcosa di diverso?
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
        
        Radici cromate si raccolgono in piccoli mucchi.</b>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        L'aria odora di terra e ricordi.
            -> main
    
    = step_uno
        L'unione ha portato a una fioritura.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        Le radici cespugliose sono sbocciate in qualcosa di nuovo.
        {name} pensa a chi da tempo cammina con {pronouns has him:lui|{pronouns has her:lei|ləi}}.
          -> main
          
    = step_due
        Nuove congiunzioni si accrescono tra i cespugli radicali.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        Ciò che era separato genera nuove storie.
          -> main
          
    = step_tre
        Qualcosa di nuovo attende la sua occasione per fiorire.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}

        + (colto) [Penso alle persone che mi compongono.]
            ~ growthNonTiScordarDiTe = stepThree
            
            {name} si sente ramo, si sente radice.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            Si sente le persone che è {pronouns has him:stato|{pronouns has her:stata|statə}} e quelle che sarà.
            Le persone che l'hanno {pronouns has him:accompagnato|{pronouns has her:accompagnata|accompagnatə}} nella sua vita.
            <b>Non ti scordar di te</b> è la pianta del ricordo.
            E del costruire.
            Del celebrare le parti di chi abbiamo incontrato, che continuano a vivere in noi.
            Del sentirci eredi e messagger3, parte di un percorso intessuto di nomi.
                    -> ending_cultivation
                    
            + [Preferisco aspettare.]
                    -> main          
                    
                    

=== olobino

    = TW
        ////{chosenCultivable} affronta questo tema delicato: XYZ.
        //Te la senti di farla crescere, o preferisci cambiare?
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
        
        Piccoli bottoni luccicanti osservano la serra.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        Le mani di {name} sembrano più calde.
            -> main
    
    = step_uno
        I muscoli di {name} si distendono.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        La mente si fa limpida.
            -> main
    
    = step_due
       Ogni morbido fungo sembra sparire nell'altro.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
       Il sottile micelio si mescola alle venature del legno.
       E {name}...
       Perché dovrebbe limitarsi ad essere {name}?
            -> main
    
    = step_tre
        Il tempo si mescola, ieri è oggidomanimai.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        I confini si sciolgono e un corpo è stanzapiantalucerespiro.
        
        + (colto)[Mi sciolgo nel tempo.]
            ~ growthOlobino = stepThree
            
            C'è solo amore.
            Per le persone care e per quelle mai conosciute, per quelle perse e quelle che verranno.
            Per l'insetto nel giardino e l'uccello nel cielo.
            Per l'acqua sulla fronte e la plastica sotto le dita.
            C'è completezza, non separazione.
            C'è e non c'è e ci sarà ed è stato ed è qui, ora.
            L'<b>Olobino</b> è un fungo semplice pieno di potere.
            Il potere che c'è nel perdere il sé.
            L'eternità nella collettività.

                    -> ending_cultivation
            
            + [Preferisco aspettare.]
                    -> main          
                    
                    

=== la_spazzata

    = TW
        //{chosenCultivable} affronta questo tema delicato: XYZ.
        //Te la senti di farla crescere, o preferisci cambiare?
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
        
        Il pavimento della serra si è spezzato, riempiendosi dell'acqua che viene dallo stagno.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        Una singola piccola fogliolina galleggia morbidamente.
        Un singolo piccolo pensiero stuzzica {name}.
            -> main
         
    = step_uno
         Molte più foglie riempiono ora la fossa. #speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
         Molti più pensieri riempiono la testa di {name}.
         Cos'era quella cosa che avrebbe voluto dire a, sì, sa a chi.
         Ma non è il caso, alla fine.
         Non è mai il caso.
            -> main
    
    = step_due
        La serra è invasa di foglie, l'acqua si infila sotto vasi e mobili. #speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        E pensieri come spilli invadono la testa di {name}.
        L'ansia si infila sotto ricordi e sicurezze, e tutto trema.
            -> main
    
    = step_tre
        Il pavimento vuoto scricchiola.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        Tutto sembra in ordine, eppure la testa di {name} è pronta ad esplodere.

        + (colto)[C'è una cosa che devo dire da molto tempo.]
            ~ growthLaSpazzata = stepThree
            
            Odore di autunno, di foglie umide.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            Ai piedi di {name} resta il foro della <b>Spazzata</b>.
            La Spazzata è e non è.
            Si abbuffa delle cose non dette.
            E quando è sazia, travolge ogni cosa.
            Ma la pancia di {name} è colma di un senso di vuoto.
            La sensazione di quando ha condiviso qualcosa che riteneva terribile.
            Per poi scoprire che il mondo non è finito quella volta, e non finirà oggi.
            Le cose sono sempre peggiori nella propria testa.
            Ma reali, lasciano segni e ferite.
                    -> ending_cultivation
                    
            + [Preferisco aspettare.]
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
        - bookContents hasnt GreenhouseRecap:
        ~ move_entity(GreenhouseRecap, BookPlace)
    }
    @animation:Inventory
    
    {~ Hai raccolto|Hai ricevuto in dono|Tra le dita ti ritrovi|Nello zaino ora hai|Eccoti in dono|Eccoti} {ingredientTranslator(chosenCultivable)}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    
    ~ findedGifts += chosenCultivable
    ~ growing = 0
    ~ chosenCultivable = ()
    
    + {backupCultivable != ()}[<i>Voglio coltivare qualcosa di nuovo.]
            -> cultivable_test
    
    + [{~ Mi aggiro per la serra.|Osservo ciò che è in crescita.|Ascolto i rumori della serra.|Mi rilasso un attimo.|Mi perdo nei colori dei vasi.}]  
            -> main    