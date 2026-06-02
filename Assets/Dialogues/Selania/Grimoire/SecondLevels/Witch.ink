=== grimoire_witchRecap
@grimoireText #style:character #icon:witch #title:{witch_actualName} #description:{grimoire_characterDescription(TheWitch)}

    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)



    //Main story
    {
        - grimoire_witch has grimWitchIntro:
            Ci siamo presentate a {player_name}, che ha anche scelto il nome con cui preferisce chiamarci: {witch_actualName}.
    }
    {
        - grimoire_witch has grimWitchMainOne:
            Piene di fiducia, abbiamo condiviso con {player_name} un pezzo del nostro passato. Un tempo in cui eravamo separate, eravamo "io". In cui abbiamo tradito una persona amica, che aveva trovato un modo per raggiungere un luogo impossibile. Le abbiamo rubato quel sapere per arrivare qui in questo luogo, con la volontà dichiarata di volere salvare il mondo. Ma col solo desiderio di essere vista. E i miei perché sbagliati hanno finito per farmi abbandonare.
    }
    {
        - grimoire_witch has grimWitchMainTwo:
            Abbiamo continuato a raccontare a {player_name} il nostro passato, e il dolore che abbiamo provato dopo l'abbandono. Abbiamo provato a morire, ma la rabbia ci ha salvate, ci ha fatto insultare i nomi di chi ci aveva abbandonate. E per questo abbiamo distrutto tutto ciò che avevano creato. Raccolte le macerie, le abbiamo portate sulla collina per far sì che nessuno potesse più entrare. E abbiamo distrutto l'albero. Un albero che era promessa e possibilità. Curato da una persona amata. E questo mi ha riempito di odio verso me stessa.
    }
    {
        - grimoire_witch has grimWitchMainThree:
            {player_name} ha ascoltato un altro pezzo della mia storia, di quando abbiamo scoperte dopo anni di cecità la presenta di Franco. Franco che ci ha accolte come vecchie amiche, che sapeva tante cose di noi. Che per settimane ci ha raccolto lungo le sue rive, aiutandoci a farci domande, domande per capire. Quando gli abbiamo chiesto "Dove ho sbagliato?" lui ha risposto "Volevi conoscere l'acqua, ma ti sei fatta nuotare". Coi piedi verso il cielo abbiamo creduto di capire. Abbiamo ripreso a studiare, cercando un modo per aiutare le nostre amiche ora lontane. Pensavamo di aver capito, e stavamo di nuovo sbagliando.
    }
    {
        - grimoire_witch has grimWitchMainFour:
            Un altro pezzo della nostra storia ha riempito le orecchie di {player_name}. Un momento di ricerca che ci ha portate a ignorare noi stesse, Franco. Correndo da una parte all'altra fino a quando le gambe non hanno ceduto. Fino a quando non ci siamo ritrovate stese per ore in silenzio con Franco, gli occhi piene di lacrime, continuando a pensare a chi non c'era più. A chi non avevo ascoltato. Se il primo dolore mi aveva portato ad affondare, ora galleggiavo nel grigio. "Volevi conoscere l'acqua, ma ti sei fatta nuotare", mi aveva detto Franco. Ti sei fatta prendere dal sapere, e hai lasciato che il sapere ti comandasse", ho letto io. E un giorno, finalmente ho capito cosa avevo sbagliato.
    }
    {
        - grimoire_witch has grimWitchMainFive:
            {player_name} ha ascoltato l'ultimo pezzo della mia storia, quella in cui ho ricordato il motto di un'amica vera, "Noi siamo le nostre relazioni". Un'amica che aveva passato due anni a cucinare per darci uno spazio di unione, sempre pronta ad ascoltarci. Noi siamo le nostre relazioni. E se volevo comprendere questo luogo, dovevo ritrovarmi altrove. Per conoscere l'acqua, devi diventare acqua. Per conoscere questo luogo, sono diventata questo luogo. Seduta, ho ascoltato perdendomi nelle dissertazioni delle libellule e gli amori delle lucciole, nei canti delle api e i desideri degli uccelli fino a quando non ho trovato il nome di questo luogo, fino a quando non abbiamo rinunciato al nostro e siamo diventate Selanìa.
    }

    //Debrief
    {
        - grimoire_witch has grimWitchFirstDebrief:
            Dopo la sua prima riscrittura, abbiamo parlato con {player_name} di come un problema personale, come un masso, possa bloccare anche il sentiero del bosco più florido. Abbiamo condiviso con {player_name} la convinzione che riconoscere ciò che si prova sia un lusso non per tutte le persone. E che il dolore che proviamo a volte non è solo personale, ma il segno di qualcosa che deve bruciare.
    }
    {
        - grimoire_witch has grimWitchSecondDebrief:
            Dopo la seconda riscrittura, abbiamo ripreso il discorso con {player_name}, e dopo che ci ha raccontato quali sono i problemi che condivide con altre persone, abbiamo chiuso con una domanda: se un albero è un albero, quanti alberi fanno una foresta? E se una ferita è una ferita, quante ferite richiedono una protesta?
    }
    {
        - grimoire_witch has grimWitchThirdDebrief:
        ssss
    }
    {
        - grimoire_witch has grimWitchFourthDebrief:
        ssss
    }
    {
        - grimoire_witch has grimWitchFifthDebrief:
        ssss
    }

    //Altro
    {
        - grimoire_witch has grimWitchBook:
            Abbiamo anche informato {player_name} che il libro che stringe ora in mano viene aggiornato da noi mano a mano che le cose accadono, anche con ricerche altrui. E speriamo la cosa non {player_pronoun has him:gli|{player_pronoun has her:le|lə}} crei dispiacere, ma la memoria è come neve in primavera.
    }

    {
        - grimoire_witch has grimWitchFrog:
            Abbiamo spiegato a {player_name} l'importanza del lavoro di Franco La Rana, che fa in modo che ogni pianto venga ascoltato, ogni dolore alleviato. Privo di padroni e leggi se non quella della cura delle altre persone.
    }

    {
        - grimoire_fifthChar has grimMentorWitchOne:
            ~ grimMentorWitchOne_text()
    }

    {
        - grimoire_witch has grimWitchThirdChar:
            ~ grimWitchThirdChar_text()     
    }

    
    + [Index #bookmark:index]
        -> grimoire
    + [precedente #bookmark:previous]
        @grimoireTextPrevious
        -> grimoire_witchRecap
    + [prossima #bookmark:next]
        @grimoireTextNext
        -> grimoire_witchRecap

->->
