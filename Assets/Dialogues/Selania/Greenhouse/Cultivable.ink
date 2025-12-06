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
        L'aria attorno a {player_name} vibra di tensione.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            -> main
    
    = step_uno
        Odore elettrico e ceramica tesa.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        Un vaso deformato resiste con fatica alla sua stessa pressione.
            -> main
    
    = step_due
        Il vaso è come fango al sole.
        Un ramo saggia l'aria.
        Asciutto e timido verso {player_name}.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
          -> main
          
    = step_tre
        L'aria è attesa.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        La strada è chiara, manca solo il primo passo.
        Qualcosa da ammettere.
        
            + (colto) [<i>Confido le mie paure.]
                ~ growthBaccaDellaAddolorata = stepThree
            
            Rami verso il cielo sostengono un frutto.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            Semi rosati e foglie carnose.
            Coraggiosa, la <b>Bacca dell'Addolorata</b> espone le sue ferite al mondo.
            La pianta di chi finalmente ha trovato la sua strada ma non riesce ancora ad avanzare.
            Tenace il frutto, e rilassate le spalle di {player_name}.
            L'incertezza scivola via.
            {player_name} ricorda come camminare.
                    -> ending_cultivation
                    
            + [<i>Ho bisogno di tempo per riflettere.]
                    -> main     

              

=== barba_dell_inciampo

    = TW
        -> step_zero
    
    = step_zero
            -> remove_proposed_cultivable ->
            ~ growthBarbaDellInciampo = stepZero
        
        L'errore è come una spina.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        Una scheggia che brucia anche nel riposo.
        Che rende bianche le notti di {player_name}.
                -> main
    
    = step_uno
        La spina infetta.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        Infetta la lingua di colpa.
        La lingua difende.
        La lingua critica.
        La lingua aggredisce.
        La colpa attanaglia {player_name}.
                -> main
    
    = step_due
        La colpa si fa muro.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        L'errore nascosto, la spina protetta.
        La colpa si fa muro.
        La colpa cresce, cresce la paura di {player_name}.
                -> main
    
    = step_tre
        Il muro vacilla.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        Non ricorda più se protegge il fuori dal dentro, o il dentro dal fuori.

        + (colto)[<i>Abbasso le mie difese.]
            ~ growthBarbaDellInciampo = stepThree
            
            Il muro si fa calice.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            Gli occhi di {player_name} vedono al di là da sé.
            C'è pace in {player_name}.
            Pace nella serra.
            La barricata della <b>Barba dell'inciampo</b> ora è tana.
            Separa colpa e responsabilità.
            Punizione ed elaborazione.
            La spina della <b>Barba dell'inciampo</b> ora è riparo.
            E l'errore di {player_name} guida per cambiare.
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

        {player_name} ha un prurito.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        Un prurito che è gesto, nota, passo, salto.
        Qualcosa di trattenuto, qualcosa di mai fatto.
                -> main
    
    = step_uno
        Il prurito riempie la testa.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        {player_name} si dice che non si fanno le cose che non si sanno fare.
        Ma {player_name} si dice anche che a volte serve un solo passo per iniziare a ballare.
                -> main
    
    = step_due
        Il prurito si è fatto gioia, si è fatto movimento.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        Le mani di {player_name} applaudono da sole quando arriva il momento.
        E anche se non lo sa davvero fare, a chi importa?
        Chi decide come è giusto camminare?
                -> main
    
    = step_tre
        Il vento tra le canne vuote canta.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        
        + (colto)[<i>E io canto con lui.]
            ~ growthBastoneDellOzioso = stepThree
            
            Rami come braccia come gambe come festa.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            Il prurito è una protesta.
            I rami del <b>Bastone dell'Ozioso</b> vibrano di note stonate.
            Le giunture si agitano sgraziate.
            Ma non c'è gioia più grande del fare per il solo piacere di fare.
            Senza luoghi dove andare.
            Senza classifiche da scalare.

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

            Una crepa.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            Un pezzo di mondo attraverso la finestra.
            -> main
    
    = step_uno
        Ferite nel vetro.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        Odore di stagno.
        Di cose che {player_name} non ha mai guardato.
        La crepa si è estesa.
          -> main
          
    = step_due
        Il mondo alle sue spalle.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        Il vetro resiste.
        Compie la sua trasparente missione, ignorando il proprio dolore.
          -> main
    
    = step_tre
        Isole di vetro galleggiano nell'aria.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        Sostengono il proprio ruolo.
        Si reggono a vecchie ferite.
        
        + (colto) [<i>E io osservo le mie.]
             ~ growthBrinaDellImpossibile = stepThree

            Baccelli crescono tra le ferite, navi colme di semi.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            {player_name} nomina qualcosa del suo passato.
            Qualcosa che è sempre stato lì ma non vedeva.
            La <b>Brina dell'Impossibile</b> si raccoglie nel luogo di un trauma.
            Riempie le ferite affinché siano visibili.
            Risveglia il dolore, così che lo si possa nominare.
            Conosce la fatica del percorso, e offre baccelli vivi di speranza.
                
                -> ending_cultivation
        
        + [<i>Per ora ignoro le mie.]
                    -> main              
                    
