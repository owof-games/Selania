=== personaggia_uno ===
~ temp charNameUno = uppercaseTranslator(firstCharacterState)
//SPAZIO PER VERIFICARE SE STORIA IN CORSO O CONCLUSA
        //Chiacchiera normale
        + {are_two_entities_together(FirstCharacter, PG) && firstStory == Active}[FirstCharacter]
            -> talk_with_first_character
        
        //Chiacchiera a fine storia
        + {are_two_entities_together(FirstCharacter, PG) && firstStory == Ended} [FirstCharacter]
            -> personaggia_uno_storia_conclusa
        + ->
    
        -> DONE



=== talk_with_first_character
~ temp charNameUno = uppercaseTranslator(firstCharacterState)
TODO: inserire opzione per cui dopo tot chiacchiere ti dice di tornare tra un po'
{charNameUno}: {~ Ero sicuro di aver visto una farfalla.|Non male questo posto, anche se casa mi manca.|Non son sicuro di star capendo tutto di questo luogo.}

    + [Ti va di parlare?]
        -> knowing_first_character
    + [Che ne pensi di...]
        -> first_character_opinions
    //Se non ho ancora fatto il dono e NON ho parlato col mentore e ho parlato abbastanza con lei
    + {firstStoryQuestCount > minStoryQuesTCount && not first_story_gift.ink_outcome && not gifts_and_ink && findedGifts != ()} [Ho trovato questa cosa e vorrei donartela.]
            {charNameUno}: Sai, è gentile da parte tua, davvero.
            {charNameUno}: Ma credo che tu non abbia ancora chiesto al mentore come queste cose funzionino.
            {charNameUno}: Forse conviene che prima parli con lui.
                -> main
        
    //Se non ho ancora fatto il dono e ho parlato con il mentore e ho parlato abbastanza con lei
    + {firstStoryQuestCount > minStoryQuesTCount && not first_story_gift.ink_outcome && gifts_and_ink && findedGifts != ()} [Ti vorrei donare questa cosa.]
             ~ currentReceiver += FirstCharacter
            -> first_story_gift
    
    //QUESTA OPZIONE C'è SOLO DOPO CHE HO FATTO IL DONO E NON HO ANCORA AVVIATO LA MAIN STORY
    + {first_story_gift.ink_outcome && not main_story_first_character} [Credo tu abbia un problema, e potrei aiutarti ad affrontarlo.]
        {
            - not questions:
            {uppercaseTranslator(firstCharacterState)}: Ti chiedo un ultimo sforzo, parla direttamente col mentore prima. Io non scappo.
                -> main
            - questions:
                {uppercaseTranslator(firstCharacterState)}: Certo!
                -> first_story_chech_trigger
        }        

    //SE ESCO DALLA MAIN STORY E VOGLIO TORNARCI CLICCO QUI. POI Lì DENTRO IN BASE AGLI STEP IN CUI SIAMO, MI MANDERà AL POSTO GIUSTO            
    + {first_story_gift.ink_outcome && main_story_first_character} [Riprendiamo quella storia?]
        -> main_story_first_character
    
    + Lasci il dialogo
        -> main
    -
    -> talk_with_first_character
    
