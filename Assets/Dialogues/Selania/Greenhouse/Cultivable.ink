//Nota: la crescita di una pianta viene chiamata alla fine di ogni conversazione.

=== growing_check
{
    //Aumentiamo il valore solo se greenhouse_growStep non ha stepFour
    - greenhouse_growStep hasnt stepFour && greenhouse_chosenCultivable != ():
        ~ greenhouse_cultivableGrowing ++
}
-> growing_value_updater


=== growing_value_updater
{
    - greenhouse_cultivableGrowing < greenhouse_growingValueStepOne:
        ~ greenhouse_growStep = ()
        ~ greenhouse_growStep += stepOne
        {debug: passo da step zero check greenhouse_cultivableGrowing. Il valore di greenhouse_cultivableGrowing è {greenhouse_cultivableGrowing}. Imposto greenhouse_growStep come {greenhouse_growStep}. Il coltivabile selezionato è {greenhouse_chosenCultivable}.}
    
    - greenhouse_cultivableGrowing < greenhouse_growingValueStepTwo:
        ~ greenhouse_growStep = ()
        ~ greenhouse_growStep += stepTwo
        {debug: passo da primo check greenhouse_cultivableGrowing. Il valore di greenhouse_cultivableGrowing è {greenhouse_cultivableGrowing}.  Imposto greenhouse_growStep come {greenhouse_growStep}. Il coltivabile selezionato è {greenhouse_chosenCultivable}.}
    
    - greenhouse_cultivableGrowing < greenhouse_growingValueStepThree:
        ~ greenhouse_growStep = ()
        ~ greenhouse_growStep += stepThree
        {debug: passo da secondo step check greenhouse_cultivableGrowing.  Il valore di greenhouse_cultivableGrowing è {greenhouse_cultivableGrowing}. Imposto greenhouse_growStep come {greenhouse_growStep}. Il coltivabile selezionato è {greenhouse_chosenCultivable}.}
    
    - else:
        {
            - greenhouse_growStep hasnt stepFour:
                ~ greenhouse_growStep = ()
                ~ greenhouse_growStep += stepFour
        {debug: passo da terzo step check greenhouse_cultivableGrowing. Imposto greenhouse_growStep come {greenhouse_growStep}.}            
        }

}

{debug: vedo se attivare o meno la notifica di notification_greenhouseGrown. notification_greenhouseGrown {notification_greenhouseGrown}, PG location {entity_location(PG)}, stato greenhouse_growStep {greenhouse_growStep}.}

{
    
    - entity_location(PG) != Greenhouse:
        {
            - greenhouse_growStep has stepFour && notification_greenhouseGrownRepropose == true:
                ~ notification_greenhouseGrown = true
                ->->
            - else:
                ->->
        }
            
    - else:
    {debug: entity location {entity_location(PG)}, per cui vado a growing_updater}
        -> growing_updater

}