=== canto_delle_compagne

    = TW
        -> step_zero

    = step_zero
        -> remove_proposed_cultivable ->
        ~ growthCantoDelleCompagne = stepZero

        Qualcosa vibra e sveglia le gambe di {player_name}.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        Ha voglia di danzare.
            -> main
        
    = step_uno
        Il vaso è caldo al tocco.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        L'aria attorno rifiorisce di una nebbiolina rossastra.
          -> main
          
    = step_due
        La nebbia si è fatta fiume, gocce che vibrano.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        Che danzano.
        E quando si scontrano, la serra riecheggia di una festosa risata.
            -> main
          
    = step_tre
        La serra si muove e si scuote, le travi cigolano nel voler danzare. #speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        I piedi di {player_name} battono il ritmo.
        
        + (colto)[<i>Inizio a danzare.]
            ~ growthCantoDelleCompagne = stepThree
            
            Ilare, <b>Canto delle compagne</b> turbina e balla riversandosi dal vaso.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            In un altro tempo questo cespuglio veniva chiamato "Canto delle streghe".
            L'euforia riempie i polmoni di {player_name}, sente la gioia di sapere che non è mai stata davvero {player_pronouns has him:solo|{player_pronouns has her:sola|solə}}.
            I piedi spingono il suo corpo nella stanza.
            La sua voce si alza e canta, chiama l3 compagn3.
            Si uniscono in una festa, un sabba, rendendo il mondo intero il loro palcoscenico.
            Ridendo feroci di chi l3 teme.
            
                ~ backpack_findedGifts += CantoDelleCompagne
                ~ move_entity(RedBee, Greenhouse)
                -> ending_cultivation
        
        + [Preferisco aspettare.]
                    -> main     

              