=== knowing_first_character
//Qui man mano faccio avanzare i temi toccati dalla personaggia
    {
        - not one:
            -> one
        - not two:
            -> two
        - not three:
            -> three
        - not four:
            -> four
        - not five:
            -> five
        - not six:
            -> six
        - not seven:
            -> seven
        - else:
            -> other
    }

    = one
    ~ firstStoryQuestCount ++
    Discorso uno
        + [Opzione che aumenta il blu]
            ~ firstBlue ++
        + [Opzione che aumenta il giallo]
            ~ firstYellow ++
        + [Opzione che aumenta il rosso]
            ~ firstRed ++
        + [Opzione che aumenta il verde]
            ~ firstGreen ++
        + [Opzione che aumenta il viola]
            ~ firstPurple ++
        -
        
        -> talk_with_first_character
        
    = two
    ~ firstStoryQuestCount ++
    Discorso due
        + [Opzione che aumenta il blu]
            ~ firstBlue ++
        + [Opzione che aumenta il giallo]
            ~ firstYellow ++
        + [Opzione che aumenta il rosso]
            ~ firstRed ++
        + [Opzione che aumenta il verde]
            ~ firstGreen ++
        + [Opzione che aumenta il viola]
            ~ firstPurple ++
        -
        -> talk_with_first_character
        
    = three
    ~ firstStoryQuestCount ++
    Discorso tre
        + [Opzione che aumenta il blu]
            ~ firstBlue ++
        + [Opzione che aumenta il giallo]
            ~ firstYellow ++
        + [Opzione che aumenta il rosso]
            ~ firstRed ++
        + [Opzione che aumenta il verde]
            ~ firstGreen ++
        + [Opzione che aumenta il viola]
            ~ firstPurple ++
        -    
        -> talk_with_first_character
        
    = four
    ~ firstStoryQuestCount ++
        + [Opzione che aumenta il blu]
            ~ firstBlue ++
        + [Opzione che aumenta il giallo]
            ~ firstYellow ++
        + [Opzione che aumenta il rosso]
            ~ firstRed ++
        + [Opzione che aumenta il verde]
            ~ firstGreen ++
        + [Opzione che aumenta il viola]
            ~ firstPurple ++
        -    
    
    
        -> talk_with_first_character
        
    = five
    ~ firstStoryQuestCount ++
        + [Opzione che aumenta il blu]
            ~ firstBlue ++
        + [Opzione che aumenta il giallo]
            ~ firstYellow ++
        + [Opzione che aumenta il rosso]
            ~ firstRed ++
        + [Opzione che aumenta il verde]
            ~ firstGreen ++
        + [Opzione che aumenta il viola]
            ~ firstPurple ++
        -    
    
        -> talk_with_first_character
    
    = six
    ~ firstStoryQuestCount ++
        + [Opzione che aumenta il blu]
            ~ firstBlue ++
        + [Opzione che aumenta il giallo]
            ~ firstYellow ++
        + [Opzione che aumenta il rosso]
            ~ firstRed ++
        + [Opzione che aumenta il verde]
            ~ firstGreen ++
        + [Opzione che aumenta il viola]
            ~ firstPurple ++
        -    
    
        -> talk_with_first_character
    
    = seven
    ~ firstStoryQuestCount ++
        + [Opzione che aumenta il blu]
            ~ firstBlue ++
        + [Opzione che aumenta il giallo]
            ~ firstYellow ++
        + [Opzione che aumenta il rosso]
            ~ firstRed ++
        + [Opzione che aumenta il verde]
            ~ firstGreen ++
        + [Opzione che aumenta il viola]
            ~ firstPurple ++
        -    

        -> talk_with_first_character

    = other
    
    
        -> talk_with_first_character
        
=== first_character_opinions
    ~ firstStoryQuestCount ++
    //Le sue opinioni comunque ci fanno capire meglio il modo in cui vede il mondo e parte della sua vita fuori da qui.
    {Credo che il mentore...|La serra...|La fermata...|Ho visto delle api...}

    -> talk_with_first_character


 === first_story_gift ===
 ~ temp charNameUno = uppercaseTranslator(firstCharacterState)
 
        + {findedGifts != ()} Offro un dono. 
            -> gestione_inventario -> ink_outcome 
        + {findedGifts == ()} <i> Il tuo inventario è vuoto </i>
            ->main
        
    
        = ink_outcome    
            Dopo il tuo dono {inkTranslator(firstCharacterInkLevel)}.
                 -> inkActions -> talk_with_first_character
            //queste opzioni poi non saranno scelte dirette, ma risultati delle scelte fatte durante il gioco

    === first_story_chech_trigger
    ~ temp charNameUno = uppercaseTranslator(firstCharacterState)
    
        {
        - loneliness == false:
            -> loneliness_trigger
        - else:
            -> main_story_first_character
    
        }
        
        = loneliness_trigger
        Info
            * [Voglio comunque approfondire la storia di questa personaggia.]
                -> main_story_first_character
            * [Salto.]
            //FUTURA SOLUZIONE A QUESTA SITUAZIONE
                -> main
        -
        -> END

