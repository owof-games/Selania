=== knowing_fifth_character
    //Qui man mano faccio avanzare i temi toccati dalla personaggia
    {
        //Mostro è in recovery ed entriamo in serra
        - are_two_entities_together(FifthCharacter, PG) && entity_location(PG) == Greenhouse && fifthChar_recovery > 0:
            -> fifth_char_first_steps

        - grimoire_fifthChar hasnt grimFifthCharOne:
            -> fifth_char_main_storylets.one
            
        - grimoire_fifthChar hasnt grimFifthCharTwo:
            -> fifth_char_main_storylets.two
            
        - grimoire_fifthChar hasnt grimFifthCharThree:
            -> fifth_char_main_storylets.three
            
        - grimoire_fifthChar hasnt grimFifthCharFour:
            -> fifth_char_main_storylets.four
                
        - grimoire_fifthChar hasnt grimFifthCharFive:
            -> fifth_char_main_storylets.five
    
        - grimoire_fifthChar hasnt grimFifthCharSix:
            -> fifth_char_main_storylets.six
            
        - else:
            -> fifth_character_opinions
    }



=== fifth_char_egg_management
//Gestione degli stati dell'uovo
//La logica è: se non ci interagisco si apre, se ci interagisco si chiude. Non ci sono variazioni causate fuori dagli eventi nella serra.
//Sappiamo che, come per le piante nella serra, andremo a utilizzare delle costanti per definire gli stati
//usare un interact counter
//Quando si apre uovo, setto fifthChar_recovery su fifthChar_recoveryMaxValue
//Gli stati saranno: uovo integro, uovo spezzato, uovo spezzato e uscita tentacolo primo step, uovo spezzato e tentacolo ritratto, uovo spezzato e tentacolo secondo step
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)

    {fifthChar_growthMonsterEgg:
        - eggZero:
            {
            //Se toccata, abbiamo delle reazioni dall'uovo.
            - fifthChar_eggTouched == true:
                {charTag(FifthCharacter, "egg")}: ...

            //Se non toccata e non ci sono piante in crescita, il commento è della strega.
            - fifthChar_eggTouched == false && greenhouse_chosenCultivable == ():
                {shuffle:
                    - {charTag(TheWitch, "{witch_state()}")}:  <i>Un uovo in attesa di sé.</i>
                    - {charTag(TheWitch, "{witch_state()}")}:  <i>Guscio come tana, uno spazio privato.</i>
                    - {charTag(TheWitch, "{witch_state()}")}:  <i>Qualcuno si rifugia in sé, in cerca di pace.</i>
                }

            }


        - eggOne:
            {
            //Se toccata, abbiamo delle reazioni dall'uovo, e si abbassa il suo valore fifthChar_growthMonsterEgg
            - fifthChar_eggTouched == true:
                ~  fifthChar_growthMonsterEgg = eggZero
                {shuffle:
                    - {charTag(FifthCharacter, "egg")}: ...
                    - {charTag(FifthCharacter, "egg")}: !!!
                }

            //Se non toccata e non ci sono piante in crescita, il commento è della strega.
            - fifthChar_eggTouched == false && greenhouse_chosenCultivable == ():
                {shuffle:
                    - {charTag(TheWitch, "{witch_state()}")}:  <i>Crepe sul guscio, sguardi verso l'esterno.</i>
                    - {charTag(TheWitch, "{witch_state()}")}:  <i>Fessure sulla tana, atti di fiducia.</i>
                    - {charTag(TheWitch, "{witch_state()}")}:  <i>Primo sguardo sul mondo, ma l'uovo è ancora fragile.</i>
                }
            }
            
        - eggTwo:
            {
            //Se toccata, abbiamo delle reazioni dall'uovo, e si abbassa il suo valore fifthChar_growthMonsterEgg
            - fifthChar_eggTouched == true:
                ~  fifthChar_growthMonsterEgg = eggOne
                {shuffle:
                    - {charTag(FifthCharacter, "egg")}: ...
                    - {charTag(FifthCharacter, "egg")}: !!!
                    - {charTag(FifthCharacter, "egg")}: ???
                }
                
            //Se non toccata e non ci sono piante in crescita, il commento è della strega.
            - fifthChar_eggTouched == false && greenhouse_chosenCultivable == ():
                {shuffle:
                    - {charTag(TheWitch, "{witch_state()}")}:  <i>Il nuovo saggia il mondo, ancora timoroso.</i>
                    - {charTag(TheWitch, "{witch_state()}")}:  <i>Un tentacolo in avanti, un corpo ancora protetto.</i>
                    - {charTag(TheWitch, "{witch_state()}")}:  <i>La curiosità fresca va protetta, non forzata.</i>
                }
            }
        
        - eggThree:
            {
            //Se toccata, abbiamo delle reazioni dall'uovo, e si abbassa il suo valore fifthChar_growthMonsterEgg
            - fifthChar_eggTouched == true:
                ~  fifthChar_growthMonsterEgg = eggTwo
                {shuffle:
                    - {charTag(FifthCharacter, "egg")}: ...
                    - {charTag(FifthCharacter, "egg")}: !!!
                    - {charTag(FifthCharacter, "egg")}: ???
                    - {charTag(FifthCharacter, "egg")}: ?!?
                }
                
            //Se non toccata e non ci sono piante in crescita, il commento è della strega.
            - fifthChar_eggTouched == false && greenhouse_chosenCultivable == ():
                {shuffle:
                    - {charTag(TheWitch, "{witch_state()}")}:  <i>Troppa foga spezza i ponti.</i>
                    - {charTag(TheWitch, "{witch_state()}")}:  <i>La pazienza è pianta fragile da coltivare.</i>
                    - {charTag(TheWitch, "{witch_state()}")}:  <i>Un ritirarsi che chiede fiducia.</i>
                }
            }
            
        - eggFour:
            {
            //Se toccata, abbiamo delle reazioni dall'uovo, e si abbassa il suo valore fifthChar_growthMonsterEgg
            - fifthChar_eggTouched == true:
                ~  fifthChar_growthMonsterEgg = eggThree
                {shuffle:
                    - {charTag(FifthCharacter, "egg")}: ...
                    - {charTag(FifthCharacter, "egg")}: !!!
                    - {charTag(FifthCharacter, "egg")}: ???
                    - {charTag(FifthCharacter, "egg")}: ?!?
                    - {charTag(FifthCharacter, "egg")}: No!
                }
                
            //Se non toccata e non ci sono piante in crescita, il commento è della strega.
            - fifthChar_eggTouched == false && greenhouse_chosenCultivable == ():
                {shuffle:
                    - {charTag(TheWitch, "{witch_state()}")}:  <i>L'aria è colma delle possibilità di un nuovo incontro.</i>
                    - {charTag(TheWitch, "{witch_state()}")}:  <i>Un respiro, una attimo, una fiducia per far sì che il guscio si spezzi.</i>
                    - {charTag(TheWitch, "{witch_state()}")}:  <i>Cosa rimarrà dell'uovo? Ce lo dirà l'attesa.</i>
                }
            }
            
    }


