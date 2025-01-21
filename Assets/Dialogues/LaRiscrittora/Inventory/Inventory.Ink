//con questa logica traccio chi è l'effettivo ricettore del dono, così da presentare la linea di dialogo corretta

VAR currentReceiver = ()

=== contenuti_inventario ===
+ [Inventory]
    {doniTrovati != (): -> inventarietto|->vuoto}

    =inventarietto
    <i>Hai con te {list_with_commas(doniTrovati)}.</i>
    -> main

    = vuoto
    <i>L'inventario è vuoto.</i>
    -> main


=== gestione_inventario ===
{debug: I doni trovati sono {doniTrovati}}
Dono...
+ {doniTrovati has MuschioDelleAmanti} [Del muschio delle amanti.]
    ~ doniTrovati -= MuschioDelleAmanti
    {
        - currentReceiver has FirstCharacter:
        <i>{traduttorePersonaggeMaiuscolo(effettivoStatoPersonaggiaUno)} è confuso dal dono.</i>
            ~ currentReceiver = ()
            -> dono_storia_uno.esito_inchiostro
        
        - currentReceiver has SecondCharacter:
            ~ statoInchiostroPersonaggiaDue ++
            ~ statoInchiostroPersonaggiaDue ++
            {traduttorePersonaggeMaiuscolo(effettivoStatoPersonaggiaDue)} ha apprezzato molto il tuo dono.
            ~ currentReceiver = ()
            -> dono_storia_due.esito_inchiostro
        
    
        - currentReceiver has ThirdCharacter:
            ~ statoInchiostroPersonaggiaTre --
            Spettro tre è disgustato dal tuo dono.
            ~ currentReceiver = ()    
            -> dono_storia_tre.esito_inchiostro
    }
    -> main

+ {doniTrovati has BaccaDellaAddolorata} [Una bacca della Addolorata.]
    ~ doniTrovati -= BaccaDellaAddolorata

    {
    - currentReceiver has FirstCharacter:
        <i>{traduttorePersonaggeMaiuscolo(effettivoStatoPersonaggiaUno)} apprezza il dono.</i>
        ~ currentReceiver = ()
        -> dono_storia_uno.esito_inchiostro
    
    - currentReceiver has SecondCharacter:
        Hai regalato a {traduttorePersonaggeMaiuscolo(effettivoStatoPersonaggiaDue)} qualcosa che proprio non gli interessa
        ~ currentReceiver = ()
        -> dono_storia_due.esito_inchiostro
    
    - currentReceiver has ThirdCharacter:
        ~ statoInchiostroPersonaggiaTre ++
       <i>{traduttorePersonaggeMaiuscolo(effettivoStatoPersonaggiaTre)} è confuso dal dono.</i>
       ~ currentReceiver = ()
        -> dono_storia_tre.esito_inchiostro
    }
   -> main    

+ {doniTrovati has LaSpazzata} [Un frammento della Spezzata.]
    ~ doniTrovati -= LaSpazzata
    
    {
    - currentReceiver has FirstCharacter:
        ~ statoInchiostroPersonaggiaUno ++
        <i>{traduttorePersonaggeMaiuscolo(effettivoStatoPersonaggiaUno)} apprezza il dono</i>
        ~ currentReceiver = ()
        -> dono_storia_uno.esito_inchiostro

    - currentReceiver has SecondCharacter:
        Hai regalato a {traduttorePersonaggeMaiuscolo(effettivoStatoPersonaggiaDue)} qualcosa che proprio non gli interessa
        -> dono_storia_due.esito_inchiostro
    
    - currentReceiver has ThirdCharacter:
        ~ statoInchiostroPersonaggiaTre ++
        {traduttorePersonaggeMaiuscolo(effettivoStatoPersonaggiaTre)} apprezza mediamente il tuo dono.
        ~ currentReceiver = ()
        -> dono_storia_tre.esito_inchiostro
    }
   -> main