=== growing_updater
{debug: passo per growing_updater}
{

    - greenhouse_chosenCultivable has BaccaDellaAddolorata:
        {
            - greenhouse_growStep has stepOne:
                ~ growthBaccaDellaAddolorata = stepOne
                ~ narrativeGrowthBaccaDellaAddolorata = stepOne
                -> bacca_della_addolorata.step_one

            - greenhouse_growStep has stepTwo:
                ~ growthBaccaDellaAddolorata = stepTwo
                ~ narrativeGrowthBaccaDellaAddolorata = stepTwo
                -> bacca_della_addolorata.step_two
            
            - greenhouse_growStep has stepThree:
                ~ growthBaccaDellaAddolorata = stepThree
                ~ narrativeGrowthBaccaDellaAddolorata = stepThree
                -> bacca_della_addolorata.step_three

            - greenhouse_growStep has stepFour:
                 ~ growthBaccaDellaAddolorata = stepThree
                 ~ narrativeGrowthBaccaDellaAddolorata = stepFour
                 -> bacca_della_addolorata.step_four
        }



    - greenhouse_chosenCultivable has BarbaDellInciampo:
        {
            - greenhouse_growStep has stepOne:
                ~ growthBarbaDellInciampo = stepOne
                ~ narrativeGrowthBarbaDellInciampo = stepOne
                -> barba_dell_inciampo.step_one

            - greenhouse_growStep has stepTwo:
                ~ growthBarbaDellInciampo = stepTwo
                ~ narrativeGrowthBarbaDellInciampo = stepTwo
                -> barba_dell_inciampo.step_two

            - greenhouse_growStep has stepThree:
                ~ growthBarbaDellInciampo = stepThree
                ~ narrativeGrowthBarbaDellInciampo = stepThree
                -> barba_dell_inciampo.step_three

            - greenhouse_growStep has stepFour:
                 ~ growthBarbaDellInciampo = stepThree
                 ~ narrativeGrowthBarbaDellInciampo = stepFour
                -> barba_dell_inciampo.step_four
        }

    - greenhouse_chosenCultivable has BastoneDellOzioso:
        {
            - greenhouse_growStep has stepOne:
                ~ growthBastoneDellOzioso = stepOne
                ~ narrativeGrowthBastoneDellOzioso = stepOne
                    -> bastone_dell_ozioso.step_one

            - greenhouse_growStep has stepTwo:
                ~ growthBastoneDellOzioso = stepTwo
                ~ narrativeGrowthBastoneDellOzioso = stepTwo
                    -> bastone_dell_ozioso.step_two

            - greenhouse_growStep has stepThree:
                ~ growthBastoneDellOzioso = stepThree
                ~ narrativeGrowthBastoneDellOzioso = stepThree
                    -> bastone_dell_ozioso.step_three

            - greenhouse_growStep has stepFour:
                 ~ growthBastoneDellOzioso = stepThree
                 ~ narrativeGrowthBastoneDellOzioso = stepFour
                    -> bastone_dell_ozioso.step_four
        } 
    
    - greenhouse_chosenCultivable has BrinaDellImpossibile:
        {
            - greenhouse_growStep has stepOne:
                ~ growthBrinaDellImpossibile = stepOne
                ~ narrativeGrowthBrinaDellImpossibile = stepOne
                    -> brina_dell_impossibile.step_one

            - greenhouse_growStep has stepTwo:
                ~ growthBrinaDellImpossibile = stepTwo
                ~ narrativeGrowthBrinaDellImpossibile = stepTwo
                    -> brina_dell_impossibile.step_two

            - greenhouse_growStep has stepThree:
                ~ growthBrinaDellImpossibile = stepThree
                ~ narrativeGrowthBrinaDellImpossibile = stepThree
                    -> brina_dell_impossibile.step_three

            - greenhouse_growStep has stepFour:
                 ~ growthBrinaDellImpossibile = stepThree
                 ~ narrativeGrowthBrinaDellImpossibile = stepFour
                 -> brina_dell_impossibile.step_four
        }

    - greenhouse_chosenCultivable has CantoDelleCompagne:
        {
            - greenhouse_growStep has stepOne:
                ~ growthCantoDelleCompagne = stepOne
                ~ narrativeGrowthCantoDelleCompagne = stepOne
                    -> canto_delle_compagne.step_one

            - greenhouse_growStep has stepTwo:
                ~ growthCantoDelleCompagne = stepTwo
                ~ narrativeGrowthCantoDelleCompagne = stepTwo
                    -> canto_delle_compagne.step_two

            - greenhouse_growStep has stepThree:
                ~ growthCantoDelleCompagne = stepThree
                ~ narrativeGrowthCantoDelleCompagne = stepThree
                    -> canto_delle_compagne.step_three

            - greenhouse_growStep has stepFour:
                 ~ growthCantoDelleCompagne = stepThree
                 ~ narrativeGrowthCantoDelleCompagne = stepFour
                    -> canto_delle_compagne.step_four
        }
    
    - greenhouse_chosenCultivable has CardoAspinato:
        {
            - greenhouse_growStep has stepOne:
                ~ growthCardoAspinato = stepOne
                ~ narrativeGrowthCardoAspinato = stepOne
                    -> cardo_aspinato.step_one

            - greenhouse_growStep has stepTwo:
                ~ growthCardoAspinato = stepTwo
                ~ narrativeGrowthCardoAspinato = stepTwo
                    -> cardo_aspinato.step_two

            - greenhouse_growStep has stepThree:
                ~ growthCardoAspinato = stepThree
                ~ narrativeGrowthCardoAspinato = stepThree
                    -> cardo_aspinato.step_three

            - greenhouse_growStep has stepFour:
                 ~ growthCardoAspinato = stepThree
                 ~ narrativeGrowthCardoAspinato = stepFour
                    -> cardo_aspinato.step_four
        }     

    - greenhouse_chosenCultivable has EderaDelleAmanti:
        {
            - greenhouse_growStep has stepOne:
                ~ growthEderaDelleAmanti = stepOne
                ~ narrativeGrowthEderaDelleAmanti= stepOne
                -> edera_delle_amanti.step_one

            - greenhouse_growStep has stepTwo:
                ~ growthEderaDelleAmanti = stepTwo
                ~ narrativeGrowthEderaDelleAmanti= stepTwo
                -> edera_delle_amanti.step_two

            - greenhouse_growStep has stepThree:
                ~ growthEderaDelleAmanti = stepThree
                ~ narrativeGrowthEderaDelleAmanti= stepThree
                -> edera_delle_amanti.step_three

            - greenhouse_growStep has stepFour:
                 ~ growthEderaDelleAmanti = stepThree
                 ~ narrativeGrowthEderaDelleAmanti= stepFour
                 -> edera_delle_amanti.step_four
        }
    
    - greenhouse_chosenCultivable has ErbaLiccia:
        {
            - greenhouse_growStep has stepOne:
                ~ growthErbaLiccia = stepOne
                ~ narrativeGrowthErbaLiccia = stepOne
                -> erba_liccia.step_one

            - greenhouse_growStep has stepTwo:
                ~ growthErbaLiccia = stepTwo
                ~ narrativeGrowthErbaLiccia = stepTwo
                -> erba_liccia.step_two

            - greenhouse_growStep has stepThree:
                ~ growthErbaLiccia = stepThree
                ~ narrativeGrowthErbaLiccia = stepThree
                -> erba_liccia.step_three

            - greenhouse_growStep has stepFour:
                 ~ growthErbaLiccia = stepThree
                 ~ narrativeGrowthErbaLiccia = stepFour
                 -> erba_liccia.step_four
        }
    
    - greenhouse_chosenCultivable has FalsaPalude:
        {
            - greenhouse_growStep has stepOne:
                ~ growthFalsaPalude = stepOne
                ~ narrativeGrowthFalsaPalude = stepOne
                        {debug: greenhouse_chosenCultivable = {greenhouse_chosenCultivable}, greenhouse_growStep = {greenhouse_growStep}, narrativeGrowthFalsaPalude = {narrativeGrowthFalsaPalude}.}
                        {debug: vado a falsa_palude.step_one}
                -> falsa_palude.step_one

            - greenhouse_growStep has stepTwo:
                ~ growthFalsaPalude = stepTwo
                ~ narrativeGrowthFalsaPalude = stepTwo
                    {debug: greenhouse_chosenCultivable = {greenhouse_chosenCultivable}, greenhouse_growStep = {greenhouse_growStep}, narrativeGrowthFalsaPalude = {narrativeGrowthFalsaPalude}.} 
                    {debug: vado a falsa_palude.step_two} 
                -> falsa_palude.step_two

            - greenhouse_growStep has stepThree:
                ~ growthFalsaPalude = stepThree
                ~ narrativeGrowthFalsaPalude = stepThree
                     {debug: greenhouse_chosenCultivable = {greenhouse_chosenCultivable}, greenhouse_growStep = {greenhouse_growStep}, narrativeGrowthFalsaPalude = {narrativeGrowthFalsaPalude}.}
                     {debug: vado a falsa_palude.step_three}
                -> falsa_palude.step_three

            - greenhouse_growStep has stepFour:
                 ~ growthFalsaPalude = stepThree
                 ~ narrativeGrowthFalsaPalude = stepFour
                        {debug: greenhouse_chosenCultivable = {greenhouse_chosenCultivable}, greenhouse_growStep = {greenhouse_growStep}, narrativeGrowthFalsaPalude = {narrativeGrowthFalsaPalude}.}
                        {debug: vado a falsa_palude.step_four}
                -> falsa_palude.step_four                
        }     
    
    - greenhouse_chosenCultivable has LanaNotturna:
        {
            - greenhouse_growStep has stepOne:
                ~ growthLanaNotturna = stepOne
                ~ narrativeGrowthLanaNotturna = stepOne
                -> lana_notturna.step_one

            - greenhouse_growStep has stepTwo:
                ~ growthLanaNotturna = stepTwo
                ~ narrativeGrowthLanaNotturna = stepTwo
                -> lana_notturna.step_two

            - greenhouse_growStep has stepThree:
                ~ growthLanaNotturna = stepThree
                ~ narrativeGrowthLanaNotturna = stepThree
                -> lana_notturna.step_three

            - greenhouse_growStep has stepFour:
                 ~ growthLanaNotturna = stepThree
                 ~ narrativeGrowthLanaNotturna = stepFour
                 -> lana_notturna.step_four
        }
        
    - greenhouse_chosenCultivable has LicheneDegliAbissi:
        {
            - greenhouse_growStep has stepOne:
                ~ growthLicheneDegliAbissi = stepOne
                ~ narrativeGrowthLicheneDegliAbissi = stepOne
                -> lichene_degli_abissi.step_one

            - greenhouse_growStep has stepTwo:
                ~ growthLicheneDegliAbissi = stepTwo
                ~ narrativeGrowthLicheneDegliAbissi = stepTwo
                -> lichene_degli_abissi.step_two

            - greenhouse_growStep has stepThree:
                ~ growthLicheneDegliAbissi = stepThree
                ~ narrativeGrowthLicheneDegliAbissi = stepThree
                -> lichene_degli_abissi.step_three

            - greenhouse_growStep has stepFour:
                ~ growthLicheneDegliAbissi = stepThree
                ~ narrativeGrowthLicheneDegliAbissi = stepFour
                -> lichene_degli_abissi.step_four
        }
    
    - greenhouse_chosenCultivable has NonTiScordarDiTe:
        {
            - greenhouse_growStep has stepOne:
                ~ growthNonTiScordarDiTe = stepOne
                ~ narrativeGrowthNonTiScordarDiTe = stepOne
                -> non_ti_scordar_di_te.step_one

            - greenhouse_growStep has stepTwo:
                ~ growthNonTiScordarDiTe = stepTwo
                ~ narrativeGrowthNonTiScordarDiTe = stepTwo
                -> non_ti_scordar_di_te.step_two

            - greenhouse_growStep has stepThree:
                ~ growthNonTiScordarDiTe = stepThree
                ~ narrativeGrowthNonTiScordarDiTe = stepThree
                -> non_ti_scordar_di_te.step_three

            - greenhouse_growStep has stepFour:
                 ~ growthNonTiScordarDiTe = stepThree
                 ~ narrativeGrowthNonTiScordarDiTe = stepFour
                 -> non_ti_scordar_di_te.step_four
        }
    
    - greenhouse_chosenCultivable has Olobino:
        {
            - greenhouse_growStep has stepOne:
                ~ growthOlobino = stepOne
                ~ narrativeGrowthOlobino = stepOne
                -> olobino.step_one

            - greenhouse_growStep has stepTwo:
                ~ growthOlobino = stepTwo
                ~ narrativeGrowthOlobino = stepTwo
                -> olobino.step_two

            - greenhouse_growStep has stepThree:
                ~ growthOlobino = stepThree
                ~ narrativeGrowthOlobino = stepThree
                -> olobino.step_three

            - greenhouse_growStep has stepFour:
                 ~ growthOlobino = stepThree
                 ~ narrativeGrowthOlobino = stepFour
                 -> olobino.step_four
        }

    - greenhouse_chosenCultivable has LaSpazzata:
        {
            - greenhouse_growStep has stepOne:
                ~ growthLaSpazzata = stepOne
                ~ narrativeGrowthLaSpazzata = stepOne
                -> la_spazzata.step_one

            - greenhouse_growStep has stepTwo:
                ~ growthLaSpazzata = stepTwo
                ~ narrativeGrowthLaSpazzata = stepTwo
                -> la_spazzata.step_two

            - greenhouse_growStep has stepThree:
                ~ growthLaSpazzata = stepThree
                ~ narrativeGrowthLaSpazzata = stepThree
                -> la_spazzata.step_three

            - greenhouse_growStep has stepFour:
                 ~ growthLaSpazzata = stepThree
                 ~ narrativeGrowthLaSpazzata = stepFour
                 -> la_spazzata.step_four
        }
    ->->
}
->->