=== cardo_aspinato

    = TW
        -> step_zero
    
    = step_zero
        -> remove_proposed_cultivable ->
        ~ growthCardoAspinato = stepZero
        
        Odore di buio, di cielo senza stelle.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        Di bosco e nebbia e nessuna strada da imboccare.
        E una palla soffice deposta sul terreno.
                -> main
    
    = step_uno
        Rumore di passi, qualcosa che corre, che fugge, che non arriva mai.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        I peli del fusto vibrano, si sollevano quando {player_name} si avvicina, {player_pronouns has him:lo|{player_pronouns has her:la|lə}} tengono distante.
                -> main
    
    = step_due
        È comparsa una gemma sulla cima dello stelo.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        E dalla gemma emergono filamenti disgustosi, il loro puzzo chiede di provare paura, di allontanarsi, di arrendersi, di evitare ogni contatto.
                -> main
    
    = step_tre
        La resistenza della pianta si fa sempre più debole.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        
        + (colto)[Offro il mio aiuto.]
            ~ growthCardoAspinato = stepThree
            
            La piante cede, si stende tra le gambe di {player_name}.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            {player_name} allunga le dita, ne carezza il pelo, e al contatto, sente.
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
        {player_name} vuole farla crescere, o preferisce cambiare?
            + [Voglio andare avanti.]
                -> step_zero
            
            + [Voglio rimuoverla, ma solo per ora.]
                -> tempCultTW_formula
                
            + (rimuovi) [Voglio rimuoverla per sempre.]
                -> remove_proposed_cultivable ->
                    ~ greenhouse_chosenCultivable = ()
                {
                    - greenhouse_backupCultivable != ():
                        ->  cultivable_test
                    
                    - else:
                        Al momento la serra non ha domande da porti.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                    -> main
                }
            
    
    = step_zero
        -> remove_proposed_cultivable ->  
        ~ growthEderaDelleAmanti = stepZero
        
        Il vaso gronda miele luminoso, calore riempie gli occhi di {player_name}.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        I polpastrelli hanno fame.
            -> main
    
    = step_uno
        Rami morbidi si sollevano lungo le pareti della serra.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        Le labbra di {player_name} vibrano. 
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
                
                Per un attimo {player_name} perde i suoi confini.
                Diventa un bacio nella notte, dita desiderate tra le cosce.
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
        -> step_zero
    
    = step_zero
        -> remove_proposed_cultivable ->
        ~ growthErbaLiccia = stepZero
        
        Dal vaso due cespuglietti erbosi.
        Da {player_name} due pensieri spinosi: quando ho smesso di essere ciò che ero, e sono diventat{player_pronouns has him:o|{player_pronouns has her:a|ə}} ciò che sono?#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            -> main
    
    = step_uno
        L'erba cresce e i pensieri di {player_name} con lei.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        Sono la persona che avrei voluto essere?
        O ho tradito le promesse del mio passato?
            -> main
    
    = step_due
        I due cespuglietti si sfiorano, si sfiorano i pensieri di {player_name}.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
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
        -> step_zero
    
    = step_zero
        -> remove_proposed_cultivable ->
        ~ growthFalsaPalude = stepZero
        
        Il vento spinge lo sporco sul pavimento, avvicinandolo ai piedi di {player_name}.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            -> main
    
    = step_uno
        Lo sporco si è accresciuto.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        E ogni sua parte bisbiglia parole.
        Il nome di {player_name} sembra lontano.
        Ma riconosce sentimenti che ha già vissuto.
            -> main
    
    = step_due
       Nella calma della serra il pavimento sembra vivo.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
       Foglie e fiori e pistilli avanzano l3 un3 verso l3 altr3.
       Il sentimento si è fatto movimento.
       Forse {player_name} non è {player_pronouns has him:solo|{player_pronouns has her:sola|solə}} nel vivere certe emozioni?
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
        -> step_zero
    
    = step_zero
        -> remove_proposed_cultivable ->
        ~ growthLanaNotturna = stepZero
        
        Ha quella sensazione, {player_name}.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        Quella di quando la notte {player_pronouns has him:lo|{player_pronouns has her:la|lə}} afferra nel letto, svegliandola, ributtandola in incubi e pensieri quotidiani soffocanti.
        Di quando si agita tra le coperte, in trappola.
                -> main
    
    = step_uno
        Le cose che non può cambiare si affastellano sulla pelle di {player_name}, le cose che non vanno.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        Si appesantiscono sulle mani, schiacciano lo stomaco.
        L'aria è sabbia, le scarse ombre minaccia.
            -> main
    
    = step_due
        Fare un passo fuori dal letto è come una corsa.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        Aprire la porta, accendere una luce.
        Il mondo fuori dorme, ma {player_name} è {player_pronouns has him:sveglio|{player_pronouns has her:sveglia|svegliə}}.
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

            + (colto) [Ho qualcuno da salutare.]
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
        -> step_zero
        
    = step_zero
        -> remove_proposed_cultivable ->
        ~ growthNonTiScordarDiTe = stepZero
        
        Radici cromate si raccolgono in piccoli mucchi.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        L'aria odora di terra e ricordi.
            -> main
    
    = step_uno
        L'unione ha portato a una fioritura.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        Le radici cespugliose sono sbocciate in qualcosa di nuovo.
        {player_name} pensa a chi da tempo cammina con {player_pronouns has him:lui|{player_pronouns has her:lei|ləi}}.
            -> main
          
    = step_due
        Nuove congiunzioni si accrescono tra i cespugli radicali.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        Ciò che era separato genera nuove storie.
            -> main
          
    = step_tre
        Qualcosa di nuovo attende la sua occasione per fiorire.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}

        + (colto) [Penso alle persone che mi compongono.]
            ~ growthNonTiScordarDiTe = stepThree
            
            {player_name} si sente ramo, si sente radice.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            Si sente le persone che è {player_pronouns has him:stato|{player_pronouns has her:stata|statə}} e quelle che sarà.
            Le persone che l'hanno {player_pronouns has him:accompagnato|{player_pronouns has her:accompagnata|accompagnatə}} nella sua vita.
            <b>Non ti scordar di te</b> è la pianta del ricordo.
            E del costruire.
            Del celebrare le parti di chi abbiamo incontrato, che continuano a vivere in noi.
            Del sentirci eredi e messagger3, parte di un percorso intessuto di nomi.
                    -> ending_cultivation
                    
            + [Preferisco aspettare.]
                    -> main          
                    
                    