+ {doniTrovati has coperta} [Una coperta.]
    ~ doniTrovati -= coperta
    
    {
    - currentReceiver has FirstCharacter:
        ~ statoInchiostroPersonaggiaUno ++
        ~ statoInchiostroPersonaggiaUno ++
        <i>{traduttorePersonaggeMaiuscolo(effettivoStatoPersonaggiaUno)} se la avvolge attorno al corpo.
        <i>Sembra sollevato.</i>
        ~ currentReceiver = ()
        -> dono_storia_uno.esito_inchiostro
    
    - currentReceiver has SecondCharacter:
        Hai regalato a {traduttorePersonaggeMaiuscolo(effettivoStatoPersonaggiaDue)} qualcosa che proprio non gli interessa
        -> dono_storia_due.esito_inchiostro
    
    - currentReceiver has ThirdCharacter:
        ~ statoInchiostroPersonaggiaTre ++
        ~ statoInchiostroPersonaggiaTre ++
        <i>{traduttorePersonaggeMaiuscolo(effettivoStatoPersonaggiaTre)} se la avvolge attorno al corpo.
        <i>Sembra sollevato.</i>
        ~ currentReceiver = ()
        -> dono_storia_tre.esito_inchiostro
    }
   -> main
    
+ {doniTrovati has vasovuoto} [Un vaso vuoto.]
    ~ doniTrovati -= vasovuoto
    
    {
    - currentReceiver has FirstCharacter:
        ~ statoInchiostroPersonaggiaUno --
        <i>{traduttorePersonaggeMaiuscolo(effettivoStatoPersonaggiaUno)} ti guarda con orrore, e lascia che il vaso cada a terra, frantumandosi.</i>
        ~ currentReceiver = ()
        -> dono_storia_uno.esito_inchiostro
    
    - currentReceiver has SecondCharacter:
        Hai regalato a {traduttorePersonaggeMaiuscolo(effettivoStatoPersonaggiaDue)} qualcosa che proprio non gli interessa
        ~ currentReceiver = ()
        -> dono_storia_due.esito_inchiostro
    
    - currentReceiver has ThirdCharacter:
        ~ statoInchiostroPersonaggiaTre --
        <i>{traduttorePersonaggeMaiuscolo(effettivoStatoPersonaggiaTre)} ti guarda con orrore, e lascia che il vaso cada a terra, frantumandosi.</i>
        ~ currentReceiver = ()
        -> dono_storia_tre.esito_inchiostro
    }
    -> main
    
+ {doniTrovati has BrinaDellImpossibile} [Un frammento di Brina dell'Impossibile.]
    ~ doniTrovati -= BrinaDellImpossibile

    {
    - currentReceiver has FirstCharacter:
        ~ statoInchiostroPersonaggiaUno ++
        ~ statoInchiostroPersonaggiaUno ++
        ~ statoInchiostroPersonaggiaUno ++
        <i>{traduttorePersonaggeMaiuscolo(effettivoStatoPersonaggiaUno)} si porta la Brina al petto, e ti guarda commosso.</i>
        <i>Le linee della tua mano ricompaiono, i pezzi si rinsaldano.</i>
         ~ eventoSpecialePersonaggiaUno = true
         ~ currentReceiver = ()
        -> dono_storia_uno.esito_inchiostro

    - currentReceiver has SecondCharacter:
        Hai regalato a {traduttorePersonaggeMaiuscolo(effettivoStatoPersonaggiaDue)} qualcosa che proprio non gli interessa
        <i>Le linee della tua mano ricompaiono, i pezzi si rinsaldano</i>
        ~ currentReceiver = ()
        -> dono_storia_due.esito_inchiostro
        
    - currentReceiver has ThirdCharacter:
        ~ statoInchiostroPersonaggiaTre ++
        ~ statoInchiostroPersonaggiaTre ++
        ~ statoInchiostroPersonaggiaTre ++
        <i>{traduttorePersonaggeMaiuscolo(effettivoStatoPersonaggiaTre)} si porta la Brina al petto, e ti guarda commosso.</i>
        <i>Le linee della tua mano ricompaiono, i pezzi si rinsaldano.</i>
         ~ eventoSpecialePersonaggiaTre = true
         ~ currentReceiver = ()
        -> dono_storia_tre.esito_inchiostro
    }
   -> main    
    
    //Se la lista è vuota
    + {doniTrovati == ()} [Non ho nulla da donare.]
    + [Ho bisogno di ragionarci ancora un poco.]
        -> main 
    + ->
    - 
-> main
