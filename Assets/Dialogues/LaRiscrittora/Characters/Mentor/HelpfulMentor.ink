/* ---------------------------------

    Mentore utile: diramazioni dialoghi
       
 ----------------------------------*/
 === support
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    - (top)
    {charNameFive}: Hai bisogno dei miei consigli?
        + {gifts_and_ink}[Mi ripeteresti cosa devo fare?]
            -> to_do
        + [Ho una domanda su un luogo.]
            -> tutorial
        + {bacca_della_addolorata.step_tre.colto or non_ti_scordar_di_te.step_tre.colto or brina_dell_impossibile.step_tre.colto or la_spazzata.step_tre.colto or edera_delle_amanti.step_tre.colto or lichene_degli_abissi.step_tre.colto or canto_delle_compagne.step_tre.colto} [Ho una domanda sulle piante della serra.]
            -> elementi_serra
        + [C'è una cosa che mi riguarda.]
            -> myself
        + [Vorrei parlare d'altro.]
            -> talk_with_mentor
        -
            -> top   

    = myself
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    {charNameFive}: C'è qualcosa che posso fare per aiutarti?
        + [Vorrei cambiare il mio nome.]
                -> name_choice -> support
        + [Vorrei cambiare i miei pronomi.]
                -> gender -> support
        + [Vorrei consigli su come stare meglio.]
                -> mindfulness -> support
        + [Vorrei aggiornare la lista dei miei temi delicati.]
                -> trigger_warning -> support 
        + [Sono a posto così, grazie.]
                -> talk_with_mentor
 
 

/* ---------------------------------

    Mentore utile: contenuti
       
 ----------------------------------*/

=== tutorial
~ temp charNameOne = uppercaseTranslator(firstCharacterState)
~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
~ temp charNameThree = uppercaseTranslator(thirdCharacterState)
~ temp charNameFour= uppercaseTranslator(fourthCharacterState)
~ temp charNameFive = uppercaseTranslator(fifthCharacterState)

//Strutturare come wave sintetica?
    {charNameFive}: Ecco i luoghi che puoi visitare in questo momento.
    {charNameFive}: Su quali vorresti avere informazioni?

- (top)
    + [Sulla stazione.]
            {charNameFive}: Intendi il luogo dove passo ore a spalare neve?
            {charNameFive}: La stazione, ad est del Giardino, è il posto dove approdano le nuove persone.
            {charNameFive}: È anche il luogo attraverso cui potrai raggiungerci.
            {charNameFive}: O da cui andartene, quando vorrai.
                -> top

    + [Sulla serra.]
            {charNameFive}: La serra è il mio posto preferito: ho sempre amato coltivare fiori e piante!
            {charNameFive}: Anche se lì dentro cresce della roba molto strana.
            {charNameFive}: La serra è un piccolo posto di meditazione.
            {charNameFive}: Se non sta crescendo nulla, puoi provare a seguire le sue suggestioni.
            {charNameFive}: Col tempo qualcosa crescerà, e a quel punto forse avrai anche una risposta a una domanda che non sapevi di doverti fare.
            {charNameFive}: Tipo: come fa {charNameFive} a tenere i vetri sempre così puliti?
                -> top

    + [Sulla foresta.]
            {charNameFive}: La foresta è un po' il nostro posto di passaggio.
            {charNameFive}: Non ho idea di chi abbia messo la panchina, sinceramente.
            {charNameFive}: E tenerla pulita tutti i giorni è una gran fatica.
            {charNameFive}: E quella pianta, fungo, quella cosa che è nel mezzo, non ho ancora capito come farla rifiorire.
            {charNameFive}: E questo mi lascia molto frustrata.
            -> top
            
    + {secondTier or thirdTier or fourthTier}[Sono altri i luoghi di cui vorrei parlare.]
        -> second_top
    
    + {not secondTier or thirdTier or fourthTier}[Voglio parlare d'altro.]
        -> talk_with_mentor  

    
- (second_top)    
    + {secondTier}[Sulla biblioteca.]
            {charNameFive}: La biblioteca è un posto... un posto.
            {charNameFive}: Ci sono molti racconti, ma chi ha il tempo di leggerli?
            {charNameFive}: Con tutta quella polvere che raccolgono, poi.
            {charNameFive}: Però un paio di volte ho usato la poltrona per fare del body scan, e non è stato male.
            {charNameFive}: Mi sono quasi addormentata.
            {charNameFive}: Quasi.
            -> second_top
            
    + {thirdTier}[Sul laboratorio.]
        Informazioni
            -> second_top

    + {fourthTier}[Sul nido.]
        Informazioni
            -> second_top
    
    + {secondTier} [Vorrei parlare di un altro luogo.]
            -> top
    
    + [Vorrei parlare di qualcosa di diverso.]
        -> talk_with_mentor
    -

    -> talk_with_mentor

=== to_do
~ temp charNameFive = uppercaseTranslator(fifthCharacterState)

        {gifts_and_ink:{charNameFive}: La prima cosa da fare è: conquistare la <b>fiducia</b> della persona che devi aiutare.}
        {gifts_and_ink:{charNameFive}: Ci <b>parli</b>, cerchi di capire di cosa ha bisogno e quali sono le risposte che le piacciono.}
        {gifts_and_ink:{charNameFive}: Poi, le fai un <b>dono</b>.}
        {gifts_and_ink:{charNameFive}: Più il dono è qualcosa che le dimostra che l'hai ascoltata, più avrai <b>inchiostro</b> per aiutarla a riscrivere la sua storia.}
        {questions: {charNameFive}: A quel punto inizi i tuoi <b>interventi</b>: riprendi eventi della sua storia e la aiuti a guardarli sotto una luce diversa.}
        {questions: {charNameFive}: Più inchiostro hai, più interventi puoi fare.}
        {questions: {charNameFive}: Infine: in base alle cose che avrai detto, la persona sceglierà il suo <b>nuovo nome</b>.}
        {questions: {charNameFive}: E poi si ricomincia.}
           -> talk_with_mentor



 
 === trigger_warning ===
 ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
 
    {charNameFive}: Questi sono i principali temi delicati che potresti incontrare durante le tue chiacchierate.
    {charNameFive}: I miei poteri si limitano all'ambiente: oggetti, storie e cose che incontrerai non parleranno di quello che vuoi evitare.
    {charNameFive}: Non ho invece modo, per ora, di impedire alle persone giunte fino a qui di non affrontarli.
    {charNameFive}: Spesso quei temi sono il motivo per cui sono arrivate da, per chiedere il nostro aiuto.
    {charNameFive}: In futuro le cose potranno comunque migliorare, promesso.
    
    - (top)
    {charNameFive}: Cosa vorresti evitare?
    
    + {alcoholism == true}[Non voglio che si parli di <b>dipendenza da sostanze</b>.]
        {charNameFive}: Perfetto.
        ~ alcoholism = false
        {
        - unreadStories has Aza: 
            ~ unreadStories -= Aza
        }
            -> top
    + {alcoholism == false}[Lascia che il tema della dipendenza da sostanze sia presente.]
        {charNameFive}: Ottimo.
        ~ alcoholism = true
        // {
        // - unreadStories hasnt Aza: 
        //     ~ unreadStories += Aza
        // }
            -> top
        
  
    + {abuses == true}[Evitiamo storie su <b>violenza psicologica subita, inflitta o autoinflitta</b>.]
        {charNameFive}: Hai il mio appoggio.
        ~ abuses = false
        {
            - unreadStories has StenoArtico:
            ~ unreadStories -= StenoArtico
        }
        {
            -unreadStories has AdriAllora: 
            ~ unreadStories -= AdriAllora
        }
        {
            -unreadStories has Romi: 
            ~ unreadStories -= Romi
        }
        {
            -unreadStories has BeatriceYBottura: 
            ~ unreadStories -= BeatriceYBottura
        }
            -> top
    + {abuses == false}[Vorrei sentire anche storie su violenza psicologica subita, inflitta o autoinflitta.]
        {charNameFive}: Perfetto.
        ~ abuses = true
        // {
        // - unreadStories hasnt StenoArtico: 
        //     ~ unreadStories += StenoArtico
        // - unreadStories hasnt AdriAllora: 
        //     ~ unreadStories += AdriAllora
        // - unreadStories hasnt Romi: 
        //     ~ unreadStories += Romi
        // - unreadStories hasnt BeatriceYBottura: 
        //     ~ unreadStories += BeatriceYBottura     
        // }        
            -> top

    + {mourning == true} [Tienimi{pronouns has him: lontano|{pronouns has her: lontana|lontanə}} da <b>morte e lutto</b>.]
        {charNameFive}: Non li incontrerai nel tuo viaggio.
        ~ mourning = false
            //Rimuovo coltivabile legato a lutto
        {    
            - backupCultivable has NonTiScordarDiTe:
                ~ pianteCiclicità -= NonTiScordarDiTe
                ~ pianteIndipendenza -= NonTiScordarDiTe
                ~ pianteRicordo -= NonTiScordarDiTe
                ~ backupCultivable -= NonTiScordarDiTe
            
        }    
            -> top
            
    + {mourning == false} [Ho cambiato idea: me la sento di parlare di lutto e morte.]
        {charNameFive}: Grandioso.
        ~ mourning = true
        // {
        //     - backupCultivable hasnt NonTiScordarDiTe && not non_ti_scordar_di_te.step_zero:
        //         ~ pianteCiclicità += NonTiScordarDiTe
        //         ~ pianteIndipendenza += NonTiScordarDiTe
        //         ~ pianteRicordo += NonTiScordarDiTe
        //         ~ backupCultivable += NonTiScordarDiTe
        // }    
            -> top
        
    + {fisicalAbuses == true} [Non voglio sentire parlare di <b>abusi fisici subiti, inflitti o autoinflitti</b>.]
        {charNameFive}: Fatto.
        ~ fisicalAbuses = false
        {
            - unreadStories has StenoArtico: 
                ~ unreadStories -= StenoArtico
                }
        {
            - unreadStories has Aza: 
                ~ unreadStories -= Aza
                }
        {
            - unreadStories has BeatriceYBottura: 
                ~ unreadStories -= BeatriceYBottura
                }
        {
            - unreadStories has Maura: 
                ~ unreadStories -= Maura
                }
        {
            - unreadStories has AdriAllora: 
                ~ unreadStories -= AdriAllora                 
        }     
            -> top
    + {fisicalAbuses == false} [Ora posso sentire parlare di abusi fisici subiti o autoinflitti.]
        {charNameFive}: Perfetto.
        ~ fisicalAbuses = true
        // {
        //     - unreadStories hasnt StenoArtico: 
        //         ~ unreadStories += StenoArtico
        //     - unreadStories hasnt Aza: 
        //         ~ unreadStories += Aza
        //     - unreadStories hasnt BeatriceYBottura: 
        //         ~ unreadStories += BeatriceYBottura
        //     - unreadStories hasnt Maura: 
        //         ~ unreadStories += Maura
        //     - unreadStories hasnt AdriAllora: 
        //         ~ unreadStories += AdriAllora                   
        // }         
    
    + [I temi che voglio evitare sono altri.]
        -> top_due
    + [Sono a posto così.]
        ->->

    
    - (top_due)
    {charNameFive}: Cosa vorresti evitare?
    + {dysphoria == true}[Non mi sento a mio agio a parlare di <b>disforia e dismorfia</b>.]
        {charNameFive}: Capisco benissimo.
        ~ dysphoria = false
        {
            - unreadStories has ValFaustoLattanzio: 
                ~ unreadStories -= ValFaustoLattanzio
    
        } 
            -> top_due
    + {dysphoria == false}[Ho cambiato idea: affrontiamo storie legate alla disforia e alla dismorfia.]
        {charNameFive}: Sarà fatto.
        ~ dysphoria = true
        // {
        //     - unreadStories hasnt ValFaustoLattanzio: 
        //         ~ unreadStories += ValFaustoLattanzio
        // }        
            -> top_due
            
    
    + {sex == true}[Non parliamo di <b>sesso e sessualità</b>.]
        {charNameFive}: Fatto.
        ~ sex = false
            -> top_due
    + {sex == false}[Introduci anche storie legate al sesso.]
        {charNameFive}: Sarà fatto.
        ~ sex = true
            -> top_due
    
     + {depression == true}[Non voglio si parli di <b>depressione, ansia, pensieri intrusivi</b>.]
        {charNameFive}: Fatto.
        {
            - unreadStories has StenoArtico: 
                ~ unreadStories -= StenoArtico
                }
        {
            - unreadStories has Beatrice: 
                ~ unreadStories -= Beatrice
                }
        {
            - unreadStories has LetiziaVaccarella: 
                ~ unreadStories -= LetiziaVaccarella                 
        }     
        ~ depression = false
            -> top_due
    + {depression == false}[Introduci storie legate a depressione, ansia, pensieri intrusivi.]
        {charNameFive}: Sarà fatto.
        ~ depression = true
        // {
        //     - unreadStories hasnt StenoArtico: 
        //         ~ unreadStories += StenoArtico
        //     - unreadStories hasnt Beatrice: 
        //         ~ unreadStories += Beatrice
        //     - unreadStories hasnt LetiziaVaccarella: 
        //         ~ unreadStories += LetiziaVaccarella                 
        // }        
            -> top_due
            
    + {religion == true}[Non parliamo di <b>educazione religiosa severa</b>.]
        {charNameFive}: Fatto.
        ~ religion = false
        {
            - unreadStories has Beatrice: 
                ~ unreadStories -= Beatrice    
        }        
            -> top_due
    + {religion == false}[Introduci anche storie sull'educazione religiosa severa.]
        {charNameFive}: Sarà fatto.
        ~ religion = true
        // {
        //     - unreadStories hasnt Beatrice: 
        //         ~ unreadStories += Beatrice    
        // }              
            -> top_due            
    
    
    + [I temi che voglio cambiare sono altri.]
        -> top_three
    + [Sono a posto così.]
        ->->
    - 
    
    
    - (top_three)
    {charNameFive}: Cosa vorresti evitare?
    
    + {racism == true}[Non voglio storie che parlino di <b>razzismo</b>.]
        {charNameFive}: Capisco benissimo.
        ~ racism = false
            -> top_three
    + {racism == false}[Ho cambiato idea: introduci anche storie che parlino di razzismo.]
        {charNameFive}: Subito.
        ~ racism = true
            -> top_three
            
    
    + {misoginy == true}[Non parliamo di <b>misoginia</b>.]
        {charNameFive}: Fatto.
        ~ misoginy = false
            -> top_three
    + {misoginy == false}[Introduci anche storie che parlano di misoginia.]
        {charNameFive}: Sarà fatto.
        ~ misoginy = true
            -> top_three
    
     + {abilism == true}[Non voglio si parli di <b>abilismo</b>.]
        {charNameFive}: Fatto.
        ~ abilism = false
            -> top_three
    + {abilism == false}[Introduci storie legate all'abilismo.]
        {charNameFive}: Sarà fatto.
        ~ abilism = true
    
            -> top_three
            
    + {LGBTQIA == true}[Non parliamo di <b>odio verso le persone LGBTQIA+</b>.]
        {charNameFive}: Fatto.
        ~ LGBTQIA = false
      
            -> top_three
    + {LGBTQIA == false}[Introduci anche storie che trattano di odio verso le persone LGBTQIA+.]
        {charNameFive}: Sarà fatto.
        ~ LGBTQIA = true
            
            -> top_three            
    
    
    + [I temi che voglio cambiare sono altri.]
        -> top_four
    + [Sono a posto così.]
        ->->
    -  
    
    - (top_four)
    {charNameFive}: Cosa vorresti evitare?
    
    + {fatphobia == true}[Non voglio storie che parlino di <b>grassofobia</b>.]
        {charNameFive}: Capisco benissimo.
        ~ fatphobia = false
            -> top_four
    + {fatphobia == false}[Ho cambiato idea: introduci anche storie che parlano di grassofobia.]
        {charNameFive}: Subito.
        ~ fatphobia = true
            -> top_four
    
    + {ageism == true}[Non voglio storie che parlino di <b>ageismo</b>.]
        {charNameFive}: Capisco benissimo.
        ~ ageism = false
            -> top_four
    + {ageism == false}[Ho cambiato idea: introduci anche storie che parlano di ageismo.]
        {charNameFive}: Subito.
        ~ ageism = true
            -> top_four        
    
    + [Voglio rivedere i primi temi.]
        -> top
    + [Sono a posto così.]
        ->->
    -  
    -> main
 


 === elementi_serra
  ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    {charNameFive}: Come posso aiutarti, {name}?
    {
        - la_spazzata.step_tre.colto or edera_delle_amanti.step_tre.colto or lichene_degli_abissi.step_tre.colto or canto_delle_compagne.step_tre.colto:
            -> top
        - else:
            -> top_two    

    }
    - (top)
        + {lichene_degli_abissi.step_tre.colto} [A cosa serve il <b>Lichene degli Abissi</b>?]
            {charNameFive}: Il Lichene degli abissi parla di relazioni permeate di dolore.
            {charNameFive}: Di cose o persone che si inseguono, che possono pure volersi bene.
            {charNameFive}: Ma finiscono per farci del male.
            {charNameFive}: Capaci solo di distruggersi.
            {charNameFive}: Piene di fragilità.
                -> top
        + {edera_delle_amanti.step_tre.colto} [Quali proprietà ha l'<b>Edera delle Amanti</b>?]
            {charNameFive}: Tradizionalmente è associata al piacere fisico.
            {charNameFive}: Da queste parti si racconta che l'universo intero sia fatto d'edera.
            {charNameFive}: E che l'edera rimarrà in vita fino a quando le amanti saranno capaci di darsi amore e piacere.
            {charNameFive}: Io lo vedo invece come un invito al piacere.
            {charNameFive}: A godere anche del cibo, di una camminata.
            {charNameFive}: Di una giornata di sole.
            {charNameFive}: Il mondo non esisterebbe senza piacere.
            {charNameFive}: O non merita la nostra attenzione.
                -> top

        + {canto_delle_compagne.step_tre.colto} [Cos'è la <b>Canto delle Compagne</b>?]
            {charNameFive}: Credo sia la pianta della festa.
            {charNameFive}: Dello stare tutte assieme e ballare, cantare.
            {charNameFive}: Accogliendo la forza liberatoria che viene dalla risata in compagnia.
            {charNameFive}: Amo quella pianta, ma in passato veniva chiamata "Canto delle streghe".
            {charNameFive}: Le donne unite fanno sempre paura.
                -> top

        + {la_spazzata.step_tre.colto} [Cosa sai dirmi de <b>La Spazzata</b>?]
            {charNameFive}: Credo sia la cosa più spaventosa della serra, almeno per me.
            {charNameFive}: Parla di quel momento in cui qualcosa è insostenibile.
            {charNameFive}: E sei sul confine tra l'affrontarlo o meno.
            {charNameFive}: Riempita da una paura terribile che tutto possa andare storto, puoi decidere di non fare alcun passo.
            {charNameFive}: Col rischio di esplodere, e spazzare tutto.
            {charNameFive}: Di contro spesso, se affronti queste situazioni, finiscono per essere meno gravi di quel che pensavi.
                -> top

        + {bacca_della_addolorata.step_tre.colto or non_ti_scordar_di_te.step_tre.colto or brina_dell_impossibile.step_tre.colto}[No, vorrei parlare di altre piante.]
            -> top_two
        + [Vorrei parlare d'altro.]
            -> talk_with_mentor

    -(top_two)
        + {bacca_della_addolorata.step_tre.colto} [Non ricordo a cosa serva la <b>Bacca della Addolorata</b>.]
            {charNameFive}: Tanto brutta quanto liberatoria, personalmente, è una pianta potente.
            {charNameFive}: Donala a chi ha visto qual è la sua strada ma ha solo paura.
            {charNameFive}: Paura di avanzare, di cambiare.
            {charNameFive}: Sembra una cosa piccola, eppure è rivoluzionaria.
                -> top_two

        + {non_ti_scordar_di_te.step_tre.colto} [Sai dirmi chi apprezzerebbe il <b>Non ti scordar di te</b>?]
            {charNameFive}: Una persona che ha perso qualcuno, e ne sente ancora la mancanza.
            {charNameFive}: Quella pianticina delicata ti dice: "Ehi, chi ami è parte di te."
            {charNameFive}: Quando la vedo, non mi sento mai sola.
                -> top_two

        + {brina_dell_impossibile.step_tre.colto} [A chi serve la <b>Brina dell'Impossibile?</b>]
            {charNameFive}: Credo sia la pianta del trauma.
            {charNameFive}: E chi non ha traumi?
            {charNameFive}: Ma forse la Brina è più adatta a chi non fa pace col passato.
            {charNameFive}: A chi ha una ferita così profonda, da sentirsi divisa in due.
            {charNameFive}: A molte persone la Brina fa paura perché pensano che ti ferisca.
            {charNameFive}: Ma in realtà quello che fa è mostrarti ferite che prima non vedevi.
            {charNameFive}: E per questo è una pianta che aiuta a ripartire.
            {charNameFive}: A fare pace col passato.
                -> top_two

        + {la_spazzata.step_tre.colto or edera_delle_amanti.step_tre.colto or lichene_degli_abissi.step_tre.colto or canto_delle_compagne.step_tre.colto}[Vorrei informazioni su altre piante.]
            -> top
        + [Vorrei parlare d'altro.]
            -> talk_with_mentor


 
 === mindfulness
 //Randomizzo i contenuti e nel caso posso usare anche qui i trigger warning.
 LIST actualMindfulness = firstMind, secondMind, thirdMind, fourthMind, fifthMind
 VAR lastMindfulness = 0
 VAR pauseMindfulness = 10
 
 {
    - lastMindfulness > 0:
        {
            - actualMindfulness has firstMind:
                -> one
            - actualMindfulness has secondMind:
                -> two
            - actualMindfulness has thirdMind:
                -> three
            - actualMindfulness has fourthMind:
                -> four
            - actualMindfulness has fifthMind:
                -> five
        }
    
    - else:
        ~ lastMindfulness = pauseMindfulness
        ~ actualMindfulness = ()
        
         {shuffle:
            - 
                ~  actualMindfulness += firstMind
                -> one
            - 
                ~  actualMindfulness += secondMind
                -> two
            - 
                ~  actualMindfulness += thirdMind
                -> three
            - 
                ~  actualMindfulness += fourthMind
                -> four
            - 
                ~  actualMindfulness += fifthMind
                -> five               
         }
 
 }
 
    = one
     ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
     
        {charNameFive}: Quando inizio a pensare molto, ma molto molto, una cosa che mi aiuta è concentrarmi su quello che mi circonda.
        {charNameFive}: Inizio ad osservare un oggetto e a dirmi dentro la testa cosa è.
        {charNameFive}: Una sedia, uno sgabello, un frigorifero, un tostapane, una lavatrice.
        {charNameFive}: Se la confusione è molta, cerco di partire con il generico, come <i>elettrodomestico</i>, e poi man mano che divento più concentrata inizio a scendere nel dettaglio.
        {charNameFive}: Se ci sono poche cose, provo a descrivere le parti di un oggetto.
        {charNameFive}: O del mio corpo.
        {charNameFive}: Cosa che evito nei giorni in cui non mi piaccio.
        {charNameFive}: Questa cosa funziona benissimo anche con gli odori, o i suoni, o il tatto, o persino il gusto.
        {charNameFive}: Ti aiuta a tornare coi piedi per terra.
            ->->
    
    = two
     ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
     
        {charNameFive}: Ci sono volte in cui mi focalizzo solo sulle cose che non vanno.
        {charNameFive}: Una cosa che mi aiuta in queste situazioni è puntare una sveglia ogni due ore.
        {charNameFive}: E quando la sveglia suona provo a chiedermi:
        {charNameFive}: Come mi sto sentendo?
        {charNameFive}: Cosa sto facendo?
        {charNameFive}: Perché mi fa sentire così?
        {charNameFive}: Se mi rendo conto di star provando una emozione negativa, posso capire meglio cosa l'ha scatenata.
        {charNameFive}: Ma spesso mi rendo conto di essere serena in quel momento, o per lo meno tranquilla.
        {charNameFive}: E a quel punto capisco che non è vero che sto male tutto il giorno, ma che ci sono delle cose che non mi fanno stare bene.
        ->->
    
    = three
     ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
     
     {charNameFive}: Un tempo conoscevo una ragazza che soffriva di attacchi d'ansia e che mi ha dato una dritta che puoi applicare ovunque.
     {charNameFive}: Se il pensiero si inceppa su qualcosa, prova a stringere con forza degli oggetti che hai vicino.
     {charNameFive}: Può essere il bracciolo di una sedia.
     {charNameFive}: Il tavolo.
     {charNameFive}: Il palo sull'autobus.
     {charNameFive}: Stringi e concentrati sulla sensazione.
     {charNameFive}: Ti aiuta a tornare coi piedi per terra.
        ->->
    
    = four
     ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
     
    {charNameFive}: Il mio migliore amico è il body scan.
    {charNameFive}: Lo faccio al risveglio tra gli arbusti della foresta.
    {charNameFive}: Prima di tutto mi stendo, comoda, e faccio qualche respiro profondo.
    {charNameFive}: Poi inizio a concentrarmi sulla punta di uno dei piedi, e da lì sposto la concentrazione lungo tutto il piede, la caviglia, il polpaccio, il ginocchio, il quadricipite.
    {charNameFive}: Poi faccio la stessa cosa con l'altra gamba.
    {charNameFive}: E a quel punto mi sposto sul ventre, i glutei, i muscoli lombari, i dorsali, le spalle e via di seguito fino alla testa.
    {charNameFive}: Anche se conosco persone che preferiscono partire dalla testa e arrivare ai piedi.
    {charNameFive}: L'importante è che per tutto il processo ascolti quella parte del corpo senza giudicare, senza cercare di cambiarla.
    {charNameFive}: Respiri, accogli dolori e morbidezze, e quando te la senti, cambi area.
    {charNameFive}: Anche solo a parlarne mi sento già più rilassata.
        ->->
        
    = five
     ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
     
    {charNameFive}: Non so se ti capita di avere l'addome contratto.
    {charNameFive}: Per molte persone quell'area, e il diaframma in particolare, accumula un sacco di tensione e preoccupazione.
    {charNameFive}: Un modo per allentarla è prendere un suono che ti piace, una vocale, un <i>Aum</i>, tutte le vocali, e iniziare a ripeterle, con calma.
    {charNameFive}: Lasciando che quel suono scenda e scenda e scenda dalla gola al petto, dal petto al diaframma.
    {charNameFive}: Aiutandoti così a rilassare l'area.
    {charNameFive}: E a respirare meglio.
        ->->     

