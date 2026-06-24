//Per mentore, fifthChar_storyStatus sarà la parte di riscrittura, mentorChar_storyStatus tutta la parte di interazione come Mentore
    VAR mentorChar_storyStatus = story_storyNotStarted

//Variabili per mettere in pausa la conversazione. Plausibilmente per mentore sarà molto alta all'inizio.
    VAR mentor_pauseTalking = 0
    VAR mentor_pauseDuration = 1

//Check per monitorare l'ultima volta che abbiamo parlato con Mentore.
    VAR mentor_lastTimeTalking = 0
    VAR mentor_MAX_lastTimeTalking = 10

//Questo è per il conteggio totale delle scelte prese con la PNG
    VAR mentor_totalChoices = 0        

//Variabili colore
    VAR mentor_aether = 0.00
    VAR mentor_earth = 0.00
    VAR mentor_air = 0.00
    VAR mentor_water = 0.00
    VAR mentor_fire = 0.00     


//VARIABILI NARRATIVE
    VAR mentor_riccioMentoreViciniColpo = false
    

//Funzione per farsi notare
=== talk_to_me ===
{debug: passo per talk_to_me. Il valore di mentor_lastTimeTalking è {mentor_lastTimeTalking}.}

{
- thirdChar_storyStatus == story_storyRemote:
    ->->

}

    
{   
    - mentor_lastTimeTalking < mentor_MAX_lastTimeTalking:
            ~ mentor_lastTimeTalking ++
        {debug: aumento il valore di mentor_lastTimeTalking, che ora è {mentor_lastTimeTalking}.}    
        ->->  

    - else:
    {
        - are_two_entities_together(Mentor, PG) && grimoire_fifthChar has grimMentorIntro:
        {
        - thirdChar_storyStatus != story_storyRemote:
            { 
                - (contentsTrainStop has DoggoFirstLetters or contentsTrainStop has DoggoSecondLetters) && (contentsTrainStop hasnt Mentor):
                    {stopping:
                        - {charTag(FifthCharacter, "hurry")}:             Ma hai visto {player_name} che c'è qualcunə che ti aspetta alla fermata del treno?
                        - {charTag(FifthCharacter, "hurry")}:             Mi sembra di aver sentito un rumore alla fermata prima.
                        - {charTag(FifthCharacter, "hurry")}:             Credo ci sia della posta per te alla fermata, {player_name}.
                        - {charTag(FifthCharacter, "hurry")}:             Sono sicura di aver sentito un abbaio alla stazione: tu sai già chi è, vero?
                        - {charTag(FifthCharacter, "hurry")}:             Credo sia arrivata una lettera per te, {player_name}. La trovi come sempre in stazione.
                    }
                        ~ mentor_lastTimeTalking = 0
                        ->->
                
                - else:
                    {shuffle:
                        - {charTag(FifthCharacter, "hurry")}:             Ehi {player_name}, spero vada tutto bene.
                        - {charTag(FifthCharacter, "hurry")}:             Ehi {player_name}, è da un po' che non parliamo.
                        - {charTag(FifthCharacter, "hurry")}:             {player_name}, se ti vanno due chiacchiere sono qui.
                        - {charTag(FifthCharacter, "hurry")}:             Ciao {player_name}, spero tu non ti stia affaticando troppo.
                    }
                        ~ mentor_lastTimeTalking = 0
                        ->->
            }
        
        //Frasi che dice se Boccale se ne è andato
        - else:
        {shuffle:
                        - {charTag(FifthCharacter, "bored")}:             Andarsene così, senza nemmeno farsi riscrivere, ma io dico.
                        - {charTag(FifthCharacter, "bored")}:             La mancanza di rispetto di quell'uomo. Che nervi.
                        - {charTag(FifthCharacter, "bored")}:             Tutti rispettiamo delle regole, e lui? Lui se ne va così, perché gli va.
                        - {charTag(FifthCharacter, "bored")}:             Arriva qui, ed è un <b>privilegio</b>! E lui invece ci abbandona tutt3. Quel maleducato.
                    }
        }    
                
        - else:
            {debug: Mentore e PG non sono assieme, per cui vado avanti.}
            ->->   
    }         

}


->->


=== mentor_closing_storylet ===
        //Questo evita che venga proposto un altro storylet fino a quando la pausa non è finita
        ~ mentor_pauseTalking = mentor_pauseDuration
        //Aggiorno il contatore ansiosetto
        ~ mentor_lastTimeTalking = 0

        //Aggiornamento storylets
        -> grimoire_storylets_updater ->

->->




=== function fifthChar_slurDetectorFunction ()
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)

{
    - not are_two_entities_together(Mentor, PG):
        ~ return
}


{fifthChar_slurDetector:

    - 0:
    {charTag(FifthCharacter, "neutral")}:       Sarebbe meglio evitare bestemmie e parolacce in questo luogo.
                                                Non è rispettoso verso persone che non conosci.
    {charTag(ThirdCharacter, "neutral")}:       Hai ragione zia.

    - 1:
    {charTag(FifthCharacter, "neutral")}:       {charNameThree}! 
                                                Controlla il tuo linguaggio per favore, non sai chi potrebbe sentirti, o ripetere quello che hai detto.
    {charTag(ThirdCharacter, "neutral")}:       Hai ragione, scusa.                                          

    - 2:
    {charTag(FifthCharacter, "sorry")}:         {charNameThree}! 
                                                Non voglio risultare pesante, ma non è un posto adatto alle parolacce.
    {charTag(ThirdCharacter, "neutral")}:       Giusto, me l'hai pure già detto.                                            

    - 3:
    {charTag(FifthCharacter, "sad")}:           Mi sembra di aver a che fare con un bambino.
                                                {charNameThree}, basta parolacce.
    {charTag(ThirdCharacter, "jester")}:        Ci sto provando, giuro!                                           

    - 4:
    {charTag(FifthCharacter, "bored")}:         Quella boccaccia!
    {charTag(FifthCharacter, "sad")}:           Scusa, ma mi danno sui nervi tantissimo {charNameThree}.
    {charTag(ThirdCharacter, "jester")}:        Non so che farci, mi emoziono e dico parolacce, è più forte di me!
    
    - 5:
    {charTag(FifthCharacter, "sad")}:           Mi arrendo.
                                                Mi arrendo.
                                                    ~ change_entity_place(FifthCharacter)

    - else:
        //Da qui in avanti Mentore se ne andrà.
        {charTag(FifthCharacter, "bored")}:             {~ Di nuovo!|Un'altra parolaccia.|Non sopporto più questo modo di fare.|Che mancanza di rispetto.}
                ~ change_entity_place(FifthCharacter)

}