=== bacca_della_addolorata

    = TW
        -> step_one
        
    = step_one
        -> remove_proposed_cultivable ->
            ~ growthBaccaDellaAddolorata = stepOne
        {charTag(TheWitch, witch_state())}:   <i>L'aria attorno a {player_name} vibra di tensione.
            -> main
    
    = step_two
        {charTag(TheWitch, witch_state())}:   <i>Odore elettrico e ceramica tesa.
        <i>Un vaso deformato resiste con fatica alla sua stessa pressione.
            -> main
    
    = step_three
        {charTag(TheWitch, witch_state())}:   <i>Il vaso è come fango al sole.
        <i>Un ramo saggia l'aria.
        <i>Asciutto e timido verso {player_name}.
          -> main
          
    = step_four
        {charTag(TheWitch, witch_state())}:   <i>L'aria è attesa.
        <i>La strada è chiara, manca solo il primo passo.
        <i>Qualcosa da ammettere.
        
            + (colto) \ {charTag(PG, "neutral")}:         <i>Confido le mie paure.
                ~ growthBaccaDellaAddolorata = stepFour
            
            {charTag(TheWitch, witch_state())}:   <i>Rami verso il cielo sostengono un frutto.
            <i>Semi rosati e foglie carnose.
            <i>Coraggiosa, la <b>Bacca dell'Addolorata</b> espone le sue ferite al mondo.
            <i>La pianta di chi finalmente ha trovato la sua strada ma non riesce ancora ad avanzare.
            <i>Tenace il frutto, e rilassate le spalle di {player_name}.
            <i>L'incertezza scivola via.
            <i>{player_name} ricorda come camminare.
                    -> ending_cultivation
                    
            + \ {charTag(PG, "neutral")}:         <i>Ho bisogno di tempo per riflettere.
                    -> main     

              

