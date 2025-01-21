=== personaggia_uno ===
~ temp charNameUno = traduttorePersonaggeMaiuscolo(effettivoStatoPersonaggiaUno)
//SPAZIO PER VERIFICARE SE STORIA IN CORSO O CONCLUSA
        //Chiacchiera normale
        + {are_two_entities_together(FirstCharacter, PG) && storiaUno == InCorso}[FirstCharacter]
            -> dialogo_personaggia_uno
        
        //Chiacchiera a fine storia
        + {are_two_entities_together(FirstCharacter, PG) && storiaUno == Conclusa} [FirstCharacter]
            -> personaggia_uno_storia_conclusa
        + ->
    
        -> DONE
    
=== dialogo_personaggia_uno
~ temp charNameUno = traduttorePersonaggeMaiuscolo(effettivoStatoPersonaggiaUno)
{charNameUno}: {~ Ero sicuro di aver visto una farfalla.|Non male questo posto, anche se casa mi manca.|Non son sicuro di star capendo tutto di questo luogo.}
- (top)
    + Dialogo
        -> top
    + Dialogo
        -> top
    + Lasci il dialogo
        -> main
    //Se non ho ancora fatto il dono e NON ho parlato col mentore
    + {not dono_storia_uno.esito_inchiostro && not dono_e_inchiostro} Dono
        {charNameUno}: Sai, è gentile da parte tua, davvero.
        {charNameUno}: Ma credo che tu non abbia ancora chiesto al mentore come queste cose funzionino.
        {charNameUno}: Forse conviene che prima parli con lui.
            -> main
        
    //Se non ho ancora fatto il dono e ho parlato con il mentore
       + {not dono_storia_uno.esito_inchiostro && dono_e_inchiostro} Dono
             ~ currentReceiver += FirstCharacter
            -> dono_storia_uno
    
    //QUESTA OPZIONE C'è SOLO DOPO CHE HO FATTO IL DONO E NON HO ANCORA AVVIATO LA MAIN STORY
    + {dono_storia_uno.esito_inchiostro && not main_story_personaggia_uno} Ti va di affrontare quella cosa?
        {
            - not domande_e_obiettivo:
            {traduttorePersonaggeMaiuscolo(effettivoStatoPersonaggiaUno)}: Ti chiedo un ultimo sforzo, parla direttamente col mentore prima. Io non scappo.
                -> main
            - domande_e_obiettivo:
                {traduttorePersonaggeMaiuscolo(effettivoStatoPersonaggiaUno)}: Certo!
                -> storia_uno_chech_trigger
        }        
    
    //SE ESCO DALLA MAIN STORY E VOGLIO TORNARCI CLICCO QUI. POI Lì DENTRO IN BASE AGLI STEP IN CUI SIAMO, MI MANDERà AL POSTO GIUSTO            
    + {dono_storia_uno.esito_inchiostro && main_story_personaggia_uno} Riprendiamo quella storia?     -> main_story_personaggia_uno

    -
    -> top


 === dono_storia_uno ===
 ~ temp charNameUno = traduttorePersonaggeMaiuscolo(effettivoStatoPersonaggiaUno)
 
        + {doniTrovati != ()} Offro un dono. 
            -> gestione_inventario -> esito_inchiostro 
        + {doniTrovati == ()} <i> Il tuo inventario è vuoto </i>
            ->main
        
    
        = esito_inchiostro    
            Dopo il tuo dono, la quantità di inchiostro a disposizione è {statoInchiostroPersonaggiaDue}.
                 -> azioniInchiostro -> dialogo_personaggia_uno.top
            //queste opzioni poi non saranno scelte dirette, ma risultati delle scelte fatte durante il gioco

    === storia_uno_chech_trigger
    ~ temp charNameUno = traduttorePersonaggeMaiuscolo(effettivoStatoPersonaggiaUno)
    
        {
        - solitudine == false:
            -> trigger_solitudine
        - else:
            -> main_story_personaggia_uno
    
        }
        
        = trigger_solitudine
        Info
            * [Voglio comunque approfondire la storia di questa personaggia.]
                -> main_story_personaggia_uno
            * [Salto.]
            //FUTURA SOLUZIONE A QUESTA SITUAZIONE
                -> main
        -
        -> END

=== main_story_personaggia_uno
~ temp charNameUno = traduttorePersonaggeMaiuscolo(effettivoStatoPersonaggiaUno)
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
        ~ storiaUno = Conclusa
        //Resetto il counter degli spostamenti. In questo modo da qui posso iniziare a tener traccia dello spostamento della personaggia. Alcune potrebbero anche salutarci e bona.
        ~ movementsCounter = 0
-> main
        


=== personaggia_uno_storia_conclusa
~ temp charNameUno = traduttorePersonaggeMaiuscolo(effettivoStatoPersonaggiaUno)
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
        ~ move_entity(FirstPersonNotes, BusStop)
    -> main
