=== olobino

    = TW
        -> step_zero
    
    = step_zero
        -> remove_proposed_cultivable ->
        ~ growthOlobino = stepZero
        
        Piccoli bottoni luccicanti osservano la serra.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        Le mani di {player_name} sembrano più calde.
            -> main
    
    = step_uno
        I muscoli di {player_name} si distendono.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        La mente si fa limpida.
            -> main
    
    = step_due
       Ogni morbido fungo sembra sparire nell'altro.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
       Il sottile micelio si mescola alle venature del legno.
       E {player_name}...
       Perché dovrebbe limitarsi ad essere {player_name}?
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
        -> step_zero

        
    = step_zero
        -> remove_proposed_cultivable ->
        ~ growthLaSpazzata = stepZero
        
        Il pavimento della serra si è spezzato, riempiendosi dell'acqua che viene dallo stagno.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        Una singola piccola fogliolina galleggia morbidamente.
        Un singolo piccolo pensiero stuzzica {player_name}.
            -> main
         
    = step_uno
        Molte più foglie riempiono ora la fossa. #speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        Molti più pensieri riempiono la testa di {player_name}.
        Cos'era quella cosa che avrebbe voluto dire a, sì, sa a chi.
        Ma non è il caso, alla fine.
        Non è mai il caso.
        -> main
    
    = step_due
        La serra è invasa di foglie, l'acqua si infila sotto vasi e mobili. #speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        E pensieri come spilli invadono la testa di {player_name}.
        L'ansia si infila sotto ricordi e sicurezze, e tutto trema.
            -> main
    
    = step_tre
        Il pavimento vuoto scricchiola.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        Tutto sembra in ordine, eppure la testa di {player_name} è pronta ad esplodere.

        + (colto)[C'è qualcosa che devo dire da molto tempo.]
            ~ growthLaSpazzata = stepThree
            
            Odore di autunno, di foglie umide.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            Ai piedi di {player_name} resta il foro della <b>Spazzata</b>.
            La Spazzata è e non è.
            Si abbuffa delle cose non dette.
            E quando è sazia, travolge ogni cosa.
            Ma la pancia di {player_name} è colma di un senso di vuoto.
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
        - contentsBook hasnt GreenhouseRecap:
        ~ move_entity(GreenhouseRecap, BookPlace)
    }
    @animation:Backpack
    
    {~ {player_name} ha raccolto|{player_name} ha ricevuto in dono|Tra le dita {player_name} si ritrova|Nello zaino {player_name} ora ha|{player_name} riceve in dono|Ecco per {player_name}} {ingredientTranslator(greenhouse_chosenCultivable)}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    
    
    ~ backpack_findedGifts += greenhouse_chosenCultivable
    ~ greenhouse_cultivableGrowing = 0
    ~ greenhouse_chosenCultivable = ()
    
    + {greenhouse_backupCultivable != ()}[<i>Voglio coltivare qualcosa di nuovo.]
            -> cultivable_test
    
    + [{~ Mi aggiro per la serra.|Osservo ciò che è in crescita.|Ascolto i rumori della serra.|Mi rilasso un attimo.|Mi perdo nei colori dei vasi.}]  
            -> main    