=== grimoire_fifth_character_conversation
    @grimoireText #style:character #icon:{translator(fifthChar_ActualName)} #title:{translator(fifthChar_ActualName)} #description:{grimoire_characterDescription(FifthCharacter)} #content:conversation

    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)

    // {//qui sarà più uno storylet ad hoc ad attivarci un po' di roba. Da vedere se prima o dopo la mostrificazione.
    // - fifthChar_storyStatus == story_storyStarted: 
    //     <b>Lista delle persone importanti per {charNameFive}</b>
    //     <i>Dona</i>: la ex di {charNameFive}.
    //     <i>Il Poggi</i>: il migliore amico di {charNameFive}.  
    // }

    //Main story come Mentore
    {
        - grimoire_fifthChar has grimMentorIntro:
        <b>Appunti dalle conversazioni</b>
        Al suo arrivo {player_name} ha conosciuto {charNameFive}, che dopo essersi presentata, ha aperto a {player_name} la serra.
    }
    {
        - grimoire_fifthChar has grimMentorOne:
        Durante una chiacchierata, {charNameFive} ha raccontato a {player_name} che il suo posto preferito è la serra, perché vedere crescere le cose la fa sentire appagata, la sensazione di permettere con le proprie mani a un altro corpo di crescere al meglio.
    }

    {
        - grimoire_fifthChar has grimMentorTwo:
        {charNameFive} è rimasta colpita da come {charNameOne} sia rimasta così bloccata da tutte le possibilità che ha avuto davanti a sé. Però poi ha aggiunto che forse si è dimenticata di quanto possa essere facile perdere sé stesse quando si è giovani.
    }

    {
        - grimoire_fifthChar has grimMentorThree:
        {charNameFive} ha raccontato a {player_name} che a volte ci sono persone, persone passate da qui, che vorrebbe sentire più spesso. Ma le loro lettere non arrivano, o arrivano sempre più di rado E allora si chiede se ha sbagliato qualcosa.
    }

    {
        - grimoire_fifthChar has grimMentorFour:
        Ora che {charNameTwo} ha trovato il suo nome, {charNameFive} si chiede se non sia stata troppo severa con lui. Dice che era spaventata, e forse ha reagito con violenza. Si è chiesta cosa possa significare essere un genitore che si rende conto che suo figlio, così piccolo, ha già perso la sua strada. E perché non pensa al pallone, o allo studio, invece che al futuro e all'ambiente.
    } 

    {
        - grimoire_fifthChar has grimMentorFive:
        Da quando {player_name} è qui, per la prima volta {charNameFive} ha ammesso di essere stanca. E di sentire caldo. E poi si è lasciata andare ai ricordi: il suo primo bacio, l'uomo che ha sposato. A cui ha dedicato il resto dei suoi giorni, fino a quando non è arrivata qui. Ha chiesto a {player_name} cosa significa per {player_pronoun has him:lui|{player_pronoun has her:lei|ləi}} amare un'altra persona. Per poi definirsi una "sciocca romantica", e dirmi che l'amore è ovunque, anche qui. Amore per noi.
    } 

    {
        - grimoire_fifthChar has grimMentorSix:

    }


    //Storylets speciali come Mentore
    {
        - grimoire_fifthChar has grimMentorLiar:
            Dopo l'arrivo di {charNameTwo}, la prima cosa che {charNameFive} ha chiesto a {player_name} è se è {player_pronoun has him:riuscito|{player_pronoun has her:riuscita|riuscitə}} a mandarlo a casa. Dice che qui non è sicuro per i bambini, che lui le ha tirato un calcio. Ma che le fa tenerezza, e per questo le sembra un riccio.
    } 

    {
        - grimoire_fifthChar has grimMentorViolence:
            {charNameFive} ha ripreso la conversazione sulla stretta che ha dato al braccio di {charNameTwo}. Ha iniziato dicendo a {player_name} che non le piace arrabbiarsi, ma poi ha tentennato per un po'. E dopo uno scambio con {player_name} ha deciso di chiedere scusa a {charNameTwo}.
    }
    
    {
        - grimoire_fifthChar has grimSecondCharMentorOne:
            ~ grimSecondCharMentorOne_text()
    }

    {
        - grimoire_secondChar has grimSecondCharKitchenAlone:
            ~ grimSecondCharKitchenAlone_text()
    }
    
    {
        - grimoire_fifthChar has grimMentorFranco:
            {charNameFive} e Franco La Rana hanno discusso. E quando {charNameFive} si è allontanata, Franco ha aggiunto di non ricordare l'esistenza di alcun mentore da queste parti.
    }

    {
        - grimoire_fifthChar has grimMentorWitchOne:
            ~ grimMentorWitchOne_text()
    }

    {
        - grimoire_fifthChar has grimMentorOlobinoUno:
            Dopo aver visto il cambiamento alla serra portato dall'Olobino, {charNameFive} si è arrabbiata, perché ci sono troppi cambiamenti per lei.
            {
                - grimoire_fifthChar has grimMentorOlobinoDue:
                    Ma dopo alcune considerazioni, ha realizzato che l'Olobino ha reso la serra più stabile. Non è ancora convinta, ma lo apprezza un po' di più.
            }
    }


    {
        - grimoire_fifthChar has grimMentorMeltdown:

    }
    {
        - grimoire_fifthChar has grimMentorNovel:
            Dopo aver letto il racconto <b>Il cancello</b>, {charNameFive} ha chiesto a {player_name} se non si è mai sentit{player_pronoun has him:o|{player_pronoun has her:a|ə}} così stanc{player_pronoun has him:o|{player_pronoun has her:a|ə}} da volere sparire per un po' dal mondo.
    }

    //Storylets condivisi
    {
        - grimoire_fifthChar has grimFirstCharMentor:
            ~ grimFirstCharMentor_text()
    }

    {
        - grimoire_fifthChar has grimFirstCharMentorAboutThirdChar:
            ~ grimFirstCharMentorAboutThirdChar_text()
    }

    {
        - grimoire_fifthChar has grimThirdCharMentor:
            ~ grimThirdCharMentor_text()
    } 

    //Secret endings delle personagge
    
    {
        - grimoire_fifthChar has grimMentorFirstSecretEnding:
            A fine riscrittura, {charNameOne} ha detto a {player_name} che crede che {charNameFive} sia triste per qualcosa. Le dà l'impressione di mettercela tutta, qui, ma le sembra in qualche modo scomoda. E crede che abbia bisogno di una persona amica.
    }

    {
        - grimoire_fifthChar has grimMentorSecondSecretEnding:
            Prima di salutare {player_name}, {charNameTwo} ha detto che secondo lui {charNameFive} non mica felice. Gli ricorda mamma quando gira per casa dando consigli e dicendo cose sorridendo. E poi si rinchiude in camera e resta in silenzio per ore. Anche {charNameFive}, ma secondo {charNameTwo} non sta bene.
    }


    {
        - grimoire_fifthChar has grimMentorThirdSecretEnding:

    }


    {
        - grimoire_fifthChar has grimMentorFourthSecretEnding:

    }

    {
        - grimoire_fifthChar has grimMentorFifthSecretEnding:

    }


    //Main story come Mostro
    {
        - grimoire_fifthChar has grimFifthCharOne:
            Blah blah blah

    }

    {
        - grimoire_fifthChar has grimFifthCharTwo:

    }

    {
        - grimoire_fifthChar has grimFifthCharThree:

    }

    {
        - grimoire_fifthChar has grimFifthCharFour:

    } 

    {
        - grimoire_fifthChar has grimFifthCharFive:

    } 

    {
        - grimoire_fifthChar has grimFifthCharSix:

    }


    //Storylets speciali
    {
        - grimoire_fifthChar has grimFifthCharNovel:

    }

    {
        - grimoire_fifthChar has grimFifthCharFranco:

    }


    {
        - grimoire_fifthChar has grimFifthCharKitchenAlone:


    }

    //Storylets con Nonna 
    {
        - grimoire_fifthChar has grimMonsterMolotovOne:
            ~ grimMonsterMolotovOne_text()
    }

    {
        - grimoire_fifthChar has grimMonsterMolotovTwo:
            ~ grimMonsterMolotovTwo_text()
    }

    {
        - grimoire_fifthChar has grimMonsterMolotovThree:
            ~ grimMonsterMolotovThree_text()
    }

    {
        - grimoire_fifthChar has grimMonsterMolotovFour:
            ~ grimMonsterMolotovFour_text()
    }

    {
        - grimoire_fifthChar has grimMonsterMolotovFive:
            ~ grimMonsterMolotovFive_text()
    }

    {
        - grimoire_fifthChar has grimMonsterMolotovSix:
            ~ grimMonsterMolotovSix_text()
    }

    //Storylets condivisi DA INSERIRE
    
    + [Index #bookmark:index]
        -> grimoire
    + {fifthChar_storyStatus != story_storyNotStarted}[{translator(fifthChar_ActualName)} #bookmark:secondLevel]
        -> grimoire_fifthCharacter
    + [precedente #bookmark:previous]
        @grimoireTextPrevious
        -> grimoire_fifth_character_conversation
    + [prossima #bookmark:next]
        @grimoireTextNext
        -> grimoire_fifth_character_conversation

->->



=== grimoire_fifth_character_present
@grimoireText #style:character #icon:{translator(fifthChar_ActualName)} #title:{translator(fifthChar_ActualName)} #description:{grimoire_characterDescription(FifthCharacter)} #content:present

    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)


    // {
    //     - frog_fifth_char_gift != "":
    //         Franco ha consigliato a {player_name} di regalare a {charNameThree} <b>{ingredientTranslator(frog_fifth_char_gift)}</b>.

    // }


    {
        - fifthChar_favouritesGifts has fifthChar_giftedObject:
            {player_name} le ha donato <b><i>{ingredientTranslator(fifthChar_giftedObject)}</b></i> ed era entusiasta!
        
        - fifthChar_goodGifts has fifthChar_giftedObject:
            {player_name} le ha donato <b><i>{ingredientTranslator(fifthChar_giftedObject)}</b></i> ed ha abbastanza apprezzato.
        
        - else:
            {player_name} le ha donato <b><i>{ingredientTranslator(fifthChar_giftedObject)}</b></i> e non ha apprezzato per nulla.
    
    }
        

    + [Index #bookmark:index]
        -> grimoire
    + [{translator(fifthChar_ActualName)} #bookmark:secondLevel]
        -> grimoire_fifthCharacter
    + [precedente #bookmark:previous]
        @grimoireTextPrevious
        -> grimoire_fifth_character_present
    + [prossima #bookmark:next]
        @grimoireTextNext
        -> grimoire_fifth_character_present
->->


=== grimoire_fifth_character_kitchen
@grimoireText #style:character #icon:{translator(fifthChar_ActualName)} #title:{translator(fifthChar_ActualName)} #description:{grimoire_characterDescription(FifthCharacter)} #content:kitchen

    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)

    <b>{kitchen_fifthCharRecipe}.</b>
    <i>Ranacronaca a cura di Franco Lo Chef.</i>

    {kitchen_fifthCharRecipeNoun}: l'elemento centrale di questa ricetta. La preparazione richiede una buona dose di manualità, cosa non facile per {charNameOne}, che ha solo delle vibrisse. Il piatto tradizionalmente prevede anche l'aggiunta di olio invernale, ma {player_name} ha optato per della {kitchen_fifthCharRecipeAdjective}, rompendo gli schemi e il cuore di zio Gracco. Nel mentre {charNameOne} ha rovesciato una prima bottiglia di vino, cosa non prevista dalla ricetta, per poi riempirla con delle spighe raccolte dalla palude, cosa non prevista dai pesci della palude. Quando ormai il piatto ha iniziato ad addensarsi, il duo ha deciso di rafforzarne il sapore aggiungendo {kitchen_fifthCharRecipeComplement}, cosa che i più definirebbero coraggiosa, ma non {player_name}, che ha avuto la capacità di seguire la conversazione con {charNameOne}, e anche di preparare un piatto irripetibile (Tullio dice che è importante che sia irripetibile o a qualcuno viene il mal di pancia). <>
    {
        - kitchen_fifthCharExtraIngredient != ():
            Con classe e anche con palestra e presidenza, {player_name} ha infine aggiunto {ingredientTranslator(kitchen_fifthCharExtraIngredient)}, perché al girino piace rischiare. <>

        - else:
            Con austerità (che è una cosa che mi ha insegnato Euforbo e ha a che fare con l'Australia) {player_name} ha deciso di non aggiungere altro. <>
    }
    Entrambi i girini sono vivi, e consideriamo questa cosa un vero e proprio successo.


    //Recap cose dette
    {
        - grimoire_fifthChar has grimFifthCharKitchenOne:
 
    }
    {
        - grimoire_fifthChar has grimFifthCharKitchenTwo:
  
    }
    {
        - grimoire_fifthChar has grimFifthCharKitchenThree:

    }

    //Feedback ingrediente extra
    {
        - kitchen_fifthCharExtraIngredient == universalIngredient:
            AGGIUNGI RICORDO IMPORTANTE.

        - fifthChar_favouritesGifts has kitchen_fifthCharExtraIngredient:

   
        - fifthChar_goodGifts has kitchen_fifthCharExtraIngredient:


        - kitchen_fifthCharExtraIngredient != ():

        
        - else:
            Cucinando con {charNameFive}, {player_name} ha deciso di non aggiungere alcun ingrediente aggiuntivo.

    }

    //Recap commento a tavola
    {
        - grimoire_fifthChar has grimFifthCharKitchenPositiveReaction:
            Dopo aver cucinato assieme, {charNameFive} ha detto a {player_name} che.

        - grimoire_fifthChar has grimFifthCharKitchenNegativeReaction:
            Dopo aver cucinato assieme, {charNameFive} ha detto a {player_name} che.

        - grimoire_fifthChar has grimFifthCharKitchenNeutralReaction:
            Dopo aver cucinato assieme, {charNameFive} ha detto a {player_name} che.

    }
    

    + [Index #bookmark:index]
        -> grimoire
    + [{translator(fifthChar_ActualName)} #bookmark:secondLevel]
        -> grimoire_fifthCharacter
    + [precedente #bookmark:previous]
        @grimoireTextPrevious
        -> grimoire_fifth_character_kitchen
    + [prossima #bookmark:next]
        @grimoireTextNext
        -> grimoire_fifth_character_kitchen
->->




=== grimoire_fifth_character_rewrite
@grimoireText #style:character #icon:{translator(fifthChar_ActualName)} #title:{translator(fifthChar_ActualName)} #description:{grimoire_characterDescription(FifthCharacter)} #content:rewrite

    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)

    {
        - grimoire_fifthChar has grimFifthCharProposal:
            Prima della riscrittura, {charNameFive} ha detto a {player_name} di.
    } 

    // {
    //     - fifthAffinityFeedback:
    //         Il valore di inchiostro che {player_name} ha raggiunto con {charNameFive} prima della riscrittura è stato: <b>{fromInkToNumbers(FifthCharacter)}</b>.<>
    // }

    {
        - grimoire_fifthChar has grimFifthCharNewName:
            Dopo la riscrittura, ha scelto un nuovo nome: <b><i>{translator(fifthChar_ActualName)}.</b></i>
    }
    {
        - fifthChar_ActualName has Triangolo:
            
        
        - fifthChar_ActualName has Orchestra:
.
                
        - fifthChar_ActualName has FlautoDolce:

    
        - fifthChar_ActualName has Ocarina:
    

        - fifthChar_ActualName has Violino:

    }

    {
        - grimoire_fifthChar has grimFifthCharMentorFeedback:
            {charNameFive} ha detto a {player_name} che <>

            {
                - fifthChar_ActualName has Triangolo:
                    
                - fifthChar_ActualName has Orchestra:

                - fifthChar_ActualName has FlautoDolce: 
                                
                - fifthChar_ActualName has Ocarina:

                - fifthChar_ActualName has Violino:
            
            }
    }


    + [Index #bookmark:index]
        -> grimoire
    + [{translator(fifthChar_ActualName)} #bookmark:secondLevel]
        -> grimoire_fifthCharacter
    + [precedente #bookmark:previous]
        @grimoireTextPrevious
        -> grimoire_fifth_character_rewrite
    + [prossima #bookmark:next]
        @grimoireTextNext
        -> grimoire_fifth_character_rewrite
->->


=== grimoire_fifth_character_letters
@grimoireText #style:character #icon:{translator(fifthChar_ActualName)} #title:{translator(fifthChar_ActualName)} #description:{grimoire_characterDescription(FifthCharacter)} #content:letters

    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)


    {
        - grimoire_fifthChar has grimFifthCharLetterOne:
            <b>Prima lettera</b>
            Saluto. <>
                ~ letters_fifthCharLetters_one()
    }
    
    {
        - grimoire_fifthChar has grimFifthCharLetterTwo:
            <b>Seconda lettera</b>
            Saluto. <>
                ~ letters_fifthCharLetters_two()
    }

    {
        - grimoire_fifthChar has grimFifthCharLetterThree:
            <b>Terza lettera</b>
            Saluto. <>
                ~ letters_fifthCharLetters_three()
    }

    {
        - grimoire_fifthChar has grimFifthCharLetterFour:
            <b>Quarta lettera</b>
            Saluto. <>
                ~ letters_fifthCharLetters_four()
    }
    
    

    + [Index #bookmark:index]
        -> grimoire
    + [{translator(fifthChar_ActualName)} #bookmark:secondLevel]
        -> grimoire_fifthCharacter
    + [precedente #bookmark:previous]
        @grimoireTextPrevious
        -> grimoire_fifth_character_letters
    + [prossima #bookmark:next]
        @grimoireTextNext
        -> grimoire_fifth_character_letters
->->