=== barba_dell_inciampo

    = TW
        -> step_one
    
    = step_one
            -> remove_proposed_cultivable ->
            ~ growthBarbaDellInciampo = stepOne
        
        {charTag(TheWitch, witch_state())}:   <i>L'errore è come una spina.
        <i>Una scheggia che brucia anche nel riposo.
        <i>Che rende bianche le notti di {player_name}.
                -> main
    
    = step_two
        {charTag(TheWitch, witch_state())}:   <i>La spina infetta.
        <i>Infetta la lingua di colpa.
        <i>La lingua difende.
        <i>La lingua critica.
        <i>La lingua aggredisce.
        <i>La colpa attanaglia {player_name}.
                -> main
    
    = step_three
        {charTag(TheWitch, witch_state())}:   <i>La colpa si fa muro.
        <i>L'errore nascosto, la spina protetta.
        <i>La colpa si fa muro.
        <i>La colpa cresce, cresce la paura di {player_name}.
                -> main
    
    = step_four
        {charTag(TheWitch, witch_state())}:   <i>Il muro vacilla.
        <i>Non ricorda più se protegge il fuori dal dentro, o il dentro dal fuori.

        + (colto)\ {charTag(PG, "neutral")}:         <i>Abbasso le mie difese.
            ~ growthBarbaDellInciampo = stepFour
            
            {charTag(TheWitch, witch_state())}:   <i>Il muro si fa calice.
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
            
        + \ {charTag(PG, "neutral")}:         <i>Mi prendo ancora del tempo.
                    -> main     
                    
=== bastone_dell_ozioso

    = TW
        -> step_one
    
    = step_one
            -> remove_proposed_cultivable ->
        ~ growthBastoneDellOzioso = stepOne

        {charTag(TheWitch, witch_state())}:   <i>{player_name} ha un prurito.
        <i>Un prurito che è gesto, nota, passo, salto.
        <i>Qualcosa di trattenuto, qualcosa di mai fatto.
                -> main
    
    = step_two
        {charTag(TheWitch, witch_state())}:   <i>Il prurito riempie la testa.
        <i>{player_name} si dice che non si fanno le cose che non si sanno fare.
        <i>Ma {player_name} si dice anche che a volte serve un solo passo per iniziare a ballare.
                -> main
    
    = step_three
        {charTag(TheWitch, witch_state())}:   <i>Il prurito si è fatto gioia, si è fatto movimento.
        <i>Le mani di {player_name} applaudono da sole quando arriva il momento.
        <i>E anche se non lo sa davvero fare, a chi importa?
        <i>Chi decide come è giusto camminare?
                -> main
    
    = step_four
        {charTag(TheWitch, witch_state())}:   <i>Il vento tra le canne vuote canta.
        
        + (colto)\ {charTag(PG, "neutral")}:         <i>E io canto con lui.
            ~ growthBastoneDellOzioso = stepFour
            
            {charTag(TheWitch, witch_state())}:   <i>Rami come braccia come gambe come festa.
            <i>Il prurito è una protesta.
            <i>I rami del <b>Bastone dell'Ozioso</b> vibrano di note stonate.
            <i>Le giunture si agitano sgraziate.
            <i>Ma non c'è gioia più grande del fare per il solo piacere di fare.
            <i>Senza luoghi dove andare.
            <i>Senza classifiche da scalare.

                ~ move_entity(BastonSound, Greenhouse)
                    -> ending_cultivation
            
        + \ {charTag(PG, "neutral")}:         <i>Aspetto.
                -> main          
        
        
=== brina_dell_impossibile

    = TW
        -> step_one
        
    = step_one
        -> remove_proposed_cultivable ->
            ~ growthBrinaDellImpossibile = stepOne

            {charTag(TheWitch, witch_state())}:   <i>Una crepa.
            <i>Un pezzo di mondo attraverso la finestra.
            -> main
    
    = step_two
        {charTag(TheWitch, witch_state())}:   <i>Ferite nel vetro.
        <i>Odore di stagno.
        <i>Di cose che {player_name} non ha mai guardato.
        <i>La crepa si è estesa.
          -> main
          
    = step_three
        {charTag(TheWitch, witch_state())}:   <i>Il mondo alle sue spalle.
        <i>Il vetro resiste.
        <i>Compie la sua trasparente missione, ignorando il proprio dolore.
          -> main
    
    = step_four
        {charTag(TheWitch, witch_state())}:   <i>Isole di vetro galleggiano nell'aria.
        <i>Sostengono il proprio ruolo.
        <i>Si reggono a vecchie ferite.
        
        + (colto) \ {charTag(PG, "neutral")}:         <i>E io osservo le mie.
             ~ growthBrinaDellImpossibile = stepFour

            {charTag(TheWitch, witch_state())}:   <i>Baccelli crescono tra le ferite, navi colme di semi.
            <i>{player_name} nomina qualcosa del suo passato.
            <i>Qualcosa che è sempre stato lì ma non vedeva.
            <i>La <b>Brina dell'Impossibile</b> si raccoglie nel luogo di un trauma.
            <i>Riempie le ferite affinché siano visibili.
            <i>Risveglia il dolore, così che lo si possa nominare.
            <i>Conosce la fatica del percorso, e offre baccelli vivi di speranza.
                
                -> ending_cultivation
        
        + \ {charTag(PG, "neutral")}:         <i>Per ora ignoro le mie.
                    -> main              
                    