->->




=== fifth_char_first_steps
//Qui ci finiscono le cose che ci dice appena è uscita dall'uovo.
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)

    {fifthChar_recovery:

        - 8:
            {charTag(FirstCharacter, "scared")}:           {Chissà come sarà messa la casa. Povera Luba, la Generalessa starà sicuramente scaricando su di lei la frustrazione per la mia scomparsa.|Ho bisogno di spazio, {player_name}.}

        - 7:
            {charTag(FirstCharacter, "scared")}:           {Immagino che Doris stia gongolando. Ce la vedo a dire ad Elia:"Visto? Tua madre non è capace di reggere nemmeno una festa, mentre io, mentre io!". Oh, non dovrei pensare a queste cose.|Scusami {player_name}, non ancora.}
            
        - 6:
            {charTag(FirstCharacter, "down")}:              {Riccardo, come se la starà passando? Immagino avrà mobilitato tutti i suoi contatti per trovarmi. E io che sono qui, a sperare che non accada. Povero.|Perdonami {player_name}, ho bisogno di tranquillità ora.}
        
        - 5:
            {charTag(FirstCharacter, "down")}:              {Don Pietro avrà deciso che sono davvero pazza, come quella volta durante la confessione.|{player_name}, lascia questa vecchia alle sue riflessioni.}
            
        - 4:
            {charTag(FirstCharacter, "quiet")}:             {Sara. Sara apprezzerebbe questi fiori. Sono così fisici, carnali. Passarebbe il tempo a sfiorarli, premerli, baciarli. |Ehi {player_name}, torneresti tra un po'?}
        
        - 3:
            {charTag(FirstCharacter, "quiet")}:             {A volte mi dimentico di quanto mi faccia sentire viva maneggiare le piante, i fiori. Sono i giorni peggiori, quelli in cui mi spengo.|{player_name}, vorrei rimestare ancora un po' tra queste piante in solitudine.}
    
        - 2:
            {charTag(FirstCharacter, "silly")}:             {Le nubi fuori dai vetri, la luce dorata. Ci fosse il lago, penserei di esser tornata d'estate con Sara, Pietro e Riccardo. Quante rughe in meno, e quante follie.|Questo cuore è un po' più solido, {player_name}, ma ho bisogno di ancora un po' di tranquillità.}
        
        - 1:
            {charTag(FirstCharacter, "silly")}:             {Non ricoravo più cosa fosse il silenzio, le sue libertà.|{player_name}, godiamoci ancora un attimo questa pace.}
        
        
    }



->->


