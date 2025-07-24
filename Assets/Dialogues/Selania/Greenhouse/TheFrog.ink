VAR maxValueDice = 3
VAR randomDice = 3
VAR diceFrog = 0
LIST quests = mindQuest, fungusTalk
VAR questActive = ()

=== new_frog ===
 -> check_quest-> helping_frog
 
    

=== helping_frog
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameThree = translator(thirdCharacterState)
    ~ temp charNameFour = translator(fourthCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)

- (top)
Hai bisogno di una mano?
    
    + {firstStory == Active}{charNameOne}
        * * {firstStory == Active && !first_story_gift.ink_outcome} Dono
            -> first_gift_frog_advice
        * * Dialogo
            -> first_dialogue_frog_advice
        + + ->
            Non ho molto da dirti su {charNameOne}
            ->->
    
    + {secondStory == Active} {charNameTwo}
        * * {secondStory == Active && !second_story_gift.ink_outcome}Dono
            -> second_gift_frog_advice
        * * Dialogo
            -> second_dialogue_frog_advice
        + + ->
            Non ho molto da dirti su {charNameTwo}
            ->->
            
    + {thirdStory == Active} {charNameThree}
        * * {thirdStory == Active && !third_story_gift.ink_outcome}Dono
            -> third_gift_frog_advice
        * * Dialogo
            -> third_dialogue_frog_advice
        + + ->
            Non ho molto da dirti su {charNameThree}
            ->->
            
    + {fourthStory == Active} {charNameFour}
        * * {fourthStory == Active && !fourth_story_gift.ink_outcome}Dono
            -> fourth_gift_frog_advice
        * * Dialogo
            -> fourth_dialogue_frog_advice 
        + + ->
            Non ho molto da dirti su {charNameFour}
            ->->
            
    + {fifthStory == Active} {charNameFive}
        * * {fifthStory == Active && !fifth_story_gift.ink_outcome}Dono
            -> first_gift_frog_advice
        * * Dialogo
            -> first_dialogue_frog_advice
        + + ->
            Non ho molto da dirti su {charNameFive}
            ->->            
    -



-> main




=== check_quest ===
{

    - questActive != ():
        -> quest_remind
        
    - else:
        -> random_quest

}

=== random_quest ===

~ diceFrog = RANDOM(1,maxValueDice)


{

    - diceFrog < randomDice:
        ~ randomDice --
        ->->
    - else:
        ~ randomDice = maxValueDice
        -> frog_quests

}

->-> 

//Dritte della rana

=== first_dialogue_frog_advice

    -> main


=== first_gift_frog_advice

    -> main


=== second_dialogue_frog_advice

    -> main


=== second_gift_frog_advice

    -> main


=== third_dialogue_frog_advice

    -> main


=== third_gift_frog_advice

    -> main


=== fourth_dialogue_frog_advice

    -> main


=== fourth_gift_frog_advice

    -> main


=== fifth_dialogue_frog_advice

    -> main


=== fifth_gift_frog_advice

    -> main


//Quest della rana

=== frog_quests
{
    
    - !mindfulness:
        ~ questActive = ()
        ~ questActive += mindQuest
            -> mind_quest
            
    - not talking_fungus.first_story_ended_check && firstStory == Ended:
        ~ questActive = ()
        ~ questActive += fungusTalk
            -> fungus_talk_quest
}




->-> 



=== quest_remind
{
    - mindQuest:
        {
        
            - !mindfulness: Vai a parlare con mentore!
            - else: 
                Hai fatto il tuo dovere, puoi farmi una domanda.
                    -> helping_frog
        }
    
    - else: error, non trovata quest attiva.
        ->->
}

->->




=== mind_quest


-> main


=== fungus_talk_quest

-> main