=== canto_delle_compagne

    = TW
        -> step_one

    = step_one
        -> remove_proposed_cultivable ->
        ~ growthCantoDelleCompagne = stepOne

        {charTag(TheWitch, witch_state())}:   <i>Qualcosa vibra e sveglia le gambe di {player_name}.
        <i>Ha voglia di danzare.
            -> main
        
    = step_two
        {charTag(TheWitch, witch_state())}:   <i>Il vaso è caldo al tocco.
        <i>L'aria attorno rifiorisce di una nebbiolina rossastra.
          -> main
          
    = step_three
        {charTag(TheWitch, witch_state())}:   <i>La nebbia si è fatta fiume, gocce che vibrano.
        <i>Che danzano.
        <i>E quando si scontrano, la serra riecheggia di una festosa risata.
            -> main
          
    = step_four
        {charTag(TheWitch, witch_state())}:   <i>La serra si muove e si scuote, le travi cigolano nel voler danzare. 
        <i>I piedi di {player_name} battono il ritmo.
        
        + (colto)\ {charTag(PG, "neutral")}:         <i>Inizio a danzare.
            ~ growthCantoDelleCompagne = stepFour
            
            {charTag(TheWitch, witch_state())}:   <i>Ilare, <b>Canto delle compagne</b> turbina e balla riversandosi dal vaso.
            <i>In un altro tempo questo cespuglio veniva chiamato "Canto delle streghe".
            <i>L'euforia riempie i polmoni di {player_name}, sente la gioia di sapere che non è mai stata davvero {player_pronoun has him:solo|{player_pronoun has her:sola|solə}}.
            <i>I piedi spingono il suo corpo nella stanza.
            <i>La sua voce si alza e canta, chiama l3 compagn3.
            <i>Si uniscono in una festa, un sabba, rendendo il mondo intero il loro palcoscenico.
            <i>Ridendo feroci di chi l3 teme.
            
                ~ backpack_findedGifts += CantoDelleCompagne
                ~ move_entity(RedBee, Greenhouse)
                -> ending_cultivation
        
        + \ {charTag(PG, "neutral")}:         <i>Preferisco aspettare.
                    -> main     

              
=== cardo_aspinato

    = TW
        -> step_one
    
    = step_one
        -> remove_proposed_cultivable ->
        ~ growthCardoAspinato = stepOne
        
        {charTag(TheWitch, witch_state())}:   <i>Odore di buio, di cielo senza stelle.
        <i>Di bosco e nebbia e nessuna strada da imboccare.
        <i>E una palla soffice deposta sul terreno.
                -> main
    
    = step_two
        {charTag(TheWitch, witch_state())}:   <i>Rumore di passi, qualcosa che corre, che fugge, che non arriva mai.
        <i>I peli del fusto vibrano, si sollevano quando {player_name} si avvicina, {player_pronoun has him:lo|{player_pronoun has her:la|lə}} tengono distante.
                -> main
    
    = step_three
        {charTag(TheWitch, witch_state())}:   <i>È comparsa una gemma sulla cima dello stelo.
        <i>E dalla gemma emergono filamenti disgustosi, il loro puzzo chiede di provare paura, di allontanarsi, di arrendersi, di evitare ogni contatto.
                -> main
    
    = step_four
        {charTag(TheWitch, witch_state())}:   La resistenza della pianta si fa sempre più debole.
        
        + (colto)\ {charTag(PG, "neutral")}:         <i>Offro il mio aiuto.
            ~ growthCardoAspinato = stepFour
            
            {charTag(TheWitch, witch_state())}:   <i>La piante cede, si stende tra le gambe di {player_name}.
            <i>{player_name} allunga le dita, ne carezza il pelo, e al contatto, sente.
            <i>Sente la luna, le stelle, le foglie nel vento, l'erba umida.
            <i>Sente abbracci e sorrisi e mani che sorreggono.
            <i>La pianta sboccia.
            <i>Il <b>Cardo aspinato</b> sboccia nel supporto.
            <i>Nel capire che lasciarsi aiutare è aiutare l'altrə.
            <i>Nell'accettare che aiutare è aiutarsi.
                ~ move_entity(BrownBee, Greenhouse)
                -> ending_cultivation
            
        + \ {charTag(PG, "neutral")}:         <i>Preferisco aspettare.
                    -> main          


=== edera_delle_amanti

    = TW
        {charTag(TheWitch, witch_state())}:   <i>Attenzione: questa pianta allude a contenuti erotici.
        <i>{player_name} vuole farla crescere, o preferisce cambiare?
            + \ {charTag(PG, "neutral")}:         <i>Voglio andare avanti.
                -> step_one
            
            + \ {charTag(PG, "neutral")}:         <i>Voglio rimuoverla, ma solo per ora.
                -> tempCultTW_formula
                
            + (rimuovi) \ {charTag(PG, "neutral")}:         <i>Voglio rimuoverla per sempre.
                -> remove_proposed_cultivable ->
                    ~ greenhouse_chosenCultivable = ()
                {
                    - greenhouse_backupCultivable != ():
                        ->  cultivable_test
                    
                    - else:
                        {charTag(TheWitch, witch_state())}:   <i>Al momento la serra non ha domande da porre a {player_name}.
                    -> main
                }
            
    
    = step_one
        -> remove_proposed_cultivable ->  
        ~ growthEderaDelleAmanti = stepOne
        
        {charTag(TheWitch, witch_state())}:   <i>Il vaso gronda miele luminoso, calore riempie gli occhi di {player_name}.
        <i>I polpastrelli hanno fame.
            -> main
    
    = step_two
        {charTag(TheWitch, witch_state())}:   <i>Rami morbidi si sollevano lungo le pareti della serra.
        <i>Le labbra di {player_name} vibrano. 
            -> main
          
    = step_three
        {charTag(TheWitch, witch_state())}:   <i>I rami si sfiorano desideranti, colmi, sinuosi. 
        <i>Si avviluppano giocosi.
        <i>Radici gentili saggiano il legno della serra, lo sfiorano, lo penetrano.
        <i>Foglie giovani maturano, nutrendosi di questo gioco.
            -> main
    
    = step_four
        {charTag(TheWitch, witch_state())}:   <i>Calore nel ventre.
        <i>Un pezzo di serra è abbracciato da foglie e bisbigli.
        <i>Faticoso è resistere all'idea di tuffarvisi.
        
            + (colto) \ {charTag(PG, "neutral")}:         <i>Mi tuffo con loro.
                ~ growthEderaDelleAmanti = stepFour
                
                <i>Per un attimo {player_name} perde i suoi confini.
                <i>Diventa un bacio nella notte, dita desiderate tra le cosce.
                <i>Acqua sulle labbra, pelle nuda sulla terra umida.
                <i>Pienezza che riempie, la forza dell'<b>Edera delle amanti</b>.
                <i>Il corpo colmo di piacere.
                <i>Di fusione.
                <i>Vivo.
                
                    ~ move_entity(GoldenBee, Greenhouse)
                    -> ending_cultivation
            
            + \ {charTag(PG, "neutral")}:         <i>Preferisco aspettare.
                    -> main        

