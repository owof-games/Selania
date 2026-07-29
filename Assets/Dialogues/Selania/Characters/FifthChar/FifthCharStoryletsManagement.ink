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

    {fifthChar_growthMonsterEgg:
        - eggZero:
            {
            //Se toccata, abbiamo delle reazioni dall'uovo.
            - fifthChar_eggTouched == true:
                {shuffle:
                    - {charTag(FifthCharacter, "egg")}: xxx
                    - {charTag(FifthCharacter, "egg")}: YYY
                    - {charTag(FifthCharacter, "egg")}: ZZZ
                }
            //Se non toccata e non ci sono piante in crescita, il commento è della strega.
            - fifthChar_eggTouched == false && greenhouse_chosenCultivable == ():
                {shuffle:
                    - {charTag(TheWitch, "{witch_state()}")}:  XXX
                    - {charTag(TheWitch, "{witch_state()}")}:  YYY
                    - {charTag(TheWitch, "{witch_state()}")}:  ZZZ
                }

            }


        - eggOne:
            {
            //Se toccata, abbiamo delle reazioni dall'uovo, e si abbassa il suo valore fifthChar_growthMonsterEgg
            - fifthChar_eggTouched == true:
                ~  fifthChar_fromEggToMonster = eggZero
                {shuffle:
                    - {charTag(FifthCharacter, "egg")}: xxx
                    - {charTag(FifthCharacter, "egg")}: YYY
                    - {charTag(FifthCharacter, "egg")}: ZZZ
                }

            //Se non toccata e non ci sono piante in crescita, il commento è della strega.
            - fifthChar_eggTouched == false && greenhouse_chosenCultivable == ():
                {shuffle:
                    - {charTag(TheWitch, "{witch_state()}")}:  XXX
                    - {charTag(TheWitch, "{witch_state()}")}:  YYY
                    - {charTag(TheWitch, "{witch_state()}")}:  ZZZ
                }
            }
            
        - eggTwo:
            {
            //Se toccata, abbiamo delle reazioni dall'uovo, e si abbassa il suo valore fifthChar_growthMonsterEgg
            - fifthChar_eggTouched == true:
                ~  fifthChar_fromEggToMonster = eggOne
                {shuffle:
                    - {charTag(FifthCharacter, "egg")}: xxx
                    - {charTag(FifthCharacter, "egg")}: YYY
                    - {charTag(FifthCharacter, "egg")}: ZZZ
                }
                
            //Se non toccata e non ci sono piante in crescita, il commento è della strega.
            - fifthChar_eggTouched == false && greenhouse_chosenCultivable == ():
                {shuffle:
                    - {charTag(TheWitch, "{witch_state()}")}:  XXX
                    - {charTag(TheWitch, "{witch_state()}")}:  YYY
                    - {charTag(TheWitch, "{witch_state()}")}:  ZZZ
                }
            }
        
        - eggThree:
            {
            //Se toccata, abbiamo delle reazioni dall'uovo, e si abbassa il suo valore fifthChar_growthMonsterEgg
            - fifthChar_eggTouched == true:
                ~  fifthChar_fromEggToMonster = eggTwo
                {shuffle:
                    - {charTag(FifthCharacter, "egg")}: xxx
                    - {charTag(FifthCharacter, "egg")}: YYY
                    - {charTag(FifthCharacter, "egg")}: ZZZ
                }
                
            //Se non toccata e non ci sono piante in crescita, il commento è della strega.
            - fifthChar_eggTouched == false && greenhouse_chosenCultivable == ():
                {shuffle:
                    - {charTag(TheWitch, "{witch_state()}")}:  XXX
                    - {charTag(TheWitch, "{witch_state()}")}:  YYY
                    - {charTag(TheWitch, "{witch_state()}")}:  ZZZ
                }
            }
            
        - eggFour:
            {
            //Se toccata, abbiamo delle reazioni dall'uovo, e si abbassa il suo valore fifthChar_growthMonsterEgg
            - fifthChar_eggTouched == true:
                ~  fifthChar_fromEggToMonster = eggThree
                {shuffle:
                    - {charTag(FifthCharacter, "egg")}: xxx
                    - {charTag(FifthCharacter, "egg")}: YYY
                    - {charTag(FifthCharacter, "egg")}: ZZZ
                }
                
            //Se non toccata e non ci sono piante in crescita, il commento è della strega.
            - fifthChar_eggTouched == false && greenhouse_chosenCultivable == ():
                {shuffle:
                    - {charTag(TheWitch, "{witch_state()}")}:  XXX
                    - {charTag(TheWitch, "{witch_state()}")}:  YYY
                    - {charTag(TheWitch, "{witch_state()}")}:  ZZZ
                }
            }
            
    }


->->




=== fifth_char_first_steps
//Qui ci finiscono le cose che ci dice appena è uscita dall'uovo.
    {fifthChar_recovery:

        - 8:
            {charTag(FirstCharacter, "scared")}:           {Voglio preparare il piatto preferito di mio padre.|Scusami {player_name}, ma sto cucinando.}

        - 7:
            {charTag(FirstCharacter, "scared")}:           {Voglio preparare il piatto preferito di mio padre.|Scusami {player_name}, ma sto cucinando.}
            
        - 6:
            {charTag(FirstCharacter, "down")}:           {Potrei sostituire l'aneto con, uh, no, non una buona idea.|Perdonami {player_name}, ma sto cercando qualcosa che non mi avveleni.}
        
        - 5:
            {charTag(FirstCharacter, "down")}:           {Ricordati ragazza che cucinare non è una scusa per bere. Ma che gioia aver trovato del vinello. |Torna dopo {player_name}, devo, ehm, riflettere.}
            
        - 4:
            {charTag(FirstCharacter, "quiet")}:           {Quante possibilità ci sono che se caccio la mano nell'alveare della serra riesco a recuperare del miele?|{player_name}, ho un'idea stupida, torna dopo.}
        
        - 3:
            {charTag(FirstCharacter, "quiet")}:           {Uh, questo sughino spacca. Mamma ne sarebbe orgogliosa.|{player_name}, ho bisogno di concentrazione, a dopo.}
    
        - 2:
            {charTag(FirstCharacter, "silly")}:           {Sarà una buona idea avere tutti questi coltelli accessibili con il bimbo in giro in giro? Merda, stavo per tagliarmi. Forse sono io il problema, non lui.|{player_name}, faccio danni già da sola, torna tra un po'.}
        
        - 1:
            {charTag(FirstCharacter, "silly")}:           {Tocco finale, la crema di funghi. E ora lasciamo cuocere un po'. E ci beviamo un altro goccino.|{player_name}, resisti che ho quasi finito!}
        
        
    }



->->


