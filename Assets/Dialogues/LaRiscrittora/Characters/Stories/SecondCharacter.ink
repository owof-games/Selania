=== personaggia_due ===
~ temp charNameDue = traduttorePersonaggeMaiuscolo(secondCharacterState)

//SPAZIO PER VERIFICARE SE STORIA IN CORSO O CONCLUSA
        //Chiacchiera normale
        + {are_two_entities_together(SecondCharacter, PG) && secondStory == Active}[SecondCharacter]
            -> dialogo_personaggia_due
        
        //Chiacchiera a fine storia
        + {are_two_entities_together(SecondCharacter, PG) && secondStory == Ended} [SecondCharacter]
            -> personaggia_due_storia_conclusa
        + ->
    
        -> DONE
    

=== dialogo_personaggia_due ===
~ temp charNameDue = traduttorePersonaggeMaiuscolo(secondCharacterState)

//QUI FINISCONO TUTTE LE POSSIBILI CONVERSAZIONI
- (top)
    + Dialogo
        -> top
    + Dialogo
        -> top
    + Lasci il dialogo
        -> main
    //Faccio così per questione di ordine
       + {not dono_storia_due.esito_inchiostro} Dono
        ~ currentReceiver += SecondCharacter
        -> dono_storia_due
    
    //QUESTA OPZIONE C'è SOLO DOPO CHE HO FATTO IL DONO E NON HO ANCORA AVVIATO LA MAIN STORY
    + {dono_storia_due.esito_inchiostro && not main_story_personaggia_due} Ti va di affrontare quella cosa?
            -> storia_due_chech_trigger
    
    //SE ESCO DALLA MAIN STORY E VOGLIO TORNARCI CLICCO QUI. POI Lì DENTRO IN BASE AGLI STEP IN CUI SIAMO, MI MANDERà AL POSTO GIUSTO            
    + {dono_storia_due.esito_inchiostro && main_story_personaggia_due} Riprendiamo quella storia?     -> main_story_personaggia_due

    -
    -> top


    //QUESTO è LO SPAZIO PER IL DONO
    === dono_storia_due ===
    ~ temp charNameDue = traduttorePersonaggeMaiuscolo(secondCharacterState)

        + {doniTrovati != ()} Offro un dono.
            -> gestione_inventario -> esito_inchiostro 
        + {doniTrovati == ()} <i> Il tuo inventario è vuoto </i>
            ->main
        
    
        = esito_inchiostro    
            Dopo il tuo dono, la quantità di inchiostro a disposizione è {statoInchiostroPersonaggiaDue}.
                 -> azioniInchiostro -> dialogo_personaggia_due.top
            //queste opzioni poi non saranno scelte dirette, ma risultati delle scelte fatte durante il gioco

    === storia_due_chech_trigger
    ~ temp charNameDue = traduttorePersonaggeMaiuscolo(secondCharacterState)

        {
        - loneliness == false:
            -> trigger_solitudine
            - else:
            -> main_story_personaggia_due        
    
        }
        
        = trigger_solitudine
        Info
            * [Voglio comunque approfondire la storia di questa personaggia.]
                -> main_story_personaggia_due
            * [Salto.]
            //FUTURA SOLUZIONE A QUESTA SITUAZIONE
                -> main
        -
        -> END

=== main_story_personaggia_due
~ temp charNameDue = traduttorePersonaggeMaiuscolo(secondCharacterState)

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
Storia finita:
        ~ secondStory = Ended
        //Resetto il counter degli spostamenti. In questo modo da qui posso iniziare a tener traccia dello spostamento della personaggia. Alcune potrebbero anche salutarci e bona.
        ~ movementsCounter = 0
-> main
        


=== personaggia_due_storia_conclusa
~ temp charNameDue = traduttorePersonaggeMaiuscolo(secondCharacterState)

//Con questa formula dopo un tot di scambi la personaggia se ne va salutandoci.
//In alcune situazioni questa cosa non c'è, in altre c'è solo se ho determinati status (es: socievole). In altri non c'è la possibilità che la personaggia se ne vada senza averci salutate (e quindi non c'è l'opzione in story_start)
~ temp dialogue = 0
{
    - dialogue < 10:
        -> top
    - else:
        -> goodbye
}

    - (top)
        + opzione
            ~ dialogue ++
                -> top
        + opzione
            ~ dialogue ++
                -> top
        + opzione
            ~ dialogue ++
                -> top
        + esci dalla conversazione
            -> main
        -
    -> main
    
    = goodbye
    Ciao ciao
        ~ move_entity(SecondCharacter, Safekeeping)
        ~ move_entity(SecondCharacterNotes, BusStop)
    -> main
    