=== erba_liccia

    = TW
        -> step_one
    
    = step_one
        -> remove_proposed_cultivable ->
        ~ growthErbaLiccia = stepOne
        
        {charTag(TheWitch, witch_state())}:   <i>Dal vaso due cespuglietti erbosi.
        <i>Da {player_name} due pensieri spinosi: quando ho smesso di essere ciò che ero, e sono diventat{player_pronoun has him:o|{player_pronoun has her:a|ə}} ciò che sono?
            -> main
    
    = step_two
        {charTag(TheWitch, witch_state())}:   <i>L'erba cresce e i pensieri di {player_name} con lei.
        <i>Sono la persona che avrei voluto essere?
        <i>O ho tradito le promesse del mio passato?
            -> main
    
    = step_three
        {charTag(TheWitch, witch_state())}:   <i>I due cespuglietti si sfiorano, si sfiorano i pensieri di {player_name}.
        <i>Le parti di sé che non ci sono più.
        <i>Quelle nuove.
        <i>E quelle che si sono trasformate nel tempo.
        <i>Cosa significa cambiare?
            -> main
    
    = step_four
        {charTag(TheWitch, witch_state())}:   <i>Il passato è una terra spinosa.
        <i>Il ricordo si modella sul bisogno del presente.
        <i>Il futuro sboccia nella contraddizione.
        
        + (colto)\ {charTag(PG, "neutral")}:         <i>E io rifuggo la coerenza.
            ~ growthErbaLiccia = stepFour
            
            {charTag(TheWitch, witch_state())}:   <i>Il vaso brulica di erba verde e fresca.
            <i>L'<b><i>Erba Liccia</b></i> matura quando le sue radici aeree sanno ritrovarsi.
            <i>Quando nel cambiamento sanno ritrovarsi.
            <i>Quando sanno vedere ciò che erano, accogliere ciò che sono, curiosare su ciò che saranno.
                    -> ending_cultivation
        
        + \ {charTag(PG, "neutral")}:         <i>Preferisco aspettare.
                    -> main                                      

=== falsa_palude

    = TW
        -> step_one
    
    = step_one
        -> remove_proposed_cultivable ->
        ~ growthFalsaPalude = stepOne
        
        {charTag(TheWitch, witch_state())}:   <i>Il vento spinge lo sporco sul pavimento, avvicinandolo ai piedi di {player_name}.
            -> main
    
    = step_two
        {charTag(TheWitch, witch_state())}:   <i>Lo sporco si è accresciuto.
        <i>E ogni sua parte bisbiglia parole.
        <i>Il nome di {player_name} sembra lontano.
        <i>Ma riconosce sentimenti che ha già vissuto.
            -> main
    
    = step_three
       {charTag(TheWitch, witch_state())}:   <i>Nella calma della serra il pavimento sembra vivo.
       <i>Foglie e fiori e pistilli avanzano l3 un3 verso l3 altr3.
       <i>Il sentimento si è fatto movimento.
       <i>Forse {player_name} non è {player_pronoun has him:solo|{player_pronoun has her:sola|solə}} nel vivere certe emozioni?
            -> main
    
    = step_four
        {charTag(TheWitch, witch_state())}:   <i>La separazione è solo illusione.
        
        + (colto)\ {charTag(PG, "neutral")}:         <i>Voglio vedere oltre l'illusione.
            ~ growthFalsaPalude = stepFour
            
            {charTag(TheWitch, witch_state())}:   <i>Il movimento si è fatto unione, si è fatto gruppo.
            <i>E un cespuglio fitto e odoroso illumina il pavimento della serra.
            <i>E tutta la <b>Falsa Palude</b> sospira.
            <i>Esule dell'acqua, eppure capace di germogliare.
            <i>La <b>Falsa Palude</b> è corallo di terra, colonia.
            <i>Vibrazione vicina e ascolto.
            <i>Ciò che accade quando il dolore si fa terreno comune.
            <i>Quando storie diverse riconoscono la propria voce.
            <i>E ciò che sembrava un ostacolo personale, si dimostra un problema strutturale.
                -> ending_cultivation
        
        + \ {charTag(PG, "neutral")}:         <i>Preferisco aspettare.
                -> main                                 