=== main_story_first_character
~ temp charNameUno = uppercaseTranslator(firstCharacterState)
    {charNameUno}: Dice qualcosa.
        -> firstAffinityCalc ->
        {firstPurple && firstYellow > firstBlue: {charNameUno}: Commento positivissimo.}
        {firstPurple or firstYellow > firstBlue:{charNameUno}: Commento medio.}
        {firstPurple &&  firstYellow < firstBlue: {charNameUno}: Commento meh.}
        {not (firstPurple && firstYellow > firstBlue) && not (firstPurple or firstYellow > firstBlue) && not (firstPurple &&  firstYellow < firstBlue): {charNameUno}: Commento base.}
    Abbiamo lo stato dell'inchiostro complessivo
        -> inkActions -> statement

    = statement
        Qui dichiaro sostanzialmente su cosa voglio concentrarmi.
        Non porta un'effettiva variazione di qualcosa, è utile solo per la giocatrice per capire su quali direzioni può andare.
        O forse è qualcosa che dichiara la personaggia.
        -> one
    
    = one
        Qui abbiamo la prima affermazione vera e propria, che spingerà verso uno degli stati possibili. è l'unica che c'è a prescindere dal livello di inchiostro.
            + Esploro un tema
                Ottengo risposte
                 + + E magari faccio altre domande.
                 + + E altre ancora
                    Con altre risposte
            + O un altro
                E aumenta il suo valore
            + O un altro
                E aumenta il suo valore
            -
        {
        - firstCharacterInkLevel == Empty:
            -> ending
        - else: 
            -> two
        }        
        
    = two
        Secondo giro
        {
        - firstCharacterInkLevel == Low:
            -> ending
        - else: 
            -> three
        }
        
    = three
        Terzo giro
        {
        - firstCharacterInkLevel == Normal:
            -> ending
        - else: 
            -> four
        }
    
    = four
        Quarto e ultimo giro giro
        
        -> ending
    /* ---------------------------------

   Qui avrò una funzione che mi manda sugli step utili in base a dove ho abbandonato l'ultima conversazione. Es
   {
   - not step_uno:
        -> step_uno
   - not step_due:
        -> step_due
        etc
   }
    
    E quindi poi avrò.
    = step_uno
        Affronto la storia
    = step_due
        Interventi
        etc
 ----------------------------------*/
 = ending
    Qui a seconda di com'è andata prima la situazione, la personaggia può darsi un nuovo nome o mantenere lo stesso. E poi, se firstCharacterSpecialEvent == true, darci anche una info sulla mentore.
        ~ firstStory = Ended
        //Resetto il counter degli spostamenti. In questo modo da qui posso iniziare a tener traccia dello spostamento della personaggia. Alcune potrebbero anche salutarci e bona.
        ~ movementsCounter = 0
    -> main
        


=== personaggia_uno_storia_conclusa
~ temp charNameUno = uppercaseTranslator(firstCharacterState)
//Con questa formula dopo un tot di scambi la personaggia se ne va salutandoci.
//In alcune situazioni questa cosa non c'è, in altre c'è solo se ho determinati status (es: socievole). In altri non c'è la possibilità che la personaggia se ne vada senza averci salutate (e quindi non c'è l'opzione in story_start)

{
    - firstCharEndingDialogue < 10:
        -> top
    - else:
        -> goodbye
}

    - (top)
        + opzione
            ~ firstCharEndingDialogue ++
                -> personaggia_uno_storia_conclusa
        + opzione
            ~ firstCharEndingDialogue ++
                -> personaggia_uno_storia_conclusa
        + opzione
            ~ firstCharEndingDialogue ++
                -> personaggia_uno_storia_conclusa
        + esci dalla conversazione
            -> main
        -
    -> main
    
    = goodbye
    Ciao ciao
        ~ move_entity(FirstCharacter, Safekeeping)
        ~ move_entity(FirstCharacterNotes, BusStop)
    -> main
