=== lana_notturna

    = TW
        -> step_one
    
    = step_one
        -> remove_proposed_cultivable ->
        ~ growthLanaNotturna = stepOne
        
        {charTag(TheWitch, witch_state())}:   <i>Ha quella sensazione, {player_name}.
        <i>Quella di quando la notte {player_pronoun has him:lo|{player_pronoun has her:la|lə}} afferra nel letto, svegliandola, ributtandola in incubi e pensieri quotidiani soffocanti.
        <i>Di quando si agita tra le coperte, in trappola.
        {debug: growthLanaNotturna è {growthLanaNotturna}, greenhouse_chosenCultivable è {greenhouse_chosenCultivable}, greenhouse_cultivableGrowing è {greenhouse_cultivableGrowing},greenhouse_growStep è {greenhouse_growStep} }
                -> main
    
    = step_two
        {charTag(TheWitch, witch_state())}:   <i>Le cose che non può cambiare si affastellano sulla pelle di {player_name}, le cose che non vanno.
        <i>Si appesantiscono sulle mani, schiacciano lo stomaco.
        <i>L'aria è sabbia, le scarse ombre minaccia.
            -> main
    
    = step_three
        {charTag(TheWitch, witch_state())}:   <i>Fare un passo fuori dal letto è come una corsa.
        <i>Aprire la porta, accendere una luce.
        <i>Il mondo fuori dorme, ma {player_name} è {player_pronoun has him:sveglio|{player_pronoun has her:sveglia|svegliə}}.
        <i>Qualcosa si appoggia sulle sue labbra, sulla sua coscienza.
            -> main
    
    = step_four
        {charTag(TheWitch, witch_state())}:   <i>Perché il fiore sbocci, la gemma deve spaccarsi, ferirsi.
        <i>Ma serve attendere il tempo giusto, lasciare che le cose possano maturare.
        
        + (colto)\ {charTag(PG, "neutral")}:         <i>Ho imparato ad attendere.
            ~ growthLanaNotturna = stepFour
            
            {charTag(TheWitch, witch_state())}:   <i>Un unico grande e morbido fiore, i petali soffici si spalancano nella serra.
            <i><b>Lana Notturna</b> è una coperta nella notte, una tisana nei giorni bui.
            <i>Sboccia nelle terre dimenticate, per ricordare che anche quando tutto sembra perduto, da qualche parte cresce il seme del cambiamento.
                -> ending_cultivation
        
        + \ {charTag(PG, "neutral")}:         <i>Preferisco aspettare.
                -> main             
                    
=== lichene_degli_abissi
    
    = TW
        -> step_one
        
    = step_one
        -> remove_proposed_cultivable ->
        ~ growthLicheneDegliAbissi = stepOne
        
        {charTag(TheWitch, witch_state())}:   <i>Due mondi si incontrano.
        <i>Foglie nuove si accrescono.
        <i>L'aria è piena di possibilità.
            -> main
    
    = step_two
        {charTag(TheWitch, witch_state())}:   <i>Le foglie ora riempiono ogni cosa, vedono solo sé stesse.
            -> main
          
    = step_three
        {charTag(TheWitch, witch_state())}:   <i>Fiori come cuori, e un susseguirsi di bisbigli amorosi.
        <i>Le radici interconnesse, indistricate.
        <i>Piccoli pruriti taciuti.
        <i>La volontà di non trovare una separazione.
            -> main
          
    = step_four
        {charTag(TheWitch, witch_state())}:   <i>Dubbi e non detti esplodono come lame.
        <i>Ciò che prima era amorevolmente interconnesso ora è imprigionato.
        <i>Ci sono forze da rilasciare.

            + (colto) \ {charTag(PG, "neutral")}:         <i>Ho qualcuno da salutare.
                ~ growthLicheneDegliAbissi = stepFour
                
                {charTag(TheWitch, witch_state())}:   <i><b>Lichene degli abissi</b> offre frutti taglienti.
                <i>Cresce dove ci sono relazioni che non sanno maturare.
                <i>Storie da lasciare.
                <i>L'odore delle sue foglie sa di persone allontanate.
                <i>Di addii dolorosi.
                <i>E ferite da risanare.
                    -> ending_cultivation
                    
             + \ {charTag(PG, "neutral")}:         <i>Preferisco aspettare.
                    -> main
                    
=== non_ti_scordar_di_te

    = TW
        -> step_one
        
    = step_one
        -> remove_proposed_cultivable ->
        ~ growthNonTiScordarDiTe = stepOne
        
        {charTag(TheWitch, witch_state())}:   <i>Radici cromate si raccolgono in piccoli mucchi.
        <i>L'aria odora di terra e ricordi.
            -> main
    
    = step_two
        {charTag(TheWitch, witch_state())}:   <i>L'unione ha portato a una fioritura.
        <i>Le radici cespugliose sono sbocciate in qualcosa di nuovo.
        <i>{player_name} pensa a chi da tempo cammina con {player_pronoun has him:lui|{player_pronoun has her:lei|ləi}}.
            -> main
          
    = step_three
        {charTag(TheWitch, witch_state())}:   <i>Nuove congiunzioni si accrescono tra i cespugli radicali.
        <i>Ciò che era separato genera nuove storie.
            -> main
          
    = step_four
        {charTag(TheWitch, witch_state())}:   <i>Qualcosa di nuovo attende la sua occasione per fiorire.

        + (colto) \ {charTag(PG, "neutral")}:         <i>Penso alle persone che mi compongono.
            ~ growthNonTiScordarDiTe = stepFour
            
            {charTag(TheWitch, witch_state())}:   <i>{player_name} si sente ramo, si sente radice.
            <i>Si sente le persone che è {player_pronoun has him:stato|{player_pronoun has her:stata|statə}} e quelle che sarà.
            <i>Le persone che l'hanno {player_pronoun has him:accompagnato|{player_pronoun has her:accompagnata|accompagnatə}} nella sua vita.
            <i><b>Non ti scordar di te</b> è la pianta del ricordo.
            <i>E del costruire.
            <i>Del celebrare le parti di chi abbiamo incontrato, che continuano a vivere in noi.
            <i>Del sentirci eredi e messagger3, parte di un percorso intessuto di nomi.
                    -> ending_cultivation
                    
            + \ {charTag(PG, "neutral")}:         <i>Preferisco aspettare.
                    -> main          
                    
                    

=== olobino

    = TW
        -> step_one
    
    = step_one
        -> remove_proposed_cultivable ->
        ~ growthOlobino = stepOne
        
        {charTag(TheWitch, witch_state())}:   <i>Piccoli bottoni luccicanti osservano la serra.
        <i>Le mani di {player_name} sembrano più calde.
            -> main
    
    = step_two
        {charTag(TheWitch, witch_state())}:   <i>I muscoli di {player_name} si distendono.
        <i>La mente si fa limpida.
            -> main
    
    = step_three
       {charTag(TheWitch, witch_state())}:   <i>Ogni morbido fungo sembra sparire nell'altro.
       <i>Il sottile micelio si mescola alle venature del legno.
       <i>E {player_name}...
       <i>Perché dovrebbe limitarsi ad essere {player_name}?
            -> main
    
    = step_four
        {charTag(TheWitch, witch_state())}:   <i>Il tempo si mescola, ieri è oggidomanimai.
        <i>I confini si sciolgono e un corpo è stanzapiantalucerespiro.
        
        + (colto)\ {charTag(PG, "neutral")}:         <i>Mi sciolgo nel tempo.
            ~ growthOlobino = stepFour
            
            {charTag(TheWitch, witch_state())}:   <i>C'è solo amore.
            <i>Per le persone care e per quelle mai conosciute, per quelle perse e quelle che verranno.
            <i>Per l'insetto nel giardino e l'uccello nel cielo.
            <i>Per l'acqua sulla fronte e la plastica sotto le dita.
            <i>C'è completezza, non separazione.
            <i>C'è e non c'è e ci sarà ed è stato ed è qui, ora.
            <i>L'<b>Olobino</b> è un fungo semplice pieno di potere.
            <i>Il potere che c'è nel perdere il sé.
            <i>L'eternità nella collettività.
                    -> ending_cultivation
            
            + \ {charTag(PG, "neutral")}:         <i>Preferisco aspettare.
                    -> main          
                    
                    

=== la_spazzata

    = TW
        -> step_one

        
    = step_one
        -> remove_proposed_cultivable ->
        ~ growthLaSpazzata = stepOne
        
        {charTag(TheWitch, witch_state())}:   <i>Il pavimento della serra si è spezzato, riempiendosi dell'acqua che viene dallo stagno.
        <i>Una singola piccola fogliolina galleggia morbidamente.
        <i>Un singolo piccolo pensiero stuzzica {player_name}.
            -> main
         
    = step_two
        {charTag(TheWitch, witch_state())}:   <i>Molte più foglie riempiono ora la fossa. 
        <i>Molti più pensieri riempiono la testa di {player_name}.
        <i>Cos'era quella cosa che avrebbe voluto dire a, sì, sa a chi.
        <i>Ma non è il caso, alla fine.
        <i>Non è mai il caso.
            -> main
    
    = step_three
        {charTag(TheWitch, witch_state())}:   <i>La serra è invasa di foglie, l'acqua si infila sotto vasi e mobili. 
        <i>E pensieri come spilli invadono la testa di {player_name}.
        <i>L'ansia si infila sotto ricordi e sicurezze, e tutto trema.
            -> main
    
    = step_four
        {charTag(TheWitch, witch_state())}:   <i>Il pavimento vuoto scricchiola.
        <i>Tutto sembra in ordine, eppure la testa di {player_name} è pronta ad esplodere.

        + (colto)\ {charTag(PG, "neutral")}:         <i>C'è qualcosa che devo dire da molto tempo.
            ~ growthLaSpazzata = stepFour
            
           {charTag(TheWitch, witch_state())}:   <i>Odore di autunno, di foglie umide.
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
                    
        + \ {charTag(PG, "neutral")}:         <i>Preferisco aspettare.
                    -> main                              

=== ending_cultivation

    {
       - are_two_entities_together(PG,Grimoire):
           @animation:Grimoire
    }

    @animation:Backpack
    
    {charTag(TheWitch, witch_state())}:   <i>{~{player_name} ha raccolto|{player_name} ha ricevuto in dono|Tra le dita {player_name} si ritrova|Nello zaino {player_name} ora ha|{player_name} riceve in dono|Ecco per {player_name}} {ingredientTranslator(greenhouse_chosenCultivable)}.
    
    //Questo è un codice che aggiorna le informazioni dei doni date da Franco nel caso in cui al momento del dono l'oggetto fosse in crescita.
    {
        - frog_first_temp_growing_gift == true:
		    ~ frog_first_char_gift = "{ingredientTranslator(greenhouse_chosenCultivable)}"
            ~ frog_first_temp_growing_gift = false
    }
    {
        - frog_first_temp_growing_ingredient == true:
		    ~ frog_first_char_ingredient = "{ingredientTranslator(greenhouse_chosenCultivable)}"
            ~ frog_first_temp_growing_ingredient = false
    }
    {
        - frog_second_temp_growing_gift == true:
		    ~ frog_second_char_gift = "{ingredientTranslator(greenhouse_chosenCultivable)}"
            ~ frog_second_temp_growing_gift = false
    }
    {
        - frog_second_temp_growing_ingredient == true:
		    ~ frog_second_char_ingredient = "{ingredientTranslator(greenhouse_chosenCultivable)}"
            ~ frog_second_temp_growing_ingredient = false
    }
    
    ~ notification_greenhouseGrownRepropose = true
    ~ backpack_findedGifts += greenhouse_chosenCultivable
    ~ greenhouse_findedCultivables += greenhouse_chosenCultivable
    ~ greenhouse_cultivableGrowing = 0
    ~ greenhouse_chosenCultivable = ()
    ~ greenhouse_growStep = ()
    ~ notification_greenhouseGrown = false

        -> notification_system ->
        -> achievements_onGame_statusUpdate_GM ->

    + {greenhouse_backupCultivable != ()}\ {charTag(PG, "neutral")}:         <i>Voglio coltivare qualcosa di nuovo.
            -> cultivable_test
    
    + \ {charTag(PG, "neutral")}:         <i>{~ Mi aggiro per la serra.|Osservo ciò che è in crescita.|Ascolto i rumori della serra.|Mi rilasso un attimo.|Mi perdo nei colori dei vasi.}
            -> main    